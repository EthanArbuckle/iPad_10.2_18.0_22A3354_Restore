@implementation NSScanner

+ (NSScanner)scannerWithString:(NSString *)string
{
  return (NSScanner *)(id)objc_msgSend(objc_allocWithZone((Class)NSConcreteScanner), "initWithString:", string);
}

+ (NSScanner)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1)
    v4 = (objc_class *)objc_opt_self();
  return (NSScanner *)NSAllocateObject(v4, 0, a3);
}

- (BOOL)scanString:(NSString *)string intoString:(NSString *)result
{
  NSString *v7;
  NSUInteger v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = -[NSScanner string](self, "string");
  v8 = -[NSScanner scanLocation](self, "scanLocation");
  v9 = -[NSString length](v7, "length");
  v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1 | 8;
  if (v10)
  {
    v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13)
      v8 = v12;
    else
      v8 = v9;
  }
  v14 = -[NSString rangeOfString:options:range:](v7, "rangeOfString:options:range:", string, v11, v8, v9 - v8);
  v16 = v15;
  if (v15)
  {
    v17 = v14 + v15;
    if (result)
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17 - v8);
    -[NSScanner setScanLocation:](self, "setScanLocation:", v17);
  }
  return v16 != 0;
}

- (BOOL)scanUpToString:(NSString *)string intoString:(NSString *)result
{
  NSString *v7;
  NSUInteger v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;

  v7 = -[NSScanner string](self, "string");
  v8 = -[NSScanner scanLocation](self, "scanLocation");
  v9 = -[NSString length](v7, "length");
  v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1;
  if (v10)
  {
    v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13)
      v8 = v12;
    else
      v8 = v9;
  }
  v14 = -[NSString rangeOfString:options:range:](v7, "rangeOfString:options:range:", string, v11, v8, v9 - v8);
  if (v15)
    v16 = v14;
  else
    v16 = v9;
  v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result)
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }
  return v16 != v8;
}

- (NSScanner)initWithString:(NSString *)string
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSScanner;
  return -[NSScanner init](&v4, sel_init, string);
}

- (BOOL)isAtEnd
{
  NSString *v3;
  NSUInteger v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSScanner string](self, "string");
  v4 = -[NSScanner scanLocation](self, "scanLocation");
  v5 = -[NSString length](v3, "length");
  v6 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  if (v6)
  {
    v7 = -[NSString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", v6, 0, v4, v5 - v4);
    if (v8)
      v4 = v7;
    else
      v4 = v5;
  }
  return v4 == v5;
}

- (BOOL)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result
{
  NSString *v7;
  NSUInteger v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;

  v7 = -[NSScanner string](self, "string");
  v8 = -[NSScanner scanLocation](self, "scanLocation");
  v9 = -[NSString length](v7, "length");
  v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1;
  if (v10)
  {
    v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13)
      v8 = v12;
    else
      v8 = v9;
  }
  v14 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", set, v11, v8, v9 - v8);
  if (v15)
    v16 = v14;
  else
    v16 = v9;
  v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result)
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }
  return v16 != v8;
}

- (BOOL)scanFloat:(float *)result
{
  int v5;
  float v6;
  NSUInteger v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x1E0C80C00];
  v9[0] = 0.0;
  v8 = -[NSScanner scanLocation](self, "scanLocation");
  v5 = _NSScanDoubleFromString(-[NSScanner string](self, "string"), -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), v9, &v8, -[NSScanner locale](self, "locale"));
  if (v5)
  {
    if (result)
    {
      v6 = v9[0];
      *result = v6;
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v8);
  }
  return v5;
}

