@implementation NSString(EmailFoundationAdditions)

- (id)ef_sanitizedFileName
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ef_UUID
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)ef_quotedSQLEscapedString
{
  return objc_msgSend(a1, "_ef_sqliteFormattedWithFormatSpecifier:", "%Q");
}

- (id)_ef_sqliteFormattedWithFormatSpecifier:()EmailFoundationAdditions
{
  char *v3;

  v3 = sqlite3_mprintf(a3, objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:deallocator:", v3, strlen(v3), 4, &__block_literal_global_21);
}

- (BOOL)ef_caseInsensitiveIsEqualToString:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "compare:options:", a3, 1) == 0;
}

- (id)ef_md5Digest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ef_md5Digest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ef_substringWithIndexes:()EmailFoundationAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  v4 = a3;
  if (objc_msgSend(v4, "rangeCount") == 1)
  {
    v5 = objc_msgSend(v4, "rangeAtIndex:", 0);
    objc_msgSend(a1, "substringWithRange:", v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__NSString_EmailFoundationAdditions__ef_substringWithIndexes___block_invoke;
    v11[3] = &unk_1E62A68A8;
    v9 = v8;
    v12 = v9;
    v13 = a1;
    objc_msgSend(v4, "enumerateRangesUsingBlock:", v11);
    v7 = v9;

  }
  return v7;
}

- (id)ef_sha256Digest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ef_sha256Digest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)ef_SQLEscapedString
{
  return objc_msgSend(a1, "_ef_sqliteFormattedWithFormatSpecifier:", "%q");
}

- (id)ef_sha256String
{
  const char *v1;
  __int128 v2;
  CC_LONG v3;
  void *v4;
  uint64_t i;
  void *v6;
  unsigned __int8 md[16];
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)md = v2;
  v9 = v2;
  v3 = strlen(v1);
  CC_SHA256(v1, v3, md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ef_firstStrongDirectionalityIsLeftToRight
{
  uint64_t v2;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v5;
  __int128 v6;
  int64_t v7;
  UniChar v8;
  UniChar v9;
  uint64_t v10;
  uint64_t UnicodePropertyDataForPlane;
  unsigned int v12;
  int64_t v14;
  int64_t v15;
  int64_t v17;
  int64_t v18;
  UniChar v19;
  int64_t v20;
  int64_t v21;
  _OWORD v23[8];
  CFStringRef theString;
  const UniChar *v25;
  const char *v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  CFRange v31;
  CFRange v32;

  v2 = -[__CFString length](a1, "length");
  theString = a1;
  v27 = 0;
  v28 = v2;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v25 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v29 = 0;
  v30 = 0;
  v26 = CStringPtr;
  if (v2 >= 1)
  {
    v5 = 0;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v23[6] = v6;
    v23[7] = v6;
    v23[4] = v6;
    v23[5] = v6;
    v23[2] = v6;
    v23[3] = v6;
    v23[0] = v6;
    v23[1] = v6;
    do
    {
      if (v5 < 0 || (v7 = v28, v28 <= v5))
      {
        v9 = 0;
      }
      else
      {
        if (v25)
        {
          v8 = v25[v27 + v5];
        }
        else if (v26)
        {
          v8 = v26[v27 + v5];
        }
        else
        {
          if (v30 <= v5 || (v14 = v29, v29 > v5))
          {
            v15 = v5 - 4;
            if ((unint64_t)v5 < 4)
              v15 = 0;
            if (v15 + 64 < v28)
              v7 = v15 + 64;
            v29 = v15;
            v30 = v7;
            v31.location = v27 + v15;
            v31.length = v7 - v15;
            CFStringGetCharacters(theString, v31, (UniChar *)v23);
            v14 = v29;
          }
          v8 = *((_WORD *)v23 + v5 - v14);
        }
        v9 = v8;
        if (v8 >> 10 == 54 && v5 < v2 - 1)
        {
          v17 = v5 + 1;
          v18 = v28;
          if (v28 <= v5 + 1)
            goto LABEL_50;
          if (v25)
          {
            v19 = v25[v27 + v17];
          }
          else if (v26)
          {
            v19 = v26[v27 + v17];
          }
          else
          {
            if (v30 <= v17 || (v20 = v29, v29 > v17))
            {
              v21 = v5 - 3;
              if ((unint64_t)v5 < 3)
                v21 = 0;
              if (v21 + 64 < v28)
                v18 = v21 + 64;
              v29 = v21;
              v30 = v18;
              v32.location = v27 + v21;
              v32.length = v18 - v21;
              CFStringGetCharacters(theString, v32, (UniChar *)v23);
              v20 = v29;
            }
            v19 = *((_WORD *)v23 + v17 - v20);
          }
          if (v19 >> 10 != 55)
          {
LABEL_50:
            ++v5;
            goto LABEL_18;
          }
          v9 = (v9 << 10) + v19 + 9216;
          ++v5;
        }
      }
      v10 = 1;
      UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
      if (!UnicodePropertyDataForPlane)
        return v10;
      v12 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v9));
      if (v12 >= 0x13)
        v12 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + (v12 << 8) - 4864 + v9 + 256);
      if (v12 == 1)
        return v10;
      if (v12 == 2 || v12 == 5)
        return 0;
LABEL_18:
      ++v5;
    }
    while (v5 < v2);
  }
  return 1;
}

