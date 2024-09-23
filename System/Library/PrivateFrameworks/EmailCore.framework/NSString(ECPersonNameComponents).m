@implementation NSString(ECPersonNameComponents)

- (id)ec_personNameComponents
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;

  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  objc_msgSend((id)objc_opt_class(), "__ec_extractFirstName:middleName:lastName:extension:fromString:", &v10, &v9, &v8, &v7, a1);
  v1 = v10;
  v2 = v9;
  v3 = v8;
  v4 = v7;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v5, "setGivenName:", v1);
  objc_msgSend(v5, "setMiddleName:", v2);
  objc_msgSend(v5, "setFamilyName:", v3);
  objc_msgSend(v5, "setNameSuffix:", v4);

  return v5;
}

+ (void)__ec_extractFirstName:()ECPersonNameComponents middleName:lastName:extension:fromString:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  unint64_t j;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v51;
  id v52;

  v52 = a7;
  objc_msgSend(v52, "componentsSeparatedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v52;
  v51 = v7;
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "ec_nameExtensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ec_trimCommasSpacesQuotes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "containsObject:", v12);

    v8 = v52;
    if ((v13 & 1) == 0)
    {
      if ((unint64_t)objc_msgSend(v7, "count") < 3)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "objectAtIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectAtIndex:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ %@"), v14, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v52;
      }
      else
      {
        v14 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v14, "removeLastObject");
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(" "));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ %@"), v16, v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v19 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_msgSend(v8, "length");
  if (v21)
  {
    v22 = 0;
    v23 = 0;
    for (i = 0; v21 != i; ++i)
    {
      v25 = objc_msgSend(v8, "characterAtIndex:", i);
      if ((int)v25 > 90)
      {
        if ((_DWORD)v25 == 91)
        {
          if (objc_msgSend(v19, "length"))
            objc_msgSend(v20, "addObject:", v19);
          v26 = objc_alloc_init(MEMORY[0x1E0CB37A0]);

          ++v22;
          goto LABEL_26;
        }
        if ((_DWORD)v25 == 93)
        {
          if (v22)
            --v22;
          else
            v22 = 0;
          continue;
        }
      }
      else
      {
        if ((_DWORD)v25 == 40)
        {
          if (objc_msgSend(v19, "length"))
            objc_msgSend(v20, "addObject:", v19);
          v26 = objc_alloc_init(MEMORY[0x1E0CB37A0]);

          ++v23;
          goto LABEL_26;
        }
        if ((_DWORD)v25 == 41)
        {
          if (v23)
            --v23;
          else
            v23 = 0;
          continue;
        }
      }
      if (v23 | v22)
        continue;
      if ((_DWORD)v25 != 32)
      {
        objc_msgSend(v19, "appendFormat:", CFSTR("%C"), v25);
LABEL_34:
        v23 = 0;
        v22 = 0;
        continue;
      }
      if (!objc_msgSend(v19, "length"))
        goto LABEL_34;
      objc_msgSend(v20, "addObject:", v19);
      v26 = objc_alloc_init(MEMORY[0x1E0CB37A0]);

      v23 = 0;
      v22 = 0;
LABEL_26:
      v19 = v26;
    }
  }
  if (objc_msgSend(v19, "length"))
    objc_msgSend(v20, "addObject:", v19);
  v27 = objc_msgSend(v20, "count");
  if (v27 == 2)
  {
    objc_msgSend(v20, "objectAtIndex:", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = 0;
    objc_msgSend(v20, "objectAtIndex:", 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  if (v27 <= 1)
  {
    *a3 = objc_retainAutorelease(v8);
    *a4 = 0;
    *a5 = 0;
LABEL_41:
    *a6 = 0;
    goto LABEL_59;
  }
  objc_msgSend(v20, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "ec_nameExtensions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v28;
  objc_msgSend(v28, "lowercaseString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v29, "containsObject:", v30);

  if (v31)
  {
    *a6 = objc_retainAutorelease(v28);
    objc_msgSend(v20, "removeLastObject");
  }
  else
  {
    *a6 = 0;
  }
  v32 = 0;
  for (j = 1; ; ++j)
  {
    v34 = v19;
    if (j >= objc_msgSend(v20, "count") - 1)
      break;
    objc_msgSend(v20, "objectAtIndex:", j);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "ec_partialSurnames");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lowercaseString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "containsObject:", v36);

    if ((v37 & 1) != 0)
    {
      v38 = (void *)MEMORY[0x1E0CB37A0];
      objc_msgSend(v20, "objectAtIndex:", j + 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ %@"), v19, v39);
      v40 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "replaceObjectAtIndex:withObject:", j, v40);
      v32 = (void *)v40;
      objc_msgSend(v20, "removeObjectAtIndex:", j + 1);
    }
  }
  v41 = objc_msgSend(v20, "count");
  if (v41 < 4)
  {
    objc_msgSend(v20, "lastObject");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v43 = v46;
    objc_msgSend(v20, "removeLastObject");
  }
  else
  {
    objc_msgSend(v20, "objectAtIndex:", v41 - 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v42, "ec_appearsToBeAnInitial") & 1) != 0)
    {
      objc_msgSend(v20, "lastObject");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v42;
      v43 = v46;
    }
    else
    {
      objc_msgSend(v20, "lastObject");
      v44 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v42, v44);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeLastObject");
      v19 = v42;
      v43 = (void *)v44;
    }
    objc_msgSend(v20, "removeLastObject");
  }
  objc_msgSend(v20, "objectAtIndex:", 0);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectAtIndex:", 0);
  v45 = (id)objc_msgSend(v20, "count");
  if (v45)
  {
    objc_msgSend(v20, "componentsJoinedByString:", CFSTR(" "));
    v45 = (id)objc_claimAutoreleasedReturnValue();
  }
  *a4 = v45;

