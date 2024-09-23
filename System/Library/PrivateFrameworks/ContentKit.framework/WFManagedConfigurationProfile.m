@implementation WFManagedConfigurationProfile

- (WFManagedConfigurationProfile)init
{
  void *v3;
  void *v4;
  WFManagedConfigurationProfile *v5;

  -[objc_class sharedConnection](getMCProfileConnectionClass(), "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getACAccountStoreClass();
  v4 = (void *)objc_opt_new();
  v5 = -[WFManagedConfigurationProfile initWithProfileConnection:accountStore:](self, "initWithProfileConnection:accountStore:", v3, v4);

  return v5;
}

- (WFManagedConfigurationProfile)initWithProfileConnection:(id)a3 accountStore:(id)a4
{
  id v7;
  id v8;
  WFManagedConfigurationProfile *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *operatingQueue;
  uint64_t v13;
  NSMutableDictionary *accounts;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WFManagedConfigurationProfile *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WFManagedConfigurationProfile;
  v9 = -[WFManagedConfigurationProfile init](&v22, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.shortcuts.ManagedConfigurationManager.queue", v10);
    operatingQueue = v9->_operatingQueue;
    v9->_operatingQueue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    accounts = v9->_accounts;
    v9->_accounts = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v9->_accountStore, a4);
    objc_storeStrong((id *)&v9->_profileConnection, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    getMCManagedAppsChangedNotification();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFManagedConfigurationProfile profileConnection](v9, "profileConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel_handleManagedAppDidChangeNotification_, v16, v17);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    getACDAccountStoreDidChangeNotification[0]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel_handleAccountStoreDidChangeNotification_, v19, 0);

    v20 = v9;
  }

  return v9;
}

- (ACAccount)primaryAppleAccount
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14326;
  v11 = __Block_byref_object_dispose__14327;
  v12 = 0;
  -[WFManagedConfigurationProfile operatingQueue](self, "operatingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WFManagedConfigurationProfile_primaryAppleAccount__block_invoke;
  v6[3] = &unk_24C4E0590;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ACAccount *)v4;
}

- (NSSet)managedAppBundleIDs
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14326;
  v11 = __Block_byref_object_dispose__14327;
  v12 = 0;
  -[WFManagedConfigurationProfile operatingQueue](self, "operatingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WFManagedConfigurationProfile_managedAppBundleIDs__block_invoke;
  v6[3] = &unk_24C4E0590;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)removeCachedChildrenAccountForAccount:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a3;
  objc_msgSend(v10, "childAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[WFManagedConfigurationProfile accounts](self, "accounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childAccounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsForKeys:", v8);

    objc_msgSend(v10, "childAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__WFManagedConfigurationProfile_removeCachedChildrenAccountForAccount___block_invoke;
    v11[3] = &unk_24C4E05B8;
    v11[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

  }
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getACAccountIdentifierKey[0]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFManagedConfigurationProfile operatingQueue](self, "operatingQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __73__WFManagedConfigurationProfile_handleAccountStoreDidChangeNotification___block_invoke;
    v8[3] = &unk_24C4E05E0;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (void)handleManagedAppDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WFManagedConfigurationProfile operatingQueue](self, "operatingQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WFManagedConfigurationProfile_handleManagedAppDidChangeNotification___block_invoke;
  block[3] = &unk_24C4E2198;
  block[4] = self;
  dispatch_async(v4, block);

}

- (OS_dispatch_queue)operatingQueue
{
  return self->_operatingQueue;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSMutableDictionary)accounts
{
  return self->_accounts;
}

- (NSMutableDictionary)accountIdentifiersByDataClass
{
  return self->_accountIdentifiersByDataClass;
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_accountIdentifiersByDataClass, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_operatingQueue, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccount, 0);
  objc_storeStrong((id *)&self->_managedAppBundleIDs, 0);
}

void __71__WFManagedConfigurationProfile_handleManagedAppDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = 0;

  }
}

void __73__WFManagedConfigurationProfile_handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v12 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithIdentifier:", *(_QWORD *)(a1 + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "removeCachedChildrenAccountForAccount:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "accountIdentifiersByDataClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

uint64_t __71__WFManagedConfigurationProfile_removeCachedChildrenAccountForAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeCachedChildrenAccountForAccount:", a2);
}

