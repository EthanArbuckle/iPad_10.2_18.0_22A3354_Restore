@implementation IP_pa_Arab_to_pa_Aran_migrator

- (id)performMigrationForPreferences:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (-[ISMigrator previousVersionIsOlderThanMacOS:iOS:watchOS:tvOS:](self, "previousVersionIsOlderThanMacOS:iOS:watchOS:tvOS:", CFSTR("10.15"), CFSTR("17A"), CFSTR("17R"), CFSTR("17J")))
  {
    v5 = (id)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__IP_pa_Arab_to_pa_Aran_migrator_performMigrationForPreferences___block_invoke;
    v18[3] = &unk_1E7068F28;
    v8 = v7;
    v19 = v8;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("AppleLanguages"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("pa")) & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C99820]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Arab"));

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0C99DC8];
        objc_msgSend(v9, "localeIdentifierWithUpdatedScript:", CFSTR("Aran"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "canonicalLocaleIdentifierFromString:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("AppleLocale"));
        v9 = (void *)v16;
      }
    }
    else
    {

    }
  }
  else
  {
    v5 = v4;
  }

  return v5;
}

@end
