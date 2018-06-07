%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2009-2018
%% SJTUG and any individual authors listed elsewhere in this file.
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work has the LPPL maintenance status `maintained'.
%% The Current Maintainers of this work are Jianwen Wei and Alexara Wu.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sjtuthesis}
    [2018/01/11 v1.0.0rc Shanghai Jiao Tong University Thesis Template]
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sjtu,
  prefix=sjtu@,
  setkeys=\kvsetkeys}
\newif\ifsjtu@bachelor
\newif\ifsjtu@master
\newif\ifsjtu@doctor
\define@key{sjtu}{degree}{%
  \sjtu@bachelorfalse
  \sjtu@masterfalse
  \sjtu@doctorfalse
  \expandafter\csname sjtu@#1true\endcsname}
\def\sjtu@deprecated@degree@option{%
  \ClassError{sjtuthesis}
             {Option '\CurrentOption' is deprecated, \MessageBreak
              please use 'degree=\CurrentOption' instead}{}}
\DeclareVoidOption{bachelor}{\sjtu@deprecated@degree@option}
\DeclareVoidOption{master}{\sjtu@deprecated@degree@option}
\DeclareVoidOption{doctor}{\sjtu@deprecated@degree@option}
\DeclareBoolOption{english}
\DeclareBoolOption{review}
\DeclareBoolOption{submit}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*\relax
\ifsjtu@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\else
  \PassOptionsToClass{scheme=chinese}{ctexbook}
\fi
\ifsjtu@bachelor
  \PassOptionsToClass{zihao=5}{ctexbook}
\else
  \PassOptionsToClass{zihao=-4}{ctexbook}
  \ifsjtu@master\relax\else
    \ifsjtu@doctor\relax\else
      \ClassError{sjtuthesis}%
                 {Please specify thesis degree in option: \MessageBreak
                  degree=[bachelor | master | doctor]}{}
    \fi
  \fi
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8,linespread=1.3]{ctexbook}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{ifxetex}
\RequirePackage{mathtools,amsthm}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage[inline]{enumitem}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{xcolor}
\RequirePackage[backend=biber,style=gb7714-2015,seconds=true]{biblatex}
\RequirePackage{hyperref}
\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=false}
\fi
\hypersetup{%
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder=0 0 0}
\RequirePackage{geometry}
\geometry{%
  paper      = a4paper,
  top        = 3.5cm,
  bottom     = 4.0cm,
  left       = 3.3cm,
  right      = 2.8cm,
  headheight = 0.5cm}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\patchcmd\cleardoublepage
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter
  {\thispagestyle{\CTEX@chapter@pagestyle}}
  {}{}{}
\ifsjtu@english
  \def\sjtu@value@titlemark{\sjtu@titleEn}
  \newcommand\sjtu@fancyhead{\footnotesize\kaishu}
  \newcommand\sjtu@fancyfoot[2]%
    {\small --~~Page~~{\bfseries{#1}}~~of~~{\bfseries{#2}}~~--}
\else
  \def\sjtu@value@titlemark{\sjtu@titleZh}
  \newcommand\sjtu@fancyhead{\small\kaishu}
  \newcommand\sjtu@fancyfoot[2]%
    {\small 第~{\bfseries{#1}}~页\,共~{\bfseries{#2}}~页}
\fi
\def\markboxwidth{0.75\textwidth}
\ifsjtu@bachelor
  \fancypagestyle{front}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/sjtubanner}}
    \fancyhead[R]%
      {\parbox[b]{\markboxwidth}%
                 {\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
    \fancyfoot[C]{\sjtu@fancyfoot{\thepage}{\lastpageref{pagesLTS.Roman}}}
    \renewcommand{\headheight}{32pt}
  }
  \fancypagestyle{main}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/sjtubanner}}
    \fancyhead[R]%
      {\parbox[b]{\markboxwidth}%
                 {\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
    \fancyfoot[C]{\sjtu@fancyfoot{\thepage}{\lastpageref{pagesLTS.arabic}}}
    \renewcommand{\headheight}{32pt}
  }
  \fancypagestyle{biglast}{%
    \fancyhf{}
    \fancyhead[L]{\includegraphics{figure/sjtubanner}}
    \fancyhead[R]%
      {\parbox[b]{\markboxwidth}%
                 {\raggedleft\nouppercase{\sjtu@fancyhead\sjtu@value@titlemark}}}
    \fancyfoot[C]%
      {\sjtu@fancyfoot{\theCurrentPageLocal}%
                      {\lastpageref{pagesLTS.roman.local}}}
    \renewcommand{\headheight}{32pt}
  }
\else
  \fancypagestyle{main}{%
    \fancyhf{}
    \fancyhead[L]{\small\kaishu\sjtu@key@schoolZh\sjtu@degreeZh\sjtu@key@thesis}
    \fancyhead[R]{\nouppercase{\sjtu@fancyhead\leftmark}}
    \fancyfoot[C]{\small ---~{\bfseries\thepage}~---}
    \renewcommand{\headheight}{32pt}
  }
\fi
\AtBeginDocument{\pagenumbering{Alph}}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \ifsjtu@bachelor
    \pagestyle{front}
  \else
    \pagestyle{main}
  \fi
  \pagenumbering{Roman}}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{main}
  \pagenumbering{arabic}}
\ctexset{%
  contentsname   = \sjtu@contentsname,
  listfigurename = \sjtu@listfigurename,
  listtablename  = \sjtu@listtablename,
  autoindent     = true,
  chapter={%
    format       = \zihao{3}\bfseries\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {15\p@},
    afterskip    = {12\p@},
  },
  section={%
    format       = \zihao{4}\bfseries,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={%
    format       = \zihao{-4}\bfseries,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsubsection={%
    format       = \normalfont\normalsize,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage%
   \pdfbookmark[0]{\contentsname}{toc}%
   \chapter}
  {}{}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\DeclareCaptionFont{kaishu}{\kaishu}
\captionsetup{%
  format        = plain,
  justification = centering,
  labelformat   = simple,
  labelsep      = space,
  font          = {small, kaishu}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[sub]{font=footnotesize}
\DeclareCaptionOption{bi-first}[]{%
  \def\tablename{\sjtu@tablename}
  \def\figurename{\sjtu@figurename}}
\DeclareCaptionOption{bi-second}[]{%
  \def\tablename{Table}
  \def\figurename{Figure}}
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand\p@subfigure{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}
}
\setlist{nosep}
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\sjtu@key@algo~}[chapter]
  \newtheorem{thm}{\sjtu@key@thm~}[chapter]
  \newtheorem{lem}[thm]{\sjtu@key@lem~}
  \newtheorem{prop}[thm]{\sjtu@key@prop~}
  \newtheorem{cor}[thm]{\sjtu@key@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\sjtu@key@defn~}[chapter]
  \newtheorem{conj}{\sjtu@key@conj~}[chapter]
  \newtheorem{exmp}{\sjtu@key@exmp~}[chapter]
  \newtheorem{rem}{\sjtu@key@rem~}
  \newtheorem{case}{\sjtu@key@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\sjtu@key@thm~}
  \newtheorem{blem}[thm]{\sjtu@key@lem~}
  \newtheorem{bprop}[thm]{\sjtu@key@prop~}
  \newtheorem{bcor}[thm]{\sjtu@key@cor~}
  \renewcommand{\proofname}{\bfseries\sjtu@key@proof}
\def\sjtu@def@term#1{%
  \define@key{sjtu}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname sjtu@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\sjtu@def@term{titleZh}
\sjtu@def@term{titleEn}
\sjtu@def@term{authorZh}
\sjtu@def@term{authorEn}
\sjtu@def@term{id}
\sjtu@def@term{advisorZh}
\sjtu@def@term{coadvisorZh}
\sjtu@def@term{advisorEn}
\sjtu@def@term{coadvisorEn}
\sjtu@def@term{majorZh}
\sjtu@def@term{majorEn}
\sjtu@def@term{instituteZh}
\sjtu@def@term{instituteEn}
\sjtu@def@term{dateZh}
\sjtu@def@term{dateEn}
\def\sjtusetup{\kvsetkeys{sjtu}}
\renewcommand\maketitle{%
  \pdfbookmark[0]{\sjtu@titlepage}{titlepage}
  \ifsjtu@bachelor
    \makechinesetitle@bachelor
  \else
    \makechinesetitle
    \makeenglishtitle
  \fi
}
\newcommand\makechinesetitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  {\songti\zihao{-3}\sjtu@key@statementZh}
  \vskip\stretch{1}
  {\heiti\zihao{3}\sjtu@titleZh}
  \vskip\stretch{1}
  {\fangsong\zihao{4}}
  \def\tabcolsep{1pt}
  \def\arraystretch{1.5}
  \begin{tabular}
    {>{\begin{CJKfilltwosides}{4\ccwd}\heiti}r<{\end{CJKfilltwosides}}l}
    \ifsjtu@review
      \sjtu@key@authorZh      & \underline{\makebox[150pt]{}} \\
      \sjtu@key@id            & \underline{\makebox[150pt]{}} \\
      \sjtu@key@advisorZh     & \underline{\makebox[150pt]{}} \\
    \else
      \sjtu@key@authorZh      & \underline{\makebox[150pt]{\sjtu@authorZh}} \\
      \sjtu@key@id & \underline{\makebox[150pt]{\sjtu@id}} \\
      \sjtu@key@advisorZh     & \underline{\makebox[150pt]{\sjtu@advisorZh}} \\
      \ifdefstring{\sjtu@coadvisorEn}{}{\relax}%
        {\sjtu@key@coadvisorZh & \underline{\makebox[150pt]{\sjtu@coadvisorZh}} \\}
    \fi
      \sjtu@key@major         & \underline{\makebox[150pt]{\sjtu@majorZh}} \\
      \sjtu@key@defenddate    & \underline{\makebox[150pt]{\sjtu@dateZh}}
  \end{tabular}
  \end{center}
  \vskip \stretch{0.5}
  \cleardoublepage
}
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
      {\normalfont\zihao{4} \sjtu@key@statementEn}
      \vspace{20pt} \vskip\stretch{1}
      {\huge\sjtu@titleEn \vskip 1pt}
      \vskip \stretch{1}
    \ifsjtu@review
      \vskip \stretch{1}
      \vskip 3pt
      \vskip \stretch{2}
    \else
      {\normalfont\zihao{4}\sjtu@authorEn}
      \vskip \stretch{1}
      {\normalfont\zihao{4}\sjtu@key@advisorEn}
      \vskip 2pt
      {\normalfont\zihao{4}\sjtu@advisorEn}
      \vskip 5pt
      \ifdefstring{\sjtu@coadvisorEn}{}{\relax}{%
        {\normalfont\zihao{4}\sjtu@key@coadvisorEn}
        \vskip 2pt
        {\normalfont\zihao{4}\sjtu@coadvisorEn}
        \vskip \stretch{2}}
    \fi
    \normalfont\sjtu@instituteEn \vskip 30pt
    \normalfont\sjtu@dateEn \vskip 20pt
  \end{center}
  \cleardoublepage
}
\newcommand\makechinesetitle@bachelor{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{20pt} \vskip 7pt
    \includegraphics{sjtulogo}
    \vskip 30pt
    {\fontsize{32}{32}\kaishu\sjtu@degreeZh\sjtu@key@thesis}
    \vskip 15pt
    {\zihao{-2}\MakeUppercase{Thesis of \sjtu@degreeEn}}
    \vskip 15pt
    \includegraphics{sjtubadge}
    \vskip \stretch{2}
    {\kaishu\zihao{-2}
    \begin{tabular}{r@{：}l}
      \sjtu@key@title &
      {\underline{\begin{minipage}{360pt}\centering\sjtu@titleZh\end{minipage}}}
    \end{tabular}}
    \vskip \stretch{1}
    {\kaishu\zihao{3}
    \def\arraystretch{1.1}
    \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}@{：}l}
      \ifsjtu@review
        \sjtu@key@authorZh  & \underline{\makebox[180pt]{}} \\
        \sjtu@key@id        & \underline{\makebox[180pt]{}} \\
      \else
        \sjtu@key@authorZh  & \underline{\makebox[180pt]{\sjtu@authorZh}} \\
        \sjtu@key@id        & \underline{\makebox[180pt]{\sjtu@id}} \\
      \fi
        \sjtu@key@major     & \underline{\makebox[180pt]{\sjtu@majorZh}} \\
      \ifsjtu@review
        \sjtu@key@advisorZh & \underline{\makebox[180pt]{}} \\
      \else
        \sjtu@key@advisorZh & \underline{\makebox[180pt]{\sjtu@advisorZh}} \\
      \fi
        \sjtu@key@institute & \underline{\makebox[180pt]{\sjtu@instituteZh}}
    \end{tabular}}
  \end{center}
  \cleardoublepage
}
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\bfseries\zihao{3} \sjtu@key@schoolZh}\\
    {\bfseries\zihao{3} \sjtu@key@original}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@key@originalcontent\par}
  \vskip 60pt
  \hspace{13em}\sjtu@key@authorZhsign\hrulefill\hspace{1.5em}
  \vskip 15pt
  \hspace{16em}\sjtu@key@originalDate\hspace{1em}
  \cleardoublepage
}
\newcommand\makeDeclareAuthorization{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\bfseries\zihao{3} \sjtu@key@schoolZh}\\
    {\bfseries\zihao{3} \sjtu@key@authorZhization}
  \end{center}
  \vskip 10pt
  {\par\zihao{-4}\sjtu@key@authorZhizationcontent\par}
  \vskip 60pt
  \sjtu@key@authorZhsign\hrulefill\hspace{3em}\sjtu@key@Supervisorsign\hrulefill
  \vskip 15pt
  \sjtu@key@originalDate\hfill\hspace{3em}\sjtu@key@originalDate
  \cleardoublepage
}
\newenvironment{abstract}{%
  \cleardoublepage
  \pdfbookmark[0]{\sjtu@key@abstract}{abstract}
  \chapter*{%
    \sjtu@titleZh
    \vskip 20pt
    \sjtu@key@chineseabstract
  }
  \markboth{\sjtu@key@chineseabstract}{}
}{}
\newcommand\keywords[1]{%
  \vspace{2ex}
  \noindent{\bfseries\large \sjtu@key@keywords}{#1}
}
\newenvironment{englishabstract}{%
  \cleardoublepage
  \chapter*{%
    \MakeUppercase\sjtu@titleEn
    \vskip 20pt
    \MakeUppercase\sjtu@key@englishabstract
  }
  \markboth{\sjtu@key@englishabstract}{}
}{}
\newcommand\englishkeywords[1]{%
  \vspace{2ex}
  \noindent{\bfseries\large \sjtu@key@englishkeywords}{#1}
}
\newenvironment{nomenclaturename}{\cleardoublepage
\chapter{\sjtu@nomenclature}{}}{}

\newenvironment{publications}[1]
     {\chapter{\sjtu@key@publications}%
      \@mkboth{\MakeUppercase\sjtu@key@publications}
              {\MakeUppercase\sjtu@key@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}

\newenvironment{patents}[1]
     {\chapter{\sjtu@key@patents}%
      \@mkboth{\MakeUppercase\sjtu@key@patents}
              {\MakeUppercase\sjtu@key@patents}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `patents' environment}}%
      \endlist}

\newenvironment{projects}[1]
     {\chapter{\sjtu@key@projects}%
      \@mkboth{\MakeUppercase\sjtu@key@projects}
              {\MakeUppercase\sjtu@key@projects}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `projects' environment}}%
      \endlist}

\newenvironment{resume}
  {\chapter{\sjtu@key@resume}}
  {}

\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}

\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}

\renewenvironment{thanks}{%
  \chapter*{%
    \sjtu@key@thanks
    \markboth{\sjtu@key@thanks}{}
  }
  \addcontentsline{toc}{chapter}{\sjtu@key@thanks}
}{}

\newenvironment{summary}{%
  \chapter*{%
    \sjtu@key@summary
    \markboth{\sjtu@key@summary}{}
  }
  \addcontentsline{toc}{chapter}{\sjtu@key@summary}
}{}

\newenvironment{bigabstract}{%
  \cleardoublepage
  \pagenumbering{roman}
  \pagestyle{biglast}
  \chapter*{%
    \bfseries
    \MakeUppercase\sjtu@titleEn
    \vskip 20pt
  }
}{\cleardoublepage}

\AtEndOfClass{\input{sjtuthesis.cfg}}


\endinput
%%
%% End of file `sjtuthesis.cls'.