- (uint64_t)ef_lastStrongDirectionalityIsLeftToRight
{
  uint64_t v2;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  UniChar v8;
  uint64_t v9;
  uint64_t UnicodePropertyDataForPlane;
  unsigned int v11;
  UniChar v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  UniChar v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v22[8];
  CFStringRef theString;
  const UniChar *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFRange v30;
  CFRange v31;

  v2 = -[__CFString length](a1, "length");
  theString = a1;
  v26 = 0;
  v27 = v2;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0;
  v24 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v28 = 0;
  v29 = 0;
  v25 = CStringPtr;
  if (v2 >= 1)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22[6] = v5;
    v22[7] = v5;
    v22[4] = v5;
    v22[5] = v5;
    v22[2] = v5;
    v22[3] = v5;
    v22[0] = v5;
    v22[1] = v5;
    do
    {
      v6 = v2 - 1;
      v7 = v27;
      if (v27 >= v2)
      {
        if (v24)
        {
          v13 = v24[v26 + v6];
        }
        else if (v25)
        {
          v13 = v25[v26 + v6];
        }
        else
        {
          v14 = v28;
          if (v29 < v2 || v28 >= v2)
          {
            v16 = v2 - 5;
            if ((unint64_t)v2 < 5)
              v16 = 0;
            if (v16 + 64 < v27)
              v7 = v16 + 64;
            v28 = v16;
            v29 = v7;
            v30.location = v26 + v16;
            v30.length = v7 - v16;
            CFStringGetCharacters(theString, v30, (UniChar *)v22);
            v14 = v28;
          }
          v13 = *((_WORD *)v22 + v6 - v14);
        }
        v8 = v13;
        if (v2 != 1 && (v13 & 0xFC00) == 0xDC00)
        {
          v6 = v2 - 2;
          v17 = v27;
          if (v27 <= v2 - 2)
            goto LABEL_15;
          if (v24)
          {
            v18 = v24[v26 + v6];
          }
          else if (v25)
          {
            v18 = v25[v26 + v6];
          }
          else
          {
            if (v29 <= v6 || (v19 = v28, v28 > v6))
            {
              v20 = v2 - 6;
              if ((unint64_t)v6 < 4)
                v20 = 0;
              if (v20 + 64 < v27)
                v17 = v20 + 64;
              v28 = v20;
              v29 = v17;
              v31.location = v26 + v20;
              v31.length = v17 - v20;
              CFStringGetCharacters(theString, v31, (UniChar *)v22);
              v19 = v28;
            }
            v18 = *((_WORD *)v22 + v6 - v19);
          }
          if (v18 >> 10 != 54)
            goto LABEL_15;
          v8 += (v18 << 10) + 9216;
        }
      }
      else
      {
        v8 = 0;
      }
      v9 = 1;
      UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
      if (!UnicodePropertyDataForPlane)
        return v9;
      v11 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v8));
      if (v11 >= 0x13)
        v11 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + (v11 << 8) - 4864 + v8 + 256);
      if (v11 == 1)
        return v9;
      if (v11 == 2 || v11 == 5)
        return 0;
