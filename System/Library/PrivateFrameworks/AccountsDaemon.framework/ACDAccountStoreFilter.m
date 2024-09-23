@implementation ACDAccountStoreFilter

- (void)accountTypeWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountTypeWithIdentifier:handler:", v7, v6);

}

void __68__ACDAccountStoreFilter_accountsWithAccountType_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (_QWORD)v14))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)accountsWithAccountTypeIdentifiers:(id)a3 preloadedProperties:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v14)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v9, v10, v11);

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke;
    v19[3] = &unk_24C7E3598;
    v19[4] = self;
    objc_msgSend(v9, "ac_filter:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", v16, v10, v11);
    }
    else
    {
      _ACDEntitlementLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v18);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, v17);
    }

  }
}

- (BOOL)isClientEntitledToAccessAccountTypeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  char v29;

  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if ((v7 & 1) != 0)
    goto LABEL_2;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4458]))
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3FF0]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4038]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB40E0]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4060]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3FD8]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4028]) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4180]) & 1) != 0)
    {
      goto LABEL_25;
    }
    v11 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB4050]);

    if ((v11 & 1) != 0)
      goto LABEL_2;
  }
  else
  {

  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4490]))
  {
    v14 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4080]);

    if ((v14 & 1) != 0)
      goto LABEL_2;
  }
  else
  {

  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB44D8]))
  {
    if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4180]) & 1) != 0)
    {
LABEL_25:
      v8 = 1;
      goto LABEL_26;
    }
    v15 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4188]);

    if ((v15 & 1) != 0)
      goto LABEL_2;
  }
  else
  {

  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4468]))
  {
    if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4180]) & 1) != 0)
      goto LABEL_25;
    v29 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4188]);

    if ((v29 & 1) != 0)
      goto LABEL_2;
  }
  else
  {

  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "hasEntitlement:", *MEMORY[0x24BDB4460]))
  {

LABEL_33:
    if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4170]))
    {
      -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "client");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hasEntitlement:", *MEMORY[0x24BDB44D0]);

      if ((v22 & 1) != 0)
        goto LABEL_2;
    }
    if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4138]))
    {
      -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "client");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "hasEntitlement:", *MEMORY[0x24BDB44C8]);

      if ((v25 & 1) != 0)
        goto LABEL_2;
    }
    if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4110]))
    {
      -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "client");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "hasEntitlement:", *MEMORY[0x24BDB44A8]);

      if ((v28 & 1) != 0)
        goto LABEL_2;
    }
    if (!objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDB4100]))
    {
      v8 = 0;
      goto LABEL_27;
    }
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB44A0]);
LABEL_26:

    goto LABEL_27;
  }
  v19 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3FE8]);

  if ((v19 & 1) == 0)
    goto LABEL_33;
LABEL_2:
  v8 = 1;
LABEL_27:

  return v8;
}

- (ACDAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (ACDAccountStoreFilter)initWithBackingAccountStore:(id)a3
{
  id v5;
  ACDAccountStoreFilter *v6;
  ACDAccountStoreFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACDAccountStoreFilter;
  v6 = -[ACDAccountStoreFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingAccountStore, a3);

  return v7;
}

- (void)accessKeysForAccountType:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessKeysForAccountType:handler:", v7, v6);

}

- (BOOL)_isClientPermittedToAccessAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "accountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v5);

  return (char)self;
}

- (void)accountsWithAccountType:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v11);

  if (v12)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __68__ACDAccountStoreFilter_accountsWithAccountType_options_completion___block_invoke;
    v17[3] = &unk_24C7E23B8;
    v17[4] = self;
    v18 = v10;
    objc_msgSend(v13, "accountsWithAccountType:options:completion:", v9, a4, v17);

  }
  else
  {
    _ACDLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter accountsWithAccountType:handler:].cold.2();

    _ACDEntitlementLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v15);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 9, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);

  }
}

