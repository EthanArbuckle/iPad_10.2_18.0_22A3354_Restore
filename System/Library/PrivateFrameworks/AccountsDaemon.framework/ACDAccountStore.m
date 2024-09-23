@implementation ACDAccountStore

- (ACDClient)client
{
  return (ACDClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setRemoteDeviceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceProxy, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataclassOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataclassOwnersManager, a3);
}

- (void)setDatabaseBackupActivity:(id)a3
{
  objc_storeStrong((id *)&self->_databaseBackupActivity, a3);
}

- (void)setAuthenticationPluginManager:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationPluginManager, a3);
}

- (void)setAuthenticationDialogManager:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationDialogManager, a3);
}

- (void)setAccountNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountNotifier, a3);
}

- (void)setAccessPluginManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessPluginManager, a3);
}

- (ACDAccountStore)initWithClient:(id)a3 databaseConnection:(id)a4
{
  id v6;
  id v7;
  ACDAccountStore *v8;
  NSObject *v9;
  NSMutableArray *v10;
  NSMutableArray *accountChanges;
  ACDClientAuthorizationManager *v12;
  ACDClientAuthorizationManager *authorizationManager;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ACDAccountStore;
  v8 = -[ACDAccountStore init](&v15, sel_init);
  if (v8)
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore initWithClient:databaseConnection:].cold.1();

    objc_storeWeak((id *)&v8->_client, v6);
    objc_storeStrong((id *)&v8->_databaseConnection, a4);
    v8->_notificationsEnabled = 1;
    v8->_migrationInProgress = 0;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    accountChanges = v8->_accountChanges;
    v8->_accountChanges = v10;

    v12 = -[ACDClientAuthorizationManager initWithDatabaseConnection:]([ACDClientAuthorizationManager alloc], "initWithDatabaseConnection:", v8->_databaseConnection);
    authorizationManager = v8->_authorizationManager;
    v8->_authorizationManager = v12;

  }
  return v8;
}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  ACDAccountStore *v26;
  id v27;
  id v28;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v19, "count") == 1 && !objc_msgSend(v8, "count"))
  {
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke;
    v24[3] = &unk_24C7E2520;
    v25 = v19;
    v26 = self;
    v27 = v8;
    v28 = v9;
    v16 = v9;
    v17 = v8;
    v18 = v19;
    objc_msgSend(v15, "performBlockAndWait:", v24);

    v14 = v25;
  }
  else
  {
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_3;
    v20[3] = &unk_24C7E2520;
    v20[4] = self;
    v21 = v19;
    v22 = v8;
    v23 = v9;
    v11 = v9;
    v12 = v8;
    v13 = v19;
    objc_msgSend(v10, "performBlockAndWait:", v20);

    v14 = v21;
  }

}

- (id)_accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  ACDAccountStore *v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke;
  v14[3] = &unk_24C7E2688;
  v17 = &v21;
  v10 = v8;
  v20 = (a4 & 1) == 0;
  v15 = v10;
  v16 = self;
  v18 = &v27;
  v19 = a4;
  objc_msgSend(v9, "performBlockAndWait:", v14);

  if (a5)
  {
    v11 = (void *)v28[5];
    if (v11)
      *a5 = objc_retainAutorelease(v11);
  }
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

- (void)accessKeysForAccountType:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  objc_msgSend(v6, "setAccountStore:", self);
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__ACDAccountStore_accessKeysForAccountType_handler___block_invoke;
  v10[3] = &unk_24C7E25E8;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v20;
  v13 = &v14;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v21[5], v15[5]);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
}

- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  objc_msgSend(v8, "setAccountStore:", self);
  v14 = 0;
  -[ACDAccountStore _accountsWithAccountType:options:error:](self, "_accountsWithAccountType:options:error:", v8, a4, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore accountsWithAccountType:options:completion:].cold.2();

    v9[2](v9, 0, v11);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore accountsWithAccountType:options:completion:].cold.1();

    ((void (**)(id, void *, id))v9)[2](v9, v10, 0);
  }

}

- (id)accountTypeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedAccountTypeForID:", v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)v14[5];
  if (v6)
  {
    objc_msgSend(v6, "setAccountStore:", self);
  }
  else
  {
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__ACDAccountStore_accountTypeWithIdentifier___block_invoke;
    v10[3] = &unk_24C7E20E0;
    v10[4] = self;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v7, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)accountTypeWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  ACDAccountStore *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  if (v6)
  {
    +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedAccountTypeForID:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v18[5];
    v18[5] = v9;

    v11 = (void *)v18[5];
    if (v11)
    {
      objc_msgSend(v11, "setAccountStore:", self);
    }
    else
    {
      -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke;
      v13[3] = &unk_24C7E20E0;
      v14 = v6;
      v15 = self;
      v16 = &v17;
      objc_msgSend(v12, "performBlockAndWait:", v13);

    }
  }
  v7[2](v7, v18[5], 0);
  _Block_object_dispose(&v17, 8);

}

+ (id)accountCache
{
  if (accountCache_onceToken != -1)
    dispatch_once(&accountCache_onceToken, &__block_literal_global_1);
  return (id)accountCache__cache;
}

void __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  _ACDLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke_cold_1(a2, v6);

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

}

void __47__ACDAccountStore__sync_accountWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_block_accountWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cacheAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  objc_msgSend(*(id *)(a1 + 32), "_accountWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v2, *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = objc_alloc(MEMORY[0x24BDB43A8]);
    objc_msgSend(v2, "accountType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithManagedAccountType:accountStore:", v7, *(_QWORD *)(a1 + 32));

    if (v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAccountType:", v8);
      +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cacheAccount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    }
    else
    {
      _ACDLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_2();

    }
  }
  else
  {
    _ACDLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_1();
  }

}

- (id)_accountWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDB4380];
  v5 = a3;
  objc_msgSend(v4, "keypathsRequiredForInitialization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore _accountWithIdentifier:prefetchKeypaths:](self, "_accountWithIdentifier:prefetchKeypaths:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __70__ACDAccountStore_enabledDataclassesForAccountWithIdentifier_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v22[0] = *MEMORY[0x24BDB42D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accountWithIdentifier:prefetchKeypaths:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "enabledDataclasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v8 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "name", (_QWORD)v17);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
  }

}

- (id)_accountWithIdentifier:(id)a3 prefetchKeypaths:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD1758];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("identifier == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:](self->_databaseConnection, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v8, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__ACDAccountStore_accountIdentifiersEnabledForDataclass_handler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[4] + 120);
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v2;
  objc_msgSend(v3, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), 0, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "enabledDataclasses");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForKey:", CFSTR("name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "containsObject:", a1[5]))
        {
          if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
          {
            v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v15 = *(_QWORD *)(a1[6] + 8);
            v16 = *(void **)(v15 + 40);
            *(_QWORD *)(v15 + 40) = v14;

          }
          objc_msgSend(v11, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

void __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int8x16_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  int8x16_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 72);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke_2;
  v20[3] = &unk_24C7E2660;
  v15 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v15.i64[0];
  v21 = vextq_s8(v15, v15, 8uLL);
  v6 = *(_QWORD *)(a1 + 64);
  v22 = *(_QWORD *)(a1 + 56);
  v23 = v6;
  objc_msgSend(v2, "cachedAccountsOfType:justActive:fetchBlock:", v3, v4, v20);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14++), "_setAccountStore:", *(_QWORD *)(a1 + 40), *(_OWORD *)&v15, (_QWORD)v16);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

void __52__ACDAccountStore_accessKeysForAccountType_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithURI:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDB4200];
    v27 = *MEMORY[0x24BDD0FC8];
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ is not a valid account type."), v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v28 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 4, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

LABEL_12:
    goto LABEL_13;
  }
  objc_msgSend(v4, "accessKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13), "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v11);
    }
    v5 = v9;
    goto LABEL_12;
  }
LABEL_13:

}

- (id)_predicateForFetchingAccountsWithManagedAccountTypeID:(id)a3 options:(unint64_t)a4
{
  uint64_t v5;

  if ((a4 & 1) != 0)
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType == %@"), a3, v5);
  else
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType == %@ AND active == %@"), a3, MEMORY[0x24BDBD1C8]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_dataclassWithName:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:](self->_databaseConnection, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("Dataclass"), 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v16 = v4;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v6);

        if (v13)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
LABEL_11:
    v4 = v16;
  }

  if (!v8 && v4)
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _dataclassWithName:createIfNecessary:].cold.1();

    -[ACDDatabaseConnection insertNewObjectForEntityForName:](self->_databaseConnection, "insertNewObjectForEntityForName:", CFSTR("Dataclass"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v6);
  }

  return v8;
}

- (void)_requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 allowUserInteraction:(BOOL)a5 withHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  ACDAccessPluginManager *accessPluginManager;
  id WeakRetained;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v7 = a5;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  _ACDLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _requestAccessForAccountTypeWithIdentifier:options:allowUserInteraction:withHandler:].cold.1();

  -[ACDAccountStore accountTypeWithIdentifier:](self, "accountTypeWithIdentifier:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    accessPluginManager = self->_accessPluginManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke;
    v22[3] = &unk_24C7E27C0;
    v23 = v12;
    -[ACDAccessPluginManager handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:](accessPluginManager, "handleAccessRequestToAccountsOfType:forClient:withOptions:store:allowUserInteraction:completion:", v14, WeakRetained, v11, self, v7, v22);

    v17 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The account type specified could not be found."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDB4200];
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 6, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v21);
  }

}

void __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int8x16_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  int8x16_t v17;
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2;
  v16[3] = &unk_24C7E28D0;
  v11 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v11.i64[0];
  v17 = vextq_s8(v11, v11, 8uLL);
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v2, "cachedAccountsOfType:justActive:fetchBlock:", v3, 0, v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "_setAccountStore:", *(_QWORD *)(a1 + 40), *(_OWORD *)&v11, (_QWORD)v12);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
      }
      while (v8);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __85__ACDAccountStore_registerMonitorForAccountsOfTypes_propertiesToPrefetch_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;

  v2 = a1 + 4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier == %@"), a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 120), "fetchObjectsForEntityNamed:withPredicate:", CFSTR("AccountType"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDB43A8]), "initWithManagedAccountType:accountStore:", v5, a1[5]);
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheAccountType:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  }
  else
  {
    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BDB43A8], "allIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", *v2);

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 160));
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Client '%@' failed to access internal account type '%@'"), WeakRetained, a1[4]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "simulateCrashWithMessage:", v15);

    }
  }

}

- (ACDClientAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)accountWithIdentifier:(id)a3 handler:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[ACDAccountStore _sync_accountWithIdentifier:](self, "_sync_accountWithIdentifier:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (id)_sync_accountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedAccountForIdentifier:", v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)v14[5];
  if (v6)
  {
    objc_msgSend(v6, "_setAccountStore:", self);
  }
  else
  {
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__ACDAccountStore__sync_accountWithIdentifier___block_invoke;
    v10[3] = &unk_24C7E1E88;
    v12 = &v13;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v7, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)credentialForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore credentialForAccountWithIdentifier:handler:].cold.1((uint64_t)v6, (uint64_t)self);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedAccountForIdentifier:", v6);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)v22[5];
  if (v10)
  {
    objc_msgSend(v10, "_setAccountStore:", self);
  }
  else
  {
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke;
    v18[3] = &unk_24C7E20E0;
    v18[4] = self;
    v19 = v6;
    v20 = &v21;
    objc_msgSend(v11, "performBlockAndWait:", v18);

  }
  v12 = v22[5];
  if (v12)
  {
    v13 = (void *)MEMORY[0x24BDB43F0];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_118;
    v15[3] = &unk_24C7E2598;
    v15[4] = self;
    v17 = &v21;
    v16 = v7;
    objc_msgSend(v13, "performWithinPersonaForAccount:withBlock:", v12, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v14);

  }
  _Block_object_dispose(&v21, 8);

}

- (void)registerMonitorForAccountsOfTypes:(id)a3 propertiesToPrefetch:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id WeakRetained;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    *(_DWORD *)buf = 138412802;
    v18 = WeakRetained;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_debug_impl(&dword_20D8CB000, v11, OS_LOG_TYPE_DEBUG, "\"Client %@ registered to monitor for types %@, preloadedProperties %@\", buf, 0x20u);

  }
  objc_msgSend(v8, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __85__ACDAccountStore_registerMonitorForAccountsOfTypes_propertiesToPrefetch_completion___block_invoke;
  v15[3] = &unk_24C7E2948;
  v16 = v10;
  v13 = v10;
  -[ACDAccountStore accountsWithAccountTypeIdentifiers:preloadedProperties:completion:](self, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v12, v9, v15);

}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  NSObject *WeakRetained;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_3();

  if (!v5 && v6)
  {
    if (objc_msgSend(v6, "code") == -101 || objc_msgSend(v6, "code") == -102)
    {
      _ACDLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_20D8CB000, v8, OS_LOG_TYPE_DEFAULT, "\"No plugin provides credentials for account %@. Falling back to legacy behavior.\", buf, 0xCu);
      }

      v10 = (id *)a1[4];
      v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      WeakRetained = objc_loadWeakRetained(v10 + 20);
      v16 = v6;
      objc_msgSend(v10, "_legacyCredentialForAccount:client:error:", v11, WeakRetained, &v16);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v16;

      v6 = v13;
      goto LABEL_18;
    }
    _ACDLogSystem();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_1();
LABEL_17:
    v5 = 0;
    goto LABEL_18;
  }
  _ACDLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v14;
  if (!v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_20D8CB000, WeakRetained, OS_LOG_TYPE_DEFAULT, "\"The credential for account %@ is missing. It may have been withheld by its auth plugin.\", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_2();
LABEL_18:

  (*(void (**)(void))(a1[5] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseBackupActivity, 0);
  objc_storeStrong((id *)&self->_accountNotifier, 0);
  objc_storeStrong((id *)&self->_authenticationDialogManager, 0);
  objc_storeStrong((id *)&self->_dataclassOwnersManager, 0);
  objc_storeStrong((id *)&self->_accessPluginManager, 0);
  objc_storeStrong((id *)&self->_authenticationPluginManager, 0);
  objc_storeStrong((id *)&self->_remoteDeviceProxy, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fakeRemoteAccountStoreSession, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_databaseConnection, 0);
  objc_storeStrong((id *)&self->_accountChanges, 0);
}

- (void)accountsWithAccountType:(id)a3 handler:(id)a4
{
  -[ACDAccountStore accountsWithAccountType:options:completion:](self, "accountsWithAccountType:options:completion:", a3, 1, a4);
}

- (void)enabledDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__ACDAccountStore_enabledDataclassesForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

- (void)setClientBundleID:(id)a3 withHandler:(id)a4
{
  ACDClient **p_client;
  id v6;
  id WeakRetained;
  void (**v8)(id, uint64_t, _QWORD);

  p_client = &self->_client;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_client);
  objc_msgSend(WeakRetained, "setBundleID:", v6);

  v8[2](v8, 1, 0);
}

- (void)tetheredSyncSourceTypeForDataclass:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  id v6;

  v5 = (void (**)(id, id, _QWORD))a4;
  if (syncDataTypeForDataclass(a3))
  {
    tetheredSyncSourceTypeForDataType();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, id))v5)[2](v5, 0, v6);
  }

}

- (void)accountIdentifiersEnabledForDataclass:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__ACDAccountStore_accountIdentifiersEnabledForDataclass_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

void __68__ACDAccountStore_accountIdentifiersEnabledToSyncDataclass_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_dataclassWithName:createIfNecessary:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)v3;
    objc_msgSend(v4, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), 0, v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v8)
      goto LABEL_20;
    v9 = v8;
    v10 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = *(void **)(a1 + 32);
        objc_msgSend(v12, "accountType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v13) = objc_msgSend(v13, "_canManagedAccountType:syncManagedDataclass:", v14, v2);

        if ((_DWORD)v13)
        {
          objc_msgSend(v12, "parentAccount");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(void **)(a1 + 32);
          if (v15)
          {
            if ((objc_msgSend(v16, "_isManagedAccount:enabledForManagedDataclass:", v15, v2) & 1) == 0)
              goto LABEL_17;
          }
          else if (!objc_msgSend(v16, "_isManagedAccount:enabledForManagedDataclass:", v12, v2))
          {
LABEL_17:

            continue;
          }
          objc_msgSend(v12, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            if (!v18)
            {
              v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v21 = *(void **)(v20 + 40);
              *(_QWORD *)(v20 + 40) = v19;

              v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            }
            objc_msgSend(v18, "addObject:", v17);
          }

          goto LABEL_17;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v9)
      {
LABEL_20:

        break;
      }
    }
  }

}

- (void)accountIdentifiersEnabledToSyncDataclass:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__ACDAccountStore_accountIdentifiersEnabledToSyncDataclass_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

- (BOOL)_canManagedAccountType:(id)a3 syncManagedDataclass:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "syncableDataclasses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

void __31__ACDAccountStore_accountCache__block_invoke()
{
  ACDAccountCache *v0;
  void *v1;

  if (!accountCache__cache)
  {
    v0 = -[ACDAccountCache initWithValidityDuration:]([ACDAccountCache alloc], "initWithValidityDuration:", 30);
    v1 = (void *)accountCache__cache;
    accountCache__cache = (uint64_t)v0;

  }
}

- (ACDAccountStore)init
{
  NSObject *v3;

  _ACDLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[ACDAccountStore init].cold.1();

  return -[ACDAccountStore initWithClient:databaseConnection:](self, "initWithClient:databaseConnection:", 0, 0);
}

void __45__ACDAccountStore_accountTypeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_accountTypeWithIdentifier:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDB43A8]), "initWithManagedAccountType:accountStore:", v6, *(_QWORD *)(a1 + 32));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cacheAccountType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
}

- (id)accountsWithAccountTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ACDAccountStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__ACDAccountStore_accountsWithAccountTypeIdentifier___block_invoke;
  v9[3] = &unk_24C7E20E0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __53__ACDAccountStore_accountsWithAccountTypeIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier == %@"), a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[5] + 120);
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v2, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), a1[5]);
        if (v14)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ACRemoteDeviceProxy *remoteDeviceProxy;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore accountsOnPairedDeviceWithAccountTypes:withOptions:handler:].cold.1();

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDB4340]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  +[ACDPairedDeviceAccountCache sharedInstance](ACDPairedDeviceAccountCache, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  remoteDeviceProxy = self->_remoteDeviceProxy;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __78__ACDAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke;
  v18[3] = &unk_24C7E23B8;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "accountsFromRemoteDeviceProxy:ignoreCache:options:completion:", remoteDeviceProxy, v13, v10, v18);

}

