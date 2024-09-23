@implementation AAUIInheritanceSetupFlowController

- (AAUIInheritanceSetupFlowController)initWithAccount:(id)a3
{
  id v4;
  void *v5;
  AAUIInheritanceSetupFlowController *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[AAUIInheritanceSetupFlowController initWithAccount:navigationController:](self, "initWithAccount:navigationController:", v4, v5);

  return v6;
}

- (AAUIInheritanceSetupFlowController)initWithAccount:(id)a3 navigationController:(id)a4
{
  id v7;
  id v8;
  AAUIInheritanceSetupFlowController *v9;
  AAUIInheritanceSetupFlowController *v10;
  uint64_t v11;
  AAUIContactsProvider *contactsProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIInheritanceSetupFlowController;
  v9 = -[AAUIInheritanceSetupFlowController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationController, a4);
    objc_storeStrong((id *)&v10->_appleAccount, a3);
    v11 = objc_opt_new();
    contactsProvider = v10->_contactsProvider;
    v10->_contactsProvider = (AAUIContactsProvider *)v11;

  }
  return v10;
}

- (void)_showIntro
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  AAUIOBInheritanceIntroViewModel *v6;
  AAUIOBWelcomeController *v7;
  AAUIOBWelcomeController *firstTimeSetupVC;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Intro...", (uint8_t *)&v12, 0xCu);

  }
  v6 = objc_alloc_init(AAUIOBInheritanceIntroViewModel);
  v7 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", v6);
  firstTimeSetupVC = self->_firstTimeSetupVC;
  self->_firstTimeSetupVC = v7;

  -[AAUIOBWelcomeController primaryButton](self->_firstTimeSetupVC, "primaryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__beginAddBeneficiaryFlow, 64);

  -[AAUIOBWelcomeController secondaryButton](self->_firstTimeSetupVC, "secondaryButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__dismiss, 64);

  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "showViewController:sender:", self->_firstTimeSetupVC, 0);

}

- (void)_beginAddBeneficiaryFlow
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[AAUIOBWelcomeController primaryButton](self->_firstTimeSetupVC, "primaryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[UINavigationController aaui_showActivityIndicator](self->_navigationController, "aaui_showActivityIndicator");
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke;
  v4[3] = &unk_1EA2DCEC0;
  objc_copyWeak(&v5, &location);
  -[AAUIInheritanceSetupFlowController _validateAccountWithCompletion:](self, "_validateAccountWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;
  id v5;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_fetchSuggestedContacts");

  }
  else
  {
    if (WeakRetained)
    {
      block[1] = 3221225472;
      block[2] = __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke_2;
      block[3] = &unk_1EA2DB208;
      block[4] = WeakRetained;
      v5 = WeakRetained;
      block[0] = MEMORY[0x1E0C809B0];
      dispatch_async(MEMORY[0x1E0C80D38], block);
      WeakRetained = v5;
    }

  }
}

void __62__AAUIInheritanceSetupFlowController__beginAddBeneficiaryFlow__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "primaryButton");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

- (void)_validateAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  ACAccount *appleAccount;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "%@ : Showing Interactive Auth Prompt...", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v8 = (void *)objc_opt_new();
  appleAccount = self->_appleAccount;
  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke;
  v13[3] = &unk_1EA2DCEE8;
  objc_copyWeak(&v15, (id *)buf);
  v13[4] = self;
  v12 = v4;
  v14 = v12;
  objc_msgSend(v8, "aaui_beneficiaryAuthForAccount:presentingViewController:completion:", appleAccount, v11, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2;
    block[3] = &unk_1EA2DC000;
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v6;
    v16 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "%@ : Authentication successful, continue setup...", buf, 0xCu);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF80]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)WeakRetained[5];
    WeakRetained[5] = v11;

    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v13, "_verifyCDPWithCompletion:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t (*v7)(void);
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  v2 = objc_msgSend(*(id *)(a1 + 40), "code");
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2 == -7003)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "%@ : User canceled auth", (uint8_t *)&v9, 0xCu);

    }
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2_cold_1();

    v7 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v7();
}

