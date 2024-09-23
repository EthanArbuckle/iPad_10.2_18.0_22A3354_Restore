@implementation ABVCardLexer

- (id)tokenName:(int)a3
{
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 <= 32769)
  {
    if (!a3)
      return CFSTR("ABNoToken");
    if (a3 == 32769)
      return CFSTR("ABLF");
  }
  else
  {
    switch(a3)
    {
      case 32770:
        return CFSTR("ABCR");
      case 65538:
        return CFSTR("ABERROR");
      case 65537:
        return CFSTR("ABEOF");
    }
  }
  v6 = -[NSArray count](self->_activeTokenSets, "count");
  if (v6 < 1)
    return CFSTR("????");
  v7 = v6;
  v8 = 0;
  v5 = CFSTR("????");
  while (1)
  {
    v9 = -[NSArray objectAtIndex:](self->_activeTokenSets, "objectAtIndex:", v8);
    v10 = objc_msgSend(v9, "count");
    if (v10 >= 1)
      break;
LABEL_18:
    if (++v8 == v7)
      return (id)v5;
  }
  v11 = v10;
  v12 = 0;
  while (1)
  {
    v13 = objc_msgSend(v9, "objectAtIndex:", v12);
    if (*(_DWORD *)(v13 + 8) == a3)
      return *(id *)v13;
    if (v11 == ++v12)
      goto LABEL_18;
  }
}

- (ABVCardLexer)initWithData:(id)a3 watchdogTimer:(id)a4
{
  ABVCardLexer *v6;
  NSMutableData *v7;
  unint64_t length;
  char *bytes;
  int v10;
  unint64_t v11;
  int v12;
  NSArray *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ABVCardLexer;
  v6 = -[ABVCardLexer init](&v15, sel_init);
  v7 = (NSMutableData *)objc_msgSend(a3, "mutableCopy");
  v6->_data = v7;
  v6->_length = -[NSMutableData length](v7, "length");
  v6->_bytes = (char *)-[NSMutableData mutableBytes](v6->_data, "mutableBytes");
  v6->_unicode = -[NSMutableData abIsUTF16EntourageVCard](v6->_data, "abIsUTF16EntourageVCard");
  v6->_timer = (ABVCardWatchdogTimer *)a4;
  length = v6->_length;
  if (length >= 0xB)
  {
    bytes = v6->_bytes;
    v10 = *bytes;
    if (v10 == 255)
    {
      if (bytes[1] == 254)
      {
        v6->_unicode = 1;
        v6->_cursor = 2;
        v11 = length >> 1;
        do
        {
          *(_WORD *)bytes = bswap32(*(unsigned __int16 *)bytes) >> 16;
          bytes += 2;
          --v11;
        }
        while (v11);
        goto LABEL_12;
      }
    }
    else if (v10 == 254 && bytes[1] == 255)
    {
      v6->_unicode = 1;
      v6->_cursor = 2;
      goto LABEL_12;
    }
    v12 = -[NSMutableData abIsUTF16EntourageVCard](v6->_data, "abIsUTF16EntourageVCard");
    v6->_unicode = v12;
    if (!v12)
    {
      v13 = (NSArray *)ABVCardSingleByteTokens;
      if (!ABVCardSingleByteTokens)
      {
        v13 = (NSArray *)buildTokenTable(0);
        ABVCardSingleByteTokens = (uint64_t)v13;
      }
      goto LABEL_16;
    }
LABEL_12:
    v13 = (NSArray *)ABVCardUTF16Tokens;
    if (!ABVCardUTF16Tokens)
    {
      v13 = (NSArray *)buildTokenTable(1);
      ABVCardUTF16Tokens = (uint64_t)v13;
    }
LABEL_16:
    v6->_activeTokenSets = v13;
    return v6;
  }

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABVCardLexer;
  -[ABVCardLexer dealloc](&v3, sel_dealloc);
}

- (unsigned)cursor
{
  return self->_cursor;
}

- (int)errorCount
{
  return self->_errorCount;
}

- (id)tokenSetForLength:(int)a3
{
  int v3;

  v3 = a3 - 1;
  if ((a3 - 1) <= 6 && ((0x55u >> v3) & 1) != 0)
    return -[NSArray objectAtIndex:](self->_activeTokenSets, "objectAtIndex:", qword_19BCBE960[v3]);
  else
    return 0;
}

