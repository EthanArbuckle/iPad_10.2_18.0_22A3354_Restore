@implementation DKAccountProvider

- (DKAccountProvider)initWithFindMyProvider:(id)a3
{
  id v4;
  DKAccountProvider *v5;
  DKAccountProvider *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DKAccountProvider;
  v5 = -[DKAccountProvider init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DKAccountProvider setFindMyProvider:](v5, "setFindMyProvider:", v4);
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKAccountProvider setAccountStore:](v6, "setAccountStore:", v7);

    v8 = objc_alloc(MEMORY[0x24BE060E0]);
    -[DKAccountProvider accountStore](v6, "accountStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithAccountStore:", v9);
    -[DKAccountProvider setServiceOwnersManager:](v6, "setServiceOwnersManager:", v10);

    v11 = objc_alloc(MEMORY[0x24BE060C8]);
    -[DKAccountProvider accountStore](v6, "accountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithAccountStore:", v12);
    -[DKAccountProvider setAccountManager:](v6, "setAccountManager:", v13);

    -[DKAccountProvider accountManager](v6, "accountManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v6);

    v15 = objc_alloc_init(MEMORY[0x24BE1A4A8]);
    -[DKAccountProvider setWalrusStateController:](v6, "setWalrusStateController:", v15);

  }
  return v6;
}

- (void)fetchAccounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;

  v12 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[DKAccountProvider accountStore](self, "accountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKAccountProvider accountStore](self, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aa_appleAccounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "count"))
  {
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __35__DKAccountProvider_fetchAccounts___block_invoke;
    v17 = &unk_24F20DED0;
    v10 = v6;
    v18 = v10;
    v11 = objc_msgSend(v9, "indexOfObjectPassingTest:", &v14);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "removeObjectAtIndex:", v11);
      objc_msgSend(v9, "insertObject:atIndex:", v10, 0);
    }

  }
  -[DKAccountProvider _addAccountDataForAccounts:toAccountsData:completion:](self, "_addAccountDataForAccounts:toAccountsData:completion:", v9, v4, v12, v12, v14, v15, v16, v17);

}

uint64_t __35__DKAccountProvider_fetchAccounts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)primaryAppleAccountAllowsOfflineEraseWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__DKAccountProvider_primaryAppleAccountAllowsOfflineEraseWithCompletion___block_invoke;
  v6[3] = &unk_24F20DEF8;
  v7 = v4;
  v5 = v4;
  -[DKAccountProvider _walrusStatusWithCompletion:](self, "_walrusStatusWithCompletion:", v6);

}

uint64_t __73__DKAccountProvider_primaryAppleAccountAllowsOfflineEraseWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _BOOL8 v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2 == 2 && a3 == 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v3 + 16))(v3, v5);
}

- (void)cacheLocalDevicePasscode:(id)a3 passcodeType:(int)a4
{
  uint64_t v5;
  objc_class *v6;
  id v7;
  id v8;

  if (a4 == -1)
    v5 = 3;
  else
    v5 = 2;
  v6 = (objc_class *)MEMORY[0x24BE1A450];
  v7 = a3;
  v8 = (id)objc_msgSend([v6 alloc], "initWithValidatedSecret:secretType:", v7, v5);

  -[DKAccountProvider setCachedLocalSecret:](self, "setCachedLocalSecret:", v8);
}

- (void)preparationRequiredForPrimaryAppleAccountWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__DKAccountProvider_preparationRequiredForPrimaryAppleAccountWithCompletion___block_invoke;
  v6[3] = &unk_24F20DEF8;
  v7 = v4;
  v5 = v4;
  -[DKAccountProvider _walrusStatusWithCompletion:](self, "_walrusStatusWithCompletion:", v6);

}