- (BOOL)scanDecimal:(NSDecimal *)dcm
{
  NSUInteger v4;
  NSString *v5;
  NSCharacterSet *v6;
  id v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  size_t v20;
  unsigned __int8 *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  __CFString *v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  void *v34;
  const char *Uid;
  uint64_t v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;
  NSScanner *v42;
  __int16 v43;
  char *v44;
  __int128 v45;
  int v46;
  __int128 v47;
  int v48;
  _OWORD v49[3];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[8];
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v45 = 0uLL;
  v46 = 0;
  v4 = -[NSScanner scanLocation](self, "scanLocation");
  v5 = -[NSScanner string](self, "string");
  v6 = -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped");
  v42 = self;
  v7 = -[NSScanner locale](self, "locale");
  v54 = 0u;
  v52 = 0u;
  memset(v53, 0, sizeof(v53));
  v51 = 0u;
  v44 = (char *)&v50 + 15;
  v47 = 0uLL;
  v48 = 0;
  v8 = objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C997C8]);
  if (!v8)
    v8 = objc_msgSend(v7, "objectForKey:", CFSTR("NSDecimalSeparator"));
  if (v8)
    v9 = (__CFString *)v8;
  else
    v9 = CFSTR(".");
  if (-[__CFString length](v9, "length"))
    v10 = -[__CFString characterAtIndex:](v9, "characterAtIndex:", 0);
  else
    v10 = 46;
  v11 = -[NSString length](v5, "length");
  *((_QWORD *)&v52 + 1) = v11;
  v53[0] = v4;
  *(_QWORD *)&v52 = v5;
  if (v11 <= v4)
  {
    *(_QWORD *)&v51 = 0;
    v13 = 0xFFFFLL;
  }
  else
  {
    if (v11 - v4 >= 0x20)
      v12 = 32;
    else
      v12 = v11 - v4;
    *(_QWORD *)&v51 = v12;
    objc_msgSend(v5, sel_getUid("getCharacters:range:"), &v53[1], v4, v12);
    v13 = LOWORD(v53[1]);
  }
  WORD4(v54) = v13;
  *((_QWORD *)&v51 + 1) = 1;
  if (v6)
  {
    if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:", v13))
    {
      do
      {
        v14 = *((_QWORD *)&v51 + 1);
        if (*((_QWORD *)&v51 + 1) - 1 >= (unint64_t)v51)
          break;
        if (*((_QWORD *)&v51 + 1) >= (unint64_t)v51)
        {
          v16 = v53[0] + v51;
          v17 = *((_QWORD *)&v52 + 1) - (v53[0] + v51);
          if (*((_QWORD *)&v52 + 1) > v53[0] + (_QWORD)v51)
          {
            v53[0] += v51;
            if (v17 >= 0x20)
              v18 = 32;
            else
              v18 = *((_QWORD *)&v52 + 1) - v16;
            *(_QWORD *)&v51 = v18;
            objc_msgSend((id)v52, sel_getUid("getCharacters:range:"), &v53[1], v16, v18);
            WORD4(v54) = v53[1];
            *((_QWORD *)&v51 + 1) = 1;
            continue;
          }
          *((_QWORD *)&v51 + 1) = v51 + 1;
          v15 = -1;
        }
        else
        {
          ++*((_QWORD *)&v51 + 1);
          v15 = *((_WORD *)&v53[1] + v14);
        }
        WORD4(v54) = v15;
      }
      while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
    }
    LODWORD(v13) = WORD4(v54);
    v40 = *((_QWORD *)&v51 + 1) - 1;
  }
  else
  {
    v40 = 0;
  }
  v39 = v53[0];
  v43 = v13;
  if (v13 <= 0x7F && ((v13 - 9) < 5 || (_DWORD)v13 == 32))
    return 0;
  v19 = 0;
  v20 = 0;
  v21 = __NSNumberSet;
  v22 = (char *)v49;
  v23 = (char *)v49;
  while ((unsigned __int16)v13 <= 0x7Fu && ((v21[(unsigned __int16)v13 >> 3] >> (v13 & 7)) & 1) != 0)
  {
LABEL_38:
    if (v22 >= v44)
    {
      v20 += 128;
      if (v19)
      {
        v24 = MEMORY[0x186DA80E4](v19, v20, 3943434182, 0);
        if (!v24)
          return 0;
        v23 = (char *)v24;
        LOBYTE(v13) = v43;
      }
      else
      {
        v23 = (char *)malloc_type_malloc(v20, 0xF5B10660uLL);
        v25 = v50;
        v27 = v49[0];
        v26 = v49[1];
        *((_OWORD *)v23 + 2) = v49[2];
        *((_OWORD *)v23 + 3) = v25;
        *(_OWORD *)v23 = v27;
        *((_OWORD *)v23 + 1) = v26;
        v19 = (char *)v49;
      }
      v22 = &v23[v22 - v19];
      v44 = &v23[v20 - 1];
      v19 = v23;
    }
    *v22++ = v13;
    v28 = *((_QWORD *)&v51 + 1);
    if (*((_QWORD *)&v51 + 1) < (unint64_t)v51)
    {
      ++*((_QWORD *)&v51 + 1);
      LOWORD(v13) = *((_WORD *)&v53[1] + v28);
LABEL_52:
      WORD4(v54) = v13;
      goto LABEL_53;
    }
    v13 = v53[0] + v51;
    v29 = *((_QWORD *)&v52 + 1) - (v53[0] + v51);
    if (*((_QWORD *)&v52 + 1) <= v53[0] + (_QWORD)v51)
    {
      *((_QWORD *)&v51 + 1) = v51 + 1;
      LOWORD(v13) = -1;
      goto LABEL_52;
    }
    v53[0] += v51;
    v30 = v9;
    v31 = v10;
    v32 = v21;
    if (v29 >= 0x20)
      v33 = 32;
    else
      v33 = v29;
    *(_QWORD *)&v51 = v33;
    v34 = (void *)v52;
    Uid = sel_getUid("getCharacters:range:");
    v36 = v33;
    v21 = v32;
    v10 = v31;
    v9 = v30;
    objc_msgSend(v34, Uid, &v53[1], v13, v36);
    LOWORD(v13) = v53[1];
    WORD4(v54) = v53[1];
    *((_QWORD *)&v51 + 1) = 1;
LABEL_53:
    v43 = v13;
  }
  if (_NSCheckDecimalSeparator((uint64_t *)&v51, &v43, v10, v9))
  {
    LOBYTE(v13) = 46;
    v43 = 46;
    goto LABEL_38;
  }
  *v22 = 0;
  _NSCStringToDecimal((uint64_t)v23, &v44, (uint64_t)&v47);
  if (v19)
    free(v19);
  if (v44 == v23)
    return 0;
  v37 = &v44[v40 + v39 - (_QWORD)v23];
  v45 = v47;
  v46 = v48;
  if (dcm)
  {
    *(_OWORD *)dcm = v45;
    *(_DWORD *)&dcm->_mantissa[6] = v46;
  }
  -[NSScanner setScanLocation:](v42, "setScanLocation:", v37);
  return 1;
}