- (int)nextTokenPeakSingle:(BOOL)a3 length:(int)a4
{
  unint64_t cursor;
  int v8;
  ABVCardWatchdogTimer *timer;
  unint64_t peakedPoint;
  unint64_t v11;
  BOOL v12;
  char v13;
  int result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const __CFArray *v19;
  const __CFArray *v20;
  CFIndex Count;
  CFIndex v22;
  CFIndex v23;
  const void *ValueAtIndex;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  unint64_t length;
  BOOL v33;
  BOOL v34;
  BOOL v36;
  _BYTE v37[8];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  cursor = self->_cursor;
  self->_peakedPoint = cursor;
  if (self->_length <= cursor)
    v8 = 65537;
  else
    v8 = 0;
  timer = self->_timer;
  if (timer && !-[ABVCardWatchdogTimer isValid](timer, "isValid"))
  {
    self->_errorCount = 10;
    v8 = 65538;
  }
  peakedPoint = self->_peakedPoint;
  if (self->_length <= peakedPoint)
  {
    v12 = 1;
LABEL_14:
    if (a3)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (a4 <= 0)
    v11 = 7;
  else
    v11 = a4;
  if (v8)
  {
    v12 = 0;
    goto LABEL_14;
  }
  v36 = a3;
  v18 = 1;
  do
  {
    *(_WORD *)&v37[v18 - 1] = self->_bytes[peakedPoint];
    v19 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", v18);
    if (v19 && (v20 = v19, Count = CFArrayGetCount(v19), Count >= 1))
    {
      v22 = Count;
      v23 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v20, v23);
        v25 = (unsigned __int8 *)*((_QWORD *)ValueAtIndex + 2);
        v26 = v37;
        do
        {
          while (1)
          {
            v28 = *v25++;
            v27 = v28;
            v30 = *v26++;
            v29 = v30;
            if (v30 != v27)
              break;
            if (!v27)
              goto LABEL_41;
          }
        }
        while ((v29 - 97) <= 0x19 && v29 - 32 == v27);
        if (!v29)
        {
LABEL_41:
          v8 = *((_DWORD *)ValueAtIndex + 2);
          break;
        }
        v8 = 0;
        if (++v23 != v22)
          continue;
        break;
      }
    }
    else
    {
      v8 = 0;
    }
    peakedPoint = self->_peakedPoint + 1;
    self->_peakedPoint = peakedPoint;
    length = self->_length;
    v33 = length > peakedPoint;
    v12 = length <= peakedPoint;
    v34 = !v33 || v18++ >= v11;
  }
  while (!v34 && v8 == 0);
  if (!v36)
LABEL_15:
    self->_cursor = peakedPoint;
LABEL_16:
  if (a4 | v8)
    v13 = 1;
  else
    v13 = v12;
  if (a4 | v8)
    result = v8;
  else
    result = 65537;
  if ((v13 & 1) == 0)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABVCardLexer nextTokenPeakSingle:length:]", 356, 0, (uint64_t)CFSTR("vCard Syntax Error, character: %d : %c"), v15, v16, v17, self->_cursor);
    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)nextTokenPeakUnicode:(BOOL)a3 length:(int)a4
{
  _BOOL4 v5;
  unint64_t cursor;
  unint64_t v8;
  int v9;
  ABVCardWatchdogTimer *timer;
  unint64_t peakedPoint;
  BOOL v12;
  char v13;
  int result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *bytes;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  _WORD *v23;
  const __CFArray *v24;
  const __CFArray *v25;
  CFIndex Count;
  CFIndex v27;
  CFIndex v28;
  const void *ValueAtIndex;
  unsigned __int16 *v30;
  unsigned __int16 *v31;
  int v32;
  int v33;
  int v34;
  int v35;
  unint64_t length;
  BOOL v38;
  BOOL v39;
  _BOOL4 v41;
  _WORD v42[8];
  uint64_t v43;

  v5 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  cursor = self->_cursor;
  self->_peakedPoint = cursor;
  if (a4 <= 0)
    v8 = 7;
  else
    v8 = a4;
  if (self->_length <= cursor)
    v9 = 65537;
  else
    v9 = 0;
  timer = self->_timer;
  if (timer && !-[ABVCardWatchdogTimer isValid](timer, "isValid"))
  {
    self->_errorCount = 10;
    v9 = 65538;
  }
  peakedPoint = self->_peakedPoint;
  if (self->_length <= peakedPoint)
  {
    v12 = 1;
    if (v5)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v9)
  {
    v12 = 0;
    if (v5)
      goto LABEL_16;
LABEL_15:
    self->_cursor = peakedPoint;
    goto LABEL_16;
  }
  v41 = v5;
  v18 = 1;
  do
  {
    bytes = self->_bytes;
    v20 = bytes[peakedPoint];
    v21 = peakedPoint + 1;
    self->_peakedPoint = v21;
    v22 = bytes[v21];
    v23 = &v42[v18];
    *(v23 - 1) = v22 | (v20 << 8);
    *v23 = 0;
    v24 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", v18);
    if (v24 && (v25 = v24, Count = CFArrayGetCount(v24), Count >= 1))
    {
      v27 = Count;
      v28 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v25, v28);
        v30 = (unsigned __int16 *)*((_QWORD *)ValueAtIndex + 2);
        v31 = v42;
        do
        {
          while (1)
          {
            v33 = *v30++;
            v32 = v33;
            v35 = *v31++;
            v34 = v35;
            if (v35 != v32)
              break;
            if (!v32)
              goto LABEL_41;
          }
        }
        while ((v34 - 97) <= 0x19 && v34 - 32 == v32);
        if (!v34)
        {
LABEL_41:
          v9 = *((_DWORD *)ValueAtIndex + 2);
          break;
        }
        v9 = 0;
        if (++v28 != v27)
          continue;
        break;
      }
    }
    else
    {
      v9 = 0;
    }
    peakedPoint = self->_peakedPoint + 1;
    self->_peakedPoint = peakedPoint;
    length = self->_length;
    v38 = length > peakedPoint;
    v12 = length <= peakedPoint;
    v39 = !v38 || v18++ >= v8;
  }
  while (!v39 && v9 == 0);
  if (!v41)
    goto LABEL_15;
LABEL_16:
  if (a4 | v9)
    v13 = 1;
  else
    v13 = v12;
  if (a4 | v9)
    result = v9;
  else
    result = 65537;
  if ((v13 & 1) == 0)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABVCardLexer nextTokenPeakUnicode:length:]", 406, 0, (uint64_t)CFSTR("vCard Syntax Error, character: %d : %c"), v15, v16, v17, self->_cursor);
    ++self->_errorCount;
    return 65538;
  }
  return result;
}

