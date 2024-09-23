@implementation _ASAccountAuthenticationModificationHostViewController

- (_ASAccountAuthenticationModificationHostViewController)initWithExtension:(id)a3 serviceIdentifier:(id)a4
{
  id v7;
  _ASAccountAuthenticationModificationHostViewController *v8;
  _ASAccountAuthenticationModificationHostViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _ASAccountAuthenticationModificationHostViewController *v16;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_ASAccountAuthenticationModificationHostViewController;
  v8 = -[_ASExtensionViewController initWithExtension:](&v18, sel_initWithExtension_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceIdentifier, a4);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v9, sel__cancelButtonPressed);
    -[_ASExtensionViewController extension](v9, "extension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_plugIn");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedContainingName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ASAccountAuthenticationModificationHostViewController navigationItem](v9, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v13);

    -[_ASAccountAuthenticationModificationHostViewController navigationItem](v9, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItem:", v10);

    -[_ASAccountAuthenticationModificationHostViewController setModalInPresentation:](v9, "setModalInPresentation:", 1);
    v16 = v9;

  }
  return v9;
}

- (void)upgradeCredentialToSignInWithApple:(id)a3 userInfo:(id)a4
{
  ASPasswordCredential *v6;
  id v7;
  ASPasswordCredential *existingCredential;
  ASPasswordCredential *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = (ASPasswordCredential *)a3;
  v7 = a4;
  self->_accountModificationOperation = 1;
  existingCredential = self->_existingCredential;
  self->_existingCredential = v6;
  v9 = v6;

  objc_storeStrong((id *)&self->_userInfo, a4);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __102___ASAccountAuthenticationModificationHostViewController_upgradeCredentialToSignInWithApple_userInfo___block_invoke;
  v11[3] = &unk_24C94F9B8;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[_ASExtensionViewController _beginNonUIRequest:connectionHandler:](self, "_beginNonUIRequest:connectionHandler:", 1, v11);

}

- (void)updateCredential:(id)a3 withNewPassword:(id)a4 userInfo:(id)a5
{
  ASPasswordCredential *v8;
  NSString *v9;
  id v10;
  ASPasswordCredential *existingCredential;
  ASPasswordCredential *v12;
  NSString *newPassword;
  NSString *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v8 = (ASPasswordCredential *)a3;
  v9 = (NSString *)a4;
  v10 = a5;
  self->_accountModificationOperation = 0;
  existingCredential = self->_existingCredential;
  self->_existingCredential = v8;
  v12 = v8;

  newPassword = self->_newPassword;
  self->_newPassword = v9;
  v14 = v9;

  objc_storeStrong((id *)&self->_userInfo, a5);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __100___ASAccountAuthenticationModificationHostViewController_updateCredential_withNewPassword_userInfo___block_invoke;
  v16[3] = &unk_24C94F9B8;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  -[_ASExtensionViewController _beginNonUIRequest:connectionHandler:](self, "_beginNonUIRequest:connectionHandler:", 1, v16);

}

