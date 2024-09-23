@implementation SFExternalPasswordCredentialServiceViewController

- (void)_dismiss
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SFExternalPasswordCredentialServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willDismissServiceViewController");

}

- (id)_authenticationContext
{
  _SFAuthenticationContext *authenticationContext;
  _SFAuthenticationContext *v4;
  _SFAuthenticationContext *v5;

  authenticationContext = self->_authenticationContext;
  if (!authenticationContext)
  {
    v4 = objc_alloc_init(_SFAuthenticationContext);
    v5 = self->_authenticationContext;
    self->_authenticationContext = v4;

    -[_SFAuthenticationContext setDelegate:](self->_authenticationContext, "setDelegate:", self);
    authenticationContext = self->_authenticationContext;
  }
  return authenticationContext;
}

- (id)authenticationCustomUIProgressObserverForContext:(id)a3
{
  return 0;
}

- (id)authenticationMessageForContext:(id)a3
{
  return +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPassword](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForFillingSavedPassword", a3);
}

- (id)passcodePromptForContext:(id)a3
{
  return +[SFAutoFillAuthenticationUtilities passcodePromptForFillingSavedAccount](SFAutoFillAuthenticationUtilities, "passcodePromptForFillingSavedAccount", a3);
}

- (BOOL)displayMessageAsTitleForContext:(id)a3
{
  return 1;
}

- (BOOL)contextRequiresSessionBasedAuthentication:(id)a3
{
  return 0;
}

- (BOOL)contextShouldAllowPasscodeFallback:(id)a3
{
  return 1;
}

- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3
{
  return 1;
}

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7828B0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_autoFillWithCredentialIdentity_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getCredentialForCredentialIdentity_completion_, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getCredentialForCredentialIdentity_completion_, 0, 1);

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[SFExternalPasswordCredentialRemoteViewController exportedInterface](SFExternalPasswordCredentialRemoteViewController, "exportedInterface");
}

- (SFExternalPasswordCredentialServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SFExternalPasswordCredentialServiceViewController *v4;
  WBSAuthenticationServicesAgentProxy *v5;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v7;
  SFExternalPasswordCredentialServiceViewController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFExternalPasswordCredentialServiceViewController;
  v4 = -[SFExternalPasswordCredentialServiceViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E0D8A778]);
    authenticationServicesAgentProxy = v4->_authenticationServicesAgentProxy;
    v4->_authenticationServicesAgentProxy = v5;

    objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v4);

    v8 = v4;
  }

  return v4;
}

- (void)autoFillWithCredentialIdentity:(id)a3
{
  -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:](self, "_autoFillWithCredentialIdentity:pageID:frameID:", a3, 0, 0);
}

- (void)_autoFillWithCredentialIdentity:(id)a3 pageID:(id)a4 frameID:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _ASCredentialAuthenticationViewController *v15;
  _ASCredentialAuthenticationViewController *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _ASCredentialAuthenticationViewController *v23;
  _ASCredentialAuthenticationViewController *extensionController;
  void *v25;
  id v26;
  void *v27;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "owningExtensionState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providerBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enabledExtensionWithContainingAppBundleID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v18 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:].cold.2();
      -[SFExternalPasswordCredentialServiceViewController _dismiss](self, "_dismiss");
      goto LABEL_16;
    }
    self->_completionAction = 0;
    v12 = objc_msgSend(v7, "type");
    switch(v12)
    {
      case 4:
        v19 = objc_alloc(MEMORY[0x1E0C92640]);
        v20 = objc_alloc(MEMORY[0x1E0C925C8]);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C925C0]), "_initWithFoundationCredentialIdentity:", v7);
        v22 = (void *)objc_msgSend(v20, "initWithCredentialIdentity:", v21);
        v23 = (_ASCredentialAuthenticationViewController *)objc_msgSend(v19, "initWithExtension:oneTimeCodeCredentialRequest:", v11, v22);
        extensionController = self->_extensionController;
        self->_extensionController = v23;

        break;
      case 2:
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __100__SFExternalPasswordCredentialServiceViewController__autoFillWithCredentialIdentity_pageID_frameID___block_invoke;
        v31[3] = &unk_1E4AC4350;
        v31[4] = self;
        v32 = v11;
        v25 = (void *)MEMORY[0x1A8598C40](v31);
        v26 = v7;
        -[SFExternalPasswordCredentialServiceViewController _hostAuditToken](self, "_hostAuditToken");
        WBSApplicationIdentifierFromAuditToken();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
        objc_msgSend(v26, "serviceIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "credentialID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[WBSAuthenticationServicesAgentProxy getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:](authenticationServicesAgentProxy, "getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", v27, v29, v30, v25);
        goto LABEL_16;
      case 1:
        v13 = objc_alloc(MEMORY[0x1E0C92640]);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C925D8]), "initWithFoundationCredentialIdentity:", v7);
        v15 = (_ASCredentialAuthenticationViewController *)objc_msgSend(v13, "initWithExtension:credentialIdentity:", v11, v14);
        v16 = self->_extensionController;
        self->_extensionController = v15;

        break;
      default:
