@implementation IP_emptyPreferences_migrator

- (id)performMigrationForPreferences:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  IPLanguageListManager *v17;
  void *v18;
  IPLanguageListManager *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ISMigrator platform](self, "platform") != 2
    || -[ISMigrator previousSchemaVersion](self, "previousSchemaVersion") >= 0xFA0
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLocale")),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v6 = (void *)v5,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLanguages")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = v4;
  }
  else
  {
    MigrationLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315394;
      v24 = "-[IP_emptyPreferences_migrator performMigrationForPreferences:]";
      v25 = 2114;
      v26 = v4;
      _os_log_impl(&dword_1B96C1000, v10, OS_LOG_TYPE_DEFAULT, "%s: Languages or locale is empty. Preferences: %{public}@", (uint8_t *)&v23, 0x16u);
    }

    v8 = (id)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E706DCF8, CFSTR("AppleLanguages"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localeWithLocaleIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "regionCode");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = CFSTR("US");
    }
    v17 = [IPLanguageListManager alloc];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[IPLanguageListManager initWithPreferredLanguages:](v17, "initWithPreferredLanguages:", v18);

    v20 = (void *)MEMORY[0x1E0C99DC8];
    -[IPLanguageListManager deviceLanguage](v19, "deviceLanguage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_localeIdentifierForLanguage:region:", v21, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("AppleLocale"));

  }
  return v8;
}

@end
