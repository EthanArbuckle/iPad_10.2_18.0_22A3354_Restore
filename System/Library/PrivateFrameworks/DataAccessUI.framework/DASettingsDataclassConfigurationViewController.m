@implementation DASettingsDataclassConfigurationViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB3FB0], 0);

  v4.receiver = self;
  v4.super_class = (Class)DASettingsDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController dealloc](&v4, sel_dealloc);
}

- (id)accountDescriptionForFirstTimeSetup
{
  void *v2;
  void *v3;

  -[DASettingsDataclassConfigurationViewController daAccount](self, "daAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_navTitle
{
  void *v3;
  void *v4;

  if (-[ACUIDataclassConfigurationViewController isFirstTimeSetup](self, "isFirstTimeSetup"))
  {
    -[DASettingsDataclassConfigurationViewController accountDescriptionForFirstTimeSetup](self, "accountDescriptionForFirstTimeSetup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[DASettingsDataclassConfigurationViewController daAccount](self, "daAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  -[DASettingsDataclassConfigurationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsDataclassConfigurationViewController _navTitle](self, "_navTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v5.receiver = self;
  v5.super_class = (Class)DASettingsDataclassConfigurationViewController;
  -[DASettingsDataclassConfigurationViewController loadView](&v5, sel_loadView);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DASettingsDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[DASettingsDataclassConfigurationViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsDataclassConfigurationViewController _navTitle](self, "_navTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDB3FB0], 0);

  self->_haveRegisteredForAccountsChanged = 0;
  v6.receiver = self;
  v6.super_class = (Class)DASettingsDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)_listenForAccountsChangedNotifications
{
  id v3;

  if (!self->_haveRegisteredForAccountsChanged)
  {
    self->_haveRegisteredForAccountsChanged = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountsChanged_, *MEMORY[0x24BDB3FB0], 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DASettingsDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[DASettingsDataclassConfigurationViewController _listenForAccountsChangedNotifications](self, "_listenForAccountsChangedNotifications");
  -[DASettingsDataclassConfigurationViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsDataclassConfigurationViewController _navTitle](self, "_navTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (DAAccount)daAccount
{
  DAAccount *daAccount;
  DAAccount *v4;
  DAAccount *v5;

  daAccount = self->_daAccount;
  if (!daAccount)
  {
    -[DASettingsDataclassConfigurationViewController accountFromSpecifier](self, "accountFromSpecifier");
    v4 = (DAAccount *)objc_claimAutoreleasedReturnValue();
    v5 = self->_daAccount;
    self->_daAccount = v4;

    daAccount = self->_daAccount;
  }
  return daAccount;
}

- (void)reloadAccount
{
  void *v3;
  void *v4;
  id v5;

  -[DASettingsDataclassConfigurationViewController daAccount](self, "daAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reload");

  -[DASettingsDataclassConfigurationViewController daAccount](self, "daAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingAccountInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuthenticated:", 1);

}

- (id)accountFromSpecifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  -[DASettingsDataclassConfigurationViewController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE00EC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2AB80]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE2ABA0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE2ABA0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5 && (objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);
    objc_msgSend(MEMORY[0x24BE2AA70], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_msgSend(v9, "daemonAppropriateAccountClassForACAccount:", v4);

    v11 = (void *)objc_msgSend([v10 alloc], "initWithBackingAccountInfo:", v4);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_accountsChanged:(id)a3
{
  -[DASettingsDataclassConfigurationViewController reloadAccount](self, "reloadAccount", a3);
  -[DASettingsDataclassConfigurationViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)specifiers
{
  objc_super v4;

  -[DASettingsDataclassConfigurationViewController _listenForAccountsChangedNotifications](self, "_listenForAccountsChangedNotifications");
  v4.receiver = self;
  v4.super_class = (Class)DASettingsDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController specifiers](&v4, sel_specifiers);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)otherSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACUIDataclassConfigurationViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mcBackingProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PROFILE_ACCOUNT_DESCRIPTION"), &stru_24E437D68, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "friendlyName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ACUIDataclassConfigurationViewController setShouldShowDeleteAccountButton:](self, "setShouldShowDeleteAccountButton:", 0);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v10, *MEMORY[0x24BE75A68]);
    objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

- (Class)accountInfoControllerClass
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DASettingsDataclassConfigurationViewController.m"), 158, CFSTR("You need to subclass %@"), v6);

  return 0;
}

- (BOOL)shouldVerifyBeforeAccountSave
{
  return 0;
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v7)
  {
    -[DASettingsDataclassConfigurationViewController daAccount](self, "daAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cleanupAccountFiles");

  }
  v14.receiver = self;
  v14.super_class = (Class)DASettingsDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController operationsHelper:didRemoveAccount:withSuccess:error:](&v14, sel_operationsHelper_didRemoveAccount_withSuccess_error_, v10, v11, v7, v12);

}

- (void)cancelButtonClicked:(id)a3
{
  id v3;

  -[DASettingsDataclassConfigurationViewController rootController](self, "rootController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dismiss");

}

- (void)setDaAccount:(id)a3
{
  objc_storeStrong((id *)&self->_daAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daAccount, 0);
}

@end
