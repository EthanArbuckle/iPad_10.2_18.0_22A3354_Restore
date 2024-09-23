@implementation DASettingsAccountsUIController

- (DAAccount)account
{
  DAAccount *v3;
  DAAccount *account;
  DAAccount *v5;
  DAAccount *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!self->_account)
  {
    -[DASettingsAccountsUIController accountFromSpecifier](self, "accountFromSpecifier");
    v3 = (DAAccount *)objc_claimAutoreleasedReturnValue();
    account = self->_account;
    self->_account = v3;

    if (self->_account)
    {
      -[DASettingsAccountsUIController setAttemptedValidation:](self, "setAttemptedValidation:", 1);
      -[DASettingsAccountsUIController setValidatedSuccessfully:](self, "setValidatedSuccessfully:", 1);
    }
    else
    {
      -[DASettingsAccountsUIController setIsSettingUpNewAccount:](self, "setIsSettingUpNewAccount:", 1);
      -[DASettingsAccountsUIController setAccountNeedsAdd:](self, "setAccountNeedsAdd:", 1);
      v5 = -[DASettingsAccountsUIController newDefaultAccount](self, "newDefaultAccount");
      v6 = self->_account;
      self->_account = v5;

      DALoggingwithCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 4);
      if (os_log_type_enabled(v7, v8))
      {
        -[DAAccount backingAccountInfo](self->_account, "backingAccountInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DAAccount backingAccountInfo](self->_account, "backingAccountInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "username");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v10;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_21F4FA000, v7, v8, "Setting _backingAccountInfo.authenticated = YES for Account identifier %@ and username %@", (uint8_t *)&v15, 0x16u);

      }
      -[DAAccount backingAccountInfo](self->_account, "backingAccountInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAuthenticated:", 1);

    }
  }
  return self->_account;
}

- (void)reloadAccount
{
  void *v3;
  void *v4;
  id v5;

  -[DASettingsAccountsUIController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reload");

  -[DASettingsAccountsUIController account](self, "account");
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
  objc_class *v6;
  void *v7;

  -[DASettingsAccountsUIController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE00EC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE2AA70], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_msgSend(v5, "daemonAppropriateAccountClassForACAccount:", v4);

    v7 = (void *)objc_msgSend([v6 alloc], "initWithBackingAccountInfo:", v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)daAccountWithBackingAccountInfo:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v6[16];

  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F4FA000, v3, v4, "Individual Settings Bundles MUST create their own da accounts", v6, 2u);
  }

  return 0;
}

- (id)newDefaultAccount
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v5[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F4FA000, v2, v3, "Individual Settings Bundles MUST create their own default accounts", v5, 2u);
  }

  return 0;
}

- (id)specifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  if (!-[DASettingsAccountsUIController haveRegisteredForAccountsChanged](self, "haveRegisteredForAccountsChanged"))
  {
    -[DASettingsAccountsUIController setHaveRegisteredForAccountsChanged:](self, "setHaveRegisteredForAccountsChanged:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountsChanged_, *MEMORY[0x24BDB3FB0], 0);

  }
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4);
  if (!v5)
  {
    -[DASettingsAccountsUIController accountSpecifiers](self, "accountSpecifiers");
    v6 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4) = v6;

    v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v4);
  }
  return v5;
}

- (id)accountSpecifiers
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DASettingsAccountsUIController;
  v6 = a4;
  -[DASettingsAccountsUIController tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DASettingsAccountsUIController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);

  -[DASettingsAccountsUIController specifierAtIndex:](self, "specifierAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("DESCRIPTION"));

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v7, "textField");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObserver:name:object:", self, 0, v12);

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_propertyValueChanged_, *MEMORY[0x24BDF7F58], v12);

      }
    }
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[DASettingsAccountsUIController reloadSpecifiers](self, "reloadSpecifiers");
  -[DASettingsAccountsUIController updateDoneButton](self, "updateDoneButton");
  v5.receiver = self;
  v5.super_class = (Class)DASettingsAccountsUIController;
  -[DASettingsAccountsUIController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)showAlertWithButtons:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  DASettingsAccountsUIController *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v23 = self;
  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v24 = a6;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", a4, a5, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v18 = objc_msgSend(v11, "count", v23);
        v19 = (void *)MEMORY[0x24BDF67E8];
        v20 = v18 > 1 && v14 + i == 0;
        v25[0] = MEMORY[0x24BDAC760];
        v21 = v20;
        v25[1] = 3221225472;
        v25[2] = __80__DASettingsAccountsUIController_showAlertWithButtons_title_message_completion___block_invoke;
        v25[3] = &unk_24E437C98;
        v26 = v24;
        v27 = v14 + i;
        objc_msgSend(v19, "actionWithTitle:style:handler:", v17, v21, v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v22);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v14 += i;
    }
    while (v13);
  }

  -[DASettingsAccountsUIController presentViewController:animated:completion:](v23, "presentViewController:animated:completion:", v10, 1, 0);
}

