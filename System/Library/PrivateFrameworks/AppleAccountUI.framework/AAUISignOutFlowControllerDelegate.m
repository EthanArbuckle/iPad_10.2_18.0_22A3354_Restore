@implementation AAUISignOutFlowControllerDelegate

- (AAUISignOutFlowControllerDelegate)init
{
  AAUISignOutFlowControllerDelegate *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  void *v5;
  uint64_t v6;
  NSString *telemetryFlowID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AAUISignOutFlowControllerDelegate;
  v2 = -[AAUISignOutFlowControllerDelegate init](&v9, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = objc_claimAutoreleasedReturnValue();
  telemetryFlowID = v2->_telemetryFlowID;
  v2->_telemetryFlowID = (NSString *)v6;

  return v2;
}

- (AAUISignOutFlowControllerDelegate)initWithPresentingViewController:(id)a3
{
  id v4;
  AAUISignOutFlowControllerDelegate *v5;
  ACAccountStore *v6;
  ACAccountStore *accountStore;
  void *v8;
  uint64_t v9;
  NSString *telemetryFlowID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAUISignOutFlowControllerDelegate;
  v5 = -[AAUISignOutFlowControllerDelegate init](&v12, sel_init);
  if (v5)
  {
    v6 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v5->_accountStore;
    v5->_accountStore = v6;

    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    telemetryFlowID = v5->_telemetryFlowID;
    v5->_telemetryFlowID = (NSString *)v9;

  }
  return v5;
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
    v19[2] = __97__AAUISignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke;
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

uint64_t __97__AAUISignOutFlowControllerDelegate_signOutFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to disableFindMyDevice for %@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke;
  v12[3] = &unk_1EA2DC098;
  v13 = v7;
  v14 = v8;
  v12[4] = self;
  v10 = v7;
  v11 = v8;
  -[AAUISignOutFlowControllerDelegate _completedRestoreFromiCloud:](self, "_completedRestoreFromiCloud:", v12);

}

void __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Starting to refresh current FMIP state...", buf, 2u);
    }

    +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_33;
    v12[3] = &unk_1EA2DC070;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v14 = v7;
    v12[4] = v8;
    v13 = v9;
    objc_msgSend(v6, "refreshCurrentState:", v12);

    v10 = v14;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Device is restoring from iCloud, not allowing account removal!", buf, 2u);
    }

    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v10);
  }

}

void __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_33(uint64_t a1, uint64_t a2)
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
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "FMIP state came back as %lu", buf, 0xCu);
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
      _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "FMiP state is unknown, so not allowing account removal!", buf, 2u);
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
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    if (WeakRetained)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_34;
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
        _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "No view controller provided for sign out, unable to disable FMiP!", buf, 2u);
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
    _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Device locator not enabled, allowing account removal!", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __100__AAUISignOutFlowControllerDelegate_signOutFlowController_disableFindMyDeviceForAccount_completion___block_invoke_34(uint64_t a1, int a2, void *a3)
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
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Device locator disabled with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_disableDeviceLocatorForAccount:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AAUISignOutFlowControllerDelegate telemetryFlowID](self, "telemetryFlowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke;
  v13[3] = &unk_1EA2DC0E8;
  v14 = v8;
  v12 = v8;
  +[AAUIDeviceLocatorConfirmationUtilities showDisableAlertForAccount:presentingViewController:telemetryFlowID:withCompletion:](AAUIDeviceLocatorConfirmationUtilities, "showDisableAlertForAccount:presentingViewController:telemetryFlowID:withCompletion:", v10, v9, v11, v13);

}

void __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
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
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "User canceled FMiP password prompt.", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_42;
    v8[3] = &unk_1EA2DC0C0;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "disableInContext:withWipeToken:completion:", 2, v5, v8);

  }
}

