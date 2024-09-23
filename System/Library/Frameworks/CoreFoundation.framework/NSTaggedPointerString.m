@implementation NSTaggedPointerString

- (unint64_t)fastestEncoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;

  if (self == a3)
  {
    LOBYTE(v8) = 1;
  }
  else if (a3)
  {
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
      goto LABEL_11;
    v5 = 0;
    v6 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)a3 & 0xC000000000000007) == 0)
      v6 = 0;
    v7 = v6 ^ (unint64_t)a3;
    do
    {
      if ((v7 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v5))
        break;
      ++v5;
    }
    while (v5 != 7);
    LOBYTE(v8) = 0;
    if ((~(_BYTE)v5 & 7) == 0 && ((v5 | v7) & 0x7F80000000000000) == 0x700000000000000)
    {
LABEL_11:
      v8 = _NSIsNSString((uint64_t)a3);
      if (v8)
        LOBYTE(v8) = isEqualToString((uint64_t)self, a3);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v11[0] = 0;
  v11[1] = 0;
  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0;
  v3 = v2 ^ (unint64_t)self;
  v4 = (~(v2 ^ self) & 7) == 0;
  v5 = 0xFFFFFFFFFFFFFFFLL;
  if (v4)
    v5 = 0xFFFFFFFFFFFFFLL;
  v6 = (v3 >> 3) & 0xF;
  v7 = (v5 & (v3 >> 3)) >> 4;
  if (v6 < 8)
  {
    v11[0] = v7;
  }
  else
  {
    v8 = (v3 >> 3) & 0xF;
    if (v6 >= 0xA)
    {
      do
      {
        *(&v10 + v8) = sixBitToCharLookup[v7 & 0x1F];
        v7 >>= 5;
        --v8;
      }
      while (v8);
    }
    else
    {
      do
      {
        *(&v10 + v8) = sixBitToCharLookup[v7 & 0x3F];
        v7 >>= 6;
        --v8;
      }
      while (v8);
    }
  }
  return CFStringHashISOLatin1CString((unsigned __int8 *)v11, v6);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  char v8;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned __int8 *v22;
  const char *CStringPtr;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned __int8 *v29;
  size_t v30;
  int v31;
  int v32;
  BOOL v33;
  BOOL v34;
  int64_t v35;
  objc_super v36;
  objc_super v37;
  _QWORD v38[2];
  _QWORD __s2[3];

  __s2[2] = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 0;
  length = a5.length;
  location = a5.location;
  v8 = a4;
  if (a4 > 3 || !a3 || a6)
  {
    v37.receiver = self;
    v37.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString compare:options:range:locale:](&v37, sel_compare_options_range_locale_);
  }
  __s2[0] = 0;
  __s2[1] = 0;
  v11 = (uint64_t *)MEMORY[0x1E0DE7C58];
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
    goto LABEL_24;
  v12 = 0;
  v13 = *MEMORY[0x1E0DE7C58];
  v14 = (~(unint64_t)a3 & 0xC000000000000007) != 0 ? *MEMORY[0x1E0DE7C58] : 0;
  v15 = v14 ^ (unint64_t)a3;
  v16 = v15 & 7;
  while (v16 != *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v12))
  {
    if (++v12 == 7)
      goto LABEL_24;
  }
  if (v12 == 2)
  {
    v18 = 0xFFFFFFFFFFFFFFFLL;
    if (v16 == 7)
      v18 = 0xFFFFFFFFFFFFFLL;
    v19 = (v15 >> 3) & 0xF;
    v20 = (v18 & (v15 >> 3)) >> 4;
    if (v19 < 8)
    {
      __s2[0] = v20;
      v22 = (unsigned __int8 *)__s2;
    }
    else
    {
      v21 = v19;
      if (v19 >= 0xA)
      {
        do
        {
          v22 = (unsigned __int8 *)__s2;
          *((_BYTE *)__s2 + v21 - 1) = sixBitToCharLookup[v20 & 0x1F];
          v20 >>= 5;
          --v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          v22 = (unsigned __int8 *)__s2;
          *((_BYTE *)__s2 + v21 - 1) = sixBitToCharLookup[v20 & 0x3F];
          v20 >>= 6;
          --v21;
        }
        while (v21);
      }
    }
  }
  else
  {
LABEL_24:
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
    if (!CStringPtr)
    {
      v36.receiver = self;
      v36.super_class = (Class)NSTaggedPointerString;
      return -[NSTaggedPointerString compare:options:range:locale:](&v36, sel_compare_options_range_locale_);
    }
    v22 = (unsigned __int8 *)CStringPtr;
    v19 = objc_msgSend(a3, "length");
    v13 = *v11;
  }
  v38[0] = 0;
  v38[1] = 0;
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v13 = 0;
  v24 = v13 ^ (unint64_t)self;
  v25 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v24 & 7) == 0)
    v25 = 0xFFFFFFFFFFFFFLL;
  v26 = v25 & (v24 >> 3);
  v27 = (v24 >> 3) & 0xF;
  if (v27 < 8)
  {
    v38[0] = v26 >> 4;
  }
  else
  {
    v28 = v26 >> 4;
    if (v27 >= 0xA)
    {
      do
      {
        *((_BYTE *)&v37.super_class + v27 + 7) = sixBitToCharLookup[v28 & 0x1F];
        v28 >>= 5;
        --v27;
      }
      while (v27);
    }
    else
    {
      do
      {
        *((_BYTE *)&v37.super_class + v27 + 7) = sixBitToCharLookup[v28 & 0x3F];
        v28 >>= 6;
        --v27;
      }
      while (v27);
    }
  }
  v29 = (unsigned __int8 *)v38 + location;
  if (length >= v19)
    v30 = v19;
  else
    v30 = length;
  if ((v8 & 1) != 0)
    v31 = _CFStringCompareASCIICaseInsensitive(v29, v22, v30);
  else
    v31 = memcmp(v29, v22, v30);
  v32 = length - v19;
  if (v31)
    v32 = v31;
  v33 = v32 == 0;
  v34 = v32 < 0;
  v35 = -1;
  if (!v34)
    v35 = 1;
  if (v33)
    return 0;
  else
    return v35;
}

