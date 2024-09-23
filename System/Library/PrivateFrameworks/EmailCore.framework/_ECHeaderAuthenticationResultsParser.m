@implementation _ECHeaderAuthenticationResultsParser

+ (id)authenticationResultsForHeaders:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_opt_self();
  objc_msgSend(v2, "headersForKey:", CFSTR("authentication-results"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_authenticationResultsForHeaderBodies:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)authenticationResultsForRawHeaders:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = (void *)objc_opt_self();
  objc_msgSend(v2, "headersForKey:", CFSTR("authentication-results"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_mapSelector:", sel_body);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_authenticationResultsForHeaderBodies:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_authenticationResultsForHeaderBodies:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78___ECHeaderAuthenticationResultsParser__authenticationResultsForHeaderBodies___block_invoke;
  v4[3] = &__block_descriptor_40_e49___ECHeaderAuthenticationResults_16__0__NSString_8l;
  v4[4] = a1;
  objc_msgSend(a3, "ef_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)_skipCFWSWithScanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  id v14;

  v3 = a3;
  if (_skipCFWSWithScanner__onceToken != -1)
    dispatch_once(&_skipCFWSWithScanner__onceToken, &__block_literal_global_94);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scanCharactersFromSet:intoString:", v4, 0);

  v5 = 0;
  v6 = 0;
  while (1)
  {
    v14 = v5;
    v7 = objc_msgSend(v3, "scanCharactersFromSet:intoString:", _skipCFWSWithScanner__parentheses, &v14);
    v8 = v14;

    if (!v7)
    {
      v12 = v6 == 0;
      goto LABEL_17;
    }
    v9 = objc_msgSend(v8, "length");
    if (v9)
      break;
LABEL_12:
    if (v6)
    {
      objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", _skipCFWSWithScanner__parentheses, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scanCharactersFromSet:intoString:", v11, 0);

    }
    v5 = v8;
  }
  v10 = 0;
  while (objc_msgSend(v8, "characterAtIndex:", v10) == 40)
  {
    ++v6;
LABEL_11:
    if (v9 == ++v10)
      goto LABEL_12;
  }
  if (v6)
  {
    --v6;
    goto LABEL_11;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

+ (BOOL)_scanToCFWSOrSemicolonWithScanner:(id)a3 intoString:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (_scanToCFWSOrSemicolonWithScanner_intoString__onceToken != -1)
    dispatch_once(&_scanToCFWSOrSemicolonWithScanner_intoString__onceToken, &__block_literal_global_98);
  v6 = objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", _scanToCFWSOrSemicolonWithScanner_intoString__whitespaceAndSemicolon, a4);

  return v6;
}

+ (BOOL)_scanToCFWSOrEqualWithScanner:(id)a3 intoString:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (_scanToCFWSOrEqualWithScanner_intoString__onceToken != -1)
    dispatch_once(&_scanToCFWSOrEqualWithScanner_intoString__onceToken, &__block_literal_global_102);
  v6 = objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", _scanToCFWSOrEqualWithScanner_intoString__whitespaceAndEqual, a4);

  return v6;
}

+ (BOOL)_scanToCFWSOrPeriodOrSemicolonWithScanner:(id)a3 intoString:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__onceToken != -1)
    dispatch_once(&_scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__onceToken, &__block_literal_global_105);
  v6 = objc_msgSend(v5, "scanUpToCharactersFromSet:intoString:", _scanToCFWSOrPeriodOrSemicolonWithScanner_intoString__whitespacePeriodSemicolon, a4);

  return v6;
}

+ (int64_t)_versionWithScanner:(id)a3
{
  int64_t v4;

  v4 = 1;
  if (objc_msgSend(a3, "scanInteger:", &v4))
    return v4;
  else
    return 1;
}

