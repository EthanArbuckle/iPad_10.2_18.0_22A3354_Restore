@implementation CNFInternalAccountListViewController

- (CNFInternalAccountListViewController)initWithServiceType:(int64_t)a3
{
  CNFInternalAccountListViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  FTRegConnectionHandler *v8;
  FTRegConnectionHandler *connectionHandler;
  CNFInternalAccountListViewController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNFInternalAccountListViewController;
  v4 = -[CNFInternalAccountListViewController init](&v12, sel_init);
  if (v4)
  {
    FTCServiceNameForServiceType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE50370], "serviceWithInternalName:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {

      v10 = 0;
      goto LABEL_6;
    }
    v7 = (void *)v6;
    -[CNFInternalAccountListViewController setService:](v4, "setService:", v6);
    v8 = -[FTRegConnectionHandler initWithServiceType:name:]([FTRegConnectionHandler alloc], "initWithServiceType:name:", a3, CFSTR("InternalAccountList"));
    connectionHandler = v4->_connectionHandler;
    v4->_connectionHandler = v8;

  }
  v10 = v4;
LABEL_6:

  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountListViewController;
  -[CNFInternalAccountListViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNFInternalAccountListViewController _startListeningForNotifications](self, "_startListeningForNotifications");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFInternalAccountListViewController;
  -[CNFInternalAccountListViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CNFInternalAccountListViewController _stopListeningForNotifications](self, "_stopListeningForNotifications");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  id obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = 0x24BE75000uLL;
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR("Accounts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);
    if (-[FTRegConnectionHandler isConnectedToDaemon](self->_connectionHandler, "isConnectedToDaemon"))
    {
      v25 = v7;
      v26 = v3;
      v28 = v5;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFInternalAccountListViewController service](self, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountsForService:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v10;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v30;
        v14 = *MEMORY[0x24BE75A18];
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v30 != v13)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v16, "login");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (!v17 || !-[__CFString length](v17, "length"))
            {

              v18 = CFSTR("Unnamed");
            }
            v19 = v6;
            objc_msgSend(*(id *)(v6 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0, 0, 0, 2, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              objc_msgSend(v20, "setProperty:forKey:", v16, CFSTR("cnf-internal-account"));
              objc_msgSend(v21, "setButtonAction:", sel_accountTappedWithSpecifier_);
              objc_msgSend(v21, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v14);
              objc_msgSend(v28, "addObject:", v21);
            }

            v6 = v19;
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v12);
      }

      v7 = v25;
      v3 = v26;
      v5 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Disconnected"), self, 0, 0, 0, 2, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v22);

    }
    v23 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)accountNameForSpecifier:(id)a3
{
  void *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "propertyForKey:", CFSTR("cnf-internal-account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "login");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !-[__CFString length](v4, "length"))
  {

    v5 = CFSTR("Unnamed");
  }

  return v5;
}

- (void)accountTappedWithSpecifier:(id)a3
{
  void *v4;
  CNFInternalAccountViewController *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "propertyForKey:", CFSTR("cnf-internal-account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[CNFInternalAccountViewController initWithAccount:]([CNFInternalAccountViewController alloc], "initWithAccount:", v4);
    -[CNFInternalAccountViewController setSpecifier:](v5, "setSpecifier:", v7);
    -[CNFInternalAccountListViewController rootController](self, "rootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFInternalAccountViewController setRootController:](v5, "setRootController:", v6);

    -[CNFInternalAccountListViewController showController:animate:](self, "showController:animate:", v5, 1);
  }

}

- (void)_startListeningForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDaemonConnected_, *MEMORY[0x24BE50118], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDaemonDisconnected_, *MEMORY[0x24BE50120], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50028], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAccountNotification_, *MEMORY[0x24BE50030], 0);

}

- (void)_stopListeningForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50118], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50120], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50028], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE50030], 0);

}

- (void)_handleAccountNotification:(id)a3
{
  if (-[FTRegConnectionHandler isConnectedToDaemon](self->_connectionHandler, "isConnectedToDaemon", a3))
    -[CNFInternalAccountListViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
