@implementation AADataclassManager

- (id)allowListedDataclassesForAppleAccountClassBasic
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0C8EE68];
  v8[0] = *MEMORY[0x1E0C8EE58];
  v8[1] = v3;
  v4 = *MEMORY[0x1E0C8EED8];
  v8[2] = *MEMORY[0x1E0C8EEB0];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E0C8EEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allowListedDataclassesForAppleAccountClassFull
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  -[AADataclassManager allowListedDataclassesForAppleAccountClassBasic](self, "allowListedDataclassesForAppleAccountClassBasic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8EE38];
  v9[0] = *MEMORY[0x1E0C8EE18];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0C8EE50];
  v9[2] = *MEMORY[0x1E0C8EE40];
  v9[3] = v4;
  v5 = *MEMORY[0x1E0C8EF28];
  v9[4] = *MEMORY[0x1E0C8EEF0];
  v9[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_userVisibleDataclasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[22];

  v17[21] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0C8EE18];
  v17[0] = *MEMORY[0x1E0C8EE90];
  v17[1] = v3;
  v4 = *MEMORY[0x1E0C8EF10];
  v17[2] = *MEMORY[0x1E0C8EEC0];
  v17[3] = v4;
  v5 = *MEMORY[0x1E0C8EE58];
  v17[4] = *MEMORY[0x1E0C8EE20];
  v17[5] = v5;
  v6 = *MEMORY[0x1E0C8EE78];
  v17[6] = *MEMORY[0x1E0C8EE68];
  v17[7] = v6;
  v7 = *MEMORY[0x1E0C8EE88];
  v17[8] = *MEMORY[0x1E0C8EE98];
  v17[9] = v7;
  v8 = *MEMORY[0x1E0C8EEA8];
  v17[10] = *MEMORY[0x1E0C8EE80];
  v17[11] = v8;
  v9 = *MEMORY[0x1E0C8EED0];
  v17[12] = *MEMORY[0x1E0C8EEB0];
  v17[13] = v9;
  v10 = *MEMORY[0x1E0C8EEE8];
  v17[14] = *MEMORY[0x1E0C8EED8];
  v17[15] = v10;
  v11 = *MEMORY[0x1E0C8EF18];
  v17[16] = *MEMORY[0x1E0C8EEF8];
  v17[17] = v11;
  v12 = *MEMORY[0x1E0C8EF28];
  v17[18] = *MEMORY[0x1E0C8EF20];
  v17[19] = v12;
  v17[20] = *MEMORY[0x1E0C8EEE0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[AAPreferences isMomentsDataclassEnabled](AAPreferences, "isMomentsDataclassEnabled")
    && +[AADeviceModelHelper isDeviceiPhone](AADeviceModelHelper, "isDeviceiPhone"))
  {
    objc_msgSend(v14, "setByAddingObject:", *MEMORY[0x1E0C8EEC8]);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  return v14;
}

- (id)_nonVisibleServiceDataclass
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = *MEMORY[0x1E0C8EEA0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)denyListedMacOSDataclasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0C8EE90];
  v8[0] = *MEMORY[0x1E0C8EE18];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(v5, "setByAddingObject:", *MEMORY[0x1E0C8EEC0]);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)_filteredDataclassesForAccountClass:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("primary")))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 191, CFSTR("AAAccountClassPrimary does not have filtered dataclasses. All dataclasses are valid"));

  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("basic")))
  {
    -[AADataclassManager allowListedDataclassesForAppleAccountClassBasic](self, "allowListedDataclassesForAppleAccountClassBasic");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("full")))
    {
      v7 = 0;
      goto LABEL_9;
    }
    -[AADataclassManager allowListedDataclassesForAppleAccountClassFull](self, "allowListedDataclassesForAppleAccountClassFull");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_9:

  return v7;
}

