@implementation IP_Zawgyi_migrator

- (id)migrateToUseZawgyiForPreferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, _BYTE *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __55__IP_Zawgyi_migrator_migrateToUseZawgyiForPreferences___block_invoke;
  v22 = &unk_1E7068F50;
  v9 = v6;
  v23 = v9;
  v24 = &v25;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v19);
  if (!*((_BYTE *)v26 + 24))
  {
    v10 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0], v19, v20, v21, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageFromLanguage:byReplacingRegion:", CFSTR("my-Qaag"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v12);
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("AppleLanguages"), v19, v20, v21, v22);
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("my"));

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v7, "localeIdentifierWithUpdatedScript:", CFSTR("Qaag"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "canonicalLocaleIdentifierFromString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("AppleLocale"));
    v7 = (void *)v17;
  }

  _Block_object_dispose(&v25, 8);
  return v4;
}

- (id)performMigrationForPreferences:(id)a3
{
  id v4;
  const __CTFontDescriptor *v5;
  CTFontDescriptorRef MatchingFontDescriptor;
  id v7;
  void *v8;

  v4 = a3;
  if (-[ISMigrator previousSchemaVersion](self, "previousSchemaVersion") >= 0x3E9
    || -[ISMigrator platform](self, "platform") != 1 && -[ISMigrator platform](self, "platform") != 2)
  {
    goto LABEL_8;
  }
  v5 = CTFontDescriptorCreateWithNameAndSize(CFSTR("Zawgyi-One"), 0.0);
  MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor(v5, 0);
  if (v5)
    CFRelease(v5);
  if (MatchingFontDescriptor)
  {
    CFRelease(MatchingFontDescriptor);
    -[IP_Zawgyi_migrator migrateToUseZawgyiForPreferences:](self, "migrateToUseZawgyiForPreferences:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

@end