- (unint64_t)length
{
  int v2;

  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 7;
  return ((unint64_t)(v2 ^ self) >> 3) & 0xF;
}

- (BOOL)isEqualToString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  if (self == a3)
    return 1;
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
    return isEqualToString((uint64_t)self, a3);
  v3 = 0;
  v4 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0)
    v4 = 0;
  v5 = v4 ^ (unint64_t)a3;
  v6 = (v4 ^ (unint64_t)a3) & 7;
  do
  {
    if (v6 == *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v3))
      break;
    ++v3;
  }
  while (v3 != 7);
  v7 = 0;
  if ((~(_BYTE)v3 & 7) == 0 && ((v3 | v5) & 0x7F80000000000000) == 0x700000000000000)
    return isEqualToString((uint64_t)self, a3);
  return v7;
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  size_t length;
  uint64_t v21;
  const char *v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (a7 || a6 > 5 || ((1 << a6) & 0x32) == 0)
  {
    v23.receiver = self;
    v23.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](&v23, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_, a3, a4, a5, a6, a8.location, a8.length, a9);
  }
  if (!a3)
  {
    v18 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v18 = 7;
    v15 = ((unint64_t)(v18 ^ self) >> 3) & 0xF;
    if (v15 >= a8.length && a8.location <= v15 - a8.length)
    {
      length = a8.length;
      if (!a5)
        goto LABEL_32;
      goto LABEL_31;
    }
LABEL_35:
    v21 = __CFExceptionProem((objc_class *)self, a2);
    v22 = "";
    if (a8.length == 64)
      v22 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu%s"),
      v21,
      a8.location,
      a8.length,
      v15,
      v22);
  }
  v24[0] = 0;
  v24[1] = 0;
  v11 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v11 = 0;
  v12 = v11 ^ (unint64_t)self;
  v13 = (~(v11 ^ self) & 7) == 0;
  v14 = 0xFFFFFFFFFFFFFFFLL;
  if (v13)
    v14 = 0xFFFFFFFFFFFFFLL;
  v15 = (v12 >> 3) & 0xF;
  v16 = (v14 & (v12 >> 3)) >> 4;
  if (v15 < 8)
  {
    v24[0] = v16;
  }
  else
  {
    v17 = (v12 >> 3) & 0xF;
    if (v15 >= 0xA)
    {
      do
      {
        *((_BYTE *)&v23.super_class + v17 + 7) = sixBitToCharLookup[v16 & 0x1F];
        v16 >>= 5;
        --v17;
      }
      while (v17);
    }
    else
    {
      do
      {
        *((_BYTE *)&v23.super_class + v17 + 7) = sixBitToCharLookup[v16 & 0x3F];
        v16 >>= 6;
        --v17;
      }
      while (v17);
    }
  }
  if (v15 < a8.length || a8.location > v15 - a8.length)
    goto LABEL_35;
  if (a8.length >= a4)
    length = a4;
  else
    length = a8.length;
  memmove(a3, (char *)v24 + a8.location, length);
  if (!a5)
    goto LABEL_32;