- (int)nextTokenPeak:(BOOL)a3
{
  if (self->_unicode)
    return -[ABVCardLexer nextTokenPeakUnicode:length:](self, "nextTokenPeakUnicode:length:", a3, 0);
  else
    return -[ABVCardLexer nextTokenPeakSingle:length:](self, "nextTokenPeakSingle:length:", a3, 0);
}

- (id)nextQuotedPrintableData
{
  char *bytes;
  uint64_t cursor;
  unsigned int v4;
  unsigned int v7;
  char v8;
  char v9;
  char v10;
  char v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  char v15;
  char v16;
  char v17;
  char v18;

  bytes = self->_bytes;
  cursor = self->_cursor;
  v4 = bytes[cursor];
  self->_cursor = cursor + 1;
  if (v4 == 13 || v4 == 10)
  {
    -[ABVCardLexer advancePastEOL](self, "advancePastEOL");
    return 0;
  }
  else
  {
    v7 = bytes[(cursor + 1)];
    if (v4 <= 0x40)
      v8 = 64;
    else
      v8 = 9;
    v9 = v8 + v4;
    if (v7 <= 0x40)
      v10 = -48;
    else
      v10 = -55;
    if (v7 > 0x60)
      v10 = -87;
    v11 = v7 + 16 * v9 + v10;
    v18 = v11;
    self->_cursor = cursor + 2;
    if (v11 == 13 && (v12 = (cursor + 4), self->_length > v12))
    {
      if (bytes[(cursor + 2)] == 61)
      {
        v13 = bytes[(cursor + 3)];
        v14 = bytes[v12];
        if (v13 <= 0x40)
          v15 = 64;
        else
          v15 = 9;
        v16 = v15 + v13;
        if (v14 <= 0x40)
          v17 = -48;
        else
          v17 = -55;
        if (v14 > 0x60)
          v17 = -87;
        if ((v17 + v14 + 16 * v16) == 10)
          self->_cursor = cursor + 5;
      }
      return (id)ABReturnDelimiterData;
    }
    else
    {
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v18, 1);
    }
  }
}

- (id)nextEscapedCharacter
{
  char *bytes;
  uint64_t cursor;
  int v5;
  int v6;
  _BOOL4 unicode;
  void *v8;
  char *v9;
  uint64_t v10;
  _BYTE v12[2];
  char v13;

  if (-[ABVCardLexer advancedPastToken:](self, "advancedPastToken:", 0x8000))
    -[ABVCardLexer advancedPastToken:](self, "advancedPastToken:", 0x4000);
  bytes = self->_bytes;
  cursor = self->_cursor;
  v5 = bytes[cursor];
  v13 = bytes[cursor];
  v6 = cursor + 1;
  self->_cursor = cursor + 1;
  unicode = self->_unicode;
  if (self->_unicode)
  {
    v5 = bytes[v6];
    v13 = bytes[v6];
    self->_cursor = cursor + 2;
  }
  if (v5 == 110)
  {
    LOBYTE(v5) = 10;
    v13 = 10;
  }
  if (unicode)
  {
    v12[0] = 0;
    v12[1] = v5;
    v8 = (void *)MEMORY[0x1E0C99D50];
    v9 = v12;
    v10 = 2;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D50];
    v9 = &v13;
    v10 = 1;
  }
  return (id)objc_msgSend(v8, "dataWithBytes:length:", v9, v10);
}

- (BOOL)advancedPastToken:(int)a3
{
  unint64_t cursor;
  unint64_t v4;
  int v7;

  cursor = self->_cursor;
  LODWORD(v4) = self->_cursor;
  if (self->_length > cursor)
  {
    while ((-[ABVCardLexer tokenAtCursor](self, "tokenAtCursor") & a3) != 0)
    {
      if (self->_unicode)
        v7 = 2;
      else
        v7 = 1;
      v4 = self->_cursor + v7;
      self->_cursor = v4;
      if (self->_length <= v4)
        return v4 > cursor;
    }
    LODWORD(v4) = self->_cursor;
  }
  return v4 > cursor;
}

- (id)nextSingleByteStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6
{
  _BOOL4 v6;
  unint64_t cursor;
  const __CFArray *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  CFIndex Count;
  CFIndex v16;
  CFIndex v17;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v26;
  void *v27;
  id v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  void *v33;
  unint64_t v34;
  id v35;
  void *v36;
  uint64_t v38;
  _BOOL4 v40;
  _BYTE v41[2];

  v6 = a6;
  v40 = a4;
  cursor = self->_cursor;
  v9 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v41[1] = 0;
  v11 = self->_cursor;
  if (self->_length <= v11)
  {
LABEL_36:

    self->_cursor = self->_peakedPoint;
    return 0;
  }
  v12 = 0;
  v13 = 0;
  v38 = 0;
  v14 = 1;
  while (1)
  {
    v41[0] = self->_bytes[v11];
    Count = CFArrayGetCount(v9);
    if (Count < 1)
    {
LABEL_15:
      v26 = 0;
      if (!v6)
        goto LABEL_21;
    }
    else
    {
      v16 = Count;
      v17 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, v17);
        v19 = (unsigned __int8 *)ValueAtIndex[2];
        v20 = v41;
        do
        {
          while (1)
          {
            v22 = *v19++;
            v21 = v22;
            v24 = *v20++;
            v23 = v24;
            if (v24 != v21)
              break;
            if (!v21)
              goto LABEL_17;
          }
        }
        while ((v23 - 97) <= 0x19 && v23 - 32 == v21);
        if (v23)
        {
          if (++v17 != v16)
            continue;
          goto LABEL_15;
        }
        break;
      }
LABEL_17:
      v26 = *((_DWORD *)ValueAtIndex + 2);
      if (!v6)
        goto LABEL_21;
    }
    if ((v26 & 0x4000) != 0)
      break;
    v14 &= (v26 & a5) != 0;
    if ((v26 & a5) == 0)
      v13 = 0;
