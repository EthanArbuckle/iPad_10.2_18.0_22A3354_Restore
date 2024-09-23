@implementation FPCTLTermDumper

- (FPCTLTermDumper)initWithFd:(int)a3 forceColor:(BOOL)a4
{
  _BOOL4 v4;
  FPCTLTermDumper *v6;
  FPCTLTermDumper *v7;
  _BOOL4 v8;
  char *v9;
  char *v10;
  _BOOL4 v11;
  BOOL v12;
  objc_super v14;

  v4 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPCTLTermDumper;
  v6 = -[FPCTLTermDumper init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_fd = a3;
    v8 = isatty(a3) != 0;
    v7->_isatty = v8;
    v9 = getenv("TERM");
    v10 = v9;
    if (v9)
      v11 = v8;
    else
      v11 = 0;
    v7->_supportsEscapeSequences = v11;
    if (!v4 && v11)
    {
      if (strcasestr(v9, "ansi"))
        v4 = 1;
      else
        v4 = strstr(v10, "color") != 0;
    }
    v12 = 0;
    v7->_useColor = v4;
    if (v10 && v4)
      v12 = strstr(v10, "256color") != 0;
    v7->_eightBitColor = v12;
    *(_QWORD *)&v7->_curFg = 0x900000009;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3608];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithFileDescriptor:", self->_fd);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("FileHandleKey"));

}

- (FPCTLTermDumper)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  FPCTLTermDumper *v6;
  FPCTLTermDumper *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FileHandleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[FPCTLTermDumper initWithFd:forceColor:](self, "initWithFd:forceColor:", objc_msgSend(v5, "fileDescriptor"), 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_decodedFileHandle, v5);

  return v7;
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

void __29__FPCTLTermDumper_startPager__block_invoke(uint64_t a1)
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

- (unint64_t)_startInCString:(char)a3[256] fgColor:(int)a4 bgColor:(int)a5 attr:(int)a6
{
  unsigned int curAttrs;
  int curBg;
  int curFg;
  int v11;
  unint64_t v12;
  uint64_t i;

  curAttrs = a6;
  curBg = a5;
  curFg = a4;
  if (a5 == -1)
    curBg = self->_curBg;
  if (a4 == -1)
    curFg = self->_curFg;
  if (a6 == -1)
    curAttrs = self->_curAttrs;
  strcpy(a3, "\x1B[");
  if (curAttrs == self->_curAttrs)
  {
    v11 = self->_curFg;
    v12 = 2;
  }
  else
  {
    strcpy(a3 + 2, "0;");
    v12 = 4;
    for (i = 1; i != 32; ++i)
    {
      if (((curAttrs >> i) & 1) != 0)
        v12 += snprintf(&a3[v12], 256 - v12, "%zd;", i);
    }
    self->_curAttrs = curAttrs;
    *(_QWORD *)&self->_curFg = 0x900000009;
    v11 = 9;
  }
  if (curFg != v11)
  {
    v12 += snprintf(&a3[v12], 256 - v12, "%d;", curFg + 30);
    self->_curFg = curFg;
  }
  if (curBg != self->_curBg)
  {
    v12 += snprintf(&a3[v12], 256 - v12, "%d;", curBg + 40);
    self->_curBg = curBg;
  }
  if (v12 < 3)
    return 0;
  a3[v12 - 1] = 109;
  return v12;
}

- (id)startStringForFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  unint64_t v5;
  _OWORD v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  v5 = -[FPCTLTermDumper _startInCString:fgColor:bgColor:attr:](self, "_startInCString:fgColor:bgColor:attr:", v7, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v7, v5, 4);
}

- (id)stringForReset
{
  return -[FPCTLTermDumper startStringForFgColor:bgColor:attr:](self, "startStringForFgColor:bgColor:attr:", 9, 9, 0);
}

- (void)startFgColor:(int)a3 bgColor:(int)a4 attr:(int)a5
{
  size_t v6;
  _OWORD v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_useColor)
  {
    memset(v7, 0, sizeof(v7));
    v6 = -[FPCTLTermDumper _startInCString:fgColor:bgColor:attr:](self, "_startInCString:fgColor:bgColor:attr:", v7, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
    if (v6)
      write(self->_fd, v7, v6);
  }
}

- (void)reset
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, 9, 0);
}

- (void)eraseEndOfLine
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\x1BK", 2uLL);
}

- (void)eraseStartOfLine
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\x1B[1K", 4uLL);
}

- (void)eraseLine
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\x1B[2K", 4uLL);
}

- (void)eraseScreenDown
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\x1B[J", 3uLL);
}

- (void)eraseScreenUp
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\x1B[1J", 4uLL);
}

- (void)cursorSave
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\x1B[s", 3uLL);
}

- (void)cursorRestore
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\x1B[u", 3uLL);
}

- (void)cursorUp:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    dprintf(self->_fd, "\x1B[%d%c", a3, 65);
}

- (void)cursorDown:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    dprintf(self->_fd, "\x1B[%d%c", a3, 66);
}

- (void)cursorRight:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    dprintf(self->_fd, "\x1B[%d%c", a3, 67);
}

- (void)cursorLeft:(unsigned int)a3
{
  if (self->_supportsEscapeSequences)
    dprintf(self->_fd, "\x1B[%d%c", a3, 68);
}