- (BOOL)_isClientPermittedToAccessAccountTypeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  if (-[ACDAccountStoreFilter isClientEntitledToAccessAccountTypeWithIdentifier:](self, "isClientEntitledToAccessAccountTypeWithIdentifier:", v4)|| (-[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "client"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = -[ACDAccountStoreFilter _accessGrantedForClient:onAccountTypeID:](self, "_accessGrantedForClient:onAccountTypeID:", v6, v4), v6, v5, v7))
  {
    v8 = 1;
  }
  else if (objc_msgSend(v4, "hasPrefix:", *MEMORY[0x24BDB40B0]))
  {
    v8 = -[ACDAccountStoreFilter _wildCardAuthorizationMatchingForAccountTypeIdentifier:](self, "_wildCardAuthorizationMatchingForAccountTypeIdentifier:", v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)requestAccessForAccountTypeWithIdentifier:(id)a3 options:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_requestAccessForAccountTypeWithIdentifier:options:allowUserInteraction:withHandler:", v10, v9, 1, v8);

}

- (BOOL)_accessGrantedForClient:(id)a3 onAccountTypeID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authorizationForClient:accountTypeWithIdentifier:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v10, "isGranted");
  return (char)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAccountStore, 0);
}

- (void)accountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__ACDAccountStoreFilter_accountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24C7E3548;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "accountWithIdentifier:handler:", v7, v10);

}

void __55__ACDAccountStoreFilter_accountWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  if (objc_msgSend(v5, "_isClientPermittedToAccessAccount:", v8))
    v7 = v8;
  else
    v7 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)credentialForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "credentialForAccountWithIdentifier:handler:", v7, v6);

}

- (void)registerMonitorForAccountsOfTypes:(id)a3 propertiesToPrefetch:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (!v11)
    goto LABEL_13;
  v12 = v11;
  v19 = v9;
  v13 = *(_QWORD *)v21;
  v14 = 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v8);
      v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
      if (!-[ACDAccountStoreFilter isClientEntitledToAccessAccountTypeWithIdentifier:](self, "isClientEntitledToAccessAccountTypeWithIdentifier:", v16))
      {
        _ACLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v16;
          _os_log_error_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_ERROR, "\"Client is not entitled account type %@\", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  }
  while (v12);
  v9 = v19;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v18);
  }
  else
  {
LABEL_13:
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerMonitorForAccountsOfTypes:propertiesToPrefetch:completion:", v8, v9, v10);
  }

}

- (void)accountsWithAccountType:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  char v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v9);

  if (v10)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasEntitlement:", *MEMORY[0x24BDB4498]);

    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __57__ACDAccountStoreFilter_accountsWithAccountType_handler___block_invoke;
    v18[3] = &unk_24C7E3570;
    v18[4] = self;
    v20 = v13;
    v19 = v8;
    objc_msgSend(v14, "accountsWithAccountType:handler:", v7, v18);

  }
  else
  {
    _ACDLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter accountsWithAccountType:handler:].cold.2();

    _ACDEntitlementLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v16);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 9, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v17);

  }
}

uint64_t __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccountTypeWithIdentifier:", v3);
  if ((v4 & 1) == 0)
  {
    _ACDLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_cold_1();

  }
  return v4;
}

void __91__ACDAccountStoreFilter_accountsWithAccountTypeIdentifiers_preloadedProperties_completion___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_30();
  objc_msgSend(*v0, "backingAccountStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v3, v4, "\"Client (%@) attempted to access restricted account type: %@\", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

void __57__ACDAccountStoreFilter_accountsWithAccountType_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (_QWORD)v14)
          && (*(_BYTE *)(a1 + 48) || objc_msgSend(v13, "isActive")))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)enabledDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enabledDataclassesForAccountWithIdentifier:handler:", v7, v6);

}

- (void)setClientBundleID:(id)a3 withHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4480]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClientBundleID:withHandler:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)tetheredSyncSourceTypeForDataclass:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tetheredSyncSourceTypeForDataclass:completion:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)accountIdentifiersEnabledForDataclass:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountIdentifiersEnabledForDataclass:handler:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)accountIdentifiersEnabledToSyncDataclass:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accountIdentifiersEnabledToSyncDataclass:handler:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