- (BOOL)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result
{
  NSString *v7;
  NSUInteger v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;

  v7 = -[NSScanner string](self, "string");
  v8 = -[NSScanner scanLocation](self, "scanLocation");
  v9 = -[NSString length](v7, "length");
  v10 = -[NSScanner _invertedSkipSet](self, "_invertedSkipSet");
  v11 = -[NSScanner caseSensitive](self, "caseSensitive") ^ 1;
  if (v10)
  {
    v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13)
      v8 = v12;
    else
      v8 = v9;
  }
  v14 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", -[NSCharacterSet invertedSet](set, "invertedSet"), v11, v8, v9 - v8);
  if (v15)
    v16 = v14;
  else
    v16 = v9;
  v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result)
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }
  return v16 != v8;
}

- (BOOL)scanHexInt:(unsigned int *)result
{
  _BOOL4 v4;
  unsigned int v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7[0] = 0;
    v4 = -[NSScanner scanHexLongLong:](self, "scanHexLongLong:", v7);
    if (v4)
    {
      v5 = v7[0];
      if (v7[0] >= 0xFFFFFFFFuLL)
        v5 = -1;
      *result = v5;
      goto LABEL_7;
    }
  }
  else
  {
    v4 = -[NSScanner scanHexLongLong:](self, "scanHexLongLong:");
    if (v4)
LABEL_7:
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)scanHexLongLong:(unint64_t *)result
{
  NSString *v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  __int16 v8;
  NSCharacterSet *v9;
  NSCharacterSet *v10;
  __int128 v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  unint64_t *v33;
  uint64_t v35;
  uint64_t v36;
  __int128 v38;
  NSString *v39;
  unint64_t v40;
  _OWORD v41[4];
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = -[NSScanner string](self, "string");
  v5 = -[NSScanner scanLocation](self, "scanLocation");
  v42 = 0u;
  memset(v41, 0, sizeof(v41));
  v38 = 0u;
  v6 = -[NSString length](v4, "length");
  v40 = v6;
  *(_QWORD *)&v41[0] = v5;
  v39 = v4;
  if (v6 <= v5)
  {
    *(_QWORD *)&v38 = 0;
    v8 = -1;
  }
  else
  {
    if (v6 - v5 >= 0x20)
      v7 = 32;
    else
      v7 = v6 - v5;
    *(_QWORD *)&v38 = v7;
    objc_msgSend(v4, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v5, v7);
    v8 = WORD4(v41[0]);
  }
  WORD4(v42) = v8;
  *((_QWORD *)&v38 + 1) = 1;
  v9 = -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped");
  if (v9)
  {
    v10 = v9;
    if (-[NSCharacterSet characterIsMember:](v9, "characterIsMember:", WORD4(v42)))
    {
      do
      {
        v11 = v38;
        if (*((_QWORD *)&v38 + 1) - 1 >= (unint64_t)v38)
          break;
        if (*((_QWORD *)&v38 + 1) >= (unint64_t)v38)
        {
          v13 = *(_QWORD *)&v41[0] + v38;
          if (v40 > *(_QWORD *)&v41[0] + (_QWORD)v38)
          {
            if (v40 - (*(_QWORD *)&v41[0] + (_QWORD)v38) >= 0x20)
              v14 = 32;
            else
              v14 = v40 - (*(_QWORD *)&v41[0] + v38);
            *(_QWORD *)&v41[0] += v38;
            *(_QWORD *)&v38 = v14;
            objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v13, v14);
            WORD4(v42) = WORD4(v41[0]);
            *((_QWORD *)&v38 + 1) = 1;
            continue;
          }
          *((_QWORD *)&v38 + 1) = v38 + 1;
          v12 = -1;
        }
        else
        {
          ++*((_QWORD *)&v38 + 1);
          v12 = *((_WORD *)v41 + *((_QWORD *)&v11 + 1) + 4);
        }
        WORD4(v42) = v12;
      }
      while (-[NSCharacterSet characterIsMember:](v10, "characterIsMember:"));
    }
  }
  v15 = WORD4(v42);
  if (WORD4(v42) != 48)
  {
    if (WORD4(v42) - 48 > 9)
    {
      if (WORD4(v42) - 65 > 5)
      {
        if (WORD4(v42) - 97 > 5)
          return 0;
        goto LABEL_36;
      }
LABEL_34:
      v21 = v15 - 55;
      goto LABEL_39;
    }
    v21 = WORD4(v42) - 48;
    goto LABEL_39;
  }
  v17 = *((_QWORD *)&v38 + 1);
  v16 = v38;
  if (*((_QWORD *)&v38 + 1) >= (unint64_t)v38)
  {
    v22 = *(_QWORD *)&v41[0] + v38;
    if (v40 <= *(_QWORD *)&v41[0] + (_QWORD)v38)
      goto LABEL_76;
    if (v40 - (*(_QWORD *)&v41[0] + (_QWORD)v38) >= 0x20)
      v23 = 32;
    else
      v23 = v40 - (*(_QWORD *)&v41[0] + v38);
    *(_QWORD *)&v41[0] += v38;
    *(_QWORD *)&v38 = v23;
    objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v22, v23);
    v20 = WORD4(v41[0]);
    WORD4(v42) = WORD4(v41[0]);
    v18 = 1;
    *((_QWORD *)&v38 + 1) = 1;
  }
  else
  {
    v18 = ++*((_QWORD *)&v38 + 1);
    v19 = (char *)&v38 + 2 * v17;
    v20 = *((unsigned __int16 *)v19 + 20);
    WORD4(v42) = *((_WORD *)v19 + 20);
  }
  v21 = v20 - 48;
  if ((v20 - 48) <= 9)
  {
LABEL_39:
    v24 = 0;
    v25 = *((_QWORD *)&v38 + 1);
    while (1)
    {
      v26 = 16 * v24 + v21;
      if (v24 >> 60)
        v24 = -1;
      else
        v24 = v26;
      if (v25 >= (unint64_t)v38)
      {
        v29 = *(_QWORD *)&v41[0];
        v30 = *(_QWORD *)&v41[0] + v38;
        if (v40 <= *(_QWORD *)&v41[0] + (_QWORD)v38)
        {
          v25 = v38 + 1;
          *((_QWORD *)&v38 + 1) = v38 + 1;
          WORD4(v42) = -1;
          goto LABEL_59;
        }
        if (v40 - (*(_QWORD *)&v41[0] + (_QWORD)v38) >= 0x20)
          v31 = 32;
        else
          v31 = v40 - (*(_QWORD *)&v41[0] + v38);
        *(_QWORD *)&v41[0] += v38;
        *(_QWORD *)&v38 = v31;
        objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v30, v31);
        v28 = WORD4(v41[0]);
        WORD4(v42) = WORD4(v41[0]);
        *((_QWORD *)&v38 + 1) = 1;
        v25 = 1;
      }
      else
      {
        v27 = (char *)&v38 + 2 * v25++;
        *((_QWORD *)&v38 + 1) = v25;
        v28 = *((unsigned __int16 *)v27 + 20);
        WORD4(v42) = v28;
      }
      if ((v28 - 48) >= 0xA)
      {
        if ((v28 - 65) >= 6)
        {
          if ((v28 - 97) > 5)
          {
            v29 = *(_QWORD *)&v41[0];
LABEL_59:
            -[NSScanner setScanLocation:](self, "setScanLocation:", v25 + v29 - 1);
            v33 = result;
            if (result)
LABEL_60:
              *v33 = v24;
            return 1;
          }
          v32 = -87;
        }
        else
        {
          v32 = -55;
        }
      }
      else
      {
        v32 = -48;
      }
      v21 = v32 + v28;
    }
  }
  if ((v20 - 65) <= 5)
  {
    v21 = v20 - 55;
    goto LABEL_39;
  }
  if ((v20 - 97) <= 5)
  {
    v21 = v20 - 87;
    goto LABEL_39;
  }
  v22 = v18 + *(_QWORD *)&v41[0] - 1;
  if ((v20 | 0x20) != 0x78)
    goto LABEL_77;
  v16 = v38;
  if (v18 < (unint64_t)v38)
  {
    *((_QWORD *)&v38 + 1) = v18 + 1;
    v15 = *((unsigned __int16 *)v41 + v18 + 4);
    WORD4(v42) = v15;
    goto LABEL_72;
  }
  v35 = v38 + *(_QWORD *)&v41[0];
  if (v40 > (_QWORD)v38 + *(_QWORD *)&v41[0])
  {
    if (v40 - ((_QWORD)v38 + *(_QWORD *)&v41[0]) >= 0x20)
      v36 = 32;
    else
      v36 = v40 - (v38 + *(_QWORD *)&v41[0]);
    *(_QWORD *)&v41[0] += v38;
    *(_QWORD *)&v38 = v36;
    objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v35, v36);
    v15 = WORD4(v41[0]);
    WORD4(v42) = WORD4(v41[0]);
    *((_QWORD *)&v38 + 1) = 1;
