@implementation BRCTermDumper

- (BRCTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4
{
  return -[BRCTermDumper initWithFd:forceColor:darkMode:](self, "initWithFd:forceColor:darkMode:", *(_QWORD *)&a3, a4, 0);
}

- (BRCTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4 darkMode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  FILE *v9;

  v5 = a5;
  v6 = a4;
  v9 = fdopen(a3, "w");
  if (!v9)
    -[BRCTermDumper initWithFd:forceColor:darkMode:].cold.1();
  return -[BRCTermDumper initWithFile:forceColor:darkMode:closeOnDeinit:](self, "initWithFile:forceColor:darkMode:closeOnDeinit:", v9, v6, v5, a3 > 2);
}

- (BRCTermDumper)initWithFile:(__sFILE *)a3 forceColor:(BOOL)a4
{
  return -[BRCTermDumper initWithFile:forceColor:darkMode:closeOnDeinit:](self, "initWithFile:forceColor:darkMode:closeOnDeinit:", a3, a4, 0, 0);
}

- (BRCTermDumper)initWithFile:(__sFILE *)a3 forceColor:(BOOL)a4 darkMode:(BOOL)a5 closeOnDeinit:(BOOL)a6
{
  BRCTermDumper *v10;
  BRCTermDumper *v11;
  int v12;
  _BOOL4 v13;
  char *v14;
  _BOOL4 v15;
  char *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)BRCTermDumper;
  v10 = -[BRCTermDumper init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_file = a3;
    v10->_fileNeedsClosing = a6;
    setvbuf(a3, 0, 2, 0x400uLL);
    v12 = fileno(a3);
    v13 = isatty(v12) != 0;
    v11->_isatty = v13;
    v14 = getenv("TERM");
    if (v14)
      v15 = v13;
    else
      v15 = 0;
    v11->_supportsEscapeSequences = v15;
    if (!a4 && v15)
    {
      v16 = v14;
      if (strcasestr(v14, "ansi"))
        a4 = 1;
      else
        a4 = strstr(v16, "color") != 0;
    }
    v11->_useColor = a4;
    v11->_curBg = 9;
    v11->_curFg = 9;
    v11->_darkMode = a5;
  }
  return v11;
}

- (void)dealloc
{
  FILE *file;
  objc_super v4;

  if (self->_fileNeedsClosing)
  {
    file = self->_file;
    if (file)
    {
      fclose(file);
      self->_file = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)BRCTermDumper;
  -[BRCTermDumper dealloc](&v4, sel_dealloc);
}

- (int)_transformToDarkMode:(int)a3
{
  int v3;

  if (a3)
    v3 = a3;
  else
    v3 = 7;
  if (self->_darkMode)
    return v3;
  else
    return a3;
}

+ (void)setupPagerForFd:(int)a3
{
  uint64_t v3;

  v3 = 0;
  ioctl(a3, 0x40087468uLL, &v3);
  if (!getenv("LESS"))
    putenv("LESS=FRSX");
  if (!getenv("LESSCHARSET"))
    putenv("LESSCHARSET=utf-8");
}

+ (void)execPagerOnFileFd:(int)a3
{
  objc_msgSend(a1, "setupPagerForFd:");
  dup2(a3, 0);
  lseek(a3, 0, 0);
  if (execlp("less", "less", "-", 0) < 0)
  {
    perror("execvp");
    exit(1);
  }
  __break(1u);
}

- (void)startPager
{
  perror("execvp");
  exit(1);
}

void __27__BRCTermDumper_startPager__block_invoke(uint64_t a1)
{
  int v2;

  v2 = 0;
  fflush((FILE *)*MEMORY[0x1E0C80C20]);
  fflush((FILE *)*MEMORY[0x1E0C80C10]);
  close(1);
  close(2);
  if (waitpid(*(_DWORD *)(a1 + 32), &v2, 0) < 0)
    perror("waitpid");
}

- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)curAttrs
{
  uint64_t v7;
  int curFg;
  int curBg;
  unint64_t v12;
  unint64_t i;
  char *v14;
  char *v15;
  char *v16;

  v7 = *(_QWORD *)&a5;
  curFg = -[BRCTermDumper _transformToDarkMode:](self, "_transformToDarkMode:", *(_QWORD *)&a4);
  curBg = -[BRCTermDumper _transformToDarkMode:](self, "_transformToDarkMode:", v7);
  if (curBg == -1)
    curBg = self->_curBg;
  if (curFg == -1)
    curFg = self->_curFg;
  if (curAttrs == -1)
    curAttrs = self->_curAttrs;
  *(_WORD *)a3 = 23323;
  if (curAttrs == self->_curAttrs)
  {
    v12 = 2;
  }
  else
  {
    *((_WORD *)a3 + 1) = 15152;
    v12 = 4;
    for (i = 1; i != 32; ++i)
    {
      if (((curAttrs >> i) & 1) != 0)
      {
        if (i >= 0xA)
          -[BRCTermDumper _startInCString:fgColor:bgColor:attr:].cold.1();
        v14 = &a3[v12];
        *v14 = i + 48;
        v12 += 2;
        v14[1] = 59;
      }
    }
    self->_curAttrs = curAttrs;
    self->_curFg = 9;
    self->_curBg = 9;
  }
  if (curFg != self->_curFg)
  {
    v15 = &a3[v12];
    *v15 = 51;
    v15[1] = curFg + 48;
    v12 += 3;
    v15[2] = 59;
    self->_curFg = curFg;
  }
  if (curBg != self->_curBg)
  {
    v16 = &a3[v12];
    *v16 = 52;
    v16[1] = curBg + 48;
    v12 += 3;
    v16[2] = 59;
    self->_curBg = curBg;
  }
  a3[v12] = 0;
  if (v12 < 3)
    return 0;
  a3[v12 - 1] = 109;
  return v12;
}

- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  unint64_t v5;
  _BYTE v7[256];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = -[BRCTermDumper _startInCString:fgColor:bgColor:attr:](self, "_startInCString:fgColor:bgColor:attr:", v7, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v7, v5, 4);
}

- (id)stringForReset
{
  return -[BRCTermDumper startStringForFgColor:bgColor:attr:](self, "startStringForFgColor:bgColor:attr:", 9, 9, 0);
}

- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  size_t v6;
  _BYTE __ptr[256];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_useColor)
  {
    v6 = -[BRCTermDumper _startInCString:fgColor:bgColor:attr:](self, "_startInCString:fgColor:bgColor:attr:", __ptr, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    if (v6)
      fwrite(__ptr, 1uLL, v6, self->_file);
  }
}

- (void)reset
{
  -[BRCTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, 9, 0);
}

- (void)eraseEndOfLine
{
  if (self->_supportsEscapeSequences)
    fputs("\x1BK", self->_file);
}

- (void)eraseStartOfLine
{
  if (self->_supportsEscapeSequences)
    fputs("\x1B[1K", self->_file);
}

- (void)eraseLine
{
  if (self->_supportsEscapeSequences)
    fputs("\x1B[2K", self->_file);
}

- (void)eraseScreenDown
{
  if (self->_supportsEscapeSequences)
    fputs("\x1B[J", self->_file);
}

- (void)eraseScreenUp
{
  if (self->_supportsEscapeSequences)
    fputs("\x1B[1J", self->_file);
}

- (void)cursorSave
{
  if (self->_supportsEscapeSequences)
    fputs("\x1B[s", self->_file);
}

- (void)cursorRestore
{
  if (self->_supportsEscapeSequences)
    fputs("\x1B[u", self->_file);
}

- (void)cursorUp:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    fprintf(self->_file, "\x1B[%d%c", a3, 65);
}

- (void)cursorDown:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    fprintf(self->_file, "\x1B[%d%c", a3, 66);
}

- (void)cursorRight:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    fprintf(self->_file, "\x1B[%d%c", a3, 67);
}

- (void)cursorLeft:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    fprintf(self->_file, "\x1B[%d%c", a3, 68);
}

- (void)cursorGotoLineStart
{
  if (self->_supportsEscapeSequences)
    fputs("\r", self->_file);
}

- (void)startNewLine
{
  uint64_t v3;

  if (!self->_termWidth)
  {
    v3 = 0;
    ioctl(1, 0x40087468uLL, &v3);
    self->_termWidth = WORD1(v3);
  }
  -[BRCTermDumper cursorGotoLineStart](self, "cursorGotoLineStart");
  self->_usedTermWidth = 0;
}

- (void)endLine
{
  self->_usedTermWidth = 0;
  -[BRCTermDumper forgetRemainingSpace](self, "forgetRemainingSpace");
  -[BRCTermDumper puts:len:](self, "puts:len:", "\n", 1);
}

- (unint64_t)remainingSpace
{
  uint64_t v3;
  uint64_t v5;

  v5 = 0;
  ioctl(1, 0x40087468uLL, &v5);
  v3 = WORD1(v5);
  self->_termWidth = WORD1(v5);
  return v3 - self->_usedTermWidth;
}

- (void)forgetRemainingSpace
{
  self->_termWidth = 0;
}

- (void)_putsAndCrop:(const char *)a3 len:(unint64_t)a4
{
  unint64_t usedTermWidth;
  size_t v6;

  usedTermWidth = self->_usedTermWidth;
  if (self->_termWidth - usedTermWidth >= a4)
    v6 = a4;
  else
    v6 = self->_termWidth - usedTermWidth;
  self->_usedTermWidth = v6 + usedTermWidth;
  fwrite(a3, 1uLL, v6, self->_file);
}

- (void)puts:(const char *)a3 len:(unint64_t)a4
{
  if (self->_termWidth)
    -[BRCTermDumper _putsAndCrop:len:](self, "_putsAndCrop:len:", a3, a4);
  else
    fwrite(a3, 1uLL, a4, self->_file);
}

- (void)puts:(const char *)a3
{
  -[BRCTermDumper puts:len:](self, "puts:len:", a3, strlen(a3));
}

- (void)put:(id)a3
{
  -[BRCTermDumper puts:](self, "puts:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (void)write:(const char *)a3
{
  unsigned int v4;
  uint64_t v5;
  char __str[2048];
  uint64_t v7;
  char v8;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_termWidth)
  {
    v4 = vsnprintf(__str, 0x800uLL, a3, &v8);
    if (v4 >= 0x800)
      v5 = 2048;
    else
      v5 = v4;
    -[BRCTermDumper _putsAndCrop:len:](self, "_putsAndCrop:len:", __str, v5, &v8);
  }
  else
  {
    *(_QWORD *)__str = &v8;
    vfprintf(self->_file, a3, &v8);
  }
}

- (BOOL)isatty
{
  return self->_isatty;
}

- (BOOL)useColor
{
  return self->_useColor;
}

- (BOOL)supportsEscapeSequences
{
  return self->_supportsEscapeSequences;
}

- (void)initWithFd:forceColor:darkMode:.cold.1()
{
  __assert_rtn("-[BRCTermDumper initWithFd:forceColor:darkMode:]", "BRCTermDumper.m", 46, "file");
}

- (void)_startInCString:fgColor:bgColor:attr:.cold.1()
{
  __assert_rtn("-[BRCTermDumper _startInCString:fgColor:bgColor:attr:]", "BRCTermDumper.m", 191, "i < 10");
}

@end