+ (ACDAccountStoreFilter)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDAccountStoreFilter)init
{
  -[ACDAccountStoreFilter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (BOOL)_accessGrantedForBundleID:(id)a3 onAccountTypeID:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  +[ACDClient clientWithBundleID:](ACDClient, "clientWithBundleID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ACDAccountStoreFilter _accessGrantedForClient:onAccountTypeID:](self, "_accessGrantedForClient:onAccountTypeID:", v7, v6);

  return (char)self;
}

- (BOOL)_wildCardAuthorizationMatchingForAccountTypeIdentifier:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[ACDAccountStoreFilter _appPermissionsForAccountTypeIdentifier:](self, "_appPermissionsForAccountTypeIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v17 = v4;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self like %@"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "client");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v10, "evaluateWithObject:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
    v15 = 0;
LABEL_11:
    v4 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_appPermissionsForAccountTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allAuthorizationsForAccountTypeWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v14, "isGranted", (_QWORD)v19));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "client");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v8, "setValue:forKey:", v15, v17);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_isClientPermittedToRemoveAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountTypeWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "owningBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v11, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if ((v7 & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDB4170]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "hasEntitlement:", *MEMORY[0x24BDB44D0]);

    if ((v16 & 1) != 0)
      goto LABEL_2;
  }
  else
  {

  }
  objc_msgSend(v8, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDB4060]) & 1) == 0)
  {

LABEL_11:
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bundleID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v23, "isEqualToString:", v9);

    goto LABEL_12;
  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasEntitlement:", *MEMORY[0x24BDB4458]);

  if ((v20 & 1) == 0)
    goto LABEL_11;
LABEL_2:
  v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)_clientHasPermissionToAddAccount:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  char v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v5 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if ((v8 & 1) != 0)
    goto LABEL_47;
  objc_msgSend(v5, "accountType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB3FF0]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasEntitlement:", *MEMORY[0x24BDB4458]);

    if ((v13 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDB4038]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "client");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasEntitlement:", *MEMORY[0x24BDB4458]);

    if ((v18 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BDB40E0]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "hasEntitlement:", *MEMORY[0x24BDB4458]);

    if ((v23 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BDB4060]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "client");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "hasEntitlement:", *MEMORY[0x24BDB4458]);

    if ((v28 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BDB3FD8]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "client");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hasEntitlement:", *MEMORY[0x24BDB4458]);

    if ((v33 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)*MEMORY[0x24BDB4180];
  if ((objc_msgSend(v35, "isEqualToString:", *MEMORY[0x24BDB4180]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "client");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v38, "hasEntitlement:", *MEMORY[0x24BDB4458]);

    if ((v3 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isEqualToString:", v36);
  if ((v41 & 1) == 0)
  {
    objc_msgSend(v5, "accountType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v3, "isEqualToString:", *MEMORY[0x24BDB4188]))
    {

      goto LABEL_34;
    }
    v68 = v42;
  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "client");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "hasEntitlement:", *MEMORY[0x24BDB44D8]);

  if ((v41 & 1) == 0)
  {

  }
  if ((v45 & 1) != 0)
    goto LABEL_47;
LABEL_34:
  objc_msgSend(v5, "accountType");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "identifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", v36);
  if ((v48 & 1) != 0
    || (objc_msgSend(v5, "accountType"),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v36, "identifier"),
        v41 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v41, "isEqualToString:", *MEMORY[0x24BDB4188])))
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "client");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "hasEntitlement:", *MEMORY[0x24BDB4468]);

    if ((v48 & 1) == 0)
    {

    }
    if ((v51 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "identifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x24BDB4170]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "client");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "hasEntitlement:", *MEMORY[0x24BDB44D0]);

    if ((v56 & 1) != 0)
      goto LABEL_47;
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "identifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v58, "isEqual:", *MEMORY[0x24BDB4080]) & 1) != 0)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "client");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "hasEntitlement:", *MEMORY[0x24BDB4490]);

    if ((v61 & 1) != 0)
    {
LABEL_47:
      v62 = 1;
      goto LABEL_48;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "accountType");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "identifier");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v65, "isEqual:", *MEMORY[0x24BDB4110]))
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "client");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v67, "hasEntitlement:", *MEMORY[0x24BDB44A8]);

  }
  else
  {
    v62 = 0;
  }