- (id)filteredServerProvidedFeatures:(id)a3 forAccount:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v7)
      goto LABEL_3;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverProvidedFeatures"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_24;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = *MEMORY[0x1E0C8EF10];
  if ((objc_msgSend(v10, "containsObject:", *MEMORY[0x1E0C8EF10]) & 1) == 0
    && objc_msgSend(v10, "containsObject:", *MEMORY[0x1E0C8EF28])
    && (objc_msgSend(v8, "aa_isManagedAppleID") & 1) == 0)
  {
    objc_msgSend(v10, "addObject:", v11);
  }
  objc_msgSend(v8, "aa_accountClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("basic"));

  if ((v13 & 1) == 0)
  {
    v14 = *MEMORY[0x1E0C8EEF0];
    if ((objc_msgSend(v10, "containsObject:", *MEMORY[0x1E0C8EEF0]) & 1) == 0)
    {
      if (objc_msgSend(v10, "containsObject:", *MEMORY[0x1E0C8EF28]))
        objc_msgSend(v10, "addObject:", v14);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", MEMORY[0x1E0C9AA60]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          -[AADataclassManager filteredServerProvidedFeatures:forAccount:].cold.1();
        if (-[AADataclassManager shouldProvisionDataclass:forAccount:](self, "shouldProvisionDataclass:forAccount:", v21, v8))
        {
          objc_msgSend(v15, "addObject:", v21);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  return v15;
}

+ (AADataclassManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_8);
  return (AADataclassManager *)(id)sharedManager_sharedManager;
}

void __35__AADataclassManager_sharedManager__block_invoke()
{
  AADataclassManager *v0;
  void *v1;

  v0 = objc_alloc_init(AADataclassManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (AADataclassManager)init
{
  AADataclassManager *v2;
  uint64_t v3;
  ACAccountStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AADataclassManager;
  v2 = -[AADataclassManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v3 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (ACAccountStore *)v3;

  }
  return v2;
}

- (AADataclassManager)initWithAccountStore:(id)a3
{
  id v5;
  AADataclassManager *v6;
  AADataclassManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AADataclassManager;
  v6 = -[AADataclassManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

+ (id)appBundleIdentifierDictionary
{
  if (appBundleIdentifierDictionary_onceToken != -1)
    dispatch_once(&appBundleIdentifierDictionary_onceToken, &__block_literal_global_70);
  return (id)appBundleIdentifierDictionary_bundleIdentifierDictionary;
}

void __51__AADataclassManager_appBundleIdentifierDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobilesafari"), *MEMORY[0x1E0C8EE20]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobilecal"), *MEMORY[0x1E0C8EE58]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.MobileAddressBook"), *MEMORY[0x1E0C8EE68]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.freeform"), *MEMORY[0x1E0C8EE88]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.Home"), *MEMORY[0x1E0C8EE98]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobilemail"), *MEMORY[0x1E0C8EEB0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.news"), *MEMORY[0x1E0C8EED0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobilenotes"), *MEMORY[0x1E0C8EED8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.reminders"), *MEMORY[0x1E0C8EEF8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.stocks"), *MEMORY[0x1E0C8EF20]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.MobileSMS"), *MEMORY[0x1E0C8EEC0]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.Health"), *MEMORY[0x1E0C8EE90]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.DocumentsApp"), *MEMORY[0x1E0C8EF28]);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)appBundleIdentifierDictionary_bundleIdentifierDictionary;
  appBundleIdentifierDictionary_bundleIdentifierDictionary = v0;

}

- (id)appBundleIdentifierForDataclass:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[AADataclassManager appBundleIdentifierDictionary](AADataclassManager, "appBundleIdentifierDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isRestrictedForDataclass:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8EE18]);
  if (v6 && v7 && !objc_msgSend(v6, "aa_isAccountClass:", CFSTR("primary")))
  {
    v10 = 0;
  }
  else
  {
    if (_isRestrictedForDataclass_account__onceToken != -1)
      dispatch_once(&_isRestrictedForDataclass_account__onceToken, &__block_literal_global_72);
    objc_msgSend((id)_isRestrictedForDataclass_account__dataclassToFeatureDictionary, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLRestrictionForFeature:", v8) == 2;

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

void __56__AADataclassManager__isRestrictedForDataclass_account___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[10];
  _QWORD v16[11];

  v16[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D46FA8];
  v1 = *MEMORY[0x1E0C8EEB8];
  v15[0] = *MEMORY[0x1E0C8EEA0];
  v15[1] = v1;
  v2 = *MEMORY[0x1E0D47108];
  v16[0] = v0;
  v16[1] = v2;
  v3 = *MEMORY[0x1E0D47150];
  v4 = *MEMORY[0x1E0C8EF10];
  v15[2] = *MEMORY[0x1E0C8EF08];
  v15[3] = v4;
  v5 = *MEMORY[0x1E0D46F90];
  v16[2] = v3;
  v16[3] = v5;
  v6 = *MEMORY[0x1E0D46FA0];
  v7 = *MEMORY[0x1E0C8EE78];
  v15[4] = *MEMORY[0x1E0C8EE18];
  v15[5] = v7;
  v8 = *MEMORY[0x1E0D47008];
  v16[4] = v6;
  v16[5] = v8;
  v9 = *MEMORY[0x1E0D47068];
  v10 = *MEMORY[0x1E0C8EE98];
  v15[6] = *MEMORY[0x1E0C8EE90];
  v15[7] = v10;
  v11 = *MEMORY[0x1E0D47078];
  v16[6] = v9;
  v16[7] = v11;
  v12 = *MEMORY[0x1E0C8EF28];
  v15[8] = *MEMORY[0x1E0C8EED0];
  v15[9] = v12;
  v16[8] = *MEMORY[0x1E0D470F0];
  v16[9] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)_isRestrictedForDataclass_account__dataclassToFeatureDictionary;
  _isRestrictedForDataclass_account__dataclassToFeatureDictionary = v13;

}

- (BOOL)policyRestrictsDataclass:(id)a3
{
  return +[AACloudPolicyRestrictions policyRestrictsDataclass:](AACloudPolicyRestrictions, "policyRestrictsDataclass:", a3);
}

- (BOOL)isSystemAppRestrictedOrRemovedForDataclass:(id)a3
{
  return -[AADataclassManager isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:](self, "isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:", a3, 0);
}

- (BOOL)isSystemAppMCRestrictedOrRemovedForDataclass:(id)a3 forAccount:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v16;
  char v17;
  void *v18;
  int v19;
  const __CFString *v20;
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[AADataclassManager _isRestrictedForDataclass:account:](self, "_isRestrictedForDataclass:account:", v6, a4))
  {
    +[AADataclassManager sharedManager](AADataclassManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appBundleIdentifierForDataclass:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      _AALogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[AADataclassManager isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:].cold.1();
      v7 = 0;
      goto LABEL_17;
    }
    v21 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, &v21);
    v11 = v21;
    if (v10)
    {
      objc_msgSend(v10, "applicationState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isRestricted");

      if (v13)
      {
        _AALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "applicationState");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isRestricted");
          v20 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          if (v19)
            v20 = CFSTR("YES");
          v23 = v20;
          v24 = 2112;
          v25 = v6;
          v26 = 2112;
          v27 = v9;
          _os_log_debug_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEBUG, "App state isRestricted is (%@) for dataclass %@ with bundleid %@", buf, 0x20u);

        }