LABEL_15:
      v2 = v6;
    }
    while (v6 >= 1);
  }
  return 1;
}

- (_BYTE)ef_sqliteAllocatedStringWithHexFromUTF8
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  __int128 v10;
  unint64_t i;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[16];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  if (v2)
  {
    v3 = v2;
    v4 = a1;
  }
  else
  {
    objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:", 4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
    v3 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);

  }
  v6 = sqlite3_malloc64((2 * v3) | 1);
  v7 = objc_msgSend(v4, "length");
  v14 = 0;
  v15 = v7;
  v8 = v6;
  if (v7)
  {
    v9 = v6;
    do
    {
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v16[14] = v10;
      v16[15] = v10;
      v16[12] = v10;
      v16[13] = v10;
      v16[10] = v10;
      v16[11] = v10;
      v16[8] = v10;
      v16[9] = v10;
      v16[7] = v10;
      v16[5] = v10;
      v16[6] = v10;
      v16[3] = v10;
      v16[4] = v10;
      v16[1] = v10;
      v16[2] = v10;
      v16[0] = v10;
      v13 = 0;
      objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v16, 256, &v13, 4, 0, v14, v7, &v14);
      if (v13)
      {
        for (i = 0; i < v13; ++i)
        {
          *v9 = a0123456789abcd[(unint64_t)*((unsigned __int8 *)v16 + i) >> 4];
          v8 = v9 + 2;
          v9[1] = a0123456789abcd[*((_BYTE *)v16 + i) & 0xF];
          v9 += 2;
        }
      }
      else
      {
        v8 = v9;
      }
      v7 = v15;
      v9 = v8;
    }
    while (v15);
  }
  *v8 = 0;

  return v6;
}

- (id)ef_stringByRemovingQuotedSubstringsForLocales:()EmailFoundationAdditions tokenizationHandler:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB38E8], "ef_regularExpressionForQuotedStringsInLocales:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_stringByRemovingTokensFromString:matchingOptions:tokenizationOptions:tokenizationHandler:", a1, 0, 3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ef_stringByRemovingUnbalancedOpenQuote:()EmailFoundationAdditions closeQuote:
{
  id v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;

  v6 = a3;
  v36 = a4;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = objc_msgSend(a1, "length");
  v7 = 0;
  v33 = objc_msgSend(v6, "isEqualToString:", v36);
  v8 = v33 ^ 1;
  v9 = 1;
  v10 = v34;
  do
  {
    while (1)
    {
      if ((v9 & 1) != 0)
      {
        v11 = objc_msgSend(a1, "rangeOfString:options:range:", v6, 0, v7, v10);
        v13 = v12;
        if ((v8 & 1) == 0)
          goto LABEL_4;
      }
      else
      {
        v13 = 0;
        v11 = 0x7FFFFFFFFFFFFFFFLL;
        if ((v8 & 1) == 0)
        {
LABEL_4:
          v14 = 0;
          v15 = 0x7FFFFFFFFFFFFFFFLL;
          if (!v13)
            goto LABEL_11;
          goto LABEL_8;
        }
      }
      v15 = objc_msgSend(a1, "rangeOfString:options:range:", v36, 0, v7, v10);
      v14 = v16;
      if (!v13)
        goto LABEL_11;
LABEL_8:
      if (v14)
      {
        v17 = v36;
        if (v11 <= v15)
        {
          v17 = v6;
          v14 = v13;
          v15 = v11;
        }
        goto LABEL_14;
      }
LABEL_11:
      if (v13)
      {
        v8 = 0;
        v17 = v6;
        v15 = v11;
        v14 = v13;
        goto LABEL_14;
      }
      v9 = 0;
      v17 = v36;
      if (!v14)
        break;
LABEL_14:
      v18 = v17;
      if (v18)
      {
        v19 = v18;
        if (objc_msgSend(v18, "isEqualToString:", v6))
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v15, v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v20, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v21);
        }
        else
        {
          objc_msgSend(v35, "lastObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v22;
          if (v22)
          {
            objc_msgSend(v22, "second");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v6);

            if (v24)
            {
              objc_msgSend(v35, "removeLastObject");
LABEL_22:

              v7 = v15 + v14;
              v10 = v34 - (v15 + v14);

              goto LABEL_23;
            }
          }
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v15, v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v21, v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v25);

        }
        goto LABEL_22;
      }