LABEL_31:
  *a5 = length;
LABEL_32:
  if (a9)
  {
    a9->location = length + a8.location;
    a9->length = a8.length - length;
  }
  return 1;
}

- (const)_fastCStringContents:(BOOL)a3
{
  return 0;
}

- (const)_fastCharacterContents
{
  return 0;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  NSUInteger v10;
  unsigned __int8 *v11;
  unsigned __int16 v12;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = 0;
  v4 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v4 = 0;
  v5 = v4 ^ (unint64_t)self;
  v6 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v5 & 7) == 0)
    v6 = 0xFFFFFFFFFFFFFLL;
  v7 = v6 & (v5 >> 3);
  v8 = (v5 >> 3) & 0xF;
  v9 = v7 >> 4;
  if (v8 < 8)
  {
    v19 = v9;
  }
  else
  {
    v10 = v8;
    if (v8 >= 0xA)
    {
      do
      {
        *((_BYTE *)&v18 + v10 + 7) = sixBitToCharLookup[v9 & 0x1F];
        v9 >>= 5;
        --v10;
      }
      while (v10);
    }
    else
    {
      do
      {
        *((_BYTE *)&v18 + v10 + 7) = sixBitToCharLookup[v9 & 0x3F];
        v9 >>= 6;
        --v10;
      }
      while (v10);
    }
  }
  if (v8 < a4.length || a4.location > v8 - a4.length)
  {
    length = a4.length;
    location = a4.location;
    v15 = v8;
    v16 = __CFExceptionProem((objc_class *)self, a2);
    v17 = "";
    if (length == 64)
      v17 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu%s"),
      v16,
      location,
      length,
      v15,
      v17,
      v19,
      v20,
      v21);
  }
  if (a4.length)
  {
    v11 = (unsigned __int8 *)&v19 + a4.location;
    do
    {
      v12 = *v11++;
      *a3++ = v12;
      --a4.length;
    }
    while (a4.length);
  }
}

- (BOOL)isNSString__
{
  return 1;
}

- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5
{
  char *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  size_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  objc_super v15;
  _QWORD __src[3];

  v5 = a3;
  __src[2] = *MEMORY[0x1E0C80C00];
  if (a5 == 513 || a5 == 134217984 || a5 == 1536)
  {
    __src[0] = 0;
    __src[1] = 0;
    v6 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)self & 0xC000000000000007) == 0)
      v6 = 0;
    v7 = v6 ^ (unint64_t)self;
    v8 = (~(v6 ^ self) & 7) == 0;
    v9 = 0xFFFFFFFFFFFFFFFLL;
    if (v8)
      v9 = 0xFFFFFFFFFFFFFLL;
    v10 = (v7 >> 3) & 0xF;
    v11 = (v9 & (v7 >> 3)) >> 4;
    if (v10 < 8)
    {
      __src[0] = v11;
    }
    else
    {
      v12 = (v7 >> 3) & 0xF;
      if (v10 >= 0xA)
      {
        do
        {
          *((_BYTE *)&v15.super_class + v12 + 7) = sixBitToCharLookup[v11 & 0x1F];
          v11 >>= 5;
          --v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          *((_BYTE *)&v15.super_class + v12 + 7) = sixBitToCharLookup[v11 & 0x3F];
          v11 >>= 6;
          --v12;
        }
        while (v12);
      }
    }
    v13 = v10 <= a4;
    if (v10 <= a4)
    {
      memmove(a3, __src, v10);
      v5 += v10;
    }
    *v5 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString _getCString:maxLength:encoding:](&v15, sel__getCString_maxLength_encoding_, a3, a4);
  }
  return v13;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = 0;
  v3 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v3 = 0;
  v4 = v3 ^ (unint64_t)self;
  v5 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v4 & 7) == 0)
    v5 = 0xFFFFFFFFFFFFFLL;
  v6 = v5 & (v4 >> 3);
  v7 = (v4 >> 3) & 0xF;
  v8 = v6 >> 4;
  if (v7 < 8)
  {
    v15 = v8;
  }
  else
  {
    v9 = v7;
    if (v7 >= 0xA)
    {
      do
      {
        *((_BYTE *)&v14 + v9 + 7) = sixBitToCharLookup[v8 & 0x1F];
        v8 >>= 5;
        --v9;
      }
      while (v9);
    }
    else
    {
      do
      {
        *((_BYTE *)&v14 + v9 + 7) = sixBitToCharLookup[v8 & 0x3F];
        v8 >>= 6;
        --v9;
      }
      while (v9);
    }
  }
  if (v7 <= a3)
  {
    v12 = v7;
    v13 = __CFExceptionProem((objc_class *)self, a2);
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Index %lu out of bounds; string length %lu"),
      v13,
      a3,
      v12,
      v15,
      v16,
      v17);
  }
  return *((unsigned __int8 *)&v15 + a3);
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v11;
  NSUInteger v12;
  unsigned __int8 *v13;
  uint64_t v14;
  NSUInteger v15;
  unint64_t v16;
  id result;
  unint64_t v18;
  NSUInteger v19;
  unint64_t v20;
  NSUInteger location;
  NSUInteger v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  _QWORD v26[3];

  length = a3.length;
  v26[2] = *MEMORY[0x1E0C80C00];
  v26[0] = 0;
  v26[1] = 0;
  v4 = (_QWORD *)MEMORY[0x1E0DE7C58];
  v5 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) != 0)
    v6 = *MEMORY[0x1E0DE7C58];
  else
    v6 = 0;
  v7 = v6 ^ (unint64_t)self;
  v8 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v7 & 7) == 0)
    v8 = 0xFFFFFFFFFFFFFLL;
  v9 = v8 & (v7 >> 3);
  v10 = (v7 >> 3) & 0xF;
  v11 = v9 >> 4;
  if (v10 < 8)
  {
    v26[0] = v11;
  }
  else
  {
    v12 = v10;
    if (v10 >= 0xA)
    {
      do
      {
        *((_BYTE *)&v25 + v12 + 7) = sixBitToCharLookup[v11 & 0x1F];
        v11 >>= 5;
        --v12;
      }
      while (v12);
    }
    else
    {
      do
      {
        *((_BYTE *)&v25 + v12 + 7) = sixBitToCharLookup[v11 & 0x3F];
        v11 >>= 6;
        --v12;
      }
      while (v12);
    }
  }
  if (v10 < a3.length || a3.location > v10 - a3.length)
  {
    location = a3.location;
    v22 = v10;
    v23 = __CFExceptionProem((objc_class *)self, a2);
    v24 = "";
    if (length == 64)
      v24 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu%s"),
      v23,
      location,
      length,
      v22,
      v24);
  }
  if (!a3.length)
    return &stru_1E1337B18;
  v13 = (unsigned __int8 *)v26 + a3.location;
  if ((uint64_t)a3.length < 8)
  {
    v25 = 0;
    __memmove_chk();
    result = 0;
    if ((v25 & 0x8080808080808080) == 0)
    {
      result = (id)((8 * length) | (v25 << 7) | 0x8000000000000002);
      v18 = *v4 ^ (unint64_t)result;
LABEL_30:
      if ((~v18 & 0xC000000000000007) != 0)
        return (id)(v18 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v18 & 7)));
    }
  }
  else
  {
    if (a3.length <= 0xB)
    {
      if (a3.length >= 0xA)
      {
        v14 = 0;
        v19 = a3.length;
        while (1)
        {
          v20 = charToSixBitLookup[*v13];
          if (v20 > 0x1F)
            break;
          v14 = v20 | (32 * v14);
          ++v13;
          if (!--v19)
          {
LABEL_29:
            result = (id)((8 * a3.length) | (v14 << 7) | 0x8000000000000002);
            v18 = (unint64_t)result ^ v5;
            goto LABEL_30;
          }
        }
      }
      else
      {
        v14 = 0;
        v15 = a3.length;
        while (1)
        {
          v16 = charToSixBitLookup[*v13];
          if (v16 > 0x3F)
            break;
          v14 = v16 | (v14 << 6);
          ++v13;
          if (!--v15)
            goto LABEL_29;
        }
      }
    }
    return 0;
  }
  return result;
}

