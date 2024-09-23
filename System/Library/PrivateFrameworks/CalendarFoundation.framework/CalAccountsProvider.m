@implementation CalAccountsProvider

+ (id)defaultProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CalAccountsProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_onceToken_1 != -1)
    dispatch_once(&defaultProvider_onceToken_1, block);
  return (id)defaultProvider_defaultProvider;
}

void __38__CalAccountsProvider_defaultProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultProvider_defaultProvider;
  defaultProvider_defaultProvider = (uint64_t)v1;

}

- (CalAccountsProvider)init
{
  CalAccountsProvider *v2;
  void *v3;
  void *v4;
  ACAccountStore *v5;
  ACAccountStore *accountStore;
  uint64_t v7;
  NSMutableArray *accountsWhenRunningUnitTests;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CalAccountsProvider;
  v2 = -[CalAccountsProvider init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.CalendarAgent")))
      v5 = (ACAccountStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B8]), "initWithEffectiveBundleID:", CFSTR("com.apple.iCal"));
    else
      v5 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    accountsWhenRunningUnitTests = v2->_accountsWhenRunningUnitTests;
    v2->_accountsWhenRunningUnitTests = (NSMutableArray *)v7;

  }
  return v2;
}

- (BOOL)runningUnitTests
{
  return self->_runningUnitTests;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSArray)enabledAccounts
{
  void *v3;
  void *v4;

  -[CalAccountsProvider _supportedDataclassesForMainBundleID](self, "_supportedDataclassesForMainBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalAccountsProvider _accountsEnabledForDataClasses:](self, "_accountsEnabledForDataClasses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)_supportedDataclassesForMainBundleID
{
  void *v3;
  void *v4;

  -[CalAccountsProvider _mainBundleID](self, "_mainBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalAccountsProvider _supportedDataclassesForBundleID:](self, "_supportedDataclassesForBundleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_supportedDataclassesForBundleID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CalAccountsProvider _bundleIDSupportsDataclassCalendars:](self, "_bundleIDSupportsDataclassCalendars:", v4))
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F378]);
  if (!CalIsReminderBridgeEnabled()
    && -[CalAccountsProvider _bundleIDSupportsDataclassReminders:](self, "_bundleIDSupportsDataclassReminders:", v4))
  {
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F400]);
  }

  return v5;
}

- (NSArray)allAccounts
{
  return (NSArray *)-[CalAccountsProvider allAccountsWithError:](self, "allAccountsWithError:", 0);
}

- (id)allAccountsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[CalAccountsProvider runningUnitTests](self, "runningUnitTests"))
  {
    -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingTest:", &__block_literal_global_37);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = *MEMORY[0x1E0C8F080];
    v26[0] = *MEMORY[0x1E0C8F058];
    v26[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(obj);
          -[CalAccountsProvider accountTypeWithIdentifier:](self, "accountTypeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_opt_class();
          -[CalAccountsProvider accountStore](self, "accountStore");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          objc_msgSend(v15, "_accountsWithAccountType:inStore:error:", v14, v16, &v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v21;

          objc_msgSend(v8, "addObjectsFromArray:", v17);
          if (a3 && v18)
          {
            v19 = objc_retainAutorelease(v18);
            *a3 = v19;

            v8 = 0;
            goto LABEL_14;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

    return v8;
  }
}

- (id)accountTypeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CalAccountsProvider accountStore](self, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accountTypeWithIdentifier:inStore:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_accountTypeWithIdentifier:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v7 = dispatch_semaphore_create(0);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __58__CalAccountsProvider__accountTypeWithIdentifier_inStore___block_invoke;
  v16 = &unk_1E2A85CA8;
  v18 = &v19;
  v8 = v7;
  v17 = v8;
  objc_msgSend(v6, "accountTypeWithIdentifier:completion:", v5, &v13);
  v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9) >= 1)
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts", v13, v14, v15, v16);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CalAccountsProvider _accountTypeWithIdentifier:inStore:].cold.1();

  }
  v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __58__CalAccountsProvider__accountTypeWithIdentifier_inStore___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)_accountsWithAccountType:(id)a3 inStore:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v8 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__8;
  v23 = __Block_byref_object_dispose__8;
  v24 = 0;
  v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__CalAccountsProvider__accountsWithAccountType_inStore_error___block_invoke;
  v15[3] = &unk_1E2A85C80;
  v17 = &v25;
  v18 = &v19;
  v10 = v9;
  v16 = v10;
  objc_msgSend(v8, "accountsWithAccountType:completion:", v7, v15);
  v11 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v10, v11) >= 1)
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CalAccountsProvider _accountsWithAccountType:inStore:error:].cold.1();

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v20[5]);
  v13 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __62__CalAccountsProvider__accountsWithAccountType_inStore_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)delegatePrincipalUIDsForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "calPrincipals", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v3, "calMainPrincipalUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v11);

        if ((v13 & 1) == 0)
          objc_msgSend(v4, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v4;
}