uint64_t __80__DASettingsAccountsUIController_showAlertWithButtons_title_message_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)validateAccount
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v5[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F4FA000, v2, v3, "Individual Settings Bundles should handle account validation", v5, 2u);
  }

  return 0;
}

- (void)showIdenticalAccountFailureView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E437D68, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_UNIQUE_CONSTRAINT_FAILED_TITLE"), &stru_24E437D68, CFSTR("DataAccess"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsAccountsUIController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedIdenticalAccountFailureMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsAccountsUIController showAlertWithButtons:title:message:completion:](self, "showAlertWithButtons:title:message:completion:", v5, v7, v9, 0);

}

- (void)showSSLFailureView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E437D68, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24E437D68, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SETUP_WITHOUT_SSL_TITLE"), &stru_24E437D68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SETUP_WITHOUT_SSL_BODY"), &stru_24E437D68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__DASettingsAccountsUIController_showSSLFailureView__block_invoke;
  v12[3] = &unk_24E437CC0;
  v12[4] = self;
  -[DASettingsAccountsUIController showAlertWithButtons:title:message:completion:](self, "showAlertWithButtons:title:message:completion:", v4, v6, v8, v12);

}

uint64_t __52__DASettingsAccountsUIController_showSSLFailureView__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didConfirmTryWithoutSSL:", a2 != 0);
}

- (void)didConfirmTryWithoutSSL:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    -[DASettingsAccountsUIController specifierForID:](self, "specifierForID:", CFSTR("USE_SSL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "properties");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "control");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOn:animated:", 0, 1);

    -[DASettingsAccountsUIController account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUseSSL:", 0);

    -[DASettingsAccountsUIController _beginAccountValidation](self, "_beginAccountValidation");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_VERIFICATION_FAILED"), &stru_24E437D68, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASettingsAccountsUIController hideProgressWithPrompt:](self, "hideProgressWithPrompt:", v8);

  }
}

- (void)didConfirmSaveUnvalidatedAccount:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[DASettingsAccountsUIController setConfirmedUnvalidatedAccount:](self, "setConfirmedUnvalidatedAccount:", 1);
    -[DASettingsAccountsUIController account](self, "account");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[DASettingsAccountsUIController account:isValid:validationError:](self, "account:isValid:validationError:", v4, 1, 0);

  }
}

- (void)_confirmSaveUnvalidatedAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SAVE"), &stru_24E437D68, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_24E437D68, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsAccountsUIController localizedConfirmSaveUnvalidatedAccountTitleString](self, "localizedConfirmSaveUnvalidatedAccountTitleString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsAccountsUIController localizedConfirmSaveUnvalidatedAccountMessageString](self, "localizedConfirmSaveUnvalidatedAccountMessageString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__DASettingsAccountsUIController__confirmSaveUnvalidatedAccount__block_invoke;
  v10[3] = &unk_24E437CC0;
  v10[4] = self;
  -[ACUIViewController showConfirmationWithButtons:title:message:destructive:completion:](self, "showConfirmationWithButtons:title:message:destructive:completion:", v7, v8, v9, 0, v10);

}

uint64_t __64__DASettingsAccountsUIController__confirmSaveUnvalidatedAccount__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didConfirmSaveUnvalidatedAccount:", a2 == 0);
}