LABEL_7:
        v7 = 1;
LABEL_15:

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v10, "applicationState");
      v14 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isInstalled](v14, "isInstalled") & 1) == 0)
      {
        objc_msgSend(v10, "applicationState");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isPlaceholder");

        if ((v17 & 1) != 0
          || !-[AADataclassManager _hideDataclassWhenAppRemoved:](self, "_hideDataclassWhenAppRemoved:", v6))
        {
          v7 = 0;
          goto LABEL_16;
        }
        _AALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[AADataclassManager isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:].cold.3();
        goto LABEL_7;
      }
    }
    else
    {
      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[AADataclassManager isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:].cold.2();
    }
    v7 = 0;
    goto LABEL_15;
  }
  v7 = 1;
LABEL_18:

  return v7;
}

- (BOOL)_hideDataclassWhenAppRemoved:(id)a3
{
  return !-[AADataclassManager _shouldShowDataclassWhenAppIsRemoved:](self, "_shouldShowDataclassWhenAppIsRemoved:", a3);
}

- (BOOL)_shouldShowDataclassWhenAppIsRemoved:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _shouldShowDataclassWhenAppIsRemoved__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_shouldShowDataclassWhenAppIsRemoved__onceToken, &__block_literal_global_81);
  v5 = objc_msgSend((id)_shouldShowDataclassWhenAppIsRemoved__dataclassesToKeep, "containsObject:", v4);

  return v5;
}

void __59__AADataclassManager__shouldShowDataclassWhenAppIsRemoved___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C8EE68];
  v5[0] = *MEMORY[0x1E0C8EE58];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0C8EE98];
  v5[2] = *MEMORY[0x1E0C8EE90];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0C8EF28];
  v5[4] = *MEMORY[0x1E0C8EEF8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_shouldShowDataclassWhenAppIsRemoved__dataclassesToKeep;
  _shouldShowDataclassWhenAppIsRemoved__dataclassesToKeep = v3;

}