- (NSArray)accountsEnabledForCalendar
{
  void *v3;
  _BOOL4 v4;
  void *v5;

  -[CalAccountsProvider _mainBundleID](self, "_mainBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CalAccountsProvider _bundleIDSupportsDataclassCalendars:](self, "_bundleIDSupportsDataclassCalendars:", v3);

  if (v4)
  {
    -[CalAccountsProvider _accountsEnabledForDataClass:](self, "_accountsEnabledForDataClass:", *MEMORY[0x1E0C8F378]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (NSArray)accountsEnabledForReminders
{
  void *v3;
  _BOOL4 v4;
  void *v5;

  if (CalIsReminderBridgeEnabled()
    || (-[CalAccountsProvider _mainBundleID](self, "_mainBundleID"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = -[CalAccountsProvider _bundleIDSupportsDataclassReminders:](self, "_bundleIDSupportsDataclassReminders:", v3), v3, !v4))
  {
    v5 = 0;
  }
  else
  {
    -[CalAccountsProvider _accountsEnabledForDataClass:](self, "_accountsEnabledForDataClass:", *MEMORY[0x1E0C8F400]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v5;
}

- (BOOL)account:(id)a3 hasServerURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(v5, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueStringsForHostname:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "calHostname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v9, "containsObject:", v10);
  return (char)v6;
}

- (BOOL)accountIsDuplicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CalAccountsProvider accountStore](self, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "accountIsDuplicate:inStore:", v4, v6);

  return (char)v5;
}

- (id)accountsWithServerURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueStringsForHostname:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CalAccountsProvider allAccounts](self, "allAccounts", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "calHostname");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v8, "containsObject:", v15);

          if (v16)
            objc_msgSend(v5, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  return v5;
}

- (id)accountsWithUsername:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "_uniqueStringsForUsername:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CalAccountsProvider allAccounts](self, "allAccounts", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "username");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v6, "containsObject:", v13);

          if (v14)
            objc_msgSend(v5, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

  }
  return v5;
}

- (id)accountsWithServerURL:(id)a3 username:(id)a4 returnCachedVersions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99E20];
  -[CalAccountsProvider accountsWithServerURL:](self, "accountsWithServerURL:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  -[CalAccountsProvider accountsWithUsername:](self, "accountsWithUsername:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", CFSTR("identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "intersectSet:", v16);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        -[CalAccountsProvider accountWithIdentifier:returnCachedVersion:](self, "accountWithIdentifier:returnCachedVersion:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22), v5, (_QWORD)v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  return v17;
}

- (id)accountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CalAccountsProvider runningUnitTests](self, "runningUnitTests"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if (v11)
          {
            v12 = v9;
            goto LABEL_13;
          }
        }
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    -[CalAccountsProvider accountStore](self, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithIdentifier:", v4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v6 = v12;
  }

  return v6;
}

- (id)primaryAppleAccount
{
  void *v2;
  void *v3;

  -[CalAccountsProvider accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __44__CalAccountsProvider_allAccountsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "calIsCalDAVAccount") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "calIsExchangeAccount");

  return v3;
}

- (id)accountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[CalAccountsProvider accountStore](self, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountTypeWithAccountTypeIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalAccountsProvider accountStore](self, "accountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountsWithAccountType:options:error:", v8, 0, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)clientTokenForAccountWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[CalAccountsProvider accountWithIdentifier:returnCachedVersion:](self, "accountWithIdentifier:returnCachedVersion:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)existingAccountForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[CalAccountsProvider accountStore](self, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_existingAccountForAccount:inStore:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)oauthTokenForAccount:(id)a3 tokenType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oauthToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v5, "parentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_6;
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CalAccountsProvider oauthTokenForAccount:tokenType:].cold.3(v5);

    objc_msgSend(v5, "parentAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "credential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oauthToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v11;
    if (!v8)
    {
LABEL_6:
      +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CalAccountsProvider oauthTokenForAccount:tokenType:].cold.2();

      v8 = 0;
    }
  }
  objc_msgSend(v5, "credential");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "credentialType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v6);

  if ((v16 & 1) == 0)
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CalAccountsProvider oauthTokenForAccount:tokenType:].cold.1(v5, (uint64_t)v6, v17);

    v8 = 0;
  }

  return v8;
}