- (void)_beginAccountValidation
{
  if (-[DASettingsAccountsUIController validateAccount](self, "validateAccount"))
    -[ACUIViewController setTaskCompletionAssertionEnabled:](self, "setTaskCompletionAssertionEnabled:", 1);
}

- (void)account:(id)a3 isValid:(BOOL)a4 validationError:(id)a5
{
  void *v6;

  if (a4)
  {
    if (-[DASettingsAccountsUIController validatedSuccessfully](self, "validatedSuccessfully", a3, a4, a5)
      && !-[DASettingsAccountsUIController confirmedUnvalidatedAccount](self, "confirmedUnvalidatedAccount")
      && (-[DASettingsAccountsUIController transitionsAfterInitialSetup](self, "transitionsAfterInitialSetup")
       || -[DASettingsAccountsUIController dismissesAfterInitialSetup](self, "dismissesAfterInitialSetup")))
    {
      -[ACUIViewController setCellsChecked:](self, "setCellsChecked:", 1);
    }
    -[DASettingsAccountsUIController setTransitioningToFinishedAccountSetup:](self, "setTransitioningToFinishedAccountSetup:", 1);
    -[ACUIViewController doneButton](self, "doneButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);

    -[DASettingsAccountsUIController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_finishedAccountSetup, 0, 1.0);
  }
  -[ACUIViewController setTaskCompletionAssertionEnabled:](self, "setTaskCompletionAssertionEnabled:", 0);
}

- (void)finishedAccountSetup
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[DASettingsAccountsUIController setTransitioningToFinishedAccountSetup:](self, "setTransitioningToFinishedAccountSetup:", 0);
  objc_msgSend(MEMORY[0x24BE2AA90], "reportActiveExchangeOAuthAccountsCount");
  if (-[DASettingsAccountsUIController isSettingUpNewAccount](self, "isSettingUpNewAccount")
    && !-[DASettingsAccountsUIController dismissesAfterInitialSetup](self, "dismissesAfterInitialSetup"))
  {
    if (-[DASettingsAccountsUIController isSettingUpNewAccount](self, "isSettingUpNewAccount")
      && !-[DASettingsAccountsUIController transitionsAfterInitialSetup](self, "transitionsAfterInitialSetup"))
    {
      -[DASettingsAccountsUIController updateDoneButton](self, "updateDoneButton");
    }
    else if (-[DASettingsAccountsUIController transitionsAfterInitialSetup](self, "transitionsAfterInitialSetup"))
    {
      -[DASettingsAccountsUIController parentController](self, "parentController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        -[DASettingsAccountsUIController parentController](self, "parentController");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[DASettingsAccountsUIController account](self, "account");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "backingAccountInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "controller:didFinishSettingUpAccount:", self, v6);

      }
    }
  }
  else
  {
    -[DASettingsAccountsUIController doneButtonTapped:](self, "doneButtonTapped:", self);
  }
}

- (void)doneButtonTapped:(id)a3
{
  void *v4;
  void *v5;

  -[DASettingsAccountsUIController table](self, "table", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  if (-[DASettingsAccountsUIController attemptedValidation](self, "attemptedValidation"))
  {
    if (-[DASettingsAccountsUIController validatedSuccessfully](self, "validatedSuccessfully"))
    {
      if (self->_needsSave)
        -[DASettingsAccountsUIController _saveAccountDismissWhenDone:](self, "_saveAccountDismissWhenDone:", 1);
      else
        -[ACUIViewController dismissAnimated:](self, "dismissAnimated:", 1);
    }
    else
    {
      -[DASettingsAccountsUIController _confirmSaveUnvalidatedAccount](self, "_confirmSaveUnvalidatedAccount");
    }
  }
  else
  {
    -[DASettingsAccountsUIController setAttemptedValidation:](self, "setAttemptedValidation:", 1);
    -[DASettingsAccountsUIController _beginAccountValidation](self, "_beginAccountValidation");
  }
}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (-[DASettingsAccountsUIController isSettingUpNewAccount](self, "isSettingUpNewAccount", a3))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cleanupAccountFiles");

  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  -[DASettingsAccountsUIController account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reload");

  -[ACUIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)setNeedsSaveAndValidation:(BOOL)a3
{
  if (a3)
    self->_attemptedValidation = 0;
  self->_needsSave = 1;
  -[DASettingsAccountsUIController updateDoneButton](self, "updateDoneButton");
}

- (void)updateDoneButton
{
  uint64_t v3;
  _BOOL4 attemptedValidation;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_attemptedValidation || -[DASettingsAccountsUIController haveEnoughValues](self, "haveEnoughValues"))
    v3 = -[DASettingsAccountsUIController transitioningToFinishedAccountSetup](self, "transitioningToFinishedAccountSetup") ^ 1;
  else
    v3 = 0;
  if (-[DASettingsAccountsUIController isSettingUpNewAccount](self, "isSettingUpNewAccount"))
  {
    attemptedValidation = self->_attemptedValidation;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (attemptedValidation)
      v7 = CFSTR("SAVE");
    else
      v7 = CFSTR("NEXT");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("DONE");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24E437D68, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACUIViewController doneButton](self, "doneButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  -[ACUIViewController doneButton](self, "doneButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v3);

}

- (BOOL)dismissesAfterInitialSetup
{
  return 0;
}

- (BOOL)transitionsAfterInitialSetup
{
  return 0;
}

- (BOOL)haveEnoughValues
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v5[16];

  DALoggingwithCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F4FA000, v2, v3, "Individual Settings Bundles should know if they have enough values", v5, 2u);
  }

  return 0;
}

