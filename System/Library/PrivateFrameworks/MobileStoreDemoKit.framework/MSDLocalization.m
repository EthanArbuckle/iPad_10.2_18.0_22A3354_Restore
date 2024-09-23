@implementation MSDLocalization

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_5);
  return (id)sharedInstance_shared_2;
}

void __33__MSDLocalization_sharedInstance__block_invoke()
{
  MSDLocalization *v0;
  void *v1;

  v0 = objc_alloc_init(MSDLocalization);
  v1 = (void *)sharedInstance_shared_2;
  sharedInstance_shared_2 = (uint64_t)v0;

}

- (MSDLocalization)init
{
  MSDLocalization *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *localizationTable;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MSDLocalization *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MSDLocalization;
  v2 = -[MSDLocalization init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/Applications/StoreDemoViewService.app"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = (void *)MEMORY[0x24BDD1488];
      objc_msgSend(v3, "localizations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), CFSTR("."), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v10);
      localizationTable = v2->_localizationTable;
      v2->_localizationTable = (NSDictionary *)v11;

    }
    else
    {
      defaultLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[MSDLocalization init].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

      v8 = v2->_localizationTable;
      v2->_localizationTable = 0;
    }

    v21 = v2;
  }

  return v2;
}

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MSDLocalization localizationTable](self, "localizationTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MSDLocalization localizationTable](self, "localizationTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    if (!v10)
    {
      defaultLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v6;
        v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "Localization lookup failed for key %{public}@, preferred languages %{public}@", (uint8_t *)&v16, 0x16u);

      }
      v11 = v7;
    }
    v14 = v11;

  }
  else
  {
    v14 = v7;
  }

  return v14;
}

+ (id)getLocalizedOwnershipWarnings:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "+[MSDLocalization getLocalizedOwnershipWarnings:]";
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_213A7E000, v4, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarningFlag:  %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke;
  block[3] = &unk_24D0ADBA8;
  v10 = v3;
  v5 = getLocalizedOwnershipWarnings__onceToken;
  v6 = v3;
  if (v5 != -1)
    dispatch_once(&getLocalizedOwnershipWarnings__onceToken, block);
  v7 = (id)getLocalizedOwnershipWarnings__localizedOwnershipWarnings;

  return v7;
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  NSObject *v41;
  void *v42;
  NSObject *obj;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileStoreDemoKit.framework"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0x254D16000uLL;
  v50 = 0;
  v51 = 0;
  v4 = +[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:](MSDLocalization, "getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:", &v51, &v50, *(_QWORD *)(a1 + 32));
  v5 = v51;
  v6 = v50;
  if (v2)
    v7 = !v4;
  else
    v7 = 1;
  if (v7)
  {
    defaultLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    objc_msgSend(v2, "localizations");
    v16 = objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      defaultLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_2();
      v41 = v6;

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v8 = v8;
      v45 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v45)
      {
        v44 = *(_QWORD *)v47;
        *(_QWORD *)&v18 = 138543362;
        v40 = v18;
        obj = v8;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v47 != v44)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v19);
            objc_msgSend(v5, "objectForKey:", CFSTR("Title"), v40);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "localizedStringForKey:value:table:localization:", v21, 0, 0, v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "objectForKey:", CFSTR("Body"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "localizedStringForKey:value:table:localization:", v23, 0, 0, v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "objectForKey:", CFSTR("Link"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "localizedStringForKey:value:table:localization:", v25, 0, 0, v20);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (!v26
              || (objc_msgSend(v5, "objectForKey:", CFSTR("Link")),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", v27),
                  v27,
                  v28))
            {

              v26 = &stru_24D0AE900;
            }
            if (v22 && v24)
            {
              v54[0] = CFSTR("Title");
              v54[1] = CFSTR("Body");
              v55[0] = v22;
              v55[1] = v24;
              v54[2] = CFSTR("Link");
              v55[2] = v26;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
              v29 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKey:", v29, v20);
              if (objc_msgSend(v20, "isEqualToString:", CFSTR("en")))
              {
                v29 = v29;

                v41 = v29;
              }
            }
            else
            {
              defaultLogHandle();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v40;
                v53 = v20;
                _os_log_error_impl(&dword_213A7E000, v29, OS_LOG_TYPE_ERROR, "ERROR - Either title, body or link localized text is missing for locale:  %{public}@", buf, 0xCu);
              }
            }

            ++v19;
          }
          while (v45 != v19);
          v8 = obj;
          v45 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        }
        while (v45);
      }

      v3 = 0x254D16000;
      v6 = v41;
    }
    else
    {
      defaultLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);

    }
  }

  objc_msgSend((id)(v3 + 3800), "fillInMissingLocales:withOwnershipWarningMsg:", v42, v6);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v42);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)getLocalizedOwnershipWarnings__localizedOwnershipWarnings;
  getLocalizedOwnershipWarnings__localizedOwnershipWarnings = v38;

}

