@implementation DMCSpecifierProvider

- (DMCSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[DMCSpecifierProvider initWithAccountManager:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:](self, "initWithAccountManager:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:", a3, 0, 1, 0);
}

- (DMCSpecifierProvider)initWithAccountManager:(id)a3 reloadNotification:(id)a4 isLocalNotification:(BOOL)a5 reloadIfMissingRMAccount:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  DMCSpecifierProvider *v14;

  v6 = a6;
  v7 = a5;
  v11 = a3;
  v12 = a4;
  objc_msgSend(v11, "dmc_remoteManagementAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DMCSpecifierProvider initWithAccount:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:](self, "initWithAccount:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:", v13, v12, v7, v6);

  if (v14)
    objc_storeStrong((id *)&v14->_accountManager, a3);

  return v14;
}

- (DMCSpecifierProvider)initWithAccount:(id)a3 reloadNotification:(id)a4 isLocalNotification:(BOOL)a5 reloadIfMissingRMAccount:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v11;
  id v12;
  DMCSpecifierProvider *v13;
  objc_super v15;

  v6 = a6;
  v7 = a5;
  v11 = a3;
  v12 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DMCSpecifierProvider;
  v13 = -[DMCSpecifierProvider init](&v15, sel_init);
  if (v13)
  {
    if (objc_msgSend(v11, "dmc_isVisibleRemoteManagementAccount"))
    {
      objc_storeStrong((id *)&v13->_rmAccount, a3);
      if (!v12)
        goto LABEL_8;
      goto LABEL_7;
    }
    if (v12 && v6)
LABEL_7:
      -[DMCSpecifierProvider _listenForNotification:isLocalNotification:](v13, "_listenForNotification:isLocalNotification:", v12, v7);
  }
LABEL_8:

  return v13;
}

- (void)_listenForNotification:(id)a3 isLocalNotification:(BOOL)a4
{
  void **v5;
  void *v6;
  id v7;
  id v8;

  v5 = (void **)0x24BDD16D0;
  if (!a4)
    v5 = (void **)0x24BDD1530;
  v6 = *v5;
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_reloadNotificationPosted_, v7, 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)DMCSpecifierProvider;
  -[DMCSpecifierProvider dealloc](&v5, sel_dealloc);
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (id)cachedSpecifiers:(id)a3
{
  id v5;
  NSArray *v6;

  objc_storeStrong((id *)&self->_specifiers, a3);
  v5 = a3;
  v6 = self->_specifiers;

  return v6;
}

- (void)reloadSpecifiers
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__DMCSpecifierProvider_reloadSpecifiers__block_invoke;
  v2[3] = &unk_24D52E7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__DMCSpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "rmAccount");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "refresh");

    v2 = (void *)objc_msgSend(WeakRetained[2], "copy");
    v3 = WeakRetained[2];
    WeakRetained[2] = 0;

    objc_msgSend(WeakRetained, "specifiersReloadedNotificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "specifiersReloadedNotificationName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, 0, 0);

    }
    objc_msgSend(WeakRetained, "setIsReloading:", 1);
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadSpecifiersForProvider:oldSpecifiers:animated:", WeakRetained, v2, 1);

    objc_msgSend(WeakRetained, "setIsReloading:", 0);
  }

}

- (void)registerSpecifierBridgeForTableView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("kDMCSpecifierTableCellIdentifier"));

}

- (id)tableCellsForSpecifiersInTableView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DMCSpecifierProvider specifiers](self, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[DMCSpecifierProvider specifiers](self, "specifiers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
          -[DMCSpecifierProvider cellForSpecifier:inTableView:](self, "cellForSpecifier:inTableView:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
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
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (id)cellForSpecifier:(id)a3 inTableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("kDMCSpecifierTableCellIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6B80], "valueCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  if (objc_msgSend(v5, "hasValidGetter"))
  {
    objc_msgSend(v5, "performGetter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSecondaryText:", v9);

  }
  v10 = *MEMORY[0x24BE75AC8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v12);

  }
  v13 = *MEMORY[0x24BE75A18];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE75A18]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", v15 != 0);

  }
  if (objc_msgSend(v5, "cellType") == 15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v16, "startAnimating");
    objc_msgSend(v6, "setBackgroundView:", v16);

  }
  else
  {
    objc_msgSend(v6, "setAccessoryType:", 1);
  }
  objc_msgSend(v6, "setContentConfiguration:", v7);
  objc_msgSend(v5, "detailControllerClass");
  v17 = (void *)objc_opt_new();
  objc_msgSend(v6, "setDetailViewController:", v17);

  objc_msgSend(v6, "detailViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSpecifier:", v5);

  return v6;
}

- (id)specifiersReloadedNotificationName
{
  return 0;
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (ACAccount)rmAccount
{
  return self->_rmAccount;
}

- (BOOL)isReloading
{
  return self->_isReloading;
}

- (void)setIsReloading:(BOOL)a3
{
  self->_isReloading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rmAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