- (void)propertyValueChanged:(id)a3
{
  -[DASettingsAccountsUIController setAttemptedValidation:](self, "setAttemptedValidation:", 0);
  -[DASettingsAccountsUIController updateDoneButton](self, "updateDoneButton");
}

- (id)_defaultAccountDescription
{
  return 0;
}

- (void)setHostString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DASettingsAccountsUIController setDidSetFullHostURL:](self, "setDidSetFullHostURL:", 0);
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("/"));
  v6 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
  if (!objc_msgSend(v4, "length") || v5 == 0x7FFFFFFFFFFFFFFFLL && v6 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_7;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("http")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
LABEL_7:

  }
  objc_msgSend(v7, "host");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DASettingsAccountsUIController account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrincipalURL:", v7);

    -[DASettingsAccountsUIController setDidSetFullHostURL:](self, "setDidSetFullHostURL:", 1);
    -[DASettingsAccountsUIController account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShouldDoInitialAutodiscovery:", 0);

  }
LABEL_11:
  if (!-[DASettingsAccountsUIController didSetFullHostURL](self, "didSetFullHostURL"))
  {
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_21F4FA000, v13, v14, "Couldn't parse host string \"%@\" into a URL. Using it directly", buf, 0xCu);
    }

    -[DASettingsAccountsUIController account](self, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHost:", v4);

    -[DASettingsAccountsUIController account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShouldDoInitialAutodiscovery:", 0);

  }
}

- (void)setAccountProperty:(id)a3 withSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  DASettingsAccountsUIController *v23;
  BOOL v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsAccountsUIController accountPropertyWithSpecifier:](self, "accountPropertyWithSpecifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v26, "isEqualToString:", v8))
  {
    objc_msgSend(v7, "isEqualToString:", CFSTR("EMAIL"));
  }
  else
  {
    if (objc_msgSend(v26, "length"))
      v9 = 0;
    else
      v9 = objc_msgSend(v8, "length") == 0;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("EMAIL")) && !v9)
    {
      -[DASettingsAccountsUIController account](self, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEmailAddress:", v26);

      -[DASettingsAccountsUIController account](self, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accountDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
        goto LABEL_19;
      -[DASettingsAccountsUIController _defaultAccountDescription](self, "_defaultAccountDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACUIViewController accountStore](self, "accountStore");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasAccountWithDescription:", v10);

      if (v16)
      {
        v17 = v26;

        v10 = v17;
      }
      -[DASettingsAccountsUIController account](self, "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAccountDescription:", v10);

      -[DASettingsAccountsUIController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("DESCRIPTION"));
LABEL_18:

      goto LABEL_19;
    }
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("HOST")))
  {
    -[DASettingsAccountsUIController setHostString:](self, "setHostString:", v26);
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("USERNAME")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUsername:", v26);
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PASSWORD")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPassword:", v26);
    goto LABEL_18;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("DESCRIPTION")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accountDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v26, "isEqualToString:", v20);

    if ((v21 & 1) == 0)
    {
      -[DASettingsAccountsUIController account](self, "account");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAccountDescription:", v26);

      -[DASettingsAccountsUIController rootController](self, "rootController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topViewController");
      v23 = (DASettingsAccountsUIController *)objc_claimAutoreleasedReturnValue();
      if (v23 == self)
      {
        v24 = -[DASettingsAccountsUIController isSettingUpNewAccount](self, "isSettingUpNewAccount");

        if (v24)
          goto LABEL_19;
        -[DASettingsAccountsUIController navigationItem](self, "navigationItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[DASettingsAccountsUIController localizedAccountTitleString](self, "localizedAccountTitleString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTitle:", v25);

      }
      else
      {

      }
      goto LABEL_18;
    }
  }
