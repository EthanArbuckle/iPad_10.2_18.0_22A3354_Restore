@implementation NSString(FCAdditions)

- (uint64_t)fc_isValidArticleID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", CFSTR("A"));
}

- (uint64_t)fc_isValidCloudKitIDWithPrefix:()FCAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(a1, "fc_isValidCloudKitID"))
    v5 = objc_msgSend(a1, "hasPrefix:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)fc_isValidCloudKitID
{
  return objc_msgSend(a1, "length") == 23;
}

- (uint64_t)fc_isValidTagID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", CFSTR("T"));
}

- (uint64_t)fc_isValidIssueID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", CFSTR("I"));
}

- (BOOL)fc_isValidColorHexString
{
  if (qword_1ED0F8950 != -1)
    dispatch_once(&qword_1ED0F8950, &__block_literal_global_193);
  return objc_msgSend((id)_MergedGlobals_224, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) == 1;
}

- (id)fc_stringByReplacingOccurrencesOfStrings:()FCAdditions withString:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), v7, 0, 0, objc_msgSend(v8, "length", (_QWORD)v15));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  return v8;
}

+ (uint64_t)fc_string:()FCAdditions isEqualToString:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

+ (id)fc_string:()FCAdditions
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  return v8;
}

- (uint64_t)range
{
  objc_msgSend(a1, "length");
  return 0;
}

+ (id)stringWithValue:()FCAdditions
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    objc_opt_class();
    if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v3;
      objc_msgSend(v6, "stringValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
      v5 = 0;
    }

    v4 = 0;
  }

  return v5;
}

- (id)fc_lowercaseTokensWithMinimumLength:()FCAdditions
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t j;
  unsigned int v15;
  void *v16;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(a1, "length");
  objc_msgSend(a1, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 > a3)
  {
    v23 = v5;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v18);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (!v22)
      goto LABEL_19;
    v21 = *(_QWORD *)v25;
    v8 = MEMORY[0x1E0C80978];
    while (1)
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "length");
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v13 = 0;
          for (j = 0; v11 != j; ++j)
          {
            v15 = objc_msgSend(v10, "characterAtIndex:", j);
            if (v15 > 0x7F)
            {
              if (!__maskrune(v15, 0x4000uLL))
              {
LABEL_13:
                objc_msgSend(v12, "appendFormat:", CFSTR("%C"), objc_msgSend(v10, "characterAtIndex:", j));
                if (v13 >= a3 - 1)
                {
                  v16 = (void *)objc_msgSend(v12, "copy");
                  objc_msgSend(v23, "addObject:", v16);

                }
                ++v13;
              }
            }
            else if ((*(_DWORD *)(v8 + 4 * v15 + 60) & 0x4000) == 0)
            {
              goto LABEL_13;
            }
          }
        }

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v22)
      {
LABEL_19:

        return v23;
      }
    }
  }
  objc_msgSend(v5, "addObject:", v7);

  return v5;
}

- (id)tokenizedLowerCaseStringWithMinimumLength:()FCAdditions
{
  id v3;
  void *v5;
  void *v6;

  v3 = a1;
  if (a1)
  {
    if (objc_msgSend(a1, "length") <= a3)
    {
      v3 = (id)objc_msgSend(v3, "copy");
    }
    else
    {
      objc_msgSend(v3, "fc_lowercaseTokensWithMinimumLength:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)fc_stringByTrimmingWhiteSpace
{
  void *v2;
  void *v3;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)objc_msgSend(a1, "copy");
  }
  return v3;
}

- (id)fc_stringByRemovingPunctuation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByRemovingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)stringByRemovingCharactersInSet:()FCAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v4 && v5)
  {
    objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", &stru_1E464BC40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_msgSend(a1, "copy");
  }

  return v7;
}

- (id)fc_stringByReplacingPrefix:()FCAdditions withString:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fc_stringByMultiplyingStringByCount:()FCAdditions
{
  void *i;

  for (i = (void *)objc_opt_new(); a3; --a3)
    objc_msgSend(i, "appendString:", a1);
  return i;
}

- (id)fc_stringByPrefixingLinesWithString:()FCAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("\n%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fc_stringByAppendingStringIfNeeded:()FCAdditions
{
  id v4;
  unint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "string");
    *(_DWORD *)buf = 136315906;
    v13 = "-[NSString(FCAdditions) fc_stringByAppendingStringIfNeeded:]";
    v14 = 2080;
    v15 = "NSString+FCAdditions.m";
    v16 = 1024;
    v17 = 198;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = objc_msgSend(a1, "length");
  if (v5 >= objc_msgSend(v4, "length")
    && (objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", v4),
        v6,
        v7))
  {
    v8 = objc_msgSend(a1, "copy");
  }
  else
  {
    objc_msgSend(a1, "stringByAppendingString:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)fc_numberFollowingString:()FCAdditions
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(\\d*)"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "numberOfRanges"))
  {
    v7 = objc_msgSend(v6, "rangeAtIndex:", 1);
    objc_msgSend(a1, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v10, "setNumberStyle:", 1);
    objc_msgSend(v10, "numberFromString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)fc_isValidHardPaywallArticleID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", CFSTR("P"));
}

- (uint64_t)fc_isValidPuzzleID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", CFSTR("J"));
}

- (uint64_t)fc_isValidPuzzleTypeID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", CFSTR("Z"));
}

- (uint64_t)fc_isValidSportsEventID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", CFSTR("V"));
}

+ (id)fc_hardPaywallArticleIDWithArticleID:()FCAdditions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "substringFromIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nf_stringByReversingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("P%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)fc_unsignedLongLongValue
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "numberFromString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

@end