LABEL_16:

        goto LABEL_17;
    }
    -[_ASCredentialAuthenticationViewController setDelegate:](self->_extensionController, "setDelegate:", self);
    goto LABEL_16;
  }
  v17 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:].cold.1();
  -[SFExternalPasswordCredentialServiceViewController _dismiss](self, "_dismiss");
LABEL_17:

}

void __100__SFExternalPasswordCredentialServiceViewController__autoFillWithCredentialIdentity_pageID_frameID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92640]), "initWithExtension:passkeyAssertionRequest:", *(_QWORD *)(a1 + 40), v6);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 984);
    *(_QWORD *)(v4 + 984) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setDelegate:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_dismiss");
  }

}

- (void)_finishRequestToAutoFillCredential:(id)a3 extensionShowedUI:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD, _QWORD);
  _QWORD v20[4];
  id v21;
  id v22;

  v9 = a3;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke;
  v20[3] = &unk_1E4AC1A58;
  v12 = v10;
  v22 = v12;
  v13 = v9;
  v21 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v20);
  if (a4
    || (+[_SFManagedFeatureObserver sharedObserver](_SFManagedFeatureObserver, "sharedObserver"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "authenticationRequiredToAutoFill"),
        v15,
        (v16 & 1) == 0))
  {
    v14[2](v14, 1);
  }
  else
  {
    -[SFExternalPasswordCredentialServiceViewController _authenticationContext](self, "_authenticationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_2;
    v18[3] = &unk_1E4AC2C48;
    v19 = v14;
    objc_msgSend(v17, "authenticateForClient:userInitiated:completion:", self, 1, v18);

  }
}

void __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "user");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      objc_msgSend(*(id *)(a1 + 32), "password");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = v10;
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_DEFAULT, "Sending credential with non-empty username: %{public}@, non-empty password: %{public}@", buf, 0x16u);

    }
    v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_cold_1(a1, v12);
    v13 = (void *)MEMORY[0x1E0DBDB50];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_66;
    v15[3] = &unk_1E4AC0230;
    v14 = *(_QWORD *)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v13, "sendAutofillCredentialCandidate:completionHandler:", v14, v15);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCredentialForCredentialIdentity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id getCredentialCompletion;
  id v14;
  void *v15;
  _ASCredentialAuthenticationViewController *v16;
  _ASCredentialAuthenticationViewController *extensionController;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[SFExternalPasswordCredentialServiceViewController _hostAuditToken](self, "_hostAuditToken");
    if ((WBSAuditTokenHasEntitlement() & 1) != 0)
    {
      objc_msgSend(v6, "owningExtensionState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "providerBundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enabledExtensionWithContainingAppBundleID:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x1A8598C40](v7);
        getCredentialCompletion = self->_getCredentialCompletion;
        self->_getCredentialCompletion = v12;

        self->_completionAction = 1;
        v14 = objc_alloc(MEMORY[0x1E0C92640]);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C925D8]), "initWithFoundationCredentialIdentity:", v6);
        v16 = (_ASCredentialAuthenticationViewController *)objc_msgSend(v14, "initWithExtension:credentialIdentity:", v11, v15);
        extensionController = self->_extensionController;
        self->_extensionController = v16;

        -[_ASCredentialAuthenticationViewController setDelegate:](self->_extensionController, "setDelegate:", self);
      }
      else
      {
        v23 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[SFExternalPasswordCredentialServiceViewController _autoFillWithCredentialIdentity:pageID:frameID:].cold.2();
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0C92588];
        v28 = *MEMORY[0x1E0CB2D68];
        v29 = CFSTR("Primary credential provider extension was not found");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 0, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v27);

        -[SFExternalPasswordCredentialServiceViewController _dismiss](self, "_dismiss");
      }

    }
    else
    {
      v18 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SFExternalPasswordCredentialServiceViewController getCredentialForCredentialIdentity:completion:].cold.2();
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB28A8];
      v30 = *MEMORY[0x1E0CB2D68];
      v31[0] = CFSTR("Calling process is not entitled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 4099, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v22);

      -[SFExternalPasswordCredentialServiceViewController _dismiss](self, "_dismiss");
    }
  }

}

