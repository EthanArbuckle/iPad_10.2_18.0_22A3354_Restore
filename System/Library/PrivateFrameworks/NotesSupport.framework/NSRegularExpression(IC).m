@implementation NSRegularExpression(IC)

+ (uint64_t)ic_regexForSearchStrings:()IC
{
  return objc_msgSend(a1, "ic_regexForSearchStrings:matchWordBoundaries:", a3, 0);
}

+ (id)ic_regexForSearchStrings:()IC matchWordBoundaries:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "ic_patternForTokens:matchWordBoundaries:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v7, 1, &v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)ic_patternForTokens:()IC matchWordBoundaries:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v6, "appendString:", CFSTR("("));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if ((a4 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\\b%@"), v12);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = v12;
        }
        v15 = v14;
        objc_msgSend(v6, "appendString:", v14);
        objc_msgSend(v6, "appendString:", CFSTR("|"));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "length"))
    objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 1, 1, &stru_1EA825738);
  objc_msgSend(v6, "appendString:", CFSTR(")"));
  v16 = (void *)objc_msgSend(v6, "copy");

  return v16;
}

+ (id)ic_regexForPrefixMatchingTokens:()IC substringMatchingTokens:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(a1, "ic_patternForTokens:matchWordBoundaries:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      v9 = 0;
LABEL_8:
      if (v8)
      {
        v12 = v8;
        v8 = v12;
        goto LABEL_12;
      }
      goto LABEL_10;
    }
LABEL_5:
    objc_msgSend(a1, "ic_patternForTokens:matchWordBoundaries:", v7, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v10;
    if (v8 && v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) | (%@)"), v8, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  v8 = 0;
  v9 = 0;
  if (objc_msgSend(v7, "count"))
    goto LABEL_5;
LABEL_10:
  v11 = v9;
  v9 = v11;
  v8 = 0;
LABEL_11:
  v12 = v11;
  if (!v11)
  {
    v13 = 0;
    goto LABEL_14;
  }
LABEL_12:
  v15 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v12, 1, &v15);
LABEL_14:

  return v13;
}

- (BOOL)ic_matchesString:()IC
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = objc_msgSend(a1, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = v6;

  return v5 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0;
}

+ (id)ic_uuidRegex
{
  uint64_t v1;

  v1 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"), 17, &v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