- (void)removeAccount:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[CalAccountsProvider runningUnitTests](self, "runningUnitTests"))
  {
    -[CalAccountsProvider accountStore](self, "accountStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAccount:withCompletionHandler:", v6, v7);
LABEL_14:

    goto LABEL_15;
  }
  v21 = v7;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v9)
  {
LABEL_10:

LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    (*((void (**)(id, _QWORD, void *))v21 + 2))(v21, 0, v17);
    goto LABEL_14;
  }
  v10 = v9;
  v11 = *(_QWORD *)v23;
LABEL_4:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v23 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
      break;
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "indexOfObject:", v13);

  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_13;
  -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectAtIndex:", v19);

  v7 = v21;
  (*((void (**)(id, uint64_t, _QWORD))v21 + 2))(v21, 1, 0);
LABEL_15:

}

- (BOOL)removeAccount:(id)a3 withError:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  char v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__CalAccountsProvider_removeAccount_withError___block_invoke;
  v11[3] = &unk_1E2A85C30;
  v13 = &v21;
  v14 = &v15;
  v8 = v7;
  v12 = v8;
  -[CalAccountsProvider removeAccount:withCompletionHandler:](self, "removeAccount:withCompletionHandler:", v6, v11);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __47__CalAccountsProvider_removeAccount_withError___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)renewCredentialsForAccount:(id)a3
{
  return -[CalAccountsProvider renewCredentialsForAccount:forceRenewal:](self, "renewCredentialsForAccount:forceRenewal:", a3, 0);
}

- (BOOL)renewCredentialsForAccount:(id)a3 forceRenewal:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  intptr_t (*v15)(uint64_t, uint64_t);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a4;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v7 = dispatch_semaphore_create(0);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __63__CalAccountsProvider_renewCredentialsForAccount_forceRenewal___block_invoke;
  v16 = &unk_1E2A85C58;
  v18 = &v19;
  v8 = v7;
  v17 = v8;
  -[CalAccountsProvider renewCredentialsForAccount:forceRenewal:withCompletionHandler:](self, "renewCredentialsForAccount:forceRenewal:withCompletionHandler:", v6, v4, &v13);
  v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9) >= 1)
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts", v13, v14, v15, v16);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CalAccountsProvider renewCredentialsForAccount:forceRenewal:].cold.1();

  }
  v11 = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v11;
}

intptr_t __63__CalAccountsProvider_renewCredentialsForAccount_forceRenewal___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)renewCredentialsForAccount:(id)a3 forceRenewal:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (v9 && ((objc_msgSend(v9, "isAuthenticated") & 1) != 0 || v6))
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v22 = v14;
      v23 = 2112;
      v24 = v9;
      v25 = 1024;
      v26 = objc_msgSend(v9, "isAuthenticated");
      v27 = 1024;
      v28 = v6;
      _os_log_impl(&dword_18FC12000, v13, OS_LOG_TYPE_DEFAULT, "Telling store to renew credentials in %@. %@ is authenticated: %d and forceRenewal: %d", buf, 0x22u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6, *MEMORY[0x1E0C8F330]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    v19[1] = *MEMORY[0x1E0C8F320];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 ^ 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[CalAccountsProvider accountStore](self, "accountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "renewCredentialsForAccount:options:completion:", v9, v17, v10);

  }
  else
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_18FC12000, v11, OS_LOG_TYPE_DEFAULT, "We're ignoring a call to %@. %@ is unauthenticated and forceRenewal equals NO.", buf, 0x16u);

    }
    if (v10)
      v10[2](v10, 2, 0);
  }

}

- (void)saveAccount:(id)a3 verify:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void (**v24)(id, uint64_t, _QWORD);
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[CalAccountsProvider runningUnitTests](self, "runningUnitTests"))
  {
    v24 = v9;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "indexOfObject:", v15);

      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_17;
      -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:atIndexedSubscript:", v8, v22);
    }
    else
    {
LABEL_10:

LABEL_17:
      -[CalAccountsProvider accountsWhenRunningUnitTests](self, "accountsWhenRunningUnitTests");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v8);
    }
    v9 = v24;

    v9[2](v9, 1, 0);
  }
  else
  {
    if ((objc_msgSend(v8, "calIsDirty") & 1) == 0)
    {
      +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[CalAccountsProvider saveAccount:verify:withCompletionHandler:].cold.1();

    }
    -[CalAccountsProvider accountStore](self, "accountStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "saveAccount:withDataclassActions:doVerify:completion:", v8, 0, v6, v9);

  }
}