void __78__ACDAccountStore_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v18 = 0;
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v13, "accountType", v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = objc_msgSend(v14, "containsObject:", v16);

          if ((_DWORD)v14)
            objc_msgSend(v7, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v6 = v18;
    v5 = v19;
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v7, v6);

}

- (BOOL)accountsExistWithAccountTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ACDAccountStore *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__ACDAccountStore_accountsExistWithAccountTypeIdentifier___block_invoke;
  v8[3] = &unk_24C7E20E0;
  v6 = v4;
  v9 = v6;
  v10 = self;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  LOBYTE(self) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

void __58__ACDAccountStore_accountsExistWithAccountTypeIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier == %@"), a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)a1[4];
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v2;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Determining account existent: %@, %@\", buf, 0x16u);
  }

  v5 = objc_msgSend(*(id *)(a1[5] + 120), "countOfEntityNamed:withPredicate:", CFSTR("Account"), v2);
  _ACDLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v7;
    _os_log_impl(&dword_20D8CB000, v6, OS_LOG_TYPE_DEFAULT, "\"Number of account is %@\", buf, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5 != 0;

}

- (BOOL)_removeAccountNoSave:(id)a3 withDataclassActions:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  ACDDatabaseConnection *databaseConnection;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  NSMutableArray *accountChanges;
  void *v54;
  NSMutableArray *v55;
  NSObject *v56;
  id v58;
  id v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD block[5];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint8_t v78[128];
  uint8_t buf[4];
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _removeAccountNoSave:withDataclassActions:withError:].cold.3();

  if (-[ACDAccountStore notificationsEnabled](self, "notificationsEnabled"))
  {
    -[ACDAccountStore accountNotifier](self, "accountNotifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v12 = objc_msgSend(v11, "canRemoveAccount:inStore:error:", v8, self, &v75);
    v13 = v75;

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        v13 = objc_retainAutorelease(v13);
        v19 = 0;
        *a5 = v13;
      }
      else
      {
        v19 = 0;
      }
      goto LABEL_49;
    }
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v80 = v15;
      _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"Plugins did not deny account %@ removal\", buf, 0xCu);

    }
  }
  databaseConnection = self->_databaseConnection;
  objc_msgSend(v8, "objectID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection existingObjectWithURI:](databaseConnection, "existingObjectWithURI:", v17);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v13, self);
  objc_msgSend(v18, "_loadAllCachedProperties");
  v19 = v13 != 0;
  if (v13)
  {
    v59 = v9;
    v60 = v18;
    _ACDLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v8;
      _os_log_impl(&dword_20D8CB000, v20, OS_LOG_TYPE_DEFAULT, "\"%@ is being deleted.\", buf, 0xCu);
    }

    objc_msgSend(v8, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDAccountStore _childAccountsForAccountWithID:](self, "_childAccountsForAccountWithID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v72 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i), "_loadAllCachedProperties");
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
      }
      while (v25);
    }

    v58 = v8;
    if (-[ACDAccountStore notificationsEnabled](self, "notificationsEnabled")
      && !-[ACDAccountStore isMigrationInProgress](self, "isMigrationInProgress"))
    {
      -[ACDAccountStore accountNotifier](self, "accountNotifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "postWillChangeNotificationForType:inStore:newAccount:oldAccount:", 3, self, 0, v60);

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v29 = v23;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v68;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v68 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
            -[ACDAccountStore accountNotifier](self, "accountNotifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "postWillChangeNotificationForType:inStore:newAccount:oldAccount:", 3, self, 0, v34);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
        }
        while (v31);
      }

      v8 = v58;
    }
    -[ACDAccountStore _performDataclassActions:forAccount:error:](self, "_performDataclassActions:forAccount:error:", v59, v8, a5);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AccountSyncDelete"));
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36
      && (v37 = (void *)v36,
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AccountSyncDelete")),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v39 = objc_msgSend(v38, "BOOLValue"),
          v38,
          v37,
          (v39 & 1) == 0))
    {
      _ACDLogSystem();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[ACDAccountStore _removeAccountNoSave:withDataclassActions:withError:].cold.2();
    }
    else
    {
      +[ACDKeychainManager removeCredentialForAccount:clientID:error:](ACDKeychainManager, "removeCredentialForAccount:clientID:error:", v60, 0, 0);
      objc_msgSend(v13, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACDAccountStore _clientTokenQueue](self, "_clientTokenQueue");
      v41 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__ACDAccountStore__removeAccountNoSave_withDataclassActions_withError___block_invoke;
      block[3] = &unk_24C7E2180;
      block[4] = self;
      v66 = v40;
      v42 = v40;
      dispatch_async(v41, block);

    }
    -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v13);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v45 = v23;
    v49 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v62;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v62 != v51)
            objc_enumerationMutation(v45);
          accountChanges = self->_accountChanges;
          +[ACDAccountChange changeWithChangeType:account:oldAccount:](ACDAccountChange, "changeWithChangeType:account:oldAccount:", 3, 0, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](accountChanges, "addObject:", v54);

        }
        v50 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v61, v76, 16);
      }
      while (v50);
    }

    v55 = self->_accountChanges;
    v18 = v60;
    +[ACDAccountChange changeWithChangeType:account:oldAccount:](ACDAccountChange, "changeWithChangeType:account:oldAccount:", 3, 0, v60);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v55, "addObject:", v48);
    v8 = v58;
    v9 = v59;
    v19 = v13 != 0;
    goto LABEL_45;
  }
  if (a5)
  {
    v43 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v8, "identifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", CFSTR("Failed to remove account with identifier %@ because it does not exist"), v44);
    v45 = (id)objc_claimAutoreleasedReturnValue();

    v46 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDB4200];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v45, *MEMORY[0x24BDD0FC8]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", v47, 6, v48);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

  }
  _ACDLogSystem();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _removeAccountNoSave:withDataclassActions:withError:].cold.1();

LABEL_49:
  return v19;
}

uint64_t __71__ACDAccountStore__removeAccountNoSave_withDataclassActions_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeClientTokenForAccountIdentifer:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_saveWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  ACDDatabaseConnection *databaseConnection;
  _BOOL4 v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSMutableArray *v72;
  uint64_t v73;
  _BOOL4 v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t j;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSMutableArray *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t k;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  NSObject *v110;
  id *v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  NSMutableArray *v118;
  _BOOL4 v119;
  id obj;
  NSMutableArray *obja;
  id objb;
  id objc;
  id v124;
  id v125;
  ACDAccountStore *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[4];
  id v145;
  id v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint8_t v150[128];
  _BYTE buf[24];
  void *v152;
  __int128 v153;
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _saveWithError:].cold.6();

  _ACDSaveLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);

  v126 = self;
  v112 = a3;
  if (v7)
  {
    v142 = 0u;
    v143 = 0u;
    v140 = 0u;
    v141 = 0u;
    v8 = self->_accountChanges;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v141;
      v115 = *MEMORY[0x24BDB4298];
      v114 = *MEMORY[0x24BDB42C0];
      v117 = *(_QWORD *)v141;
      v118 = v8;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v141 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v12);
          objc_msgSend(v13, "account", v112);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            objc_msgSend(v13, "oldAccount");
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          v17 = v16;

          _ACDSaveLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            -[ACDAccountStore client](self, "client");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            ACDStringFromChangeType(objc_msgSend(v13, "changeType"));
            v124 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "account");
            v20 = (id)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v116 = v19;
              v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend(v20, "dirtyProperties");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (void *)objc_msgSend(v23, "mutableCopy");

              objc_msgSend(v24, "removeObject:", v115);
              objc_msgSend(v24, "removeObject:", v114);
              if (objc_msgSend(v24, "count"))
              {
                v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v24, "count"));
                *(_QWORD *)buf = MEMORY[0x24BDAC760];
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = ___ACDChangeDictionaryForAccount_block_invoke;
                v152 = &unk_24C7E2998;
                *(_QWORD *)&v153 = v20;
                *((_QWORD *)&v153 + 1) = v25;
                v26 = v25;
                objc_msgSend(v24, "enumerateObjectsUsingBlock:", buf);
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("dirtyProperties"));

              }
              obj = v22;
              objc_msgSend(v20, "dirtyAccountProperties");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)objc_msgSend(v27, "copy");

              if (objc_msgSend(v28, "count"))
              {
                v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v28, "count"));
                v144[0] = MEMORY[0x24BDAC760];
                v144[1] = 3221225472;
                v144[2] = ___ACDChangeDictionaryForAccount_block_invoke_3;
                v144[3] = &unk_24C7E2998;
                v145 = v29;
                v146 = v20;
                v30 = v29;
                objc_msgSend(v28, "enumerateObjectsUsingBlock:", v144);
                objc_msgSend(obj, "setObject:forKeyedSubscript:", v30, CFSTR("dirtyAccountProperties"));

              }
              v21 = v20;

              self = v126;
              v19 = v116;
              v20 = obj;
            }
            else
            {
              v21 = 0;
            }

            *(_DWORD *)buf = 138544131;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v124;
            *(_WORD *)&buf[22] = 2113;
            v152 = v17;
            LOWORD(v153) = 2113;
            *(_QWORD *)((char *)&v153 + 2) = v20;
            _os_log_debug_impl(&dword_20D8CB000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ account: %{private}@, changes: %{private}@", buf, 0x2Au);

            v11 = v117;
            v8 = v118;
          }

          ++v12;
        }
        while (v10 != v12);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
        v10 = v31;
      }
      while (v31);
    }

  }
  databaseConnection = self->_databaseConnection;
  v139 = 0;
  v33 = -[ACDDatabaseConnection saveWithError:](databaseConnection, "saveWithError:", &v139, v112);
  v125 = v139;
  _ACLogSystem();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _saveWithError:].cold.5();
  v119 = v33;

  -[ACDAccountStore databaseConnection](self, "databaseConnection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "managedObjectContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "refreshAllObjects");

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  obja = self->_accountChanges;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v136 != v39)
          objc_enumerationMutation(obja);
        v41 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v41, "account");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "account");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "removeAccount:store:", v44, self);

          objc_msgSend(v41, "account");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "accountType");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDAccountStore _block_accountsWithAccountType:options:error:](self, "_block_accountsWithAccountType:options:error:", v46, 1, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "account");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "accountType");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "identifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "cacheAccounts:forType:justActive:", v47, v51, 0);

            self = v126;
          }
          objc_msgSend(v41, "account");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "accountType");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDAccountStore _block_accountsWithAccountType:options:error:](self, "_block_accountsWithAccountType:options:error:", v53, 0, 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v54)
            goto LABEL_43;
          +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "account");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        }
        objc_msgSend(v41, "oldAccount");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v57)
          continue;
        +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "oldAccount");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "removeAccount:store:", v59, self);

        objc_msgSend(v41, "oldAccount");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "accountType");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACDAccountStore _block_accountsWithAccountType:options:error:](self, "_block_accountsWithAccountType:options:error:", v61, 1, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "oldAccount");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "accountType");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "cacheAccounts:forType:justActive:", v47, v65, 0);

          self = v126;
        }
        objc_msgSend(v41, "oldAccount");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "accountType");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACDAccountStore _block_accountsWithAccountType:options:error:](self, "_block_accountsWithAccountType:options:error:", v67, 0, 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "oldAccount");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:
          v68 = v56;
          objc_msgSend(v56, "accountType");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "identifier");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "cacheAccounts:forType:justActive:", v54, v70, 1);

          self = v126;
        }
LABEL_43:

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
    }
    while (v38);
  }

  _ACLogSystem();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _saveWithError:].cold.4();

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v72 = self->_accountChanges;
  v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
  v74 = v119;
  v75 = v125;
  if (v73)
  {
    v76 = v73;
    v77 = *(id *)v132;
    objb = *(id *)v132;
    do
    {
      for (j = 0; j != v76; ++j)
      {
        if (*(id *)v132 != v77)
          objc_enumerationMutation(v72);
        v79 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
        if (!v75
          && (objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * j), "changeType") == 1
           || objc_msgSend(v79, "changeType") == 5)
          && (objc_msgSend(v79, "account"),
              v80 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v80, "objectID"),
              v81 = (void *)objc_claimAutoreleasedReturnValue(),
              v81,
              v80,
              !v81))
        {
          objc_msgSend(v79, "account");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "account");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "identifier");
          v88 = v72;
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDAccountStore _accountWithIdentifier:prefetchKeypaths:](self, "_accountWithIdentifier:prefetchKeypaths:", v89, 0);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "objectID");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "URIRepresentation");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "_setObjectID:", v92);

          v74 = v119;
          v75 = v125;

          self = v126;
          v72 = v88;
          v77 = objb;

          if (!v119)
            continue;
        }
        else if (!v74)
        {
          continue;
        }
        if (objc_msgSend(v79, "changeType") == 3)
        {
          objc_msgSend(v79, "oldAccount");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDAccountStore _delegate_accountStoreDidSaveAccount:changeType:](self, "_delegate_accountStoreDidSaveAccount:changeType:", v82, objc_msgSend(v79, "changeType"));
        }
        else
        {
          objc_msgSend(v79, "account");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "identifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDAccountStore _block_accountWithIdentifier:](self, "_block_accountWithIdentifier:", v84);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          if (v82)
          {
            objc_msgSend(v79, "account");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "_applyDirtyStateFromAccount:", v85);

            -[ACDAccountStore _delegate_accountStoreDidSaveAccount:changeType:](self, "_delegate_accountStoreDidSaveAccount:changeType:", v82, objc_msgSend(v79, "changeType"));
          }
          else
          {
            _ACDLogSystem();
            v93 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              -[ACDAccountStore _saveWithError:].cold.3(buf, &buf[1], v93);

            objc_msgSend(v79, "account");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACDAccountStore _delegate_accountStoreDidSaveAccount:changeType:](self, "_delegate_accountStoreDidSaveAccount:changeType:", v94, objc_msgSend(v79, "changeType"));

          }
          v75 = v125;
        }

      }
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
    }
    while (v76);
  }

  if (v75)
  {
    _ACDLogSystem();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore _saveWithError:].cold.2();

    v75 = v125;
    if (v113)
    {
      objc_msgSend(v125, "ac_secureCodingError");
      *v113 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v96 = (void *)-[NSMutableArray copy](self->_accountChanges, "copy");
  -[NSMutableArray removeAllObjects](self->_accountChanges, "removeAllObjects");
  if (-[ACDAccountStore notificationsEnabled](self, "notificationsEnabled")
    && !-[ACDAccountStore isMigrationInProgress](self, "isMigrationInProgress"))
  {
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    objc = v96;
    v97 = v96;
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v128;
      v101 = *MEMORY[0x24BDB4320];
      do
      {
        for (k = 0; k != v99; ++k)
        {
          if (*(_QWORD *)v128 != v100)
            objc_enumerationMutation(v97);
          v103 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * k);
          -[ACDAccountStore accountNotifier](self, "accountNotifier");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (v125)
          {
            objc_msgSend(v103, "account");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "oldAccount");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "postDidChangeNotificationForType:inStore:newAccount:oldAccount:", 4, self, v105, v106);

          }
          else
          {
            v107 = objc_msgSend(v103, "changeType");
            objc_msgSend(v103, "account");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "oldAccount");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "postDidChangeNotificationForType:inStore:newAccount:oldAccount:", v107, v126, v108, v109);

            self = v126;
            if (objc_msgSend(v103, "changeType") == 1
              || objc_msgSend(v103, "changeType") == 3)
            {
              -[ACRemoteDeviceProxy sendCommand:withAccount:completion:](v126->_remoteDeviceProxy, "sendCommand:withAccount:completion:", v101, 0, 0);
            }
          }
          LOBYTE(v74) = v119;
        }
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v127, v147, 16);
      }
      while (v99);
    }

    v96 = objc;
    v75 = v125;
  }
  _ACDLogSystem();
  v110 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _saveWithError:].cold.1();

  return v74;
}

- (id)_commitOrRollbackDataclassActions:(id)a3 forAccount:(id)a4 originalEnabledDataclasses:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDBCED8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __91__ACDAccountStore__commitOrRollbackDataclassActions_forAccount_originalEnabledDataclasses___block_invoke;
  v17[3] = &unk_24C7E23E0;
  v18 = v11;
  v19 = v7;
  v20 = v8;
  v12 = v8;
  v13 = v7;
  v14 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);

  v15 = (void *)objc_msgSend(v14, "copy");
  return v15;
}

void __91__ACDAccountStore__commitOrRollbackDataclassActions_forAccount_originalEnabledDataclasses___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "_isError") & 1) != 0)
  {
    if (objc_msgSend(a1[5], "isPropertyDirty:", *MEMORY[0x24BDB42D0]))
      objc_msgSend(a1[5], "setEnabled:forDataclass:", objc_msgSend(a1[6], "containsObject:", v6), v6);
  }
  else
  {
    objc_msgSend(a1[4], "setObject:forKey:", v5, v6);
  }

}

- (BOOL)_performDataclassActions:(id)a3 forAccount:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v23;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _performDataclassActions:forAccount:error:].cold.3();

    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDAccountStore _childAccountsForAccountWithID:](self, "_childAccountsForAccountWithID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACDAccountStore accountNotifier](self, "accountNotifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postWillPerformDataclassActionsOnAccount:forDataclasses:", v9, v14);

    -[ACDAccountStore dataclassOwnersManager](self, "dataclassOwnersManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v16 = objc_msgSend(v15, "performDataclassActions:forAccount:withChildren:withError:", v8, v9, v12, &v23);
    v17 = v23;

    -[ACDAccountStore accountNotifier](self, "accountNotifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postDidPerformDataclassActionsOnAccount:forDataclasses:", v9, v19);

    if (v17)
    {
      _ACDLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[ACDAccountStore _performDataclassActions:forAccount:error:].cold.2();

    }
    if (a5)
      *a5 = objc_retainAutorelease(v17);
    _ACDLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _performDataclassActions:forAccount:error:].cold.1();

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)addAccountNoSave:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;

  v6 = a3;
  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore addAccountNoSave:error:].cold.2();

  objc_msgSend(v6, "_setAccountStore:", self);
  v8 = -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:](self, "_addAccountNoSave:withDataclassActions:error:", v6, 0, a4);
  _ACDLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore addAccountNoSave:error:].cold.1();

}