+ (BOOL)_statementsWithScanner:(id)a3 intoArray:(id *)a4
{
  id v6;
  int v7;
  id v9;
  void *v10;
  id v11;
  int v12;
  id v13;

  v6 = a3;
  if (objc_msgSend(a1, "_skipCFWSWithScanner:", v6)
    && objc_msgSend(v6, "scanString:intoString:", CFSTR(";"), 0)
    && (objc_msgSend(a1, "_skipCFWSWithScanner:", v6) & 1) != 0)
  {
    if (objc_msgSend(v6, "scanString:intoString:", CFSTR("none"), 0))
    {
      if (a4)
        *a4 = (id)MEMORY[0x1E0C9AA60];
      LOBYTE(v7) = 1;
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = 0;
      while (1)
      {
        v13 = v10;
        v7 = objc_msgSend(a1, "_statementWithScanner:intoStatement:", v6, &v13);
        v11 = v13;

        if (v11)
          v12 = v7;
        else
          v12 = 0;
        if (v12 != 1)
          goto LABEL_20;
        objc_msgSend(v9, "addObject:", v11);
        if ((objc_msgSend(a1, "_skipCFWSWithScanner:", v6) & 1) == 0)
          goto LABEL_19;
        if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
          break;
        if (objc_msgSend(v6, "scanString:intoString:", CFSTR(";"), 0))
        {
          v10 = v11;
          if ((objc_msgSend(a1, "_skipCFWSWithScanner:", v6) & 1) != 0)
            continue;
        }
LABEL_19:
        LOBYTE(v7) = 0;
LABEL_20:
        if (!a4)
          goto LABEL_22;
LABEL_21:
        objc_msgSend(v9, "ef_notEmpty");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      LOBYTE(v7) = 1;
      if (a4)
        goto LABEL_21;
LABEL_22:

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)_statementWithScanner:(id)a3 intoStatement:(id *)a4
{
  id v6;
  int v7;
  id v8;
  int v9;
  id v10;
  int v11;
  id v12;
  char v13;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v20 = 0;
  v7 = objc_msgSend(a1, "_scanToCFWSOrEqualWithScanner:intoString:", v6, &v20);
  v8 = v20;
  if (v7
    && objc_msgSend(a1, "_skipCFWSWithScanner:", v6)
    && objc_msgSend(v6, "scanString:intoString:", CFSTR("="), 0)
    && objc_msgSend(a1, "_skipCFWSWithScanner:", v6))
  {
    v19 = 0;
    v9 = objc_msgSend(a1, "_scanToCFWSOrSemicolonWithScanner:intoString:", v6, &v19);
    v10 = v19;
    if (v9 && (objc_msgSend(a1, "_skipCFWSWithScanner:", v6) & 1) != 0)
    {
      if (objc_msgSend(v6, "scanString:intoString:", CFSTR("reason"), 0))
      {
        if (!objc_msgSend(a1, "_skipCFWSWithScanner:", v6)
          || !objc_msgSend(v6, "scanString:intoString:", CFSTR("="), 0)
          || !objc_msgSend(a1, "_skipCFWSWithScanner:", v6))
        {
          v13 = 0;
          v12 = 0;
          goto LABEL_25;
        }
        v18 = 0;
        v11 = objc_msgSend(a1, "_scanToCFWSOrSemicolonWithScanner:intoString:", v6, &v18);
        v12 = v18;
        if (!v11 || (objc_msgSend(a1, "_skipCFWSWithScanner:", v6) & 1) == 0)
        {
          v13 = 0;
LABEL_25:

          goto LABEL_15;
        }
      }
      else
      {
        v12 = 0;
      }
      v17 = 0;
      v13 = objc_msgSend(a1, "_propertiesWithScanner:intoArray:", v6, &v17);
      v15 = v17;
      if (a4)
        v16 = v13;
      else
        v16 = 0;
      if ((v16 & 1) != 0)
        *a4 = -[ECHeaderAuthenticationResultStatement initWithMethod:result:reason:properties:]([ECHeaderAuthenticationResultStatement alloc], "initWithMethod:result:reason:properties:", v8, v10, v12, v15);

      goto LABEL_25;
    }
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v10 = 0;
  }
LABEL_15:

  return v13;
}

+ (BOOL)_propertiesWithScanner:(id)a3 intoArray:(id *)a4
{
  id v5;
  void *i;
  int v7;
  id v8;
  int v9;
  id v10;
  int v11;
  id v12;
  ECHeaderAuthenticationResultProperty *v13;
  void *v14;
  void *v15;
  char v16;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = a3;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; i = v8)
  {
    v22 = i;
    v7 = objc_msgSend(a1, "_scanToCFWSOrPeriodOrSemicolonWithScanner:intoString:", v5, &v22);
    v8 = v22;

    if (!v7)
      break;
    if ((objc_msgSend(a1, "_skipCFWSWithScanner:", v5) & 1) == 0)
      goto LABEL_16;
    if ((objc_msgSend(v5, "scanString:intoString:", CFSTR("."), 0) & 1) != 0)
    {
      if (!objc_msgSend(a1, "_skipCFWSWithScanner:", v5))
      {
LABEL_16:
        v10 = 0;
LABEL_17:
        v12 = 0;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v21 = 0;
      v9 = objc_msgSend(a1, "_scanToCFWSOrEqualWithScanner:intoString:", v5, &v21);
      v10 = v21;
      if (!v9
        || !objc_msgSend(a1, "_skipCFWSWithScanner:", v5)
        || !objc_msgSend(v5, "scanString:intoString:", CFSTR("="), 0)
        || !objc_msgSend(a1, "_skipCFWSWithScanner:", v5))
      {
        goto LABEL_17;
      }
      v20 = 0;
      v11 = objc_msgSend(a1, "_scanToCFWSOrSemicolonWithScanner:intoString:", v5, &v20);
      v12 = v20;
      if (!v11 || !objc_msgSend(a1, "_skipCFWSWithScanner:", v5))
        goto LABEL_18;
      v13 = -[ECHeaderAuthenticationResultProperty initWithPropertyType:property:value:]([ECHeaderAuthenticationResultProperty alloc], "initWithPropertyType:property:value:", v8, v10, v12);
      objc_msgSend(v19, "addObject:", v13);

    }
    else
    {
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("="));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count") != 2)
        goto LABEL_19;
      objc_msgSend(v10, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("x-"));

      if ((v16 & 1) == 0)
        goto LABEL_19;
    }

  }
  if (a4)
    *a4 = objc_retainAutorelease(v19);
LABEL_20:

  return v7 ^ 1;
}

@end