LABEL_19:
  -[DASettingsAccountsUIController setNeedsSaveAndValidation:](self, "setNeedsSaveAndValidation:", 0);

}

- (id)accountPropertyWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("EMAIL")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emailAddress");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("HOST")))
  {
    v7 = -[DASettingsAccountsUIController didSetFullHostURL](self, "didSetFullHostURL");
    -[DASettingsAccountsUIController account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v7)
    {
      objc_msgSend(v8, "principalURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      goto LABEL_15;
    }
    objc_msgSend(v8, "host");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v10 = (__CFString *)v6;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("USERNAME")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "username");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PASSWORD")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passwordWithExpected:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("DESCRIPTION")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v10 = 0;
LABEL_15:
  if (v10)
    v11 = v10;
  else
    v11 = &stru_24E437D68;
  v12 = v11;

  return v12;
}

- (void)setAccountBooleanProperty:(id)a3 withSpecifier:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  objc_msgSend(v6, "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("USE_SSL"));
  if ((_DWORD)v8)
  {
    -[DASettingsAccountsUIController account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUseSSL:", v7);

  }
  -[DASettingsAccountsUIController setNeedsSaveAndValidation:](self, "setNeedsSaveAndValidation:", v8);

}

- (id)accountBooleanPropertyWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("USE_SSL")))
  {
    -[DASettingsAccountsUIController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "useSSL");

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_dismissAndUpdateParent
{
  -[ACUIViewController removeParentSpecifier](self, "removeParentSpecifier");
  -[ACUIViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)_deleteAccount
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  -[ACUIViewController setTaskCompletionAssertionEnabled:](self, "setTaskCompletionAssertionEnabled:", 1);
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21F4FA000, v3, v4, "Requesting delete from ACAccountStore", v8, 2u);
  }

  -[ACUIViewController accountOperationsHelper](self, "accountOperationsHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DASettingsAccountsUIController account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingAccountInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAccount:", v7);

}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  objc_super v15;
  _QWORD block[4];
  id v17;
  DASettingsAccountsUIController *v18;
  BOOL v19;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  dataaccess_get_global_queue();
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__DASettingsAccountsUIController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke;
  block[3] = &unk_24E437CE8;
  v19 = v6;
  v17 = v10;
  v18 = self;
  v14 = v10;
  dispatch_async(v13, block);

  v15.receiver = self;
  v15.super_class = (Class)DASettingsAccountsUIController;
  -[ACUIViewController operationsHelper:didRemoveAccount:withSuccess:error:](&v15, sel_operationsHelper_didRemoveAccount_withSuccess_error_, v12, v11, v6, v14);

}

uint64_t __86__DASettingsAccountsUIController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 48))
  {
    DALoggingwithCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v2, v3))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_21F4FA000, v2, v3, "Couldn't remove the account: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "setTaskCompletionAssertionEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "performSelector:withObject:afterDelay:", sel__dismissAndUpdateParent, 0, 1.0);
}

- (void)_finishSaveAccountDismissWhenDone:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[ACUIViewController reloadParentSpecifier](self, "reloadParentSpecifier");
  -[ACUIViewController setTaskCompletionAssertionEnabled:](self, "setTaskCompletionAssertionEnabled:", 0);
  if (v3)
  {
    -[DASettingsAccountsUIController parentController](self, "parentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[DASettingsAccountsUIController parentController](self, "parentController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[DASettingsAccountsUIController account](self, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backingAccountInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "controller:didFinishSettingUpAccount:", self, v8);

    }
    else
    {
      -[ACUIViewController dismissAnimated:](self, "dismissAnimated:", 1);
    }
  }
}

