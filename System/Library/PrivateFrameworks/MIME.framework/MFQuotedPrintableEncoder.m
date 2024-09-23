@implementation MFQuotedPrintableEncoder

- (int64_t)appendData:(id)a3
{
  id v4;
  _BYTE *v5;
  int64_t v6;
  unint64_t v7;
  _BYTE *v8;
  _BOOL4 forTextPart;
  unint64_t lastHorizontalWhitespace;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  size_t v14;
  size_t matchedFrom;
  unint64_t v16;
  int v17;
  _BYTE *v18;
  unint64_t v19;
  _BYTE *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v25;
  objc_super v26;
  objc_super v27;
  _BYTE __b[16384];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v25 = v4;
  v5 = (_BYTE *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  memset(__b, 170, sizeof(__b));
  if (v6 <= 0)
    goto LABEL_53;
  v7 = 0;
  v8 = &v5[v6];
  do
  {
    self->_lastWasNewLine = 0;
    forTextPart = self->_forTextPart;
    if (self->_forTextPart && (lastHorizontalWhitespace = self->_lastHorizontalWhitespace) != 0 && *v5 == 10)
    {
      v11 = &__b[v7];
      *v11 = 61;
      v11[1] = kEncodeHexTable[lastHorizontalWhitespace >> 4];
      v7 += 3;
      v11[2] = kEncodeHexTable[lastHorizontalWhitespace & 0xF];
      self->_line += 3;
      self->_lastHorizontalWhitespace = 0;
      --v5;
    }
    else if (self->_forHeader || (v12 = self->_matchedFrom, kFromSpace[v12] != *v5))
    {
      if (self->_forTextPart && self->_lastHorizontalWhitespace)
      {
        __b[v7++] = self->_lastHorizontalWhitespace;
        ++self->_line;
        self->_lastHorizontalWhitespace = 0;
      }
      matchedFrom = self->_matchedFrom;
      if (matchedFrom)
      {
        memcpy(&__b[v7], "From ", matchedFrom);
        v16 = self->_matchedFrom;
        v7 += v16;
        self->_line += v16;
        self->_matchedFrom = 0;
      }
      v4 = v25;
      v17 = *v5;
      if (v17 != 61
        && (v17 - 127) >= 0xFFFFFFA2
        && (!self->_forHeader
         || (v17 - 40) > 0x37
         || ((1 << (v17 - 40)) & 0x80000001800003) == 0))
      {
        goto LABEL_34;
      }
      if (!self->_forTextPart)
        goto LABEL_30;
      if (v17 == 9)
      {
        self->_lastHorizontalWhitespace = 9;
        v19 = (self->_line & 0xFFFFFFFFFFFFFFF8) + 8;
        goto LABEL_37;
      }
      if (v17 == 32)
      {
        self->_lastHorizontalWhitespace = 32;
        goto LABEL_38;
      }
      if (v17 != 10)
      {
LABEL_30:
        if (self->_forHeader && (v17 == 32 || v17 == 10))
        {
          LOBYTE(v17) = 95;
LABEL_34:
          __b[v7++] = v17;
          v19 = self->_line + 1;
        }
        else
        {
          v20 = &__b[v7];
          *v20 = 61;
          v20[1] = kEncodeHexTable[(unint64_t)*v5 >> 4];
          v7 += 3;
          v20[2] = kEncodeHexTable[*v5 & 0xF];
          v19 = self->_line + 3;
        }
LABEL_37:
        self->_line = v19;
        goto LABEL_38;
      }
      v18 = &__b[v7];
      *v18 = 13;
      v7 += 2;
      v18[1] = *v5;
      self->_line = 0;
      self->_lastWasNewLine = 1;
    }
    else
    {
      v13 = v12 + 1;
      self->_matchedFrom = v13;
      if (forTextPart && self->_lastHorizontalWhitespace)
      {
        __b[v7] = self->_lastHorizontalWhitespace;
        ++self->_line;
        ++v7;
        self->_lastHorizontalWhitespace = 0;
        v13 = self->_matchedFrom;
      }
      if (v13 == 5)
      {
        self->_matchedFrom = 0;
        if (self->_forTextPart)
        {
          self->_lastHorizontalWhitespace = 32;
          v14 = 6;
        }
        else
        {
          v14 = 7;
        }
        memcpy(&__b[v7], "=46rom ", v14);
        v7 += v14;
        self->_line += v14;
        v4 = v25;
      }
    }
LABEL_38:
    if (!self->_forHeader && self->_line >= 0x4C && !self->_lastWasNewLine)
    {
      v21 = v7 + 1;
      __b[v7] = 61;
      if (self->_forTextPart)
      {
        __b[v21] = 13;
        v21 = v7 + 2;
      }
      __b[v21] = 10;
      v7 = v21 + 1;
      self->_line = 0;
      self->_lastWasNewLine = 0;
    }
    if (v7 >= 0x3F1D)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v7, 0);
      v27.receiver = self;
      v27.super_class = (Class)MFQuotedPrintableEncoder;
      -[MFBaseFilterDataConsumer appendData:](&v27, sel_appendData_, v22);

      v7 = 0;
    }
    ++v5;
  }
  while (v5 < v8);
  if (v7)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v7, 0);
    v26.receiver = self;
    v26.super_class = (Class)MFQuotedPrintableEncoder;
    -[MFBaseFilterDataConsumer appendData:](&v26, sel_appendData_, v23);

  }