void __77__DKAccountProvider_preparationRequiredForPrimaryAppleAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contextForPrimaryAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1A490]), "initWithContext:", v4);
    v7 = 0;
    objc_msgSend(v5, "isManateeAvailable:", &v7);
    v6 = v7;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)preparePrimaryAppleAccountForSignOutWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke;
  v10[3] = &unk_24F20DF70;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v12 = v8;
  v9 = v6;
  v11 = v9;
  -[DKAccountProvider _walrusStatusWithCompletion:](self, "_walrusStatusWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void (*v8)(void);
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v7 = WeakRetained;
  if (!WeakRetained)
  {
    v8 = (void (*)(void))*((_QWORD *)a1[5] + 2);
LABEL_7:
    v8();
    goto LABEL_9;
  }
  if (a2 == 2)
  {
    v8 = (void (*)(void))*((_QWORD *)a1[5] + 2);
    goto LABEL_7;
  }
  if (a2 == 1)
  {
    objc_msgSend(WeakRetained, "_verifyAndRepairManateeWithPresentingViewController:completion:", a1[4], a1[5]);
  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2;
    v9[3] = &unk_24F20DF48;
    v10 = v5;
    v11 = v7;
    v13 = a1[5];
    v12 = a1[4];
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
LABEL_9:

}

void __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  _DKLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2_cold_1(a1, v2, v3);

  v4 = *(void **)(a1 + 40);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_24;
  v9 = &unk_24F20DF20;
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "_unknownFailureAlertControllerWithCompletion:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v5, 1, 0, v6, v7, v8, v9);

}

uint64_t __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)signOutPrimaryAppleAccountWithPresentingViewController:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BE060D0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setViewController:", v8);
  v13 = *MEMORY[0x24BE06080];
  v10 = v13;
  v14[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSignOutContexts:", v11);

  -[DKAccountProvider setPresentingViewController:](self, "setPresentingViewController:", v8);
  -[DKAccountProvider serviceOwnersManager](self, "serviceOwnersManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signOutService:withContext:completion:", v10, v9, v7);

}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__DKAccountProvider_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke;
  v12[3] = &unk_24F20DF98;
  objc_copyWeak(&v14, &location);
  v11 = v10;
  v13 = v11;
  -[DKAccountProvider _walrusStatusWithCompletion:](self, "_walrusStatusWithCompletion:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __88__DKAccountProvider_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  v7 = *(_QWORD *)(a1 + 32);
  if (a2 == 1 && WeakRetained)
    objc_msgSend(WeakRetained, "_performLastDeviceCheckWithCompletion:", v7);
  else
    (*(void (**)(_QWORD, BOOL, id))(v7 + 16))(*(_QWORD *)(a1 + 32), a2 == 2, v8);

}

- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a5;
  -[DKAccountProvider findMyProvider](self, "findMyProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKAccountProvider presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__DKAccountProvider_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke;
  v10[3] = &unk_24F20DFC0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "disableFindMyWithPresentingViewController:completion:", v8, v10);

}

uint64_t __84__DKAccountProvider_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[DKAccountProvider accountStore](self, "accountStore");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAccount:withCompletionHandler:", v8, v7);

}

- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[DKAccountProvider presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24F20EA28, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __81__DKAccountProvider_signOutFlowController_showAlertWithTitle_message_completion___block_invoke;
    v18[3] = &unk_24F20DFE8;
    v19 = v11;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v17);

    objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);
  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

uint64_t __81__DKAccountProvider_signOutFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)accountsForAccountManager:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[DKAccountProvider serviceOwnersManager](self, "serviceOwnersManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE06080];
  objc_msgSend(v3, "accountForService:", *MEMORY[0x24BE06080]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8 = v4;
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v6;
}

- (void)recoveryFactorController:(id)a3 didFinishAddingRecoveryContactWithError:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);
  void (**v8)(id, _QWORD, void *);
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  -[DKAccountProvider pendingWalrusValidationCompletion](self, "pendingWalrusValidationCompletion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DKAccountProvider pendingWalrusValidationCompletion](self, "pendingWalrusValidationCompletion");
    v7 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "aa_errorWithCode:underlyingError:", 0, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v9);

    }
    else
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __86__DKAccountProvider_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke;
      v10[3] = &unk_24F20DEF8;
      v11 = v7;
      v8 = v7;
      -[DKAccountProvider _walrusStatusWithCompletion:](self, "_walrusStatusWithCompletion:", v10);

    }
    -[DKAccountProvider setPendingWalrusValidationCompletion:](self, "setPendingWalrusValidationCompletion:", 0);
    -[DKAccountProvider setRecoveryFactorController:](self, "setRecoveryFactorController:", 0);
  }

}

