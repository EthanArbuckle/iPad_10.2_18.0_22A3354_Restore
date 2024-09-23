@implementation SFPasswordSavingRemoteViewController

+ (id)passwordServiceViewControllerName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE77EEF8);
}

- (void)performUpgradeToSignInWithAppleForCredential:(id)a3 serviceIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (objc_class *)MEMORY[0x1E0C925A8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "password");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v9, "initWithUser:password:extension:serviceIdentifier:userInfo:", v10, v11, 0, v7, 0);
  -[SFPasswordSavingRemoteViewController _accountAuthenticationModificationController](self, "_accountAuthenticationModificationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performRequest:", v13);

}

- (void)performUpgradeToStrongPasswordForCredential:(id)a3 serviceIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (objc_class *)MEMORY[0x1E0C925B0];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "password");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v9, "initWithUser:password:extension:serviceIdentifier:userInfo:", v10, v11, 0, v7, 0);
  -[SFPasswordSavingRemoteViewController _accountAuthenticationModificationController](self, "_accountAuthenticationModificationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "performRequest:", v13);

}

- (id)_accountAuthenticationModificationController
{
  ASAccountAuthenticationModificationController *accountAuthenticationModificationController;
  ASAccountAuthenticationModificationController *v4;
  ASAccountAuthenticationModificationController *v5;

  accountAuthenticationModificationController = self->_accountAuthenticationModificationController;
  if (!accountAuthenticationModificationController)
  {
    v4 = (ASAccountAuthenticationModificationController *)objc_alloc_init(MEMORY[0x1E0C925A0]);
    v5 = self->_accountAuthenticationModificationController;
    self->_accountAuthenticationModificationController = v4;

    -[ASAccountAuthenticationModificationController setDelegate:](self->_accountAuthenticationModificationController, "setDelegate:", self);
    -[ASAccountAuthenticationModificationController setPresentationContextProvider:](self->_accountAuthenticationModificationController, "setPresentationContextProvider:", self);
    accountAuthenticationModificationController = self->_accountAuthenticationModificationController;
  }
  return accountAuthenticationModificationController;
}

- (void)accountAuthenticationModificationController:(id)a3 didSuccessfullyCompleteRequest:(id)a4 withUserInfo:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      objc_msgSend(v6, "serviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v23 = v10;
      _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_INFO, "Completed Sign in with Apple upgrade for %{private}@", buf, 0xCu);

    }
    -[SFPasswordRemoteViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteViewControllerWillDismiss:", self);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC3450];
    v14 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", 0, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __128__SFPasswordSavingRemoteViewController_accountAuthenticationModificationController_didSuccessfullyCompleteRequest_withUserInfo___block_invoke;
    v21[3] = &unk_1E4AC0010;
    v21[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v20);

    -[SFPasswordSavingRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
LABEL_7:

  }
}

void __128__SFPasswordSavingRemoteViewController_accountAuthenticationModificationController_didSuccessfullyCompleteRequest_withUserInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerWillDismiss:", *(_QWORD *)(a1 + 32));

}

- (void)accountAuthenticationModificationController:(id)a3 didFailRequest:(id)a4 withError:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  if (objc_msgSend(a5, "code", a3, a4) == 1)
  {
    -[SFPasswordRemoteViewController delegate](self, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteViewControllerWillDismiss:", self);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3450];
    v7 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", 0, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __109__SFPasswordSavingRemoteViewController_accountAuthenticationModificationController_didFailRequest_withError___block_invoke;
    v15[3] = &unk_1E4AC0010;
    v15[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v13);

    -[SFPasswordSavingRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }
}

void __109__SFPasswordSavingRemoteViewController_accountAuthenticationModificationController_didFailRequest_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerWillDismiss:", *(_QWORD *)(a1 + 32));

}

- (id)presentationAnchorForAccountAuthenticationModificationController:(id)a3
{
  void *v3;
  void *v4;

  -[SFPasswordSavingRemoteViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAuthenticationModificationController, 0);
}

@end