- (void)cursorGotoLineStart
{
  if (self->_supportsEscapeSequences)
    write(self->_fd, "\r", 1uLL);
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
  -[FPCTLTermDumper cursorGotoLineStart](self, "cursorGotoLineStart");
  self->_usedTermWidth = 0;
}

- (void)endLine
{
  self->_usedTermWidth = 0;
  -[FPCTLTermDumper forgetRemainingSpace](self, "forgetRemainingSpace");
  -[FPCTLTermDumper puts:len:](self, "puts:len:", "\n", 1);
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

- (void)startFgColor:(int)a3 attr:(int)a4
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", *(_QWORD *)&a3, 9, *(_QWORD *)&a4);
}

- (void)startBgColor:(int)a3 attr:(int)a4
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)startFgColor:(int)a3
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", *(_QWORD *)&a3, 9, 0);
}

- (void)startBgColor:(int)a3
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, *(_QWORD *)&a3, 0);
}

- (void)startAttributes:(int)a3
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 9, 9, *(_QWORD *)&a3);
}

- (void)changeFgColor:(int)a3
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", *(_QWORD *)&a3, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
}

- (void)changeBgColor:(int)a3
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, *(_QWORD *)&a3, 0xFFFFFFFFLL);
}

- (void)changeAttributes:(int)a3
{
  -[FPCTLTermDumper startFgColor:bgColor:attr:](self, "startFgColor:bgColor:attr:", 0xFFFFFFFFLL, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
}

- (void)dumpImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  id v8;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[FPCTLTermDumper write:](self, "write:", CFSTR("\x1B]1337;File=inline=1;width=%lupx;height=%lupx:%s\a\n"),
    a4,
    a5,
    objc_msgSend(v8, "UTF8String"));

}

- (void)dumpImage:(id)a3 characterWidth:(unint64_t)a4 characterHeight:(unint64_t)a5
{
  id v8;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[FPCTLTermDumper write:](self, "write:", CFSTR("\x1B]1337;File=inline=1;width=%lu;height=%lu:%s\a"),
    a4,
    a5,
    objc_msgSend(v8, "UTF8String"));

}

- (void)dumpProgress:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  uint64_t v14;

  v4 = a3;
  if (-[FPCTLTermDumper supportsEscapeSequences](self, "supportsEscapeSequences"))
  {
    -[FPCTLTermDumper cursorGotoLineStart](self, "cursorGotoLineStart");
    v14 = 0;
    ioctl(1, 0x40087468uLL, &v14);
    v5 = WORD1(v14);
    self->_termWidth = WORD1(v14);
    self->_usedTermWidth = 0;
    v6 = v5 >> 1;
    if (v6 >= 0x1E)
      v7 = 30;
    else
      v7 = v6;
    objc_msgSend(v4, "fractionCompleted");
    v9 = (unint64_t)(v8 * (double)v7);
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = v9;
      do
      {
        objc_msgSend(v10, "appendString:", CFSTR("█"));
        --v11;
      }
      while (v11);
    }
    if (v7 != v9)
    {
      v12 = v7 - v9;
      do
      {
        objc_msgSend(v10, "appendString:", CFSTR(" "));
        --v12;
      }
      while (v12);
    }
    objc_msgSend(v4, "fractionCompleted");
    objc_msgSend(v10, "appendFormat:", CFSTR("| %lu%%"), (unint64_t)(v13 * 100.0));
    -[FPCTLTermDumper write:](self, "write:", CFSTR("%@"), v10);

  }
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
  write(self->_fd, a3, v6);
}

- (void)puts:(const char *)a3 len:(unint64_t)a4
{
  if (self->_termWidth)
    -[FPCTLTermDumper _putsAndCrop:len:](self, "_putsAndCrop:len:", a3, a4);
  else
    write(self->_fd, a3, a4);
}

- (void)puts:(const char *)a3
{
  -[FPCTLTermDumper puts:len:](self, "puts:len:", a3, strlen(a3));
}

- (void)put:(id)a3
{
  -[FPCTLTermDumper puts:](self, "puts:", objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

- (void)write:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v8);

  if (self->_termWidth)
  {
    v7 = objc_retainAutorelease(v6);
    -[FPCTLTermDumper _putsAndCrop:len:](self, "_putsAndCrop:len:", objc_msgSend(v7, "UTF8String"), objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4));
  }
  else
  {
    -[FPCTLTermDumper put:](self, "put:", v6);
  }

}

- (id)annotateString:(id)a3 markedIdentifiers:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = v6;
  if (self->_useColor)
  {
    v8 = a4;
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__FPCTLTermDumper_annotateString_markedIdentifiers___block_invoke;
    v14[3] = &unk_1E444FE38;
    v14[4] = self;
    v10 = v9;
    v15 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

    v11 = v15;
    v12 = v10;

  }
  else
  {
    v12 = v6;
  }

  return v12;
}

void __52__FPCTLTermDumper_annotateString_markedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 44);
  v6 = objc_msgSend(a3, "unsignedIntegerValue") % 7uLL;
  if (v5)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\x1B[38:5:%dm%@\x1B[39m"), dword_1A0B53EA8[v6], v8);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\x1B[%dm%@\x1B[39m"), (dword_1A0B53EC4[v6] + 30), v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replaceOccurrencesOfString:withString:options:range:", v8, v7, 2, 0, objc_msgSend(*(id *)(a1 + 40), "length"));

}

- (int)fd
{
  return self->_fd;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decodedFileHandle, 0);
}

@end