void __86__DKAccountProvider_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (a2 == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (a3)
      v4 = 0;
    else
      v4 = -1;
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "aa_errorWithCode:underlyingError:", v4, a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);

  }
}

- (void)_addAccountDataForAccounts:(id)a3 toAccountsData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  DKAccountProvider *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__DKAccountProvider__addAccountDataForAccounts_toAccountsData_completion___block_invoke;
    v15[3] = &unk_24F20E010;
    v16 = v9;
    v17 = self;
    v18 = v12;
    v19 = v10;
    v13 = v12;
    -[DKAccountProvider _fetchAccountDataForAccount:completion:](self, "_fetchAccountDataForAccount:completion:", v11, v15);

  }
  else
  {
    v14 = (void *)objc_msgSend(v9, "copy");
    (*((void (**)(id, void *))v10 + 2))(v10, v14);

  }
}

uint64_t __74__DKAccountProvider__addAccountDataForAccounts_toAccountsData_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_addAccountDataForAccounts:toAccountsData:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

- (void)_fetchAccountDataForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BE04D48]);
  -[DKAccountProvider accountStore](self, "accountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAppleAccount:store:", v6, v9);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke;
  v13[3] = &unk_24F20E038;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "fetchProfilePictureForAccountOwner:", v13);

}

void __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  DKNotableUserDataAccount *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _DKLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke_cold_1(v6, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "aa_formattedUsername");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "aa_fullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DKNotableUserDataAccount initWithProfilePicture:name:username:]([DKNotableUserDataAccount alloc], "initWithProfilePicture:name:username:", v5, v8, v9);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_verifyAndRepairManateeWithPresentingViewController:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BE04CD8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "contextWithType:", 6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setForceInlinePresentation:", 1);
  -[DKAccountProvider cachedLocalSecret](self, "cachedLocalSecret");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCachedLocalSecret:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D30]), "initWithFlowContext:withPresentingViewController:", v11, v8);
  objc_msgSend(v10, "verifyAndRepairManateeWithCompletion:", v7);

}

- (id)_unknownFailureAlertControllerWithCompletion:(id)a3
{
  id v3;
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
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_FAILURE_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_FAILURE_MESSAGE"), &stru_24F20EA28, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_FAILURE_BUTTON_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__DKAccountProvider__unknownFailureAlertControllerWithCompletion___block_invoke;
  v16[3] = &unk_24F20DFE8;
  v17 = v3;
  v13 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v14);

  return v9;
}

