@implementation NSString(GKAdditions)

- (void)processUTF16CharactersForBidi:()GKAdditions
{
  void (**v4)(id, _QWORD, uint64_t, const UniChar *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const UniChar *CharactersPtr;
  UniChar *v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = ubidi_open();
  if (v5)
  {
    v6 = v5;
    v7 = -[__CFString length](a1, "length");
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr)
    {
      v4[2](v4, v6, v7, CharactersPtr);
    }
    else
    {
      if ((unint64_t)(v7 << 32) < 0x8000000001)
        v9 = (UniChar *)&v10;
      else
        v9 = (UniChar *)malloc_type_malloc(2 * (int)v7, 0x1000040BDFB0063uLL);
      -[__CFString getCharacters:](a1, "getCharacters:", v9);
      v4[2](v4, v6, v7, v9);
      if ((unint64_t)(v7 << 32) >= 0x8000000001)
        free(v9);
    }
    ubidi_close();
  }

}

- (uint64_t)_gkIsNaturallyRTL
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__NSString_GKAdditions___gkIsNaturallyRTL__block_invoke;
  v3[3] = &unk_1E75B2410;
  v3[4] = &v4;
  objc_msgSend(a1, "processUTF16CharactersForBidi:", v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)_gkSearchMatchesItem:()GKAdditions withSearchTerms:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  int v16;
  id v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count") && objc_msgSend(a1, "length"))
  {
    v18 = v7;
    objc_msgSend(v6, "valueForKeyPath:", a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      v12 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v14, "length"))
          {
            v20 = 0;
            v21 = &v20;
            v22 = 0x2020000000;
            v23 = 0;
            v15 = objc_msgSend(v8, "length");
            v19[0] = v12;
            v19[1] = 3221225472;
            v19[2] = __62__NSString_GKAdditions___gkSearchMatchesItem_withSearchTerms___block_invoke;
            v19[3] = &unk_1E75B2438;
            v19[4] = v14;
            v19[5] = &v20;
            objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 1027, v19);
            v16 = *((unsigned __int8 *)v21 + 24);
            _Block_object_dispose(&v20, 8);
            if (v16)
            {
              v10 = 1;
              goto LABEL_15;
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_15:

    v7 = v18;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (__CFString)_gkLocaleSensitiveUppercaseString
{
  __CFString *v1;
  const __CFLocale *v2;

  v1 = (__CFString *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (const __CFLocale *)objc_claimAutoreleasedReturnValue();
  CFStringUppercase(v1, v2);

  return v1;
}

- (id)_gkStringByUnescapingFromURLQuery
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR(" "));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByRemovingPercentEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_gkArrayByTokenizingString
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v14;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharactersToBeSkipped:", 0);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_msgSend(v4, "scanLocation");
  if (v5 < objc_msgSend(v3, "length"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(a1, "characterAtIndex:", objc_msgSend(v4, "scanLocation"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E75FB208, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v4, "scanString:intoString:", v8, 0);
        v16 = v6;
        objc_msgSend(v4, "scanUpToString:intoString:", v9, &v16);
        v10 = v16;

        objc_msgSend(v4, "scanString:intoString:", v9, 0);
        if (v10)
          goto LABEL_5;
      }
      else
      {
        v15 = v6;
        objc_msgSend(v4, "scanUpToCharactersFromSet:intoString:", v2, &v15);
        v10 = v15;

        if (v10)
        {
LABEL_5:
          objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v2);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v6, "length"))
            objc_msgSend(v14, "addObject:", v6);
          goto LABEL_9;
        }
      }
      v6 = 0;
LABEL_9:
      objc_msgSend(v4, "scanCharactersFromSet:intoString:", v2, 0);

      v11 = objc_msgSend(v4, "scanLocation");
      if (v11 >= objc_msgSend(v3, "length"))
      {

        break;
      }
    }
  }
  v12 = (void *)objc_msgSend(v14, "copy");

  return v12;
}

- (id)_gkSHA256HashData
{
  void *v1;
  void *v2;
  id v3;
  const void *v4;
  CC_LONG v5;
  id v6;

  objc_msgSend(a1, "dataUsingEncoding:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_retainAutorelease(v1);
  v4 = (const void *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = objc_retainAutorelease(v2);
  CC_SHA256(v4, v5, (unsigned __int8 *)objc_msgSend(v6, "mutableBytes"));

  return v6;
}

- (id)_gkSHA256Hash
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_gkSHA256HashData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)isNotEqualToString:()GKAdditions
{
  return objc_msgSend(a1, "isEqualToString:") ^ 1;
}

@end
