@implementation AAUISignInFlowControllerDelegate

- (AAUISignInFlowControllerDelegate)init
{
  AAUISignInFlowControllerDelegate *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUISignInFlowControllerDelegate;
  v2 = -[AAUISignInFlowControllerDelegate init](&v6, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

  }
  return v2;
}

- (AAUISignInFlowControllerDelegate)initWithPresentingViewController:(id)a3
{
  id v4;
  AAUISignInFlowControllerDelegate *v5;
  ACAccountStore *v6;
  ACAccountStore *accountStore;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUISignInFlowControllerDelegate;
  v5 = -[AAUISignInFlowControllerDelegate init](&v9, sel_init);
  if (v5)
  {
    v6 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v5->_accountStore;
    v5->_accountStore = v6;

    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v5;
}

- (BOOL)parentViewControllerPresentsErrorAlert
{
  id WeakRetained;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)signInFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
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
    v19[2] = __95__AAUISignInFlowControllerDelegate_signInFlowController_showAlertWithTitle_message_completion___block_invoke;
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

uint64_t __95__AAUISignInFlowControllerDelegate_signInFlowController_showAlertWithTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signInFlowController:(id)a3 saveAccount:(id)a4 withAllDataclassesEnabledIfPossibleWithCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id pendingEnableDataclassesCompletion;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD *, int);
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  AAUISignInOperationManager *v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (WeakRetained)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__9;
    v39 = __Block_byref_object_dispose__9;
    v40 = -[AAUISignInOperationManager initWithPresentingViewController:]([AAUISignInOperationManager alloc], "initWithPresentingViewController:", WeakRetained);
    objc_msgSend((id)v36[5], "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SAVE_FAILED_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __119__AAUISignInFlowControllerDelegate_signInFlowController_saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke;
    v30 = &unk_1EA2DC7C0;
    v33 = v10;
    v14 = v9;
    v31 = v14;
    v15 = v13;
    v32 = v15;
    v34 = &v35;
    v16 = _Block_copy(&v27);
    pendingEnableDataclassesCompletion = self->_pendingEnableDataclassesCompletion;
    self->_pendingEnableDataclassesCompletion = v16;

    objc_msgSend((id)v36[5], "signInAccount:enablingDataclasses:", v14, 1, v27, v28, v29, v30);
    _Block_object_dispose(&v35, 8);

  }
  else
  {
    _AAUILogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AAUISignInFlowControllerDelegate signInFlowController:saveAccount:withAllDataclassesEnabledIfPossibleWithCompletion:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB90], -8005, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v26);

  }
}

void __119__AAUISignInFlowControllerDelegate_signInFlowController_saveAccount_withAllDataclassesEnabledIfPossibleWithCompletion___block_invoke(_QWORD *a1, int a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v3 = a1[5];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB90], -8004, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v5 + 16))(v5, 0, 0, v6);

  }
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5
{
  void (**pendingEnableDataclassesCompletion)(id, BOOL, id, id);
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  pendingEnableDataclassesCompletion = (void (**)(id, BOOL, id, id))self->_pendingEnableDataclassesCompletion;
  if (pendingEnableDataclassesCompletion)
  {
    pendingEnableDataclassesCompletion[2](pendingEnableDataclassesCompletion, a4 != 0, a4, a5);
    v7 = self->_pendingEnableDataclassesCompletion;
    self->_pendingEnableDataclassesCompletion = 0;

  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAUISignInFlowControllerDelegate signInOperationManager:didSaveAccount:error:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

- (void)signInFlowController:(id)a3 enableFindMyWithAction:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke;
  v9[3] = &unk_1EA2DC838;
  v10 = v7;
  v11 = a4;
  v8 = v7;
  -[AAUISignInFlowControllerDelegate _hasActivationLockSupportedWatchWithCompletion:](self, "_hasActivationLockSupportedWatchWithCompletion:", v9);

}

void __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD aBlock[4];
  id v11;
  char v12;

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_2;
  aBlock[3] = &unk_1EA2DC7E8;
  v12 = a2;
  v11 = *(id *)(a1 + 32);
  v4 = _Block_copy(aBlock);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_43;
  v7[3] = &unk_1EA2DC810;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1DB4ED000, v2, OS_LOG_TYPE_DEFAULT, "Enabling FindMy for newly added account, hasWatch: %{public}@.", (uint8_t *)&v7, 0xCu);
  }

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userNotifiedOfActivationLockForAllPairedDevices");

  }
  +[AAUIDeviceLocatorService sharedInstance](AAUIDeviceLocatorService, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableInContext:", 3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__AAUISignInFlowControllerDelegate_signInFlowController_enableFindMyWithAction_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_hasActivationLockSupportedWatchWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[5];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke;
  aBlock[3] = &unk_1EA2DC5B8;
  v6 = v4;
  aBlock[4] = self;
  v15 = v6;
  v7 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActivePairedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("02168E84-5DD8-4B19-9204-A79F04B33A32"));
  v11 = objc_msgSend(v9, "supportsCapability:", v10);

  if (v11)
  {
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke_2;
    v12[3] = &unk_1EA2DC5E0;
    v13 = v7;
    +[AAUIDeviceLocatorConfirmationUtilities checkIfWatchHasAppleIDAccount:](AAUIDeviceLocatorConfirmationUtilities, "checkIfWatchHasAppleIDAccount:", v12);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v7 + 2))(v7, 0);
  }

}