LABEL_72:
    v21 = v15 - 48;
    if ((v15 - 48) <= 9)
      goto LABEL_39;
    if ((v15 - 65) > 5)
    {
      if ((v15 - 97) > 5)
        goto LABEL_77;
LABEL_36:
      v21 = v15 - 87;
      goto LABEL_39;
    }
    goto LABEL_34;
  }
LABEL_76:
  *((_QWORD *)&v38 + 1) = v16 + 1;
  WORD4(v42) = -1;
LABEL_77:
  -[NSScanner setScanLocation:](self, "setScanLocation:", v22);
  v33 = result;
  if (result)
  {
    v24 = 0;
    goto LABEL_60;
  }
  return 1;
}

- (BOOL)scanUnsignedLongLong:(unint64_t *)result
{
  NSUInteger v4;
  NSString *v5;
  NSCharacterSet *v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSCharacterSet *v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSCharacterSet *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  NSCharacterSet *v37;
  BOOL v38;
  __int128 v40;
  NSString *v41;
  unint64_t v42;
  _OWORD v43[4];
  UChar32 c[4];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = -[NSScanner scanLocation](self, "scanLocation");
  v5 = -[NSScanner string](self, "string");
  v6 = -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped");
  *(_OWORD *)c = 0u;
  memset(v43, 0, sizeof(v43));
  v40 = 0u;
  v7 = -[NSString length](v5, "length");
  v42 = v7;
  *(_QWORD *)&v43[0] = v4;
  v41 = v5;
  if (v7 <= v4)
  {
    *(_QWORD *)&v40 = 0;
    v9 = 0xFFFF;
  }
  else
  {
    if (v7 - v4 >= 0x20)
      v8 = 32;
    else
      v8 = v7 - v4;
    *(_QWORD *)&v40 = v8;
    objc_msgSend(v5, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v4, v8);
    v9 = WORD4(v43[0]);
  }
  LOWORD(c[2]) = v9;
  *((_QWORD *)&v40 + 1) = 1;
  if (v6)
  {
    if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"))
    {
      do
      {
        v10 = v40;
        if (*((_QWORD *)&v40 + 1) - 1 >= (unint64_t)v40)
          break;
        if (*((_QWORD *)&v40 + 1) >= (unint64_t)v40)
        {
          v12 = *(_QWORD *)&v43[0] + v40;
          if (v42 > *(_QWORD *)&v43[0] + (_QWORD)v40)
          {
            if (v42 - (*(_QWORD *)&v43[0] + (_QWORD)v40) >= 0x20)
              v13 = 32;
            else
              v13 = v42 - (*(_QWORD *)&v43[0] + v40);
            *(_QWORD *)&v43[0] += v40;
            *(_QWORD *)&v40 = v13;
            objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v12, v13);
            LOWORD(c[2]) = WORD4(v43[0]);
            *((_QWORD *)&v40 + 1) = 1;
            continue;
          }
          *((_QWORD *)&v40 + 1) = v40 + 1;
          v11 = -1;
        }
        else
        {
          ++*((_QWORD *)&v40 + 1);
          v11 = *((_WORD *)v43 + *((_QWORD *)&v10 + 1) + 4);
        }
        LOWORD(c[2]) = v11;
      }
      while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
    }
    v9 = LOWORD(c[2]);
  }
  if (v9 != 43)
    goto LABEL_44;
  v14 = v40;
  if (*((_QWORD *)&v40 + 1) >= (unint64_t)v40)
  {
    v16 = *(_QWORD *)&v43[0] + v40;
    if (v42 > *(_QWORD *)&v43[0] + (_QWORD)v40)
    {
      if (v42 - (*(_QWORD *)&v43[0] + (_QWORD)v40) >= 0x20)
        v17 = 32;
      else
        v17 = v42 - (*(_QWORD *)&v43[0] + v40);
      *(_QWORD *)&v43[0] += v40;
      *(_QWORD *)&v40 = v17;
      objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v16, v17);
      LOWORD(c[2]) = WORD4(v43[0]);
      *((_QWORD *)&v40 + 1) = 1;
      if (!v6)
        goto LABEL_44;
      goto LABEL_32;
    }
    *((_QWORD *)&v40 + 1) = v40 + 1;
    v15 = -1;
  }
  else
  {
    ++*((_QWORD *)&v40 + 1);
    v15 = *((_WORD *)v43 + *((_QWORD *)&v14 + 1) + 4);
  }
  LOWORD(c[2]) = v15;
  if (!v6)
    goto LABEL_44;