- (void)saveAccount:(id)a3 withCompletionHandler:(id)a4
{
  -[CalAccountsProvider saveAccount:verify:withCompletionHandler:](self, "saveAccount:verify:withCompletionHandler:", a3, 1, a4);
}

- (BOOL)saveAccount:(id)a3 verify:(BOOL)a4 withError:(id *)a5
{
  _BOOL8 v6;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  char v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a4;
  v8 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  v9 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__CalAccountsProvider_saveAccount_verify_withError___block_invoke;
  v13[3] = &unk_1E2A85C30;
  v15 = &v23;
  v16 = &v17;
  v10 = v9;
  v14 = v10;
  -[CalAccountsProvider saveAccount:verify:withCompletionHandler:](self, "saveAccount:verify:withCompletionHandler:", v8, v6, v13);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v18[5]);
  v11 = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __52__CalAccountsProvider_saveAccount_verify_withError___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)saveAccount:(id)a3 withError:(id *)a4
{
  return -[CalAccountsProvider saveAccount:verify:withError:](self, "saveAccount:verify:withError:", a3, 1, a4);
}

+ (BOOL)accountIsDuplicate:(id)a3 inStore:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a1, "_existingAccountForAccount:inStore:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

+ (id)uniqueStringsForHostname:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "CDVStringByAppendingSlashIfNeeded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(v3, "CDVStringByRemovingTerminatingSlashIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)uniqueStringsForPrincipalPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "addObject:", v3);
    objc_msgSend(v3, "CDVStringByRemovingPercentEscapesForHREF");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
    objc_msgSend(v5, "CDVStringByAppendingSlashIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(v5, "CDVStringByRemovingTerminatingSlashIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);
    objc_msgSend(v3, "CDVStringByAddingPercentEscapesForHREF");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);
    objc_msgSend(v8, "CDVStringByAppendingSlashIfNeeded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);
    objc_msgSend(v8, "CDVStringByRemovingTerminatingSlashIfNeeded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  return v4;
}

+ (id)verboseDescriptionForAccount:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "accountDescription");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v4, "length"))
  {
    +[CalAccountsProvider defaultProvider](CalAccountsProvider, "defaultProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "parentAccountIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithIdentifier:returnCachedVersion:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "accountDescription");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v8;
  }
  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("UNAVAILABLE");
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentAccountIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  v15 = CFSTR("YES");
  if (!v14)
    v15 = CFSTR("NO");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ (identifier=%@; type=%@; childAccount=%@)"), v4, v10, v12, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_accountsEnabledForDataClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CalAccountsProvider allAccounts](self, "allAccounts", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "enabledDataclasses");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_accountsEnabledForDataClasses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CalAccountsProvider allAccounts](self, "allAccounts", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "enabledDataclasses");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "intersectsSet:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_existingAccountForAccount:(id)a3 inStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  __int128 v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "calIsCalDAVAccount") & 1) != 0)
  {
    objc_msgSend(v6, "calMainPrincipalUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:forPrincipalWithUID:", CFSTR("PrincipalPath"), v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "calHostname");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "uniqueStringsForHostname:", v10);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "uniqueStringsForPrincipalPath:", v9);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_uniqueStringsForUsername:", v11);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    +[CalAccountsProvider defaultProvider](CalAccountsProvider, "defaultProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "runningUnitTests");

    if (v13)
    {
      +[CalAccountsProvider defaultProvider](CalAccountsProvider, "defaultProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allAccounts");
    }
    else
    {
      objc_msgSend(a1, "_accountTypeWithIdentifier:inStore:", *MEMORY[0x1E0C8F058], v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_accountsWithAccountType:inStore:error:", v14, v7, 0);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v17)
    {
      v19 = v17;
      v46 = v9;
      v47 = v7;
      v20 = *(_QWORD *)v53;
      *(_QWORD *)&v18 = 138413058;
      v45 = v18;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v6, "identifier", v45);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqualToString:", v24);

          if ((v25 & 1) == 0)
          {
            objc_msgSend(v6, "parentAccount");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "accountType");
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "parentAccount");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "accountType");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend((id)v27, "isEqual:", v29);

            objc_msgSend(v22, "username");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v27) = objc_msgSend(v50, "containsObject:", v31);

            v32 = v30 & v27;
            if (v32 == 1)
            {
              +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v6, "parentAccount");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "parentAccount");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "accountType");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v45;
                v57 = v6;
                v58 = 2112;
                v59 = v50;
                v60 = 2112;
                v61 = v39;
                v62 = 2112;
                v63 = v41;
                _os_log_error_impl(&dword_18FC12000, v33, OS_LOG_TYPE_ERROR, "Account [%@] has the same user name as an existing account. uniqueUsernames:[%@] parentAccount:[%@] parentAccountType:[%@]", buf, 0x2Au);

              }
            }
            objc_msgSend(v22, "calHostname");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v49, "containsObject:", v34);

            objc_msgSend(v22, "calMainPrincipalUID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "valueForKey:forPrincipalWithUID:", CFSTR("PrincipalPath"), v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v48, "containsObject:", v37);

            if (((v32 | v35 ^ 1) & 1) == 0 && v38)
            {
              +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                +[CalAccountsProvider _existingAccountForAccount:inStore:].cold.2();

LABEL_28:
              +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                +[CalAccountsProvider _existingAccountForAccount:inStore:].cold.1();

              v15 = v22;
              goto LABEL_31;
            }
            if (v32)
              goto LABEL_28;
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        if (v19)
          continue;
        break;
      }
      v15 = 0;
