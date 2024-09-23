@implementation NSString(CoreRecentsUtilities)

- (uint64_t)cr_rangeOfAddressDomain
{
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v5;
  int64_t v6;
  char v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex v11;
  UniChar v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  UniChar v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  CFIndex v27;
  _OWORD v31[8];
  CFStringRef theString;
  const UniChar *v33;
  const char *v34;
  uint64_t v35;
  CFIndex v36;
  uint64_t v37;
  int64_t v38;
  CFRange v39;
  CFRange v40;

  Length = CFStringGetLength(a1);
  memset(v31, 0, sizeof(v31));
  theString = a1;
  v35 = 0;
  v36 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v33 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v37 = 0;
  v38 = 0;
  v34 = CStringPtr;
  if (Length < 1)
  {
    v10 = -1;
    v6 = Length;
    goto LABEL_43;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = -1;
  do
  {
    if (v6 < 0 || (v11 = v36, v36 <= v6))
    {
      v12 = 0;
    }
    else
    {
      if (v33)
      {
        v12 = v33[v35 + v6];
      }
      else if (v34)
      {
        v12 = v34[v35 + v6];
      }
      else
      {
        if (v38 <= v6 || v5 > v6)
        {
          v13 = v6 - 4;
          if ((unint64_t)v6 < 4)
            v13 = 0;
          if (v13 + 64 < v36)
            v11 = v13 + 64;
          v37 = v13;
          v38 = v11;
          v39.location = v35 + v13;
          v39.length = v11 - v13;
          CFStringGetCharacters(theString, v39, (UniChar *)v31);
          v5 = v37;
        }
        v12 = *((_WORD *)v31 + v6 - v5);
      }
      if (v12 == 92)
      {
        ++v6;
        goto LABEL_34;
      }
    }
    if (v8)
    {
      v8 = v12 != 34;
    }
    else if (v12 == 34)
    {
      v8 = 1;
    }
    else if (v12 == 40)
    {
      v8 = 0;
      ++v9;
    }
    else if (v9)
    {
      v8 = 0;
      v9 -= v12 == 41;
    }
    else if (v12 == 60)
    {
      v9 = 0;
      v8 = 0;
      v10 = -1;
      v7 = 1;
    }
    else if (v12 == 64)
    {
      if (v10 != -1)
        return 0x7FFFFFFFFFFFFFFFLL;
      v9 = 0;
      v8 = 0;
      v10 = v6 + 1;
    }
    else
    {
      if (v12 == 62 && (v7 & 1) != 0)
        goto LABEL_43;
      v9 = 0;
      v8 = 0;
    }
LABEL_34:
    ++v6;
  }
  while (v6 < Length);
  if ((v7 & 1) != 0)
    v6 = -1;
  else
    v6 = Length;
LABEL_43:
  v14 = -v6;
  v15 = v6 + 64;
  v16 = MEMORY[0x1E0C80978];
  while (2)
  {
    v17 = v6;
    if ((unint64_t)v6 >= 5)
      v18 = 5;
    else
      v18 = v6;
    if (v6 != -1 && v6 > v10)
    {
      --v6;
      if (v17 < 1 || v36 < v17)
      {
        v19 = 0;
        goto LABEL_52;
      }
      if (v33)
      {
        v21 = v33[v17 - 1 + v35];
      }
      else if (v34)
      {
        v21 = v34[v35 - 1 + v17];
      }
      else
      {
        if (v38 < v17 || (v22 = v37, v37 >= v17))
        {
          v23 = -v18;
          v24 = v18 + v14;
          v25 = v15 - v18;
          v26 = v17 + v23;
          v27 = v26 + 64;
          if (v26 + 64 >= v36)
            v27 = v36;
          v37 = v26;
          v38 = v27;
          if (v36 < v25)
            v25 = v36;
          v40.length = v25 + v24;
          v40.location = v26 + v35;
          CFStringGetCharacters(theString, v40, (UniChar *)v31);
          v22 = v37;
        }
        v21 = *((_WORD *)&v31[-1] + v17 - v22 + 7);
      }
      v19 = v21;
      if (v21 <= 0x7Fu)
LABEL_52:
        v20 = *(_DWORD *)(v16 + 4 * v19 + 60) & 0x4000;
      else
        v20 = __maskrune(v21, 0x4000uLL);
      ++v14;
      --v15;
      if (!v20)
        break;
      continue;
    }
    break;
  }
  if (v10 == -1 || v17 == -1 || v17 == v10)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v10;
}

- (void)cr_copyStringByDecodingIDNAInRange:()CoreRecentsUtilities
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0)
    return (void *)objc_msgSend(a1, "copy");
  if (_posixLocale_onceToken != -1)
    dispatch_once(&_posixLocale_onceToken, &__block_literal_global_22);
  if (objc_msgSend(a1, "rangeOfString:options:range:locale:", CFSTR("xn--"), 1, a3, a4, _posixLocale__locale) == 0x7FFFFFFFFFFFFFFFLL)
    return (void *)objc_msgSend(a1, "copy");
  else
    return _createStringByApplyingIDNATranslationWithRange(a1, a3, a4, MEMORY[0x1E0DE62A8]);
}