void __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  __CFString *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a2)
    {
      v4 = CFSTR("DEVICE_LOCATOR_MESSAGE_WATCH");
      if ((objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE_WATCH"), "containsString:", CFSTR("REBRAND")) & 1) != 0
        || !_os_feature_enabled_impl())
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE_WATCH"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v5 = 1;
      }
      objc_msgSend(v11, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 1, v8);

      if ((v5 & 1) == 0)
        goto LABEL_16;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0DC3708];
      v4 = CFSTR("DEVICE_LOCATOR_MESSAGE");
      if ((objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
        || !_os_feature_enabled_impl())
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(CFSTR("DEVICE_LOCATOR_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v7 = 1;
      }
      objc_msgSend(v6, "modelSpecificLocalizedStringKeyForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_1EA2E2A18, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v10);

      if (!v7)
        goto LABEL_16;
    }

LABEL_16:
  }
}

uint64_t __83__AAUISignInFlowControllerDelegate__hasActivationLockSupportedWatchWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signInFlowController:(id)a3 presentGenericTermsUIForAccount:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  id pendingTermsCompletion;
  id v13;
  char isKindOfClass;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  AAUIGenericTermsRemoteUI *v20;
  AAUIGenericTermsRemoteUI *v21;
  ACAccountStore *accountStore;
  void *v23;
  AAUIGenericTermsRemoteUI *v24;
  AAUIGenericTermsRemoteUI *genericTermsRemoteUI;
  void *v26;
  AAUIGenericTermsRemoteUI *v27;

  v7 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained)
  {
    if (self->_pendingTermsCompletion)
    {
      _AAUILogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[AAUISignInFlowControllerDelegate signInFlowController:presentGenericTermsUIForAccount:completion:].cold.1(v10);

    }
    v11 = _Block_copy(v8);
    pendingTermsCompletion = self->_pendingTermsCompletion;
    self->_pendingTermsCompletion = v11;

    v13 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v15 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    v16 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "topViewController");
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
    -[AAUISignInFlowControllerDelegate requiredTerms](self, "requiredTerms");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    v20 = [AAUIGenericTermsRemoteUI alloc];
    v21 = v20;
    accountStore = self->_accountStore;
    if (v19)
    {
      -[AAUISignInFlowControllerDelegate requiredTerms](self, "requiredTerms");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[AAUIGenericTermsRemoteUI initWithAccount:inStore:termsEntries:](v21, "initWithAccount:inStore:termsEntries:", v7, accountStore, v23);
      genericTermsRemoteUI = self->_genericTermsRemoteUI;
      self->_genericTermsRemoteUI = v24;

    }
    else
    {
      v27 = -[AAUIGenericTermsRemoteUI initWithAccount:inStore:](v20, "initWithAccount:inStore:", v7, self->_accountStore);
      v23 = self->_genericTermsRemoteUI;
      self->_genericTermsRemoteUI = v27;
    }

    -[AAUIGenericTermsRemoteUI setDelegate:](self->_genericTermsRemoteUI, "setDelegate:", self);
    -[AAUIGenericTermsRemoteUI presentFromViewController:modal:](self->_genericTermsRemoteUI, "presentFromViewController:modal:", v16, 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB90], -8005, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v26);

  }
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4 serverInfo:(id)a5
{
  id v8;
  id v9;
  AAUIGenericTermsRemoteUI *genericTermsRemoteUI;
  id pendingTermsCompletion;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  genericTermsRemoteUI = self->_genericTermsRemoteUI;
  self->_genericTermsRemoteUI = 0;

  pendingTermsCompletion = self->_pendingTermsCompletion;
  if (pendingTermsCompletion)
  {
    v12 = (uint64_t)_Block_copy(pendingTermsCompletion);
    v13 = self->_pendingTermsCompletion;
    self->_pendingTermsCompletion = 0;

    if (a4)
    {
      objc_msgSend(v8, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "_aa_setTermsServerInfo:", v9);
      objc_msgSend(v8, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v12 + 16))(v12, 1, v15, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFAB90], -8006, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, v14);
    }

  }
  else
  {
    _AAUILogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
      -[AAUISignInFlowControllerDelegate genericTermsRemoteUI:didFinishWithSuccess:serverInfo:].cold.1((uint64_t)self, v12);
  }

}