+ (void)fillInMissingLocales:(id)a3 withOwnershipWarningMsg:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (fillInMissingLocales_withOwnershipWarningMsg__onceToken != -1)
    dispatch_once(&fillInMissingLocales_withOwnershipWarningMsg__onceToken, &__block_literal_global_19);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)fillInMissingLocales_withOwnershipWarningMsg__defaultLocales;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v12, (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v5, "setObject:forKey:", v6, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

void __64__MSDLocalization_fillInMissingLocales_withOwnershipWarningMsg___block_invoke()
{
  void *v0;

  v0 = (void *)fillInMissingLocales_withOwnershipWarningMsg__defaultLocales;
  fillInMissingLocales_withOwnershipWarningMsg__defaultLocales = (uint64_t)&unk_24D0B8508;

}

+ (BOOL)getWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forOwnershipWarningFlag:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a5;
  *a3 = 0;
  *a4 = 0;
  v8 = (void *)MGGetStringAnswer();
  v9 = v8;
  if (!v8)
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_19;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("iPhone")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("iPad")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("iPod")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("Watch")) & 1) == 0)
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:].cold.3();
    goto LABEL_19;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("2")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("1")) & 1) == 0)
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[MSDLocalization getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:].cold.2();
LABEL_19:

    v11 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("2")))
    v10 = +[MSDLocalization getChannelWarningKeys:andPlaceHolderWarnings:forDeviceClass:](MSDLocalization, "getChannelWarningKeys:andPlaceHolderWarnings:forDeviceClass:", a3, a4, v9);
  else
    v10 = +[MSDLocalization getRetailWarningKeys:andPlaceHolderWarnings:forDeviceClass:](MSDLocalization, "getRetailWarningKeys:andPlaceHolderWarnings:forDeviceClass:", a3, a4, v9);
  v11 = v10;
LABEL_12:

  return v11;
}

+ (BOOL)getChannelWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimTitle_Channel"), CFSTR("Title"));
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimLink_Channel"), CFSTR("Link"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", CFSTR("Property of Apple Authorized Reseller"), CFSTR("Title"));
  objc_msgSend(v9, "setObject:forKey:", &stru_24D0AE900, CFSTR("Link"));
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPhone")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPhone_Channel"), CFSTR("Body"));
    v10 = CFSTR("This iPhone cannot be used and is not for sale.");
LABEL_9:
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("Body"));
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPad")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPad_Channel"), CFSTR("Body"));
    v10 = CFSTR("This iPad cannot be used and is not for sale.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPod")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPod_Channel"), CFSTR("Body"));
    v10 = CFSTR("This iPod cannot be used and is not for sale.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Watch")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_AppleWatch_Channel"), CFSTR("Body"));
    v10 = CFSTR("This Apple Watch cannot be used and is not for sale.");
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return 1;
}

+ (BOOL)getRetailWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimTitle_Retail"), CFSTR("Title"));
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimLink_Retail"), CFSTR("Link"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", CFSTR("Property of Apple"), CFSTR("Title"));
  objc_msgSend(v9, "setObject:forKey:", CFSTR("apple.com/retail"), CFSTR("Link"));
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPhone")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPhone_Retail"), CFSTR("Body"));
    v10 = CFSTR("This iPhone cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
LABEL_9:
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("Body"));
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPad")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPad_Retail"), CFSTR("Body"));
    v10 = CFSTR("This iPad cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPod")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPod_Retail"), CFSTR("Body"));
    v10 = CFSTR("This iPod cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Watch")))
  {
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_AppleWatch_Retail"), CFSTR("Body"));
    v10 = CFSTR("This Apple Watch cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v8);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v9);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return 1;
}

- (NSDictionary)localizationTable
{
  return self->_localizationTable;
}

- (void)setLocalizationTable:(id)a3
{
  objc_storeStrong((id *)&self->_localizationTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationTable, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "Could not load localization bundle at %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, a1, a3, "%s - Failed to get all localizations or localizations is in wrong format.  Bundle:  %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_213A7E000, v0, OS_LOG_TYPE_DEBUG, "%s - allLocalizations = %{public}@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __49__MSDLocalization_getLocalizedOwnershipWarnings___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, a1, a3, "%s - Failed to load bundle %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getWarningKeys:(uint64_t)a3 andPlaceHolderWarnings:(uint64_t)a4 forOwnershipWarningFlag:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - ERROR - Failed to get device class.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s - ERROR - Invalid ownershipWarningFlag value:  %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getWarningKeys:andPlaceHolderWarnings:forOwnershipWarningFlag:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_213A7E000, v0, v1, "%s - ERROR - Unsupported device class:  %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