LABEL_48:
  return v62;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationsEnabled:", v3);

}

- (void)accountsWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__ACDAccountStoreFilter_accountsWithHandler___block_invoke;
  v7[3] = &unk_24C7E23B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "accountsWithHandler:", v7);

}

void __45__ACDAccountStoreFilter_accountsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (_QWORD)v14))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)accountTypesWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountTypesWithHandler:", v4);

}

- (void)accountsOnPairedDeviceWithAccountTypes:(id)a3 withOptions:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (!v11)
    goto LABEL_13;
  v12 = v11;
  v27 = v10;
  v28 = v9;
  v13 = *(_QWORD *)v33;
  v14 = 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(v8);
      v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
      if (!-[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v16))
      {
        _ACDLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "client");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v37 = v19;
          v38 = 2112;
          v39 = v16;
          _os_log_error_impl(&dword_20D8CB000, v17, OS_LOG_TYPE_ERROR, "\"Client %@ is not allowed to access accounts of type %@.\", buf, 0x16u);

        }
        v14 = 0;
      }
    }
    v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  }
  while (v12);
  v10 = v27;
  v9 = v28;
  if ((v14 & 1) == 0)
  {
    _ACDEntitlementLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v24);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 9, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v27 + 2))(v27, 0, v25);

  }
  else
  {
LABEL_13:
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "hasEntitlement:", *MEMORY[0x24BDB4498]);

    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __84__ACDAccountStoreFilter_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke;
    v29[3] = &unk_24C7E3570;
    v29[4] = self;
    v31 = v22;
    v30 = v10;
    objc_msgSend(v23, "accountsOnPairedDeviceWithAccountTypes:withOptions:handler:", v8, v9, v29);

  }
}

void __84__ACDAccountStoreFilter_accountsOnPairedDeviceWithAccountTypes_withOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (_QWORD)v14)
          && (*(_BYTE *)(a1 + 48) || objc_msgSend(v13, "isActive")))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)parentAccountForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__ACDAccountStoreFilter_parentAccountForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24C7E3548;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "parentAccountForAccountWithIdentifier:handler:", v7, v10);

}

void __71__ACDAccountStoreFilter_parentAccountForAccountWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  if (objc_msgSend(v5, "_isClientPermittedToAccessAccount:", v8))
    v7 = v8;
  else
    v7 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)childAccountsForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__ACDAccountStoreFilter_childAccountsForAccountWithIdentifier_handler___block_invoke;
  v10[3] = &unk_24C7E23B8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "childAccountsForAccountWithIdentifier:handler:", v7, v10);

}

void __71__ACDAccountStoreFilter_childAccountsForAccountWithIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (_QWORD)v14))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)accountExistsWithDescription:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountExistsWithDescription:completion:", v7, v6);

}

- (void)kerberosAccountsForDomainFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__ACDAccountStoreFilter_kerberosAccountsForDomainFromURL_completion___block_invoke;
  v10[3] = &unk_24C7E23B8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "kerberosAccountsForDomainFromURL:completion:", v7, v10);

}

void __69__ACDAccountStoreFilter_kerberosAccountsForDomainFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_isClientPermittedToAccessAccount:", v13, (_QWORD)v14))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)childAccountsWithAccountTypeIdentifier:(id)a3 parentAccountIdentifier:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  NSObject *v13;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (-[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v9))
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "childAccountsWithAccountTypeIdentifier:parentAccountIdentifier:handler:", v9, v10, v11);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v12);
  }

}