LABEL_21:
    if (v40 && v26 == 1025)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[cursor], v12, 0);
      objc_msgSend(v10, "appendData:", v27);

      ++self->_cursor;
      v28 = -[ABVCardLexer nextQuotedPrintableData](self, "nextQuotedPrintableData");
      if (v28)
        goto LABEL_24;
    }
    else
    {
      if (v26 != 513)
        goto LABEL_33;
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[cursor], v12, 0);
      objc_msgSend(v10, "appendData:", v29);

      ++self->_cursor;
      v28 = -[ABVCardLexer nextEscapedCharacter](self, "nextEscapedCharacter");
      if (v28)
LABEL_24:
        objc_msgSend(v10, "appendData:", v28);
    }
    v12 = 0;
    v11 = self->_cursor;
    cursor = v11;
LABEL_35:
    if (self->_length <= v11)
      goto LABEL_36;
  }
  v30 = (v14 & 1) == 0;
  v14 = (v14 & 1) != 0;
  v31 = v38;
  if (!v30)
    v31 = v38 + 1;
  v38 = v31;
  if (v30)
    ++v13;
LABEL_33:
  if ((v26 & a5) == 0)
  {
    ++v12;
    v11 = self->_cursor + 1;
    self->_cursor = v11;
    goto LABEL_35;
  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[cursor], v12, 0);
  objc_msgSend(v10, "appendData:", v33);

  if (v6)
  {
    v34 = a3;
    if (v38 | v13)
    {
      v35 = (id)objc_msgSend(v10, "subdataWithRange:", v38, objc_msgSend(v10, "length") - (v13 + v38));

      v10 = v35;
    }
  }
  else
  {
    v34 = a3;
  }
  if (v34 == 4000100)
    return (id)objc_msgSend(v10, "abDecodedUTF7");
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, v34);

  return v36;
}

- (id)nextUnicodeStringStopTokens:(int)a3 quotedPrintable:(BOOL)a4 trim:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t cursor;
  const __CFArray *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char *bytes;
  unsigned int v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex v19;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v21;
  unsigned __int16 *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  void *v35;
  void *v36;
  uint64_t v37;
  _BOOL4 v39;
  _BYTE v40[2];
  __int16 v41;

  v5 = a5;
  v39 = a4;
  cursor = self->_cursor;
  v8 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v9 = objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v41 = 0;
  v10 = self->_cursor;
  if (self->_length <= v10)
  {
LABEL_36:
    self->_cursor = self->_peakedPoint;
    return 0;
  }
  v11 = (void *)v9;
  v12 = 0;
  v13 = 0;
  v37 = 0;
  v14 = 1;
  while (1)
  {
    bytes = self->_bytes;
    v40[1] = bytes[v10];
    v16 = v10 + 1;
    self->_cursor = v16;
    v40[0] = bytes[v16];
    Count = CFArrayGetCount(v8);
    if (Count < 1)
    {
LABEL_15:
      v28 = 0;
      if (!v5)
        goto LABEL_21;
    }
    else
    {
      v18 = Count;
      v19 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, v19);
        v21 = (unsigned __int16 *)ValueAtIndex[2];
        v22 = (unsigned __int16 *)v40;
        do
        {
          while (1)
          {
            v24 = *v21++;
            v23 = v24;
            v26 = *v22++;
            v25 = v26;
            if (v26 != v23)
              break;
            if (!v23)
              goto LABEL_17;
          }
        }
        while ((v25 - 97) <= 0x19 && v25 - 32 == v23);
        if (v25)
        {
          if (++v19 != v18)
            continue;
          goto LABEL_15;
        }
        break;
      }
LABEL_17:
      v28 = *((_DWORD *)ValueAtIndex + 2);
      if (!v5)
        goto LABEL_21;
    }
    if ((v28 & 0x4000) != 0)
      break;
    v14 &= (v28 & a3) != 0;
    if ((v28 & a3) == 0)
      v13 = 0;
LABEL_21:
    if (v39 && v28 == 1025)
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[cursor], v12, 0);
      objc_msgSend(v11, "appendData:", v29);

      ++self->_cursor;
      v30 = -[ABVCardLexer nextQuotedPrintableData](self, "nextQuotedPrintableData");
      if (v30)
        goto LABEL_24;
    }
    else
    {
      if (v28 != 513)
        goto LABEL_33;
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[cursor], v12, 0);
      objc_msgSend(v11, "appendData:", v31);

      ++self->_cursor;
      v30 = -[ABVCardLexer nextEscapedCharacter](self, "nextEscapedCharacter");
      if (v30)
LABEL_24:
        objc_msgSend(v11, "appendData:", v30);
    }
    v12 = 0;
    v10 = self->_cursor;
    cursor = v10;
LABEL_35:
    if (self->_length <= v10)
      goto LABEL_36;
  }
  v32 = v37;
  v33 = (v14 & 1) == 0;
  v14 = (v14 & 1) != 0;
  if (!v33)
    v32 = v37 + 2;
  v37 = v32;
  if (v33)
    v13 += 2;
