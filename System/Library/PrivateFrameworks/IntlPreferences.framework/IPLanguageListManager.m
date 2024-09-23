@implementation IPLanguageListManager

- (IPLanguageListManager)initWithPreferredLanguages:(id)a3 preferredLocale:(id)a4 systemLanguages:(id)a5
{
  id v9;
  id v10;
  id v11;
  IPLanguageListManager *v12;
  IPLanguageListManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IPLanguageListManager;
  v12 = -[IPLanguageListManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preferredLanguages, a3);
    objc_storeStrong((id *)&v13->_preferredLocale, a4);
    objc_storeStrong((id *)&v13->_systemLanguages, a5);
  }

  return v13;
}

- (IPLanguageListManager)initWithPreferredLanguages:(id)a3 preferredLocale:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  IPLanguageListManager *v10;

  v6 = (void *)MEMORY[0x1E0C99DC8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "systemLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IPLanguageListManager initWithPreferredLanguages:preferredLocale:systemLanguages:](self, "initWithPreferredLanguages:preferredLocale:systemLanguages:", v8, v7, v9);

  return v10;
}

- (IPLanguageListManager)initWithPreferredLanguages:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  IPLanguageListManager *v8;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "preferredLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IPLanguageListManager initWithPreferredLanguages:preferredLocale:systemLanguages:](self, "initWithPreferredLanguages:preferredLocale:systemLanguages:", v5, v6, v7);

  return v8;
}

+ (id)manager
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "_globalPreferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithPreferredLanguages:preferredLocale:systemLanguages:", v3, v4, v5);

  return v6;
}

+ (void)preheat
{
  id v2;

  v2 = (id)objc_msgSend((id)objc_opt_class(), "regionalVariantLanguagesForSystemLanguages");
}

- (id)deviceLanguagesForChangingDeviceLanguage:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[IPLanguageListManager systemLanguages](self, "systemLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPLanguageListManager systemLanguages](self, "systemLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __66__IPLanguageListManager_deviceLanguagesForChangingDeviceLanguage___block_invoke;
  v54[3] = &unk_1E70693F0;
  v8 = v6;
  v55 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v54);

  -[IPLanguageListManager systemDisplayLanguage](self, "systemDisplayLanguage");
  v45 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:");
  v9 = objc_claimAutoreleasedReturnValue();
  -[IPLanguageListManager preferredLocale](self, "preferredLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countryCode");
  v11 = objc_claimAutoreleasedReturnValue();

  +[IntlUtility preferredLanguagesForRegionWithoutFiltering:](IntlUtility, "preferredLanguagesForRegionWithoutFiltering:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPLanguageListManager systemLanguages](self, "systemLanguages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "regionalVariantLanguagesForSystemLanguages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)v11;
  +[IntlUtility filterLanguageList:forRegion:fromLanguages:](IntlUtility, "filterLanguageList:forRegion:fromLanguages:", v12, v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v18 = (void *)v9;
  v19 = v17;

  objc_msgSend(v8, "removeObjectsInArray:", v17);
  if (v18)
  {
    objc_msgSend(v8, "removeObject:", v18);
    objc_msgSend(v17, "removeObject:", v18);
  }
  v20 = (void *)v45;
  if (v45)
  {
    objc_msgSend(v8, "removeObject:", v45);
    objc_msgSend(v17, "removeObject:", v45);
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v45)
    objc_msgSend(v21, "addObject:", v45);
  objc_msgSend(v22, "addObjectsFromArray:", v17);
  v44 = v8;
  objc_msgSend(v22, "addObjectsFromArray:", v8);
  if (!a3)
  {
    v42 = v17;
    v23 = v18;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[IPLanguageListManager preferredLanguages](self, "preferredLanguages");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v51 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v22, "indexOfObject:", v29);
          if (v31 != 0x7FFFFFFFFFFFFFFFLL
            || (v31 = objc_msgSend(v22, "indexOfObject:", v30), v31 != 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v22, "removeObjectAtIndex:", v31);
          }

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v26);
    }

    v20 = (void *)v45;
    objc_msgSend(v22, "removeObject:", v45);
    v18 = v23;
    v19 = v42;
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v33 = v22;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(v33);
        +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v35);
  }

  objc_msgSend(v32, "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

void __66__IPLanguageListManager_deviceLanguagesForChangingDeviceLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)languageVariants
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[IPLanguageListManager systemDisplayLanguage](self, "systemDisplayLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "regionalVariantLanguagesForBaseLanguage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)otherLanguages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "renderableUILanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[IPLanguageListManager systemLanguages](self, "systemLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectsInArray:", v5);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[IPLanguageListManager preferredLanguages](self, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "indexOfObject:", v11);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL || (v13 = objc_msgSend(v4, "indexOfObject:", v12), v13 != 0x7FFFFFFFFFFFFFFFLL))
          objc_msgSend(v4, "removeObjectAtIndex:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  -[IPLanguageListManager deviceLanguagesForChangingDeviceLanguage:](self, "deviceLanguagesForChangingDeviceLanguage:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectsInArray:", v21);

  objc_msgSend((id)objc_opt_class(), "sortByLocalizedLanguage:", v14);
  return v14;
}

