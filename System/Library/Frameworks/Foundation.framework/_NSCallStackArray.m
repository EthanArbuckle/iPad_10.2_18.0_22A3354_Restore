@implementation _NSCallStackArray

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  NSString *v5;
  const __CFString *v6;
  unint64_t cnt;
  unint64_t v8;
  char **pcstrs;
  unint64_t v10;
  const char *v11;

  v5 = +[NSString string](NSMutableString, "string", a3, a4);
  if (self->_wantSyms)
  {
    v6 = CFSTR("(\n");
    if (!self->_pcstrs)
    {
      self->_pcstrs = backtrace_symbols(&self->_frames[self->_ignore], self->_cnt);
      if (!self->_wantSyms)
        v6 = CFSTR("(");
    }
  }
  else
  {
    v6 = CFSTR("(");
  }
  -[NSString appendString:](v5, "appendString:", v6);
  cnt = self->_cnt;
  if (cnt)
  {
    v8 = 0;
    do
    {
      if (self->_wantSyms && (pcstrs = self->_pcstrs) != 0)
      {
        -[NSString appendFormat:](v5, "appendFormat:", CFSTR("\t%s\n"), pcstrs[v8++]);
      }
      else
      {
        v10 = self->_ignore + v8++;
        if (v8 >= cnt)
          v11 = "";
        else
          v11 = " ";
        -[NSString appendFormat:](v5, "appendFormat:", CFSTR("%p%s"), self->_frames[v10], v11);
      }
      cnt = self->_cnt;
    }
    while (v8 < cnt);
  }
  -[NSString appendString:](v5, "appendString:", CFSTR(")"));
  return v5;
}

- (void)dealloc
{
  char **pcstrs;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  free(self->_frames);
  pcstrs = self->_pcstrs;
  if (pcstrs)
    free(pcstrs);
  v4.receiver = self;
  v4.super_class = (Class)_NSCallStackArray;
  -[_NSCallStackArray dealloc](&v4, sel_dealloc);
}

+ (id)arrayWithFrames:(void *)a3 count:(unint64_t)a4 symbols:(BOOL)a5
{
  uint64_t v8;
  unint64_t v9;

  v8 = objc_opt_new();
  *(_QWORD *)(v8 + 24) = 2;
  *(_QWORD *)(v8 + 8) = a3;
  v9 = a4 - 2;
  if (a4 < 2)
    v9 = 0;
  *(_QWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 32) = 0;
  *(_BYTE *)(v8 + 40) = a5;
  return (id)v8;
}

- (unint64_t)count
{
  return self->_cnt;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t cnt;
  char **pcstrs;
  BOOL v8;
  void *v10;

  cnt = self->_cnt;
  if (cnt <= a3)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: index (%ld) beyond bounds (%ld)"), _NSMethodExceptionProem((objc_class *)self, a2), a3, self->_cnt), 0);
    objc_exception_throw(v10);
  }
  if (self->_wantSyms
    && ((pcstrs = self->_pcstrs) != 0
     || ((pcstrs = backtrace_symbols(&self->_frames[self->_ignore], cnt), self->_pcstrs = pcstrs, self->_wantSyms)
       ? (v8 = pcstrs == 0)
       : (v8 = 1),
         !v8)))
  {
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", pcstrs[a3]);
  }
  else
  {
    return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *((_QWORD *)&self->_frames[self->_ignore] + a3));
  }
}

- (unint64_t)_descriptionWithBuffer:(char *)a3 size:(int64_t)a4
{
  const char *v7;
  unint64_t cnt;
  unint64_t v9;
  char **pcstrs;
  unint64_t v11;
  const char *v12;
  char __str[256];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a4 <= 0)
    __break(1u);
  *a3 = 0;
  if (self->_wantSyms
    && (self->_pcstrs || (self->_pcstrs = backtrace_symbols(&self->_frames[self->_ignore], self->_cnt), self->_wantSyms)))
  {
    v7 = "(\n";
  }
  else
  {
    v7 = "(";
  }
  strlcat(a3, v7, a4);
  cnt = self->_cnt;
  if (cnt)
  {
    v9 = 0;
    do
    {
      if (self->_wantSyms && (pcstrs = self->_pcstrs) != 0)
      {
        snprintf(__str, 0x100uLL, "\t%s\n", pcstrs[v9]);
        strlcat(a3, __str, a4);
        ++v9;
      }
      else
      {
        v11 = self->_ignore + v9++;
        if (v9 >= cnt)
          v12 = "";
        else
          v12 = " ";
        snprintf(__str, 0x100uLL, "%p%s", self->_frames[v11], v12);
        strlcat(a3, __str, a4);
      }
      cnt = self->_cnt;
    }
    while (v9 < cnt);
  }
  strlcat(a3, ")", a4);
  return strlen(a3);
}

@end
