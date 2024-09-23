@implementation IntentsUtilities

+ (void)intentsAppsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = (void *)MEMORY[0x24BDD1550];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__IntentsUtilities_intentsAppsWithCompletion___block_invoke;
  v9[3] = &unk_24D33D6F0;
  v10 = v5;
  v11 = v4;
  v12 = a1;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "_intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion:", v9);

}

void __46__IntentsUtilities_intentsAppsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  IntentsApp *v17;
  void *v18;
  IntentsApp *v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3)
  {
    objc_msgSend(a3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error loading Intents apps: %@"), v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v22 = v5;
      objc_msgSend(*(id *)(a1 + 48), "fetchEnabledAppIds");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v15, "applicationIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = [IntentsApp alloc];
            objc_msgSend(*(id *)(a1 + 48), "_displayNameForApp:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = -[IntentsApp initWithAppId:displayName:accessGranted:](v17, "initWithAppId:displayName:accessGranted:", v16, v18, objc_msgSend(v9, "containsObject:", v16));

            objc_msgSend(*(id *)(a1 + 32), "addObject:", v19);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v12);
      }

      v20 = *(_QWORD *)(a1 + 40);
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingSelector:", sel_compareWithIntentsApp_);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

      }
      v5 = v22;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

uint64_t __46__IntentsUtilities_intentsAppsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "applicationType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDC1508]) ^ 1;

  return v3;
}

+ (id)fetchEnabledAppIds
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  __CFBundle *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "+[IntentsUtilities fetchEnabledAppIds]";
    _os_log_impl(&dword_2153F2000, v2, OS_LOG_TYPE_DEFAULT, "%s Fetching enabled app TCC ids", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (id)TCCAccessCopyInformation();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = (_QWORD *)MEMORY[0x24BEB3810];
    v9 = (_QWORD *)MEMORY[0x24BEB3818];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = (__CFBundle *)objc_msgSend(v11, "objectForKey:", *v8, (_QWORD)v16);
        objc_msgSend(v11, "objectForKey:", *v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "BOOLValue"))
        {
          CFBundleGetIdentifier(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)isIntentsEnabledForAppId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  char v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("com.apple.Home"), CFSTR("com.apple.MobileSMS"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IntentsUtilities fetchEnabledAppIds](IntentsUtilities, "fetchEnabledAppIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "containsObject:", v3);
    v10 = CFSTR("disabled");
    v14 = "+[IntentsUtilities isIntentsEnabledForAppId:]";
    *(_DWORD *)buf = 136315650;
    v15 = 2112;
    if (v9)
      v10 = CFSTR("enabled");
    v16 = v10;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_2153F2000, v8, OS_LOG_TYPE_DEFAULT, "%s Intent is %@ for app id: %@", buf, 0x20u);

  }
  v11 = objc_msgSend(v6, "containsObject:", v3);

  return v11;
}

+ (void)setAccess:(BOOL)a3 appID:(id)a4
{
  id v4;
  void *v5;
  CFBundleRef v6;
  CFBundleRef v7;
  NSObject *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(MEMORY[0x24BDC1550], "bundleProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFBundleCreate(0, (CFURLRef)objc_msgSend(v5, "bundleURL"));
  if (v6)
  {
    v7 = v6;
    if (TCCAccessSetForBundle())
    {
      notify_post("com.apple.assistant.siri_settings_did_change");
      v8 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "+[IntentsUtilities setAccess:appID:]";
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_2153F2000, v8, OS_LOG_TYPE_DEFAULT, "%s Successfully set TCC access for app %@", buf, 0x16u);
      }
    }
    else
    {
      NSLog(CFSTR("Failed to set TCC access for app %@"), v4);
    }
    CFRelease(v7);
  }

}

+ (id)_displayNameForApp:(id)a3
{
  id v3;
  void *v4;
  const __CFString *v5;
  __CFBundle *BundleWithIdentifier;
  void *v7;
  void *v8;
  void *v9;
  CFURLRef v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "localizedNameForContext:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (const __CFString *)objc_msgSend(v3, "bundleIdentifier");

  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(v5);
  if (!objc_msgSend(v4, "length"))
  {
    CFBundleGetInfoDictionary(BundleWithIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBD298]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        v8 = v9;
      }
      else
      {
        v10 = CFBundleCopyBundleURL(BundleWithIdentifier);
        -[__CFURL lastPathComponent](v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByDeletingPathExtension");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

    v4 = v8;
  }
  return v4;
}

@end