- (id)_addAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  ACDDatabaseConnection *databaseConnection;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void (**v23)(void);
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSMutableArray *accountChanges;
  uint64_t v29;
  void *v30;
  int v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v43;
  NSObject *v44;
  void (**v45)(void);
  id v46;
  _QWORD aBlock[4];
  NSObject *v48;
  id v49;
  ACDAccountStore *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.8();

  v11 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("identifier == %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  databaseConnection = self->_databaseConnection;
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:](databaseConnection, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v13, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "count"))
  {
    -[ACDDatabaseConnection insertNewObjectForEntityForName:](self->_databaseConnection, "insertNewObjectForEntityForName:", CFSTR("Account"));
    v20 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject validateRequiredAttributesForObject:error:](v20, "validateRequiredAttributesForObject:error:", v8, a5) & 1) == 0)
    {
      -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v20);
      _ACDLogSystem();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.6();
      v21 = 0;
      goto LABEL_42;
    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__ACDAccountStore__addAccountNoSave_withDataclassActions_error___block_invoke;
    aBlock[3] = &unk_24C7E2408;
    v44 = v20;
    v48 = v44;
    v22 = v8;
    v49 = v22;
    v50 = self;
    v23 = (void (**)(void))_Block_copy(aBlock);
    -[ACDAccountStore _commitOrRollbackDataclassActions:forAccount:originalEnabledDataclasses:](self, "_commitOrRollbackDataclassActions:forAccount:originalEnabledDataclasses:", v9, v22, 0);
    v43 = objc_claimAutoreleasedReturnValue();
    v45 = v23;
    ((void (*)(void (**)(void)))v23[2])(v23);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
      goto LABEL_11;
    v27 = objc_msgSend(v22, "isWarmingUp");
    accountChanges = self->_accountChanges;
    if (v27)
      v29 = 5;
    else
      v29 = 1;
    +[ACDAccountChange changeWithChangeType:account:oldAccount:](ACDAccountChange, "changeWithChangeType:account:oldAccount:", v29, v22, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](accountChanges, "addObject:", v30);

    if (-[ACDAccountStore notificationsEnabled](self, "notificationsEnabled")
      && !-[ACDAccountStore isMigrationInProgress](self, "isMigrationInProgress"))
    {
      v31 = objc_msgSend(v22, "isWarmingUp");
      _ACDLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (v31)
      {
        if (v33)
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.4();

        -[ACDAccountStore accountNotifier](self, "accountNotifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "postWillChangeNotificationForType:inStore:newAccount:oldAccount:", 5, self, v22, 0);

        if ((v35 & 1) == 0)
          goto LABEL_34;
      }
      else
      {
        if (v33)
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.5();

        -[ACDAccountStore accountNotifier](self, "accountNotifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "postWillChangeNotificationForType:inStore:newAccount:oldAccount:", 1, self, v22, 0);

        if (!v38)
          goto LABEL_34;
      }
      v45[2]();
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
LABEL_11:
        _ACDLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.3();

        -[ACDDatabaseConnection rollback](self->_databaseConnection, "rollback");
        if (a5)
        {
          v24 = objc_retainAutorelease(v24);
          v26 = 0;
          *a5 = v24;
        }
        else
        {
          v26 = 0;
        }
        v36 = (void *)v43;
LABEL_39:
        _ACDLogSystem();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.1();

        v20 = v26;
        v21 = v20;
LABEL_42:

        goto LABEL_43;
      }
    }
LABEL_34:
    v46 = 0;
    v36 = (void *)v43;
    -[ACDAccountStore _performDataclassActions:forAccount:error:](self, "_performDataclassActions:forAccount:error:", v43, v22, &v46);
    v39 = v46;
    if (v39)
    {
      _ACDLogSystem();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.2();

    }
    v24 = 0;
    v26 = v44;
    goto LABEL_39;
  }
  if (a5)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = *MEMORY[0x24BDB4200];
    v51 = *MEMORY[0x24BDD0FC8];
    v52[0] = CFSTR("An account with that identifier already exists");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 5, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  _ACDLogSystem();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:].cold.7();
  v21 = 0;
LABEL_43:

  return v21;
}

id __64__ACDAccountStore__addAccountNoSave_withDataclassActions_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setValuesWithObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setOwningBundleID:", CFSTR("com.apple.accounts.accountsd"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setModificationID:", v4);

  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend(v5, "_setAccountManagedObjectRelationships:withAccount:oldAccount:error:", v7, v6, 0, &v9);
  return v9;
}

- (void)updateAccountNoSave:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;

  v6 = a3;
  _ACDLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore updateAccountNoSave:error:].cold.2();

  objc_msgSend(v6, "_setAccountStore:", self);
  -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:](self, "_updateAccountNoSave:withDataclassActions:error:", v6, 0, a4);
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore updateAccountNoSave:error:].cold.1();

}

- (BOOL)_updateAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  NSMutableArray *accountChanges;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v45;
  NSMutableArray *v46;
  void *v47;
  ACDAccountStore *v48;
  id v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  int v54;
  const __CFString *v55;
  int v56;
  void *v57;
  id v58;
  id v59;
  int v60;
  unsigned int v61;
  uint64_t v62;
  void (**v63)(_QWORD, _QWORD);
  NSObject *v64;
  id WeakRetained;
  _QWORD aBlock[4];
  id v67;
  id v68;
  NSObject *v69;
  ACDAccountStore *v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  const __CFString *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.7();

  if (a5)
    *a5 = 0;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore _accountWithIdentifier:](self, "_accountWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.2();

    if (a5)
      *a5 = objc_retainAutorelease(v19);

    v21 = 0;
    goto LABEL_41;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v12, self);
  _ACLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    objc_msgSend(WeakRetained, "bundleID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v59 = v9;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isWarmingUp"))
      v52 = CFSTR("YES");
    else
      v52 = CFSTR("NO");
    objc_msgSend(v8, "description");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v8, "isWarmingUp");
    *(_DWORD *)buf = 138413314;
    v55 = CFSTR("YES");
    if (!v54)
      v55 = CFSTR("NO");
    v72 = v50;
    v73 = 2112;
    v74 = v51;
    v75 = 2112;
    v76 = v52;
    v77 = 2112;
    v78 = v53;
    v79 = 2112;
    v80 = v55;
    _os_log_debug_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEBUG, "\"_updateAccountNoSave client %@ - existing %@ warming: %@ -- new %@ warming: %@\", buf, 0x34u);

    v9 = v59;
  }

  objc_msgSend(v13, "_loadAllCachedProperties");
  v15 = v13;
  if (-[NSObject isWarmingUp](v15, "isWarmingUp"))
  {
    if (v8 && (objc_msgSend(v8, "isWarmingUp") & 1) == 0)
    {
      _ACLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.6();

      v18 = 0;
      v17 = 1;
      v60 = 1;
      v16 = v15;
    }
    else
    {
      _ACLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.5();
      v60 = 0;
      v17 = 5;
      v18 = v15;
    }
    v61 = v17;
    v64 = v18;

  }
  else
  {
    v60 = 0;
    v61 = 2;
    v64 = v15;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__ACDAccountStore__updateAccountNoSave_withDataclassActions_error___block_invoke;
  aBlock[3] = &unk_24C7E2430;
  v23 = v8;
  v67 = v23;
  v24 = v12;
  v68 = v24;
  v25 = v15;
  v69 = v25;
  v70 = self;
  v26 = _Block_copy(aBlock);
  -[NSObject enabledDataclasses](v25, "enabledDataclasses");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore _commitOrRollbackDataclassActions:forAccount:originalEnabledDataclasses:](self, "_commitOrRollbackDataclassActions:forAccount:originalEnabledDataclasses:", v9, v23, v27);
  v62 = objc_claimAutoreleasedReturnValue();

  v63 = (void (**)(_QWORD, _QWORD))v26;
  (*((void (**)(void *, NSObject *))v26 + 2))(v26, v25);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v28)
    goto LABEL_24;
  v58 = v9;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v24, self);
  objc_msgSend(v36, "_loadAllCachedProperties");
  objc_msgSend(v36, "_applyDirtyStateFromAccount:", v23);
  if ((-[NSObject _isDifferentFrom:](v25, "_isDifferentFrom:", v36) & 1) == 0)
  {
    _ACDLogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.4();

    v28 = 0;
    v40 = 0;
    v21 = 0;
    v9 = v58;
    v34 = v64;
    goto LABEL_39;
  }
  v57 = (void *)objc_msgSend(v36, "copy");
  if (-[ACDAccountStore notificationsEnabled](self, "notificationsEnabled"))
  {
    v37 = v61;
    if (-[ACDAccountStore isMigrationInProgress](self, "isMigrationInProgress")
      || (-[ACDAccountStore accountNotifier](self, "accountNotifier"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v56 = objc_msgSend(v38, "postWillChangeNotificationForType:inStore:newAccount:oldAccount:", v61, self, v36, v64), v38, !v56))
    {
      v45 = v36;
    }
    else
    {
      objc_msgSend(v23, "takeValuesFromModifiedAccount:", v36);
      ((void (**)(_QWORD, void *))v63)[2](v63, v57);
      v39 = objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v28 = (id)v39;

        v9 = v58;
LABEL_24:
        v29 = v12;
        v30 = v8;
        v31 = v9;
        _ACDLogSystem();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.3();

        accountChanges = self->_accountChanges;
        v34 = v64;
        +[ACDAccountChange changeWithChangeType:account:oldAccount:](ACDAccountChange, "changeWithChangeType:account:oldAccount:", 4, v64, v64);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](accountChanges, "addObject:", v35);

        -[ACDDatabaseConnection rollback](self->_databaseConnection, "rollback");
        if (a5)
        {
          v28 = objc_retainAutorelease(v28);
          v21 = 0;
          *a5 = v28;
        }
        else
        {
          v21 = 0;
        }
        v40 = 1;
        v9 = v31;
        v8 = v30;
        v12 = v29;
LABEL_39:
        v42 = (void *)v62;
        goto LABEL_40;
      }
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v24, self);

      objc_msgSend(v45, "_loadAllCachedProperties");
      if (v60)
        objc_msgSend(v45, "markAllPropertiesDirty");
      else
        objc_msgSend(v45, "_applyDirtyStateFromAccount:", v23);
    }
  }
  else
  {
    v45 = v36;
    v37 = v61;
  }
  v46 = self->_accountChanges;
  +[ACDAccountChange changeWithChangeType:account:oldAccount:](ACDAccountChange, "changeWithChangeType:account:oldAccount:", v37, v45, v64);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v46, "addObject:", v47);

  v48 = self;
  v42 = (void *)v62;
  v49 = v23;
  v34 = v64;
  v21 = -[ACDAccountStore _performDataclassActions:forAccount:error:](v48, "_performDataclassActions:forAccount:error:", v62, v49, a5);

  v28 = 0;
  v40 = 1;
  v9 = v58;
LABEL_40:

  if ((v40 & 1) == 0)
  {
    v21 = 1;
    goto LABEL_45;
  }
LABEL_41:
  _ACDLogSystem();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:].cold.1();

LABEL_45:
  return v21;
}

id __67__ACDAccountStore__updateAccountNoSave_withDataclassActions_error___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setDirty:forProperty:", 0, CFSTR("owningBundleID"));
  objc_msgSend(*(id *)(a1 + 40), "setValuesWithObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setModificationID:", v5);

  if (objc_msgSend(*(id *)(a1 + 32), "isPropertyDirty:", CFSTR("dataclassProperties")))
  {
    objc_msgSend(*(id *)(a1 + 48), "dataclassProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_opt_new();
    v10 = v9;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "dirtyDataclassProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "dataclassProperties");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v10, CFSTR("dataclassProperties"));
  }
  v19 = *(void **)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  objc_msgSend(v19, "_setAccountManagedObjectRelationships:withAccount:oldAccount:error:", v20, v21, v3, &v24);
  v22 = v24;

  return v22;
}

- (void)deleteAccountNoSave:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_setAccountStore:", self);
  -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:](self, "_deleteAccountNoSave:withDataclassActions:error:", v6, 0, a4);

}

- (void)_deleteAccountNoSave:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableArray *accountChanges;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;

  v8 = a3;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:].cold.4();

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore _accountWithIdentifier:](self, "_accountWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v12, self);
    objc_msgSend(v13, "_loadAllCachedProperties");
    accountChanges = self->_accountChanges;
    +[ACDAccountChange changeWithChangeType:account:oldAccount:](ACDAccountChange, "changeWithChangeType:account:oldAccount:", 3, 0, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](accountChanges, "addObject:", v15);

    _ACDLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:].cold.3();

    if (-[ACDAccountStore notificationsEnabled](self, "notificationsEnabled")
      && !-[ACDAccountStore isMigrationInProgress](self, "isMigrationInProgress"))
    {
      -[ACDAccountStore accountNotifier](self, "accountNotifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postWillChangeNotificationForType:inStore:newAccount:oldAccount:", 3, self, 0, v13);

    }
    -[ACDAccountStore _performDataclassActions:forAccount:error:](self, "_performDataclassActions:forAccount:error:", v9, v8, a5);
    +[ACDKeychainManager removeCredentialForAccount:clientID:error:](ACDKeychainManager, "removeCredentialForAccount:clientID:error:", v13, 0, 0);
    -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:].cold.2();

    if (a5)
    {
      v13 = objc_retainAutorelease(v13);
      *a5 = v13;
    }
  }

  _ACDLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _deleteAccountNoSave:withDataclassActions:error:].cold.1();

}

- (id)_displayAccountForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "parentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v5)
  {
    -[ACDAccountStore _displayAccountForAccount:](self, "_displayAccountForAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_accountTypeWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier == %@"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:](self->_databaseConnection, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("AccountType"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_canSaveAccount:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(void *, id *);
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _QWORD aBlock[5];
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__ACDAccountStore__canSaveAccount_error___block_invoke;
  aBlock[3] = &unk_24C7E2458;
  aBlock[4] = self;
  v7 = v6;
  v44 = v7;
  v8 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
  objc_msgSend(v7, "accountType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsMultipleAccounts");

  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      objc_msgSend(v7, "accountType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v15;
      _os_log_impl(&dword_20D8CB000, v11, OS_LOG_TYPE_DEFAULT, "\"Account type %@ does NOT support multiples.\", buf, 0xCu);

    }
    objc_msgSend(v7, "accountType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    -[ACDAccountStore accountsWithAccountType:options:error:](self, "accountsWithAccountType:options:error:", v16, 1, &v42);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v42;

    if (v17)
    {
      v35 = a4;
      v36 = v18;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v37 = v17;
      v19 = v17;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v25, "isEqualToString:", v26);

            if ((v27 & 1) == 0)
            {
              _ACDLogSystem();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v7, "accountType");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "accountTypeDescription");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v46 = v24;
                v47 = 2112;
                v48 = v30;
                _os_log_impl(&dword_20D8CB000, v28, OS_LOG_TYPE_DEFAULT, "\"Found active account %@ of type %@ that does NOT support multiples.  Returning NO.\", buf, 0x16u);

              }
              v17 = v37;
              if (v35)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 5, 0);
                *v35 = (id)objc_claimAutoreleasedReturnValue();
              }

              v14 = 0;
              v18 = v36;
              goto LABEL_30;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
          if (v21)
            continue;
          break;
        }
      }

      v18 = v36;
      v17 = v37;
    }
    else if (v18)
    {
      _ACDLogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[ACDAccountStore _canSaveAccount:error:].cold.1();

      v14 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v18);
      goto LABEL_30;
    }
    _ACDLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "accountType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v33;
      _os_log_impl(&dword_20D8CB000, v32, OS_LOG_TYPE_DEFAULT, "\"Found 0 accounts of type %@, returning YES.\", buf, 0xCu);

    }
    v14 = 1;