LABEL_32:
  if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"))
  {
    do
    {
      v18 = v40;
      if (*((_QWORD *)&v40 + 1) - 1 >= (unint64_t)v40)
        break;
      if (*((_QWORD *)&v40 + 1) >= (unint64_t)v40)
      {
        v20 = *(_QWORD *)&v43[0] + v40;
        if (v42 > *(_QWORD *)&v43[0] + (_QWORD)v40)
        {
          if (v42 - (*(_QWORD *)&v43[0] + (_QWORD)v40) >= 0x20)
            v21 = 32;
          else
            v21 = v42 - (*(_QWORD *)&v43[0] + v40);
          *(_QWORD *)&v43[0] += v40;
          *(_QWORD *)&v40 = v21;
          objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v20, v21);
          LOWORD(c[2]) = WORD4(v43[0]);
          *((_QWORD *)&v40 + 1) = 1;
          continue;
        }
        *((_QWORD *)&v40 + 1) = v40 + 1;
        v19 = -1;
      }
      else
      {
        ++*((_QWORD *)&v40 + 1);
        v19 = *((_WORD *)v43 + *((_QWORD *)&v18 + 1) + 4);
      }
      LOWORD(c[2]) = v19;
    }
    while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
  }
LABEL_44:
  v22 = LOWORD(c[2]);
  v23 = (NSCharacterSet *)isADigit_set;
  if (!isADigit_set)
  {
    v23 = +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet");
    isADigit_set = (uint64_t)v23;
  }
  v24 = -[NSCharacterSet characterIsMember:](v23, "characterIsMember:", v22);
  if (v24)
  {
    v38 = v24;
    v25 = 0;
    while (1)
    {
      if (v25 > 0x1999999999999998)
      {
        if (v25 != 0x1999999999999999)
          goto LABEL_53;
        v26 = LOWORD(c[2]) - 48;
        if (v26 > 9)
          v26 = u_charDigitValue(LOWORD(c[2]));
        if (v26 >= 5)
        {
LABEL_53:
          while (1)
          {
            v27 = v40;
            if (*((_QWORD *)&v40 + 1) >= (unint64_t)v40)
            {
              v29 = *(_QWORD *)&v43[0] + v40;
              if (v42 > *(_QWORD *)&v43[0] + (_QWORD)v40)
              {
                if (v42 - (*(_QWORD *)&v43[0] + (_QWORD)v40) >= 0x20)
                  v30 = 32;
                else
                  v30 = v42 - (*(_QWORD *)&v43[0] + v40);
                *(_QWORD *)&v43[0] += v40;
                *(_QWORD *)&v40 = v30;
                objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v29, v30);
                v28 = WORD4(v43[0]);
                LOWORD(c[2]) = WORD4(v43[0]);
                *((_QWORD *)&v40 + 1) = 1;
                goto LABEL_62;
              }
              *((_QWORD *)&v40 + 1) = v40 + 1;
              v28 = 0xFFFFLL;
            }
            else
            {
              ++*((_QWORD *)&v40 + 1);
              v28 = *((unsigned __int16 *)v43 + *((_QWORD *)&v27 + 1) + 4);
            }
            LOWORD(c[2]) = v28;
LABEL_62:
            v31 = (NSCharacterSet *)isADigit_set;
            if (!isADigit_set)
            {
              v31 = +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet");
              isADigit_set = (uint64_t)v31;
            }
            if (!-[NSCharacterSet characterIsMember:](v31, "characterIsMember:", v28))
            {
              v25 = -1;
              v32 = LOWORD(c[2]);
              goto LABEL_77;
            }
          }
        }
      }
      v33 = LOWORD(c[2]) - 48;
      if (v33 > 9)
        v33 = u_charDigitValue(LOWORD(c[2]));
      v25 = v33 + 10 * v25;
      v34 = v40;
      if (*((_QWORD *)&v40 + 1) >= (unint64_t)v40)
      {
        v35 = *(_QWORD *)&v43[0] + v40;
        if (v42 > *(_QWORD *)&v43[0] + (_QWORD)v40)
        {
          if (v42 - (*(_QWORD *)&v43[0] + (_QWORD)v40) >= 0x20)
            v36 = 32;
          else
            v36 = v42 - (*(_QWORD *)&v43[0] + v40);
          *(_QWORD *)&v43[0] += v40;
          *(_QWORD *)&v40 = v36;
          objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v35, v36);
          v32 = WORD4(v43[0]);
          LOWORD(c[2]) = WORD4(v43[0]);
          *((_QWORD *)&v40 + 1) = 1;
          goto LABEL_77;
        }
        *((_QWORD *)&v40 + 1) = v40 + 1;
        v32 = 0xFFFFLL;
      }
      else
      {
        ++*((_QWORD *)&v40 + 1);
        v32 = *((unsigned __int16 *)v43 + *((_QWORD *)&v34 + 1) + 4);
      }
      LOWORD(c[2]) = v32;