- (void)_verifyCDPWithCompletion:(id)a3
{
  id v4;
  AAUID2DEncryptionFlowContext *v5;
  AAUIManateeStateValidator *v6;
  void *v7;
  AAUIManateeStateValidator *v8;
  id v9;
  AAUIManateeStateValidator *v10;
  _QWORD v11[4];
  AAUIManateeStateValidator *v12;
  id v13;

  v4 = a3;
  v5 = -[AAUID2DEncryptionFlowContext initWithType:]([AAUID2DEncryptionFlowContext alloc], "initWithType:", 3);
  v6 = [AAUIManateeStateValidator alloc];
  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AAUIManateeStateValidator initWithFlowContext:withPresentingViewController:](v6, "initWithFlowContext:withPresentingViewController:", v5, v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__AAUIInheritanceSetupFlowController__verifyCDPWithCompletion___block_invoke;
  v11[3] = &unk_1EA2DC458;
  v12 = v8;
  v13 = v4;
  v9 = v4;
  v10 = v8;
  -[AAUIManateeStateValidator verifyAndRepairManateeWithCompletion:](v10, "verifyAndRepairManateeWithCompletion:", v11);

}

uint64_t __63__AAUIInheritanceSetupFlowController__verifyCDPWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_fetchSuggestedContacts
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  AAUIContactsProvider *contactsProvider;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Fetching suggested contacts...", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[UINavigationController aaui_showActivityIndicator](self->_navigationController, "aaui_showActivityIndicator");
  contactsProvider = self->_contactsProvider;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke;
  v7[3] = &unk_1EA2DCF38;
  v7[4] = self;
  objc_copyWeak(&v8, (id *)buf);
  -[AAUIContactsProvider fetchSuggestedBeneficiariesWithImagesOfSize:andCompletion:](contactsProvider, "fetchSuggestedBeneficiariesWithImagesOfSize:andCompletion:", v7, 16.0);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke_2;
  block[3] = &unk_1EA2DCF10;
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v7);

}

void __61__AAUIInheritanceSetupFlowController__fetchSuggestedContacts__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "primaryButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  v3 = objc_msgSend(*(id *)(a1 + 40), "count");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "_showContactSelector:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(WeakRetained, "_showDefaultContactPickerWithCancel");

}

- (void)_showContactSelector:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  AAUIOBContactSelectorViewModel *v8;
  AAUIAccountContactSelectorViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "%@ : Showing Trusted/Family Contacts Picker...", (uint8_t *)&v13, 0xCu);

  }
  v8 = -[AAUIOBContactSelectorViewModel initWithFlow:]([AAUIOBContactSelectorViewModel alloc], "initWithFlow:", 1);
  -[AAUIOBContactSelectorViewModel setSuggestedContacts:](v8, "setSuggestedContacts:", v4);

  v9 = -[AAUIAccountContactSelectorViewController initWithViewModel:]([AAUIAccountContactSelectorViewController alloc], "initWithViewModel:", v8);
  -[AAUIOBTableWelcomeController setDelegate:](v9, "setDelegate:", self);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismiss);
  -[OBBaseWelcomeController navigationItem](v9, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "showViewController:sender:", v9, 0);

}

- (void)_showDefaultContactPicker
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Default Contacts Picker...", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setDelegate:", self);
  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_showDefaultContactPickerWithCancel
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Default Contacts Picker...", (uint8_t *)&v10, 0xCu);

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismiss);
  objc_msgSend(v6, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)_showShareData
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  AAUIOBInheritanceShareDataViewModel *v6;
  void *v7;
  AAUIOBInheritanceShareDataViewModel *v8;
  AAUIOBWelcomeController *v9;
  AAUIOBWelcomeController *shareDataVC;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Share Data Priming Step...", (uint8_t *)&v13, 0xCu);

  }
  v6 = [AAUIOBInheritanceShareDataViewModel alloc];
  -[AALocalContactInfo firstName](self->_selectedContact, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AAUIOBInheritanceShareDataViewModel initWithBeneficiaryName:](v6, "initWithBeneficiaryName:", v7);

  v9 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", v8);
  shareDataVC = self->_shareDataVC;
  self->_shareDataVC = v9;

  -[AAUIOBWelcomeController primaryButton](self->_shareDataVC, "primaryButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forEvents:", self, sel__shareDataDidContinue, 64);

  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "showViewController:sender:", self->_shareDataVC, 0);

}