uint64_t __66__DKAccountProvider__unknownFailureAlertControllerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AAUIRecoveryFactorController)recoveryFactorController
{
  AAUIRecoveryFactorController *recoveryFactorController;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  AAUIRecoveryFactorController *v11;
  AAUIRecoveryFactorController *v12;

  recoveryFactorController = self->_recoveryFactorController;
  if (!recoveryFactorController)
  {
    -[DKAccountProvider presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[DKAccountProvider presentingViewController](self, "presentingViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    v9 = objc_alloc(MEMORY[0x24BE04D60]);
    -[DKAccountProvider accountManager](self, "accountManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (AAUIRecoveryFactorController *)objc_msgSend(v9, "initWithAccountManager:presentingViewController:", v10, v8);
    v12 = self->_recoveryFactorController;
    self->_recoveryFactorController = v11;

    -[AAUIRecoveryFactorController setDelegate:](self->_recoveryFactorController, "setDelegate:", self);
    objc_opt_class();
    -[AAUIRecoveryFactorController setForceInlinePresentation:](self->_recoveryFactorController, "setForceInlinePresentation:", objc_opt_isKindOfClass() & 1);

    recoveryFactorController = self->_recoveryFactorController;
  }
  return recoveryFactorController;
}

- (void)_walrusStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[DKAccountProvider walrusStateController](self, "walrusStateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke;
  v7[3] = &unk_24F20DEF8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "walrusStatusWithCompletion:", v7);

}

void __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a3;
  if (v5)
  {
    _DKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke_cold_1((uint64_t)v5, v6, v7);

  }
  if (!a2 && objc_msgSend(v5, "cdp_isCDPErrorWithCode:", -5102))
  {
    _DKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_229405000, v8, OS_LOG_TYPE_DEFAULT, "Received unknown walrus status due to no primary Apple account, treating as disabled.", v9, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_performLastDeviceCheckWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__DKAccountProvider__performLastDeviceCheckWithCompletion___block_invoke;
  v6[3] = &unk_24F20E060;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[DKAccountProvider _determineEligibilityWithCompletion:](self, "_determineEligibilityWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __59__DKAccountProvider__performLastDeviceCheckWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a2 && WeakRetained)
    objc_msgSend(WeakRetained, "_presentLastDeviceAlertWithCompletion:", *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7 == 0);

}

- (void)_determineEligibilityWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextForPrimaryAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BE1A490]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke;
  v8[3] = &unk_24F20E088;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "fetchEscrowRecordDevicesWithContext:usingCache:completion:", v5, 0, v8);

}

void __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void (*v10)(void);
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count") == 1
    && (objc_msgSend(v5, "firstObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isCurrentDevice"),
        v7,
        v8))
  {
    _DKLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229405000, v9, OS_LOG_TYPE_DEFAULT, "Current device is determined to be the last escrow device for primary account.", buf, 2u);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    _DKLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke_cold_1((uint64_t)v6, v12, v13);
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_229405000, v12, OS_LOG_TYPE_DEFAULT, "Determined that the current device is not the last escrow device for the primary account.", v14, 2u);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

