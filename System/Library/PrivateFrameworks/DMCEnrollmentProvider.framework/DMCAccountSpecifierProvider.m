@implementation DMCAccountSpecifierProvider

- (void)specifiersWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *updateQueue;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  if (!self->_updateQueue)
  {
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.devicemanagementclient.secondaryAccountUpdate", 0);
    updateQueue = self->_updateQueue;
    self->_updateQueue = v5;

  }
  objc_initWeak(&location, self);
  v7 = self->_updateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__DMCAccountSpecifierProvider_specifiersWithCompletion___block_invoke;
  block[3] = &unk_24D52E2A8;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __56__DMCAccountSpecifierProvider_specifiersWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "specifiersWithTitle:includePrimaryAccounts:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, MEMORY[0x24BDBD1A8]);
  }

}

- (id)specifiersWithTitle:(BOOL)a3 includePrimaryAccounts:(BOOL)a4
{
  _BOOL8 v4;
  ACAccountStore *accountStore;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  accountStore = self->_accountStore;
  if (a4)
    -[ACAccountStore dmc_visibleRemoteManagementAccounts](accountStore, "dmc_visibleRemoteManagementAccounts");
  else
    -[ACAccountStore dmc_visibleSecondaryRemoteManagementAccounts](accountStore, "dmc_visibleSecondaryRemoteManagementAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCAccountSpecifierProvider _specifierForManagedAccountGroupWithTitle:plural:](self, "_specifierForManagedAccountGroupWithTitle:plural:", v4, (unint64_t)objc_msgSend(v7, "count") > 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[DMCAccountSpecifierProvider _specifierForManagedAccount:](self, "_specifierForManagedAccount:", v15, (_QWORD)v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          -[DMCAccountSpecifierProvider _reauthSpecifierForAccount:](self, "_reauthSpecifierForAccount:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v8, "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DMCAccountSpecifierProvider)initWithAccountStore:(id)a3
{
  id v5;
  DMCAccountSpecifierProvider *v6;
  DMCAccountSpecifierProvider *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMCAccountSpecifierProvider;
  v6 = -[DMCAccountSpecifierProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_appleAccountsDidChange_, *MEMORY[0x24BDB41E0], 0);

  }
  return v7;
}

+ (id)itemSpecifierIDPrefix
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:"), *MEMORY[0x24BE613F8]);
}

+ (id)groupSpecifierID
{
  return (id)*MEMORY[0x24BE61400];
}

- (DMCAccountSpecifierProvider)init
{
  void *v3;
  DMCAccountSpecifierProvider *v4;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DMCAccountSpecifierProvider initWithAccountStore:](self, "initWithAccountStore:", v3);

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DMCAccountSpecifierProvider;
  -[DMCAccountSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)appleAccountsDidChange:(id)a3
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadAccountSpecifiersForProvider:", self);

  v5 = objc_loadWeakRetained((id *)&self->_viewModelDelegate);
  objc_msgSend(v5, "secondaryAccountViewModelsDidChange");

}

+ (id)itemSpecifierIDForAccountUsername:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[DMCAccountSpecifierProvider itemSpecifierIDPrefix](DMCAccountSpecifierProvider, "itemSpecifierIDPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)itemSpecifierIDForReauthAccountUsername:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[DMCAccountSpecifierProvider itemSpecifierIDForAccountUsername:](DMCAccountSpecifierProvider, "itemSpecifierIDForAccountUsername:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v4, *MEMORY[0x24BE61418]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_specifierForManagedAccountGroupWithTitle:(BOOL)a3 plural:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    DMCLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier", a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[DMCAccountSpecifierProvider groupSpecifierID](DMCAccountSpecifierProvider, "groupSpecifierID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  return v5;
}

- (id)_specifierForManagedAccount:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = +[DMCEnrollmentInterface preferredViewControllerClassForAccount:preferiCloudAccount:](DMCEnrollmentInterface, "preferredViewControllerClassForAccount:preferiCloudAccount:", v3, 1);
  v5 = (void *)MEMORY[0x24BE00EE0];
  v6 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "specifierWithStyle:account:detailControllerClass:presentationStyle:", 3, v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMCAccountSpecifierProvider itemSpecifierIDForAccountUsername:](DMCAccountSpecifierProvider, "itemSpecifierIDForAccountUsername:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v9);

  objc_msgSend(v3, "accountDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75D50]);

  objc_msgSend(v3, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", v11, *MEMORY[0x24BE75D28]);
  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  +[DMCIconFactory lanyardCardIcon](DMCIconFactory, "lanyardCardIcon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v12, *MEMORY[0x24BE75AC8]);

  return v7;
}

- (id)_reauthSpecifierForAccount:(id)a3
{
  id v4;
  DMCReauthSpecifierProvider *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[DMCReauthSpecifierProvider initWithAccount:]([DMCReauthSpecifierProvider alloc], "initWithAccount:", v4);

  -[DMCReauthSpecifierProvider specifiers](v5, "specifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setTarget:", self);
    objc_msgSend(v7, "setButtonAction:", sel__accountCellWasTappedWithSpecifier_);
    v8 = v7;
  }

  return v7;
}

- (void)_accountCellWasTappedWithSpecifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCAccountSpecifierProvider delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountCellWasTapped:", v4);

}

- (id)secondaryAccountViewModels
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[ACAccountStore dmc_visibleSecondaryRemoteManagementAccounts](self->_accountStore, "dmc_visibleSecondaryRemoteManagementAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v26;
      v8 = *MEMORY[0x24BE75898];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
          v11 = (void *)objc_opt_new();
          objc_msgSend(v11, "setAccount:", v10);
          objc_msgSend(v10, "username");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[DMCAccountSpecifierProvider itemSpecifierIDForAccountUsername:](DMCAccountSpecifierProvider, "itemSpecifierIDForAccountUsername:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIdentifier:", v13);

          objc_msgSend(v10, "accountDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTitle:", v14);

          objc_msgSend(v10, "username");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setSubtitle:", v15);

          +[DMCIconFactory lanyardCardIcon](DMCIconFactory, "lanyardCardIcon");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIcon:", v16);

          -[DMCAccountSpecifierProvider _reauthSpecifierForAccount:](self, "_reauthSpecifierForAccount:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setReauthIdentifer:", v19);

            objc_msgSend(v18, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setReauthTitle:", v20);

            objc_msgSend(v18, "objectForKeyedSubscript:", v8);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setReauthBadgeNumber:", v21);

          }
          objc_msgSend(v4, "addObject:", v11, v23);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v6);
    }

    v3 = v23;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (DMCAccountSpecifierProviderDelegate)delegate
{
  return (DMCAccountSpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (DMCSecondaryAccountViewModelDelegate)viewModelDelegate
{
  return (DMCSecondaryAccountViewModelDelegate *)objc_loadWeakRetained((id *)&self->_viewModelDelegate);
}

- (void)setViewModelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewModelDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewModelDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
