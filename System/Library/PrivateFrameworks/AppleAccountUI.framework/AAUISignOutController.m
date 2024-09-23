@implementation AAUISignOutController

- (AAUISignOutController)initWithAccount:(id)a3
{
  id v5;
  AAUISignOutController *v6;
  AAUISignOutController *v7;
  uint64_t v8;
  ACAccountStore *accountStore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUISignOutController;
  v6 = -[AAUISignOutController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    -[ACAccount accountStore](v7->_account, "accountStore");
    v8 = objc_claimAutoreleasedReturnValue();
    accountStore = v7->_accountStore;
    v7->_accountStore = (ACAccountStore *)v8;

  }
  return v7;
}

- (AAUISignOutController)initWithCoder:(id)a3
{
  id v4;
  AAUISignOutController *v5;
  uint64_t v6;
  ACAccount *account;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUISignOutController;
  v5 = -[AAUISignOutController initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_account"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    -[ACAccount accountStore](v5->_account, "accountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_accountStore, v9);
    if (!v8)

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_account, CFSTR("_account"));
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void **v6;
  void *v7;
  objc_super v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)AAUISignOutController;
  -[AAUISignOutController viewDidLoad](&v8, sel_viewDidLoad);
  -[AAUISignOutController _actionableDataclassOptions](self, "_actionableDataclassOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AAUISignOutController _dataclassViewController](self, "_dataclassViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v6 = (void **)v10;
  }
  else
  {
    -[AAUISignOutController _spinnerViewControllerForActions:](self, "_spinnerViewControllerForActions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    v6 = &v9;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutController setViewControllers:animated:](self, "setViewControllers:animated:", v7, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AAUISignOutController;
  -[AAUISignOutController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[AAUISignOutController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[AAUISignOutController _mainQueue_continueSignOutWithDataclassActions:](self, "_mainQueue_continueSignOutWithDataclassActions:", 0);
}

- (id)_dataclassViewController
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AAUIDataclassPickerViewController *v10;
  void *v11;
  AAUIDataclassPickerViewController *v12;
  void *v13;

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AAUISignOutController _dataclassViewController].cold.1((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  v10 = [AAUIDataclassPickerViewController alloc];
  -[AAUISignOutController _dataclassOptions](self, "_dataclassOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AAUIDataclassPickerViewController initWithDataclassOptions:account:](v10, "initWithDataclassOptions:account:", v11, self->_account);

  -[AAUISignOutController telemetryFlowID](self, "telemetryFlowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController setTelemetryFlowID:](v12, "setTelemetryFlowID:", v13);

  -[AAUIDataclassPickerViewController setDelegate:](v12, "setDelegate:", self);
  return v12;
}

- (id)_spinnerViewControllerForActions:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  AAUISpinnerViewController *v10;
  void *v11;

  objc_msgSend(a3, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8F2D0], "actionWithType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("SIGN_OUT_SPINNER_KEEPING");
  else
    v8 = CFSTR("SIGN_OUT_SPINNER_REMOVING");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1EA2E2A18, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(AAUISpinnerViewController);
  -[AAUISpinnerViewController label](v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  return v10;
}

- (id)_signOutMessageSimplified:(BOOL)a3 withConfirmation:(BOOL)a4
{
  id v4;
  void *v5;
  id v6;
  _BOOL4 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SIGN_OUT_CONFIRM_MESSAGE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
    return v6;
  }
  v7 = a4;
  if (-[AAUISignOutController _showWalletFooter](self, "_showWalletFooter"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_PASSES_ORDERS"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[AAUISignOutController _hasiCloudPhotosData](self, "_hasiCloudPhotosData"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SIGN_OUT_CLOUDPHOTO"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1EA2E2A18, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AAUISignOutController _appendToSignoutMessage:appendedString:](self, "_appendToSignoutMessage:appendedString:", v6, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v13;
    }
    else
    {
      v6 = v12;
    }

  }
  if (-[AAUISignOutController _hasiCloudDriveData](self, "_hasiCloudDriveData"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SIGN_OUT_ICLOUD_DRIVE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1EA2E2A18, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AAUISignOutController _appendToSignoutMessage:appendedString:](self, "_appendToSignoutMessage:appendedString:", v6, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v17;
    }
    else
    {
      v6 = v16;
    }

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SIGN_OUT_CONFIRM_MESSAGE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_1EA2E2A18, CFSTR("Localizable"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AAUISignOutController _appendToSignoutMessage:appendedString:](self, "_appendToSignoutMessage:appendedString:", v6, v4);
      v20 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v20;
    }
    else
    {
      v4 = v4;
      v6 = v4;
    }
    goto LABEL_20;
  }
  return v6;
}

- (id)_appendToSignoutMessage:(id)a3 appendedString:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\n%@"), v5);
  else
    objc_msgSend(v6, "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_hasiCloudDriveData
{
  void *v4;
  char v5;

  if (-[AAUISignOutController hasiCloudDriveData](self, "hasiCloudDriveData"))
    return 1;
  -[AAUISignOutController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8F430]);

  return v5;
}

- (BOOL)_hasiCloudPhotosData
{
  char v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[AAUISignOutController hasiCloudPhotosData](self, "hasiCloudPhotosData"))
    return 1;
  -[AAUISignOutController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x1E0C8EEE8]) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[AAUISignOutController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEnabledForDataclass:", *MEMORY[0x1E0C8EEB8]) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      -[AAUISignOutController account](self, "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF08]);

    }
  }

  return v3;
}