LABEL_77:
      v37 = (NSCharacterSet *)isADigit_set;
      if (!isADigit_set)
      {
        v37 = +[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet");
        isADigit_set = (uint64_t)v37;
      }
      if (!-[NSCharacterSet characterIsMember:](v37, "characterIsMember:", v32))
      {
        if (result)
          *result = v25;
        -[NSScanner setScanLocation:](self, "setScanLocation:", *(_QWORD *)&v43[0] + *((_QWORD *)&v40 + 1) - 1);
        return v38;
      }
    }
  }
  return v24;
}

- (BOOL)scanDouble:(double *)result
{
  int v5;
  unint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  v5 = _NSScanDoubleFromString(-[NSScanner string](self, "string"), -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), result, v7, -[NSScanner locale](self, "locale"));
  if (v5)
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  return v5;
}

- (id)_remainingString
{
  NSString *v3;
  NSUInteger v4;

  v3 = -[NSScanner string](self, "string");
  v4 = -[NSScanner scanLocation](self, "scanLocation");
  return -[NSString substringWithRange:](v3, "substringWithRange:", v4, -[NSString length](v3, "length") - v4);
}

- (BOOL)_scanDecimal:(unint64_t)a3 into:(int64_t *)a4
{
  NSUInteger v7;
  NSString *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unsigned int v13;

  v7 = -[NSScanner scanLocation](self, "scanLocation");
  v8 = -[NSScanner string](self, "string");
  v9 = -[NSString length](v8, "length");
  if (a3)
  {
    v10 = 0;
    v11 = 0;
    if (v9 >= v7)
      v12 = v9 - v7;
    else
      v12 = 0;
    while (1)
    {
      if (v12 == v10)
        goto LABEL_9;
      v13 = -[NSString characterAtIndex:](v8, "characterAtIndex:", v7 + v10);
      if (v13 - 58 < 0xFFFFFFF6)
        break;
      v11 = 10 * v11 + v13 - 48;
      if (a3 == ++v10)
      {
        v12 = a3;
LABEL_9:
        if (!v12)
          return 0;
LABEL_10:
        -[NSScanner setScanLocation:](self, "setScanLocation:", v12 + v7);
        *a4 = v11;
        return 1;
      }
    }
    v12 = v10;
    if (v10)
      goto LABEL_10;
  }
  return 0;
}