- (BOOL)canAutoEnableDataclass:(id)a3 forAccount:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclass"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Checking if we need to auto-enable: %@", buf, 0xCu);
  }

  if (!objc_msgSend(v9, "aa_isPrimaryEmailVerified"))
    goto LABEL_17;
  -[AADataclassManager _userVisibleDataclasses](self, "_userVisibleDataclasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "containsObject:", v7))
  {

  }
  else
  {
    -[AADataclassManager _nonVisibleServiceDataclass](self, "_nonVisibleServiceDataclass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v7);

    if (!v13)
    {
LABEL_17:
      v14 = 0;
      goto LABEL_18;
    }
  }
  if (-[AADataclassManager _isRestrictedForDataclass:account:](self, "_isRestrictedForDataclass:account:", v7, v9)
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EE18])
    && +[AAPreferences isRunningInStoreDemoMode](AAPreferences, "isRunningInStoreDemoMode")
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EE78]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EEE8]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EEB8]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EF08]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EEC0]) & 1) != 0)
  {
    goto LABEL_17;
  }
  v18 = *MEMORY[0x1E0C8EEB0];
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EEB0]))
  {
    +[AADataclassManager sharedManager](AADataclassManager, "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:", v18, v9);

    v14 = (objc_msgSend(v9, "aa_needsEmailConfiguration") | v20) ^ 1;
  }
  else
  {
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EE90])
      && +[AADeviceModelHelper isDeviceiPad](AADeviceModelHelper, "isDeviceiPad"))
    {
      _AALogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "Health Dataclass. Setting auto-enable for iPad to false.", buf, 2u);
      }

      goto LABEL_17;
    }
    v14 = 1;
  }
LABEL_18:
  if (objc_msgSend(v9, "aa_isManagedAppleID"))
  {
    if ((v14 & ~objc_msgSend(v9, "aa_serverDisabledDataclass:", v7) & 1) == 0)
    {
LABEL_20:
      _AALogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Skipping auto-enable for %@", buf, 0xCu);
      }
      v16 = 0;
      goto LABEL_27;
    }
  }
  else if (!v14)
  {
    goto LABEL_20;
  }
  _AALogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "Auto-enabling dataclass: %@", buf, 0xCu);
  }
  v16 = 1;
LABEL_27:

  return v16;
}

- (BOOL)shouldProvisionDataclass:(id)a3 forAccount:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 521, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclass"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  +[AADataclassManager sharedManager](AADataclassManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:", v7, v9);

  if (v11)
  {
    _AALogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AADataclassManager shouldProvisionDataclass:forAccount:].cold.1();

    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EEC8])
    || +[AAPreferences isMomentsDataclassEnabled](AAPreferences, "isMomentsDataclassEnabled")
    && +[AADeviceModelHelper isDeviceiPhone](AADeviceModelHelper, "isDeviceiPhone"))
  {
    objc_msgSend(v9, "aa_accountClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("primary")) & 1) != 0)
    {
      v14 = 1;
LABEL_22:

      goto LABEL_23;
    }
    -[AADataclassManager _filteredDataclassesForAccountClass:](self, "_filteredDataclassesForAccountClass:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "containsObject:", v7))
    {
      if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EED8]))
      {
        v16 = -[AADataclassManager _shouldProvisionNotesForAccount:](self, "_shouldProvisionNotesForAccount:", v9);
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8EEF8]))
        {
          v14 = 1;
          goto LABEL_21;
        }
        v16 = -[AADataclassManager _shouldProvisionRemindersForAccount:](self, "_shouldProvisionRemindersForAccount:", v9);
      }
      v14 = v16;
    }
    else
    {
      v14 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_12:
  v14 = 0;
LABEL_23:

  return v14;
}

