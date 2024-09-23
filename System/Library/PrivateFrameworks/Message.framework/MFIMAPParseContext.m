@implementation MFIMAPParseContext

+ (BOOL)hadWarningOrError
{
  return sHadWarningOrError;
}

+ (void)resetWarningOrError
{
  sHadWarningOrError = 0;
}

- (MFIMAPParseContext)initWithConnection:(id)a3 response:(id)a4 start:(const char *)a5 end:(const char *)a6
{
  MFIMAPParseContext *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFIMAPParseContext;
  v10 = -[MFIMAPParseContext init](&v12, sel_init);
  if (v10)
  {
    v10->_connection = (MFIMAPConnection *)a3;
    v10->_response = (MFIMAPResponse *)a4;
    v10->_start = a5;
    v10->_originalStart = a5;
    v10->_originalEnd = a6;
    v10->_end = a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFIMAPParseContext;
  -[MFIMAPParseContext dealloc](&v3, sel_dealloc);
}

- (id)connection
{
  return self->_connection;
}

- (id)response
{
  return self->_response;
}

- (const)start
{
  return self->_start;
}

- (void)setStart:(const char *)a3
{
  if (self->_originalStart > a3)
    -[MFIMAPParseContext setStart:].cold.1();
  self->_start = a3;
}

- (void)increment
{
  ++self->_start;
}

- (const)end
{
  return self->_end;
}

- (void)setEnd:(const char *)a3
{
  if (self->_originalEnd < a3)
    -[MFIMAPParseContext setEnd:].cold.1();
  self->_end = a3;
}

- (BOOL)isValid
{
  return !self->_invalid;
}

- (void)emitWarning:(id)a3
{
  NSObject *v5;
  MFIMAPResponse *response;
  id v7;
  int v8;
  MFIMAPResponse *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    response = self->_response;
    v7 = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:", self->_start, self->_end, 0);
    v8 = 138412802;
    v9 = response;
    v10 = 2112;
    v11 = a3;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_INFO, "*** Warning while parsing %@: %@\nRemaining text: <%@>", (uint8_t *)&v8, 0x20u);
  }
  sHadWarningOrError = 1;
}

- (void)emitError:(id)a3
{
  MFError *v5;

  if (!-[MFActivityMonitor error](+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error"))
  {
    v5 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1033, &stru_1E4F1C8F8);
    -[MFActivityMonitor setError:](+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v5);
    -[MFError setMoreInfo:](v5, "setMoreInfo:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error while parsing IMAP response %@: %@\nRemaining text: <%@>"), self->_response, a3, -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:", self->_start, self->_end, 0)));
  }
  self->_invalid = 1;
  self->_end = self->_start;
  sHadWarningOrError = 1;
}

- (void)logReadChars
{
  const char *end;

  end = self->_end;
  if (end > self->_lastLoggedChar)
  {
    -[MFConnection logReadChars:length:](self->_connection, "logReadChars:length:", self->_start, end - self->_start);
    self->_lastLoggedChar = self->_end;
  }
}

- (id)copyAtom
{
  const char *start;
  const char *end;
  uint64_t v5;
  const char *v6;
  id result;

  start = self->_start;
  end = self->_end;
  if (start >= end)
    return 0;
  v5 = 0;
  v6 = self->_start;
  while ((start[v5] & 0x80000000) == 0)
  {
    if (((*(_DWORD *)((char *)mf_isIMAPAtom_atomicMask + (((unint64_t)start[v5] >> 3) & 0x1C)) >> start[v5]) & 1) == 0)
    {
      v6 = &start[v5];
      break;
    }
    ++v6;
    if (end - start == ++v5)
    {
      v6 = self->_end;
      break;
    }
  }
  if (v6 <= start)
    return 0;
  result = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:");
  self->_start = v6;
  return result;
}

- (BOOL)getNumber:(unint64_t *)a3
{
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;

  v5 = -[MFIMAPParseContext lookAhead](self, "lookAhead");
  v6 = v5 - 48;
  if (v5 - 48 <= 9)
  {
    v7 = 0;
    v8 = v5;
    do
    {
      v7 = v8 + 10 * v7 - 48;
      ++self->_start;
      v9 = -[MFIMAPParseContext lookAhead](self, "lookAhead");
      v8 = v9;
    }
    while (v9 - 48 < 0xA);
    *a3 = v7;
  }
  return v6 < 0xA;
}

- (id)copyNumber
{
  id v2;
  unint64_t v4;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  if (!-[MFIMAPParseContext getNumber:](self, "getNumber:", &v4))
    return 0;
  v2 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  return (id)objc_msgSend(v2, "initWithUnsignedLongLong:", v4);
}

- (BOOL)match:(const char *)a3
{
  size_t v5;
  const char *start;
  const char *v7;
  _BOOL4 v9;

  v5 = strlen(a3);
  start = self->_start;
  v7 = (const char *)(self->_end - start);
  v9 = !strncasecmp(start, a3, v5) && (unint64_t)v7 >= v5;
  if (v9)
    self->_start = &start[v5];
  return v9;
}

- (BOOL)match:(const char *)a3 upToSpecial:(const char *)a4
{
  return a4 && &self->_start[strlen(a3)] == a4 && -[MFIMAPParseContext match:](self, "match:", a3);
}

- (id)copyLiteral
{
  id v3;
  MFIMAPResponseConsumer *v4;
  _BOOL4 v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D46068]);
  v4 = objc_alloc_init(MFIMAPResponseConsumer);
  -[MFIMAPResponseConsumer addConsumer:forSection:](v4, "addConsumer:forSection:", v3, 0);
  v5 = -[MFIMAPParseContext literalWithResponseConsumer:section:](self, "literalWithResponseConsumer:section:", v4, 0);
  v6 = 0;
  if (v5)
  {
    -[MFIMAPResponseConsumer done](v4, "done");
    v6 = (id)objc_msgSend(v3, "data");
  }

  return v6;
}