- (void)setRegion:(id)a3 updateFirstLanguage:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v37;
  void *v38;
  IPLanguageListManager *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = self;
  -[IPLanguageListManager preferredLanguages](self, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v9 = 0;
    v37 = *MEMORY[0x1E0C997B0];
    v38 = v7;
    v35 = v5;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9, v35);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v10, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v10);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 & 1) != 0)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "containsObject:", v13) & 1) != 0)
        {
          v12 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v15, "containsObject:", v13);

        }
      }
      objc_msgSend((id)objc_opt_class(), "regionalVariantLanguagesForSystemLanguages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v10);

      if (v12)
      {
        v7 = v38;
        if (!a4 && !objc_msgSend(MEMORY[0x1E0C99DC8], "_language:usesSameLocalizationAs:", v10, v11))
        {
          if ((v17 & 1) == 0)
          {
            v18 = (void *)MEMORY[0x1E0CB34D0];
            objc_msgSend((id)objc_opt_class(), "regionalVariantLanguagesForSystemLanguages");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "preferredLocalizationsFromArray:forPreferences:", v19, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v38;
            if (objc_msgSend(v22, "length")
              && objc_msgSend(MEMORY[0x1E0C99DC8], "_language:usesSameLocalizationAs:", v22, v10))
            {
              objc_msgSend(v38, "replaceObjectAtIndex:withObject:", v9, v22);
            }

            v5 = v35;
          }
          goto LABEL_20;
        }
      }
      else
      {
        objc_msgSend(v40, "objectForKeyedSubscript:", v37);
        v23 = objc_claimAutoreleasedReturnValue();
        v7 = v38;
        if (v23)
        {
          v24 = (void *)v23;
          v25 = v17 ^ 1;
          objc_msgSend(v40, "objectForKeyedSubscript:", v37);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[IPLanguageListManager preferredLocale](v39, "preferredLocale");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "countryCode");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v26, "isEqualToString:", v28) | v25;

          v5 = v35;
          v7 = v38;

          if ((v29 & 1) == 0)
            goto LABEL_20;
        }
      }
      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v9, v11);
LABEL_20:
      v8 |= v12;

      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArray:", v31);

  v32 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierForRegionChange:", v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localeWithLocaleIdentifier:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPLanguageListManager setPreferredLocale:](v39, "setPreferredLocale:", v34);

  -[IPLanguageListManager setPreferredLanguages:](v39, "setPreferredLanguages:", v7);
}

- (void)setPreferredLanguages:(id)a3
{
  NSString *systemDisplayLanguage;
  id v6;

  objc_storeStrong((id *)&self->_preferredLanguages, a3);
  v6 = a3;
  systemDisplayLanguage = self->_systemDisplayLanguage;
  self->_systemDisplayLanguage = 0;

}