LABEL_33:
  if ((v28 & a3) == 0)
  {
    v12 += 2;
    v10 = self->_cursor + 1;
    self->_cursor = v10;
    goto LABEL_35;
  }
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &self->_bytes[cursor], v12, 0);
  objc_msgSend(v11, "appendData:", v35);

  if (v5)
  {
    if (v37 | v13)
      v11 = (void *)objc_msgSend(v11, "subdataWithRange:", v37, objc_msgSend(v11, "length") - (v13 + v37));
  }
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 10);
  --self->_cursor;
  return v36;
}

- (BOOL)_advancePastLineFoldingSequenceIfNeeded
{
  BOOL result;
  unsigned int v4;

  if (self->_unicode)
  {
    if ((-[ABVCardLexer nextTokenPeakUnicode:length:](self, "nextTokenPeakUnicode:length:", 1, 1) & 0x8000) != 0)
    {
      -[ABVCardLexer advancePastEOL](self, "advancePastEOL");
      if ((-[ABVCardLexer nextTokenPeakUnicode:length:](self, "nextTokenPeakUnicode:length:", 1, 1) & 0x4000) == 0)
      {
        result = 0;
        v4 = self->_cursor - 2;
LABEL_9:
        self->_cursor = v4;
        return result;
      }
      goto LABEL_10;
    }
    return 0;
  }
  if ((-[ABVCardLexer nextTokenPeakSingle:length:](self, "nextTokenPeakSingle:length:", 1, 1) & 0x8000) == 0)
    return 0;
  -[ABVCardLexer advancePastEOL](self, "advancePastEOL");
  if ((-[ABVCardLexer nextTokenPeakSingle:length:](self, "nextTokenPeakSingle:length:", 1, 1) & 0x4000) == 0)
  {
    result = 0;
    v4 = self->_cursor - 1;
    goto LABEL_9;
  }
LABEL_10:
  -[ABVCardLexer advanceToPeakPoint](self, "advanceToPeakPoint");
  return 1;
}

- (void)_applyNextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6 intoString:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  _BOOL8 v10;
  id v13;
  id v14;

  v8 = a6;
  v9 = *(_QWORD *)&a5;
  v10 = a4;
  if (self->_unicode)
    v13 = -[ABVCardLexer nextUnicodeStringStopTokens:quotedPrintable:trim:](self, "nextUnicodeStringStopTokens:quotedPrintable:trim:", *(_QWORD *)&a5, a4, a6);
  else
    v13 = -[ABVCardLexer nextSingleByteStringInEncoding:quotedPrintable:stopTokens:trim:](self, "nextSingleByteStringInEncoding:quotedPrintable:stopTokens:trim:", a3, a4, *(_QWORD *)&a5, a6);
  v14 = v13;
  if (v13)
    objc_msgSend(a7, "appendString:", v13);
  if (-[ABVCardLexer _advancePastLineFoldingSequenceIfNeeded](self, "_advancePastLineFoldingSequenceIfNeeded", v14))
    -[ABVCardLexer _applyNextStringInEncoding:quotedPrintable:stopTokens:trim:intoString:](self, "_applyNextStringInEncoding:quotedPrintable:stopTokens:trim:intoString:", a3, v10, v9, v8, a7);
}

- (id)nextStringInEncoding:(unint64_t)a3 quotedPrintable:(BOOL)a4 stopTokens:(int)a5 trim:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  _BOOL8 v8;
  id v11;
  uint64_t v12;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[ABVCardLexer _applyNextStringInEncoding:quotedPrintable:stopTokens:trim:intoString:](self, "_applyNextStringInEncoding:quotedPrintable:stopTokens:trim:intoString:", a3, v8, v7, 0, v11);
  if (v6)
  {
    v12 = _ABStringByTrimmingWhiteSpace(v11);

    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v12);
  }
  return v11;
}

- (int)tokenAtCursor
{
  uint64_t cursor;
  const __CFArray *v4;
  const __CFArray *v5;
  char *bytes;
  char v7;
  CFIndex v8;
  CFIndex v9;
  CFIndex v10;
  const void *ValueAtIndex;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  CFIndex Count;
  CFIndex v20;
  CFIndex v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  _BYTE v30[2];
  _BYTE v31[2];
  __int16 v32;

  cursor = self->_cursor;
  v4 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v5 = v4;
  if (!self->_unicode)
  {
    v30[1] = 0;
    v30[0] = self->_bytes[cursor];
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v20 = Count;
      v21 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v21);
        v22 = (unsigned __int8 *)*((_QWORD *)ValueAtIndex + 2);
        v23 = v30;
        do
        {
          while (1)
          {
            v25 = *v22++;
            v24 = v25;
            v27 = *v23++;
            v26 = v27;
            if (v27 != v24)
              break;
            if (!v24)
              return *((_DWORD *)ValueAtIndex + 2);
          }
        }
        while ((v26 - 97) <= 0x19 && v26 - 32 == v24);
        if (!v26)
          break;
        if (++v21 == v20)
          return 0;
      }
      return *((_DWORD *)ValueAtIndex + 2);
    }
    return 0;
  }
  bytes = self->_bytes;
  v7 = bytes[cursor];
  v32 = 0;
  v31[1] = v7;
  v31[0] = bytes[(cursor + 1)];
  v8 = CFArrayGetCount(v4);
  if (v8 < 1)
    return 0;
  v9 = v8;
  v10 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, v10);
    v12 = (unsigned __int16 *)*((_QWORD *)ValueAtIndex + 2);
    v13 = (unsigned __int16 *)v31;
    do
    {
      while (1)
      {
        v15 = *v12++;
        v14 = v15;
        v17 = *v13++;
        v16 = v17;
        if (v17 != v14)
          break;
        if (!v14)
          return *((_DWORD *)ValueAtIndex + 2);
      }
    }
    while ((v16 - 97) <= 0x19 && v16 - 32 == v14);
    if (!v16)
      break;
    if (++v10 == v9)
      return 0;
  }
  return *((_DWORD *)ValueAtIndex + 2);
}