- (void)displayAccountTypeForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayAccountTypeForAccountWithIdentifier:handler:", v7, v6);

}

- (void)credentialForAccount:(id)a3 serviceID:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  NSObject *v13;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (-[ACDAccountStoreFilter _isClientPermittedToAccessAccount:](self, "_isClientPermittedToAccessAccount:", v9))
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "credentialForAccount:serviceID:handler:", v9, v10, v11);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v12);
  }

}

- (void)setCredential:(id)a3 forAccount:(id)a4 serviceID:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  NSObject *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  if (-[ACDAccountStoreFilter _isClientPermittedToAccessAccount:](self, "_isClientPermittedToAccessAccount:", v12))
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCredential:forAccount:serviceID:completion:", v11, v12, v13, v14);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v16);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v15);
  }

}

- (void)credentialItemsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "credentialItemsWithCompletion:", v4);

}

- (void)credentialItemForAccount:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "credentialItemForAccount:serviceName:completion:", v10, v9, v8);

}

- (void)insertCredentialItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertCredentialItem:completion:", v7, v6);

}

- (void)saveCredentialItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveCredentialItem:completion:", v7, v6);

}

- (void)removeCredentialItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeCredentialItem:completion:", v7, v6);

}

- (void)provisionedDataclassesForAccountWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provisionedDataclassesForAccountWithIdentifier:handler:", v7, v6);

}

- (void)dataclassesWithHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataclassesWithHandler:", v4);

}

- (void)supportedDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supportedDataclassesForAccountType:handler:", v7, v6);

}

- (void)syncableDataclassesForAccountType:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncableDataclassesForAccountType:handler:", v7, v6);

}

- (void)preloadDataclassOwnersWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preloadDataclassOwnersWithCompletion:", v4);

}

- (void)dataclassActionsForAccountSave:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataclassActionsForAccountSave:completion:", v7, v6);

}

- (void)dataclassActionsForAccountDeletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataclassActionsForAccountDeletion:completion:", v7, v6);

}

- (void)isPerformingDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isPerformingDataclassActionsForAccount:completion:", v7, v6);

}

- (void)removeAccount:(id)a3 withDataclassActions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setAccountStore:", v12);

  if (-[ACDAccountStoreFilter _isClientPermittedToRemoveAccount:](self, "_isClientPermittedToRemoveAccount:", v9))
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAccount:withDataclassActions:completion:", v9, v10, v11);

  }
  else
  {
    _ACDEntitlementLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v14);

    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "accountType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountTypeDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("The application is not permitted to delete %@ accounts"), v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BDB4200];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v13, *MEMORY[0x24BDD0FC8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v21);

  }
}

- (void)canSaveAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canSaveAccount:completion:", v7, v6);

}

- (void)saveAccount:(id)a3 withHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setAccountStore:", v9);

  objc_msgSend(v7, "accountType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v11);

  if (v12)
  {
    if (-[ACDAccountStoreFilter _clientHasPermissionToAddAccount:](self, "_clientHasPermissionToAddAccount:", v7))
    {
      -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "saveAccount:withHandler:", v7, v8);

      goto LABEL_13;
    }
    _ACDEntitlementLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v22);

    v23 = (void *)MEMORY[0x24BDD17C8];
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "client");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("PID %@ does not have permission to add an account"), v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDB4200];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ACDEntitlementLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v14);

    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "accountType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountTypeDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("The application is not permitted to access %@ accounts"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDB4200];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v18, *MEMORY[0x24BDD0FC8]);
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v21;
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  _ACDLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[ACDAccountStoreFilter saveAccount:withHandler:].cold.1((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35);

  v8[2](v8, 0, v28);
LABEL_13:

}

