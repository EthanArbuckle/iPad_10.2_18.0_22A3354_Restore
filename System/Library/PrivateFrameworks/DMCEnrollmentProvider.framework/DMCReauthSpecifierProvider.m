@implementation DMCReauthSpecifierProvider

- (DMCReauthSpecifierProvider)initWithAccount:(id)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *MEMORY[0x24BE613C0];
  v5.receiver = self;
  v5.super_class = (Class)DMCReauthSpecifierProvider;
  return -[DMCSpecifierProvider initWithAccount:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:](&v5, sel_initWithAccount_reloadNotification_isLocalNotification_reloadIfMissingRMAccount_, a3, v3, 0, 0);
}

- (DMCReauthSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6;
  uint64_t v7;
  DMCReauthSpecifierProvider *v8;
  DMCReauthSpecifierProvider *v9;
  objc_super v11;

  v6 = a4;
  v7 = *MEMORY[0x24BE613C0];
  v11.receiver = self;
  v11.super_class = (Class)DMCReauthSpecifierProvider;
  v8 = -[DMCSpecifierProvider initWithAccountManager:reloadNotification:isLocalNotification:reloadIfMissingRMAccount:](&v11, sel_initWithAccountManager_reloadNotification_isLocalNotification_reloadIfMissingRMAccount_, a3, v7, 0, 0);
  v9 = v8;
  if (v8)
    objc_storeWeak((id *)&v8->_presenter, v6);

  return v9;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)DMCReauthSpecifierProvider;
  -[DMCSpecifierProvider specifiers](&v12, sel_specifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)DMCReauthSpecifierProvider;
    -[DMCSpecifierProvider specifiers](&v11, sel_specifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[DMCSpecifierProvider rmAccount](self, "rmAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dmc_bearerReauthURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[DMCSpecifierProvider cachedSpecifiers:](self, "cachedSpecifiers:", MEMORY[0x24BDBD1A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  -[DMCReauthSpecifierProvider _reauthSpecifier](self, "_reauthSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCSpecifierProvider cachedSpecifiers:](self, "cachedSpecifiers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_reauthSpecifier
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

  -[DMCReauthSpecifierProvider presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setTarget:", self);
    objc_msgSend(v4, "setButtonAction:", sel_presentReauthFlow_);
    if (!-[DMCSpecifierProvider isReloading](self, "isReloading")
      && -[DMCReauthSpecifierProvider _shouldAutoPresentReauthFlow](self, "_shouldAutoPresentReauthFlow"))
    {
      -[DMCReauthSpecifierProvider presentReauthFlow:](self, "presentReauthFlow:", 0);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x24BE00EE0];
    -[DMCSpecifierProvider rmAccount](self, "rmAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v5, "specifierWithStyle:account:target:controllerLoadAction:", 0, v7, self, sel_presentReauthFlow_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], CFSTR("PSDMCHandleReauthKey"));
  }
  -[DMCSpecifierProvider rmAccount](self, "rmAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DMCAccountSpecifierProvider itemSpecifierIDForReauthAccountUsername:](DMCAccountSpecifierProvider, "itemSpecifierIDForReauthAccountUsername:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v10);

  DMCLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v11);

  objc_msgSend(v4, "setCellType:", 1);
  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v4, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v4, "setProperty:forKey:", &unk_24D5487C8, *MEMORY[0x24BE75898]);

  return v4;
}

- (void)presentReauthFlow:(id)a3
{
  void *v4;
  DMCEnrollmentInterface *v5;
  DMCEnrollmentInterface *v6;
  DMCEnrollmentInterface *enrollmentInterface;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[DMCReauthSpecifierProvider presenter](self, "presenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!self->_enrollmentInterface)
    {
      v5 = [DMCEnrollmentInterface alloc];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __48__DMCReauthSpecifierProvider_presentReauthFlow___block_invoke;
      v11[3] = &unk_24D52EA88;
      v11[4] = self;
      v6 = -[DMCEnrollmentInterface initFromViewController:enrollmentResultBlock:](v5, "initFromViewController:enrollmentResultBlock:", v4, v11);
      enrollmentInterface = self->_enrollmentInterface;
      self->_enrollmentInterface = v6;

    }
    -[DMCReauthSpecifierProvider enrollmentInterface](self, "enrollmentInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCSpecifierProvider rmAccount](self, "rmAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startReauthWithRMAccountID:", v10);

  }
}

id __48__DMCReauthSpecifierProvider_presentReauthFlow___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DMCReauthSpecifierProvider;
  return objc_msgSendSuper2(&v2, sel_reloadSpecifiers);
}

- (BOOL)_shouldAutoPresentReauthFlow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[DMCReauthSpecifierProvider presenter](self, "presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("PSDMCHandleReauthKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v6 = objc_msgSend(v5, "BOOLValue");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)handleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    -[DMCSpecifierProvider rmAccount](self, "rmAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCSpecifierProvider rmAccount](self, "rmAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "username");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[DMCAccountSpecifierProvider itemSpecifierIDForReauthAccountUsername:](DMCAccountSpecifierProvider, "itemSpecifierIDForReauthAccountUsername:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v7, "containsString:", v10);

      if ((_DWORD)v6)
        -[DMCReauthSpecifierProvider presentReauthFlow:](self, "presentReauthFlow:", 0);

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (PSListController)presenter
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (DMCEnrollmentInterface)enrollmentInterface
{
  return self->_enrollmentInterface;
}

- (void)setEnrollmentInterface:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentInterface, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end