- (void)_finishRequestToReturnCredential:(id)a3 extensionShowedUI:(BOOL)a4 error:(id)a5 completion:(id)a6
{
  _QWORD *getCredentialCompletion;
  _BOOL8 v10;
  void (*v11)(_QWORD *, id, _BOOL8, id);
  id v12;
  id v13;
  NSObject *v14;

  getCredentialCompletion = self->_getCredentialCompletion;
  if (getCredentialCompletion)
  {
    v10 = !a4;
    v11 = (void (*)(_QWORD *, id, _BOOL8, id))getCredentialCompletion[2];
    v12 = a6;
    v11(getCredentialCompletion, a3, v10, a5);
  }
  else
  {
    v13 = a6;
    v14 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SFExternalPasswordCredentialServiceViewController _finishRequestToReturnCredential:extensionShowedUI:error:completion:].cold.1();
  }
  (*((void (**)(id))a6 + 2))(a6);

}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __112__SFExternalPasswordCredentialServiceViewController_presentUIForPasswordCredentialAuthenticationViewController___block_invoke;
  v3[3] = &unk_1E4ABFE00;
  v3[4] = self;
  -[SFExternalPasswordCredentialServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, v3);
}

void __112__SFExternalPasswordCredentialServiceViewController_presentUIForPasswordCredentialAuthenticationViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentExternalPasswordCredentialRemoteViewController");

}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void (**v20)(_QWORD);
  id v21;
  SFExternalPasswordCredentialServiceViewController *v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t completionAction;
  void *v33;
  NSObject *v34;
  void (**v35)(_QWORD);
  _QWORD v36[4];
  void (**v37)(_QWORD);
  _QWORD v38[4];
  void (**v39)(_QWORD);
  uint8_t buf[8];
  _QWORD v41[4];
  NSObject *v42;
  SFExternalPasswordCredentialServiceViewController *v43;
  _QWORD v44[4];
  NSObject *v45;
  id v46;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  objc_msgSend(v13, "presentingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v16 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke;
  v44[3] = &unk_1E4AC1338;
  v17 = v12;
  v46 = v17;
  v18 = v15;
  v45 = v18;
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v44);

  v41[0] = v16;
  v41[1] = 3221225472;
  v41[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2;
  v41[3] = &unk_1E4ABFB20;
  v19 = v18;
  v42 = v19;
  v43 = self;
  v20 = (void (**)(_QWORD))MEMORY[0x1A8598C40](v41);
  if (v10)
  {
    v21 = objc_alloc(MEMORY[0x1E0D8A058]);
    objc_msgSend(v10, "user");
    v35 = v20;
    v22 = self;
    v23 = v14;
    v24 = v19;
    v25 = v17;
    v26 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "password");
    v28 = v10;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v21, "initWithUser:password:site:creationDate:customTitle:groupName:", v27, v29, &stru_1E4AC8470, v30, 0, 0);

    v10 = v28;
    v16 = MEMORY[0x1E0C809B0];

    v11 = v26;
    v17 = v25;
    v19 = v24;
    v14 = v23;
    self = v22;
    v20 = v35;
  }
  else
  {
    v31 = 0;
  }
  completionAction = self->_completionAction;
  if (completionAction == 1)
  {
    v36[0] = v16;
    v36[1] = 3221225472;
    v36[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_83;
    v36[3] = &unk_1E4AC0230;
    v37 = v20;
    -[SFExternalPasswordCredentialServiceViewController _finishRequestToReturnCredential:extensionShowedUI:error:completion:](self, "_finishRequestToReturnCredential:extensionShowedUI:error:completion:", v31, v14 != 0, v11, v36);
    v33 = v37;
    goto LABEL_9;
  }
  if (completionAction)
  {
LABEL_12:
    v20[2](v20);
    goto LABEL_13;
  }
  if (!v31)
  {
    v34 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v34, OS_LOG_TYPE_DEFAULT, "Did not receive any external password credential", buf, 2u);
    }
    goto LABEL_12;
  }
  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_81;
  v38[3] = &unk_1E4AC0230;
  v39 = v20;
  -[SFExternalPasswordCredentialServiceViewController _finishRequestToAutoFillCredential:extensionShowedUI:error:completion:](self, "_finishRequestToAutoFillCredential:extensionShowedUI:error:completion:", v31, v14 != 0, v11, v38);
  v33 = v39;