LABEL_30:

    goto LABEL_31;
  }
  if (v12)
  {
    objc_msgSend(v7, "accountType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v46 = v13;
    _os_log_impl(&dword_20D8CB000, v11, OS_LOG_TYPE_DEFAULT, "\"Account type %@ does support multiples.\", buf, 0xCu);

  }
  v14 = v8[2](v8, a4);
LABEL_31:

  return v14;
}

uint64_t __41__ACDAccountStore__canSaveAccount_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "notificationsEnabled"))
    return 1;
  objc_msgSend(*(id *)(a1 + 32), "accountNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v7 = objc_msgSend(v4, "canSaveAccount:inStore:error:", v5, v6, &v12);
  v8 = v12;

  if ((v7 & 1) == 0)
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v14 = v10;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_20D8CB000, v9, OS_LOG_TYPE_DEFAULT, "\"Can save account failed, plugin denied save of %@, error: %@\", buf, 0x16u);
    }

    if (a2)
      *a2 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (void)_setAccountManagedObjectRelationships:(id)a3 withAccount:(id)a4 oldAccount:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  ACDDatabaseConnection *databaseConnection;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  _QWORD *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  char v66;
  NSObject *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  int v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  int v80;
  id WeakRetained;
  char v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  char v87;
  id v88;
  id v89;
  void *v90;
  id *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  void *v95;
  uint64_t v96;
  const __CFString *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  NSObject *v103;
  const __CFString *v104;
  id v105;
  NSObject *v106;
  void *v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  id v114;
  id v115;
  id v116;
  __CFString *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD v122[4];
  id v123;
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[4];
  id v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD aBlock[5];
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint8_t buf[4];
  NSObject *v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  void *v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;
  _QWORD v151[4];

  v151[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:].cold.4();

  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "persistentStoreCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "managedObjectIDForURIRepresentation:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = (void *)v17;
  objc_msgSend(v18, "objectWithID:", v17);
  v19 = objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isPropertyDirty:", CFSTR("accountType")))
    objc_msgSend(v9, "setAccountType:", v19);
  v119 = (void *)v19;
  if (!objc_msgSend(v10, "isPropertyDirty:", CFSTR("parent")))
  {
LABEL_9:
    if (objc_msgSend(v10, "isPropertyDirty:", CFSTR("accountProperties")))
    {
      v114 = v11;
      objc_msgSend(v10, "accountProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = 0u;
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v110 = v10;
      objc_msgSend(v10, "dirtyAccountProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v138;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v138 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * i);
            objc_msgSend(v22, "valueForKey:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            databaseConnection = self->_databaseConnection;
            if (v29)
              -[ACDDatabaseConnection setAccountPropertyWithKey:value:owner:](databaseConnection, "setAccountPropertyWithKey:value:owner:", v28, v29, v9);
            else
              -[ACDDatabaseConnection deleteAccountPropertyWithKey:owner:](databaseConnection, "deleteAccountPropertyWithKey:owner:", v28, v9);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
        }
        while (v25);
      }

      v10 = v110;
      v11 = v114;
    }
    v31 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke;
    aBlock[3] = &unk_24C7E2480;
    aBlock[4] = self;
    v32 = _Block_copy(aBlock);
    if (!objc_msgSend(v10, "isPropertyDirty:", *MEMORY[0x24BDB42E0]))
    {
LABEL_41:
      if (!objc_msgSend(v10, "isPropertyDirty:", *MEMORY[0x24BDB42D0]))
      {
LABEL_58:
        v62 = (_QWORD *)MEMORY[0x24BDB4548];
        if (v11)
        {
          objc_msgSend(v9, "username");
          v63 = objc_claimAutoreleasedReturnValue();
          if (v63)
          {
            v64 = (void *)v63;
            objc_msgSend(v9, "authenticationType");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v65, "isEqualToString:", *v62);

            if ((v66 & 1) == 0)
            {
              v67 = objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:", v9);
              objc_msgSend(v11, "qualifiedUsername");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject qualifiedUsername](v67, "qualifiedUsername");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v68, "isEqualToString:", v69);

              if ((v70 & 1) == 0)
              {
                _ACDLogSystem();
                v73 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v11, "qualifiedUsername");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSObject qualifiedUsername](v67, "qualifiedUsername");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v142 = v67;
                  v143 = 2112;
                  v144 = v74;
                  v145 = 2112;
                  v146 = v75;
                  _os_log_impl(&dword_20D8CB000, v73, OS_LOG_TYPE_DEFAULT, "\"%@: qualifiedUsername changed from %@ to %@\", buf, 0x20u);

                }
                if ((objc_msgSend(v10, "isPropertyDirty:", CFSTR("credential")) & 1) != 0)
                  objc_msgSend(v10, "internalCredential");
                else
                  +[ACDKeychainManager credentialForAccount:clientID:](ACDKeychainManager, "credentialForAccount:clientID:", v11, 0);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setCredential:](v67, "setCredential:", v92);
                +[ACDKeychainManager removeCredentialForAccount:clientID:error:](ACDKeychainManager, "removeCredentialForAccount:clientID:error:", v11, 0, 0);
                +[ACDKeychainManager setCredentialForAccount:error:](ACDKeychainManager, "setCredentialForAccount:error:", v67, a6);

                goto LABEL_100;
              }

            }
          }
        }
        objc_msgSend(v10, "authenticationType");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v71, "isEqualToString:", *v62) & 1) != 0)
          goto LABEL_97;
        v72 = objc_msgSend(v10, "isPropertyDirty:", CFSTR("credential"));

        if (!v72)
          goto LABEL_98;
        if (v11)
        {
          +[ACDKeychainManager credentialForAccount:clientID:](ACDKeychainManager, "credentialForAccount:clientID:", v11, 0);
          v67 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v67 = 0;
        }
        -[NSObject credentialType](v67, "credentialType");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = *MEMORY[0x24BDB41C0];
        if (objc_msgSend(v76, "isEqual:", *MEMORY[0x24BDB41C0]))
        {

        }
        else
        {
          objc_msgSend(v10, "internalCredential");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "credentialType");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "isEqual:", v77);

          if (!v80)
            goto LABEL_76;
        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_client);
        v82 = objc_msgSend(WeakRetained, "hasEntitlement:", *MEMORY[0x24BDB4450]);

        if ((v82 & 1) == 0)
        {
          v83 = objc_loadWeakRetained((id *)&self->_client);
          objc_msgSend(v83, "bundleID");
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v84)
          {
            _ACDLogSystem();
            v103 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:].cold.2((id *)&self->_client, v103);

            goto LABEL_100;
          }
          v85 = objc_loadWeakRetained((id *)&self->_client);
          objc_msgSend(v85, "bundleID");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_79:
          objc_msgSend(v10, "internalCredential");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v86, "isEqual:", v67);

          if ((v87 & 1) == 0)
          {
            v88 = v11;
            v89 = v10;
            v90 = v88;
            if (v88)
            {
              v120 = 0;
              v91 = (id *)&v120;
              +[ACDKeychainManager setCredentialForAccount:clientID:error:](ACDKeychainManager, "setCredentialForAccount:clientID:error:", v89, v71, &v120);
            }
            else
            {
              v121 = 0;
              v91 = (id *)&v121;
              +[ACDKeychainManager setCredentialForNewAccount:clientID:error:](ACDKeychainManager, "setCredentialForNewAccount:clientID:error:", v89, v71, &v121);
            }
            v93 = *v91;
            if (-[ACDAccountStore isMigrationInProgress](self, "isMigrationInProgress") && v93)
            {
              _ACDLogSystem();
              v94 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v142 = v93;
                _os_log_impl(&dword_20D8CB000, v94, OS_LOG_TYPE_DEFAULT, "\"Ignoring credential-save error because we're migrating. %@\", buf, 0xCu);
              }
              v10 = v89;
              v11 = v90;
              goto LABEL_95;
            }
            v10 = v89;
            v11 = v90;
            if (v93)
            {
              -[NSObject userInfo](v93, "userInfo");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = objc_msgSend(v95, "mutableCopy");

              v112 = *MEMORY[0x24BDD0FC8];
              -[NSObject objectForKeyedSubscript:](v106, "objectForKeyedSubscript:");
              v96 = objc_claimAutoreleasedReturnValue();
              if (v96)
                v97 = (const __CFString *)v96;
              else
                v97 = &stru_24C7E3E98;
              v117 = (__CFString *)v97;
              v108 = (void *)MEMORY[0x24BDD17C8];
              v105 = objc_loadWeakRetained((id *)&self->_client);
              objc_msgSend(v105, "name");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = v97;
              v94 = v106;
              objc_msgSend(v108, "stringWithFormat:", CFSTR("%@ Requested By: %@"), v104, v98);
              v109 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject setObject:forKeyedSubscript:](v106, "setObject:forKeyedSubscript:", v109, v112);
              v99 = (void *)MEMORY[0x24BDD1540];
              -[NSObject domain](v93, "domain");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "errorWithDomain:code:userInfo:", v100, -[NSObject code](v93, "code"), v106);
              v101 = (void *)objc_claimAutoreleasedReturnValue();

              v102 = objc_retainAutorelease(v101);
              *a6 = v102;

LABEL_95:
            }
          }

LABEL_97:
LABEL_98:
          _ACDLogSystem();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:].cold.1();
LABEL_100:
          v44 = v118;

          goto LABEL_101;
        }
LABEL_76:
        v71 = 0;
        goto LABEL_79;
      }
      if (objc_msgSend(v10, "wasEnabledDataclassesReset"))
      {
        v51 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        if (!v11)
        {
LABEL_49:
          v127 = 0u;
          v128 = 0u;
          v125 = 0u;
          v126 = 0u;
          objc_msgSend(v10, "enabledDataclasses");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v125, v147, 16);
          if (v56)
          {
            v57 = v56;
            v116 = v11;
            v58 = v10;
            v59 = *(_QWORD *)v126;
            v60 = *MEMORY[0x24BDB4190];
            do
            {
              for (j = 0; j != v57; ++j)
              {
                if (*(_QWORD *)v126 != v59)
                  objc_enumerationMutation(v54);
                (*((void (**)(void *, id, _QWORD, uint64_t))v32 + 2))(v32, v51, *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * j), v60);
              }
              v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v125, v147, 16);
            }
            while (v57);
            v10 = v58;
            v11 = v116;
          }
          goto LABEL_57;
        }
      }
      else
      {
        objc_msgSend(v9, "enabledDataclasses");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (id)objc_msgSend(v52, "mutableCopy");

        if (v51)
        {
          if (!v11)
            goto LABEL_49;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountStore.m"), 1039, CFSTR("Failed to read enabledDataclasses from database"));

          if (!v11)
            goto LABEL_49;
        }
      }
      objc_msgSend(v10, "trackedEnabledDataclasses");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v31;
      v122[1] = 3221225472;
      v122[2] = __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_3;
      v122[3] = &unk_24C7E24A8;
      v124 = v32;
      v123 = v51;
      objc_msgSend(v53, "enumerateModificationsUsingBlock:", v122);

      v54 = v124;
LABEL_57:

      objc_msgSend(v9, "setEnabledDataclasses:", v51);
      goto LABEL_58;
    }
    if (objc_msgSend(v10, "wasProvisionedDataclassesReset"))
    {
      v33 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      if (!v11)
      {
LABEL_32:
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        objc_msgSend(v10, "provisionedDataclasses");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
        if (v46)
        {
          v47 = v46;
          v115 = v11;
          v111 = v10;
          v48 = *(_QWORD *)v133;
          v49 = *MEMORY[0x24BDB4190];
          do
          {
            for (k = 0; k != v47; ++k)
            {
              if (*(_QWORD *)v133 != v48)
                objc_enumerationMutation(v36);
              (*((void (**)(void *, id, _QWORD, uint64_t))v32 + 2))(v32, v33, *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * k), v49);
            }
            v47 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
          }
          while (v47);
          v10 = v111;
          v11 = v115;
        }
        goto LABEL_40;
      }
    }
    else
    {
      objc_msgSend(v9, "provisionedDataclasses");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id)objc_msgSend(v34, "mutableCopy");

      if (v33)
      {
        if (!v11)
          goto LABEL_32;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountStore.m"), 1011, CFSTR("Failed to read provisionedDataclasses from database"));

        if (!v11)
          goto LABEL_32;
      }
    }
    objc_msgSend(v10, "trackedProvisionedDataclasses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v129[0] = v31;
    v129[1] = 3221225472;
    v129[2] = __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_2;
    v129[3] = &unk_24C7E24A8;
    v131 = v32;
    v130 = v33;
    objc_msgSend(v35, "enumerateModificationsUsingBlock:", v129);

    v36 = v131;
LABEL_40:

    objc_msgSend(v9, "setProvisionedDataclasses:", v33);
    goto LABEL_41;
  }
  objc_msgSend(v10, "parentAccount");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20
    || (objc_msgSend(v10, "parentAccountIdentifier"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        -[ACDAccountStore _accountWithIdentifier:](self, "_accountWithIdentifier:", v21),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20))
  {
    objc_msgSend(v9, "setParentAccount:", v20);

    goto LABEL_9;
  }
  _ACDLogSystem();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    -[ACDAccountStore _setAccountManagedObjectRelationships:withAccount:oldAccount:error:].cold.3();

  v38 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "parentAccountIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringWithFormat:", CFSTR("The parent account with ID %@ is unknown to our DB, so it cannot have any children added. The parent has probably already been deleted."), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x24BDD1540];
  v42 = *MEMORY[0x24BDB4200];
  v150 = *MEMORY[0x24BDD0FC8];
  v151[0] = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v151, &v150, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 15, v43);
  *a6 = (id)objc_claimAutoreleasedReturnValue();

  v44 = (void *)v17;
LABEL_101:

}

void __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB4190]))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dataclassWithName:createIfNecessary:", v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v10, "addObject:", v9);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB41A0]))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dataclassWithName:createIfNecessary:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v10, "removeObject:", v9);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

uint64_t __86__ACDAccountStore__setAccountManagedObjectRelationships_withAccount_oldAccount_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (void)_delegate_accountStoreDidSaveAccount:(id)a3 changeType:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[ACDAccountStore delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountStore:didSaveAccount:changeType:", self, v6, v4);

}

- (BOOL)_handleAccountMod:(id)a3 withDataclassActions:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v11;
    _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "\"Updating existing account: %@\", buf, 0xCu);

  }
  v22 = 0;
  v12 = -[ACDAccountStore _updateAccountNoSave:withDataclassActions:error:](self, "_updateAccountNoSave:withDataclassActions:error:", v8, v9, &v22);
  v13 = v22;
  v14 = v13;
  if (!v12 || v13)
  {
    _ACDLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[ACDAccountStore _handleAccountMod:withDataclassActions:withError:].cold.2();

  }
  v21 = 0;
  v16 = -[ACDAccountStore _saveWithError:](self, "_saveWithError:", &v21);
  v17 = v21;
  v18 = v17;
  if (a5 && v17)
    *a5 = objc_retainAutorelease(v17);
  _ACDLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _handleAccountMod:withDataclassActions:withError:].cold.1();

  return v16;
}

- (BOOL)_handleAccountAdd:(id)a3 withDataclassActions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ACDLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "username");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v11;
    _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "\"Adding new account: %@\", buf, 0xCu);

  }
  objc_msgSend(v8, "markAllPropertiesDirty");
  v25 = 0;
  -[ACDAccountStore _addAccountNoSave:withDataclassActions:error:](self, "_addAccountNoSave:withDataclassActions:error:", v8, v9, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v25;
  if (v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_client);
    objc_msgSend(WeakRetained, "bundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOwningBundleID:", v15);

    _ACDLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "owningBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v17;
      _os_log_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEFAULT, "\"Owning bundleID: %@\", buf, 0xCu);

    }
    v24 = 0;
    LODWORD(self) = -[ACDAccountStore _saveWithError:](self, "_saveWithError:", &v24);
    v18 = v24;
    if ((_DWORD)self)
    {
      objc_msgSend(v12, "objectID");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject URIRepresentation](v19, "URIRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setObjectID:", v20);

    }
    else
    {
      _ACDLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[ACDAccountStore _handleAccountAdd:withDataclassActions:error:].cold.2();
    }

    if (!a5)
    {
      v21 = v18;
      goto LABEL_19;
    }
    v22 = v18;
    if (v18)
      goto LABEL_17;
  }
  else
  {
    _ACDLogSystem();
    self = (ACDAccountStore *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore _handleAccountAdd:withDataclassActions:error:].cold.1();

    LOBYTE(self) = 0;
    if (!a5)
    {
      v21 = 0;
      goto LABEL_19;
    }
  }
  v22 = 0;
  v21 = 0;
  v18 = v13;
  if (v13)
  {
LABEL_17:
    *a5 = objc_retainAutorelease(v18);
    v21 = v22;
  }
LABEL_19:

  return (char)self;
}

- (id)_credentialItemWithAccountIdentifier:(id)a3 serviceName:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountIdentifier == %@ AND serviceName == %@"), a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:](self->_databaseConnection, "fetchObjectsForEntityNamed:withPredicate:", CFSTR("CredentialItem"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_block_accountWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[ACDAccountStore _accountWithIdentifier:](self, "_accountWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v4, self);
  else
    v5 = 0;

  return v5;
}

- (id)_allAccounts_sync
{
  void *v3;
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
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__ACDAccountStore__allAccounts_sync__block_invoke;
  v6[3] = &unk_24C7E2090;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __36__ACDAccountStore__allAccounts_sync__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), 0, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x24BDB4380]);
        v16 = (void *)objc_msgSend(v15, "initWithManagedAccount:accountStore:", v14, *(_QWORD *)(a1 + 32), (_QWORD)v18);
        if (v16)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v16);
          +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "cacheAccount:", v16);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)accountsWithHandler:(id)a3
{
  void (**v4)(id, id, _QWORD);
  id v5;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[ACDAccountStore _allAccounts_sync](self, "_allAccounts_sync");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

}

- (void)accountTypesWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__ACDAccountStore_accountTypesWithHandler___block_invoke;
  v6[3] = &unk_24C7E24D0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v5, "performBlockAndWait:", v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);

}

void __43__ACDAccountStore_accountTypesWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "fetchObjectsForEntityNamed:withPredicate:", CFSTR("AccountType"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB43A8]), "initWithManagedAccountType:accountStore:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);
        +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cacheAccountType:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)displayAccountTypeForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__ACDAccountStore_displayAccountTypeForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

void __70__ACDAccountStore_displayAccountTypeForAccountWithIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_accountWithIdentifier:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_displayAccountForAccount:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "accountType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDB43A8]), "initWithManagedAccountType:accountStore:", v4, *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)masterCredentialForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__ACDAccountStore_masterCredentialForAccountIdentifier___block_invoke;
  v9[3] = &unk_24C7E20E0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__ACDAccountStore_masterCredentialForAccountIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v15[0] = *MEMORY[0x24BDB42A0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accountWithIdentifier:prefetchKeypaths:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "accountType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "credentialType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 160));
      v13 = 138412290;
      v14 = WeakRetained;
      _os_log_impl(&dword_20D8CB000, v8, OS_LOG_TYPE_DEFAULT, "\"%@ is entitled for all account access - returning OAuth 2 master token.\", (uint8_t *)&v13, 0xCu);

    }
    +[ACDKeychainManager credentialForManagedAccountObject:](ACDKeychainManager, "credentialForManagedAccountObject:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setCredentialType:", v7);
  }

}

- (void)credentialForAccount:(id)a3 serviceID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDB43F0];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke;
  v15[3] = &unk_24C7E2520;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performWithinPersonaForAccount:withBlock:", v14, v15);

}

void __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__3;
  v13[4] = __Block_byref_object_dispose__3;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__3;
  v11[4] = __Block_byref_object_dispose__3;
  v12 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2;
  v5[3] = &unk_24C7E24F8;
  v6 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v9 = v13;
  v10 = v11;
  objc_msgSend(v2, "performBlockAndWait:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
}

void __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2_cold_1();

  v3 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *MEMORY[0x24BDB42A0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accountWithIdentifier:prefetchKeypaths:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "accountType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "credentialType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v10 + 40);
    +[ACDKeychainManager credentialForManagedAccountObject:clientID:error:](ACDKeychainManager, "credentialForManagedAccountObject:clientID:error:", v6, v9, &obj);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v10 + 40), obj);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setCredentialType:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
  }

}

- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDB43F0];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke;
  v19[3] = &unk_24C7E2548;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "performWithinPersonaForAccount:withBlock:", v17, v19);

}

void __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2;
  v5[3] = &unk_24C7E2548;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "performBlockAndWait:", v5);

}

void __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void (*v9)(void);
  uint64_t v10;
  id v11;

  _ACDLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2_cold_1();

  v3 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accountWithIdentifier:prefetchKeypaths:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCredential:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v11 = 0;
    +[ACDKeychainManager setCredentialForAccount:clientID:error:](ACDKeychainManager, "setCredentialForAccount:clientID:error:", v6, v7, &v11);
    v8 = v11;
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 6, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void (**)(void))(v10 + 16);
  }
  v9();

}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_118(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  __int128 v8;
  _QWORD v9[5];
  __int128 v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 160));
  v6 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2;
  v9[3] = &unk_24C7E2570;
  v9[4] = v6;
  v8 = *(_OWORD *)(a1 + 40);
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v3, "credentialForAccount:client:store:handler:", v4, WeakRetained, v6, v9);

}

- (id)_legacyCredentialForAccount:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "hasEntitlement:", *MEMORY[0x24BDB4450]) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v7, "accountType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqual:", *MEMORY[0x24BDB4170]))
  {
    v11 = objc_msgSend(v8, "hasEntitlement:", *MEMORY[0x24BDB44D0]);

    if ((v11 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(v7, "accountType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqual:", *MEMORY[0x24BDB4080]))
  {
    v14 = objc_msgSend(v8, "hasEntitlement:", *MEMORY[0x24BDB4490]);

    if ((v14 & 1) != 0)
    {
LABEL_8:
      +[ACDKeychainManager credentialForAccount:clientID:error:](ACDKeychainManager, "credentialForAccount:clientID:error:", v7, 0, a5);
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (a5)
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDB4200];
    v19 = *MEMORY[0x24BDD0FC8];
    v20[0] = CFSTR("Client does not have access to credentials");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 9, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_9:

  return a5;
}

- (void)credentialItemsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__ACDAccountStore_credentialItemsWithCompletion___block_invoke;
  v6[3] = &unk_24C7E24D0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v5, "performBlockAndWait:", v6);

  v4[2](v4, v8[5], 0);
  _Block_object_dispose(&v7, 8);

}

