@implementation ASAccountAuthenticationModificationController

- (ASAccountAuthenticationModificationController)init
{
  ASAccountAuthenticationModificationController *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSExtension *helperExtension;
  ASAccountAuthenticationModificationController *v8;
  NSObject *v9;
  id v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)ASAccountAuthenticationModificationController;
  v2 = -[ASAccountAuthenticationModificationController init](&v12, sel_init);
  if (v2)
  {
    v13 = *MEMORY[0x24BDD0C30];
    v14[0] = CFSTR("com.apple.AuthenticationServicesUI.AccountAuthenticationModificationExtensionHelper");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingAttributes:error:", v3, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    objc_msgSend(v4, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    helperExtension = v2->_helperExtension;
    v2->_helperExtension = (NSExtension *)v6;

    if (v2->_helperExtension)
    {
      v8 = v2;
    }
    else
    {
      if (v5)
      {
        v9 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[ASAccountAuthenticationModificationController init].cold.1(v9, v5);
      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)performRequest:(ASAccountAuthenticationModificationRequest *)request
{
  ASAccountAuthenticationModificationRequest *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = request;
  if (self->_request)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v15 = CFSTR("ASExtensionLocalizedFailureReasonErrorKey");
      v16[0] = CFSTR("Cannot start another Account Authentication Modification request until the current request finishes.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", self, v5, v9);

    }
LABEL_11:

    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_request, request);
  objc_storeStrong((id *)&self->_referenceToSelf, self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ASAccountAuthenticationModificationController _performReplacePasswordWithSignInWithAppleRequest:](self, "_performReplacePasswordWithSignInWithAppleRequest:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v10 = (void *)MEMORY[0x24BDD1540];
        v13 = *MEMORY[0x24BDD0FD8];
        v14 = CFSTR("Received request is not a valid ASAccountAuthenticationModificationRequest subclass.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", self, v5, v12);

      }
      -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");
      goto LABEL_11;
    }
    -[ASAccountAuthenticationModificationController _showUpgradeToStrongPasswordPromptForRequest:](self, "_showUpgradeToStrongPasswordPromptForRequest:", v5);
  }
LABEL_12:

}

- (void)_requestRemoteViewController:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  NSExtension *helperExtension;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke;
  v14[3] = &unk_24C950628;
  v6 = v4;
  v15 = v6;
  v7 = (void *)MEMORY[0x212BBEFEC](v14);
  if (objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent")
    && (objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("ASDebugASAccountAuthenticationModificationControllerUsesSafariViewService")), v8, v9))
  {
    v10 = +[_ASAccountAuthenticationModificationRemoteViewController requestViewControllerWithConnectionHandler:](_ASAccountAuthenticationModificationRemoteViewController, "requestViewControllerWithConnectionHandler:", v7);
  }
  else
  {
    helperExtension = self->_helperExtension;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke_2;
    v12[3] = &unk_24C950650;
    v13 = v7;
    -[NSExtension _as_instantiateViewControllerWithConnectionHandler:](helperExtension, "_as_instantiateViewControllerWithConnectionHandler:", v12);

  }
}

uint64_t __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__ASAccountAuthenticationModificationController__requestRemoteViewController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performReplacePasswordWithSignInWithAppleRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke;
  v6[3] = &unk_24C950678;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ASAccountAuthenticationModificationController _requestRemoteViewController:](self, "_requestRemoteViewController:", v6);

}

void __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  ASPasswordCredential *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  ASPasswordCredential *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke_cold_1(v19, v8);
    objc_msgSend(*(id *)(a1 + 32), "_failRequestWithError:", v8);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
    v9 = [ASPasswordCredential alloc];
    objc_msgSend(*(id *)(a1 + 40), "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "password");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_24C955390;
    v14 = -[ASPasswordCredential initWithUser:password:](v9, "initWithUser:password:", v10, v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "serviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "extension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "upgradeCredentialToSignInWithApple:forServiceIdentifier:userInfo:extension:", v14, v15, v17, v18);

  }
}

- (void)_showUpgradeToStrongPasswordPromptForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id WeakRetained;
  ASAccountAuthenticationModificationRequest *request;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDC1538];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationProxyForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedName");
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE82CB8], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceClass");

  v11 = (void *)MEMORY[0x24BDD17C8];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, v9);
  v13 = objc_claimAutoreleasedReturnValue();

  _WBSLocalizedString();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BEBD3B0];
  v16 = (void *)v9;
  if (deviceAlertStyle_onceToken != -1)
    dispatch_once(&deviceAlertStyle_onceToken, &__block_literal_global_12);
  v42 = (void *)v14;
  v43 = (void *)v13;
  objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v13, v14, deviceAlertStyle_style);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BEBD3A8];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke;
  v45[3] = &unk_24C9506A0;
  v45[4] = self;
  v21 = v4;
  v46 = v21;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 0, v45);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v22);

  v23 = (void *)MEMORY[0x24BEBD3A8];
  _WBSLocalizedString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v20;
  v44[1] = 3221225472;
  v44[2] = __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke_2;
  v44[3] = &unk_24C9506C8;
  v44[4] = self;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v24, 1, v44);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v25);

  -[ASAccountAuthenticationModificationController _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "presentViewController:animated:completion:", v17, 1, 0);
    v28 = v43;
  }
  else
  {
    v29 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[ASAccountAuthenticationModificationController _showUpgradeToStrongPasswordPromptForRequest:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v28 = v43;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      request = self->_request;
      v41 = (void *)MEMORY[0x24BDD1540];
      v47 = *MEMORY[0x24BDD0FD8];
      v48[0] = CFSTR("No presentation anchor provided to show strong password upgrade UI.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", self, request, v40);

    }
    -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");

  }
}