- (void)signInFlowController:(id)a3 presentProgressViewForAccount:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  _QWORD v35[5];
  id v36;
  void (**v37)(id, uint64_t);
  _QWORD v38[5];
  id v39;
  void (**v40)(id, uint64_t);
  _QWORD aBlock[4];
  id v42;
  AAUISignInFlowControllerDelegate *v43;

  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (!-[AAUISignInFlowControllerDelegate wasProgressViewAlreadyPresented](self, "wasProgressViewAlreadyPresented"))
  {
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke;
    aBlock[3] = &unk_1EA2DC860;
    v17 = v7;
    v42 = v17;
    v43 = self;
    v18 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[AAUISignInFlowControllerDelegate presentingViewController](self, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[AAUISignInFlowControllerDelegate presentingViewController](self, "presentingViewController");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    if (v21)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v18[2](v18);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pushViewController:animated:", v32, 0);

        _AAUILogSystem();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:].cold.4();

        if (v8)
          v8[2](v8, 1);
        goto LABEL_25;
      }
      _AAUILogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:].cold.3((uint64_t)self, v22, v23, v24, v25, v26, v27, v28);

      v18[2](v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v16;
      v38[1] = 3221225472;
      v38[2] = __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_71;
      v38[3] = &unk_1EA2DC000;
      v38[4] = self;
      v39 = v17;
      v40 = v8;
      objc_msgSend(v21, "pushViewController:completion:", v29, v38);

      v30 = v39;
    }
    else
    {
      if (!v19)
      {
        _AAUILogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:].cold.2();

        if (v8)
          v8[2](v8, 0);
        goto LABEL_25;
      }
      v18[2](v18);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v16;
      v35[1] = 3221225472;
      v35[2] = __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_72;
      v35[3] = &unk_1EA2DC000;
      v35[4] = self;
      v36 = v17;
      v37 = v8;
      objc_msgSend(v19, "presentViewController:animated:completion:", v31, 1, v35);

      v30 = v36;
    }

LABEL_25:
    goto LABEL_26;
  }
  _AAUILogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AAUISignInFlowControllerDelegate signInFlowController:presentProgressViewForAccount:completion:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);

  if (v8)
    v8[2](v8, 0);
LABEL_26:

}

id __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  __CFString *v2;
  NSObject *v3;
  id v4;

  v1 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "aa_fullName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    _AAUILogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_cold_1();

    v2 = &stru_1EA2E2A18;
  }
  v4 = +[AAUISpinnerViewController newSignInProgressViewWithFullName:forAccount:](AAUISpinnerViewController, "newSignInProgressViewWithFullName:forAccount:", v2, *v1);

  return v4;
}