- (void)_saveAccountDismissWhenDone:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = a3;
  -[ACUIViewController setTaskCompletionAssertionEnabled:](self, "setTaskCompletionAssertionEnabled:", 1);
  if (v3)
  {
    DALoggingwithCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21F4FA000, v5, v6, "Requesting account save from ACAccountStore", v11, 2u);
    }

    -[DASettingsAccountsUIController account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveModifiedPropertiesOnBackingAccount");

    -[ACUIViewController accountOperationsHelper](self, "accountOperationsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASettingsAccountsUIController account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backingAccountInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "saveAccount:requireVerification:", v10, 0);

  }
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  objc_super v15;
  _QWORD block[4];
  id v17;
  DASettingsAccountsUIController *v18;
  BOOL v19;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  dataaccess_get_global_queue();
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84__DASettingsAccountsUIController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
  block[3] = &unk_24E437CE8;
  v19 = v6;
  v17 = v10;
  v18 = self;
  v14 = v10;
  dispatch_async(v13, block);

  v15.receiver = self;
  v15.super_class = (Class)DASettingsAccountsUIController;
  -[ACUIViewController operationsHelper:didSaveAccount:withSuccess:error:](&v15, sel_operationsHelper_didSaveAccount_withSuccess_error_, v12, v11, v6, v14);

}

uint64_t __84__DASettingsAccountsUIController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 48);
  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
    if (os_log_type_enabled(v3, v5))
    {
      LOWORD(v13) = 0;
      v6 = "ACAccountStore saved my account, dismissing";
      v7 = v4;
      v8 = v5;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_21F4FA000, v7, v8, v6, (uint8_t *)&v13, v9);
    }
  }
  else
  {
    v10 = *(unsigned __int8 *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v3, *(os_log_type_t *)(MEMORY[0x24BE2AD38] + 3)))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      v14 = v11;
      v6 = "Couldn't save the account: %@";
      v7 = v4;
      v8 = v10;
      v9 = 12;
      goto LABEL_6;
    }
  }

  return objc_msgSend(*(id *)(a1 + 40), "_finishSaveAccountDismissWhenDone:", 1);
}

- (BOOL)isRunningFromMobileMailApp
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilemail"));

  return v4;
}