- (void)_presentLastDeviceAlertWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[DKAccountProvider recoveryFactorController](self, "recoveryFactorController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke;
  v7[3] = &unk_24F20DF98;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "availableRecoveryFactorsWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5 || !WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke_2;
    block[3] = &unk_24F20E0B0;
    v9 = WeakRetained;
    v11 = a2;
    v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __59__DKAccountProvider__presentLastDeviceAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentLastDeviceAlertWithRecoveryFactors:withCompletion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_presentLastDeviceAlertWithRecoveryFactors:(unint64_t)a3 withCompletion:(id)a4
{
  char v4;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  char v48;
  _QWORD v49[4];
  id v50;

  v4 = a3;
  v35 = a4;
  _DKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[DKAccountProvider _presentLastDeviceAlertWithRecoveryFactors:withCompletion:].cold.1(v6);

  v36 = (unint64_t)(v4 & 4) >> 2;
  v7 = CFSTR("CONTACT");
  if ((v4 & 4) != 0)
    v7 = CFSTR("KEY");
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = v7;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("SIGN_OUT_LAST_DEVICE_RECOVERY_%@_TITLE"), v9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SIGN_OUT_ADD_RECOVERY_%@_BUTTON"), v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERASE_LAST_DEVICE_RECOVERY_%@_MESSAGE"), v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v41, &stru_24F20EA28, CFSTR("Localizable-Walrus"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v40, &stru_24F20EA28, CFSTR("Localizable-Walrus"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v39, &stru_24F20EA28, CFSTR("Localizable-Walrus"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v38, v37, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24F20EA28, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke;
  v49[3] = &unk_24F20DFE8;
  v18 = v35;
  v50 = v18;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 2, v49);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v19);

  v20 = (void *)MEMORY[0x24BDF67E8];
  v46[0] = v17;
  v46[1] = 3221225472;
  v46[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_2;
  v46[3] = &unk_24F20E100;
  v48 = v36;
  v46[4] = self;
  v21 = v18;
  v47 = v21;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v34, 0, v46);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v22);

  v23 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_ADD_DATA_RECOVERY_SERVICE_BUTTON"), &stru_24F20EA28, CFSTR("Localizable-Walrus"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v17;
  v44[1] = 3221225472;
  v44[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_4;
  v44[3] = &unk_24F20E128;
  v44[4] = self;
  v26 = v21;
  v45 = v26;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v44);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v27);

  v28 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccountUI"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_CANCEL_BUTTON"), &stru_24F20EA28, CFSTR("Localizable-Walrus"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v17;
  v42[1] = 3221225472;
  v42[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_5;
  v42[3] = &unk_24F20DFE8;
  v43 = v26;
  v31 = v26;
  objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 1, v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v32);

  -[DKAccountProvider presentingViewController](self, "presentingViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "presentViewController:animated:completion:", v13, 1, 0);

}

uint64_t __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "recoveryFactorController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_3;
    v4[3] = &unk_24F20E0D8;
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v2, "generateRecoveryKeyWithCompletion:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPendingWalrusValidationCompletion:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "recoveryFactorController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAddingRecoveryContact");

  }
}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "aa_errorWithCode:underlyingError:", 0, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32));
  }
}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setPendingWalrusValidationCompletion:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "recoveryFactorController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAddingDataRecoveryService");

}

void __79__DKAccountProvider__presentLastDeviceAlertWithRecoveryFactors_withCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "aa_errorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (DKFindMyProvider)findMyProvider
{
  return self->_findMyProvider;
}

- (void)setFindMyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_findMyProvider, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (CDPLocalSecret)cachedLocalSecret
{
  return self->_cachedLocalSecret;
}

- (void)setCachedLocalSecret:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocalSecret, a3);
}

- (CDPWalrusStateController)walrusStateController
{
  return self->_walrusStateController;
}

- (void)setWalrusStateController:(id)a3
{
  objc_storeStrong((id *)&self->_walrusStateController, a3);
}

- (void)setRecoveryFactorController:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryFactorController, a3);
}

- (id)pendingWalrusValidationCompletion
{
  return self->_pendingWalrusValidationCompletion;
}

- (void)setPendingWalrusValidationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingWalrusValidationCompletion, 0);
  objc_storeStrong((id *)&self->_recoveryFactorController, 0);
  objc_storeStrong((id *)&self->_walrusStateController, 0);
  objc_storeStrong((id *)&self->_cachedLocalSecret, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_findMyProvider, 0);
}

void __97__DKAccountProvider_preparePrimaryAppleAccountForSignOutWithPresentingViewController_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_229405000, a2, a3, "Failed to determine walrus status: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __60__DKAccountProvider__fetchAccountDataForAccount_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v2;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = _DKIsInternalInstall();
  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "domain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(a1, "code"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = 138543362;
  v9 = a1;
  OUTLINED_FUNCTION_0_0(&dword_229405000, a2, v5, "Failed to fetch profile image: %{public}@", (uint8_t *)&v8);
  if (!v6)
  {

  }
}

void __49__DKAccountProvider__walrusStatusWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_229405000, a2, a3, "Encountered error while fetching walrus status: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __57__DKAccountProvider__determineEligibilityWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_229405000, a2, a3, "Failed to fetch escrow record devices for primary account: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_presentLastDeviceAlertWithRecoveryFactors:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_229405000, log, OS_LOG_TYPE_DEBUG, "Presenting warning to walrus user for signing out of last circle device", v1, 2u);
}

@end
