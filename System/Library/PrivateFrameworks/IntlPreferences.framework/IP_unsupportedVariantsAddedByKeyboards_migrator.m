@implementation IP_unsupportedVariantsAddedByKeyboards_migrator

- (id)migrateForPreferences:(id)a3 keyboards:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        IPUIKeyboardInputModeGetLanguageWithRegion(*(void **)(*((_QWORD *)&v45 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v10);
  }
  v38 = v7;
  v35 = v8;

  v34 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99DC8];
  v36 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsFromLocaleIdentifier:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0C997B0];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[IPLanguageListManager effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:](IPLanguageListManager, "effectiveSystemLanguagesWithUnsupportedVariant:forPreferredLanguages:", 1, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v15;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v42 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v28, "isEqualToString:", v20) & 1) == 0
          && (objc_msgSend(v26, "isEqualToString:", v39) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "containsObject:", v26);

          if ((v30 & 1) == 0)
          {
            if (objc_msgSend(v38, "containsObject:", v26))
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v26, v20);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v37, "containsObject:", v31))
                objc_msgSend(v37, "removeObject:", v26);
              else
                objc_msgSend(v37, "replaceObjectAtIndex:withObject:", objc_msgSend(v37, "indexOfObject:", v26), v31);

            }
          }
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v23);
  }

  objc_msgSend(v37, "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, CFSTR("AppleLanguages"));

  return v34;
}

- (id)performMigrationForPreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (-[ISMigrator previousSchemaVersion](self, "previousSchemaVersion") >= 0x7D0)
  {
    v7 = v4;
  }
  else
  {
    -[objc_class sharedInputModeController](IPUIKeyboardInputModeController(), "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enabledInputModeIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IP_unsupportedVariantsAddedByKeyboards_migrator migrateForPreferences:keyboards:](self, "migrateForPreferences:keyboards:", v4, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