- (BOOL)_shouldProvisionNotesForAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  BOOL v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 580, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  objc_msgSend(v5, "aa_accountClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("primary")))
  {

LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v5, "aa_accountClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("full"));

  if ((v8 & 1) != 0 || !objc_msgSend(v5, "aa_isNotesMigrated"))
    goto LABEL_10;
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AADataclassManager _shouldProvisionNotesForAccount:].cold.1();

  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_shouldProvisionRemindersForAccount:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  BOOL v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  objc_msgSend(v5, "aa_accountClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("primary")))
  {

LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v5, "aa_accountClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("full"));

  if ((v8 & 1) != 0 || !objc_msgSend(v5, "aa_isRemindersMigrated"))
    goto LABEL_10;
  _AALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AADataclassManager _shouldProvisionRemindersForAccount:].cold.1();

  v10 = 0;
LABEL_11:

  return v10;
}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  ACAccountStore *store;
  _QWORD v11[4];
  id v12;
  _BYTE *v13;
  _BYTE buf[24];
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AADataclassManager filterDataclassesForPossibleAutoEnablementForAccount:](self, "filterDataclassesForPossibleAutoEnablementForAccount:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[AADataclassManager enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:fromAccount:completion:](self, "enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:fromAccount:completion:", v8, v6, v7);
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[AADataclassManager enableDataclassesWithoutLocalDataDataclassActionsForAccount:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "%s - There are no auto-enableable dataclasses for account %@. Proceeding with save.", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = (id)os_transaction_create();
    store = self->_store;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke;
    v11[3] = &unk_1E416EC08;
    v12 = v7;
    v13 = buf;
    -[ACAccountStore saveAccount:withCompletionHandler:](store, "saveAccount:withCompletionHandler:", v6, v11);

    _Block_object_dispose(buf, 8);
  }

}

void __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void (*v7)(void);
  uint64_t v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Save without auto-enableable dataclasses successful completed.", v10, 2u);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:(id)a3 fromAccount:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 637, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclasses"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AADataclassManager.m"), 639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v10;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to auto-enable dataclasses for account (%@): %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke;
  v18[3] = &unk_1E416EC58;
  objc_copyWeak(&v21, (id *)buf);
  v13 = v11;
  v20 = v13;
  v14 = v10;
  v19 = v14;
  -[AADataclassManager _buildAutoEnableableDataclassesAndActionsForAccount:dataclassesForEnablement:completion:](self, "_buildAutoEnableableDataclassesAndActionsForAccount:dataclassesForEnablement:completion:", v14, v9, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);

}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *WeakRetained;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dataclasses"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dataclassActions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "Filtered dataclasses: %@", (uint8_t *)&buf, 0xCu);
    }

    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "Filtered dataclass actions: %@", (uint8_t *)&buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__1;
      v26 = __Block_byref_object_dispose__1;
      v27 = (id)os_transaction_create();
      v12 = (void *)WeakRetained[1];
      v13 = *(void **)(a1 + 32);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_90;
      v18[3] = &unk_1E416EC30;
      v19 = v13;
      v20 = v8;
      v21 = *(id *)(a1 + 40);
      p_buf = &buf;
      objc_msgSend(v12, "saveAccount:withDataclassActions:doVerify:completion:", v19, v20, 1, v18);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      _AALogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_2(v15);

      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AASignInErrors"), -8015, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v17);

    }
  }
  else
  {
    _AALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_90(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    v8 = a1[4];
    v9 = a1[5];
    if (a2)
      v7 = CFSTR("YES");
    v13 = 138412802;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Account save with dataclass actions had success (%@) for account (%@) with dataclass actions: %@", (uint8_t *)&v13, 0x20u);
  }

  if (v5)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_90_cold_1();

  }
  (*(void (**)(void))(a1[6] + 16))();
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

- (void)_buildAutoEnableableDataclassesAndActionsForAccount:(id)a3 dataclassesForEnablement:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  ACAccountStore *store;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(id *, void *, void *);
  void *v33;
  AADataclassManager *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  v29 = (void *)objc_msgSend(v9, "mutableCopy");
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v40;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v8, "setEnabled:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v15++), v29);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v13);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = objc_msgSend(v8, "aa_isPrimaryEmailVerified");
  store = self->_store;
  v38 = 0;
  -[ACAccountStore dataclassActionsForAccountSave:error:](store, "dataclassActionsForAccountSave:error:", v8, &v38);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v38;
  v21 = v20;
  if (v19)
  {
    _AALogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v19;
      _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "We have potential dataclass actions: %@", buf, 0xCu);
    }

    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __110__AADataclassManager__buildAutoEnableableDataclassesAndActionsForAccount_dataclassesForEnablement_completion___block_invoke;
    v33 = &unk_1E416EC80;
    v34 = self;
    v35 = v23;
    v24 = v29;
    v36 = v29;
    v37 = v8;
    v25 = v23;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &v30);
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("dataclassActions"));

    goto LABEL_12;
  }
  v24 = v29;
  if (!v20)
  {
LABEL_12:
    if (v17 != objc_msgSend(v8, "aa_isPrimaryEmailVerified", v29, v30, v31, v32, v33, v34))
      objc_msgSend(v8, "aa_setPrimaryEmailVerified:", 1);
    v27 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, CFSTR("dataclasses"));

    v10[2](v10, v16, 0);
    goto LABEL_19;
  }
  _AALogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[AADataclassManager _buildAutoEnableableDataclassesAndActionsForAccount:dataclassesForEnablement:completion:].cold.1();

  ((void (**)(id, id, void *))v10)[2](v10, 0, v21);