- (void)saveAccount:(id)a3 verify:(BOOL)a4 dataclassActions:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  v8 = a4;
  v41[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setAccountStore:", v14);

  objc_msgSend(v11, "accountType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v16);

  if (v17)
  {
    if (-[ACDAccountStoreFilter _clientHasPermissionToAddAccount:](self, "_clientHasPermissionToAddAccount:", v11))
    {
      -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "saveAccount:verify:dataclassActions:completion:", v11, v8, v12, v13);

      goto LABEL_13;
    }
    _ACDEntitlementLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v27);

    v28 = (void *)MEMORY[0x24BDD17C8];
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "client");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ does not have permission to add an account"), v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDB4200];
    v40 = *MEMORY[0x24BDD0FC8];
    v41[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _ACDEntitlementLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v19);

    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "accountType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accountTypeDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("The application is not permitted to access %@ accounts"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDB4200];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v23, *MEMORY[0x24BDD0FC8]);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v26;
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 7, v26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  _ACDLogSystem();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[ACDAccountStoreFilter saveAccount:withHandler:].cold.1((uint64_t)v32, v33, v34, v35, v36, v37, v38, v39);

  v13[2](v13, 0, v32);
LABEL_13:

}

- (void)insertAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertAccountType:withHandler:", v7, v6);

}

- (void)removeAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAccountType:withHandler:", v7, v6);

}

- (void)appPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appPermissionsForAccountType:withHandler:", v7, v6);

}

- (void)setPermissionGranted:(id)a3 forBundleID:(id)a4 onAccountType:(id)a5 withHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v17)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPermissionGranted:forBundleID:onAccountType:withHandler:", v11, v12, v13, v14);

  }
  else
  {
    _ACDEntitlementLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v19);

    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDB4200];
    v24 = *MEMORY[0x24BDD0FC8];
    v25[0] = CFSTR("You are not allowed to modify the authorization model.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v23);

  }
}

- (void)permissionForAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "permissionForAccountType:withHandler:", v7, v6);

}

- (void)grantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "grantedPermissionsForAccountType:withHandler:", v7, v6);

}

- (void)clearGrantedPermissionsForAccountType:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearGrantedPermissionsForAccountType:withHandler:", v7, v6);

}

- (void)clearAllPermissionsGrantedForAccountType:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearAllPermissionsGrantedForAccountType:withHandler:", v7, v8);

  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDB4200];
    v18 = *MEMORY[0x24BDD0FC8];
    v19[0] = CFSTR("You are not allowed to modify the authorization model.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v17);

  }
}

- (void)verifyCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "verifyCredentialsForAccount:options:completion:", v10, v9, v8);

}

- (void)renewCredentialsForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  int v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, void *))a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setAccountStore:", v12);

  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "hasEntitlement:", *MEMORY[0x24BDB4450]))
  {

    goto LABEL_3;
  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasEntitlement:", *MEMORY[0x24BDB4458]);

  if ((v17 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v9, "accountType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "client");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ACDAccountStoreFilter _accessGrantedForClient:onAccountTypeID:](self, "_accessGrantedForClient:onAccountTypeID:", v21, v13);

  if (v22)
  {
LABEL_3:

LABEL_5:
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "renewCredentialsForAccount:options:completion:", v9, v10, v11);
    goto LABEL_6;
  }
  objc_msgSend(v9, "accountType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "hasPrefix:", *MEMORY[0x24BDB40B0]);

  if (v25)
  {
    v26 = -[ACDAccountStoreFilter _wildCardAuthorizationMatchingForAccountTypeIdentifier:](self, "_wildCardAuthorizationMatchingForAccountTypeIdentifier:", v13);

    if (v26)
      goto LABEL_5;
  }
  else
  {

  }
  _ACDLogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[ACDAccountStoreFilter renewCredentialsForAccount:options:completion:].cold.2();

  _ACDEntitlementLogSystem();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v28);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, &unk_24C7EF248, v18);
LABEL_6:

}

- (void)migrateCredentialForAccount:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setAccountStore:", v9);

  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasEntitlement:", *MEMORY[0x24BDB4450]))
  {

LABEL_4:
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "migrateCredentialForAccount:completion:", v7, v8);
    goto LABEL_10;
  }
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4458]);

  if (v14)
    goto LABEL_4;
  _ACDLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ACDAccountStoreFilter migrateCredentialForAccount:completion:].cold.2();

  _ACDEntitlementLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v17);

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, 0, v15);
LABEL_10:

}