+ (id)localizedScannerWithString:(NSString *)string
{
  id v3;

  v3 = (id)objc_msgSend(objc_allocWithZone((Class)NSConcreteScanner), "initWithString:", string);
  objc_msgSend(v3, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_allocWithZone((Class)NSConcreteScanner), "initWithString:", -[NSScanner string](self, "string"));
  objc_msgSend(v4, "setCharactersToBeSkipped:", -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"));
  objc_msgSend(v4, "setScanLocation:", -[NSScanner scanLocation](self, "scanLocation"));
  objc_msgSend(v4, "setCaseSensitive:", -[NSScanner caseSensitive](self, "caseSensitive"));
  objc_msgSend(v4, "setLocale:", -[NSScanner locale](self, "locale"));
  return v4;
}

- (id)_invertedSkipSet
{
  return -[NSCharacterSet invertedSet](-[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), "invertedSet");
}

- (BOOL)scanHexDouble:(double *)result
{
  int v5;
  unint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  v5 = _NSScanHexDoubleFromString(-[NSScanner string](self, "string"), -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), result, v7, -[NSScanner locale](self, "locale"));
  if (v5)
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  return v5;
}

- (BOOL)scanHexFloat:(float *)result
{
  int v5;
  float v6;
  NSUInteger v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x1E0C80C00];
  v9[0] = 0.0;
  v8 = -[NSScanner scanLocation](self, "scanLocation");
  v5 = _NSScanHexDoubleFromString(-[NSScanner string](self, "string"), -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), v9, &v8, -[NSScanner locale](self, "locale"));
  if (v5)
  {
    if (result)
    {
      v6 = v9[0];
      *result = v6;
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v8);
  }
  return v5;
}

- (BOOL)scanLongLong:(uint64_t *)result
{
  int v5;
  unint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  v5 = _NSScanLongLongFromString(-[NSScanner string](self, "string"), -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), result, v7);
  if (v5)
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  return v5;
}

- (BOOL)scanInt:(int *)result
{
  int v5;
  unint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = -[NSScanner scanLocation](self, "scanLocation");
  v5 = _NSScanIntFromString(-[NSScanner string](self, "string"), -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"), result, v7);
  if (v5)
    -[NSScanner setScanLocation:](self, "setScanLocation:", v7[0]);
  return v5;
}

- (NSCharacterSet)charactersToBeSkipped
{
  return +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet");
}

- (BOOL)caseSensitive
{
  return 0;
}

- (id)locale
{
  return 0;
}

- (NSString)string
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSScanner"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setScanLocation:(NSUInteger)scanLocation
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSScanner"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSUInteger)scanLocation
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSScanner"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setCharactersToBeSkipped:(NSCharacterSet *)charactersToBeSkipped
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSScanner"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCaseSensitive:(BOOL)caseSensitive
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSScanner"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setLocale:(id)locale
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSScanner"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end