LABEL_19:

}

void __110__AADataclassManager__buildAutoEnableableDataclassesAndActionsForAccount_dataclassesForEnablement_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(v6, "count");
    _AALogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 == 1)
    {
      if (v9)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 134218242;
        v15 = objc_msgSend(v10, "type");
        v16 = 2112;
        v17 = (uint64_t)v5;
        _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Action %lu available for %@", (uint8_t *)&v14, 0x16u);

      }
      objc_msgSend(v6, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1[4], "isDataclassActionSafeForAutoEnablement:", v11))
      {
        objc_msgSend(a1[5], "setObject:forKey:", v11, v5);
      }
      else
      {
        _ACLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(v11, "type");
          v14 = 138412546;
          v15 = (uint64_t)v5;
          v16 = 2048;
          v17 = v13;
          _os_log_impl(&dword_19EACA000, v12, OS_LOG_TYPE_DEFAULT, "\"Not enabling dataclass %@ as only action %lu is not safe for auto enablement.\", (uint8_t *)&v14, 0x16u);
        }

        objc_msgSend(a1[6], "removeObject:", v5);
        objc_msgSend(a1[7], "setEnabled:forDataclass:", 0, v5);
      }

    }
    else
    {
      if (v9)
      {
        v14 = 138412290;
        v15 = (uint64_t)v5;
        _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "Unable to auto-enable dataclass %@ as enablement requires a user decision.", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(a1[6], "removeObject:", v5);
      objc_msgSend(a1[7], "setEnabled:forDataclass:", 0, v5);
    }
  }

}

- (BOOL)isDataclassActionSafeForAutoEnablement:(id)a3
{
  return objc_msgSend(a3, "isSafeForAutoEnablement");
}

- (id)filterDataclassesForPossibleAutoEnablementForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "provisionedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__AADataclassManager_filterDataclassesForPossibleAutoEnablementForAccount___block_invoke;
  v9[3] = &unk_1E416ECA8;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "aaf_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __75__AADataclassManager_filterDataclassesForPossibleAutoEnablementForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isProvisionedForDataclass:", v3)
    && (objc_msgSend(*(id *)(a1 + 32), "isEnabledForDataclass:", v3) & 1) == 0)
  {
    +[AADataclassManager sharedManager](AADataclassManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "canAutoEnableDataclass:forAccount:", v3, *(_QWORD *)(a1 + 32));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)filteredServerProvidedFeatures:forAccount:.cold.1()
{
  __assert_rtn("-[AADataclassManager filteredServerProvidedFeatures:forAccount:]", "AADataclassManager.m", 235, "[dataclass isKindOfClass:[NSString class]]");
}

- (void)isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "Nil bundle ID passed. No reason to consider restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "Error creating appRecord. No reason to consider restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  v5 = 2112;
  v6 = CFSTR("YES");
  _os_log_debug_impl(&dword_19EACA000, v1, OS_LOG_TYPE_DEBUG, "Dataclass %@ with bundleid %@ is installed or placeholder: %@", v2, 0x20u);
}

- (void)shouldProvisionDataclass:forAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "System app is restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_shouldProvisionNotesForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "Notes is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_shouldProvisionRemindersForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_19EACA000, v0, v1, "Reminders is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __93__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForAccount_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to save account without auto-enableable dataclasses with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Unable to build list of dataclasses and actions for enablement %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "AADataclassManager failed to maintain ref to self.", v1, 2u);
}

void __109__AADataclassManager_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion___block_invoke_90_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Encountered error when saving with dataclass actions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_buildAutoEnableableDataclassesAndActionsForAccount:dataclassesForEnablement:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, v0, v1, "Failed to get dataclass actions for account, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