LABEL_9:

LABEL_13:
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_3;
  block[3] = &unk_1E4ABFE00;
  v1 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_group_notify(v1, MEMORY[0x1E0C80D38], block);
}

uint64_t __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_81(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_82;
  block[3] = &unk_1E4AC0230;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_82(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Dismissing external password credential service view controller after sending credential", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_83(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_84;
  block[3] = &unk_1E4AC0230;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __133__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke_2_84(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Dismissing external password credential service view controller after returning credential", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  _ASCredentialAuthenticationViewController *extensionController;
  id v10;
  id v11;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v20 = a6;
  extensionController = self->_extensionController;
  self->_extensionController = 0;
  v10 = a4;
  v11 = a3;

  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  -[SFExternalPasswordCredentialServiceViewController _hostAuditToken](self, "_hostAuditToken");
  WBSApplicationIdentifierFromAuditToken();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "relyingParty");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticatorData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "credentialID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSAuthenticationServicesAgentProxy completeAssertionWithExternalPasskeyForApplicationIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:](authenticationServicesAgentProxy, "completeAssertionWithExternalPasskeyForApplicationIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:", v13, v14, v15, v16, v17, v18);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __149__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke;
  v21[3] = &unk_1E4AC1338;
  v21[4] = self;
  v22 = v20;
  v19 = v20;
  objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, v21);

}

uint64_t __149__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithOneTimeCodeCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void (**v19)(_QWORD);
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  void (**v25)(_QWORD);
  uint8_t buf[16];
  _QWORD v27[4];
  NSObject *v28;
  SFExternalPasswordCredentialServiceViewController *v29;
  _QWORD v30[4];
  NSObject *v31;
  id v32;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke;
  v30[3] = &unk_1E4AC1338;
  v16 = v12;
  v32 = v16;
  v17 = v14;
  v31 = v17;
  objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v30);

  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2;
  v27[3] = &unk_1E4ABFB20;
  v18 = v17;
  v28 = v18;
  v29 = self;
  v19 = (void (**)(_QWORD))MEMORY[0x1A8598C40](v27);
  if (v10
    && (v20 = objc_alloc(MEMORY[0x1E0D8A058]),
        objc_msgSend(v10, "code"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = (void *)objc_msgSend(v20, "initWithOneTimeCode:", v21),
        v21,
        v22))
  {
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_85;
    v24[3] = &unk_1E4AC0230;
    v25 = v19;
    -[SFExternalPasswordCredentialServiceViewController _finishRequestToAutoFillCredential:extensionShowedUI:error:completion:](self, "_finishRequestToAutoFillCredential:extensionShowedUI:error:completion:", v22, 1, v11, v24);

  }
  else
  {
    v23 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v23, OS_LOG_TYPE_DEFAULT, "Did not receive any external one time code credential", buf, 2u);
    }
    v19[2](v19);
  }

}

void __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_3;
  block[3] = &unk_1E4ABFE00;
  v1 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_group_notify(v1, MEMORY[0x1E0C80D38], block);
}

uint64_t __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

void __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_85(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2_86;
  block[3] = &unk_1E4AC0230;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __144__SFExternalPasswordCredentialServiceViewController_credentialAuthenticationViewController_didFinishWithOneTimeCodeCredential_error_completion___block_invoke_2_86(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Dismissing external one time code credential service view controller after sending credential", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong(&self->_getCredentialCompletion, 0);
  objc_storeStrong((id *)&self->_extensionController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

- (void)_autoFillWithCredentialIdentity:pageID:frameID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "No credential identity was provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_autoFillWithCredentialIdentity:pageID:frameID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "No credential provider extension available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __123__SFExternalPasswordCredentialServiceViewController__finishRequestToAutoFillCredential_extensionShowedUI_error_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v4;
  _os_log_debug_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_DEBUG, "Sending credential with username: %{private}@", (uint8_t *)&v5, 0xCu);

}

- (void)getCredentialForCredentialIdentity:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "The caller is not entitled to read from credential provider extensions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_finishRequestToReturnCredential:extensionShowedUI:error:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to finish request to return credential because a completion handler was not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