- (void)cr_copyStringByEncodingIDNAInRange:()CoreRecentsUtilities
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0)
    return (void *)objc_msgSend(a1, "copy");
  if (_unsafeDomainNameCharacterSet_onceToken != -1)
    dispatch_once(&_unsafeDomainNameCharacterSet_onceToken, &__block_literal_global_25);
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", _unsafeDomainNameCharacterSet_unsafeDomainNameCharacterSet, 0, a3, a4) == 0x7FFFFFFFFFFFFFFFLL)return (void *)objc_msgSend(a1, "copy");
  else
    return _createStringByApplyingIDNATranslationWithRange(a1, a3, a4, MEMORY[0x1E0DE62A0]);
}

- (uint64_t)cr_copyIDNADecodedEmailAddress
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "cr_rangeOfAddressDomain");
  return objc_msgSend(a1, "cr_copyStringByDecodingIDNAInRange:", v2, v3);
}

- (uint64_t)cr_copyIDNAEncodedEmailAddress
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "cr_rangeOfAddressDomain");
  return objc_msgSend(a1, "cr_copyStringByEncodingIDNAInRange:", v2, v3);
}

- (void)cr_uniqueFilenameWithRespectToFilenames:()CoreRecentsUtilities
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  LODWORD(v5) = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v22 = *MEMORY[0x1E0C80C00];
  do
  {
    while (1)
    {
      if (!v8)
      {
        v8 = a1;
        goto LABEL_12;
      }
      if (v7)
      {
        if (!v6)
          goto LABEL_9;
      }
      else
      {
        v7 = objc_msgSend(a1, "stringByDeletingPathExtension");
        if (!v6)
LABEL_9:
          v6 = (void *)objc_msgSend(a1, "pathExtension");
      }
      v5 = (v5 + 1);
      v9 = objc_msgSend(v6, "length")
         ? objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d.%@"), v7, v5, v6)
         : objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), v7, v5, v16);
      v8 = (void *)v9;
LABEL_12:
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v11 = v8;
      if (!v10)
        break;
      v12 = v10;
      v13 = *(_QWORD *)v18;
LABEL_14:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(a3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "isEqualToString:", v8) & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            goto LABEL_14;
          v11 = v8;
          goto LABEL_21;
        }
      }
    }
LABEL_21:
    ;
  }
  while (!v11);
  return v8;
}

- (uint64_t)cr_lowercaseStringWithStandardLocale
{
  if (cr_lowercaseStringWithStandardLocale_onceToken != -1)
    dispatch_once(&cr_lowercaseStringWithStandardLocale_onceToken, &__block_literal_global_5);
  return objc_msgSend(a1, "lowercaseStringWithLocale:", cr_lowercaseStringWithStandardLocale__someLocale);
}

@end