LABEL_31:
      v9 = v46;
      v7 = v47;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v6;
      _os_log_impl(&dword_18FC12000, v9, OS_LOG_TYPE_DEFAULT, "Account [%@] is not a CalDAV account. Allow the save to proceed.", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (id)_providerForCalDAVAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "parentAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "parentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accountType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8F030]) & 1) != 0)
    {
      v8 = CFSTR("icloud");
    }
    else
    {
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v3, "calHostname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "hasSuffix:", CFSTR("apple.com"));
    if (v10)
      v8 = CFSTR("apple");
    else
      v8 = 0;
  }
  -[__CFString lowercaseString](v8, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_bundleIDSupportsDataclassCalendars:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iCal")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CalendarAgent"));

  return v4;
}

- (BOOL)_bundleIDSupportsDataclassReminders:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CalendarAgent"));

  return v4;
}

- (id)_mainBundleID
{
  void *v2;
  __CFString *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v3, "length"))
  {
    +[CalFoundationLogSubsystem accounts](CalFoundationLogSubsystem, "accounts");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18FC12000, v4, OS_LOG_TYPE_DEFAULT, "Since an empty bundle was passed in, we're going to pretend that we're dealing with CalendarAgent.", v6, 2u);
    }

    v3 = CFSTR("com.apple.CalendarAgent");
  }
  return v3;
}

+ (id)_uniqueStringsForUsername:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "addObject:", v3);
    objc_msgSend(v3, "CDVStringByRemovingPercentEscapesForHREF");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(v3, "CDVStringByAddingPercentEscapesForHREF");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  return v4;
}

- (NSMutableArray)accountsWhenRunningUnitTests
{
  return self->_accountsWhenRunningUnitTests;
}

- (void)setAccountsWhenRunningUnitTests:(id)a3
{
  objc_storeStrong((id *)&self->_accountsWhenRunningUnitTests, a3);
}

- (void)setRunningUnitTests:(BOOL)a3
{
  self->_runningUnitTests = a3;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_accountsWhenRunningUnitTests, 0);
}

- (void)oauthTokenForAccount:(NSObject *)a3 tokenType:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "credential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "credentialType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = a2;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_18FC12000, a3, OS_LOG_TYPE_ERROR, "The token for %@ is not of type %@. It's %@", (uint8_t *)&v8, 0x20u);

}

- (void)oauthTokenForAccount:tokenType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "An OAuth token doesn't exist for %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)oauthTokenForAccount:(void *)a1 tokenType:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "parentAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_3(&dword_18FC12000, v2, v3, "No oauth token on child account %@.  Trying parent %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)renewCredentialsForAccount:forceRenewal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "We timed out attempting to renew credentials for %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)saveAccount:verify:withCompletionHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_3(&dword_18FC12000, v1, v2, "Someone is attempting to save a non-dirty account %@. %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_accountsWithAccountType:inStore:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "Timed out trying to accounts with type %@ from the account store.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_accountTypeWithIdentifier:inStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "Timed out trying to fetch an account type with identifier %@ from the account store.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_existingAccountForAccount:inStore:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_18FC12000, v1, OS_LOG_TYPE_ERROR, "Account [%@] is the duplicate of account [%@].", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)_existingAccountForAccount:inStore:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_18FC12000, v0, v1, "Account [%@] has the same server url and principal account.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