- (void)isTetheredSyncingEnabledForDataclass:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "isTetheredSyncingEnabledForDataclass:completion:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)isPushSupportedForAccount:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "isPushSupportedForAccount:completion:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)accountIdentifiersEnabledForDataclasses:(id)a3 withAccountTypeIdentifiers:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v14)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountIdentifiersEnabledForDataclasses:withAccountTypeIdentifiers:completion:", v9, v10, v11);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v16);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v15);
  }

}

- (void)handleURL:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v6)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleURL:", v8);

  }
}

- (void)addClientToken:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v14)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addClientToken:forAccountIdentifier:completion:", v9, v10, v11);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v16);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v15);
  }

}

- (void)discoverPropertiesForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v14)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "discoverPropertiesForAccount:options:completion:", v9, v10, v11);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v16);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v15);
  }

}

- (void)clientTokenForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientTokenForAccountIdentifier:completion:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)openAuthenticationURL:(id)a3 forAccount:(id)a4 shouldConfirm:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v16)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "openAuthenticationURL:forAccount:shouldConfirm:completion:", v11, v12, v7, v13);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v18);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, v17);
  }

}

- (void)openAuthenticationURLForAccount:(id)a3 withDelegateClassName:(id)a4 fromBundleAtPath:(id)a5 shouldConfirm:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "client");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v19)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "openAuthenticationURLForAccount:withDelegateClassName:fromBundleAtPath:shouldConfirm:completion:", v13, v14, v15, v8, v16);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v21);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v16 + 2))(v16, 0, 0, v20);
  }

}

- (void)visibleTopLevelAccountsWithAccountTypeIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:", v7, v8);
  }
  else
  {
    _ACDEntitlementLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;

  v7 = a3;
  v8 = a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyRemoteDevicesOfModifiedAccount:withChangeType:", v7, v8);

  }
  else
  {
    _ACLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter notifyRemoteDevicesOfModifiedAccount:withChangeType:].cold.2();

    _ACDEntitlementLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v14);

  }
}

- (void)notifyRemoteDevicesOfModifiedAccount:(id)a3 withChangeType:(id)a4 options:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v17)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "notifyRemoteDevicesOfModifiedAccount:withChangeType:options:completion:", v11, v12, v13, v14);
  }
  else
  {
    _ACLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter notifyRemoteDevicesOfModifiedAccount:withChangeType:].cold.2();

    _ACDEntitlementLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v20);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v18);
  }

}

- (void)saveAccount:(id)a3 toPairedDeviceWithOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v14)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveAccount:toPairedDeviceWithOptions:completion:", v9, v10, v11);
  }
  else
  {
    _ACLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter saveAccount:toPairedDeviceWithOptions:completion:].cold.2();

    _ACDEntitlementLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v17);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v15);
  }

}

- (void)removeAccountsFromPairedDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAccountsFromPairedDeviceWithOptions:completion:", v7, v8);
  }
  else
  {
    _ACLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter removeAccountsFromPairedDeviceWithOptions:completion:].cold.2();

    _ACDEntitlementLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v14);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)removeAccountFromPairedDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v14)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAccountFromPairedDevice:withOptions:completion:", v9, v10, v11);
  }
  else
  {
    _ACLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter removeAccountFromPairedDevice:withOptions:completion:].cold.2((uint64_t)v9, v16, v17, v18, v19, v20, v21, v22);

    _ACDEntitlementLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v23);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v15);
  }

}

- (void)triggerKeychainMigrationIfNecessary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;

  v5 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v8)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triggerKeychainMigrationIfNecessary:", v5);

  }
  else
  {
    _ACLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter triggerKeychainMigrationIfNecessary:].cold.2();

    _ACDEntitlementLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v11);

  }
}