- (BOOL)_hasOrders
{
  void *v3;
  void *v4;
  char v5;

  -[AAUISignOutController walletOrderChecker](self, "walletOrderChecker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[AAUISignOutController walletOrderChecker](self, "walletOrderChecker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasOrders");

  return v5;
}

- (AAUIFinanceKitAdapterProtocol)walletOrderChecker
{
  AAUIFinanceKitAdapterProtocol *walletOrderChecker;
  AAUIFinanceKitAdapterProtocol *v4;
  AAUIFinanceKitAdapterProtocol *v5;

  walletOrderChecker = self->_walletOrderChecker;
  if (!walletOrderChecker)
  {
    v4 = (AAUIFinanceKitAdapterProtocol *)objc_opt_new();
    v5 = self->_walletOrderChecker;
    self->_walletOrderChecker = v4;

    walletOrderChecker = self->_walletOrderChecker;
  }
  return walletOrderChecker;
}

- (BOOL)_hasPaymentPasses
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getPKPassLibraryClass_softClass;
  v12 = getPKPassLibraryClass_softClass;
  if (!getPKPassLibraryClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getPKPassLibraryClass_block_invoke;
    v8[3] = &unk_1EA2DB6E8;
    v8[4] = &v9;
    __getPKPassLibraryClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "passesOfType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (BOOL)_showWalletFooter
{
  return -[AAUISignOutController _hasPaymentPasses](self, "_hasPaymentPasses")
      || -[AAUISignOutController _hasOrders](self, "_hasOrders");
}

- (NSDictionary)_dataclassOptions
{
  NSDictionary *dataclassOptions;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;

  dataclassOptions = self->_dataclassOptions;
  if (!dataclassOptions)
  {
    -[ACAccountStore dataclassActionsForAccountDeletion:error:](self->_accountStore, "dataclassActionsForAccountDeletion:error:", self->_account, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _AAUILogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AAUISignOutController _dataclassOptions].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(v4, "aaf_filter:", &__block_literal_global_22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aaf_map:", &__block_literal_global_74);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = self->_dataclassOptions;
    self->_dataclassOptions = v13;

    dataclassOptions = self->_dataclassOptions;
  }
  return dataclassOptions;
}

uint64_t __42__AAUISignOutController__dataclassOptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0C8F2D0];
  v4 = a3;
  objc_msgSend(v3, "actionWithType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

AAUIDataclassOption *__42__AAUISignOutController__dataclassOptions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  AAUIDataclassOption *v4;

  v3 = a3;
  v4 = -[AAUIDataclassOption initWithActions:]([AAUIDataclassOption alloc], "initWithActions:", v3);

  return v4;
}

- (id)_actionableDataclassOptions
{
  void *v2;
  void *v3;

  -[AAUISignOutController _dataclassOptions](self, "_dataclassOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aaf_filter:", &__block_literal_global_77);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__AAUISignOutController__actionableDataclassOptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isEditable");
}

- (void)prepareInViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ACAccount *account;
  uint64_t v10;
  id v11;
  void (**v12)(void *, uint64_t, _QWORD);
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(void *, uint64_t, _QWORD);
  _QWORD aBlock[4];
  id v19;
  uint8_t buf[4];
  ACAccount *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    *(_DWORD *)buf = 138543362;
    v21 = account;
    _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Preflighting sign out of account %{public}@...", buf, 0xCu);
  }

  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__AAUISignOutController_prepareInViewController_completion___block_invoke;
  aBlock[3] = &unk_1EA2DBC90;
  v11 = v7;
  v19 = v11;
  v12 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  -[AAUISignOutController _actionableDataclassOptions](self, "_actionableDataclassOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v12[2](v12, 1, 0);
  }
  else
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __60__AAUISignOutController_prepareInViewController_completion___block_invoke_2;
    v15[3] = &unk_1EA2DC000;
    v15[4] = self;
    v16 = v6;
    v17 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v15);

  }
}