LABEL_23:
      if ((v9 & 1) == 0)
        goto LABEL_24;
    }
    v8 = 0;
LABEL_24:
    ;
  }
  while ((v8 & 1) != 0);
  v26 = objc_msgSend(v35, "count");
  if (v26)
  {
    if (v33)
    {
      if ((v26 & 1) == 0)
        goto LABEL_30;
      v28 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v35, "lastObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "arrayWithObject:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v35 = (id)v30;
    }
    v31 = (void *)objc_msgSend(a1, "mutableCopy");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __88__NSString_EmailFoundationAdditions__ef_stringByRemovingUnbalancedOpenQuote_closeQuote___block_invoke;
    v37[3] = &unk_1E62A6830;
    v27 = v31;
    v38 = v27;
    objc_msgSend(v35, "enumerateObjectsWithOptions:usingBlock:", 2, v37);

  }
  else
  {
LABEL_30:
    v27 = a1;
  }

  return v27;
}

- (id)ef_stringByRemovingUnbalancedQuotesForLanguages:()EmailFoundationAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "ef_quotePairsForLanguages:", a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(v10, "first", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "second");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "ef_stringByRemovingUnbalancedOpenQuote:closeQuote:", v11, v12);
        v4 = (id)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v4;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)ef_stringByRemovingTokenizedLinksUsingTokenizationHandler:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3560]), "initWithTypes:error:", 32, 0);
  objc_msgSend(v5, "ef_stringByRemovingTokensFromString:matchingOptions:tokenizationOptions:tokenizationHandler:", a1, 16, 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)ef_stringByRemovingQuotesForLanguages:()EmailFoundationAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "ef_quotePairsForLanguages:", a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "first", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v10, &stru_1E62A84D8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "second");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", v12, &stru_1E62A84D8);
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)ef_stringByTrimmingOuterQuotes
{
  id v1;
  int v2;
  int v3;
  uint64_t v4;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") >= 2)
  {
    if ((v2 = objc_msgSend(v1, "characterAtIndex:", 0),
          v3 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1),
          v2 == 39)
      && v3 == 39
      || v2 == 34 && v3 == 34)
    {
      objc_msgSend(v1, "substringWithRange:", 1, objc_msgSend(v1, "length") - 2);
      v4 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v4;
    }
  }
  return v1;
}

- (id)ef_stringByRemovingCharactersInSet:()EmailFoundationAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsJoinedByString:", &stru_1E62A84D8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ef_stringByRemovingCharactersInSet:()EmailFoundationAdditions beforeOccurrencesOfString:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "ef_removeCharactersInSet:beforeOccurrencesOfString:", v6, v7);

  return v8;
}

- (id)ef_stringByReplacingContiguousSequencesOfCharactersInSet:()EmailFoundationAdditions withString:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "ef_replaceContiguousSequencesOfCharactersInSet:withString:", v6, v7);

  return v8;
}

- (id)ef_stringByTrimmingLeadingCharactersInSet:()EmailFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "ef_trimLeadingCharactersInSet:", v4);

  return v5;
}

- (__CFString)ef_stringByTrimmingTrailingCharactersInSet:()EmailFoundationAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;

  objc_msgSend(a3, "invertedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:", v4, 4);
  v7 = v6;

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = &stru_1E62A84D8;
  }
  else if (v5 + v7 == objc_msgSend(a1, "length"))
  {
    v8 = (__CFString *)objc_msgSend(a1, "copy");
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", v5 + v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)ef_stringByRFC5322Unfolding
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "ef_rfc5322Unfold");
  return v1;
}