- (id)nextArraySeperatedByToken:(int)a3 stoppingAt:(int)a4 inEncoding:(unint64_t)a5
{
  void *v9;
  id v10;
  id v11;
  int v12;

  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  -[ABVCardLexer _advancePastLineFoldingSequenceIfNeeded](self, "_advancePastLineFoldingSequenceIfNeeded");
  while ((-[ABVCardLexer tokenAtCursor](self, "tokenAtCursor") & a4) == 0)
  {
    if (self->_length <= self->_cursor)
      break;
    v10 = -[ABVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:](self, "nextStringInEncoding:quotedPrintable:stopTokens:trim:", a5, 0, a4 | a3, 1);
    if (v10)
    {
      v11 = v10;
      if (objc_msgSend(v10, "length"))
        objc_msgSend(v9, "addObject:", v11);
    }
    if ((-[ABVCardLexer tokenAtCursor](self, "tokenAtCursor") & a3) != 0)
    {
      if (self->_unicode)
        v12 = 2;
      else
        v12 = 1;
      self->_cursor += v12;
    }
  }
  return v9;
}

- (id)nextUnicodeBase64Line:(BOOL *)a3
{
  void *v5;
  const __CFArray *v6;
  unint64_t cursor;
  const __CFArray *v8;
  char *bytes;
  unsigned int v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex v13;
  _QWORD *ValueAtIndex;
  uint64_t i;
  int v16;
  int v17;
  int v19;
  _BYTE v21[2];
  __int16 v22;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v6 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v22 = 0;
  cursor = self->_cursor;
  if (self->_length <= cursor)
    return v5;
  v8 = v6;
  do
  {
    bytes = self->_bytes;
    v21[1] = bytes[cursor];
    v10 = cursor + 1;
    self->_cursor = v10;
    v21[0] = bytes[v10];
    Count = CFArrayGetCount(v8);
    if (Count < 1)
    {
LABEL_20:
      objc_msgSend(v5, "appendBytes:length:", v21, 1);
      goto LABEL_23;
    }
    v12 = Count;
    v13 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, v13);
      for (i = 0; ; i += 2)
      {
        v16 = *(unsigned __int16 *)(ValueAtIndex[2] + i);
        v17 = *(unsigned __int16 *)&v21[i];
        if (v17 != v16)
          break;
        if (!*(_WORD *)(ValueAtIndex[2] + i))
          goto LABEL_18;
LABEL_14:
        ;
      }
      if ((v17 - 97) <= 0x19 && v17 - 32 == v16)
        goto LABEL_14;
      if (*(_WORD *)&v21[i])
      {
        if (++v13 != v12)
          continue;
        goto LABEL_20;
      }
      break;
    }
LABEL_18:
    v19 = *((_DWORD *)ValueAtIndex + 2);
    if (v19 == 1025)
    {
      objc_msgSend(v5, "appendBytes:length:", v21, 1);
      *a3 = 1;
      goto LABEL_23;
    }
    if (!v19)
      goto LABEL_20;
    if ((v19 & 0x8000) != 0)
    {
      --self->_cursor;
      return v5;
    }
LABEL_23:
    cursor = self->_cursor + 1;
    self->_cursor = cursor;
  }
  while (self->_length > cursor);
  return v5;
}

- (id)nextSingleByteBase64Line:(BOOL *)a3
{
  void *v5;
  const __CFArray *v6;
  unint64_t cursor;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  _QWORD *ValueAtIndex;
  uint64_t i;
  int v14;
  int v15;
  int v17;
  _BYTE v19[2];

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v6 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v19[1] = 0;
  cursor = self->_cursor;
  if (self->_length <= cursor)
    return v5;
  v8 = v6;
  while (2)
  {
    v19[0] = self->_bytes[cursor];
    Count = CFArrayGetCount(v8);
    if (Count < 1)
    {
LABEL_20:
      objc_msgSend(v5, "appendBytes:length:", v19, 1);
      goto LABEL_23;
    }
    v10 = Count;
    v11 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, v11);
      for (i = 0; ; ++i)
      {
        v14 = *(unsigned __int8 *)(ValueAtIndex[2] + i);
        v15 = v19[i];
        if (v15 != v14)
          break;
        if (!*(_BYTE *)(ValueAtIndex[2] + i))
          goto LABEL_18;
LABEL_14:
        ;
      }
      if ((v15 - 97) <= 0x19 && v15 - 32 == v14)
        goto LABEL_14;
      if (v19[i])
      {
        if (++v11 != v10)
          continue;
        goto LABEL_20;
      }
      break;
    }
LABEL_18:
    v17 = *((_DWORD *)ValueAtIndex + 2);
    if (v17 == 1025)
    {
      objc_msgSend(v5, "appendBytes:length:", v19, 1);
      *a3 = 1;
      goto LABEL_23;
    }
    if (!v17)
      goto LABEL_20;
    if ((v17 & 0x8000) == 0)
    {
LABEL_23:
      cursor = self->_cursor + 1;
      self->_cursor = cursor;
      if (self->_length <= cursor)
        return v5;
      continue;
    }
    return v5;
  }
}