- (void)_showShareAccessKey
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  AAUIInheritanceShareAccessKeyOptionsViewController *v6;
  void *v7;
  void *v8;
  AAUIInheritanceShareAccessKeyOptionsViewController *v9;
  AAUIInheritanceShareAccessKeyOptionsViewController *shareAccessKeyOptionsViewController;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Share Access Key Options...", (uint8_t *)&v13, 0xCu);

  }
  v6 = [AAUIInheritanceShareAccessKeyOptionsViewController alloc];
  -[AALocalContactInfo firstName](self->_selectedContact, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AALocalContactInfo handle](self->_selectedContact, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AAUIInheritanceShareAccessKeyOptionsViewController initWithBeneficiaryName:handle:](v6, "initWithBeneficiaryName:handle:", v7, v8);
  shareAccessKeyOptionsViewController = self->_shareAccessKeyOptionsViewController;
  self->_shareAccessKeyOptionsViewController = v9;

  -[AAUIInheritanceShareAccessKeyOptionsViewController setFlowDelegate:](self->_shareAccessKeyOptionsViewController, "setFlowDelegate:", self);
  -[OBBaseWelcomeController navigationItem](self->_shareAccessKeyOptionsViewController, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidesBackButton:", 1);

  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "showViewController:sender:", self->_shareAccessKeyOptionsViewController, 0);

}

- (void)_showPrintPreview
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  AAUIInheritanceAccessKeyPDFGenerator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Showing Print Preview...", buf, 0xCu);

  }
  -[AALocalContactInfo setInheritanceContactInfo:](self->_selectedContact, "setInheritanceContactInfo:", self->_selectedBeneficiary);
  v6 = -[AAUIInheritanceAccessKeyPDFGenerator initWithAppleAccount:localContactInfo:]([AAUIInheritanceAccessKeyPDFGenerator alloc], "initWithAppleAccount:localContactInfo:", self->_appleAccount, self->_selectedContact);
  -[AAUIInheritanceAccessKeyPDFGenerator createPDFDocumentData](v6, "createPDFDocumentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D80C28], "canPrintData:", v7))
  {
    objc_msgSend(MEMORY[0x1E0D80C20], "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[AALocalContactInfo firstName](self->_selectedContact, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyDocumentTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ - %@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setJobName:", v12);

    objc_msgSend(v8, "setOrientation:", 0);
    objc_msgSend(v8, "setOutputType:", 2);
    objc_msgSend(MEMORY[0x1E0D80C28], "sharedPrintController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPrintInfo:", v8);
    objc_msgSend(v13, "setShowsNumberOfCopies:", 1);
    objc_msgSend(v13, "setPrintingItem:", v7);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke;
    v14[3] = &unk_1EA2DBFD8;
    v14[4] = self;
    objc_msgSend(v13, "presentAnimated:completionHandler:", 1, v14);

  }
}

void __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Error presenting printInteractionController - %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_64;
    block[3] = &unk_1EA2DB778;
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v10 = v15;
    goto LABEL_8;
  }
  if (!a3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_3;
    v11[3] = &unk_1EA2DB778;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v11);
    v10 = v12;
LABEL_8:

    goto LABEL_9;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_2;
  v13[3] = &unk_1EA2DB208;
  v13[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v13);
LABEL_9:

}

void __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_64(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localizedDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_showAlertWithTitle:message:", 0, v2);

}