uint64_t __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performUpgradePasswordToStrongPasswordRequest:", *(_QWORD *)(a1 + 40));
}

void __94__ASAccountAuthenticationModificationController__showUpgradeToStrongPasswordPromptForRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 16);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", v2, v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");

}

- (void)_performUpgradePasswordToStrongPasswordRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __96__ASAccountAuthenticationModificationController__performUpgradePasswordToStrongPasswordRequest___block_invoke;
  v6[3] = &unk_24C950678;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ASAccountAuthenticationModificationController _requestRemoteViewController:](self, "_requestRemoteViewController:", v6);

}

void __96__ASAccountAuthenticationModificationController__performUpgradePasswordToStrongPasswordRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  ASPasswordCredential *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  ASPasswordCredential *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (!v6 || v7)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke_cold_1(v19, v8);
    objc_msgSend(*(id *)(a1 + 32), "_failRequestWithError:", v8);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
    v9 = [ASPasswordCredential alloc];
    objc_msgSend(*(id *)(a1 + 40), "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "password");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = &stru_24C955390;
    v14 = -[ASPasswordCredential initWithUser:password:](v9, "initWithUser:password:", v10, v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "serviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "extension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateCredential:forServiceIdentifier:userInfo:extension:", v14, v15, v17, v18);

  }
}

- (void)_invalidate
{
  _ASAccountAuthenticationModificationRemoteViewController *accountAuthenticationModificationRemoteViewController;
  ASAccountAuthenticationModificationRequest *request;
  ASAccountAuthenticationModificationController *referenceToSelf;

  -[_ASAccountAuthenticationModificationRemoteViewController setDelegate:](self->_accountAuthenticationModificationRemoteViewController, "setDelegate:", 0);
  accountAuthenticationModificationRemoteViewController = self->_accountAuthenticationModificationRemoteViewController;
  self->_accountAuthenticationModificationRemoteViewController = 0;

  request = self->_request;
  self->_request = 0;

  referenceToSelf = self->_referenceToSelf;
  self->_referenceToSelf = 0;

}

- (void)_failRequestWithError:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", self, self->_request, v5);
  -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");

}

- (id)_viewControllerToPresentFrom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ASAccountAuthenticationModificationController presentationContextProvider](self, "presentationContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationAnchorForAccountAuthenticationModificationController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_as_viewControllerToPresentFrom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)accountModificationRemoteViewControllerDidFinishUpgradeToSignInWithApple:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  v7 = (void (**)(_QWORD))a5;
  -[_ASAccountAuthenticationModificationRemoteViewController presentingViewController](self->_accountAuthenticationModificationRemoteViewController, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v7);
  }
  else if (v7)
  {
    v7[2](v7);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didSuccessfullyCompleteRequest:withUserInfo:", self, self->_request, v11);
  -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");

}

- (void)accountModificationRemoteViewController:(id)a3 didFinishWithCredential:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;

  v12 = a5;
  v8 = (void (**)(_QWORD))a6;
  -[_ASAccountAuthenticationModificationRemoteViewController presentingViewController](self->_accountAuthenticationModificationRemoteViewController, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v8);
  }
  else if (v8)
  {
    v8[2](v8);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didSuccessfullyCompleteRequest:withUserInfo:", self, self->_request, v12);
  -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");

}

- (void)presentAccountModificationRemoteViewController:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  ASAccountAuthenticationModificationRequest *request;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  -[ASAccountAuthenticationModificationController _viewControllerToPresentFrom](self, "_viewControllerToPresentFrom", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "presentViewController:animated:completion:", self->_accountAuthenticationModificationRemoteViewController, 1, 0);
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ASAccountAuthenticationModificationController presentAccountModificationRemoteViewController:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      request = self->_request;
      v16 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0FD8];
      v20[0] = CFSTR("No presentation anchor provided to show extension UI.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", self, request, v18);

    }
    -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");

  }
}

- (void)accountModificationRemoteViewController:(id)a3 requestCanceledWithError:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  v7 = (void (**)(_QWORD))a5;
  -[_ASAccountAuthenticationModificationRemoteViewController presentingViewController](self->_accountAuthenticationModificationRemoteViewController, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v7);
  }
  else if (v7)
  {
    v7[2](v7);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", self, self->_request, v11);
  -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");

}

- (void)accountModificationRemoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountAuthenticationModificationController:didFailRequest:withError:", self, self->_request, v6);
  -[ASAccountAuthenticationModificationController _invalidate](self, "_invalidate");

}

- (void)dismissAccountModificationRemoteViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[ASAccountAuthenticationModificationController presentationContextProvider](self, "presentationContextProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationAnchorForAccountAuthenticationModificationController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (id)presentationContextProvider
{
  return objc_loadWeakRetained((id *)&self->_presentationContextProvider);
}

- (void)setPresentationContextProvider:(id)presentationContextProvider
{
  objc_storeWeak((id *)&self->_presentationContextProvider, presentationContextProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationContextProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_helperExtension, 0);
  objc_storeStrong((id *)&self->_referenceToSelf, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_accountAuthenticationModificationRemoteViewController, 0);
}

- (void)init
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Failed to find helper extension to perform Account Authentication Modification Extension requests with error %{public}@.", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __99__ASAccountAuthenticationModificationController__performReplacePasswordWithSignInWithAppleRequest___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_2_0(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E4D9000, v5, v6, "Failed to get remote view controller from helper extension: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_showUpgradeToStrongPasswordPromptForRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "No presentation anchor provided to strong password upgrade UI.", a5, a6, a7, a8, 0);
}

- (void)presentAccountModificationRemoteViewController:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "No presentation anchor provided to show extension UI.", a5, a6, a7, a8, 0);
}

@end