- (id)nextBase64Line:(BOOL *)a3
{
  if (self->_unicode)
    return -[ABVCardLexer nextUnicodeBase64Line:](self, "nextUnicodeBase64Line:", a3);
  else
    return -[ABVCardLexer nextSingleByteBase64Line:](self, "nextSingleByteBase64Line:", a3);
}

- (id)nextBase64Data
{
  id v3;
  id v4;
  unsigned int cursor;
  char v7;

  v7 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  do
  {
    v4 = -[ABVCardLexer nextBase64Line:](self, "nextBase64Line:", &v7);
    if (!v4)
      break;
    objc_msgSend(v3, "appendData:", v4);
    objc_msgSend(v3, "appendData:", ABReturnDelimiterData);
    cursor = self->_cursor;
    -[ABVCardLexer advanceToEOL](self, "advanceToEOL");
    -[ABVCardLexer advancePastEOL](self, "advancePastEOL");
    if (!-[ABVCardLexer advanceToString](self, "advanceToString"))
    {
      v7 = 1;
      self->_cursor = cursor;
      return v3;
    }
  }
  while (!v7);
  return v3;
}

- (void)advanceToPeakPoint
{
  self->_cursor = self->_peakedPoint;
}

- (int)advanceToUnicodeString
{
  const __CFArray *v3;
  unint64_t cursor;
  const __CFArray *v5;
  int v6;
  char *bytes;
  unsigned int v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _BYTE v21[2];
  __int16 v22;

  v3 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v22 = 0;
  cursor = self->_cursor;
  self->_peakedPoint = cursor;
  if (self->_length <= cursor)
  {
LABEL_18:
    v6 = 0;
  }
  else
  {
    v5 = v3;
    v6 = 0;
    while (1)
    {
      bytes = self->_bytes;
      v21[1] = bytes[cursor];
      v8 = cursor + 1;
      self->_peakedPoint = v8;
      v21[0] = bytes[v8];
      Count = CFArrayGetCount(v5);
      if (Count < 1)
        break;
      v10 = Count;
      v11 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v11);
        v13 = (unsigned __int16 *)ValueAtIndex[2];
        v14 = (unsigned __int16 *)v21;
        do
        {
          while (1)
          {
            v16 = *v13++;
            v15 = v16;
            v18 = *v14++;
            v17 = v18;
            if (v18 != v15)
              break;
            if (!v15)
              goto LABEL_16;
          }
        }
        while ((v17 - 97) <= 0x19 && v17 - 32 == v15);
        if (v17)
        {
          if (++v11 != v10)
            continue;
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((_BYTE *)ValueAtIndex + 9) & 0x40) == 0)
        break;
      ++v6;
      cursor = self->_peakedPoint + 1;
      self->_peakedPoint = cursor;
      if (self->_length <= cursor)
        goto LABEL_18;
    }
LABEL_19:
    LODWORD(cursor) = self->_peakedPoint - 1;
    self->_peakedPoint = cursor;
  }
  self->_cursor = cursor;
  return v6;
}

- (int)advanceToSingleByteString
{
  const __CFArray *v3;
  unint64_t cursor;
  const __CFArray *v5;
  int v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _BYTE v19[2];

  v3 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v19[1] = 0;
  cursor = self->_cursor;
  self->_peakedPoint = cursor;
  if (self->_length <= cursor)
  {
LABEL_18:
    v6 = 0;
  }
  else
  {
    v5 = v3;
    v6 = 0;
    while (1)
    {
      v19[0] = self->_bytes[cursor];
      Count = CFArrayGetCount(v5);
      if (Count < 1)
        break;
      v8 = Count;
      v9 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v9);
        v11 = (unsigned __int8 *)ValueAtIndex[2];
        v12 = v19;
        do
        {
          while (1)
          {
            v14 = *v11++;
            v13 = v14;
            v16 = *v12++;
            v15 = v16;
            if (v16 != v13)
              break;
            if (!v13)
              goto LABEL_16;
          }
        }
        while ((v15 - 97) <= 0x19 && v15 - 32 == v13);
        if (v15)
        {
          if (++v9 != v8)
            continue;
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((_BYTE *)ValueAtIndex + 9) & 0x40) == 0)
        break;
      ++v6;
      cursor = self->_peakedPoint + 1;
      self->_peakedPoint = cursor;
      if (self->_length <= cursor)
        goto LABEL_18;
    }
LABEL_19:
    LODWORD(cursor) = self->_peakedPoint;
  }
  self->_cursor = cursor;
  return v6;
}

- (int)advanceToString
{
  if (self->_unicode)
    return -[ABVCardLexer advanceToUnicodeString](self, "advanceToUnicodeString");
  else
    return -[ABVCardLexer advanceToSingleByteString](self, "advanceToSingleByteString");
}

- (BOOL)advanceToToken:(int)a3 throughTypes:(int)a4
{
  int v7;
  int v8;
  BOOL result;
  _BOOL4 v11;

  v7 = 0;
  while (v7 != a3)
  {
    v8 = -[ABVCardLexer nextTokenPeak:](self, "nextTokenPeak:", 0);
    if (v8 == a3)
      break;
    v7 = v8;
    result = 0;
    v11 = (v7 & a4) == 0 && a4 != 0;
    if ((v7 - 65537) < 2 || v11)
      return result;
  }
  return 1;
}