LABEL_53:

  return v6;
}

- (void)done
{
  unint64_t matchedFrom;
  unint64_t lastHorizontalWhitespace;
  char *v5;
  unint64_t line;
  unint64_t v7;
  void *v8;
  objc_super v9;
  _DWORD __b[4096];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  matchedFrom = self->_matchedFrom;
  if (matchedFrom)
  {
    if (matchedFrom == 5)
    {
      qmemcpy(__b, "=46ro", 5);
    }
    else
    {
      __memmove_chk();
      matchedFrom = self->_matchedFrom;
    }
    self->_line += matchedFrom;
  }
  if (self->_forTextPart)
  {
    lastHorizontalWhitespace = self->_lastHorizontalWhitespace;
    if (self->_lastHorizontalWhitespace)
    {
      v5 = (char *)__b + matchedFrom;
      *v5 = 61;
      v5[1] = kEncodeHexTable[lastHorizontalWhitespace >> 4];
      matchedFrom += 3;
      line = self->_line;
      v5[2] = kEncodeHexTable[lastHorizontalWhitespace & 0xF];
      self->_line = line + 3;
      self->_lastHorizontalWhitespace = 0;
    }
  }
  if (self->_line)
  {
    if (!self->_forHeader)
    {
      v7 = matchedFrom + 1;
      *((_BYTE *)__b + matchedFrom) = 61;
      if (self->_forTextPart)
      {
        *((_BYTE *)__b + v7) = 13;
        v7 = matchedFrom + 2;
      }
      matchedFrom = v7 + 1;
      *((_BYTE *)__b + v7) = 10;
    }
    self->_line = 0;
  }
  if (matchedFrom)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, matchedFrom, 0);
    v9.receiver = self;
    v9.super_class = (Class)MFQuotedPrintableEncoder;
    -[MFBaseFilterDataConsumer appendData:](&v9, sel_appendData_, v8);

  }
}

+ (unint64_t)requiredSizeToEncodeHeaderBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t result;
  const char *v5;
  int v6;
  int v7;

  if ((uint64_t)a4 < 1)
    return 0;
  result = 0;
  v5 = &a3[a4];
  do
  {
    v7 = *(unsigned __int8 *)a3++;
    v6 = v7;
    if ((v7 - 32) < 0x5F && v6 != 61 || v6 == 10)
      ++result;
    else
      result += 3;
  }
  while (a3 < v5);
  return result;
}

- (BOOL)forTextPart
{
  return self->_forTextPart;
}

- (void)setForTextPart:(BOOL)a3
{
  self->_forTextPart = a3;
}

- (BOOL)forHeader
{
  return self->_forHeader;
}

- (void)setForHeader:(BOOL)a3
{
  self->_forHeader = a3;
}

@end