- (void)hideProgressWithPrompt:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[DASettingsAccountsUIController localizedAccountSetupTitleString](self, "localizedAccountSetupTitleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACUIViewController stopValidationWithPrompt:showButtons:](self, "stopValidationWithPrompt:showButtons:", v4, 1);

  -[DASettingsAccountsUIController updateDoneButton](self, "updateDoneButton");
  if (!-[DASettingsAccountsUIController isRunningFromMobileMailApp](self, "isRunningFromMobileMailApp"))
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "setStatusBarShowsProgress:", 0);
  v5 = v13;
  if (v13)
  {
    v6 = (void *)MEMORY[0x24BDF67F0];
    -[DASettingsAccountsUIController localizedValidationFailureTitleString](self, "localizedValidationFailureTitleString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E437D68, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, &__block_literal_global);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v12);
    -[DASettingsAccountsUIController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

    v5 = v13;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DASettingsAccountsUIController;
  -[ACUIViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSuspended");

  -[DASettingsAccountsUIController rootController](self, "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deallocating");

  -[DASettingsAccountsUIController rootController](self, "rootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", self);

  if ((v6 & 1) != 0 || (v8 & 1) != 0 || !v11)
  {
    if (-[ACUIViewController validationInProgress](self, "validationInProgress"))
    {
      -[DASettingsAccountsUIController updateDoneButton](self, "updateDoneButton");
      -[DASettingsAccountsUIController hideProgressWithPrompt:](self, "hideProgressWithPrompt:", 0);
    }
    else if (-[DASettingsAccountsUIController accountNeedsAdd](self, "accountNeedsAdd"))
    {
      -[DASettingsAccountsUIController account](self, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cleanupAccountFiles");

    }
  }
  v13.receiver = self;
  v13.super_class = (Class)DASettingsAccountsUIController;
  -[DASettingsAccountsUIController viewWillDisappear:](&v13, sel_viewWillDisappear_, v3);
}

- (int)indexOfCurrentlyEditingCell
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  -[DASettingsAccountsUIController currentlyEditingCell](self, "currentlyEditingCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "indexPathForCell:", v3), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = -[DASettingsAccountsUIController indexForIndexPath:](self, "indexForIndexPath:", v4);

  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (id)currentlyEditingCell
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[DASettingsAccountsUIController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_8;
      objc_msgSend(v7, "superview");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    while (v8);

  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)lastGroupSpecifierInSpecifiers:(id)a3
{
  id v3;
  int v4;
  uint64_t v5;
  int *v6;
  char *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v5 = v4 + 1;
    v6 = (int *)MEMORY[0x24BE75738];
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", (v5 - 2));
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!*(_QWORD *)&v7[*v6])
        break;

      if ((unint64_t)--v5 <= 1)
        goto LABEL_5;
    }
  }

  return v8;
}

- (id)localizedValidationFailureTitleString
{
  return 0;
}

- (id)localizedConfirmSaveUnvalidatedAccountMessageString
{
  return 0;
}

- (id)localizedAccountSetupTitleString
{
  return 0;
}

- (id)localizedAccountTitleString
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[DASettingsAccountsUIController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    -[DASettingsAccountsUIController localizedAccountSetupTitleString](self, "localizedAccountSetupTitleString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)deleteAccountButtonTapped
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[DASettingsAccountsUIController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingAccountInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__DASettingsAccountsUIController_deleteAccountButtonTapped__block_invoke;
  v5[3] = &unk_24E437CC0;
  v5[4] = self;
  -[ACUIViewController showConfirmationForDeletingAccount:completion:](self, "showConfirmationForDeletingAccount:completion:", v4, v5);

}

uint64_t __59__DASettingsAccountsUIController_deleteAccountButtonTapped__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_deleteAccount");
  return result;
}

- (BOOL)accountIsManaged
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  -[DASettingsAccountsUIController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingAccountInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managingOwnerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  -[DASettingsAccountsUIController account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backingAccountInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mcBackingProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9 != 0;

  return v6;
}

- (BOOL)didSetFullHostURL
{
  return self->_didSetFullHostURL;
}

- (void)setDidSetFullHostURL:(BOOL)a3
{
  self->_didSetFullHostURL = a3;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (BOOL)attemptedValidation
{
  return self->_attemptedValidation;
}

- (void)setAttemptedValidation:(BOOL)a3
{
  self->_attemptedValidation = a3;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)isSettingUpNewAccount
{
  return self->_isSettingUpNewAccount;
}

- (void)setIsSettingUpNewAccount:(BOOL)a3
{
  self->_isSettingUpNewAccount = a3;
}

- (BOOL)accountNeedsAdd
{
  return self->_accountNeedsAdd;
}

- (void)setAccountNeedsAdd:(BOOL)a3
{
  self->_accountNeedsAdd = a3;
}

- (BOOL)validatedSuccessfully
{
  return self->_validatedSuccessfully;
}

- (void)setValidatedSuccessfully:(BOOL)a3
{
  self->_validatedSuccessfully = a3;
}

- (BOOL)confirmedUnvalidatedAccount
{
  return self->_confirmedUnvalidatedAccount;
}

- (void)setConfirmedUnvalidatedAccount:(BOOL)a3
{
  self->_confirmedUnvalidatedAccount = a3;
}

- (BOOL)haveRegisteredForAccountsChanged
{
  return self->_haveRegisteredForAccountsChanged;
}

- (void)setHaveRegisteredForAccountsChanged:(BOOL)a3
{
  self->_haveRegisteredForAccountsChanged = a3;
}

- (BOOL)transitioningToFinishedAccountSetup
{
  return self->_transitioningToFinishedAccountSetup;
}

- (void)setTransitioningToFinishedAccountSetup:(BOOL)a3
{
  self->_transitioningToFinishedAccountSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