- (const)UTF8String
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  size_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  NSTaggedPointerStringCStringContainer *v10;
  char *v11;
  char v13;
  _QWORD __src[3];

  __src[2] = *MEMORY[0x1E0C80C00];
  __src[0] = 0;
  __src[1] = 0;
  v2 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) == 0)
    v2 = 0;
  v3 = v2 ^ (unint64_t)self;
  v4 = (~(v2 ^ self) & 7) == 0;
  v5 = 0xFFFFFFFFFFFFFFFLL;
  if (v4)
    v5 = 0xFFFFFFFFFFFFFLL;
  v6 = (v3 >> 3) & 0xF;
  v7 = (v5 & (v3 >> 3)) >> 4;
  if (v6 < 8)
  {
    __src[0] = v7;
  }
  else
  {
    v8 = (v3 >> 3) & 0xF;
    if (v6 >= 0xA)
    {
      do
      {
        *(&v13 + v8) = sixBitToCharLookup[v7 & 0x1F];
        v7 >>= 5;
        --v8;
      }
      while (v8);
    }
    else
    {
      do
      {
        *(&v13 + v8) = sixBitToCharLookup[v7 & 0x3F];
        v7 >>= 6;
        --v8;
      }
      while (v8);
    }
  }
  os_unfair_lock_lock_with_options();
  v9 = nextAvailableCacheSlot;
  if (nextAvailableCacheSlot <= 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
LABEL_16:
    v10 = objc_alloc_init(NSTaggedPointerStringCStringContainer);
    goto LABEL_17;
  }
  --nextAvailableCacheSlot;
  v10 = (NSTaggedPointerStringCStringContainer *)cache[v9 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  if (!v10)
    goto LABEL_16;
LABEL_17:
  v11 = (char *)v10 + 8;
  memmove(v11, __src, v6);
  v11[v6] = 0;
  return v11;
}

- (id)lowercaseStringWithLocale:(id)a3
{
  id result;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t i;
  int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned __int8 *v21;
  unint64_t v22;
  unint64_t v23;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
LABEL_2:
    v24.receiver = self;
    v24.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString lowercaseStringWithLocale:](&v24, sel_lowercaseStringWithLocale_, a3);
  }
  v26[0] = 0;
  v26[1] = 0;
  v6 = (_QWORD *)MEMORY[0x1E0DE7C58];
  v7 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) != 0)
    v8 = *MEMORY[0x1E0DE7C58];
  else
    v8 = 0;
  v9 = v8 ^ (unint64_t)self;
  v10 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v9 & 7) == 0)
    v10 = 0xFFFFFFFFFFFFFLL;
  v11 = (v9 >> 3) & 0xF;
  v12 = (v10 & (v9 >> 3)) >> 4;
  if (v11 < 8)
  {
    v26[0] = v12;
    if (!v11)
      return &stru_1E1337B18;
  }
  else
  {
    v13 = v11;
    if (v11 >= 0xA)
    {
      do
      {
        *((_BYTE *)&v25 + v13 + 7) = sixBitToCharLookup[v12 & 0x1F];
        v12 >>= 5;
        --v13;
      }
      while (v13);
    }
    else
    {
      do
      {
        *((_BYTE *)&v25 + v13 + 7) = sixBitToCharLookup[v12 & 0x3F];
        v12 >>= 6;
        --v13;
      }
      while (v13);
    }
  }
  for (i = 0; i != v11; ++i)
  {
    v15 = *((unsigned __int8 *)v26 + i);
    if ((v15 - 65) <= 0x19)
      *((_BYTE *)v26 + i) = v15 + 32;
  }
  if (v11 >= 8)
  {
    if (v11 <= 0xB)
    {
      if (v11 >= 0xA)
      {
        v16 = 0;
        v21 = (unsigned __int8 *)v26;
        v22 = v11;
        while (1)
        {
          v23 = charToSixBitLookup[*v21];
          if (v23 > 0x1F)
            break;
          v16 = v23 | (32 * v16);
          ++v21;
          if (!--v22)
          {
LABEL_33:
            result = (id)((8 * v11) | (v16 << 7) | 0x8000000000000002);
            v20 = (unint64_t)result ^ v7;
            goto LABEL_34;
          }
        }
      }
      else
      {
        v16 = 0;
        v17 = (unsigned __int8 *)v26;
        v18 = v11;
        while (1)
        {
          v19 = charToSixBitLookup[*v17];
          if (v19 > 0x3F)
            break;
          v16 = v19 | (v16 << 6);
          ++v17;
          if (!--v18)
            goto LABEL_33;
        }
      }
    }
    goto LABEL_2;
  }
  v25 = 0;
  __memmove_chk();
  result = 0;
  if ((v25 & 0x8080808080808080) == 0)
  {
    result = (id)((8 * v11) | (v25 << 7) | 0x8000000000000002);
    v20 = *v6 ^ (unint64_t)result;
LABEL_34:
    if ((~v20 & 0xC000000000000007) != 0)
      result = (id)(v20 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v20 & 7)));
  }
  if (!result)
    goto LABEL_2;
  return result;
}