- (NSString)deviceLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Foundation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB34D0];
  -[IPLanguageListManager preferredLanguages](self, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)systemDisplayLanguage
{
  NSString *systemDisplayLanguage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  int v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSString *p_isa;
  NSString *v25;
  NSString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  systemDisplayLanguage = self->_systemDisplayLanguage;
  if (systemDisplayLanguage)
    return systemDisplayLanguage;
  -[IPLanguageListManager deviceLanguage](self, "deviceLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  -[IPLanguageListManager preferredLanguages](self, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  v13 = v9;
  if (v12)
  {
    v13 = v8;

  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "regionalVariantLanguagesForBaseLanguage:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "containsObject:", v13) & 1) != 0)
    {
LABEL_18:
      v25 = self->_systemDisplayLanguage;
      self->_systemDisplayLanguage = v13;
      v26 = v13;

      systemDisplayLanguage = self->_systemDisplayLanguage;
      return systemDisplayLanguage;
    }
    -[IPLanguageListManager systemLanguages](self, "systemLanguages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "containsObject:", v13) & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB34D0];
      v27[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredLocalizationsFromArray:forPreferences:", v17, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("pt")))
      {

        v18 = CFSTR("pt-BR");
      }
      else if (!v18)
      {
        goto LABEL_16;
      }
      if (objc_msgSend(v17, "containsObject:", v18))
      {
        v23 = v18;
        v18 = v23;
LABEL_17:
        p_isa = &v23->isa;

        v13 = p_isa;
        goto LABEL_18;
      }
    }
LABEL_16:
    v23 = v14;
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    -[IPLanguageListManager systemDisplayLanguage].cold.1();

  return (NSString *)0;
}

+ (id)regionalVariantLanguagesForBaseLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "renderableUILanguages", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v3, "isEqualToString:", v10) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v3, "isEqualToString:", v11))
            objc_msgSend(v4, "addObject:", v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_4);
  return v4;
}

uint64_t __65__IPLanguageListManager_regionalVariantLanguagesForBaseLanguage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IPLanguage languageWithIdentifier:](IPLanguage, "languageWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringForName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "localizedStandardCompare:", v8);
  return v9;
}

+ (id)regionalVariantLanguagesForSystemLanguages
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages;
  if (!regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(a1, "regionalVariantLanguagesForBaseLanguage:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages;
    regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages = v11;

    v3 = (void *)regionalVariantLanguagesForSystemLanguages___regionalVariantLanguagesForSystemLanguages;
  }
  return v3;
}

+ (void)sortByLocalizedLanguage:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_21);
}

uint64_t __49__IPLanguageListManager_sortByLocalizedLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedStringForName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

+ (id)effectiveSystemLanguagesWithUnsupportedVariant:(BOOL)a3 forPreferredLanguages:(id)a4
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  unint64_t v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v24;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v25 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      v24 = v10;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        if (objc_msgSend(v6, "containsObject:", v13, v24))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          objc_msgSend(*(id *)(v5 + 3528), "baseLanguageFromLanguage:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v6, "containsObject:", v14) & 1) != 0)
            goto LABEL_10;
          objc_msgSend(*(id *)(v5 + 3528), "baseSystemLanguages");
          v15 = v11;
          v16 = v6;
          v17 = v7;
          v18 = v8;
          v19 = v5;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v14);

          v5 = v19;
          v8 = v18;
          v7 = v17;
          v6 = v16;
          v11 = v15;
          v10 = v24;
          if (v21)
          {
LABEL_10:
            if (v25)
              v22 = v13;
            else
              v22 = v14;
            objc_msgSend(v7, "addObject:", v22);
          }

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  if (!objc_msgSend(v7, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      +[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:].cold.1();
    objc_msgSend(v7, "addObject:", CFSTR("en-001"));
  }

  return v7;
}

+ (BOOL)canRemoveLanguages:(id)a3 fromPreferredLanguages:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:](IPLanguageListManager, "effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:", 1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObjectsInArray:", v5);
  LOBYTE(v6) = objc_msgSend(v7, "count") != 0;

  return (char)v6;
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (NSLocale)preferredLocale
{
  return self->_preferredLocale;
}

- (void)setPreferredLocale:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLocale, a3);
}

- (NSArray)systemLanguages
{
  return self->_systemLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguages, 0);
  objc_storeStrong((id *)&self->_preferredLocale, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_systemDisplayLanguage, 0);
}

- (void)systemDisplayLanguage
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136315138;
  v1 = "-[IPLanguageListManager systemDisplayLanguage]";
  _os_log_fault_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: systemDisplayLanguage is nil.", (uint8_t *)&v0, 0xCu);
}

+ (void)effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:.cold.1()
{
  int v0;
  const char *v1;
  __int16 v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = 136315394;
  v1 = "+[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:]";
  v2 = 2112;
  v3 = CFSTR("en-001");
  _os_log_fault_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: effectiveSystemLanguages is empty. Falling back to [%@].", (uint8_t *)&v0, 0x16u);
}

@end
