@implementation NSLocale(EmailFoundationAdditions)

+ (id)ef_posixLocale
{
  if (ef_posixLocale_onceToken != -1)
    dispatch_once(&ef_posixLocale_onceToken, &__block_literal_global_17);
  return (id)ef_posixLocale_locale;
}

+ (id)ef_localesFromLanguages:()EmailFoundationAdditions
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_3_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

+ (id)ef_quotePairsForLocales:()EmailFoundationAdditions
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "quotationBeginDelimiter", (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "quotationEndDelimiter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  +[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", CFSTR("\"), CFSTR("\"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v15);

  objc_msgSend(v6, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)ef_quotePairsForLanguages:()EmailFoundationAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "ef_localesFromLanguages:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ef_quotePairsForLocales:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