- (id)uppercaseStringWithLocale:(id)a3
{
  id result;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t i;
  int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned __int8 *v21;
  unint64_t v22;
  unint64_t v23;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
LABEL_2:
    v24.receiver = self;
    v24.super_class = (Class)NSTaggedPointerString;
    return -[NSTaggedPointerString uppercaseStringWithLocale:](&v24, sel_uppercaseStringWithLocale_, a3);
  }
  v26[0] = 0;
  v26[1] = 0;
  v6 = (_QWORD *)MEMORY[0x1E0DE7C58];
  v7 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)self & 0xC000000000000007) != 0)
    v8 = *MEMORY[0x1E0DE7C58];
  else
    v8 = 0;
  v9 = v8 ^ (unint64_t)self;
  v10 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v9 & 7) == 0)
    v10 = 0xFFFFFFFFFFFFFLL;
  v11 = (v9 >> 3) & 0xF;
  v12 = (v10 & (v9 >> 3)) >> 4;
  if (v11 < 8)
  {
    v26[0] = v12;
    if (!v11)
      return &stru_1E1337B18;
  }
  else
  {
    v13 = v11;
    if (v11 >= 0xA)
    {
      do
      {
        *((_BYTE *)&v25 + v13 + 7) = sixBitToCharLookup[v12 & 0x1F];
        v12 >>= 5;
        --v13;
      }
      while (v13);
    }
    else
    {
      do
      {
        *((_BYTE *)&v25 + v13 + 7) = sixBitToCharLookup[v12 & 0x3F];
        v12 >>= 6;
        --v13;
      }
      while (v13);
    }
  }
  for (i = 0; i != v11; ++i)
  {
    v15 = *((unsigned __int8 *)v26 + i);
    if ((v15 - 97) <= 0x19)
      *((_BYTE *)v26 + i) = v15 - 32;
  }
  if (v11 >= 8)
  {
    if (v11 <= 0xB)
    {
      if (v11 >= 0xA)
      {
        v16 = 0;
        v21 = (unsigned __int8 *)v26;
        v22 = v11;
        while (1)
        {
          v23 = charToSixBitLookup[*v21];
          if (v23 > 0x1F)
            break;
          v16 = v23 | (32 * v16);
          ++v21;
          if (!--v22)
          {
LABEL_33:
            result = (id)((8 * v11) | (v16 << 7) | 0x8000000000000002);
            v20 = (unint64_t)result ^ v7;
            goto LABEL_34;
          }
        }
      }
      else
      {
        v16 = 0;
        v17 = (unsigned __int8 *)v26;
        v18 = v11;
        while (1)
        {
          v19 = charToSixBitLookup[*v17];
          if (v19 > 0x3F)
            break;
          v16 = v19 | (v16 << 6);
          ++v17;
          if (!--v18)
            goto LABEL_33;
        }
      }
    }
    goto LABEL_2;
  }
  v25 = 0;
  __memmove_chk();
  result = 0;
  if ((v25 & 0x8080808080808080) == 0)
  {
    result = (id)((8 * v11) | (v25 << 7) | 0x8000000000000002);
    v20 = *v6 ^ (unint64_t)result;
LABEL_34:
    if ((~v20 & 0xC000000000000007) != 0)
      result = (id)(v20 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v20 & 7)));
  }
  if (!result)
    goto LABEL_2;
  return result;
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a3 <= 5 && ((1 << a3) & 0x32) != 0)
    return -[NSTaggedPointerString UTF8String](self, "UTF8String");
  v4.receiver = self;
  v4.super_class = (Class)NSTaggedPointerString;
  return -[NSTaggedPointerString cStringUsingEncoding:](&v4, sel_cStringUsingEncoding_);
}

- (BOOL)_isCString
{
  return 1;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_1EDCD1038 = (uint64_t)"NSTaggedPointerString cannot be allocated";
  __break(1u);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (unint64_t)smallestEncoding
{
  return 1;
}

@end