void __49__ACDAccountStore_credentialItemsWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "fetchObjectsForEntityNamed:", CFSTR("CredentialItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB43B0]), "initWithManagedCredentialItem:accountStore:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), *(_QWORD *)(a1 + 32));
        if (v10)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)credentialItemForAccount:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDB43F0];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke;
  v15[3] = &unk_24C7E2520;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performWithinPersonaForAccount:withBlock:", v14, v15);

}

void __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke_2;
  v6[3] = &unk_24C7E25C0;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v9 = &v10;
  objc_msgSend(v2, "performBlockAndWait:", v6);

  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v11[5], 0, v4, v5);
  _Block_object_dispose(&v10, 8);

}

void __67__ACDAccountStore_credentialItemForAccount_serviceName_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_credentialItemWithAccountIdentifier:serviceName:", v3, *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDB43B0]), "initWithManagedCredentialItem:accountStore:", v7, *(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

- (void)insertCredentialItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACDAccountStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__ACDAccountStore_insertCredentialItem_completion___block_invoke;
  v11[3] = &unk_24C7E2638;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[ACDAccountStore accountWithIdentifier:handler:](self, "accountWithIdentifier:handler:", v8, v11);

}

void __51__ACDAccountStore_insertCredentialItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDB43F0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_2;
  v8[3] = &unk_24C7E2610;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "performWithinPersonaForAccount:withBlock:", a2, v8);

}

void __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setAccountStore:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_3;
  v5[3] = &unk_24C7E25E8;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = &v15;
  v8 = &v9;
  objc_msgSend(v2, "performBlockAndWait:", v5);

  if (!v16[5])
    objc_msgSend(*(id *)(a1 + 32), "setObjectID:", v10[5]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

}

void __51__ACDAccountStore_insertCredentialItem_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_credentialItemWithAccountIdentifier:serviceName:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "serviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("A credential item with the account identifier: %@ and service name: %@ already exists"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDB4200];
    v27 = *MEMORY[0x24BDD0FC8];
    v28[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 20, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "insertNewObjectForEntityForName:", CFSTR("CredentialItem"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v18 + 40);
    objc_msgSend(v16, "validateRequiredAttributesForObject:error:", v17, &obj);
    objc_storeStrong((id *)(v18 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "deleteObject:", v16);
    }
    else
    {
      objc_msgSend(v16, "setValuesWithObject:", *(_QWORD *)(a1 + 40));
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v25 = *(id *)(v20 + 40);
      objc_msgSend(v19, "saveWithError:", &v25);
      objc_storeStrong((id *)(v20 + 40), v25);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v16, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URIRepresentation");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
}

- (void)saveCredentialItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACDAccountStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__ACDAccountStore_saveCredentialItem_completion___block_invoke;
  v11[3] = &unk_24C7E2638;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[ACDAccountStore accountWithIdentifier:handler:](self, "accountWithIdentifier:handler:", v8, v11);

}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDB43F0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_2;
  v8[3] = &unk_24C7E2610;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "performWithinPersonaForAccount:withBlock:", a2, v8);

}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setAccountStore:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3;
  v7[3] = &unk_24C7E20E0;
  v6 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = &v10;
  objc_msgSend(v2, "performBlockAndWait:", v7);

  v4 = *(_QWORD *)(a1 + 48);
  if (v11[5])
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  _Block_object_dispose(&v10, 8);

}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  id obj;

  v2 = (id *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_credentialItemWithAccountIdentifier:serviceName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setValuesWithObject:", *v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 22, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3_cold_1();

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(_QWORD *)(v11 + 40);
  v12 = (id *)(v11 + 40);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v13)
  {
    objc_msgSend(v14, "rollback");
  }
  else
  {
    obj = 0;
    objc_msgSend(v14, "saveWithError:rollbackOnFailure:", &obj, 1);
    objc_storeStrong(v12, obj);
  }

}

- (void)removeCredentialItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACDAccountStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__ACDAccountStore_removeCredentialItem_completion___block_invoke;
  v11[3] = &unk_24C7E2638;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[ACDAccountStore accountWithIdentifier:handler:](self, "accountWithIdentifier:handler:", v8, v11);

}

void __51__ACDAccountStore_removeCredentialItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDB43F0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_2;
  v8[3] = &unk_24C7E2610;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "performWithinPersonaForAccount:withBlock:", a2, v8);

}

void __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__3;
  v8[4] = __Block_byref_object_dispose__3;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setAccountStore:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_3;
  v5[3] = &unk_24C7E20E0;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = v8;
  objc_msgSend(v2, "performBlockAndWait:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(v8, 8);

}

void __51__ACDAccountStore_removeCredentialItem_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_credentialItemWithAccountIdentifier:serviceName:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "deleteObject:", v5);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(_QWORD *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      obj = 0;
      objc_msgSend(v9, "saveWithError:", &obj);
      objc_storeStrong(v7, obj);
    }
  }

}

- (void)dataclassesWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__ACDAccountStore_dataclassesWithHandler___block_invoke;
  v7[3] = &unk_24C7E24D0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "performBlockAndWait:", v7);

  if (objc_msgSend((id)v9[5], "count"))
    v6 = v9[5];
  else
    v6 = 0;
  v4[2](v4, v6, 0);
  _Block_object_dispose(&v8, 8);

}

void __42__ACDAccountStore_dataclassesWithHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "fetchObjectsForEntityNamed:withPredicate:", CFSTR("Dataclass"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)_accountsWithAcountType:(id)a3 error:(id *)a4
{
  return -[ACDAccountStore _accountsWithAccountType:options:error:](self, "_accountsWithAccountType:options:error:", a3, 1, a4);
}

id __58__ACDAccountStore__accountsWithAccountType_options_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[7];
  v9 = 0;
  objc_msgSend(v2, "_block_accountsWithAccountType:options:error:", v3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v9;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v6);

  return v5;
}

- (id)_block_accountsWithAccountType:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  ACDDatabaseConnection *databaseConnection;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  ACDDatabaseConnection *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  databaseConnection = self->_databaseConnection;
  objc_msgSend(v8, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseConnection managedObjectIDForURI:](databaseConnection, "managedObjectIDForURI:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v29 = v8;
    -[ACDAccountStore _predicateForFetchingAccountsWithManagedAccountTypeID:options:](self, "_predicateForFetchingAccountsWithManagedAccountTypeID:options:", v11, a4);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_databaseConnection;
    objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v12;
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:](v14, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v12, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v22), self);
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v20);
    }

    v24 = 0;
    v8 = v29;
  }
  else
  {
    _ACDLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore _block_accountsWithAccountType:options:error:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 4, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;
    v17 = 0;
    if (a5 && v26)
    {
      v24 = objc_retainAutorelease(v26);
      v17 = 0;
      *a5 = v24;
    }
  }

  return v17;
}

- (void)parentAccountForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__ACDAccountStore_parentAccountForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

void __65__ACDAccountStore_parentAccountForAccountWithIdentifier_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v10[0] = *MEMORY[0x24BDB42D8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accountWithIdentifier:prefetchKeypaths:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "parentAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v6, a1[4]);
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (void)childAccountsForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  id v7;

  v6 = (void (**)(id, id, _QWORD))a4;
  -[ACDAccountStore _childAccountsForAccountWithID:](self, "_childAccountsForAccountWithID:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7, 0);

}

- (void)childAccountsWithAccountTypeIdentifier:(id)a3 parentAccountIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__ACDAccountStore_childAccountsWithAccountTypeIdentifier_parentAccountIdentifier_handler___block_invoke;
  v14[3] = &unk_24C7E25C0;
  v14[4] = self;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  v17 = &v18;
  objc_msgSend(v11, "performBlockAndWait:", v14);

  v10[2](v10, v19[5], 0);
  _Block_object_dispose(&v18, 8);

}

void __90__ACDAccountStore_childAccountsWithAccountTypeIdentifier_parentAccountIdentifier_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1[4] + 120);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier = %@ AND parentAccount.identifier = %@"), a1[5], a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[7] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13));
          if (v14)
            objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (id)_childAccountsForAccountWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  ACDAccountStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__3;
    v17 = __Block_byref_object_dispose__3;
    v18 = 0;
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__ACDAccountStore__childAccountsForAccountWithID___block_invoke;
    v9[3] = &unk_24C7E20E0;
    v10 = v4;
    v11 = self;
    v12 = &v13;
    objc_msgSend(v5, "performBlockAndWait:", v9);

    v6 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore _childAccountsForAccountWithID:].cold.1();

    v6 = 0;
  }

  return v6;
}

void __50__ACDAccountStore__childAccountsForAccountWithID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("parentAccount.identifier = %@"), a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[5] + 120);
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v2;
  objc_msgSend(v3, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v2, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v14, a1[5]);
        objc_msgSend(v14, "accountType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB43A8]), "initWithManagedAccountType:accountStore:", v16, a1[5]);
        objc_msgSend(v15, "setAccountType:", v17);
        if (v15)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

- (BOOL)_isManagedAccount:(id)a3 enabledForManagedDataclass:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "enabledDataclasses", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  ACDAccountStore *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __97__ACDAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke;
  v14[3] = &unk_24C7E26B0;
  v12 = v9;
  v15 = v12;
  v16 = self;
  v18 = &v19;
  v13 = v8;
  v17 = v13;
  objc_msgSend(v11, "performBlockAndWait:", v14);

  v10[2](v10, v20[5], 0);
  _Block_object_dispose(&v19, 8);

}

void __97__ACDAccountStore_accountIdentifiersEnabledForDataclasses_withAccountTypeIdentifiers_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier IN %@"), a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[5] + 120);
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v2;
  objc_msgSend(v3, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v2, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "enabledDataclasses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "valueForKey:", CFSTR("name"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a1[6]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "intersectsSet:", v15);

        if (v17)
        {
          objc_msgSend(v13, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v18);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

}

- (void)provisionedDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__ACDAccountStore_provisionedDataclassesForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

void __74__ACDAccountStore_provisionedDataclassesForAccountWithIdentifier_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v22[0] = *MEMORY[0x24BDB42E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accountWithIdentifier:prefetchKeypaths:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "provisionedDataclasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v8 = *(_QWORD *)(a1[6] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "name", (_QWORD)v17);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
  }

}

- (void)syncableDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  objc_msgSend(v6, "setAccountStore:", self);
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__ACDAccountStore_syncableDataclassesForAccountType_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

void __61__ACDAccountStore_syncableDataclassesForAccountType_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithURI:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "syncableDataclassStrings");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)supportedDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  objc_msgSend(v6, "setAccountStore:", self);
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__ACDAccountStore_supportedDataclassesForAccountType_handler___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v10[4] = self;
  v9 = v6;
  v11 = v9;
  v12 = &v13;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  v7[2](v7, v14[5], 0);
  _Block_object_dispose(&v13, 8);

}

void __62__ACDAccountStore_supportedDataclassesForAccountType_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithURI:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "supportedDataclassStrings");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)insertAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  ACDAccountStore *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  objc_msgSend(v6, "setAccountStore:", self);
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __49__ACDAccountStore_insertAccountType_withHandler___block_invoke;
  v19 = &unk_24C7E25E8;
  v20 = self;
  v9 = v6;
  v21 = v9;
  v22 = &v30;
  v23 = &v24;
  objc_msgSend(v8, "performBlockAndWait:", &v16);

  if (v31[5])
  {
    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "identifier", v16, v17, v18, v19, v20);
      objc_claimAutoreleasedReturnValue();
      -[ACDAccountStore insertAccountType:withHandler:].cold.1();
    }

    v11 = 0;
    v12 = v31[5];
  }
  else
  {
    objc_msgSend(v9, "setObjectID:", v25[5], v16, v17, v18, v19, v20);
    _ACDLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25[5];
      *(_DWORD *)buf = 138543618;
      v37 = v14;
      v38 = 2112;
      v39 = v15;
      _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "\"Inserted account type '%{public}@' with object ID: %@\", buf, 0x16u);

    }
    v12 = 0;
    v11 = v9;
  }
  v7[2](v7, v11, v12);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

}

void __49__ACDAccountStore_insertAccountType_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accountTypeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("An account type with the identifier: %@ already exists"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDB4200];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v7, *MEMORY[0x24BDD0FC8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 4, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v14 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "insertNewObjectForEntityForName:", CFSTR("AccountType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v16 + 40);
    objc_msgSend(v14, "validateRequiredAttributesForObject:error:", v15, &obj);
    objc_storeStrong((id *)(v16 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "deleteObject:", v14);
    }
    else
    {
      objc_msgSend(v14, "setValuesWithObject:", *(_QWORD *)(a1 + 40));
      v17 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v23 = *(id *)(v18 + 40);
      objc_msgSend(v17, "saveWithError:", &v23);
      objc_storeStrong((id *)(v18 + 40), v23);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v14, "objectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URIRepresentation");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

- (void)removeAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  v34 = 0;
  objc_msgSend(v6, "setAccountStore:", self);
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ACDAccountStore accountsExistWithAccountTypeIdentifier:](self, "accountsExistWithAccountTypeIdentifier:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1000, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v30[5];
    v30[5] = v10;

  }
  else
  {
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __49__ACDAccountStore_removeAccountType_withHandler___block_invoke;
    v26[3] = &unk_24C7E20E0;
    v26[4] = self;
    v27 = v6;
    v28 = &v29;
    objc_msgSend(v12, "performBlockAndWait:", v26);

  }
  if (v30[5])
  {
    _ACDLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "identifier");
      objc_claimAutoreleasedReturnValue();
      -[ACDAccountStore removeAccountType:withHandler:].cold.1();
    }

    v14 = v30[5];
    v15 = MEMORY[0x24BDBD1C0];
  }
  else
  {
    _ACDLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v17;
      _os_log_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEFAULT, "\"Removed account type '%{public}@'\", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDB43A8], "allIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "containsObject:", v19);

    if (v20)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      WeakRetained = objc_loadWeakRetained((id *)&self->_client);
      objc_msgSend(v6, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Client '%@' removed internal account type '%@'"), WeakRetained, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "simulateCrashWithMessage:", v24);

    }
    v14 = 0;
    v15 = MEMORY[0x24BDBD1C8];
  }
  v7[2](v7, v15, v14);
  _Block_object_dispose(&v29, 8);

}

void __49__ACDAccountStore_removeAccountType_withHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id obj;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accountTypeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "deleteObject:", v4);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(_QWORD *)(v5 + 40);
    v6 = (id *)(v5 + 40);
    if (!v7)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      obj = 0;
      objc_msgSend(v8, "saveWithError:", &obj);
      objc_storeStrong(v6, obj);
    }
  }
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAccountType:", *(_QWORD *)(a1 + 40));

}

- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "_setAccountStore:", self);
  v11 = (void *)MEMORY[0x24BDB43F0];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke;
  v15[3] = &unk_24C7E2520;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performWithinPersonaForAccount:withBlock:", v14, v15);

}

