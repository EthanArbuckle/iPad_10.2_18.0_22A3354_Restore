@implementation IP_advancedSettings_migrator

- (id)performMigrationForPreferences:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[ISMigrator platform](self, "platform") == 1
    && -[ISMigrator previousSchemaVersion](self, "previousSchemaVersion") < 0xBB8)
  {
    v5 = (id)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0C997B8]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("AppleLocale"));

  }
  else
  {
    v5 = v4;
  }

  return v5;
}

- (void)migrateOtherSystemSettings
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString **v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;

  if (-[ISMigrator platform](self, "platform") == 1
    && -[ISMigrator previousSchemaVersion](self, "previousSchemaVersion") < 0xBB8)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0CB2B58];
    objc_msgSend(v22, "removeObjectForKey:inDomain:", CFSTR("AppleICUTimeFormatStrings"), *MEMORY[0x1E0CB2B58]);
    objc_msgSend(v22, "removeObjectForKey:inDomain:", CFSTR("AppleICUDateTimeSymbols"), v3);
    +[IPNumberFormat currentFormat](IPNumberFormat, "currentFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPNumberFormat availableFormats](IPNumberFormat, "availableFormats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v4))
    {
      +[IPNumberFormat setFormat:](IPNumberFormat, "setFormat:", v4);
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[IPNumberFormat setFormat:](IPNumberFormat, "setFormat:", v6);

    }
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocale:", v8);

    objc_msgSend(v7, "setDateStyle:", 1);
    objc_msgSend(v7, "dateFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IPDateFormat dateFormatterFromLocale](IPDateFormat, "dateFormatterFromLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (v12)
    {
      v13 = IPFormatOptionLocale;
    }
    else
    {
      objc_msgSend(v7, "dateFormat");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[IPDateFormat dateFormatterFromLanguage](IPDateFormat, "dateFormatterFromLanguage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateFormat");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isEqualToString:", v16);

      if (!v17)
      {
        objc_msgSend(v7, "dateFormat");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(&unk_1E706DCB0, "containsObject:", v19);

        if (v20)
        {
          objc_msgSend(v7, "dateFormat");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[IPDateFormat setDateFormat:](IPDateFormat, "setDateFormat:", v21);

          goto LABEL_13;
        }
        v18 = CFSTR("locale");
LABEL_12:
        +[IPDateFormat setDateFormat:](IPDateFormat, "setDateFormat:", v18);
LABEL_13:

        return;
      }
      v13 = IPFormatOptionLanguage;
    }
    v18 = *v13;
    goto LABEL_12;
  }
}

@end