void __52__WFManagedConfigurationProfile_managedAppBundleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(v2 + 56), "managedAppBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

void __52__WFManagedConfigurationProfile_primaryAppleAccount__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_msgSend(v2, "accountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_primaryAppleAccount");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

+ (WFManagedConfigurationProfile)defaultProfile
{
  if (defaultProfile_onceToken != -1)
    dispatch_once(&defaultProfile_onceToken, &__block_literal_global_14343);
  return (WFManagedConfigurationProfile *)(id)defaultProfile_defaultProfile;
}

void __47__WFManagedConfigurationProfile_defaultProfile__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)defaultProfile_defaultProfile;
  defaultProfile_defaultProfile = v0;

}

- (BOOL)isWiFiPowerModificationAllowed
{
  void *v2;
  char v3;

  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWiFiPowerModificationAllowed");

  return v3;
}

- (BOOL)isBluetoothModificationAllowed
{
  void *v2;
  char v3;

  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBluetoothModificationAllowed");

  return v3;
}

- (BOOL)isScreenShotAllowed
{
  void *v2;
  char v3;

  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScreenShotAllowed");

  return v3;
}

- (BOOL)isWallpaperModificationAllowed
{
  void *v2;
  char v3;

  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWallpaperModificationAllowed");

  return v3;
}

- (BOOL)isOpenInRestrictionInEffect
{
  void *v2;
  char v3;

  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOpenInRestrictionInEffect");

  return v3;
}

- (BOOL)mayOpenFromUnmanagedToManaged
{
  void *v2;
  char v3;

  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mayOpenFromUnmanagedToManaged");

  return v3;
}

- (BOOL)mayOpenFromManagedToUnmanaged
{
  void *v2;
  char v3;

  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mayOpenFromManagedToUnmanaged");

  return v3;
}

- (BOOL)isAppManaged:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WFManagedConfigurationProfile managedAppBundleIDs](self, "managedAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isAccountManaged:(id)a3
{
  void *v3;
  char v4;

  -[WFManagedConfigurationProfile accountWithIdentifier:](self, "accountWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "MCIsManaged");

  return v4;
}

- (BOOL)isAccountBasedSourceApp:(id)a3
{
  if (a3)
    return softLinkMCIsAppAccountBasedSourceForOpenIn(a3);
  else
    return 0;
}

- (unint64_t)managedLevelForContentOfURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;

  v4 = a3;
  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isURLManaged:", v4);

  if (v6)
    v7 = 2;
  else
    v7 = 1;

  return v7;
}

- (unint64_t)managedLevelForContentOfURLs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v4);
        v11 = -[WFManagedConfigurationProfile managedLevelForContentOfURL:](self, "managedLevelForContentOfURL:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        if (v11 == 1)
        {
          v8 = 1;
        }
        else if (v11 == 2)
        {
          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
    if ((v7 & 1) != 0)
      v12 = 2;
    else
      v12 = v8 & 1;
    if ((v7 & 1 & v8) != 0)
      v12 = 3;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingAccountIsManaged:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[WFManagedConfigurationProfile profileConnection](self, "profileConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:", v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)accountWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__14326;
    v15 = __Block_byref_object_dispose__14327;
    v16 = 0;
    -[WFManagedConfigurationProfile operatingQueue](self, "operatingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__WFManagedConfigurationProfile_Account__accountWithIdentifier___block_invoke;
    block[3] = &unk_24C4E0608;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accountIdentifiersEnabledForDataclass:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14326;
  v16 = __Block_byref_object_dispose__14327;
  v17 = 0;
  -[WFManagedConfigurationProfile operatingQueue](self, "operatingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__WFManagedConfigurationProfile_Account__accountIdentifiersEnabledForDataclass___block_invoke;
  block[3] = &unk_24C4E0608;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __80__WFManagedConfigurationProfile_Account__accountIdentifiersEnabledForDataclass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "accountIdentifiersByDataClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountIdentifiersEnabledForDataclass:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "accountIdentifiersByDataClass");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

    }
  }
}

void __64__WFManagedConfigurationProfile_Account__accountWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "accountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountWithIdentifier:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "accounts");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v13);

    }
  }
}

@end
