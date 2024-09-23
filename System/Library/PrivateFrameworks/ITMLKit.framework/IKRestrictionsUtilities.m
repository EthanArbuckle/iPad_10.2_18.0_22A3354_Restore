@implementation IKRestrictionsUtilities

+ (id)_purgableRatingsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (_purgableRatingsDictionary_sOnce != -1)
    dispatch_once(&_purgableRatingsDictionary_sOnce, &__block_literal_global_19);
  v3 = a1;
  objc_sync_enter(v3);
  objc_msgSend((id)_purgableRatingsDictionary_sCache, "objectForKey:", CFSTR("dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("RatingProviders"), CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_purgableRatingsDictionary_sCache, "setObject:forKey:", v4, CFSTR("dictionary"));

  }
  objc_sync_exit(v3);

  return v4;
}

uint64_t __53__IKRestrictionsUtilities__purgableRatingsDictionary__block_invoke()
{
  id v0;
  void *v1;
  IKRestrictionsUtilities *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_purgableRatingsDictionary_sCache;
  _purgableRatingsDictionary_sCache = (uint64_t)v0;

  v2 = objc_alloc_init(IKRestrictionsUtilities);
  v3 = (void *)_purgableRatingsDictionary_sDelegateInstance;
  _purgableRatingsDictionary_sDelegateInstance = (uint64_t)v2;

  return objc_msgSend((id)_purgableRatingsDictionary_sCache, "setDelegate:", _purgableRatingsDictionary_sDelegateInstance);
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ITMLKitGetLogObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D95F2000, v4, OS_LOG_TYPE_INFO, "%@ cached ratings dictionary will be evicted", (uint8_t *)&v7, 0xCu);

  }
}

+ (id)ratingForRestrictionRanking:(id)a3 inDomain:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __CFString *v26;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "_ratingDictionaryForDomain:countryCode:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "integerValue");
  v13 = objc_msgSend(v11, "count");
  v14 = (int)*MEMORY[0x1E0CFA958];
  if (v13)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v16)
    {
      v17 = v16;
      v29 = v11;
      v30 = v10;
      v31 = v9;
      v32 = v8;
      v33 = 0;
      v18 = *(_QWORD *)v35;
      v28 = v14;
      v19 = v14;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v21, "objectForKey:", CFSTR("rank"), v28, v29, v30, v31, v32);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "integerValue");

          if (v23 >= v12)
          {
            if (v19 >= v23)
              v24 = v23;
            else
              v24 = v19;
            if (v23 <= v19)
            {
              v25 = v21;

              v19 = v24;
              v33 = v25;
            }
            else
            {
              v19 = v24;
            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v17);

      v9 = v31;
      v8 = v32;
      v11 = v29;
      v10 = v30;
      v14 = v28;
      if (v33)
      {
        objc_msgSend(v33, "objectForKey:", CFSTR("rating"));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_27;
      }
    }
    else
    {

    }
    if (v12 == v14)
      v26 = CFSTR("Any");
    else
      v26 = CFSTR("None");
  }
  else if (v12 == v14)
  {
    v26 = CFSTR("Any");
  }
  else if (v12 == *MEMORY[0x1E0CFA960])
  {
    v26 = CFSTR("None");
  }
  else
  {
    v26 = 0;
  }
LABEL_27:

  return v26;
}

+ (id)orderedRankingsInDomain:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_purgableRatingsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0CFA950];
  if (v6)
    v9 = v6;
  v10 = v9;

  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueForKey:", CFSTR("rank"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)rankingForRestrictionRating:(id)a3 inDomain:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("Any")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = (unsigned int *)MEMORY[0x1E0CFA958];
LABEL_5:
    objc_msgSend(v11, "numberWithInt:", *v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("None")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = (unsigned int *)MEMORY[0x1E0CFA960];
    goto LABEL_5;
  }
  objc_msgSend(a1, "_ratingDictionaryForDomain:countryCode:", v9, v10);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
LABEL_8:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v18);
      objc_msgSend(v19, "objectForKey:", CFSTR("rating"), (_QWORD)v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", v8) & 1) != 0)
        break;

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v16)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    v21 = v19;

    if (!v21)
      goto LABEL_17;
    objc_msgSend(v21, "objectForKey:", CFSTR("rank"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_14:

LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0CFA958], (_QWORD)v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_19:
  return v13;
}

+ (id)_ratingDictionaryForDomain:(id)a3 countryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_purgableRatingsDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("ratingApps"));
  v10 = (void *)*MEMORY[0x1E0CFA950];
  if (v7)
    v11 = v9;
  else
    v11 = 1;
  if (v11)
    v12 = (void *)*MEMORY[0x1E0CFA950];
  else
    v12 = v7;
  v13 = v12;

  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v16 = v10;

    objc_msgSend(v16, "lowercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v16;
  }
  objc_msgSend(v15, "objectForKey:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