void __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
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

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2;
  v12[3] = &unk_24C7E22E8;
  v4 = (id *)(a1 + 40);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = &v23;
  v12[4] = v5;
  v13 = v3;
  v14 = *(id *)(a1 + 48);
  v16 = &v17;
  objc_msgSend(v2, "performBlockAndWait:", v12);

  if (objc_msgSend((id)v18[5], "code") == 6)
  {
    v6 = 0;
    v7 = 1;
  }
  else
  {
    v7 = *((_BYTE *)v24 + 24) != 0;
    v6 = v18[5];
  }
  (*(void (**)(_QWORD, _BOOL8, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v7, v6);
  if (*((_BYTE *)v24 + 24))
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", CFSTR("AccountSyncDelete"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*v4, "objectForKeyedSubscript:", CFSTR("AccountSyncDelete"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if ((v10 & 1) == 0)
      {
        _ACDLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_cold_1();

      }
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

void __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v20 = 0;
  v5 = objc_msgSend(v2, "_removeAccountNoSave:withDataclassActions:withError:", v3, v4, &v20);
  v6 = v20;
  v7 = *(_QWORD *)(a1[7] + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = v5;
  else
    v8 = 0;
  *(_BYTE *)(v7 + 24) = v8;
  v9 = (void *)a1[4];
  v19 = 0;
  v10 = objc_msgSend(v9, "_saveWithError:", &v19);
  v11 = v19;
  v12 = v11;
  v13 = *(_QWORD *)(a1[7] + 8);
  if (*(_BYTE *)(v13 + 24))
    v14 = v10;
  else
    v14 = 0;
  *(_BYTE *)(v13 + 24) = v14;
  v15 = v11;
  if (v11 || (v15 = v6) != 0)
  {
    v16 = *(_QWORD *)(a1[8] + 8);
    v17 = v15;
    v18 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;

  }
}

- (void)canSaveAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  objc_msgSend(v6, "_setAccountStore:", self);
  if (v7)
  {
    objc_msgSend(v6, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (objc_msgSend(v6, "accountType"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          !objc_msgSend(v8, "isObsolete")))
    {

    }
    else
    {
      v9 = -[ACDAccountStore shouldPreventAccountCreationWithObsoleteAccountType](self, "shouldPreventAccountCreationWithObsoleteAccountType");

      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "accountType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accountTypeDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("Creating %@ accounts is not supported."), v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x24BDD1540];
        v15 = *MEMORY[0x24BDB4200];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v13, *MEMORY[0x24BDD0FC8]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v7[2](v7, 0, v17);
LABEL_11:

        goto LABEL_12;
      }
    }
    v21 = 0;
    v18 = -[ACDAccountStore _canSaveAccount:error:](self, "_canSaveAccount:error:", v6, &v21);
    v13 = v21;
    if (v18)
    {
      v19 = 1;
      v20 = 0;
    }
    else
    {
      v19 = 0;
      v20 = v13;
    }
    v7[2](v7, v19, v20);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)saveAccount:(id)a3 withHandler:(id)a4
{
  -[ACDAccountStore saveAccount:verify:dataclassActions:completion:](self, "saveAccount:verify:dataclassActions:completion:", a3, 0, 0, a4);
}

- (void)saveAccount:(id)a3 pid:(id)a4 verify:(BOOL)a5 dataclassActions:(id)a6 completion:(id)a7
{
  -[ACDAccountStore saveAccount:verify:dataclassActions:completion:](self, "saveAccount:verify:dataclassActions:completion:", a3, a5, a6, a7);
}

- (void)saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  ACDAccountStore *v19;
  id v20;
  id v21;
  _QWORD *v22;
  BOOL v23;
  _QWORD v24[5];
  id v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  v24[4] = __Block_byref_object_dispose__3;
  v25 = 0;
  v13 = (void *)MEMORY[0x24BDB43F0];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke;
  v17[3] = &unk_24C7E2700;
  v14 = v10;
  v18 = v14;
  v19 = self;
  v23 = a4;
  v15 = v12;
  v21 = v15;
  v22 = v24;
  v16 = v11;
  v20 = v16;
  objc_msgSend(v13, "performWithinPersonaForAccount:withBlock:", v14, v17);

  _Block_object_dispose(v24, 8);
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CFAbsoluteTime Current;
  NSObject *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void (**v13)(void *, _QWORD);
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  int8x16_t v20;
  _QWORD v21[5];
  id v22;
  void (**v23)(void *, _QWORD);
  _QWORD v24[4];
  int8x16_t v25;
  uint64_t v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  CFAbsoluteTime v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)os_transaction_create();
  objc_msgSend(*(id *)(a1 + 32), "_setAccountStore:", *(_QWORD *)(a1 + 40));
  Current = CFAbsoluteTimeGetCurrent();
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 160));
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 160));
    objc_msgSend(v8, "pid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = WeakRetained;
    v37 = 2114;
    v38 = v9;
    v39 = 2114;
    v40 = v10;
    _os_log_impl(&dword_20D8CB000, v4, OS_LOG_TYPE_DEFAULT, "\"Daemon save called for account %@: username=%@, client=%@ (%{public}@), verify=%{public}@\", buf, 0x34u);

  }
  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_149;
  aBlock[3] = &unk_24C7E26D8;
  v30 = Current;
  v29 = *(id *)(a1 + 56);
  v12 = v2;
  v28 = v12;
  v13 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_151;
  v24[3] = &unk_24C7E20E0;
  v20 = *(int8x16_t *)(a1 + 32);
  v15 = (id)v20.i64[0];
  v25 = vextq_s8(v20, v20, 8uLL);
  v26 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v14, "performBlockAndWait:", v24);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v13[2](v13, 0);
  }
  else if (*(_BYTE *)(a1 + 72)
         && objc_msgSend(*(id *)(a1 + 32), "isActive")
         && (objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0
         && objc_msgSend(*(id *)(a1 + 32), "supportsAuthentication")
         && (objc_msgSend(*(id *)(a1 + 32), "authenticationType"),
             v16 = (void *)objc_claimAutoreleasedReturnValue(),
             v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB4548]),
             v16,
             (v17 & 1) == 0))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_154;
    v21[3] = &unk_24C7E2638;
    v21[4] = v18;
    v22 = *(id *)(a1 + 48);
    v23 = v13;
    objc_msgSend(v18, "verifyCredentialsForAccount:saveWhenAuthorized:withHandler:", v19, 0, v21);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_completeSave:dataclassActions:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v13, *(_OWORD *)&v20);
  }

}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double Current;
  double v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  Current = CFAbsoluteTimeGetCurrent();
  v8 = *(double *)(a1 + 48);
  _ACDLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", Current - v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_20D8CB000, v9, OS_LOG_TYPE_DEFAULT, "\"TIMING: Daemon save took %@\", (uint8_t *)&v11, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_151(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "accountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectIDForURIRepresentation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "managedObjectContext"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectWithID:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (objc_msgSend(v8, "obsolete"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          !objc_msgSend(v9, "BOOLValue")))
    {

    }
    else
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "shouldPreventAccountCreationWithObsoleteAccountType");

      if (v10)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(*(id *)(a1 + 40), "accountType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accountTypeDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Creating %@ accounts is not supported."), v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BDB4200];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v14, *MEMORY[0x24BDD0FC8]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

LABEL_14:
        goto LABEL_15;
      }
    }
    v32 = *(_QWORD *)(a1 + 48);
    v31 = a1 + 48;
    v33 = *(void **)(v31 - 16);
    v34 = *(_QWORD *)(v31 - 8);
    v35 = *(_QWORD *)(v32 + 8);
    obj = *(id *)(v35 + 40);
    v36 = objc_msgSend(v33, "_canSaveAccount:error:", v34, &obj);
    objc_storeStrong((id *)(v35 + 40), obj);
    if ((v36 & 1) == 0)
    {
      _ACDLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_151_cold_2();
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The account being saved is missing a valid account type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDB4200];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v21, *MEMORY[0x24BDD0FC8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 2, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 48);
    v26 = a1 + 48;
    v28 = *(_QWORD *)(v27 + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v25;

    _ACDLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_151_cold_1(v26, v30);

    v8 = 0;
  }
LABEL_15:

}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completeSave:dataclassActions:completion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    _ACDLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v8)
        __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_154_cold_2(v6, v7);

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (v8)
        __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_154_cold_1();

      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 3, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

- (BOOL)shouldPreventAccountCreationWithObsoleteAccountType
{
  return 1;
}

- (id)_lockForAccountType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (_lockForAccountType__onceToken != -1)
    dispatch_once(&_lockForAccountType__onceToken, &__block_literal_global_155);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)_lockForAccountType__accountTypeLocks;
    objc_sync_enter(v5);
    objc_msgSend((id)_lockForAccountType__accountTypeLocks, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend((id)_lockForAccountType__accountTypeLocks, "setObject:forKeyedSubscript:", v7, v4);

    }
    objc_msgSend((id)_lockForAccountType__accountTypeLocks, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __39__ACDAccountStore__lockForAccountType___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_lockForAccountType__accountTypeLocks;
  _lockForAccountType__accountTypeLocks = v0;

}

- (void)_completeSave:(id)a3 dataclassActions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  ACDAccountStore *v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  _ACDLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _completeSave:dataclassActions:completion:].cold.2();

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v8, "_setAccountStore:", self);
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__ACDAccountStore__completeSave_dataclassActions_completion___block_invoke;
  v17[3] = &unk_24C7E2748;
  v13 = v8;
  v18 = v13;
  v19 = self;
  v21 = &v27;
  v22 = &v23;
  v14 = v9;
  v20 = v14;
  objc_msgSend(v12, "performBlockAndWait:", v17);

  _ACDLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _completeSave:dataclassActions:completion:].cold.1();

  if (*((_BYTE *)v24 + 24))
  {
    objc_msgSend(v13, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v16, v28[5]);

  }
  else
  {
    v10[2](v10, 0, v28[5]);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

}

void __61__ACDAccountStore__completeSave_dataclassActions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id obj;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD **)(a1 + 40);
  if (v2)
  {
    v4 = (void *)v3[15];
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "existingObjectWithURI:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = *(void **)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v10 + 40);
      v11 = objc_msgSend(v8, "_handleAccountMod:withDataclassActions:withError:", v7, v9, &obj);
      objc_storeStrong((id *)(v10 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
      return;
    }
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("The account with object ID %@ is unknown to our DB, so it cannot be updated. It has probably already been deleted."), v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDB4200];
    v34 = *MEMORY[0x24BDD0FC8];
    v35[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 15, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accountType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_lockForAccountType:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "lock");
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v33 = *(id *)(v16 + 40);
    v17 = objc_msgSend(v14, "_canSaveAccount:error:", v15, &v33);
    objc_storeStrong((id *)(v16 + 40), v33);
    if (v17)
    {
      v19 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v32 = *(id *)(v21 + 40);
      v22 = objc_msgSend(v18, "_handleAccountAdd:withDataclassActions:error:", v19, v20, &v32);
      objc_storeStrong((id *)(v21 + 40), v32);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v22;
    }
    objc_msgSend(v13, "unlock");
  }

}

- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ACDAccountStore *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDB43F0];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke;
  v15[3] = &unk_24C7E2520;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performWithinPersonaForAccount:withBlock:", v14, v15);

}

void __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void **v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;

  v2 = (uint64_t *)(a1 + 32);
  v3 = (void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_setAccountStore:", *(_QWORD *)(a1 + 40));
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x24BDB4540]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v7 = *v3;
  v8 = *v2;
  v11 = 0;
  v9 = objc_msgSend(v7, "_canSaveAccount:error:", v8, &v11);
  v10 = v11;
  if (v9)
  {
LABEL_7:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "verifyCredentialsForAccount:accountStore:options:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_8:

}

- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDB43F0];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke;
  v15[3] = &unk_24C7E2798;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v11, "performWithinPersonaForAccount:withBlock:", v14, v15);

}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2;
  v14[3] = &unk_24C7E20E0;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v16 = v5;
  v17 = &v18;
  objc_msgSend(v2, "performBlockAndWait:", v14);

  if (v19[5])
  {
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))(v6, v7, v19[5]);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_setAccountStore:", *(_QWORD *)(a1 + 32));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v8 + 176);
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_159;
    v12[3] = &unk_24C7E2770;
    v11 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v10, "renewCredentialsForAccount:accountStore:options:completion:", v9, v8, v11, v12);
    v7 = v13;
  }

  _Block_object_dispose(&v18, 8);
}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
    objc_msgSend(*(id *)(a1 + 32), "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "existingObjectWithURI:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      _ACDLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2_cold_1();

      v8 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 32), "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("The account with object ID %@ is unknown to our DB, so it cannot be updated. It has probably already been deleted."), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDB4200];
      v17 = *MEMORY[0x24BDD0FC8];
      v18[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 15, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_159(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

- (void)requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 withHandler:(id)a5
{
  -[ACDAccountStore _requestAccessForAccountTypeWithIdentifier:options:allowUserInteraction:withHandler:](self, "_requestAccessForAccountTypeWithIdentifier:options:allowUserInteraction:withHandler:", a3, a4, 1, a5);
}

- (void)appPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  void (**v6)(id, id, _QWORD);
  ACDClientAuthorizationManager *authorizationManager;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, id, _QWORD))a4;
  authorizationManager = self->_authorizationManager;
  objc_msgSend(a3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDClientAuthorizationManager allAuthorizationsForAccountTypeWithIdentifier:](authorizationManager, "allAuthorizationsForAccountTypeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "isGranted", (_QWORD)v20));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "client");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          objc_msgSend(v10, "setValue:forKey:", v17, v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v6[2](v6, v10, 0);
}

- (void)setPermissionGranted:(id)a3 forBundleID:(id)a4 onAccountType:(id)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  ACDAccessPluginManager *accessPluginManager;
  _QWORD aBlock[4];
  id v23;
  ACDAccountStore *v24;
  id v25;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore accountTypeWithIdentifier:](self, "accountTypeWithIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[ACDClient clientWithBundleID:](ACDClient, "clientWithBundleID:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke;
  aBlock[3] = &unk_24C7E27E8;
  v17 = v10;
  v23 = v17;
  v18 = v11;
  v24 = self;
  v25 = v18;
  v19 = _Block_copy(aBlock);
  v20 = objc_msgSend(v13, "BOOLValue");

  accessPluginManager = self->_accessPluginManager;
  if ((v20 & 1) != 0)
    -[ACDAccessPluginManager authorizeAccessToAccountsOfType:forClient:store:completion:](accessPluginManager, "authorizeAccessToAccountsOfType:forClient:store:completion:", v15, v16, self, v19);
  else
    -[ACDAccessPluginManager revokeAccessToAccountsOfType:forClient:store:completion:](accessPluginManager, "revokeAccessToAccountsOfType:forClient:store:completion:", v15, v16, self, v19);

}

void __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void (*v7)(void);
  void *v8;

  v4 = a3;
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAccountType:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    _ACDLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke_cold_1();

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accountStore:didSaveAccount:changeType:", *(_QWORD *)(a1 + 40), 0, 2);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v7();

}

- (void)clearAllPermissionsGrantedForAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ACDAccessPluginManager *accessPluginManager;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ACDAccountStore *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore accountTypeWithIdentifier:](self, "accountTypeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  accessPluginManager = self->_accessPluginManager;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke;
  v13[3] = &unk_24C7E27E8;
  v15 = self;
  v16 = v7;
  v14 = v6;
  v11 = v7;
  v12 = v6;
  -[ACDAccessPluginManager revokeAllAccessToAccountsOfType:store:withCompletion:](accessPluginManager, "revokeAllAccessToAccountsOfType:store:withCompletion:", v9, self, v13);

}

void __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAccountType:", *(_QWORD *)(a1 + 32));

  _ACDLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountStore:didSaveAccount:changeType:", *(_QWORD *)(a1 + 40), 0, 2);

}

- (void)permissionForAccountType:(id)a3 withHandler:(id)a4
{
  ACDClient **p_client;
  void (**v7)(id, void *, _QWORD);
  id WeakRetained;
  int v9;
  void *v10;
  ACDClientAuthorizationManager *authorizationManager;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  p_client = &self->_client;
  v7 = (void (**)(id, void *, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v9 = objc_msgSend(WeakRetained, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    authorizationManager = self->_authorizationManager;
    v12 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v15, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDClientAuthorizationManager authorizationForClient:accountTypeWithIdentifier:](authorizationManager, "authorizationForClient:accountTypeWithIdentifier:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v14, "isGranted"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7[2](v7, v10, 0);

}

- (void)grantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  ACDClientAuthorizationManager *authorizationManager;
  ACDClient **p_client;
  void (**v7)(id, void *, _QWORD);
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  authorizationManager = self->_authorizationManager;
  p_client = &self->_client;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_client);
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDClientAuthorizationManager authorizationForClient:accountTypeWithIdentifier:](authorizationManager, "authorizationForClient:accountTypeWithIdentifier:", WeakRetained, v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "grantedPermissions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v11, 0);

}

- (void)clearGrantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ACDAccessPluginManager *accessPluginManager;
  id WeakRetained;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore accountTypeWithIdentifier:](self, "accountTypeWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  accessPluginManager = self->_accessPluginManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke;
  v14[3] = &unk_24C7E2810;
  v15 = v6;
  v16 = v7;
  v14[4] = self;
  v12 = v6;
  v13 = v7;
  -[ACDAccessPluginManager revokeAccessToAccountsOfType:forClient:store:completion:](accessPluginManager, "revokeAccessToAccountsOfType:forClient:store:completion:", v9, WeakRetained, self, v14);

}

void __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;

  v4 = a3;
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "authorizationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
  v9 = (id)objc_msgSend(v7, "removeAuthorizationForClient:accountType:", WeakRetained, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountStore:didSaveAccount:changeType:", *(_QWORD *)(a1 + 32), 0, 2);

}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;
  id v7;

  v4 = (void (**)(id, id))a3;
  -[ACDAccountStore dataclassOwnersManager](self, "dataclassOwnersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v5, "preloadDataclassOwnersWithError:", &v7);
  v6 = v7;

  if (v4)
    v4[2](v4, v6);

}

- (void)dataclassActionsForAccountSave:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  uint64_t v8;
  id v9;
  void (**v10)(void *, id, void *, id *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void (**v21)(void *, id, void *, id *);
  id v22;
  _QWORD aBlock[5];
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  objc_msgSend(v6, "_setAccountStore:", self);
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke;
  aBlock[3] = &unk_24C7E2838;
  aBlock[4] = self;
  v9 = v6;
  v24 = v9;
  v10 = (void (**)(void *, id, void *, id *))_Block_copy(aBlock);
  objc_msgSend(v9, "trackedEnabledDataclasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allModifications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    if (objc_msgSend(v12, "count") == 1)
    {
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v10[2](v10, v14, v15, &v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v22;
      if (v16)
      {
        v25 = v14;
        v26[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v18, v17);

      }
      else
      {
        v7[2](v7, 0, v17);
      }

    }
    else
    {
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke_2;
      v19[3] = &unk_24C7E24A8;
      v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v21 = v10;
      v14 = v20;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v19);
      v7[2](v7, v14, 0);

    }
  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

id __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB4190]))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataclassOwnersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionsForEnablingDataclass:onAccount:withError:", v7, *(_QWORD *)(a1 + 40), a4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB41A0]))
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "dataclassOwnersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionsForDisablingDataclass:onAccount:withError:", v7, *(_QWORD *)(a1 + 40), a4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

LABEL_7:
  return v11;
}

void __61__ACDAccountStore_dataclassActionsForAccountSave_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);
  }
  else if (v8)
  {
    _ACDLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_ERROR, "\"Failed to get actions for dataclass: %@, changeType: %@, error: %@\", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDB43C0], "_actionForError:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v5);

  }
}

- (void)dataclassActionsForAccountDeletion:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void (**v19)(id, id, id);
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v19 = (void (**)(id, id, id))a4;
  objc_msgSend(v6, "_setAccountStore:", self);
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v6, "enabledDataclasses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        v12 = v9;
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[ACDAccountStore dataclassOwnersManager](self, "dataclassOwnersManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v9;
        objc_msgSend(v14, "actionsForDeletingAccount:affectingDataclass:withError:", v6, v13, &v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v22;

        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v21, "setObject:forKey:", v15, v13);
        }
        else if (v9)
        {
          _ACDLogSystem();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v13;
            v30 = 2112;
            v31 = v9;
            _os_log_error_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_ERROR, "\"Failed to query actions for dataclass %@, error: %@\", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x24BDB43C0], "_actionForError:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v17;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v18, v13);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v19[2](v19, v21, v9);
}

- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(id, uint64_t, _QWORD);

  v9 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  objc_msgSend(v6, "_setAccountStore:", self);
  -[ACDAccountStore dataclassOwnersManager](self, "dataclassOwnersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPerformingDataclassActionsForAccount:", v6);

  v9[2](v9, v8, 0);
}

- (void)accountExistsWithDescription:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ACDAccountStore *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__ACDAccountStore_accountExistsWithDescription_completion___block_invoke;
  v10[3] = &unk_24C7E20E0;
  v9 = v6;
  v11 = v9;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *((unsigned __int8 *)v15 + 24), 0);
  _Block_object_dispose(&v14, 8);

}

void __59__ACDAccountStore_accountExistsWithDescription_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountDescription == %@"), a1[4]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1[5] + 120);
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v5, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "count") != 0;
}

- (void)isTetheredSyncingEnabledForDataclass:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, void *);
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD, void *))a4;
  v6 = syncDataTypeForDataclass(a3);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v5[2](v5, 0, v7);

    goto LABEL_7;
  }
  v11 = 0;
  if (!GetTetheredSyncingDisabledForDataType(v6, &v11))
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDB4200];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = CFSTR("GetTetheredSyncingDisabledForDataType failed!");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  ((void (**)(id, BOOL, void *))v5)[2](v5, v11 == 0, 0);
LABEL_7:

}

- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  _ACDLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore kerberosAccountsForDomainFromURL:completion:].cold.1();

  objc_msgSend(v6, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __63__ACDAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke;
    v11[3] = &unk_24C7E2860;
    v11[4] = self;
    v13 = &v14;
    v12 = v9;
    objc_msgSend(v10, "performBlockAndWait:", v11);

  }
  v7[2](v7, v15[5], 0);

  _Block_object_dispose(&v14, 8);
}

void __63__ACDAccountStore_kerberosAccountsForDomainFromURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier matches 'com.apple.account.kerberos.sso.*'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(obj);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12), *(_QWORD *)(a1 + 32));
          objc_msgSend(v13, "accountProperties");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("domains"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v17 = v15;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v25;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v25 != v20)
                  objc_enumerationMutation(v17);
                GSSRuleAddMatch();
                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v19);
          }

          if (GSSRuleGetMatch())
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v13);

          ++v12;
        }
        while (v12 != v10);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    v5 = v22;
  }

}

- (void)isPushSupportedForAccount:(id)a3 completion:(id)a4
{
  ACDAuthenticationPluginManager *authenticationPluginManager;
  void (**v6)(id, uint64_t, _QWORD);

  authenticationPluginManager = self->_authenticationPluginManager;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v6[2](v6, -[ACDAuthenticationPluginManager isPushSupportedForAccount:](authenticationPluginManager, "isPushSupportedForAccount:", a3), 0);

}

- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "_setAccountStore:", self);
  -[ACDAuthenticationPluginManager discoverPropertiesForAccount:accountStore:options:completion:](self->_authenticationPluginManager, "discoverPropertiesForAccount:accountStore:options:completion:", v10, self, v9, v8);

}

- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4
{
  id v6;
  ACDDatabaseConnection *databaseConnection;
  void (**v8)(id, uint64_t, _QWORD);
  ACDDatabaseConnection *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  databaseConnection = self->_databaseConnection;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  -[ACDDatabaseConnection setVersion:](databaseConnection, "setVersion:", v6);
  v9 = self->_databaseConnection;
  v14 = 0;
  v10 = -[ACDDatabaseConnection saveWithError:](v9, "saveWithError:", &v14);
  v11 = v14;
  _ACDLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "\"Reset database to version %@, will exit when clean\", buf, 0xCu);
    }

    v8[2](v8, 1, 0);
    xpc_transaction_exit_clean();
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore resetDatabaseToVersion:withCompletion:].cold.1();

    ((void (**)(id, uint64_t, id))v8)[2](v8, 0, v11);
  }

}

- (id)_clientTokenQueue
{
  if (_clientTokenQueue_onceToken != -1)
    dispatch_once(&_clientTokenQueue_onceToken, &__block_literal_global_175);
  return (id)_clientTokenQueue_clientTokenQueue;
}

void __36__ACDAccountStore__clientTokenQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.accounts.clienttoken", v2);
  v1 = (void *)_clientTokenQueue_clientTokenQueue;
  _clientTokenQueue_clientTokenQueue = (uint64_t)v0;

}

- (void)addClientToken:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke;
  v14[3] = &unk_24C7E28A8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[ACDAccountStore accountWithIdentifier:handler:](self, "accountWithIdentifier:handler:", v12, v14);

}

void __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_2;
  v6[3] = &unk_24C7E2520;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDB43F0];
  v6[1] = 3221225472;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "performWithinPersonaForAccount:withBlock:", a2, v6);

}

void __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(a1[4], "_clientTokenQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_3;
  v5[3] = &unk_24C7E2520;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  v9 = a1[7];
  dispatch_async(v2, v5);

}

void __66__ACDAccountStore_addClientToken_forAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_clientTokenForAccountIdentifier:error:", *(_QWORD *)(a1 + 48), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = 0;
    }
    else
    {
      v8 = *MEMORY[0x24BDE8F60];
      v9[0] = *MEMORY[0x24BDE8F70];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 0;
      +[ACDKeychain addItemWithServiceName:username:accessGroup:passwordData:options:error:](ACDKeychain, "addItemWithServiceName:username:accessGroup:passwordData:options:error:", CFSTR("com.apple.account.clientToken"), v6, 0, v5, v4, &v7);
      v3 = v7;

    }
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)clientTokenForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke;
  v10[3] = &unk_24C7E2638;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ACDAccountStore accountWithIdentifier:handler:](self, "accountWithIdentifier:handler:", v9, v10);

}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_2;
  v6[3] = &unk_24C7E2610;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDB43F0];
  v6[1] = 3221225472;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "performWithinPersonaForAccount:withBlock:", a2, v6);

}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "_clientTokenQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3;
  block[3] = &unk_24C7E2610;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, block);

}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_clientTokenForAccountIdentifier:error:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ACDLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3_cold_1();

    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)clientTokenForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v5 = (void *)MEMORY[0x24BDB43F0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__ACDAccountStore_clientTokenForAccount___block_invoke;
  v9[3] = &unk_24C7E2860;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performWithinPersonaForAccount:withBlock:", v6, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __41__ACDAccountStore_clientTokenForAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[5];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "_clientTokenQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ACDAccountStore_clientTokenForAccount___block_invoke_2;
  block[3] = &unk_24C7E1E88;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_sync(v2, block);

}

void __41__ACDAccountStore_clientTokenForAccount___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_clientTokenForAccountIdentifier:error:", v6, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_clientTokenForAccountIdentifier:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v10 = a4;
  v5 = a4;
  +[ACDKeychain passwordForServiceName:username:accessGroup:options:error:](ACDKeychain, "passwordForServiceName:username:accessGroup:options:error:", CFSTR("com.apple.account.clientToken"), a3, 0, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v7)
  {
    _ACDLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _clientTokenForAccountIdentifier:error:].cold.1();

  }
  return v6;
}

- (void)_removeClientTokenForAccountIdentifer:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;

  v5 = 0;
  +[ACDKeychain removeItemForServiceName:username:accessGroup:options:error:](ACDKeychain, "removeItemForServiceName:username:accessGroup:options:error:", CFSTR("com.apple.account.clientToken"), a3, 0, 0, &v5);
  v3 = v5;
  if (v3)
  {
    _ACDLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore _removeClientTokenForAccountIdentifer:].cold.1();

  }
}

- (void)handleURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  ACDAccountStore *v20;
  id v21;
  __int128 *p_buf;
  uint8_t v23[4];
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ACDLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"Handling URL %@\", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:options:", CFSTR("client_token"), 1) == 0;

  if (v7)
  {
    objc_msgSend(v4, "path");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "length") >= 2)
    {
      objc_msgSend(v9, "substringFromIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[ACDAccountStore _allAccounts_sync](self, "_allAccounts_sync");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACDAccountStore _clientTokenQueue](self, "_clientTokenQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __29__ACDAccountStore_handleURL___block_invoke;
      v18[3] = &unk_24C7E25C0;
      v19 = v11;
      v20 = self;
      v9 = v10;
      v21 = v9;
      p_buf = &buf;
      v13 = v11;
      dispatch_sync(v12, v18);

    }
  }
  else
  {
    objc_msgSend(v4, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v8;
  }

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v23 = 138412290;
      v24 = v15;
      _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"Found a matching account with identifier %@\", v23, 0xCu);
    }

    -[ACDAccountStore accountWithIdentifier:](self, "accountWithIdentifier:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      -[NSObject setLastCredentialRenewalRejectionDate:](v16, "setLastCredentialRenewalRejectionDate:", 0);
      -[NSObject setAuthenticated:](v17, "setAuthenticated:", 1);
      -[ACDAccountStore saveVerifiedAccount:error:](self, "saveVerifiedAccount:error:", v17, 0);
    }
  }
  else
  {
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ACDAccountStore handleURL:].cold.1();
  }

  _Block_object_dispose(&buf, 8);
}

void __29__ACDAccountStore_handleURL___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "identifier", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_clientTokenForAccountIdentifier:error:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 48));

        if (v11)
        {
          objc_msgSend(v7, "identifier");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)remoteAccountStoreSession
{
  ACDFakeRemoteAccountStoreSession *fakeRemoteAccountStoreSession;
  ACDFakeRemoteAccountStoreSession *v4;
  ACDFakeRemoteAccountStoreSession *v5;

  fakeRemoteAccountStoreSession = self->_fakeRemoteAccountStoreSession;
  if (!fakeRemoteAccountStoreSession)
  {
    v4 = -[ACDFakeRemoteAccountStoreSession initWithFakeProxy:]([ACDFakeRemoteAccountStoreSession alloc], "initWithFakeProxy:", self);
    v5 = self->_fakeRemoteAccountStoreSession;
    self->_fakeRemoteAccountStoreSession = v4;

    fakeRemoteAccountStoreSession = self->_fakeRemoteAccountStoreSession;
  }
  return fakeRemoteAccountStoreSession;
}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "_setAccountStore:", self);
  -[ACDAccountStore authenticationDialogManager](self, "authenticationDialogManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "openAuthenticationURL:forAccount:shouldConfirm:completion:", v12, v11, v6, v10);

}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "_setAccountStore:", self);
  -[ACDAccountStore authenticationDialogManager](self, "authenticationDialogManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "openAuthenticationURLForAccount:withDelegateClassName:fromBundleAtPath:shouldConfirm:completion:", v15, v14, v13, v7, v12);

}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ACDAccountStore *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__ACDAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke;
  v11[3] = &unk_24C7E2610;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

void __80__ACDAccountStore_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("visible == YES && parentAccount == nil && accountType.identifier IN %@"), a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[5] + 120);
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v2, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }
  v13 = a1[6];
  if (v13)
    (*(void (**)(uint64_t, id, _QWORD))(v13 + 16))(v13, v6, 0);

}

uint64_t __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_block_accountsWithAccountTypeIdentifiers:preloadedProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __85__ACDAccountStore_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_block_accountsWithAccountTypeIdentifiers:preloadedProperties:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (id)_block_accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  int v85;
  int v86;
  uint64_t v87;
  id obj;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    v9 = (void *)MEMORY[0x24BDD1758];
    if (v8 == 1)
    {
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "predicateWithFormat:", CFSTR("accountType.identifier == %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType.identifier IN %@"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = 0x24BDB4000uLL;
  objc_msgSend(MEMORY[0x24BDB4380], "keypathsRequiredForInitialization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v15 = *MEMORY[0x24BDB42D0];
  if (objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDB42D0]))
    objc_msgSend(v14, "addObject:", v15);
  v16 = *MEMORY[0x24BDB42E0];
  if (objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDB42E0]))
    objc_msgSend(v14, "addObject:", v16);
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:](self->_databaseConnection, "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("Account"), v11, 0, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v80 = v14;
    v81 = v11;
    v82 = v6;
    v89 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v86 = objc_msgSend(v7, "containsObject:", v15);
    v85 = objc_msgSend(v7, "containsObject:", v16);
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v79 = v17;
    obj = v17;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v107;
      v83 = v7;
      v84 = *(_QWORD *)v107;
      do
      {
        v21 = 0;
        v87 = v19;
        do
        {
          if (*(_QWORD *)v107 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v21);
          v23 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 896)), "initWithManagedAccount:", v22);
          if (v23)
          {
            objc_msgSend(v89, "addObject:", v23);
            if (objc_msgSend(v7, "count"))
            {
              if (v86)
              {
                v24 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                v102 = 0u;
                v103 = 0u;
                v104 = 0u;
                v105 = 0u;
                objc_msgSend(v22, "enabledDataclasses");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
                if (v26)
                {
                  v27 = v26;
                  v28 = *(_QWORD *)v103;
                  do
                  {
                    v29 = 0;
                    do
                    {
                      if (*(_QWORD *)v103 != v28)
                        objc_enumerationMutation(v25);
                      objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * v29), "name");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "addObject:", v30);

                      ++v29;
                    }
                    while (v27 != v29);
                    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
                  }
                  while (v27);
                }

                objc_msgSend(MEMORY[0x24BDB4410], "setWithSet:", v24);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setTrackedEnabledDataclasses:", v31);

                objc_msgSend(v23, "accountType");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "accountType");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "syncableDataclassStrings");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setSyncableDataclasses:", v34);

                objc_msgSend(v23, "parentAccount");
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                {
                  v36 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                  v98 = 0u;
                  v99 = 0u;
                  v100 = 0u;
                  v101 = 0u;
                  objc_msgSend(v22, "parentAccount");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "enabledDataclasses");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                  if (v39)
                  {
                    v40 = v39;
                    v41 = *(_QWORD *)v99;
                    do
                    {
                      v42 = 0;
                      do
                      {
                        if (*(_QWORD *)v99 != v41)
                          objc_enumerationMutation(v38);
                        objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * v42), "name");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v36, "addObject:", v43);

                        ++v42;
                      }
                      while (v40 != v42);
                      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                    }
                    while (v40);
                  }

                  objc_msgSend(MEMORY[0x24BDB4410], "setWithSet:", v36);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "parentAccount");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "setTrackedEnabledDataclasses:", v44);

                  objc_msgSend(v23, "parentAccount");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "accountType");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "parentAccount");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "accountType");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "syncableDataclassStrings");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "setSyncableDataclasses:", v50);

                  v7 = v83;
                }

                v12 = 0x24BDB4000;
                v20 = v84;
                v19 = v87;
              }
              if (v85)
              {
                v51 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                v94 = 0u;
                v95 = 0u;
                v96 = 0u;
                v97 = 0u;
                objc_msgSend(v22, "provisionedDataclasses");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
                if (v53)
                {
                  v54 = v53;
                  v55 = *(_QWORD *)v95;
                  do
                  {
                    v56 = 0;
                    do
                    {
                      if (*(_QWORD *)v95 != v55)
                        objc_enumerationMutation(v52);
                      objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * v56), "name");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "addObject:", v57);

                      ++v56;
                    }
                    while (v54 != v56);
                    v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
                  }
                  while (v54);
                }

                objc_msgSend(MEMORY[0x24BDB4410], "setWithSet:", v51);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setTrackedProvisionedDataclasses:", v58);

                objc_msgSend(v23, "accountType");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "accountType");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "supportedDataclassStrings");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "setSupportedDataclasses:", v61);

                objc_msgSend(v23, "parentAccount");
                v62 = (void *)objc_claimAutoreleasedReturnValue();

                if (v62)
                {
                  v63 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                  v90 = 0u;
                  v91 = 0u;
                  v92 = 0u;
                  v93 = 0u;
                  objc_msgSend(v22, "parentAccount");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "provisionedDataclasses");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();

                  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                  if (v66)
                  {
                    v67 = v66;
                    v68 = *(_QWORD *)v91;
                    do
                    {
                      v69 = 0;
                      do
                      {
                        if (*(_QWORD *)v91 != v68)
                          objc_enumerationMutation(v65);
                        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v69), "name");
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v63, "addObject:", v70);

                        ++v69;
                      }
                      while (v67 != v69);
                      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
                    }
                    while (v67);
                  }

                  objc_msgSend(MEMORY[0x24BDB4410], "setWithSet:", v63);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "parentAccount");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "setTrackedProvisionedDataclasses:", v71);

                  objc_msgSend(v23, "parentAccount");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "accountType");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "parentAccount");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "accountType");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v76, "supportedDataclassStrings");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "setSupportedDataclasses:", v77);

                  v7 = v83;
                }

                v12 = 0x24BDB4000;
                v20 = v84;
                v19 = v87;
              }
            }
          }

          ++v21;
        }
        while (v21 != v19);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
      }
      while (v19);
    }

    v11 = v81;
    v6 = v82;
    v17 = v79;
    v14 = v80;
  }
  else
  {
    v89 = 0;
  }

  return v89;
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4
{
  -[ACDAccountStore notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:](self, "notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:", a3, a4, 0, 0);
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  ACRemoteDeviceProxy *remoteDeviceProxy;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  _ACLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:].cold.1();

  objc_msgSend(v10, "_setAccountStore:", self);
  remoteDeviceProxy = self->_remoteDeviceProxy;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __90__ACDAccountStore_notifyRemoteDevicesOfModifiedAccount_withChangeType_options_completion___block_invoke;
  v17[3] = &unk_24C7E28F8;
  v18 = v12;
  v16 = v12;
  -[ACRemoteDeviceProxy sendCommand:withAccount:options:completion:](remoteDeviceProxy, "sendCommand:withAccount:options:completion:", v11, v10, v13, v17);

}

uint64_t __90__ACDAccountStore_notifyRemoteDevicesOfModifiedAccount_withChangeType_options_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ACRemoteDeviceProxy *remoteDeviceProxy;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  _ACLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore saveAccount:toPairedDeviceWithOptions:completion:].cold.1();

  objc_msgSend(v8, "_setAccountStore:", self);
  remoteDeviceProxy = self->_remoteDeviceProxy;
  v13 = *MEMORY[0x24BDB4300];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__ACDAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke;
  v15[3] = &unk_24C7E28F8;
  v16 = v9;
  v14 = v9;
  -[ACRemoteDeviceProxy sendCommand:withAccount:options:completion:](remoteDeviceProxy, "sendCommand:withAccount:options:completion:", v13, v8, v10, v15);

}

uint64_t __68__ACDAccountStore_saveAccount_toPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ACRemoteDeviceProxy *remoteDeviceProxy;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  _ACLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore removeAccountsFromPairedDeviceWithOptions:completion:].cold.1();

  remoteDeviceProxy = self->_remoteDeviceProxy;
  v10 = *MEMORY[0x24BDB4310];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__ACDAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke;
  v12[3] = &unk_24C7E28F8;
  v13 = v6;
  v11 = v6;
  -[ACRemoteDeviceProxy sendCommand:withAccount:options:completion:](remoteDeviceProxy, "sendCommand:withAccount:options:completion:", v10, 0, v7, v12);

}

uint64_t __72__ACDAccountStore_removeAccountsFromPairedDeviceWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ACRemoteDeviceProxy *remoteDeviceProxy;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  _ACLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore removeAccountFromPairedDevice:withOptions:completion:].cold.1();

  remoteDeviceProxy = self->_remoteDeviceProxy;
  v13 = *MEMORY[0x24BDB4308];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__ACDAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke;
  v15[3] = &unk_24C7E28F8;
  v16 = v8;
  v14 = v8;
  -[ACRemoteDeviceProxy sendCommand:withAccount:options:completion:](remoteDeviceProxy, "sendCommand:withAccount:options:completion:", v13, v10, v9, v15);

}

