@implementation DMCManagedAccountsSpecifierProvider

- (DMCManagedAccountsSpecifierProvider)initWithAccountManager:(id)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *MEMORY[0x24BDB41E0];
  v5.receiver = self;
  v5.super_class = (Class)DMCManagedAccountsSpecifierProvider;
  return -[DMCSpecifierProvider initWithAccountManager:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:](&v5, sel_initWithAccountManager_reloadNotification_isLocalNotification_reloadIfMissingRMAccount_, a3, v3, 1, 0);
}

- (id)specifiers
{
  DMCManagedAccountsSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  DMCManagedAccountsSpecifierProvider *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v2 = self;
  v34 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)DMCManagedAccountsSpecifierProvider;
  -[DMCSpecifierProvider specifiers](&v32, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v31.receiver = v2;
    v31.super_class = (Class)DMCManagedAccountsSpecifierProvider;
    -[DMCSpecifierProvider specifiers](&v31, sel_specifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[DMCSpecifierProvider rmAccount](v2, "rmAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[DMCSpecifierProvider cachedSpecifiers:](v2, "cachedSpecifiers:", MEMORY[0x24BDBD1A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[DMCManagedAccountsSpecifierProvider managedAccounts](v2, "managedAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[DMCManagedAccountsSpecifierProvider managedAccounts](v2, "managedAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count") + 1);

    -[DMCManagedAccountsSpecifierProvider managedAccounts](v2, "managedAccounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = v10;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v2;
      -[DMCManagedAccountsSpecifierProvider managedAccounts](v2, "managedAccounts");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        v18 = *MEMORY[0x24BE75AC8];
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(obj);
            v20 = (void *)MEMORY[0x24BE00EE0];
            v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copy");
            objc_msgSend(v20, "specifierWithStyle:account:target:controllerLoadAction:", 3, v21, v14, sel__accountCellWasTappedWithSpecifier_);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              +[DMCIconFactory accountIcon](DMCIconFactory, "accountIcon");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setProperty:forKey:", v23, v18);

              objc_msgSend(v13, "addObject:", v22);
            }

          }
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        }
        while (v16);
      }

      v10 = v13;
      v2 = v14;
    }
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertObject:atIndex:", v24, 0);

    }
    -[DMCSpecifierProvider cachedSpecifiers:](v2, "cachedSpecifiers:", v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    return v25;
  }
  else
  {
    if (!-[DMCManagedAccountsSpecifierProvider isReloadingManagedAccounts](v2, "isReloadingManagedAccounts"))
    {
      -[DMCManagedAccountsSpecifierProvider setIsReloadingManagedAccounts:](v2, "setIsReloadingManagedAccounts:", 1);
      -[DMCManagedAccountsSpecifierProvider _reloadManagedAccounts](v2, "_reloadManagedAccounts");
    }
    return MEMORY[0x24BDBD1A8];
  }
}

- (void)_reloadManagedAccounts
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ACUIVisibleAccountTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke;
  v4[3] = &unk_24D52EC30;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v2, "visibleTopLevelAccountsWithAccountTypeIdentifiers:completion:", v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id val;
  _QWORD block[4];
  id v26;
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    val = WeakRetained;
    v21 = v3;
    v22 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      v10 = *MEMORY[0x24BDB3F70];
      v23 = *MEMORY[0x24BDB3FD8];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(val, "rmAccount");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v13, "isEqualToString:", v15);

            if (v16)
            {
              objc_msgSend(v12, "accountType");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v23);

              if ((v19 & 1) == 0)
                objc_msgSend(v22, "addObject:", v12);
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v8);
    }

    v5 = val;
    objc_initWeak(&location, val);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke_2;
    block[3] = &unk_24D52E900;
    objc_copyWeak(&v27, &location);
    v26 = v22;
    v20 = v22;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    v3 = v21;
  }

}

void __61__DMCManagedAccountsSpecifierProvider__reloadManagedAccounts__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(WeakRetained, "setManagedAccounts:", v2);

    objc_msgSend(WeakRetained, "setIsReloadingManagedAccounts:", 0);
    objc_msgSend(WeakRetained, "reloadSpecifiers");
  }

}

- (void)_accountCellWasTappedWithSpecifier:(id)a3
{
  void *v4;
  id v5;

  +[DMCEnrollmentInterface accountControllerFromSpecifier:baseViewController:preferiCloudAccount:](DMCEnrollmentInterface, "accountControllerFromSpecifier:baseViewController:preferiCloudAccount:", a3, 0, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DMCSpecifierProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifierProvider:showViewController:", self, v5);

}

- (NSArray)managedAccounts
{
  return self->_managedAccounts;
}

- (void)setManagedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_managedAccounts, a3);
}

- (BOOL)isReloadingManagedAccounts
{
  return self->_isReloadingManagedAccounts;
}

- (void)setIsReloadingManagedAccounts:(BOOL)a3
{
  self->_isReloadingManagedAccounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedAccounts, 0);
}

@end