- (BOOL)literalWithResponseConsumer:(id)a3 section:(id)a4
{
  uint64_t v7;
  MFActivityMonitor *v8;
  uint64_t v9;
  unsigned int v10;
  const __CFString *v11;
  unint64_t v12;
  unint64_t v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  id v22;
  void *v23;
  const char *v24;
  unint64_t v26;

  LODWORD(v7) = -[MFIMAPParseContext match:](self, "match:", "{");
  if (!(_DWORD)v7)
    return v7;
  v8 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v26 = 0;
  v9 = -[MFActivityMonitor expectedLength](v8, "expectedLength");
  v10 = -[MFIMAPConnection literalChunkSize](self->_connection, "literalChunkSize");
  if (-[MFIMAPParseContext getNumber:](self, "getNumber:", &v26))
  {
    if (!-[MFIMAPParseContext match:](self, "match:", "}"))
    {
      v11 = CFSTR("Expected right curly brace");
      goto LABEL_8;
    }
    if (!-[MFIMAPParseContext match:](self, "match:", "))
    {
      v11 = CFSTR("Expected end-of-line");
LABEL_8:
      -[MFIMAPParseContext emitWarning:](self, "emitWarning:", v11);
    }
  }
  else
  {
    -[MFIMAPParseContext emitError:](self, "emitError:", CFSTR("Expected number in literal"));
  }
  v12 = v26;
  if (v26)
  {
    if (v9)
      v13 = v26;
    else
      v13 = 0;
    v14 = (float)v13;
    v15 = v26;
    while (1)
    {
      v16 = v15 >= v10 ? v10 : v15;
      v17 = -[MFIMAPConnection _readDataOfLength:](self->_connection, "_readDataOfLength:", v16);
      if (!v17)
        break;
      v18 = v17;
      v19 = objc_msgSend(v17, "length");
      v20 = v15 == v19;
      v21 = v15 > v19;
      v15 -= v19;
      if (!v21)
      {
        if (!v20)
          -[MFIMAPParseContext emitWarning:](self, "emitWarning:", CFSTR("Ignoring extra bytes read during literal"));
        v15 = 0;
      }
      objc_msgSend(a3, "appendData:forSection:", v18, a4);
      if (v9)
        -[MFActivityMonitor setPercentDone:](v8, "setPercentDone:", (float)((float)(v12 - v15) / v14));
      if (!v15)
        goto LABEL_27;
    }
    -[MFIMAPParseContext emitError:](self, "emitError:", CFSTR("Read failure"));
    objc_msgSend(a3, "done");
  }
LABEL_27:
  if (!self->_invalid)
  {
    v22 = -[MFIMAPConnection _readDataOfLength:](self->_connection, "_readDataOfLength:", -1);
    if (v22)
    {
      v23 = v22;
      v24 = (const char *)objc_msgSend(v22, "bytes");
      self->_originalStart = v24;
      self->_start = v24;
      v7 = objc_msgSend(v23, "length");
      self->_originalEnd = &v24[v7];
      self->_end = &v24[v7];
      LOBYTE(v7) = 1;
      return v7;
    }
    -[MFIMAPParseContext emitError:](self, "emitError:", CFSTR("Read failure"));
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (id)copyLiteralString
{
  id result;
  id v4;
  id v5;

  result = -[MFIMAPParseContext copyLiteral](self, "copyLiteral");
  if (result)
  {
    v4 = result;
    v5 = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:", objc_msgSend(result, "bytes"), objc_msgSend(v4, "bytes") + objc_msgSend(v4, "length"), 0);

    return v5;
  }
  return result;
}

- (id)copyQuotedString
{
  const char *start;
  const char *end;
  int v5;
  const char *v6;
  int v7;
  const char *v8;
  _BYTE *v9;
  const char *v10;
  _BYTE *v11;
  char v12;
  id v13;

  if (-[MFIMAPParseContext match:](self, "match:", "\"))
  {
    start = self->_start;
    end = self->_end;
    if (start >= end)
    {
      if (start <= end)
        v8 = self->_start;
      else
        v8 = self->_end;
    }
    else
    {
      v5 = 0;
      v6 = self->_start;
      do
      {
        v7 = *(unsigned __int8 *)v6;
        if (v7 == 92)
        {
          if (v6 + 1 == end)
            break;
          v6 += 2;
          ++v5;
        }
        else
        {
          if (v7 == 34)
            break;
          ++v6;
        }
      }
      while (v6 < end);
      if (v6 <= end)
        v8 = v6;
      else
        v8 = self->_end;
      if (v5)
      {
        v9 = malloc_type_malloc(v8 - &start[v5], 0x30FB3D74uLL);
        v10 = self->_start;
        v11 = v9;
        while (v10 < v8)
        {
          if (*v10 == 92)
            ++v10;
          v12 = *v10++;
          *v11++ = v12;
        }
        v13 = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:", v9, v11, 0);
        self->_start = v10;
        free(v9);
        goto LABEL_25;
      }
    }
    v13 = -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:");
    self->_start = v8;
LABEL_25:
    -[MFIMAPParseContext match:](self, "match:", "\");
    return v13;
  }
  return 0;
}

- (id)copyNilOrString
{
  id v3;

  v3 = -[MFIMAPParseContext copyQuotedString](self, "copyQuotedString");
  if (!v3)
  {
    v3 = -[MFIMAPParseContext copyLiteralString](self, "copyLiteralString");
    if (!v3)
    {
      v3 = -[MFIMAPParseContext copyAtom](self, "copyAtom");
      if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("NIL")))
      {

        return 0;
      }
    }
  }
  return v3;
}

- (id)copyAString
{
  id result;

  result = -[MFIMAPParseContext copyAtom](self, "copyAtom");
  if (!result)
  {
    result = -[MFIMAPParseContext copyQuotedString](self, "copyQuotedString");
    if (!result)
      return -[MFIMAPParseContext copyLiteralString](self, "copyLiteralString");
  }
  return result;
}

- (id)copyDateTime
{
  id result;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  result = -[MFIMAPParseContext copyQuotedString](self, "copyQuotedString");
  if (result)
  {
    v3 = result;
    pthread_mutex_lock(&copyDateTime___dateFormatterLock);
    v4 = (void *)copyDateTime___dateFormatter;
    if (!copyDateTime___dateFormatter)
    {
      copyDateTime___dateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB3578]);
      v5 = objc_msgSend(MEMORY[0x1E0C99DC8], "ef_posixLocale");
      objc_msgSend((id)copyDateTime___dateFormatter, "setLocale:", v5);
      objc_msgSend((id)copyDateTime___dateFormatter, "setDateFormat:", CFSTR("d-MMM-yyyy H:mm:ss ZZZ"));
      v4 = (void *)copyDateTime___dateFormatter;
    }
    v6 = (id)objc_msgSend(v4, "dateFromString:", v3);
    pthread_mutex_unlock(&copyDateTime___dateFormatterLock);

    return v6;
  }
  return result;
}

- (__CFArray)copyArrayAllowingNulls:(BOOL)a3
{
  _BOOL8 v3;
  const CFArrayCallBacks *v5;
  __CFArray *Mutable;
  __CFArray *v7;
  __CFArray *v8;

  v3 = a3;
  if (!-[MFIMAPParseContext match:](self, "match:", "("))
    return 0;
  if (v3)
    v5 = (const CFArrayCallBacks *)&kNullOrCFTypeArrayCallBacks;
  else
    v5 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable(0, 0, v5);
  if (!-[MFIMAPParseContext match:](self, "match:", ")"))
  {
    do
    {
      v7 = -[MFIMAPParseContext copyArrayAllowingNulls:](self, "copyArrayAllowingNulls:", v3);
      if (!v7)
      {
        v7 = -[MFIMAPParseContext copyNumber](self, "copyNumber");
        if (!v7)
        {
          v8 = -[MFIMAPParseContext copyAtom](self, "copyAtom");
          if (v8)
          {
            v7 = v8;
            if (v3 && !-[__CFArray caseInsensitiveCompare:](v8, "caseInsensitiveCompare:", CFSTR("NIL")))
            {

              v7 = 0;
            }
          }
          else
          {
            v7 = -[MFIMAPParseContext copyQuotedString](self, "copyQuotedString");
            if (!v7)
            {
              v7 = -[MFIMAPParseContext copyLiteralString](self, "copyLiteralString");
              if (!v7)
              {
                -[MFIMAPParseContext emitWarning:](self, "emitWarning:", CFSTR("Can't parse array contents"));
                return Mutable;
              }
            }
          }
        }
      }
      -[MFIMAPParseContext parseSpace](self, "parseSpace");
      CFArrayAppendValue(Mutable, v7);
      if (v7)

    }
    while (!-[MFIMAPParseContext match:](self, "match:", ")"));
  }
  return Mutable;
}

- (id)copyArray
{
  return -[MFIMAPParseContext copyArrayAllowingNulls:](self, "copyArrayAllowingNulls:", 0);
}

- (id)copyMessageSet
{
  const char *v3;
  int v4;
  unint64_t v6;

  v3 = -[MFIMAPParseContext start](self, "start");
  v6 = 0xAAAAAAAAAAAAAAAALL;
  if (-[MFIMAPParseContext getNumber:](self, "getNumber:", &v6))
  {
    do
    {
      v4 = -[MFIMAPParseContext lookAhead](self, "lookAhead");
      if (v4 != 58 && v4 != 44)
        break;
      -[MFIMAPParseContext increment](self, "increment");
    }
    while (-[MFIMAPParseContext getNumber:](self, "getNumber:", &v6));
  }
  if (-[MFIMAPParseContext start](self, "start") <= v3)
    return 0;
  else
    return -[MFIMAPParseContext copyStringFrom:to:withCaseOption:](self, "copyStringFrom:to:withCaseOption:", v3, -[MFIMAPParseContext start](self, "start"), 0);
}

- (id)copyStringFrom:(const char *)a3 to:(const char *)a4 withCaseOption:(int64_t)a5
{
  const char *v7;
  int64_t v8;
  __CFString *v9;
  uint64_t v10;
  unsigned int v11;
  CFIndex Length;
  __CFString *MutableCopy;

  v7 = a3;
  v8 = a4 - a3;
  v9 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4 - a3, 0x600u, 0);
  if (a5 == 1 && v7 < a4)
  {
    v10 = MEMORY[0x1E0C80978];
    do
    {
      v11 = *v7;
      if ((v11 & 0x80000000) != 0)
      {
        if (__maskrune(v11, 0x1000uLL))
        {
LABEL_10:
          Length = CFStringGetLength(v9);
          MutableCopy = CFStringCreateMutableCopy(0, Length, v9);
          CFStringUppercase(MutableCopy, 0);

          return MutableCopy;
        }
      }
      else if ((*(_DWORD *)(v10 + 4 * v11 + 60) & 0x1000) != 0)
      {
        goto LABEL_10;
      }
      ++v7;
      --v8;
    }
    while (v8);
  }
  return v9;
}

- (BOOL)parseSpace
{
  int v3;
  int v4;

  v3 = -[MFIMAPParseContext lookAhead](self, "lookAhead");
  v4 = v3;
  while (v3 == 32)
  {
    ++self->_start;
    v3 = -[MFIMAPParseContext lookAhead](self, "lookAhead");
  }
  return v4 == 32;
}

- (unsigned)lookAhead
{
  unsigned __int8 *start;

  start = (unsigned __int8 *)self->_start;
  if ((const char *)start >= self->_end)
    return 0;
  else
    return *start;
}

- (const)nextSeparator
{
  const char *result;
  const char *end;
  int64_t v5;

  result = self->_start;
  end = self->_end;
  if (result < end)
  {
    v5 = end - result;
    while (*result != 32)
    {
      ++result;
      if (!--v5)
        return end;
    }
  }
  return result;
}

- (void)setStart:.cold.1()
{
  __assert_rtn("-[MFIMAPParseContext setStart:]", "MFIMAPParseContext.m", 105, "start >= _originalStart && \"Should not put the start before the original start.\");
}

- (void)setEnd:.cold.1()
{
  __assert_rtn("-[MFIMAPParseContext setEnd:]", "MFIMAPParseContext.m", 118, "end <= _originalEnd && \"Should not put the end past the original end.\");
}

@end