uint64_t __60__AAUISignOutController_prepareInViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__AAUISignOutController_prepareInViewController_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_promptForConfirmationInViewController:simplified:withCompletion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)_mainQueue_promptForConfirmationInViewController:(id)a3 simplified:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[3];

  v5 = a4;
  v30[2] = *MEMORY[0x1E0C80C00];
  v25 = a5;
  v27 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignOutController setModalInPresentation:](self, "setModalInPresentation:", 1);
  v8 = (void *)MEMORY[0x1E0CF0E68];
  v9 = *MEMORY[0x1E0CFADF8];
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "analyticsEventWithName:altDSID:flowID:", v9, v10, self->_telemetryFlowID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x1E0CFAEC0];
  v30[0] = *MEMORY[0x1E0CFAEB8];
  v30[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "aaf_arrayAsCommaSeperatedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D15798]);

  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendEvent:", v11);

  v24 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_CONFIRM_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutController _signOutMessageSimplified:withConfirmation:](self, "_signOutMessageSimplified:withConfirmation:", v5, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_CONFIRM_CANCEL"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_CONFIRM_OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __100__AAUISignOutController__mainQueue_promptForConfirmationInViewController_simplified_withCompletion___block_invoke;
  v28[3] = &unk_1EA2DDA10;
  v28[4] = self;
  v29 = v25;
  v22 = v25;
  objc_msgSend(v24, "alertWithTitle:message:cancelButtonTitle:destructiveButtonTitle:actionHandler:", v16, v17, v19, v21, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "presentViewController:animated:completion:", v23, 1, 0);
}

void __100__AAUISignOutController__mainQueue_promptForConfirmationInViewController_simplified_withCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1E0CF0E68];
  v5 = *MEMORY[0x1E0CFAE00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1440), "aa_altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsEventWithName:altDSID:flowID:", v5, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1448));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "User opted to cancel sign out.", buf, 2u);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEB8], *MEMORY[0x1E0D157A0]);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendEvent:", v7);

    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

  }
  else
  {
    if (v9)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Continuing sign out with user-specified dataclass actions.", v14, 2u);
    }

    objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEC0], *MEMORY[0x1E0D157A0]);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_mainQueue_continueSignOutWithDataclassActions:(id)a3
{
  id v4;
  NSObject *v5;
  ACAccount *account;
  ACAccountStore *accountStore;
  ACAccount *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  ACAccount *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    *(_DWORD *)buf = 138412546;
    v12 = account;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to sign out account %@ with dataclass actions %@.", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  accountStore = self->_accountStore;
  v8 = self->_account;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke;
  v9[3] = &unk_1EA2DCEC0;
  objc_copyWeak(&v10, (id *)buf);
  -[ACAccountStore removeAccount:withDataclassActions:completion:](accountStore, "removeAccount:withDataclassActions:completion:", v8, v4, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Removal of account completed with success: %@, error: %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke_95;
  block[3] = &unk_1EA2DB7A0;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
}

void __72__AAUISignOutController__mainQueue_continueSignOutWithDataclassActions___block_invoke_95(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_signOutControllerDidCompleteWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_mainQueue_presentSpinnerPageWithDataclassActions:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignOutController _spinnerViewControllerForActions:](self, "_spinnerViewControllerForActions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUISignOutController pushViewController:animated:](self, "pushViewController:animated:", v7, 1);
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (void)_delegate_signOutControllerDidCancel
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignOutController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "signOutControllerDidCancel:", self);
  else
    -[AAUISignOutController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_delegate_signOutControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUISignOutController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "signOutController:didCompleteWithSuccess:error:", self, v4, v7);
  else
    -[AAUISignOutController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)footerTextForDataclassPickerViewController:(id)a3
{
  return -[AAUISignOutController _signOutMessageSimplified:withConfirmation:](self, "_signOutMessageSimplified:withConfirmation:", 0, 0);
}

- (id)titleTextForDataclassPickerViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SIGN_OUT_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)messageTextForDataclassPickerViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("SIGN_OUT_SUBTITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dataclassPickerViewController:(id)a3 didCompleteWithDataclassActions:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke;
  v7[3] = &unk_1EA2DC798;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[AAUISignOutController _mainQueue_promptForConfirmationInViewController:simplified:withCompletion:](self, "_mainQueue_promptForConfirmationInViewController:simplified:withCompletion:", self, 1, v7);

}

void __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke_2;
    v4[3] = &unk_1EA2DB778;
    v4[4] = v3;
    v5 = v2;
    objc_msgSend(v3, "_mainQueue_presentSpinnerPageWithDataclassActions:completion:", v5, v4);

  }
}

uint64_t __87__AAUISignOutController_dataclassPickerViewController_didCompleteWithDataclassActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_continueSignOutWithDataclassActions:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  else
    return 2;
}

- (ACAccountStore)_accountStore
{
  return self->_accountStore;
}

- (void)_setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void)_setDataclassOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (void)setWalletOrderChecker:(id)a3
{
  objc_storeStrong((id *)&self->_walletOrderChecker, a3);
}

- (BOOL)hasiCloudPhotosData
{
  return self->_hasiCloudPhotosData;
}

- (void)setHasiCloudPhotosData:(BOOL)a3
{
  self->_hasiCloudPhotosData = a3;
}

- (BOOL)hasiCloudDriveData
{
  return self->_hasiCloudDriveData;
}

- (void)setHasiCloudDriveData:(BOOL)a3
{
  self->_hasiCloudDriveData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletOrderChecker, 0);
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_dataclassOptions, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)_dataclassViewController
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "Building dataclass picker for signout with options: %@", a5, a6, a7, a8, 2u);
}

- (void)_dataclassOptions
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "Initial dataclass actions for sign out: %@", a5, a6, a7, a8, 2u);
}

@end