uint64_t __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showSetupCompleteWithShareTypePrint");
}

uint64_t __55__AAUIInheritanceSetupFlowController__showPrintPreview__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRightBarButtonItem:animated:", v3, 1);

  return objc_msgSend(*(id *)(a1 + 40), "dismissAnimated:", 1);
}

- (void)_startInviteMessageFlow
{
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, a1, a3, "LCInvite: Initialing LC Invite Message view without checking if receiver isFamilyMember", a5, a6, a7, a8, 0);
}

- (void)_showSetupCompleteWithShareTypePrint
{
  AAUIOBInheritanceSetupCompleteViewModel *v3;
  void *v4;
  AAUIOBWelcomeController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AAUIOBInheritanceSetupCompleteViewModel *v10;

  v3 = [AAUIOBInheritanceSetupCompleteViewModel alloc];
  -[AALocalContactInfo displayName](self->_selectedContact, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AAUIOBInheritanceSetupCompleteViewModel initWithBeneficiaryName:accessKeyShareType:](v3, "initWithBeneficiaryName:accessKeyShareType:", v4, 1);

  v5 = -[AAUIOBWelcomeController initWithViewModel:]([AAUIOBWelcomeController alloc], "initWithViewModel:", v10);
  -[AAUIOBWelcomeController primaryButton](v5, "primaryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__dismiss, 64);

  -[AAUIOBWelcomeController secondaryButton](v5, "secondaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__dismissAndNavigateToDateOfBirthSettings, 64);

  -[OBBaseWelcomeController navigationItem](v5, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidesBackButton:", 1);

  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showViewController:sender:", v5, 0);

}

- (void)_dismiss
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AAUIInheritanceSetupFlowController__dismiss__block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __46__AAUIInheritanceSetupFlowController__dismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_dismissAndNavigateToDateOfBirthSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AAUIInheritanceSetupFlowController__dismissAndNavigateToDateOfBirthSettings__block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __78__AAUIInheritanceSetupFlowController__dismissAndNavigateToDateOfBirthSettings__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_16);

}

void __78__AAUIInheritanceSetupFlowController__dismissAndNavigateToDateOfBirthSettings__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&aaaction=accountContactDetails"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v1, 0);

}