void __97__AAUISignOutFlowControllerDelegate__disableDeviceLocatorForAccount_inViewController_completion___block_invoke_42(uint64_t a1, int a2)
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
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Failed to disable FMiP for account deletion.", buf, 2u);
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
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Successfully disabled FMiP for account deletion!", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  AAUISignOutController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id WeakRetained;
  AAUISignOutController *v14;
  id v15;
  _QWORD v16[5];
  AAUISignOutController *v17;
  id v18;

  v7 = a5;
  v8 = a4;
  v9 = -[AAUISignOutController initWithAccount:]([AAUISignOutController alloc], "initWithAccount:", v8);

  -[AAUISignOutFlowControllerDelegate telemetryFlowID](self, "telemetryFlowID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutController setTelemetryFlowID:](v9, "setTelemetryFlowID:", v10);

  -[AAUISignOutController setDelegate:](v9, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12 == 1)
  {
    -[AAUISignOutController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
    -[AAUISignOutController setModalTransitionStyle:](v9, "setModalTransitionStyle:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke;
  v16[3] = &unk_1EA2DD330;
  v17 = v9;
  v18 = v7;
  v16[4] = self;
  v14 = v9;
  v15 = v7;
  -[AAUISignOutController prepareInViewController:completion:](v14, "prepareInViewController:completion:", WeakRetained, v16);

}

void __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;

  v5 = a3;
  if (a2)
  {
    v6 = _Block_copy(*(const void **)(a1 + 48));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(_QWORD *)(v7 + 8) = v6;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2;
    v17[3] = &unk_1EA2DB778;
    v9 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
  else
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_cold_1((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  AAUISignOutFlowControllerDelegate *v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0CF0E68];
  objc_msgSend(v9, "aida_alternateDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutFlowControllerDelegate telemetryFlowID](self, "telemetryFlowID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "analyticsEventWithName:altDSID:flowID:", *MEMORY[0x1E0CFADA8], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0D15788]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke;
  v19[3] = &unk_1EA2DD380;
  objc_copyWeak(&v24, &location);
  v16 = v14;
  v20 = v16;
  v17 = v10;
  v23 = v17;
  v18 = v9;
  v21 = v18;
  v22 = self;
  objc_msgSend(v15, "walrusStatusWithCompletion:", v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (**v38)(id, _QWORD, void *);
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D15790]);

  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", a1[4]);

  if (!a2)
  {
    _AAUILogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_2((uint64_t)v5, v23, v24, v25, v26, v27, v28, v29);

    goto LABEL_8;
  }
  if (a2 != 1)
  {
LABEL_8:
    (*((void (**)(void))a1[7] + 2))();
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D15768]);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1[5], "aida_dsid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithLongLong:", objc_msgSend(v11, "longLongValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDsid:", v12);

    objc_msgSend(a1[5], "aida_alternateDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAltDSID:", v13);

    objc_msgSend(a1[5], "appleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAppleID:", v14);

    objc_msgSend(a1[6], "telemetryFlowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTelemetryFlowID:", v15);

    v16 = (void *)MEMORY[0x1E0CF0E68];
    v17 = *MEMORY[0x1E0CFADD8];
    objc_msgSend(a1[5], "aida_alternateDSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "telemetryFlowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "analyticsEventWithName:altDSID:flowID:", v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_52;
    v40[3] = &unk_1EA2DD358;
    objc_copyWeak(&v45, a1 + 8);
    v21 = v20;
    v41 = v21;
    v42 = a1[5];
    v22 = v9;
    v43 = v22;
    v44 = a1[7];
    objc_msgSend(WeakRetained, "_offerManateeRepairWithContext:completion:", v22, v40);

    objc_destroyWeak(&v45);
  }
  else
  {
    _AALogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);

    v38 = (void (**)(id, _QWORD, void *))a1[7];
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2](v38, 0, v39);

  }
LABEL_9:

}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_52(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF0EE0]);
      objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendEvent:", *(_QWORD *)(a1 + 32));

      objc_msgSend(v7, "_performLastDeviceCheckForAccount:withContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      _AALogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CF0EE0]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v18);
      objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendEvent:", *(_QWORD *)(a1 + 32));

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CF0EE0]);
    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v5);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendEvent:", *(_QWORD *)(a1 + 32));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)_performLastDeviceCheckForAccount:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  AAUISignOutFlowControllerDelegate *v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[3];
  char v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AAUISignOutFlowControllerDelegate _performLastDeviceCheckForAccount:withContext:completion:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v18 = objc_alloc_init(MEMORY[0x1E0D15780]);
  v19 = (void *)MEMORY[0x1E0CF0E68];
  objc_msgSend(v8, "aida_alternateDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutFlowControllerDelegate telemetryFlowID](self, "telemetryFlowID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "analyticsEventWithName:altDSID:flowID:", *MEMORY[0x1E0CFADF0], v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke;
  v27[3] = &unk_1EA2DD3D0;
  v23 = v22;
  v28 = v23;
  v24 = v9;
  v29 = v24;
  v30 = self;
  v33 = v34;
  v25 = v8;
  v31 = v25;
  v26 = v10;
  v32 = v26;
  objc_msgSend(v18, "fetchEscrowRecordDevicesWithContext:usingCache:completion:", v24, 0, v27);

  _Block_object_dispose(v34, 8);
}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D157B8]);

  if (objc_msgSend(v5, "count") == 1
    && (objc_msgSend(v5, "firstObject"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isCurrentDevice"),
        v8,
        v9))
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v32 = v11;
      _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Current device is determined to be the last escrow device for context (%@)", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "_recoveryFactorController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_55;
    v25[3] = &unk_1EA2DD3A8;
    v30 = *(_QWORD *)(a1 + 72);
    v26 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 48);
    v27 = v13;
    v28 = v14;
    v29 = *(id *)(a1 + 64);
    objc_msgSend(v12, "availableRecoveryFactorsWithCompletion:", v25);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v6 == 0;
    objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CF0EE0]);

    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v6)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_2(a1, (uint64_t)v6, v17);
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_1(a1, v17, v18, v19, v20, v21, v22, v23);
    }

    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendEvent:", *(_QWORD *)(a1 + 32));

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_55(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int8x16_t v14;
  _QWORD block[4];
  int8x16_t v16;
  id v17;
  unint64_t v18;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v5 == 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CF0EE0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (a2 >> 2) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D157B0]);

  if ((a2 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "aida_alternateDSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "numberOfApprovedRecoveryContactsForAltDSID:", v10);

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D157A8]);

  objc_msgSend(*(id *)(a1 + 32), "populateUnderlyingErrorsStartingWithRootError:", v5);
  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendEvent:", *(_QWORD *)(a1 + 32));

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_2;
  block[3] = &unk_1EA2DB6C0;
  v14 = *(int8x16_t *)(a1 + 40);
  v13 = (id)v14.i64[0];
  v16 = vextq_s8(v14, v14, 8uLL);
  v18 = a2;
  v17 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentLastDeviceAlertForAccount:withRecoveryFactors:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_presentLastDeviceAlertForAccount:(id)a3 withRecoveryFactors:(unint64_t)a4 withCompletion:(id)a5
{
  char v6;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  unint64_t v16;
  void *v17;
  _QWORD *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  AAUISignOutFlowControllerDelegate *v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  AAUISignOutFlowControllerDelegate *v71;
  id v72;
  _QWORD v73[4];
  id v74;
  AAUISignOutFlowControllerDelegate *v75;
  id v76;
  char v77;
  _QWORD v78[4];
  id v79;
  id v80;

  v6 = a4;
  v8 = a3;
  v56 = a5;
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AAUISignOutFlowControllerDelegate _presentLastDeviceAlertForAccount:withRecoveryFactors:withCompletion:].cold.1(v9);

  v10 = (void *)MEMORY[0x1E0CF0E68];
  v11 = *MEMORY[0x1E0CFADF8];
  objc_msgSend(v8, "aida_alternateDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutFlowControllerDelegate telemetryFlowID](self, "telemetryFlowID");
  v64 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "analyticsEventWithName:altDSID:flowID:", v11, v12, v13);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = CFSTR("KEY");
  v60 = v8;
  v16 = v6 & 4;
  if ((v6 & 4) == 0)
    v15 = CFSTR("CONTACT");
  v17 = (void *)MEMORY[0x1E0CB3940];
  if ((v6 & 4) != 0)
    v18 = (_QWORD *)MEMORY[0x1E0CFAEB0];
  else
    v18 = (_QWORD *)MEMORY[0x1E0CFAEA8];
  v19 = v15;
  objc_msgSend(v17, "stringWithFormat:", CFSTR("SIGN_OUT_LAST_DEVICE_RECOVERY_%@_TITLE"), v19);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIGN_OUT_LAST_DEVICE_RECOVERY_%@_MESSAGE"), v19);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIGN_OUT_ADD_RECOVERY_%@_BUTTON"), v19);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObject:", *v18);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", v63, &stru_1EA2E2A18);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", v61, &stru_1EA2E2A18, CFSTR("Localizable"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", v59, &stru_1EA2E2A18, CFSTR("Localizable"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CF0E68];
  v24 = *MEMORY[0x1E0CFAE00];
  objc_msgSend(v8, "aida_alternateDSID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUISignOutFlowControllerDelegate telemetryFlowID](v64, "telemetryFlowID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "analyticsEventWithName:altDSID:flowID:", v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertWithTitle:message:", v58, v57);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_CONFIRMATION_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke;
  v78[3] = &unk_1EA2DD3F8;
  v33 = v27;
  v79 = v33;
  v34 = v56;
  v80 = v34;
  objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 2, v78);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAction:", v35);

  objc_msgSend(v14, "addObject:", *MEMORY[0x1E0CFAEC0]);
  v36 = (void *)MEMORY[0x1E0DC3448];
  v73[0] = v32;
  v73[1] = 3221225472;
  v73[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_2;
  v73[3] = &unk_1EA2DD420;
  v77 = v16 >> 2;
  v37 = v33;
  v74 = v37;
  v75 = v64;
  v38 = v34;
  v76 = v38;
  objc_msgSend(v36, "actionWithTitle:style:handler:", v65, 0, v73);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAction:", v39);

  v40 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_ADD_DATA_RECOVERY_SERVICE_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = MEMORY[0x1E0C809B0];
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_4;
  v69[3] = &unk_1EA2DD448;
  v44 = v37;
  v70 = v44;
  v71 = v64;
  v45 = v38;
  v72 = v45;
  objc_msgSend(v40, "actionWithTitle:style:handler:", v42, 0, v69);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAction:", v46);

  objc_msgSend(v14, "addObject:", *MEMORY[0x1E0CFAEA0]);
  v47 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_CANCEL_BUTTON"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v43;
  v66[1] = 3221225472;
  v66[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_5;
  v66[3] = &unk_1EA2DD3F8;
  v67 = v44;
  v68 = v45;
  v50 = v45;
  v51 = v44;
  objc_msgSend(v47, "actionWithTitle:style:handler:", v49, 1, v66);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addAction:", v52);

  objc_msgSend(v14, "addObject:", *MEMORY[0x1E0CFAEB8]);
  objc_msgSend(v14, "aaf_arrayAsCommaSeperatedString");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setObject:forKeyedSubscript:", v53, *MEMORY[0x1E0D15798]);

  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sendEvent:", v62);

  -[AAUISignOutFlowControllerDelegate presentingViewController](v64, "presentingViewController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "presentViewController:animated:completion:", v28, 1, 0);

}

uint64_t __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEC0], *MEMORY[0x1E0D157A0]);
  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0D157A0];
  if (v2)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEB0], v4);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendEvent:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "_recoveryFactorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_3;
    v12[3] = &unk_1EA2DBC90;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v6, "generateRecoveryKeyWithCompletion:", v12);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEA8], v4);
    objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:", *(_QWORD *)(a1 + 32));

    v8 = _Block_copy(*(const void **)(a1 + 48));
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = v8;

    objc_msgSend(*(id *)(a1 + 40), "_recoveryFactorController");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startAddingRecoveryContact");

  }
}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", 0, a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

  }
  else
  {
    (*(void (**)(_QWORD))(v3 + 16))(*(_QWORD *)(a1 + 32));
  }
}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEA0], *MEMORY[0x1E0D157A0]);
  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:", *(_QWORD *)(a1 + 32));

  v3 = _Block_copy(*(const void **)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

  objc_msgSend(*(id *)(a1 + 40), "_recoveryFactorController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startAddingDataRecoveryService");

}