- (id)ef_componentsSeparatedByString:()EmailFoundationAdditions maxSeparations:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    objc_msgSend(a1, "componentsSeparatedByString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") <= (unint64_t)(a4 + 1))
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "mutableCopy");

      objc_msgSend(v7, "subarrayWithRange:", a4, objc_msgSend(v7, "count") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsJoinedByString:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "addObject:", v11);
    }

  }
  else
  {
    v13[0] = a1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions
{
  objc_msgSend(a1, "ef_wordComponentsForLocale:minimumWordLength:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions minimumWordLength:
{
  objc_msgSend(a1, "ef_wordComponentsForLocale:minimumWordLength:componentLimit:remainingString:", a3, a4, -1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ef_wordComponentsForLocale:()EmailFoundationAdditions minimumWordLength:componentLimit:remainingString:
{
  const __CFLocale *v10;
  __CFStringTokenizer *v11;
  void *v12;
  id v13;
  CFRange CurrentTokenRange;
  void *v15;
  void *v16;
  uint64_t v17;
  CFIndex location;
  void *v19;
  void *v20;
  void *v21;
  const __CFLocale *v23;
  _QWORD v24[2];
  CFRange v25;

  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v25.length = CFStringGetLength(a1);
  v25.location = 0;
  v11 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v25, 4uLL, v10);
  if (v11)
  {
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    while (CFStringTokenizerAdvanceToNextToken(v11) && objc_msgSend(v13, "count") < a5)
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v11);
      if (CurrentTokenRange.length >= a4)
      {
        -[__CFString substringWithRange:](a1, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
          objc_msgSend(v13, "addObject:", v15);

      }
    }
    if (a6)
    {
      location = CFStringTokenizerGetCurrentTokenRange(v11).location;
      if (location != -1)
      {
        -[__CFString substringFromIndex:](a1, "substringFromIndex:", location);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ef_stringByTrimmingLeadingCharactersInSet:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "length"))
        {
          v21 = v20;
LABEL_18:
          CFRelease(v11);
          if (a6)
            *a6 = objc_retainAutorelease(v21);

          v10 = v23;
          goto LABEL_21;
        }

      }
    }
    v21 = 0;
    goto LABEL_18;
  }
  if (a6)
    *a6 = 0;
  v24[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v13;
}

- (id)ef_quotedWordComponentsForLanguages:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "ef_localesFromLanguages:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "ef_regularExpressionForQuotedStringsInLocales:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__NSString_EmailFoundationAdditions__ef_quotedWordComponentsForLanguages___block_invoke;
  v14[3] = &unk_1E62A6858;
  v8 = v4;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v6, "ef_enumerateTokensInString:options:usingBlock:", a1, 0, v14);
  v11 = v17;
  v12 = v9;

  return v12;
}