- (void)inheritanceDidSelectSharingOption:(unint64_t)a3
{
  if (a3 == 1)
  {
    -[AAUIInheritanceSetupFlowController _showPrintPreview](self, "_showPrintPreview");
  }
  else if (!a3)
  {
    -[AAUIInheritanceSetupFlowController _startInviteMessageFlow](self, "_startInviteMessageFlow");
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  AALocalContactInfo *v11;
  AALocalContactInfo *selectedContact;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  AABeneficiaryInfo *v17;
  AABeneficiaryInfo *selectedBeneficiary;
  _QWORD v19[5];

  v6 = a4;
  v7 = a3;
  +[AAUITrustedContactPickerViewController addressKindAndHandleForSingleAddressContact:](AAUITrustedContactPickerViewController, "addressKindAndHandleForSingleAddressContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CFAC98]);
  objc_msgSend(v8, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (AALocalContactInfo *)objc_msgSend(v9, "initWithHandle:contact:", v10, v6);

  selectedContact = self->_selectedContact;
  self->_selectedContact = v11;

  -[AALocalContactInfo setContactType:](self->_selectedContact, "setContactType:", -[AALocalContactInfo contactType](self->_selectedContact, "contactType") | 4);
  v13 = objc_alloc(MEMORY[0x1E0CFABD0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_altDSID](self->_appleAccount, "aa_altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (AABeneficiaryInfo *)objc_msgSend(v13, "initWithBeneficiaryID:benefactorAltDSID:handle:", v14, v15, v16);
  selectedBeneficiary = self->_selectedBeneficiary;
  self->_selectedBeneficiary = v17;

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__AAUIInheritanceSetupFlowController_contactPicker_didSelectContact___block_invoke;
  v19[3] = &unk_1EA2DB208;
  v19[4] = self;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v19);

}

uint64_t __69__AAUIInheritanceSetupFlowController_contactPicker_didSelectContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showShareData");
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  AALocalContactInfo *v14;
  AALocalContactInfo *selectedContact;
  id v16;
  void *v17;
  void *v18;
  AABeneficiaryInfo *v19;
  AABeneficiaryInfo *selectedBeneficiary;
  _QWORD v21[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "stringValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = v9;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AAUIInheritanceSetupFlowController contactPicker:didSelectContactProperty:].cold.1();

  v12 = objc_alloc(MEMORY[0x1E0CFAC98]);
  objc_msgSend(v6, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (AALocalContactInfo *)objc_msgSend(v12, "initWithHandle:contact:", v10, v13);
  selectedContact = self->_selectedContact;
  self->_selectedContact = v14;

  -[AALocalContactInfo setContactType:](self->_selectedContact, "setContactType:", -[AALocalContactInfo contactType](self->_selectedContact, "contactType") | 4);
  v16 = objc_alloc(MEMORY[0x1E0CFABD0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_altDSID](self->_appleAccount, "aa_altDSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (AABeneficiaryInfo *)objc_msgSend(v16, "initWithBeneficiaryID:benefactorAltDSID:handle:", v17, v18, v10);
  selectedBeneficiary = self->_selectedBeneficiary;
  self->_selectedBeneficiary = v19;

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__AAUIInheritanceSetupFlowController_contactPicker_didSelectContactProperty___block_invoke;
  v21[3] = &unk_1EA2DB208;
  v21[4] = self;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v21);

}

uint64_t __77__AAUIInheritanceSetupFlowController_contactPicker_didSelectContactProperty___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showShareData");
}

- (void)accountContactSelector:(id)a3 didSelectContact:(id)a4
{
  id v5;
  AALocalContactInfo *v6;
  AALocalContactInfo *selectedContact;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  AABeneficiaryInfo *v12;
  AABeneficiaryInfo *selectedBeneficiary;
  NSObject *v14;
  _QWORD block[5];

  v5 = a4;
  v6 = (AALocalContactInfo *)objc_msgSend(v5, "copy");
  selectedContact = self->_selectedContact;
  self->_selectedContact = v6;

  -[AALocalContactInfo setContactType:](self->_selectedContact, "setContactType:", -[AALocalContactInfo contactType](self->_selectedContact, "contactType") | 4);
  v8 = objc_alloc(MEMORY[0x1E0CFABD0]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccount aa_altDSID](self->_appleAccount, "aa_altDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (AABeneficiaryInfo *)objc_msgSend(v8, "initWithBeneficiaryID:benefactorAltDSID:handle:", v9, v10, v11);
  selectedBeneficiary = self->_selectedBeneficiary;
  self->_selectedBeneficiary = v12;

  _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[AAUIInheritanceSetupFlowController accountContactSelector:didSelectContact:].cold.1();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AAUIInheritanceSetupFlowController_accountContactSelector_didSelectContact___block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__AAUIInheritanceSetupFlowController_accountContactSelector_didSelectContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showShareData");
}

- (void)inviteMessageWasSent:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  AABeneficiaryInfo *selectedBeneficiary;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "%@ : Sending IDS Message to Beneficiary", buf, 0xCu);

  }
  v9 = (void *)objc_opt_new();
  -[UINavigationController aaui_showActivityIndicator](self->_navigationController, "aaui_showActivityIndicator");
  selectedBeneficiary = self->_selectedBeneficiary;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke;
  v12[3] = &unk_1EA2DC028;
  v12[4] = self;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v9, "sendInvitationToContact:completion:", selectedBeneficiary, v12);

}

void __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2;
  block[3] = &unk_1EA2DC000;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  if (!*(_QWORD *)(v2 + 8))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2_cold_1(v2, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_setupBeneficiary
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  AABeneficiaryInfo *selectedBeneficiary;
  NSString *setupAuthToken;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "%@ : Creating Beneficiary...", buf, 0xCu);

  }
  v6 = objc_alloc(MEMORY[0x1E0D00198]);
  v7 = (void *)objc_msgSend(v6, "initWithBundleInformation:manifestOptions:", MEMORY[0x1E0C9AA60], 1);
  v8 = (void *)objc_opt_new();
  -[AAUIOBWelcomeController primaryButton](self->_shareDataVC, "primaryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 0);

  -[UINavigationController aaui_showActivityIndicator](self->_navigationController, "aaui_showActivityIndicator");
  selectedBeneficiary = self->_selectedBeneficiary;
  setupAuthToken = self->_setupAuthToken;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke;
  v12[3] = &unk_1EA2DCF80;
  v12[4] = self;
  objc_msgSend(v8, "setupBeneficiaryManifest:contactInfo:setupAuthToken:completion:", v7, selectedBeneficiary, setupAuthToken, v12);

}

void __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD block[5];
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "accessKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v7 = a1 + 32;
  objc_msgSend(*(id *)(v8 + 32), "setAccessKey:", v6);

  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_cold_1();

    if (objc_msgSend(v5, "code") == 6)
    {
      objc_msgSend(MEMORY[0x1E0CFAD50], "cannotAddAnExistingBeneficiaryErrorTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CFAD50], "cannotAddAnExistingBeneficiaryErrorMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)v7 + 32), "handle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CFAD50], "setupBeneficiaryErrorTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CFAD50], "setupBeneficiaryErrorMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_88;
    v21[3] = &unk_1EA2DB818;
    v21[4] = *(_QWORD *)v7;
    v22 = v11;
    v23 = v15;
    v18 = v15;
    v19 = v11;
    dispatch_async(MEMORY[0x1E0C80D38], v21);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "%@ : Beneficiary setup successful.", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_89;
    block[3] = &unk_1EA2DB208;
    block[4] = *(_QWORD *)v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_88(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "primaryButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  return objc_msgSend(*(id *)(a1 + 32), "_showAlertWithTitle:message:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_89(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "primaryButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "aaui_hideActivityIndicator");
  return objc_msgSend(*(id *)(a1 + 32), "_showShareAccessKey");
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v7);

  -[AAUIInheritanceSetupFlowController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);

}