- (void)_nonUIRequestDidRequireUserInteraction
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __96___ASAccountAuthenticationModificationHostViewController__nonUIRequestDidRequireUserInteraction__block_invoke;
  v3[3] = &unk_24C94F9E0;
  objc_copyWeak(&v4, &location);
  v3[4] = self;
  -[_ASExtensionViewController _beginRequestWithConnectionHandler:](self, "_beginRequestWithConnectionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldUseNonUIRequestTimer
{
  return 0;
}

- (void)_requestDidFailWithError:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id WeakRetained;
  id v9;

  v9 = a3;
  if (a4)
    v6 = a4;
  else
    v6 = &__block_literal_global_0;
  v7 = (void (**)(_QWORD))MEMORY[0x212BBEFEC](v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountModificationHostViewController:requestCanceledWithError:completion:", self, v9, v7);
  else
    v7[2](v7);

}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountAuthenticationModificationHostViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  -[_ASAccountAuthenticationModificationHostViewController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslucent:", 0);

}

- (void)_cancelButtonPressed
{
  -[_ASAccountAuthenticationModificationExtensionContextProtocol cancelRequest](self->_accountModificationExtensionContextProxy, "cancelRequest");
}

- (void)prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __142___ASAccountAuthenticationModificationHostViewController_prepareToCompleteUpgradeToSignInWithAppleRequestWithHostContext_userInfo_completion___block_invoke;
  block[3] = &unk_24C94F6C8;
  block[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)prepareToCompleteRequestWithHostContext:(id)a3 updatedCredential:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __136___ASAccountAuthenticationModificationHostViewController_prepareToCompleteRequestWithHostContext_updatedCredential_userInfo_completion___block_invoke;
  v15[3] = &unk_24C94F718;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

- (void)prepareToCancelRequestWithHostContext:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _ASAccountAuthenticationModificationHostViewController *v26;
  void (**v27)(_QWORD);
  id v28;
  objc_super v29;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (self->_signInWithAppleAuthorization)
  {
    v10 = objc_alloc_init(MEMORY[0x24BE0AD20]);
    v11 = objc_alloc(MEMORY[0x24BDC1540]);
    -[_ASExtensionViewController extension](self, "extension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_plugIn");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containingUrl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v15 = (void *)objc_msgSend(v11, "initWithURL:allowPlaceholder:error:", v14, 0, &v28);
    v16 = v28;

    if (v16)
    {
      v17 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_ASAccountAuthenticationModificationHostViewController prepareToCancelRequestWithHostContext:error:completion:].cold.1(v17, v16);
      v9[2](v9);
    }
    else
    {
      -[AKAuthorization authorizedRequest](self->_signInWithAppleAuthorization, "authorizedRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "requestIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTransactionID:", v20);

      objc_msgSend(v15, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBundleID:", v21);

      objc_msgSend(v15, "teamIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTeamID:", v22);

      v23 = objc_alloc_init(MEMORY[0x24BE0ACF0]);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __113___ASAccountAuthenticationModificationHostViewController_prepareToCancelRequestWithHostContext_error_completion___block_invoke;
      v24[3] = &unk_24C94FA28;
      v25 = v8;
      v26 = self;
      v27 = v9;
      objc_msgSend(v23, "revokeAuthorizationWithContext:completion:", v10, v24);

    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)_ASAccountAuthenticationModificationHostViewController;
    -[_ASExtensionViewController prepareToCancelRequestWithHostContext:error:completion:](&v29, sel_prepareToCancelRequestWithHostContext_error_completion_, v8, a4, v9);
  }

}

- (void)getSignInWithAppleAuthorizationWithState:(id)a3 nonce:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  id WeakRetained;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  void (**v32)(id, _QWORD, void *);
  id v33;
  id location;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (self->_accountModificationOperation == 1)
  {
    -[_ASAccountAuthenticationModificationHostViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "dismissUIForAccountModificationHostViewController:", self);

    }
    v13 = objc_alloc_init(MEMORY[0x24BE0AD30]);
    v14 = objc_alloc(MEMORY[0x24BDC1540]);
    -[_ASExtensionViewController extension](self, "extension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_plugIn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "containingUrl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v18 = (void *)objc_msgSend(v14, "initWithURL:allowPlaceholder:error:", v17, 0, &v35);
    v19 = v35;

    if (v19)
    {
      v20 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_ASAccountAuthenticationModificationHostViewController getSignInWithAppleAuthorizationWithState:nonce:completion:].cold.1(v20, v19);
      v21 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDD0FD8];
      v37 = CFSTR("Couldn't get application record while fetching authorization.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v23);

    }
    else
    {
      objc_initWeak(&location, self);
      objc_msgSend(v13, "setState:", v8);
      objc_msgSend(v13, "setNonce:", v9);
      objc_msgSend(v18, "entitlements");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:ofClass:", CFSTR("application-identifier"), objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAppID:", v26);

      objc_msgSend(v18, "bundleIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBundleID:", v27);

      objc_msgSend(v18, "teamIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTeamID:", v28);

      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0AD60]), "initWithUpgradeContext:", v13);
      v30 = objc_alloc_init(MEMORY[0x24BE0ACF0]);
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __116___ASAccountAuthenticationModificationHostViewController_getSignInWithAppleAuthorizationWithState_nonce_completion___block_invoke;
      v31[3] = &unk_24C94FA50;
      objc_copyWeak(&v33, &location);
      v32 = v10;
      objc_msgSend(v30, "performAuthorizationWithContext:completion:", v29, v31);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v38 = *MEMORY[0x24BDD0FD8];
    v39[0] = CFSTR("Cannot request Sign in with Apple authorization in the middle of a strong password upgrade.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v19);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v13);
  }

}

- (void)dismissRequestUI:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dismissUIForAccountModificationHostViewController:", self);

}

- (_ASAccountAuthenticationModificationHostViewControllerDelegate)delegate
{
  return (_ASAccountAuthenticationModificationHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_accountModificationExtensionContextProxy, 0);
  objc_storeStrong((id *)&self->_signInWithAppleAuthorization, 0);
  objc_storeStrong((id *)&self->_newPassword, 0);
  objc_storeStrong((id *)&self->_existingCredential, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (void)prepareToCancelRequestWithHostContext:(void *)a1 error:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Failed to get application record to revoke authorization with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

- (void)getSignInWithAppleAuthorizationWithState:(void *)a1 nonce:(void *)a2 completion:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Failed to get application record to request authorization due to error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_0();
}

@end