- (id)ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater:()EmailFoundationAdditions
{
  void (**v4)(void *, void *, _QWORD);
  void *v5;
  id v6;
  _QWORD aBlock[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = (id)0xAAAAAAAAAAAAAAAALL;
  v14 = (id)objc_msgSend(a1, "mutableCopy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__NSString_EmailFoundationAdditions__ef_stringByEscapingSQLLikeSpecialCharactersWithEscapeCharater___block_invoke;
  aBlock[3] = &unk_1E62A6880;
  aBlock[4] = &v9;
  v4 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, a3);

  v4[2](v4, CFSTR("%"), a3);
  v4[2](v4, CFSTR("_"), a3);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)ef_hasCaseInsensitivePrefix:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)ef_hasCaseInsensitiveSuffix:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "rangeOfString:options:", a3, 13) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)ef_stringByIsolatingDirectionalityForString:()EmailFoundationAdditions
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("⁨%@⁩"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (__CFString)ef_emptyStringIfNil:()EmailFoundationAdditions
{
  if (a3)
    return (__CFString *)a3;
  else
    return &stru_1E62A84D8;
}

- (id)ef_stringWithNoExtraSpaces
{
  unint64_t v1;
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v1 = 0;
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  while (v1 < objc_msgSend(v2, "length"))
  {
    v3 = objc_msgSend(v2, "characterAtIndex:", v1++);
    if (v3 == 32)
    {
      while (v1 < objc_msgSend(v2, "length") && objc_msgSend(v2, "characterAtIndex:", v1) == 32)
        objc_msgSend(v2, "deleteCharactersInRange:", v1, 1);
    }
  }
  if (objc_msgSend(v2, "length") && objc_msgSend(v2, "characterAtIndex:", 0) == 32)
    objc_msgSend(v2, "deleteCharactersInRange:", 0, 1);
  v4 = objc_msgSend(v2, "length");
  if (v4)
  {
    v5 = v4 - 1;
    if (objc_msgSend(v2, "characterAtIndex:", v4 - 1) == 32)
      objc_msgSend(v2, "deleteCharactersInRange:", v5, 1);
  }
  return v2;
}

- (id)ef_stringByAddingPercentEscapesUsingEncoding:()EmailFoundationAdditions
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("%26"), 2, 0, objc_msgSend(v1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "ef_defaultAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)ef_stringByReplacingPercentEscapesUsingEncoding:()EmailFoundationAdditions
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "stringByRemovingPercentEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("%26"), CFSTR("&"), 2, 0, objc_msgSend(v2, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ef_stringByApplyingJavaScriptArguments:()EmailFoundationAdditions
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFNSStringAdditions.m"), 559, CFSTR("Arguments is not a valid array."));

  }
  v6 = &stru_1E62A84D8;
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
    objc_msgSend(v8, "substringToIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("[")) & 1) != 0)
    {
      objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("]"));

      if ((v11 & 1) != 0)
      {
LABEL_7:
        objc_msgSend(v8, "substringWithRange:", 1, objc_msgSend(v8, "length") - 2);
        v13 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v13;
        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EFNSStringAdditions.m"), 566, CFSTR("Unexpected characters in sanitized string."));

    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@);"), a1, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)ef_lossyDefaultCStringBytes
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "_fastCStringContents:", 1);
  if (!v2)
  {
    v3 = objc_msgSend(v1, "length");
    v8 = 0xAAAAAAAAAAAAAAAALL;
    v9 = 0xAAAAAAAAAAAAAAAALL;
    if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0x7FFFFFFFFFFFFFFELL, &v9, 1, 1, 0, v3, 0))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v9 + 1);
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v2 = objc_msgSend(v4, "mutableBytes");
      if (v2
        && (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v2, v9, &v8, 1, 1, 0, v3, 0) & 1) != 0)
      {
        v5 = v8;
        v6 = v9;

        if (v5 == v6)
          *(_BYTE *)(v2 + v9) = 0;
      }
      else
      {

      }
    }
  }
  return v2;
}

- (uint64_t)ef_isWebAddress
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;

  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 32, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  objc_msgSend(v2, "firstMatchInString:options:range:", a1, 1, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "range"))
    v6 = 0;
  else
    v6 = v3 == v5;
  if (v6)
  {
    objc_msgSend(v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "ef_isEligibleForRichLink");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)ef_rangeOfWebAddressContainingRange:()EmailFoundationAdditions
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRange v23;
  NSRange v24;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "length"))
    return 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB3560], "dataDetectorWithTypes:error:", 32, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchesInString:options:range:", a1, 1, 0, objc_msgSend(a1, "length"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v23.location = objc_msgSend(v12, "range", (_QWORD)v17);
        v24.location = a3;
        v24.length = a4;
        if (NSIntersectionRange(v23, v24).length == a4)
        {
          objc_msgSend(v12, "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "ef_isEligibleForRichLink");

          if (v14)
          {
            v15 = objc_msgSend(v12, "range");
            goto LABEL_14;
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v15;
}

- (uint64_t)ef_isUnsignedIntegerString
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    if (ef_isUnsignedIntegerString_onceToken != -1)
      dispatch_once(&ef_isUnsignedIntegerString_onceToken, &__block_literal_global_60);
    return objc_msgSend(a1, "rangeOfCharacterFromSet:", ef_isUnsignedIntegerString_nonDigitCharacterSet) == 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)ef_stringByEscapingForMessageBody
{
  void *v1;

  -[NSString _escapeForXML](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r\n"), CFSTR("<BR>"), 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("<BR>"), 0, 0, objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), CFSTR("<BR>"), 0, 0, objc_msgSend(v1, "length"));
  return v1;
}

- (uint64_t)ef_conformsToMarkupUTType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC570]);

  return v2;
}

