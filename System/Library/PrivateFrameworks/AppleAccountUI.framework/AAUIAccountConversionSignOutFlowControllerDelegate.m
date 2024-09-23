@implementation AAUIAccountConversionSignOutFlowControllerDelegate

- (AAUIAccountConversionSignOutFlowControllerDelegate)init
{
  AAUIAccountConversionSignOutFlowControllerDelegate *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIAccountConversionSignOutFlowControllerDelegate;
  v2 = -[AAUIAccountConversionSignOutFlowControllerDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v2->_shouldRemoveAppleAccount = 1;
  }
  return v2;
}

- (AAUIAccountConversionSignOutFlowControllerDelegate)initWithPresentingViewController:(id)a3 shouldRemoveAppleAccount:(BOOL)a4
{
  id v6;
  AAUIAccountConversionSignOutFlowControllerDelegate *v7;
  ACAccountStore *v8;
  ACAccountStore *accountStore;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAUIAccountConversionSignOutFlowControllerDelegate;
  v7 = -[AAUIAccountConversionSignOutFlowControllerDelegate init](&v11, sel_init);
  if (v7)
  {
    v8 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v7->_accountStore;
    v7->_accountStore = v8;

    objc_storeWeak((id *)&v7->_presentingViewController, v6);
    v7->_shouldRemoveAppleAccount = a4;
  }

  return v7;
}

- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  UIViewController **p_presentingViewController;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  p_presentingViewController = &self->_presentingViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3450];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __114__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke;
    v19[3] = &unk_1EA2DB0E8;
    v20 = v11;
    objc_msgSend(v16, "alertWithTitle:message:buttonTitle:actionHandler:", v9, v10, v15, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained((id *)p_presentingViewController);
    objc_msgSend(v18, "presentViewController:animated:completion:", v17, 1, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

uint64_t __114__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Account Conversion - Attempting to disableFindMyDevice for %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke;
  v12[3] = &unk_1EA2DC098;
  v13 = v7;
  v14 = v8;
  v12[4] = self;
  v10 = v7;
  v11 = v8;
  -[AAUIAccountConversionSignOutFlowControllerDelegate _completedRestoreFromiCloud:](self, "_completedRestoreFromiCloud:", v12);

}

void __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Device is restoring from iCloud but allowing account removal anyways", buf, 2u);
    }

  }
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Account Conversion - Starting to refresh current FMIP state...", buf, 2u);
  }

  +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_31;
  v12[3] = &unk_1EA2DC070;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v14 = v9;
  v12[4] = v10;
  v13 = v11;
  objc_msgSend(v8, "refreshCurrentState:", v12);

}

void __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = a2;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Account Conversion - FMIP state came back as %lu", buf, 0xCu);
  }

  +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStateKnown");

  if ((v6 & 1) == 0)
  {
    _AAUILogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Account Conversion - FMiP state is unknown, stopping converison.", buf, 2u);
    }

    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -11);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, WeakRetained);
    goto LABEL_17;
  }
  +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabled");

  if ((v8 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    if (WeakRetained)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_33;
      v18[3] = &unk_1EA2DBC90;
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v10, "_disableDeviceLocatorForAccount:inViewController:completion:", v11, WeakRetained, v18);
      v12 = v19;
    }
    else
    {
      _AAUILogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "Account Conversion - No view controller provided for sign out, unable to disable FMiP.", buf, 2u);
      }

      v17 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v12);
    }

LABEL_17:
    return;
  }
  _AAUILogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Account Conversion - Device locator not enabled, allowing account removal.", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __117__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Device locator disabled with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_disableDeviceLocatorForAccount:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke;
  v9[3] = &unk_1EA2DC0E8;
  v10 = v7;
  v8 = v7;
  +[AAUIDeviceLocatorConfirmationUtilities showDisableAlertForAccount:presentingViewController:withCompletion:](AAUIDeviceLocatorConfirmationUtilities, "showDisableAlertForAccount:presentingViewController:withCompletion:", a3, a4, v9);

}

void __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v5 = a3;
  if (a2)
  {
    _AAUILogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - User canceled FMiP password prompt.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_41;
    v8[3] = &unk_1EA2DC0C0;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "disableInContext:withWipeToken:completion:", 2, v5, v8);

  }
}

void __114__AAUIAccountConversionSignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_41(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Account Conversion - Failed to disable FMiP for account deletion.", buf, 2u);
    }

    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Account Conversion - Successfully disabled FMiP for account deletion!", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _BOOL4 shouldRemoveAppleAccount;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  AAUIAccountConversionSignOutFlowControllerDelegate *v14;
  id v15;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  shouldRemoveAppleAccount = self->_shouldRemoveAppleAccount;
  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (shouldRemoveAppleAccount)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v11, OS_LOG_TYPE_DEFAULT, "Account Conversion - Removing Apple Account", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke;
    block[3] = &unk_1EA2DC000;
    v13 = v7;
    v14 = self;
    v15 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountConversionSignOutFlowControllerDelegate signOutFlowController:signOutAccount:completion:].cold.1(v11);

    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }

}