uint64_t __72__ACDAccountStore_removeAccountFromPairedDevice_withOptions_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore migrateCredentialForAccount:completion:].cold.1();

  +[ACDKeychainMigrator sharedInstance](ACDKeychainMigrator, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keychainItemsForAccounts:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
        +[ACDKeychainMigrator sharedInstance](ACDKeychainMigrator, "sharedInstance", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "migrateKeychainItem:toKeybag:", v16, 1);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  +[ACDKeychainManager notifiyCredentialChangedForAccount:](ACDKeychainManager, "notifiyCredentialChangedForAccount:", v5);
  if (v6)
    v6[2](v6, 1, 0);

}

- (void)triggerKeychainMigrationIfNecessary:(id)a3
{
  void (**v4)(id, BOOL, id);
  NSObject *v5;
  ACDDatabaseConnection **p_databaseConnection;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  ACDDatabaseConnection *v14;
  void *v15;
  ACDDatabaseConnection *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, BOOL, id))a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore triggerKeychainMigrationIfNecessary:].cold.2();

  p_databaseConnection = &self->_databaseConnection;
  -[ACDDatabaseConnection keychainVersion](self->_databaseConnection, "keychainVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  _ACLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v21 = v7;
    v22 = 2112;
    if (v8 < 7)
      v12 = CFSTR("YES");
    v23 = v10;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_20D8CB000, v9, OS_LOG_TYPE_DEFAULT, "\"Database keychain version: %@, expected version: %@, will migrate: %@\", buf, 0x20u);

  }
  if (v8 >= 7)
  {
    v17 = 0;
  }
  else
  {
    +[ACDKeychainMigrator sharedInstance](ACDKeychainMigrator, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "migrateAllKeychainItems");

    v14 = *p_databaseConnection;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDDatabaseConnection setKeychainVersion:](v14, "setKeychainVersion:", v15);

    v16 = *p_databaseConnection;
    v19 = 0;
    -[ACDDatabaseConnection saveWithError:](v16, "saveWithError:", &v19);
    v17 = v19;
    if (v17)
    {
      _ACDLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ACDAccountStore triggerKeychainMigrationIfNecessary:].cold.1();

    }
  }
  if (v4)
    v4[2](v4, v17 == 0, v17);

}

- (void)runAccountMigrationPlugins:(id)a3
{
  void (**v4)(id, BOOL);
  NSObject *v5;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = (void (**)(id, BOOL))a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore runAccountMigrationPlugins:].cold.1();

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ACDAccountStore_runAccountMigrationPlugins___block_invoke;
  v7[3] = &unk_24C7E2158;
  v7[4] = self;
  v7[5] = v8;
  v7[6] = &v10;
  objc_msgSend(v6, "performBlockAndWait:", v7);

  if (v4)
    v4[2](v4, v11[5] == 0);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

}

void __46__ACDAccountStore_runAccountMigrationPlugins___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4180]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4188]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v4, "_pruneDuplicateAccountsForAccountType:withUserName:error:", v2, CFSTR("local"), &v15);
  v5 = v15;
  v6 = *(void **)(a1 + 32);
  v14 = v5;
  objc_msgSend(v6, "_pruneDuplicateAccountsForAccountType:withUserName:error:", v3, CFSTR("local"), &v14);
  v7 = v14;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v13 = v7;
  LOBYTE(v5) = objc_msgSend(v8, "saveWithError:", &v13);
  v9 = v13;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v5;
  if (v9)
  {
    objc_msgSend(v9, "ac_secureCodingError");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (void)_pruneDuplicateAccountsForAccountType:(id)a3 withUserName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _ACLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore _pruneDuplicateAccountsForAccountType:withUserName:error:].cold.3();

  v36 = v7;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("accountType == %@ && username == %@"), v7, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("date"), 1);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Account"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v10;
  objc_msgSend(v12, "setPredicate:", v10);
  v34 = (void *)v11;
  v45[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortDescriptors:", v13);

  objc_msgSend(v12, "setFetchLimit:", 1);
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v14, "executeFetchRequest:error:", v12, &v38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v38;

  if (v16)
  {
    _ACDLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v36;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v40 = v36;
      v41 = 2112;
      v42 = v8;
      v43 = 2112;
      v44 = v16;
      _os_log_error_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_ERROR, "@\"Error pruning accounts of type %@ with username %@: %@\", buf, 0x20u);
    }

    if (a5)
    {
      v16 = objc_retainAutorelease(v16);
      *a5 = v16;
    }
  }
  else if (objc_msgSend(v15, "count"))
  {
    if (objc_msgSend(v15, "count") != 1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDAccountStore.m"), 3200, CFSTR("Should only be one value returned here!"));

    }
    objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Account"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v15, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    objc_msgSend(v20, "predicateWithFormat:", CFSTR("accountType == %@ && username == %@ && SELF != %@"), v36, v8, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPredicate:", v23);

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v19);
    objc_msgSend(v24, "setResultType:", 2);
    -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    objc_msgSend(v25, "executeRequest:error:", v24, &v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v37;

    _ACDLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _pruneDuplicateAccountsForAccountType:withUserName:error:].cold.2(v26, v27);
    v28 = v26;

    v18 = v36;
    if (v16)
    {
      _ACDLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v40 = v36;
        v41 = 2112;
        v42 = v8;
        v43 = 2112;
        v44 = v16;
        _os_log_error_impl(&dword_20D8CB000, v29, OS_LOG_TYPE_ERROR, "@\"Error pruning accounts of type %@ with username %@: %@\", buf, 0x20u);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v16);
    }

  }
  else
  {
    _ACDLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    v18 = v36;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[ACDAccountStore _pruneDuplicateAccountsForAccountType:withUserName:error:].cold.1();

    v16 = 0;
  }

}

- (void)scheduleBackupIfNonexistent:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);

  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[ACDAccountStore databaseBackupActivity](self, "databaseBackupActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleBackupIfNonexistent");

  v5[2](v5, 1, 0);
}

- (void)shutdownAccountsD:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
  xpc_transaction_exit_clean();
}

- (void)accountsWithTypeIdentifier:(id)a3 propertyKey:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  ACDAccountStore *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, _QWORD))a7;
  _ACDLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[ACDAccountStore accountsWithTypeIdentifier:propertyKey:value:cacheSuffix:completion:].cold.1();

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  v33 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke;
  v22[3] = &unk_24C7E2920;
  v19 = v13;
  v23 = v19;
  v20 = v14;
  v24 = v20;
  v21 = v12;
  v25 = v21;
  v26 = self;
  v27 = &v28;
  objc_msgSend(v18, "performBlockAndWait:", v22);

  -[ACDAccountStore cacheGenerationForAccounts:cacheSuffix:](self, "cacheGenerationForAccounts:cacheSuffix:", v29[5], v15);
  v16[2](v16, v29[5], 0);

  _Block_object_dispose(&v28, 8);
}

void __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("key == %@ && value == %@ && owner.accountType.identifier == %@"), a1[4], a1[5], a1[6]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[7] + 120), "fetchObjectsForEntityNamed:withPredicate:sortDescriptor:prefetchKeypaths:", CFSTR("AccountProperty"), v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = *(_QWORD *)(a1[8] + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v3;
    v22 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v22)
    {
      v18 = v3;
      v19 = v2;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "owner");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1[7] + 120), "managedObjectContext");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "refreshObject:mergeChanges:", v8, 1);

          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          objc_msgSend(v8, "customProperties");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v24 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
                objc_msgSend(*(id *)(a1[7] + 120), "managedObjectContext");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "refreshObject:mergeChanges:", v15, 1);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v12);
          }

          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4380]), "initWithManagedAccount:accountStore:", v8, a1[7]);
          if (v17)
            objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v17);

        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v22);
      v3 = v18;
      v2 = v19;
    }
  }
  else
  {
    _ACDLogSystem();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke_cold_1();
  }

}

- (void)cacheGenerationForAccounts:(id)a3 cacheSuffix:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[ACDAccountStore accountCache](ACDAccountStore, "accountCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cacheGenerationForAccounts:cacheSuffix:", v6, v5);

}

- (void)uidOfAccountsd:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = geteuid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);

}

- (ACDAccountStoreDelegate)delegate
{
  return (ACDAccountStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (ACRemoteDeviceProxy)remoteDeviceProxy
{
  return self->_remoteDeviceProxy;
}

- (ACDDatabaseConnection)databaseConnection
{
  return self->_databaseConnection;
}

- (ACDAuthenticationPluginManager)authenticationPluginManager
{
  return self->_authenticationPluginManager;
}

- (ACDAccessPluginManager)accessPluginManager
{
  return self->_accessPluginManager;
}

- (ACDDataclassOwnersManager)dataclassOwnersManager
{
  return self->_dataclassOwnersManager;
}

- (ACDAuthenticationDialogManager)authenticationDialogManager
{
  return self->_authenticationDialogManager;
}

- (ACDAccountNotifier)accountNotifier
{
  return self->_accountNotifier;
}

- (ACDDatabaseBackupActivity)databaseBackupActivity
{
  return self->_databaseBackupActivity;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (BOOL)isMigrationInProgress
{
  return self->_migrationInProgress;
}

- (void)setMigrationInProgress:(BOOL)a3
{
  self->_migrationInProgress = a3;
}

- (void)init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v0, v1, "\"Deprecated method called: %{private}s %{private}@\", v2, v3, v4, v5, 3u);

  OUTLINED_FUNCTION_14();
}

- (void)initWithClient:databaseConnection:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_32();
  objc_msgSend(v0, "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v2, v3, "\"Initializing new ACDAccountStore: client=%@, connection=%@\", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)accountsOnPairedDeviceWithAccountTypes:withOptions:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_removeAccountNoSave:withDataclassActions:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_removeAccountNoSave:withDataclassActions:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Account Sync - Account was marked to NOT sync the delete, we will not delete credentials for: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_removeAccountNoSave:withDataclassActions:withError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

- (void)_saveWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_saveWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"ACDAccountStore failed to save its MOC. %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_saveWithError:(NSObject *)a3 .cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_26(&dword_20D8CB000, a3, (uint64_t)a3, "\"ACDAccountStore couldn't find just updated account\", a1);
}

- (void)_saveWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Caches updated. Next notifying clients.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_saveWithError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"saveWithError completed: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_saveWithError:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_performDataclassActions:forAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_performDataclassActions:forAccount:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Failed to perform dataclass actions, error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_performDataclassActions:forAccount:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

- (void)addAccountNoSave:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)addAccountNoSave:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_31(&dword_20D8CB000, v0, v1, "\"_addAccountNoSave failed with error: %@ for dataclass actions: %@\");
  OUTLINED_FUNCTION_2();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v0, (uint64_t)v0, "\"Unable to add account: %@ Error: %@\", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Account is warming up: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Account is being created: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_addAccountNoSave:withDataclassActions:error:.cold.8()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

- (void)updateAccountNoSave:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)updateAccountNoSave:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v4, v5, "\"Could not find existing account with identifier %@: %@\", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v0, (uint64_t)v0, "\"Unable to update account: %@ Error: %@\", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"ACAccount: _updateAccountNoSave called with no-op change\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"%@ is still warming up.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"%@ has completed warming up. Mark as added\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAccountNoSave:withDataclassActions:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"Could not find existing account with identifier %@: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Account %@ is being deleted\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_deleteAccountNoSave:withDataclassActions:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

- (void)_dataclassWithName:createIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Adding dataclass with name %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_canSaveAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Failed to fetch similar accounts, error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setAccountManagedObjectRelationships:withAccount:oldAccount:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_setAccountManagedObjectRelationships:(id *)a1 withAccount:(NSObject *)a2 oldAccount:error:.cold.2(id *a1, NSObject *a2)
{
  id WeakRetained;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v4, "\"Non-entitled client with no bundle ID (%@) trying to save an OAuth2 token\", v5);

  OUTLINED_FUNCTION_14();
}

- (void)_setAccountManagedObjectRelationships:withAccount:oldAccount:error:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_32();
  objc_msgSend(v0, "parentAccountIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"Cannot save %@, the caller is trying to set its parent account to %@, which doesn't exist in our database\", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_setAccountManagedObjectRelationships:withAccount:oldAccount:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

- (void)_handleAccountMod:withDataclassActions:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_handleAccountMod:withDataclassActions:withError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_31(&dword_20D8CB000, v0, v1, "\"_updateAccountNoSave failed with error: %@ for dataclass actions: %@\");
  OUTLINED_FUNCTION_2();
}

- (void)_handleAccountAdd:withDataclassActions:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Error inserting new account: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleAccountAdd:withDataclassActions:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Failed to save account, error: %{public}@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__ACDAccountStore_accountTypeWithIdentifier_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_29(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "@\"No account type found for identifier '%{public}@'\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__ACDAccountStore_credentialForAccount_serviceID_handler___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_32();
  objc_msgSend(*(id *)(v0 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v2, v3, "\"Fetching credential for account with ID: %@ for service %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __65__ACDAccountStore_setCredential_forAccount_serviceID_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  v4 = 2112;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  _os_log_debug_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEBUG, "\"Setting credential: %@ for account: %@ for service: %@\", v3, 0x20u);
  OUTLINED_FUNCTION_14();
}

- (void)credentialForAccountWithIdentifier:(uint64_t)a1 handler:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a2 + 160));
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v3, v4, "\"Credential for account %@ is being requested by %@.\", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_29(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"No managed object was found for account with identifier %@.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_29(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"No ACAccountType found for account with identifier %@.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"An unexpected error occurred: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Credential for account %@ was successfully retrieved from its auth plugin.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__ACDAccountStore_credentialForAccountWithIdentifier_handler___block_invoke_2_cold_3()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_32();
  v1 = OUTLINED_FUNCTION_35(*(_QWORD *)(v0 + 32));
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v2, v3, "\"credentialForAccount called: client=%@, account=%@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __49__ACDAccountStore_saveCredentialItem_completion___block_invoke_3_cold_1()
{
  id *v0;
  id *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_32();
  objc_msgSend(*v1, "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "serviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v4, v5, "\"Could not find existing credential item with identifier: %@ service name: %@\", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)accountsWithAccountType:options:completion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, (uint64_t)v0, "\"accountsWithAccountType %@ returned: %@\", v1);
  OUTLINED_FUNCTION_2();
}

- (void)accountsWithAccountType:options:completion:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v0, (uint64_t)v0, "\"accountsWithAccountType %@ returned an error: %@\", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_block_accountsWithAccountType:options:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Failed to get an NSManagedObjectID for account type %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_childAccountsForAccountWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26(&dword_20D8CB000, v0, v1, "\"accountID is nil!\", v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)insertAccountType:withHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, 5.8382e-34, v2, v3);
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v6, v4, "\"Could not insert account type '%{public}@': %@\", v5);

}

- (void)removeAccountType:withHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_33(v1, 5.8382e-34, v2, v3);
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v6, v4, "\"Could not remove account type '%{public}@': %@\", v5);

}

void __65__ACDAccountStore_removeAccount_withDataclassActions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_29(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Account Sync - Account was marked to NOT sync the delete, we will not create a tombstone for: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_151_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v4, "\"Could not save account: %@\", v5);

  OUTLINED_FUNCTION_14();
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_151_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_29(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Account save rejected by plugins, error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_154_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26(&dword_20D8CB000, v0, v1, "\"Could not verify account, unknown error!\", v2);
  OUTLINED_FUNCTION_1_1();
}

void __66__ACDAccountStore_saveAccount_verify_dataclassActions_completion___block_invoke_154_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v4, "\"Could not verify account: %@\", v5);

  OUTLINED_FUNCTION_14();
}

- (void)_completeSave:dataclassActions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_29(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d is returning: %@", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

- (void)_completeSave:dataclassActions:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

void __66__ACDAccountStore_verifyCredentialsForAccount_options_completion___block_invoke_cold_1()
{
  uint64_t *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_35(*v0);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"%@ is trying to verify account credentials for account: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __65__ACDAccountStore_renewCredentialsForAccount_options_completion___block_invoke_2_cold_1()
{
  uint64_t *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_35(*v0);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"%@ is trying to renew credentials for an account that's already been deleted: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)_requestAccessForAccountTypeWithIdentifier:options:allowUserInteraction:withHandler:.cold.1()
{
  uint64_t v0;
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  WeakRetained = objc_loadWeakRetained((id *)(v0 + 160));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v2, v3, "\"%@ is trying to request access for accounts of type: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __103__ACDAccountStore__requestAccessForAccountTypeWithIdentifier_options_allowUserInteraction_withHandler___block_invoke_cold_1(char a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v4, "\"Access request result: %@\", v5);

  OUTLINED_FUNCTION_14();
}

void __78__ACDAccountStore_setPermissionGranted_forBundleID_onAccountType_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Could not save permissions: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __72__ACDAccountStore_clearAllPermissionsGrantedForAccountType_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"All access was successfully revoked.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"All access for client was successfully revoked.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __69__ACDAccountStore_clearGrantedPermissionsForAccountType_withHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Could not clear permissions: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)kerberosAccountsForDomainFromURL:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"kerberosAccountsForDomainFromURL %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)resetDatabaseToVersion:withCompletion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v0, (uint64_t)v0, "\"Failed to reset database to version %@. Error: %@\", v1);
  OUTLINED_FUNCTION_2();
}

void __62__ACDAccountStore_clientTokenForAccountIdentifier_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_26(&dword_20D8CB000, v0, v1, "\"ERROR: Incoming account identifier is nil.\", v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)_clientTokenForAccountIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Error fetch client token: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_removeClientTokenForAccountIdentifer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"client token removal failed: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)handleURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Couldn't find an account matching the URL %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136381443;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_15(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@, %@)", v2);
  OUTLINED_FUNCTION_14();
}

- (void)saveAccount:toPairedDeviceWithOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called (%@)", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_14();
}

- (void)removeAccountsFromPairedDeviceWithOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)removeAccountFromPairedDevice:withOptions:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)migrateCredentialForAccount:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)triggerKeychainMigrationIfNecessary:.cold.1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  objc_msgSend(*v0, "keychainVersion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"Failed to migrate keychain items to version %@. Error: %@\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)triggerKeychainMigrationIfNecessary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)runAccountMigrationPlugins:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)_pruneDuplicateAccountsForAccountType:withUserName:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_20D8CB000, v0, (uint64_t)v0, "@\"Not even one account of type %@ with user name %@ found, not pruning\", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_pruneDuplicateAccountsForAccountType:(void *)a1 withUserName:(NSObject *)a2 error:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_20D8CB000, a2, v4, "@\"Pruned %@ accounts\", v5);

  OUTLINED_FUNCTION_14();
}

- (void)_pruneDuplicateAccountsForAccountType:withUserName:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

- (void)accountsWithTypeIdentifier:propertyKey:value:cacheSuffix:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20D8CB000, v0, v1, "%{private}s:%{public}d called", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_2();
}

void __87__ACDAccountStore_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"No results found for predicate %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
