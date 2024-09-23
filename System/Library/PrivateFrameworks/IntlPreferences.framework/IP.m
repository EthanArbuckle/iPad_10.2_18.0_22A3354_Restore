@implementation IP

void __65__IP_pa_Arab_to_pa_Aran_migrator_performMigrationForPreferences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("pa")))
    goto LABEL_4;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C99820]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Arab"));

  if (v8)
  {
    objc_msgSend(v10, "localeIdentifierWithUpdatedScript:", CFSTR("Aran"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
LABEL_4:

  }
}

void __61__IP_HK_MO_yue_Hant_migrator_performMigrationForPreferences___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C997E8];
  v15 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("zh")))
    goto LABEL_4;
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0C99820]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Hant"));

  v12 = v15;
  if (v11)
  {
    v9 = (void *)objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("yue"), v8);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v14, a3 + 1);
    *a4 = 1;

LABEL_4:
    v12 = v15;
  }

}

void __55__IP_Zawgyi_migrator_migrateToUseZawgyiForPreferences___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("my"));

  if (v9)
  {
    objc_msgSend(v12, "localeIdentifierWithUpdatedScript:", CFSTR("Qaag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v11, a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;

  }
}

@end