void __106__AAUISignOutFlowControllerDelegate__presentLastDeviceAlertForAccount_withRecoveryFactors_withCompletion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEB8], *MEMORY[0x1E0D157A0]);
  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendEvent:", *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

}

- (void)_offerManateeRepairWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AAUIManateeStateValidator *v10;
  void *v11;
  AAUIManateeStateValidator *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AAUID2DEncryptionFlowContext contextWithType:altDSID:](AAUID2DEncryptionFlowContext, "contextWithType:altDSID:", 5, v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "telemetryFlowID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTelemetryFlowID:", v9);

  v10 = [AAUIManateeStateValidator alloc];
  -[AAUISignOutFlowControllerDelegate presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AAUIManateeStateValidator initWithFlowContext:withPresentingViewController:](v10, "initWithFlowContext:withPresentingViewController:", v13, v11);

  -[AAUIManateeStateValidator setContext:](v12, "setContext:", v7);
  -[AAUIManateeStateValidator verifyAndRepairManateeWithCompletion:](v12, "verifyAndRepairManateeWithCompletion:", v6);

}

- (id)_recoveryFactorController
{
  AAUIRecoveryFactorController *recoveryFactorController;
  AAUIRecoveryFactorController *v4;
  AIDAAccountManager *accountManager;
  id WeakRetained;
  AAUIRecoveryFactorController *v7;
  AAUIRecoveryFactorController *v8;

  recoveryFactorController = self->_recoveryFactorController;
  if (!recoveryFactorController)
  {
    v4 = [AAUIRecoveryFactorController alloc];
    accountManager = self->_accountManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v7 = -[AAUIRecoveryFactorController initWithAccountManager:presentingViewController:](v4, "initWithAccountManager:presentingViewController:", accountManager, WeakRetained);
    v8 = self->_recoveryFactorController;
    self->_recoveryFactorController = v7;

    -[AAUIRecoveryFactorController setDelegate:](self->_recoveryFactorController, "setDelegate:", self);
    -[AAUIRecoveryFactorController setTelemetryFlowID:](self->_recoveryFactorController, "setTelemetryFlowID:", self->_telemetryFlowID);
    recoveryFactorController = self->_recoveryFactorController;
  }
  return recoveryFactorController;
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

- (void)recoveryFactorController:(id)a3 didFinishAddingRecoveryContactWithError:(id)a4
{
  id v6;
  id v7;
  void (**pendingWalrusValidationCompletion)(id, _QWORD, id);
  void *v9;
  id v10;
  id v11;
  id v12;
  AAUIRecoveryFactorController *recoveryFactorController;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  pendingWalrusValidationCompletion = (void (**)(id, _QWORD, id))self->_pendingWalrusValidationCompletion;
  if (pendingWalrusValidationCompletion)
  {
    if (v7)
    {
      pendingWalrusValidationCompletion[2](pendingWalrusValidationCompletion, 0, v7);
    }
    else
    {
      v9 = _Block_copy(pendingWalrusValidationCompletion);
      v10 = objc_alloc_init(MEMORY[0x1E0D15788]);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __102__AAUISignOutFlowControllerDelegate_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke;
      v14[3] = &unk_1EA2DD470;
      v15 = v9;
      v11 = v9;
      objc_msgSend(v10, "walrusStatusWithCompletion:", v14);

    }
    v12 = self->_pendingWalrusValidationCompletion;
    self->_pendingWalrusValidationCompletion = 0;

    recoveryFactorController = self->_recoveryFactorController;
    self->_recoveryFactorController = 0;

  }
}

void __102__AAUISignOutFlowControllerDelegate_recoveryFactorController_didFinishAddingRecoveryContactWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:underlyingError:", v4, a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);

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
  v13[2] = __65__AAUISignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke;
  v13[3] = &unk_1EA2DC110;
  v15 = v5;
  v16 = v7;
  v14 = v3;
  v12 = v3;
  objc_msgSend(v11, "fetchiCloudRestoreIsCompleteWithCompletion:", v13);

}

void __65__AAUISignOutFlowControllerDelegate__completedRestoreFromiCloud___block_invoke(_QWORD *a1, int a2, void *a3)
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

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong(&self->_pendingWalrusValidationCompletion, 0);
  objc_storeStrong((id *)&self->_recoveryFactorController, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong(&self->_pendingSignOutCompletion, 0);
}

void __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Sign out preparation failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "AAUISignOutFlowControllerDelegate has been deallocated, failing sign out", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __104__AAUISignOutFlowControllerDelegate_signOutFlowController_performWalrusValidationForAccount_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, a2, a3, "Failed to determine walrus status, but not blocking sign out: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_performLastDeviceCheckForAccount:(uint64_t)a3 withContext:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "Performing last device check with context: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "Determined that the current device is not the last escrow device for context (%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __94__AAUISignOutFlowControllerDelegate__performLastDeviceCheckForAccount_withContext_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "Failed to fetch escrow record devices with context (%@), failing validation: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)_presentLastDeviceAlertForAccount:(os_log_t)log withRecoveryFactors:withCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "Presenting warning to walrus user for signing out of last circle device", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