- (id)_doneButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__showSetupCompleteWithShareTypePrint);

  return v6;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_shareAccessKeyOptionsViewController, 0);
  objc_storeStrong((id *)&self->_inviteFlowController, 0);
  objc_storeStrong((id *)&self->_shareDataVC, 0);
  objc_storeStrong((id *)&self->_firstTimeSetupVC, 0);
  objc_storeStrong((id *)&self->_setupAuthToken, 0);
  objc_storeStrong((id *)&self->_selectedBeneficiary, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_selectedContact, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

void __69__AAUIInheritanceSetupFlowController__validateAccountWithCompletion___block_invoke_2_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)OUTLINED_FUNCTION_1_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_1DB4ED000, v2, v3, "%@ : Unable to authenticate: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_4();
}

- (void)contactPicker:didSelectContactProperty:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_1DB4ED000, v2, v3, "%@ : Selected Contact with handle - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

- (void)accountContactSelector:didSelectContact:.cold.1()
{
  void *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_9();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1(&dword_1DB4ED000, v3, v4, "%@ : Selected Trusted/Family contact with handle - %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_4();
}

void __70__AAUIInheritanceSetupFlowController_inviteMessageWasSent_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (objc_class *)OUTLINED_FUNCTION_1_2();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "%@ : Failed to notify beneficiary via private IDS channel.", (uint8_t *)&v5, 0xCu);

}

void __55__AAUIInheritanceSetupFlowController__setupBeneficiary__block_invoke_cold_1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  v0 = (objc_class *)OUTLINED_FUNCTION_1_2();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_1DB4ED000, v2, v3, "%@ : Error setting up beneficiary: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_4();
}

@end