uint64_t __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_71(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_71_cold_1();

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_72_cold_1();

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (CDPContext)cdpContext
{
  return self->cdpContext;
}

- (void)setCdpContext:(id)a3
{
  objc_storeStrong((id *)&self->cdpContext, a3);
}

- (BOOL)skipCDPEnablement
{
  return self->skipCDPEnablement;
}

- (void)setSkipCDPEnablement:(BOOL)a3
{
  self->skipCDPEnablement = a3;
}

- (BOOL)backgroundDataclassEnablement
{
  return self->backgroundDataclassEnablement;
}

- (void)setBackgroundDataclassEnablement:(BOOL)a3
{
  self->backgroundDataclassEnablement = a3;
}

- (BOOL)skipDataclassEnablement
{
  return self->skipDataclassEnablement;
}

- (void)setSkipDataclassEnablement:(BOOL)a3
{
  self->skipDataclassEnablement = a3;
}

- (NSSet)requiredTerms
{
  return self->requiredTerms;
}

- (void)setRequiredTerms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldStashLoginResponse
{
  return self->shouldStashLoginResponse;
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  self->shouldStashLoginResponse = a3;
}

- (unint64_t)findMyActivationAction
{
  return self->findMyActivationAction;
}

- (void)setFindMyActivationAction:(unint64_t)a3
{
  self->findMyActivationAction = a3;
}

- (BOOL)isFastSignInEnabled
{
  return self->fastSignInEnabled;
}

- (void)setFastSignInEnabled:(BOOL)a3
{
  self->fastSignInEnabled = a3;
}

- (BOOL)newSignInReauth
{
  return self->newSignInReauth;
}

- (void)setNewSignInReauth:(BOOL)a3
{
  self->newSignInReauth = a3;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (BOOL)wasProgressViewAlreadyPresented
{
  return self->_progressViewAlreadyPresented;
}

- (void)setProgressViewAlreadyPresented:(BOOL)a3
{
  self->_progressViewAlreadyPresented = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->requiredTerms, 0);
  objc_storeStrong((id *)&self->cdpContext, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_genericTermsRemoteUI, 0);
  objc_storeStrong(&self->_pendingTermsCompletion, 0);
  objc_storeStrong(&self->_pendingEnableDataclassesCompletion, 0);
}

- (void)signInFlowController:(uint64_t)a3 saveAccount:(uint64_t)a4 withAllDataclassesEnabledIfPossibleWithCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Attempt to save without a valid presenting view controller!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInOperationManager:(uint64_t)a3 didSaveAccount:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Sign in operation manager completed without a callback!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)signInFlowController:(os_log_t)log presentGenericTermsUIForAccount:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_FAULT, "A pending completion for showing terms already exists and we are about to overwrite it!", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)genericTermsRemoteUI:(uint64_t)a1 didFinishWithSuccess:(NSObject *)a2 serverInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_FAULT, "Terms completion for %@ is nil. This should never occur.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)signInFlowController:(uint64_t)a3 presentProgressViewForAccount:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "%@: Progress view is already presented, skipping new presentation", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)signInFlowController:presentProgressViewForAccount:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1DB4ED000, v0, v1, "%@: Unable to present progress view for account (%@) with nil presentingViewController");
  OUTLINED_FUNCTION_4();
}

- (void)signInFlowController:(uint64_t)a3 presentProgressViewForAccount:(uint64_t)a4 completion:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1DB4ED000, a2, a3, "%@: Calling BFF-specific push method", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)signInFlowController:presentProgressViewForAccount:completion:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_1DB4ED000, v0, (uint64_t)v0, "%@: Pushed progress view for account (%@) on navigation stack", v1);
  OUTLINED_FUNCTION_4();
}

void __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_0_2(&dword_1DB4ED000, v0, v1, "%@: Unable to retrieve full name from account (%@) for progress view");
  OUTLINED_FUNCTION_4();
}

void __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_71_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_1DB4ED000, v0, v1, "%@: Pushed progress view for account (%@) on navigation stack", v2);
  OUTLINED_FUNCTION_4();
}

void __98__AAUISignInFlowControllerDelegate_signInFlowController_presentProgressViewForAccount_completion___block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_1(&dword_1DB4ED000, v0, v1, "%@: Presented progress view for account (%@) modally", v2);
  OUTLINED_FUNCTION_4();
}

@end