- (void)runAccountMigrationPlugins:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;

  v5 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v8)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "runAccountMigrationPlugins:", v5);

  }
  else
  {
    _ACLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter runAccountMigrationPlugins:].cold.2();

    _ACDEntitlementLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v11);

  }
}

- (void)scheduleBackupIfNonexistent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;

  v5 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v8)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scheduleBackupIfNonexistent:", v5);

  }
  else
  {
    _ACLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter scheduleBackupIfNonexistent:].cold.2();

    _ACDEntitlementLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v11);

  }
}

- (void)resetDatabaseToVersion:(id)a3 withCompletion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x24BDB4450]);

  if (v11)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resetDatabaseToVersion:withCompletion:", v7, v8);
  }
  else
  {
    _ACLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter resetDatabaseToVersion:withCompletion:].cold.2();

    _ACDEntitlementLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v14);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v12);
  }

}

- (void)shutdownAccountsD:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;

  v5 = a3;
  -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDB44C0]);

  if (v8)
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shutdownAccountsD:", v5);

  }
  else
  {
    _ACLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter shutdownAccountsD:].cold.2();

    _ACDEntitlementLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v10);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v11);

  }
}

- (void)accountsWithTypeIdentifier:(id)a3 propertyKey:(id)a4 value:(id)a5 cacheSuffix:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  char v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (-[ACDAccountStoreFilter _isClientPermittedToAccessAccountTypeWithIdentifier:](self, "_isClientPermittedToAccessAccountTypeWithIdentifier:", v13))
  {
    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "client");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hasEntitlement:", *MEMORY[0x24BDB4498]);

    -[ACDAccountStoreFilter backingAccountStore](self, "backingAccountStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __93__ACDAccountStoreFilter_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke;
    v24[3] = &unk_24C7E35C0;
    v26 = v20;
    v25 = v17;
    objc_msgSend(v21, "accountsWithTypeIdentifier:propertyKey:value:cacheSuffix:completion:", v13, v14, v15, v16, v24);

    v22 = v25;
  }
  else
  {
    _ACDEntitlementLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ACDAccountStoreFilter setClientBundleID:withHandler:].cold.1(self, a2, v23);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 9, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v17 + 2))(v17, 0, v22);
  }

}

void __93__ACDAccountStoreFilter_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 40)
          || objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isActive", (_QWORD)v14))
        {
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v14);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)uidOfAccountsd:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = geteuid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);

}

- (void)accountsWithAccountType:handler:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v1, "backingAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v5, v6, "\"Client %@ is not allowed to access accounts of type %@.\", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3();
}

- (void)saveAccount:(uint64_t)a3 withHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_20D8CB000, a2, a3, "\"Could not save account: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)renewCredentialsForAccount:options:completion:.cold.2()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v0, "backingAccountStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v3, v4, "\"Cannot renew credentials because %@ is not entitled or permitted to access to account %@.\", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)migrateCredentialForAccount:completion:.cold.2()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v0, "backingAccountStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v3, v4, "\"Cannot migrate credentials because %@ is not entitled or permitted to access to account %@.\", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)notifyRemoteDevicesOfModifiedAccount:withChangeType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client not entitled to send account via IDS proxy\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)saveAccount:toPairedDeviceWithOptions:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client not entitled to send accounts to paired devices.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)removeAccountsFromPairedDeviceWithOptions:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client not entitled to remove accounts from paired devices.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)removeAccountFromPairedDevice:(uint64_t)a3 withOptions:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_20D8CB000, a2, a3, "\"Client not entitled to remove account %@ from paired devices.\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)triggerKeychainMigrationIfNecessary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client is not entitled to migrate keychain items.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)runAccountMigrationPlugins:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client is not entitled to initiate a migration plugin.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)scheduleBackupIfNonexistent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client is not entitled to schedule backups.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)resetDatabaseToVersion:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client is not entitled to reset database version.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)shutdownAccountsD:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Client is not entitled to shutdown accountsd\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
