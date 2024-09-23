@implementation RMAccountDetailsViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RMAccountDetailsViewController;
  -[RMAccountDetailsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[RMAccountDetailsViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
    -[RMAccountDetailsViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)cancelButtonTapped:(id)a3
{
  -[ACUIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)doneButtonTapped:(id)a3
{
  -[ACUIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[RMAccountDetailsViewController _processUserInfoDictionary](self, "_processUserInfoDictionary");
    -[RMAccountDetailsViewController _specifiersForAccount](self, "_specifiersForAccount");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_processUserInfoDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[RMAccountDetailsViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE00EC8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMAccountDetailsViewController setAccount:](self, "setAccount:", v4);

    -[RMAccountDetailsViewController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE00EC0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACUIViewController accountStore](self, "accountStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountWithIdentifier:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RMAccountDetailsViewController setAccount:](self, "setAccount:", v8);

    }
  }
}

- (id)_specifiersForAccount
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ACCOUNT_INFO"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE75590];
  DMCLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel_accountEmail_, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE75590];
  DMCLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_accountDescription_, 0, 4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  DMCLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMAccountDetailsViewController account](self, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dmc_enrollmentToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RMDeviceIDCell specifierWithTitle:value:](RMDeviceIDCell, "specifierWithTitle:value:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v3;
  v17[1] = v6;
  v17[2] = v9;
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v14;
  v17[4] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)accountEmail:(id)a3
{
  void *v3;
  void *v4;

  -[RMAccountDetailsViewController account](self, "account", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accountDescription:(id)a3
{
  void *v3;
  void *v4;

  -[RMAccountDetailsViewController account](self, "account", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