void __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke(uint64_t a1)
{
  AAUISignOutController *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v2 = -[AAUISignOutController initWithAccount:]([AAUISignOutController alloc], "initWithAccount:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutController _setDataclassOptions:](v2, "_setDataclassOptions:", v3);

  -[AAUISignOutController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2;
  block[3] = &unk_1EA2DC000;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  dispatch_async(v4, block);

}

void __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Account Conversion - Attempting to sign out account %@ with no dataclass actions.", buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_46;
  v7[3] = &unk_1EA2DBC90;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "removeAccount:withDataclassActions:completion:", v4, v6, v7);

}

void __102__AAUIAccountConversionSignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_46(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Removal of account completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;

  v5 = (void (**)(id, uint64_t, _QWORD))a5;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AAUIAccountConversionSignOutFlowControllerDelegate signOutFlowController:performWalrusValidationForAccount:completion:].cold.1(v6);

  v5[2](v5, 1, 0);
}

- (void)signOutControllerDidCancel:(id)a3
{
  void (**pendingSignOutCompletion)(id, _QWORD, void *);
  void *v5;
  id v6;

  pendingSignOutCompletion = (void (**)(id, _QWORD, void *))self->_pendingSignOutCompletion;
  if (pendingSignOutCompletion)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    pendingSignOutCompletion[2](pendingSignOutCompletion, 0, v5);

    v6 = self->_pendingSignOutCompletion;
    self->_pendingSignOutCompletion = 0;

  }
}

- (void)signOutController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  void (**pendingSignOutCompletion)(id, BOOL, id);
  id v7;

  pendingSignOutCompletion = (void (**)(id, BOOL, id))self->_pendingSignOutCompletion;
  if (pendingSignOutCompletion)
  {
    pendingSignOutCompletion[2](pendingSignOutCompletion, a4, a5);
    v7 = self->_pendingSignOutCompletion;
    self->_pendingSignOutCompletion = 0;

  }
}

- (void)_completedRestoreFromiCloud:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint8_t buf[4];
  os_signpost_id_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AAUISignpostLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = _AAUISignpostCreate(v4);
  v7 = v6;

  _AAUISignpostLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SignOutRestoreBackupCheck", " enableTelemetry=YES ", buf, 2u);
  }

  _AAUISignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v5;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: SignOutRestoreBackupCheck  enableTelemetry=YES ", buf, 0xCu);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0D4E0A8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__AAUIAccountConversionSignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke;
  v13[3] = &unk_1EA2DC110;
  v15 = v5;
  v16 = v7;
  v14 = v3;
  v12 = v3;
  objc_msgSend(v11, "fetchiCloudRestoreIsCompleteWithCompletion:", v13);

}

void __82__AAUIAccountConversionSignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  unint64_t Nanoseconds;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  int v13;
  int v14;
  _BYTE v15[10];
  double v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  Nanoseconds = _AAUISignpostGetNanoseconds(a1[5], a1[6]);
  _AAUISignpostLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v14 = 67240448;
    *(_DWORD *)v15 = a2;
    *(_WORD *)&v15[4] = 1026;
    *(_DWORD *)&v15[6] = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_1DB4ED000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SignOutRestoreBackupCheck", " RestoreIsComplete=%{public,signpost.telemetry:number1,name=RestoreIsComplete}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0xEu);
  }

  _AAUISignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (double)Nanoseconds / 1000000000.0;
    v12 = a1[5];
    v13 = objc_msgSend(v5, "code");
    v14 = 134218752;
    *(_QWORD *)v15 = v12;
    *(_WORD *)&v15[8] = 2048;
    v16 = v11;
    v17 = 1026;
    v18 = a2;
    v19 = 1026;
    v20 = v13;
    _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: SignOutRestoreBackupCheck  RestoreIsComplete=%{public,signpost.telemetry:number1,name=RestoreIsComplete}d  Error=%{public,signpost.telemetry:number2,name=Error}d ", (uint8_t *)&v14, 0x22u);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong(&self->_pendingSignOutCompletion, 0);
}

- (void)signOutFlowController:(os_log_t)log signOutAccount:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Account Conversion - Hook requested to not remove Apple Account, skipping removal of Apple Account and returning success.", v1, 2u);
}

- (void)signOutFlowController:(os_log_t)log performWalrusValidationForAccount:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "Account Conversion - User was asked to remove ADP already this will cause a problem if not", v1, 2u);
}

@end