- (uint64_t)ef_conformsToIWorkUTType
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("com.apple.iwork"));
}

- (uint64_t)ef_conformsToRFC822UTType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.mail.email"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "conformsToType:", *MEMORY[0x1E0CEC4D0]) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v1, "conformsToType:", v2);

  return v3;
}

- (id)ef_declaredUTTypeFromExtension
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2 || objc_msgSend(v2, "isDynamic"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", a1, *MEMORY[0x1E0CEC588]);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (uint64_t)ef_stringByEscapingSingleQuotes
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("\\'"));
}

- (id)ef_filenameWithExtensionForMimeType:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (objc_msgSend(a1, "pathExtension"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredFilenameExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(a1, "stringByAppendingPathExtension:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  if (v7)
    v10 = v7;
  else
    v10 = a1;
  v11 = v10;

  return v11;
}

- (id)ef_pathByReplacingRelativePathWithFolderName:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__NSString_EmailFoundationAdditions__ef_pathByReplacingRelativePathWithFolderName___block_invoke;
  v10[3] = &unk_1E62A68F0;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "ef_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ef_UTF8ConvertibleString
{
  id v1;
  id v2;

  v1 = objc_retainAutorelease(a1);
  if (objc_msgSend(v1, "UTF8String"))
  {
    v2 = v1;
  }
  else
  {
    _EFRepairString(v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)ef_stringByTrimmingWhitespaceAndNewlineCharacters
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ef_stringByRemovingWhitespaceAndUnbalancedQuotesForLanguages:()EmailFoundationAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_stringByRemovingUnbalancedQuotesForLanguages:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "ef_rangeOfCharactersFromSet:options:", a3, 0);
}

- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions options:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  v7 = objc_msgSend(a1, "ef_rangeOfCharactersFromSet:options:range:", v6, a4, 0, objc_msgSend(a1, "length"));

  return v7;
}

- (uint64_t)ef_rangeOfCharactersFromSet:()EmailFoundationAdditions options:range:
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = a3;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL && a6)
  {
    if ((a4 & 4) != 0)
    {
      if ((a4 & 8) != 0)
      {
        v13 = objc_msgSend(a1, "_lengthOfSuffixOfCharactersFromSet:range:", v10, a5, a6);
        if (v13)
          v11 = a5 + a6 - v13;
        else
          v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else if (a5 + a6 > a5)
      {
        while (1)
        {
          v12 = objc_msgSend(a1, "_lengthOfSuffixOfCharactersFromSet:range:", v10, a5, a6);
          if (v12)
            break;
          --a6;
          if (a5 + a6 <= a5)
          {
LABEL_14:
            v11 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_23;
          }
        }
        v11 = a5 - v12 + a6;
      }
    }
    else if ((a4 & 8) != 0)
    {
      if (objc_msgSend(a1, "_lengthOfPrefixOfCharactersFromSet:range:", v10, a5, a6))
        v11 = a5;
      else
        v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (a5 < a5 + a6)
    {
      v11 = a5;
      while (!objc_msgSend(a1, "_lengthOfPrefixOfCharactersFromSet:range:", v10, v11, a6))
      {
        ++v11;
        if (!--a6)
          goto LABEL_14;
      }
    }
  }
LABEL_23:

  return v11;
}

- (uint64_t)_lengthOfPrefixOfCharactersFromSet:()EmailFoundationAdditions range:
{
  id v8;
  uint64_t v9;

  v8 = a3;
  if (a4 < a4 + a5)
  {
    v9 = 0;
    while ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a4 + v9)) & 1) != 0)
    {
      if (a5 == ++v9)
        goto LABEL_7;
    }
    a5 = v9;
  }
LABEL_7:

  return a5;
}

- (uint64_t)_lengthOfSuffixOfCharactersFromSet:()EmailFoundationAdditions range:
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v8 = a3;
  v9 = 0;
  v10 = a4 + a5;
  while (1)
  {
    v11 = v10 + v9;
    if (v10 + v9 <= a4)
      break;
    --v9;
    if ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11 - 1)) & 1) == 0)
    {
      a5 = ~v9;
      break;
    }
  }

  return a5;
}

@end
