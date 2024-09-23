@implementation FBKSharedConstants

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSuiteNamed:", *MEMORY[0x24BE312C0]);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", CFSTR("production"), *MEMORY[0x24BE312D8]);
  objc_msgSend(v6, "setObject:forKey:", &unk_24E18CAA0, CFSTR("LastDraftID"));
  v3 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Autogather"));
  objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("webViewOverride"));
  v4 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("showsAutoFillButton"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("NetworkLoggerData"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("NetworkLoggerSpam"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("allowCellUploads"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("FBKPushNotificationsEnabled"));
  objc_msgSend(v6, "setObject:forKey:", v3, CFSTR("usesSystemAccount"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("FBKELEnabled"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("ListsFormsFetchedByTat"));
  objc_msgSend(v6, "setObject:forKey:", &unk_24E18CAB8, CFSTR("MaxInlineChoices"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("DisableFormItems"));
  objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("DisableAppleConnect"));
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerDefaults:", v6);

}

+ (id)modelName
{
  void *v2;
  uint64_t v3;
  void *v4;
  utsname v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)_modelName;
  if (!_modelName)
  {
    memset(&v6, 0, 512);
    uname(&v6);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v6.machine);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_modelName;
    _modelName = v3;

    v2 = (void *)_modelName;
  }
  return v2;
}

+ (void)recordCurrentLanguagePreference
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("FBKLocalDataLanguage"));

  +[FBKLog appHandle](FBKLog, "appHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_DEFAULT, "Saved local data language: [%{public}@]", (uint8_t *)&v7, 0xCu);
  }

}

+ (BOOL)hasDifferentLanguageSinceLastLaunch
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("FBKLocalDataLanguage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v3, "isEqualToString:", v6) ^ 1;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543874;
    v11 = v3;
    v12 = 2114;
    v13 = v6;
    v14 = 1024;
    v15 = v7;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "language preference last used [%{public}@], current: [%{public}@], changed? [%i]", (uint8_t *)&v10, 0x1Cu);
  }

  return v7;
}

+ (id)portalURL
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://beta.apple.com/"));
}

+ (id)developerURL
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://developer.apple.com/bug-reporting/"));
}

+ (id)darkModeCSS
{
  return CFSTR(":root { supported-color-schemes: light dark; } @media (prefers-color-scheme: dark) { body { -apple-color-filter: invert(1) hue-rotate(180deg) saturate(3); } html { -apple-color-filter: invert(1) hue-rotate(180deg) saturate(3);} h1, h2, h3, p { -apple-color-filter: invert(0.85) hue-rotate(180deg) saturate(4) brightness(1.5); }}");
}

+ (int64_t)currentLegalVersion
{
  return 10;
}

+ (BOOL)currentIDMSEnvironmentMatchesCurrentFBKSEnvironment
{
  void *v3;
  uint64_t v4;
  int v5;

  if (!FBKSIsInternalInstall()
    || (objc_msgSend(MEMORY[0x24BE0ADF0], "sharedBag"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "IDMSEnvironment"),
        v3,
        v4)
    || (v5 = objc_msgSend(a1, "isProductionEnvironment")) != 0)
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (BOOL)isProductionEnvironment
{
  return (objc_msgSend(a1, "environment") & 0xFFFFFFFB) == 0;
}

+ (NSUserDefaults)sharedUserDefaults
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___FBKSharedConstants;
  objc_msgSendSuper2(&v3, sel_sharedUserDefaults);
  return (NSUserDefaults *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)usesPersistentStore
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForKey:", CFSTR("FBKUsePersistentStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (BOOL)usesTemporaryDraftsDirectory
{
  return objc_msgSend(a1, "isRunningInFBA") ^ 1;
}

+ (BOOL)isEnhancedLoggingEnabled
{
  if (isEnhancedLoggingEnabled_onceToken != -1)
    dispatch_once(&isEnhancedLoggingEnabled_onceToken, &__block_literal_global_17);
  return isEnhancedLoggingEnabled_isEnabled;
}

void __46__FBKSharedConstants_isEnhancedLoggingEnabled__block_invoke()
{
  int v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v1, "BOOLForKey:", CFSTR("FBKELEnabled"));
  if (v0)
    LOBYTE(v0) = FBKSIsInternalInstall();
  isEnhancedLoggingEnabled_isEnabled = v0;

}

+ (id)localizedAttachmentLegalTextForDraftID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "sharedUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localizedAttachmentLegalTextKeyForDraftID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    v8 = 0;
  }

  return v8;
}

+ (void)saveLocalizedAttachmentLegalText:(id)a3 draftID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("dateCreated");
  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("text");
  v14[0] = v9;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharedUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localizedAttachmentLegalTextKeyForDraftID:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKey:", v10, v12);
}

+ (void)deleteAttachmentLegalTextForDraftID:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "sharedUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localizedAttachmentLegalTextKeyForDraftID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

+ (void)deleteStaleAttachmentLegalTextEntries
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__FBKSharedConstants_deleteStaleAttachmentLegalTextEntries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

void __59__FBKSharedConstants_deleteStaleAttachmentLegalTextEntries__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v1 = a1;
  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ded_selectItemsPassingTest:", &__block_literal_global_173);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v6, "setDay:", -30);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v6, v9, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(*(id *)(v1 + 32), "sharedUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "valueForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("dateCreated"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "compareDate:toDate:toUnitGranularity:", v31, v18, 128);
              v32 = v18;
              v21 = v12;
              v22 = v13;
              v23 = v1;
              v24 = v10;
              v25 = v8;
              v26 = v20;

              v27 = v26 == 1;
              v8 = v25;
              v10 = v24;
              v1 = v23;
              v13 = v22;
              v12 = v21;
              v18 = v32;
              if (v27)
              {
                +[FBKLog appHandle](FBKLog, "appHandle");
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v38 = v17;
                  _os_log_impl(&dword_21D9A9000, v28, OS_LOG_TYPE_DEFAULT, "Deleting stale localizedAttachmentLegalText %{public}@", buf, 0xCu);
                }

                objc_msgSend(*(id *)(v1 + 32), "sharedUserDefaults");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "removeObjectForKey:", v15);

              }
            }

          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v12);
  }

}

uint64_t __59__FBKSharedConstants_deleteStaleAttachmentLegalTextEntries__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("LocalizedAttachmentLegalTextKey"));
}

+ (id)_localizedAttachmentLegalTextKeyForDraftID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("LocalizedAttachmentLegalTextKey"), a3);
}

+ (BOOL)listsFormsFetchedByTat
{
  if (listsFormsFetchedByTat_onceToken != -1)
    dispatch_once(&listsFormsFetchedByTat_onceToken, &__block_literal_global_178);
  return listsFormsFetchedByTat_listsFormsFetchedByTatCached;
}

void __44__FBKSharedConstants_listsFormsFetchedByTat__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  listsFormsFetchedByTat_listsFormsFetchedByTatCached = objc_msgSend(v0, "BOOLForKey:", CFSTR("ListsFormsFetchedByTat"));

}

+ (BOOL)isFormItemsDisabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableFormItems"));

  return v3;
}

@end