LABEL_59:
}

+ (id)ec_nameExtensions
{
  if (ec_nameExtensions_onceToken != -1)
    dispatch_once(&ec_nameExtensions_onceToken, &__block_literal_global_16);
  return (id)ec_nameExtensions_nameExtensions;
}

+ (id)ec_partialSurnames
{
  if (ec_partialSurnames_onceToken != -1)
    dispatch_once(&ec_partialSurnames_onceToken, &__block_literal_global_61);
  return (id)ec_partialSurnames_partialSurnames;
}

- (uint64_t)ec_appearsToBeAnInitial
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "length");
  if (v2 == 1)
    return 1;
  if (v2 != 2)
    return 0;
  v3 = 1;
  if (objc_msgSend(a1, "characterAtIndex:", 1) != 46)
  {
    v3 = 1;
    if (objc_msgSend(a1, "characterAtIndex:", 1) != 93)
      return 0;
  }
  return v3;
}

- (__CFString)ec_trimCommasSpacesQuotes
{
  uint64_t v2;
  unsigned __int16 v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 v8;
  char v9;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;

  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = objc_msgSend(a1, "characterAtIndex:", 0);
    v4 = 0;
    v5 = 1;
    while (v3 <= 0x2Cu && ((1 << v3) & 0x100500000000) != 0)
    {
      v4 ^= v3 == 34;
      if (v2 == v5)
      {
        v6 = v2;
        goto LABEL_9;
      }
      v3 = objc_msgSend(a1, "characterAtIndex:", v5++);
    }
    v6 = v5 - 1;
LABEL_9:
    v7 = v2 - 1;
    v8 = objc_msgSend(a1, "characterAtIndex:", v7);
    v9 = 0;
    while (v8 <= 0x2Cu)
    {
      if (((1 << v8) & 0x100500000000) == 0)
        break;
      --v7;
      v9 ^= v8 == 34;
      if (v7 <= v6)
        break;
      v8 = objc_msgSend(a1, "characterAtIndex:", v7);
    }
    if (v7 >= v6)
    {
      objc_msgSend(a1, "substringWithRange:", v6, v7 - v6 + 1);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v9 & 1 | ((v4 & 1) == 0))
      {
        if (v4 & 1 | ((v9 & 1) == 0))
          return v10;
        v11 = CFSTR("%@\");
      }
      else
      {
        v11 = CFSTR("\"%@");
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (__CFString *)v12;
      return v10;
    }
  }
  v10 = &stru_1E7123500;
  return v10;
}

@end