- (BOOL)advanceToEOLUnicode
{
  unint64_t length;
  unint64_t cursor;
  char *bytes;
  unsigned int i;
  int v6;

  length = self->_length;
  cursor = self->_cursor;
  if (length <= cursor)
    return 0;
  bytes = self->_bytes;
  for (i = cursor + 2; ; i += 2)
  {
    v6 = bytes[i - 1] | (bytes[cursor] << 8);
    if (v6 == 10 || v6 == 13)
      break;
    self->_cursor = i;
    cursor = i;
    if (length <= i)
      return 0;
  }
  return 1;
}

- (BOOL)advanceToEOLSingle
{
  unint64_t length;
  unint64_t cursor;
  char *bytes;
  unsigned int i;
  int v6;

  length = self->_length;
  cursor = self->_cursor;
  if (length <= cursor)
    return 0;
  bytes = self->_bytes;
  for (i = cursor + 1; ; ++i)
  {
    v6 = bytes[cursor];
    if (v6 == 10 || v6 == 13)
      break;
    self->_cursor = i;
    cursor = i;
    if (length <= i)
      return 0;
  }
  return 1;
}

- (BOOL)advanceToEOL
{
  if (self->_unicode)
    return -[ABVCardLexer advanceToEOLUnicode](self, "advanceToEOLUnicode");
  else
    return -[ABVCardLexer advanceToEOLSingle](self, "advanceToEOLSingle");
}

- (BOOL)advancePastEOLUnicode
{
  const __CFArray *v3;
  unint64_t cursor;
  const __CFArray *v5;
  char *bytes;
  unsigned int v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  _QWORD *ValueAtIndex;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  BOOL result;
  _BYTE v20[2];
  __int16 v21;

  v3 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v21 = 0;
  cursor = self->_cursor;
  self->_peakedPoint = cursor;
  if (self->_length <= cursor)
  {
LABEL_18:
    result = 0;
  }
  else
  {
    v5 = v3;
    while (1)
    {
      bytes = self->_bytes;
      v20[1] = bytes[cursor];
      v7 = cursor + 1;
      self->_peakedPoint = v7;
      v20[0] = bytes[v7];
      Count = CFArrayGetCount(v5);
      if (Count < 1)
        break;
      v9 = Count;
      v10 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v10);
        v12 = (unsigned __int16 *)ValueAtIndex[2];
        v13 = (unsigned __int16 *)v20;
        do
        {
          while (1)
          {
            v15 = *v12++;
            v14 = v15;
            v17 = *v13++;
            v16 = v17;
            if (v17 != v14)
              break;
            if (!v14)
              goto LABEL_16;
          }
        }
        while ((v16 - 97) <= 0x19 && v16 - 32 == v14);
        if (v16)
        {
          if (++v10 != v9)
            continue;
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((_BYTE *)ValueAtIndex + 9) & 0x80) == 0)
        break;
      cursor = self->_peakedPoint + 1;
      self->_peakedPoint = cursor;
      if (self->_length <= cursor)
        goto LABEL_18;
    }
LABEL_19:
    LODWORD(cursor) = self->_peakedPoint - 1;
    self->_peakedPoint = cursor;
    result = 1;
  }
  self->_cursor = cursor;
  return result;
}

- (BOOL)advancePastEOLSingle
{
  const __CFArray *v3;
  unint64_t peakedPoint;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  _QWORD *ValueAtIndex;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL result;
  _BYTE v18[2];

  self->_peakedPoint = self->_cursor;
  v3 = -[ABVCardLexer tokenSetForLength:](self, "tokenSetForLength:", 1);
  v18[1] = 0;
  peakedPoint = self->_peakedPoint;
  if (self->_length <= peakedPoint)
  {
LABEL_18:
    result = 0;
  }
  else
  {
    v5 = v3;
    while (1)
    {
      v18[0] = self->_bytes[peakedPoint];
      Count = CFArrayGetCount(v5);
      if (Count < 1)
        break;
      v7 = Count;
      v8 = 0;
      while (2)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, v8);
        v10 = (unsigned __int8 *)ValueAtIndex[2];
        v11 = v18;
        do
        {
          while (1)
          {
            v13 = *v10++;
            v12 = v13;
            v15 = *v11++;
            v14 = v15;
            if (v15 != v12)
              break;
            if (!v12)
              goto LABEL_16;
          }
        }
        while ((v14 - 97) <= 0x19 && v14 - 32 == v12);
        if (v14)
        {
          if (++v8 != v7)
            continue;
          goto LABEL_19;
        }
        break;
      }
LABEL_16:
      if ((*((_BYTE *)ValueAtIndex + 9) & 0x80) == 0)
        break;
      peakedPoint = self->_peakedPoint + 1;
      self->_peakedPoint = peakedPoint;
      if (self->_length <= peakedPoint)
        goto LABEL_18;
    }
LABEL_19:
    LODWORD(peakedPoint) = self->_peakedPoint;
    result = 1;
  }
  self->_cursor = peakedPoint;
  return result;
}

- (BOOL)advancePastEOL
{
  if (self->_unicode)
    return -[ABVCardLexer advancePastEOLUnicode](self, "advancePastEOLUnicode");
  else
    return -[ABVCardLexer advancePastEOLSingle](self, "advancePastEOLSingle");
}

- (BOOL)atEOF
{
  unint64_t length;

  length = self->_length;
  return !length || length <= self->_cursor;
}

@end
