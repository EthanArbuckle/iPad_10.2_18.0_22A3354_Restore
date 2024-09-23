@implementation CNContactRelationLocalizationProvider

+ (id)supplementalLabelURLPairsForLanguages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  objc_msgSend(v5, "localizations");
  v7 = objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v7, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "addObject:", v14);
        objc_msgSend(v4, "removeObject:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }
  v26 = (void *)v7;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        objc_msgSend(v28, "URLForResource:withExtension:subdirectory:localization:", CFSTR("CNLabeledValue"), CFSTR("strings"), 0, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v22, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v23);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  if (!objc_msgSend(v15, "count"))
    NSLog(CFSTR("No supplemental labels found for any of the following localizations: %@"), obj, v26);
  objc_msgSend(v15, "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)preferredLanguages
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languagesByAddingRelatedLanguagesToLanguages:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
