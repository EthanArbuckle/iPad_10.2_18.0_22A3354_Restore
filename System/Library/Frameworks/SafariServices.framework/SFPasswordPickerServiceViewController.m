@implementation SFPasswordPickerServiceViewController

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE706058);
}

- (id)authenticationCustomUIProgressObserverForContext:(id)a3
{
  return 0;
}

- (id)authenticationMessageForContext:(id)a3
{
  +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForFillingSavedPassword](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForFillingSavedPassword", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)passcodePromptForContext:(id)a3
{
  +[SFAutoFillAuthenticationUtilities passcodePromptForFillingSavedAccount](SFAutoFillAuthenticationUtilities, "passcodePromptForFillingSavedAccount", a3);
  return (id)objc_claimAutoreleasedReturnValue();
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
  return 0;
}

- (BOOL)contextShouldAllowMultipleBiometricFailures:(id)a3
{
  return 0;
}

- (id)_context
{
  _SFAuthenticationContext *context;
  _SFAuthenticationContext *v4;
  _SFAuthenticationContext *v5;

  context = self->_context;
  if (!context)
  {
    v4 = objc_alloc_init(_SFAuthenticationContext);
    v5 = self->_context;
    self->_context = v4;

    -[_SFAuthenticationContext setDelegate:](self->_context, "setDelegate:", self);
    context = self->_context;
  }
  return context;
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE75D540);
}

- (SFPasswordPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SFPasswordPickerServiceViewController *v4;
  void *v5;
  WBSAuthenticationServicesAgentProxy *v6;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v8;
  uint64_t v9;
  _ASIncomingCallObserver *callObserver;
  SFPasswordPickerServiceViewController *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFPasswordPickerServiceViewController;
  v4 = -[SFPasswordPickerServiceViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_initWeak(&location, v4);
    objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", v4);

    v6 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E0D8A778]);
    authenticationServicesAgentProxy = v4->_authenticationServicesAgentProxy;
    v4->_authenticationServicesAgentProxy = v6;

    v8 = (void *)MEMORY[0x1E0C92650];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__SFPasswordPickerServiceViewController_initWithNibName_bundle___block_invoke;
    v13[3] = &unk_1E4AC11B8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v8, "callObserverWithBlock:", v13);
    v9 = objc_claimAutoreleasedReturnValue();
    callObserver = v4->_callObserver;
    v4->_callObserver = (_ASIncomingCallObserver *)v9;

    v11 = v4;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __64__SFPasswordPickerServiceViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismiss");

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SFPasswordPickerServiceViewController;
  -[SFPasswordPickerServiceViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**presentCredentialsHandler)(void);
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFPasswordPickerServiceViewController;
  -[SFPasswordPickerServiceViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[SFPasswordPickerServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_rootSheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  presentCredentialsHandler = (void (**)(void))self->_presentCredentialsHandler;
  if (presentCredentialsHandler)
  {
    presentCredentialsHandler[2]();
    v8 = self->_presentCredentialsHandler;
    self->_presentCredentialsHandler = 0;

  }
}

- (void)_dismiss
{
  id v2;

  self->_hasAuthenticationForOtherPasswords = 0;
  -[SFPasswordPickerServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willDismissServiceViewController");

}

- (void)_authenticateToViewOtherPasswordsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  id v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(_QWORD);
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_hasAuthenticationForOtherPasswords)
  {
    ((void (*)(void (**)(_QWORD), uint64_t, _QWORD))v4[2])(v4, 1, 0);
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v20 = 0u;
    v21 = 0u;
    -[SFPasswordPickerServiceViewController _hostAuditToken](self, "_hostAuditToken");
    v18 = 0u;
    v19 = 0u;
    if (WBSAuditTokenHasEntitlement())
      objc_msgSend(v6, "setTouchIDAuthenticationAllowableReuseDuration:", self->_authenticationGracePeriod);
    v7 = WBSAuthenticationPolicyForPasswordManager();
    v17 = 0;
    v8 = objc_msgSend(v6, "canEvaluatePolicy:error:", v7, &v17);
    v9 = v17;
    v10 = v9;
    if ((v8 & 1) != 0)
    {
      v22[0] = &unk_1E4B25BE8;
      +[SFAutoFillAuthenticationUtilities passcodePromptForViewingSavedAccounts](SFAutoFillAuthenticationUtilities, "passcodePromptForViewingSavedAccounts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = &unk_1E4B25C00;
      v23[0] = v11;
      +[SFAutoFillAuthenticationUtilities customAuthenticationTitleForViewingSavedAccounts](SFAutoFillAuthenticationUtilities, "customAuthenticationTitleForViewingSavedAccounts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke;
      v14[3] = &unk_1E4AC3290;
      v14[4] = self;
      v16 = v5;
      v15 = v6;
      objc_msgSend(v15, "evaluatePolicy:options:reply:", v7, v13, v14);

    }
    else
    {
      self->_hasAuthenticationForOtherPasswords = objc_msgSend(v9, "code") == -5;
      v5[2](v5);
    }

  }
}

void __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v4 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1009) = v4 == 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2;
  v7[3] = &unk_1E4AC3268;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (!*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, *(_QWORD *)(a1 + 48));
  v2 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 40), "_dismiss");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_actionForPresentingPasswordManagerExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameForExtension:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__SFPasswordPickerServiceViewController__actionForPresentingPasswordManagerExtension___block_invoke;
  v14[3] = &unk_1E4AC32B8;
  objc_copyWeak(&v16, &location);
  v11 = v4;
  v15 = v11;
  objc_msgSend(v10, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v9, 0, 0, v14, &__block_literal_global_27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

void __86__SFPasswordPickerServiceViewController__actionForPresentingPasswordManagerExtension___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_presentCredentialListForExtension:", *(_QWORD *)(a1 + 32));

}

uint64_t __86__SFPasswordPickerServiceViewController__actionForPresentingPasswordManagerExtension___block_invoke_2()
{
  return 1;
}

- (void)_presentCredentialListForExtension:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  int HasEntitlement;
  char v9;
  NSString *remoteAppID;
  NSString *v11;
  NSString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  NSString *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke;
  v26[3] = &unk_1E4AC3348;
  v26[4] = self;
  v6 = v4;
  v27 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8598C40](v26);
  v24 = 0u;
  v25 = 0u;
  -[SFPasswordPickerServiceViewController _hostAuditToken](self, "_hostAuditToken");
  v22 = 0u;
  v23 = 0u;
  HasEntitlement = WBSAuditTokenHasEntitlement();
  v9 = HasEntitlement;
  if (HasEntitlement && (remoteAppID = self->_remoteAppID) != 0)
  {
    v11 = remoteAppID;
  }
  else
  {
    -[SFPasswordServiceViewController applicationIdentifier](self, "applicationIdentifier");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if (self->_webViewURL)
  {
    v13 = objc_alloc(MEMORY[0x1E0C925B8]);
    -[NSURL absoluteString](self->_webViewURL, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithIdentifier:type:", v14, 1);
    v28[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, NSString *))v7)[2](v7, v16, v12);

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0D8A060];
    v18[0] = v5;
    v18[1] = 3221225472;
    v18[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_4;
    v18[3] = &unk_1E4AC3398;
    v21 = v9;
    v18[4] = self;
    v20 = v7;
    v19 = v12;
    objc_msgSend(v17, "bestDomainForAppID:completionHandler:", v19, v18);

  }
}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_2;
  v10[3] = &unk_1E4AC3320;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v8 = a3;
  v9 = (void *)MEMORY[0x1A8598C40](v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "getPasskeyAssertionRequestParametersForApplicationIdentifier:completionHandler:", v8, v9);

}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1[4] + 1104), "isExplicitAutoFillMode"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92648]), "initForTextSelectingWithExtension:serviceIdentifiers:", a1[5], a1[6]);
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92648]), "initWithExtension:serviceIdentifiers:requestParameters:", a1[5], a1[6], v3);
  v5 = v4;
  objc_msgSend(v4, "setDelegate:", a1[4]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_3;
  v7[3] = &unk_1E4AC0590;
  v7[4] = a1[4];
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_5;
  block[3] = &unk_1E4AC3370;
  v11 = *(_BYTE *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v10 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__SFPasswordPickerServiceViewController__presentCredentialListForExtension___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 56);
LABEL_3:
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C925B8]), "initWithIdentifier:type:", v4, 0);
    v11[0] = v1;
    v6 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 64) && (v8 = *(_QWORD *)(a1 + 40), (v9 = *(_QWORD *)(v8 + 1056)) != 0))
  {
    objc_msgSend(MEMORY[0x1E0D8A060], "bestDomainForAutoFillFromDomains:appID:", v9, *(_QWORD *)(v8 + 1032));
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 56);
    if (v10)
    {
      v4 = (void *)v10;
      goto LABEL_3;
    }
    v6 = 0;
    v4 = 0;
  }
  else
  {
    v6 = 0;
    v4 = 0;
    v5 = *(_QWORD *)(a1 + 56);
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_10:
  (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v7, *(_QWORD *)(a1 + 48));
  if (v6)
  {

  }
}

- (void)authenticateToPresentInPopover:(BOOL)a3 savedAccountContext:(id)a4 completion:(id)a5
{
  self->_presentInPopover = a3;
  -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:](self, "_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:", a4, a5);
}

- (void)_fillCredential:(id)a3 needsAuthentication:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SFPasswordPickerServiceViewController *v18;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isExternal"))
  {
    objc_msgSend(v6, "externalCredential");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_credentialIdentityToFill, v7);
    objc_msgSend(v7, "owningExtensionState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "providerBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke;
    v16[3] = &unk_1E4AC33E8;
    v11 = v7;
    v17 = v11;
    v18 = self;
    objc_msgSend(v10, "getExtensionWithBundleID:completion:", v9, v16);

  }
  else
  {
    -[SFPasswordPickerServiceViewController _sendCredentialToClient:needsAuthentication:](self, "_sendCredentialToClient:needsAuthentication:", v6, v4);
    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
    objc_msgSend(v6, "user");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "site");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPasswordServiceViewController applicationIdentifier](self, "applicationIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSAuthenticationServicesAgentProxy didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:](authenticationServicesAgentProxy, "didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", v13, v14, *MEMORY[0x1E0D8B278], v15);

  }
}

void __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  uint64_t v19;
  id v20;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v4 == 1)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C925D8]), "initWithFoundationCredentialIdentity:", *(_QWORD *)(a1 + 32));
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92640]), "initWithExtension:credentialIdentity:", v3, v5);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 976);
    *(_QWORD *)(v13 + 976) = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 976), "setDelegate:");
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    v5 = *(id *)(a1 + 32);
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke_2;
    v18 = &unk_1E4AC33C0;
    v19 = *(_QWORD *)(a1 + 40);
    v20 = v3;
    v6 = (void *)MEMORY[0x1A8598C40](&v15);
    v7 = *(_QWORD **)(a1 + 40);
    v8 = (void *)v7[124];
    objc_msgSend(v7, "applicationIdentifier", v15, v16, v17, v18, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "credentialID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getExternalPasskeyRequestForApplicationIdentifier:relyingPartyIdentifier:credentialID:completionHandler:", v9, v10, v11, v6);

LABEL_5:
  }

}

void __77__SFPasswordPickerServiceViewController__fillCredential_needsAuthentication___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = *(void **)(v4 + 976);
    *(_QWORD *)(v4 + 976) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setDelegate:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_dismiss");
  }

}

- (void)_sendCredentialToClient:(id)a3 needsAuthentication:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  SFPasswordPickerServiceViewController *v16;

  v4 = a4;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke;
  v14[3] = &unk_1E4AC0590;
  v8 = v6;
  v15 = v8;
  v16 = self;
  v9 = MEMORY[0x1A8598C40](v14);
  v10 = (void *)v9;
  if (v4)
  {
    -[SFPasswordPickerServiceViewController _context](self, "_context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_117;
    v12[3] = &unk_1E4AC3410;
    v12[4] = self;
    v13 = v10;
    objc_msgSend(v11, "authenticateForClient:userInitiated:completion:", self, 1, v12);

  }
  else
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }

}

uint64_t __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  int v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "user");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "password");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "site");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v14 = 138543874;
    v15 = v5;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v10;
    v11 = v10;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_DEFAULT, "Sending credential with non-empty username: %{public}@, non-empty password: %{public}@, non-empty site: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  v12 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "user");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "site");
    objc_claimAutoreleasedReturnValue();
    __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_cold_1();
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendCredentialToClientAndDismiss:", *(_QWORD *)(a1 + 32));
}

void __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_117(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Successfully authenticated App AutoFill", v8, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_117_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "_dismiss");
  }

}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int HasEntitlement;
  NSObject *v17;
  NSString *remoteAppID;
  NSString *v19;
  NSString *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  char v24;
  __CFString *v25;
  void *v26;
  NSArray *v27;
  void *v28;
  const __CFString *v29;
  WBSGlobalFrameIdentifier *webFrameIdentifier;
  NSURL *webViewURL;
  __CFString *v32;
  id v33;
  NSString *v34;
  void (**v35)(id, uint64_t);
  id v36;
  _QWORD v37[4];
  __CFString *v38;
  id v39;
  char v40;
  _QWORD v41[5];
  __CFString *v42;
  id v43;
  void (**v44)(id, uint64_t);
  id v45;
  char v46;
  BOOL v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id location[3];

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_initWeak(location, self);
  v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:].cold.4((uint64_t)self, v8, v9, v10, v11, v12, v13, v14);
  -[SFPasswordPickerServiceViewController presentedViewController](self, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v7[2](v7, 1);
    goto LABEL_27;
  }
  v51 = 0u;
  v52 = 0u;
  v35 = v7;
  v36 = v6;
  -[SFPasswordPickerServiceViewController _hostAuditToken](self, "_hostAuditToken");
  v49 = 0u;
  v50 = 0u;
  HasEntitlement = WBSAuditTokenHasEntitlement();
  v17 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:].cold.3();
    if (!HasEntitlement)
      goto LABEL_10;
  }
  else if (!HasEntitlement)
  {
    goto LABEL_10;
  }
  remoteAppID = self->_remoteAppID;
  if (remoteAppID)
  {
    v19 = remoteAppID;
    goto LABEL_11;
  }
LABEL_10:
  -[SFPasswordServiceViewController applicationIdentifier](self, "applicationIdentifier");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v20 = v19;
  v34 = v19;
  v21 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:].cold.2();
  v22 = -[SFPasswordPickerServiceViewController _isConfiguredForSystemAutoFill](self, "_isConfiguredForSystemAutoFill", v34);
  v23 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    if (v22)
      goto LABEL_15;
LABEL_19:
    v24 = 0;
    goto LABEL_20;
  }
  -[SFPasswordPickerServiceViewController _authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:].cold.1();
  if (!v22)
    goto LABEL_19;
LABEL_15:
  if (-[RTIDocumentTraits autofillMode](self->_systemAutoFillDocumentTraits, "autofillMode") == 1)
    v24 = -[RTIDocumentTraits isExplicitAutoFillMode](self->_systemAutoFillDocumentTraits, "isExplicitAutoFillMode");
  else
    v24 = 1;
LABEL_20:
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke;
  v41[3] = &unk_1E4AC3638;
  v41[4] = self;
  v46 = HasEntitlement;
  v25 = v20;
  v42 = v25;
  v47 = v22;
  v43 = v6;
  v48 = v24;
  objc_copyWeak(&v45, location);
  v44 = v7;
  v26 = (void *)MEMORY[0x1A8598C40](v41);
  if (HasEntitlement)
    v27 = self->_externallyVerifiedAssociatedDomains;
  else
    v27 = 0;
  v28 = (void *)MEMORY[0x1E0D8A060];
  if (v25)
    v29 = v25;
  else
    v29 = &stru_1E4AC8470;
  webFrameIdentifier = self->_webFrameIdentifier;
  webViewURL = self->_webViewURL;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_216;
  v37[3] = &unk_1E4AC36D8;
  v40 = v24;
  v39 = v26;
  v32 = v25;
  v38 = v32;
  v33 = v26;
  objc_msgSend(v28, "getCredentialsForAppWithAppID:frameIdentifier:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:", v29, webFrameIdentifier, v27, webViewURL, v37);

  objc_destroyWeak(&v45);
  v7 = v35;
  v6 = v36;
LABEL_27:
  objc_destroyWeak(location);

}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  void *v48;
  char v49;
  char v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  int v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  id v94;
  void *v95;
  id v96;
  unsigned int v97;
  void *v98;
  id obj;
  void *v100;
  uint64_t v101;
  _QWORD v102[4];
  id v103;
  id v104;
  _QWORD v105[5];
  uint8_t buf[8];
  _QWORD v107[5];
  _QWORD v108[4];
  id v109;
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[4];
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[6];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD v123[4];
  id v124;
  id v125;
  _QWORD v126[4];
  id v127;
  id v128;
  _QWORD v129[5];
  id v130;
  id v131;
  id v132;
  id v133;
  char v134;
  char v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v129[0] = MEMORY[0x1E0C809B0];
  v129[1] = 3221225472;
  v129[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2;
  v129[3] = &unk_1E4AC34C8;
  v129[4] = *(_QWORD *)(a1 + 32);
  v96 = v5;
  v130 = v96;
  v134 = *(_BYTE *)(a1 + 72);
  v131 = *(id *)(a1 + 40);
  v135 = *(_BYTE *)(a1 + 73);
  v94 = v6;
  v132 = v94;
  v101 = a1;
  v133 = *(id *)(a1 + 48);
  v95 = (void *)MEMORY[0x1A8598C40](v129);
  objc_msgSend(MEMORY[0x1E0D8A020], "sharedFeatureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v7, "shouldAutoFillPasswordsFromKeychain");

  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enabledExtensions");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v98, "count"))
    v9 = v97;
  else
    v9 = 0;
  v10 = (v9 & 1) == 0 && (unint64_t)objc_msgSend(v98, "count") < 2;
  if (*(_BYTE *)(a1 + 74))
  {
    objc_msgSend(v98, "safari_filterObjectsUsingBlock:", &__block_literal_global_157);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v13 = v12 != 0;
    v10 = v12 + v97 == 1;
  }
  else
  {
    v13 = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1008))
  {
    if (objc_msgSend(v98, "count"))
      v14 = v10;
    else
      v14 = 1;
    if ((v14 & 1) != 0)
    {
LABEL_16:
      if (*(_BYTE *)(a1 + 74))
      {
        if (v13)
        {
          v126[0] = MEMORY[0x1E0C809B0];
          v126[1] = 3221225472;
          v126[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_158;
          v126[3] = &unk_1E4AC3530;
          objc_copyWeak(&v128, (id *)(a1 + 64));
          v127 = v98;
          v15 = MEMORY[0x1A8598C40](v126);
          v16 = *(_QWORD *)(a1 + 32);
          v17 = *(void **)(v16 + 1088);
          *(_QWORD *)(v16 + 1088) = v15;

          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          objc_destroyWeak(&v128);
          goto LABEL_79;
        }
      }
      else if (objc_msgSend(v98, "count"))
      {
        v123[0] = MEMORY[0x1E0C809B0];
        v123[1] = 3221225472;
        v123[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3;
        v123[3] = &unk_1E4AC3530;
        objc_copyWeak(&v125, (id *)(a1 + 64));
        v124 = v98;
        v21 = MEMORY[0x1A8598C40](v123);
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 1088);
        *(_QWORD *)(v22 + 1088) = v21;

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        objc_destroyWeak(&v125);
        goto LABEL_79;
      }
      v25 = MEMORY[0x1A8598C40](v95);
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(v26 + 1088);
      *(_QWORD *)(v26 + 1088) = v25;

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_79;
    }
  }
  else if (v10)
  {
    goto LABEL_16;
  }
  if (*(_BYTE *)(a1 + 74))
  {
    v18 = 0;
    v19 = 0;
    v20 = (void *)MEMORY[0x1E0DC3450];
  }
  else
  {
    v24 = objc_msgSend(v96, "count");
    v20 = (void *)MEMORY[0x1E0DC3450];
    if (v24)
    {
      _WBSLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
  }
  _SFDeviceIsPad();
  objc_msgSend(v20, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v19, 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v96;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v120;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v120 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
        v32 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "site");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "isExternal"))
        {
          objc_msgSend(v31, "externalCredential");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D8A060], "titleForCredentialIdentity:formURL:", v36, 0);
          v37 = objc_claimAutoreleasedReturnValue();

          v35 = (void *)v37;
        }
        objc_msgSend(v31, "user");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "creationDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFCredentialDisplayData descriptionForPasswordWithUser:creationDate:](SFCredentialDisplayData, "descriptionForPasswordWithUser:creationDate:", v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v118[0] = MEMORY[0x1E0C809B0];
        v118[1] = 3221225472;
        v118[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4;
        v118[3] = &unk_1E4AC3558;
        v118[4] = *(_QWORD *)(v101 + 32);
        v118[5] = v31;
        +[SFMultipleLineAlertAction actionWithTitle:detail:handler:](SFMultipleLineAlertAction, "actionWithTitle:detail:handler:", v40, v35, v118);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addAction:", v41);

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v137, 16);
    }
    while (v28);
  }

  _WBSLocalizedString();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v98, "count"))
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v43 = v98;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v115;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v115 != v45)
            objc_enumerationMutation(v43);
          v47 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "extensionSupportsTextInsertion:", v47);

          if (*(_BYTE *)(v101 + 74))
            v50 = v49;
          else
            v50 = 1;
          if ((v50 & 1) != 0)
          {
            objc_msgSend(*(id *)(v101 + 32), "_actionForPresentingPasswordManagerExtension:", v47);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "addAction:", v51);

          }
        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v114, v136, 16);
      }
      while (v44);
    }

    if (!objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabled"))
      objc_msgSend(MEMORY[0x1E0DD9910], "keychainSyncEnabled");
    _WBSLocalizedString();
    v52 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v52;
  }
  if (v97)
  {
    v53 = (void *)MEMORY[0x1E0DC3448];
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5;
    v112[3] = &unk_1E4AC3580;
    v113 = v95;
    objc_msgSend(v53, "actionWithTitle:style:handler:", v42, 0, v112);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "addAction:", v54);

  }
  objc_msgSend(v100, "actions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "count") == 0;

  if (v56)
  {
    objc_msgSend(v98, "safari_mapObjectsUsingBlock:", &__block_literal_global_180);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v98, "count"))
    {
      case 0:
        _WBSLocalizedString();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 0;
        v66 = 1;
        goto LABEL_69;
      case 1:
        v68 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringWithFormat:", v69, v70, v71);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = 1;
        goto LABEL_68;
      case 2:
        v72 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "stringWithFormat:", v69, v70, v71);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_67;
      case 3:
        v73 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", 2);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "stringWithFormat:", v69, v70, v71, v74);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_67:
        v65 = 0;
LABEL_68:

        v66 = 0;
LABEL_69:
        v75 = (void *)MEMORY[0x1E0DC3450];
        _WBSLocalizedString();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "alertControllerWithTitle:message:imageNamed:preferredStyle:", v76, v64, CFSTR("alert-passwords"), 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        if (v66)
        {
          v78 = (void *)MEMORY[0x1E0DC3448];
          _WBSLocalizedString();
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v111[0] = MEMORY[0x1E0C809B0];
          v111[1] = 3221225472;
          v111[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_194;
          v111[3] = &unk_1E4AC35E8;
          v111[4] = *(_QWORD *)(v101 + 32);
          objc_msgSend(v78, "actionWithTitle:style:handler:", v79, 0, v111);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addAction:", v80);

          v81 = (void *)MEMORY[0x1E0DC3448];
          _WBSLocalizedString();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v110[0] = MEMORY[0x1E0C809B0];
          v110[1] = 3221225472;
          v110[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_200;
          v110[3] = &unk_1E4AC35E8;
          v110[4] = *(_QWORD *)(v101 + 32);
          objc_msgSend(v81, "actionWithTitle:style:handler:", v82, 0, v110);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addAction:", v83);

        }
        else
        {
          if (v65)
          {
            v84 = (void *)MEMORY[0x1E0DC3448];
            v85 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString();
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "stringWithFormat:", v86, v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v108[0] = MEMORY[0x1E0C809B0];
            v108[1] = 3221225472;
            v108[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_203;
            v108[3] = &unk_1E4AC35E8;
            v109 = v98;
            objc_msgSend(v84, "actionWithTitle:style:handler:", v88, 0, v108);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "addAction:", v89);

          }
          v90 = (void *)MEMORY[0x1E0DC3448];
          _WBSLocalizedString();
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v107[0] = MEMORY[0x1E0C809B0];
          v107[1] = 3221225472;
          v107[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_207;
          v107[3] = &unk_1E4AC35E8;
          v107[4] = *(_QWORD *)(v101 + 32);
          objc_msgSend(v90, "actionWithTitle:style:handler:", v91, 0, v107);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addAction:", v92);

        }
        objc_msgSend(*(id *)(v101 + 32), "presentViewController:animated:completion:", v77, 1, 0);
        v93 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A3B2D000, v93, OS_LOG_TYPE_INFO, "There is no available CPE that supports explicit AutoFill.", buf, 2u);
        }
        (*(void (**)(void))(*(_QWORD *)(v101 + 56) + 16))();

        break;
      default:
        v67 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
          __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_cold_1();
        (*(void (**)(void))(*(_QWORD *)(v101 + 56) + 16))();
        break;
    }

  }
  else
  {
    v57 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_212;
    v105[3] = &unk_1E4AC35E8;
    v105[4] = *(_QWORD *)(v101 + 32);
    objc_msgSend(v57, "actionWithTitle:style:handler:", v58, 1, v105);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "addAction:", v59);

    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_213;
    v102[3] = &unk_1E4AC3530;
    objc_copyWeak(&v104, (id *)(v101 + 64));
    v103 = v100;
    v60 = MEMORY[0x1A8598C40](v102);
    v61 = *(_QWORD *)(v101 + 32);
    v62 = *(void **)(v61 + 1088);
    *(_QWORD *)(v61 + 1088) = v60;

    (*(void (**)(void))(*(_QWORD *)(v101 + 56) + 16))();
    objc_destroyWeak(&v104);
  }

LABEL_79:
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  SFAccountPickerConfiguration *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  char v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  SFAccountPickerViewController *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  id v69;
  char v70;
  _QWORD v71[5];
  char v72;
  _OWORD v73[2];
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  id v80;
  __int128 v81;
  __int128 v82;
  _BYTE buf[32];
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_hostApplicationBundleIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v63);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedNameForContext:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v4;
  if (!objc_msgSend(v4, "length"))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_3();
  }
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 1016), "safari_originalDataAsString");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safari_mapObjectsUsingBlock:", &__block_literal_global_122);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 72))
    goto LABEL_11;
  v6 = *(void **)(*(_QWORD *)v2 + 1048);
  v7 = *(_QWORD *)(*(_QWORD *)v2 + 1040);
  if (!v6)
  {
    if (v7)
      goto LABEL_9;
LABEL_11:
    v6 = v4;
    if (!v4)
    {
LABEL_13:
      v8 = *(void **)v2;
      goto LABEL_14;
    }
LABEL_12:
    objc_msgSend(v67, "addObject:", v6);
    goto LABEL_13;
  }
  if (!v7)
    goto LABEL_12;
LABEL_9:
  objc_msgSend(v67, "addObject:", *(_QWORD *)(*(_QWORD *)v2 + 1040));
  v8 = *(void **)v2;
  v6 = *(void **)(*(_QWORD *)v2 + 1048);
  if (v6)
    goto LABEL_12;
LABEL_14:
  if (v8)
  {
    objc_msgSend(v8, "_hostAuditToken");
  }
  else
  {
    v78 = 0u;
    v79 = 0u;
  }
  v9 = *(id *)(a1 + 48);
  *(_OWORD *)buf = v78;
  *(_OWORD *)&buf[16] = v79;
  if (WBSAuditTokenHasEntitlement())
  {

LABEL_19:
    v10 = 1;
LABEL_29:
    v17 = *(_QWORD *)(a1 + 48);
    v76 = 0;
    v77 = 0;
    objc_msgSend(MEMORY[0x1E0D8AAA8], "getHintStringsForAppID:appNames:matchedSites:urlString:outServiceNameHintStrings:outDomainHintStrings:", v17, v67, v62, v61, &v77, &v76);
    v64 = v77;
    v65 = v76;
    v18 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v57 = *(_QWORD *)(a1 + 32);
      v58 = *(_QWORD *)(a1 + 48);
      v59 = objc_msgSend(v62, "count");
      *(_DWORD *)buf = 134219522;
      *(_QWORD *)&buf[4] = v57;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v58;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v67;
      v84 = 2048;
      v85 = v59;
      v86 = 2112;
      v87 = v61;
      v88 = 2112;
      v89 = v64;
      v90 = 2112;
      v91 = v65;
      _os_log_debug_impl(&dword_1A3B2D000, v18, OS_LOG_TYPE_DEBUG, "Password view controller %p requested hint strings for app ID \"%@\", appNames %@, number of matchedSites %lu, urlString %@; got service name hint strings: %@ and domain hint strings: %@",
        buf,
        0x48u);
    }

    goto LABEL_32;
  }
  v81 = v78;
  v82 = v79;
  if ((WBSAuditTokenHasEntitlement() & 1) != 0)
  {
    v80 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", v9, &v80);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v80;
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v11, "entitlements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:ofClass:", CFSTR("com.apple.developer.web-browser"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if ((v16 & 1) != 0)
        goto LABEL_19;
    }
    else
    {

    }
  }
  else
  {

  }
  if (!*(_QWORD *)(*(_QWORD *)v2 + 1016) || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v10 = 0;
    goto LABEL_29;
  }
  v56 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_2();
  v10 = 0;
  v64 = 0;
  v65 = 0;
LABEL_32:
  v19 = objc_alloc_init(SFAccountPickerConfiguration);
  -[SFAccountPickerConfiguration setMinimumNumberOfCredentialsToShowLikelyMatchesSection:](v19, "setMinimumNumberOfCredentialsToShowLikelyMatchesSection:", 10);
  -[SFAccountPickerConfiguration setServiceNameHintStrings:](v19, "setServiceNameHintStrings:", v64);
  -[SFAccountPickerConfiguration setDomainHintStrings:](v19, "setDomainHintStrings:", v65);
  if ((_DWORD)v10)
    -[SFAccountPickerConfiguration setCurrentWebFrameIdentifierForAutoFillPasskeys:](v19, "setCurrentWebFrameIdentifierForAutoFillPasskeys:", *(_QWORD *)(*(_QWORD *)v2 + 1072));
  objc_msgSend(v67, "firstObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 73) || !objc_msgSend(*(id *)(*(_QWORD *)v2 + 1104), "isExplicitAutoFillMode"))
  {
    if ((_DWORD)v10)
    {
      v20 = *(void **)(*(_QWORD *)v2 + 1016);
      if (v20)
      {
        objc_msgSend(v20, "safari_userVisibleString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v24, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountPickerConfiguration setPrompt:](v19, "setPrompt:", v25);

        v26 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v27, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountPickerConfiguration setPromptWhenPasskeysAreAvailable:](v19, "setPromptWhenPasskeysAreAvailable:", v28);

LABEL_41:
        goto LABEL_43;
      }
    }
    if (objc_msgSend(v66, "length"))
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v30, v66);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountPickerConfiguration setPrompt:](v19, "setPrompt:", v31);

      v32 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", v22, v66);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountPickerConfiguration setPromptWhenPasskeysAreAvailable:](v19, "setPromptWhenPasskeysAreAvailable:", v27);
      goto LABEL_41;
    }
  }
  _WBSLocalizedString();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountPickerConfiguration setPrompt:](v19, "setPrompt:", v33);

  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountPickerConfiguration setPromptWhenPasskeysAreAvailable:](v19, "setPromptWhenPasskeysAreAvailable:", v22);
LABEL_43:

  -[SFAccountPickerConfiguration setShouldEnableAddingNewPasswordsIfPossible:](v19, "setShouldEnableAddingNewPasswordsIfPossible:", 1);
  -[SFAccountPickerConfiguration setShouldShowAutoFillPasskeys:](v19, "setShouldShowAutoFillPasskeys:", 1);
  v34 = *(void **)v2;
  v35 = v10 ^ 1;
  if (!*(_QWORD *)(*(_QWORD *)v2 + 1072))
    v35 = 1;
  if ((v35 & 1) != 0
    || (-[SFAccountPickerConfiguration setShouldShowPasskeysInAccountPicker:](v19, "setShouldShowPasskeysInAccountPicker:", 1), (v34 = *(void **)v2) != 0))
  {
    objc_msgSend(v34, "_hostAuditToken");
  }
  else
  {
    v74 = 0u;
    v75 = 0u;
  }
  v73[0] = v74;
  v73[1] = v75;
  -[SFAccountPickerConfiguration setConnectedAppAuditToken:](v19, "setConnectedAppAuditToken:", v73);
  v36 = objc_msgSend(&unk_1E4B27298, "containsObject:", *(_QWORD *)(a1 + 48));
  if ((_DWORD)v10 && *(_QWORD *)(*(_QWORD *)v2 + 1016))
  {
    objc_msgSend(*(id *)(*(_QWORD *)v2 + 1016), "host");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "safari_highLevelDomainFromHost");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountPickerConfiguration setAddPasswordSuggestedDomain:](v19, "setAddPasswordSuggestedDomain:", v38);

  }
  else if ((v36 & 1) == 0)
  {
    v39 = objc_msgSend(*(id *)(a1 + 56), "length");
    v40 = *(_QWORD *)(a1 + 48);
    if (v39)
    {
      -[SFAccountPickerConfiguration setBundleIDForFallbackIcon:](v19, "setBundleIDForFallbackIcon:", v40);
      -[SFAccountPickerConfiguration setAddPasswordSuggestedDomain:](v19, "setAddPasswordSuggestedDomain:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      -[SFAccountPickerConfiguration setBundleIDForFallbackIcon:](v19, "setBundleIDForFallbackIcon:", v40);
      -[SFAccountPickerConfiguration setAddPasswordSuggestedLabel:](v19, "setAddPasswordSuggestedLabel:", v66);
    }
  }
  if (*(_BYTE *)(a1 + 73))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)v2 + 1104), "autofillMode") == 1)
      v41 = objc_msgSend(*(id *)(*(_QWORD *)v2 + 1104), "isExplicitAutoFillMode");
    else
      v41 = 1;
    -[SFAccountPickerConfiguration setIsForFillingIndividualAccountFields:](v19, "setIsForFillingIndividualAccountFields:", v41);
    -[SFAccountPickerConfiguration setShouldShowReceivedVerificationCodes:](v19, "setShouldShowReceivedVerificationCodes:", 1);
    -[SFAccountPickerConfiguration setWebsiteURLForReceivedVerificationCodes:](v19, "setWebsiteURLForReceivedVerificationCodes:", *(_QWORD *)(*(_QWORD *)v2 + 1016));
    if (objc_msgSend((id)objc_opt_class(), "_shouldRestoreStateForSystemAutoFillForAppID:", *(_QWORD *)(a1 + 48)))objc_msgSend((id)objc_opt_class(), "_restoreStateForSystemAutoFillToAccountPickerConfiguration:", v19);
    else
      objc_msgSend((id)objc_opt_class(), "_rememberStateForSystemAutoFillWithSearchQuery:savedAccount:", 0, 0);
  }
  -[SFAccountPickerConfiguration setAppID:](v19, "setAppID:", *(_QWORD *)(a1 + 48));
  -[SFAccountPickerConfiguration setIsConnectedAppAWebBrowser:](v19, "setIsConnectedAppAWebBrowser:", v10);
  -[SFAccountPickerConfiguration setSavedAccountContext:](v19, "setSavedAccountContext:", *(_QWORD *)(a1 + 64));
  v42 = [SFAccountPickerViewController alloc];
  v43 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_149;
  v71[3] = &unk_1E4AC3478;
  v72 = *(_BYTE *)(a1 + 73);
  v71[4] = *(_QWORD *)(a1 + 32);
  v44 = -[SFAccountPickerViewController initWithConfiguration:completionHandler:](v42, "initWithConfiguration:completionHandler:", v19, v71);
  v45 = *(void **)(*(_QWORD *)v2 + 1000);
  *(_QWORD *)(*(_QWORD *)v2 + 1000) = v44;

  objc_msgSend(*(id *)(*(_QWORD *)v2 + 1000), "setModalPresentationStyle:", 2);
  v46 = *(_QWORD *)v2;
  objc_msgSend(*(id *)(*(_QWORD *)v2 + 1000), "presentationController");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDelegate:", v46);

  objc_msgSend(*(id *)(*(_QWORD *)v2 + 1000), "setSystemAutoFillDelegate:");
  v48 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_1(v2, v48, v49, v50, v51, v52, v53, v54);
  v55 = *(void **)(a1 + 32);
  v68[0] = v43;
  v68[1] = 3221225472;
  v68[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_152;
  v68[3] = &unk_1E4AC34A0;
  v68[4] = v55;
  v70 = *(_BYTE *)(a1 + 73);
  v69 = *(id *)(a1 + 48);
  objc_msgSend(v55, "_authenticateToViewOtherPasswordsWithCompletion:", v68);

}

id __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_120(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "site");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_149(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  objc_msgSend(v24, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D8A058]);
    objc_msgSend(v3, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "password");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "highLevelDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "customTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedGroupName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v4, "initWithUser:password:site:creationDate:customTitle:groupName:", v5, v6, v7, v8, v9, v10);

    v12 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "user");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "length"))
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = v13;
      objc_msgSend(v11, "password");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "length"))
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v17 = v16;
      objc_msgSend(v11, "site");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      v26 = v14;
      v27 = 2114;
      v28 = v17;
      v29 = 2114;
      v30 = v19;
      v20 = v19;
      _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_DEFAULT, "Sending credential with non-empty username: %{public}@, non-empty password: %{public}@, non-empty site: %{public}@", buf, 0x20u);

    }
    v21 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v11, "user");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "site");
      objc_claimAutoreleasedReturnValue();
      __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "_sendCredentialToClientAndDismiss:", v11);
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v22, OS_LOG_TYPE_DEFAULT, "Not sending a credential because we didn't receive one from the password picker", buf, 2u);
    }
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend((id)objc_opt_class(), "_rememberStateForSystemAutoFillWithSearchQuery:savedAccount:", 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "_dismiss");
  }

}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_152(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_152_cold_1(a1, a2, v6);
  if ((_DWORD)a2)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = objc_opt_class();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000);
      v11 = 134218498;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      _os_log_debug_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEBUG, "View controller %p presenting password view controller %{public}@ <%p>", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "setAuthenticatedContext:", v5);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000), 1, 0);
    if (*(_BYTE *)(a1 + 48))
      objc_storeStrong((id *)&lastUsedAppIDForSystemAutoFill, *(id *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_dismiss");
  }

}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_155(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D8A048], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "extensionSupportsTextInsertion:", v2);

  return v4;
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_158(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_presentCredentialListForExtension:", v2);

}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_presentCredentialListForExtension:", v2);

}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  +[_SFManagedFeatureObserver sharedObserver](_SFManagedFeatureObserver, "sharedObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_fillCredential:needsAuthentication:", v2, objc_msgSend(v3, "authenticationRequiredToAutoFill"));

}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  objc_msgSend(v2, "sf_bundleIdentifierForContainingApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_194(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_196;
  v2[3] = &unk_1E4AC1230;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0C925E0], "openCredentialProviderAppSettingsWithCompletionHandler:", v2);
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_196(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_200(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_203(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sf_bundleIdentifierForContainingApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_206;
  v6[3] = &unk_1E4AC3610;
  v5 = v2;
  v7 = v5;
  objc_msgSend(v3, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v5, v4, v6);

}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_206(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;

  if (a3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_206_cold_1(a1, v4);
  }
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_207(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_212(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_213(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_3_216(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD block[4];
  id v11;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_217;
    block[3] = &unk_1E4AC3660;
    v4 = &v11;
    v11 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D8A060];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_218;
    v7[3] = &unk_1E4AC36B0;
    v6 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v8 = v3;
    objc_msgSend(v5, "bestDomainForAppID:completionHandler:", v6, v7);
    v4 = &v9;

  }
}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_4_217(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_218(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_6_219;
  block[3] = &unk_1E4AC3688;
  v8 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_6_219(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sendCredentialToClientAndDismiss:(id)a3
{
  id v4;
  int HasEntitlement;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  v4 = a3;
  -[SFPasswordPickerServiceViewController _hostAuditToken](self, "_hostAuditToken");
  HasEntitlement = WBSAuditTokenHasEntitlement();
  v6 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[SFPasswordPickerServiceViewController _sendCredentialToClientAndDismiss:].cold.1();
    if (HasEntitlement)
      goto LABEL_3;
LABEL_7:
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke;
    v9[3] = &unk_1E4AC1080;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DBDB50], "sendAutofillCredentialCandidate:completionHandler:", v4, v9);
    goto LABEL_8;
  }
  if (!HasEntitlement)
    goto LABEL_7;
LABEL_3:
  v7 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_INFO, "Dismissing password picker service view controller after sending credential directly", buf, 2u);
  }
  -[SFPasswordPickerServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedCredential:", v4);

  -[SFPasswordPickerServiceViewController _dismiss](self, "_dismiss");
LABEL_8:

}

void __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke_2;
  block[3] = &unk_1E4AC1080;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __75__SFPasswordPickerServiceViewController__sendCredentialToClientAndDismiss___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Dismissing password picker service view controller after sending credential via TextInput", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (BOOL)_isClientEntitledToDirectlyReceiveCredentials
{
  -[SFPasswordPickerServiceViewController _hostAuditToken](self, "_hostAuditToken");
  return WBSAuditTokenHasEntitlement();
}

- (void)setWebViewURL:(id)a3
{
  NSURL *v4;
  NSObject *v5;
  NSURL *webViewURL;

  v4 = (NSURL *)a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController setWebViewURL:].cold.1();
  webViewURL = self->_webViewURL;
  self->_webViewURL = v4;

}

- (void)setRemoteAppID:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *remoteAppID;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController setRemoteAppID:].cold.1();
  v6 = (NSString *)objc_msgSend(v4, "copy");
  remoteAppID = self->_remoteAppID;
  self->_remoteAppID = v6;

}

- (void)setRemoteLocalizedAppName:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *remoteLocalizedAppName;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController setRemoteLocalizedAppName:].cold.1();
  v6 = (NSString *)objc_msgSend(v4, "copy");
  remoteLocalizedAppName = self->_remoteLocalizedAppName;
  self->_remoteLocalizedAppName = v6;

}

- (void)setRemoteUnlocalizedAppName:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *remoteUnlocalizedAppName;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController setRemoteUnlocalizedAppName:].cold.1();
  v6 = (NSString *)objc_msgSend(v4, "copy");
  remoteUnlocalizedAppName = self->_remoteUnlocalizedAppName;
  self->_remoteUnlocalizedAppName = v6;

}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *externallyVerifiedAssociatedDomains;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:].cold.1();
  v6 = (NSArray *)objc_msgSend(v4, "copy");
  externallyVerifiedAssociatedDomains = self->_externallyVerifiedAssociatedDomains;
  self->_externallyVerifiedAssociatedDomains = v6;

}

- (void)setAuthenticationGracePeriod:(double)a3
{
  NSObject *v5;
  uint64_t v6;

  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController setAuthenticationGracePeriod:].cold.1((uint64_t)self, v5, v6, a3);
  self->_authenticationGracePeriod = a3;
}

- (void)setPageID:(id)a3 frameID:(id)a4 credentialType:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  WBSGlobalFrameIdentifier *v12;
  WBSGlobalFrameIdentifier *webFrameIdentifier;
  int v14;
  SFPasswordPickerServiceViewController *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218754;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_1A3B2D000, v11, OS_LOG_TYPE_DEBUG, "View controller %p setPageID: %@ frameID: %@ credentialType: %@", (uint8_t *)&v14, 0x2Au);
    if (!v8)
      goto LABEL_5;
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (v9)
  {
    v12 = (WBSGlobalFrameIdentifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A978]), "initWithPageID:frameID:", v8, v9);
    webFrameIdentifier = self->_webFrameIdentifier;
    self->_webFrameIdentifier = v12;

    objc_storeStrong((id *)&self->_credentialType, a5);
  }
LABEL_5:

}

- (void)setSystemAutoFillDocumentTraits:(id)a3
{
  id v4;
  NSObject *v5;
  RTIDocumentTraits *v6;
  RTIDocumentTraits *systemAutoFillDocumentTraits;

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFPasswordPickerServiceViewController setSystemAutoFillDocumentTraits:].cold.1();
  v6 = (RTIDocumentTraits *)objc_msgSend(v4, "copy");
  systemAutoFillDocumentTraits = self->_systemAutoFillDocumentTraits;
  self->_systemAutoFillDocumentTraits = v6;

}

- (BOOL)_isConfiguredForSystemAutoFill
{
  int HasEntitlement;

  -[SFPasswordPickerServiceViewController _hostAuditToken](self, "_hostAuditToken");
  HasEntitlement = WBSAuditTokenHasEntitlement();
  if (HasEntitlement)
    LOBYTE(HasEntitlement) = self->_systemAutoFillDocumentTraits != 0;
  return HasEntitlement;
}

- (void)credentialListViewController:(id)a3 didFinishWithCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v22;
  void *v23;
  void *v24;
  SFCredentialIdentity *credentialIdentityToFill;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  SFPasswordPickerServiceViewController *v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __105__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithCredential_completion___block_invoke;
  v29[3] = &unk_1E4AC3688;
  v11 = v10;
  v32 = v11;
  v12 = v9;
  v30 = v12;
  v31 = self;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v29);
  if (v12)
  {
    v13 = objc_alloc(MEMORY[0x1E0D8A058]);
    objc_msgSend(v12, "user");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "password");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v13, "initWithUser:password:site:creationDate:customTitle:groupName:", v14, v15, &stru_1E4AC8470, v16, 0, 0);

    -[SFPasswordPickerServiceViewController _sendCredentialToClientAndDismiss:](self, "_sendCredentialToClientAndDismiss:", v27);
    -[SFPasswordServiceViewController applicationIdentifier](self, "applicationIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v17, "safari_bundleIdentifierFromApplicationIdentifier:", &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v28;

    if (v19)
    {
      v20 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[SFPasswordPickerServiceViewController credentialListViewController:didFinishWithCredential:completion:].cold.1();
      }

    }
    else
    {
      authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
      objc_msgSend(v12, "user");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCredentialIdentity site](self->_credentialIdentityToFill, "site");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "extension");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAuthenticationServicesAgentProxy didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:](authenticationServicesAgentProxy, "didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", v26, v22, v24, v18);

    }
    credentialIdentityToFill = self->_credentialIdentityToFill;
    self->_credentialIdentityToFill = 0;

  }
}

uint64_t __105__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithCredential_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_dismiss");
  return result;
}

- (void)credentialListViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v18 = a5;
  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  -[SFPasswordServiceViewController applicationIdentifier](self, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relyingParty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authenticatorData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signature");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userHandle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "credentialID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSAuthenticationServicesAgentProxy completeAssertionWithExternalPasskeyForApplicationIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:](authenticationServicesAgentProxy, "completeAssertionWithExternalPasskeyForApplicationIdentifier:relyingPartyIdentifier:authenticatorData:signature:userHandle:credentialID:", v11, v12, v13, v14, v15, v16);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __121__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke;
  v19[3] = &unk_1E4AC0FB8;
  v17 = v18;
  v19[4] = self;
  v20 = v17;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v19);

}

uint64_t __121__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithPasskeyAssertionCredential_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (void)credentialListViewController:(id)a3 didFinishWithText:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  SFPasswordPickerServiceViewController *v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithText_completion___block_invoke;
  v14[3] = &unk_1E4AC3688;
  v10 = v9;
  v17 = v10;
  v11 = v8;
  v15 = v11;
  v16 = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v14);
  if (objc_msgSend(v11, "length"))
  {
    -[SFPasswordPickerServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fillText:", v11);

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SFPasswordPickerServiceViewController credentialListViewController:didFinishWithText:completion:].cold.1();
  }

}

uint64_t __99__SFPasswordPickerServiceViewController_credentialListViewController_didFinishWithText_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  result = objc_msgSend(*(id *)(a1 + 32), "length");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 40), "_dismiss");
  return result;
}

- (void)presentUIForPasswordCredentialAuthenticationViewController:(id)a3
{
  -[SFPasswordPickerServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  _ASCredentialAuthenticationViewController *externalCredentialViewController;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v25;
  void *v26;
  void *v27;
  SFCredentialIdentity *credentialIdentityToFill;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  SFPasswordPickerServiceViewController *v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;

  objc_msgSend(v9, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __121__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke;
  v34[3] = &unk_1E4AC3688;
  v14 = v11;
  v37 = v14;
  v15 = v10;
  v35 = v15;
  v36 = self;
  v32 = (void *)MEMORY[0x1A8598C40](v34);
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v32);
  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D8A058]);
    objc_msgSend(v15, "user");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "password");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v16, "initWithUser:password:site:creationDate:customTitle:groupName:", v17, v18, &stru_1E4AC8470, v19, 0, 0);

    if (v13)
    {
      v20 = 0;
    }
    else
    {
      +[_SFManagedFeatureObserver sharedObserver](_SFManagedFeatureObserver, "sharedObserver");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "authenticationRequiredToAutoFill");
    }
    -[SFPasswordPickerServiceViewController _sendCredentialToClient:needsAuthentication:](self, "_sendCredentialToClient:needsAuthentication:", v31, v20);
    if (!v13)

    -[SFPasswordServiceViewController applicationIdentifier](self, "applicationIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v21, "safari_bundleIdentifierFromApplicationIdentifier:", &v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v33;

    if (v22)
    {
      v23 = (id)WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[SFPasswordPickerServiceViewController credentialListViewController:didFinishWithCredential:completion:].cold.1();
      }

    }
    else
    {
      authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
      objc_msgSend(v15, "user");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCredentialIdentity site](self->_credentialIdentityToFill, "site");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "extension");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAuthenticationServicesAgentProxy didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:](authenticationServicesAgentProxy, "didFillCredentialForUsername:forHost:fromProviderWithBundleIdentifier:inAppWithBundleIdentifier:", v29, v25, v27, v30);

    }
    credentialIdentityToFill = self->_credentialIdentityToFill;
    self->_credentialIdentityToFill = 0;

  }
}

uint64_t __121__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithCredential_error_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 40), "_dismiss");
  return result;
}

- (void)credentialAuthenticationViewController:(id)a3 didFinishWithPasskeyAssertionCredential:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  _ASCredentialAuthenticationViewController *externalCredentialViewController;
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

  v9 = a3;
  v10 = a4;
  v20 = a6;
  externalCredentialViewController = self->_externalCredentialViewController;
  self->_externalCredentialViewController = 0;

  authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
  -[SFPasswordServiceViewController applicationIdentifier](self, "applicationIdentifier");
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
  v21[2] = __137__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke;
  v21[3] = &unk_1E4AC0FB8;
  v19 = v20;
  v21[4] = self;
  v22 = v19;
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, v21);

}

uint64_t __137__SFPasswordPickerServiceViewController_credentialAuthenticationViewController_didFinishWithPasskeyAssertionCredential_error_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

- (void)accountPickerViewController:(id)a3 fillUsernameForSavedAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (-[SFPasswordPickerServiceViewController _isClientEntitledToDirectlyReceiveCredentials](self, "_isClientEntitledToDirectlyReceiveCredentials"))
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v6, "searchQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_rememberStateForSystemAutoFillWithSearchQuery:savedAccount:", v9, v7);

    -[SFPasswordPickerServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "user");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fillUsername:", v11);

    -[SFPasswordPickerServiceViewController _dismiss](self, "_dismiss");
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:].cold.1();
  }

}

- (void)accountPickerViewController:(id)a3 fillPasswordForSavedAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (-[SFPasswordPickerServiceViewController _isClientEntitledToDirectlyReceiveCredentials](self, "_isClientEntitledToDirectlyReceiveCredentials"))
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v6, "searchQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_rememberStateForSystemAutoFillWithSearchQuery:savedAccount:", v9, v7);

    -[SFPasswordPickerServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fillPassword:", v11);

    -[SFPasswordPickerServiceViewController _dismiss](self, "_dismiss");
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:].cold.1();
  }

}

- (void)accountPickerViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (-[SFPasswordPickerServiceViewController _isClientEntitledToDirectlyReceiveCredentials](self, "_isClientEntitledToDirectlyReceiveCredentials"))
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend(v6, "searchQuery");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_rememberStateForSystemAutoFillWithSearchQuery:savedAccount:", v9, v7);

    -[SFPasswordPickerServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentOneTimeCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fillVerificationCode:", v11);

    -[SFPasswordPickerServiceViewController _dismiss](self, "_dismiss");
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:].cold.1();
  }

}

- (void)accountPickerViewController:(id)a3 fillVerificationCode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a4;
  if (-[SFPasswordPickerServiceViewController _isClientEntitledToDirectlyReceiveCredentials](self, "_isClientEntitledToDirectlyReceiveCredentials"))
  {
    -[SFPasswordPickerServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "code");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fillVerificationCode:", v7);

    -[SFPasswordPickerServiceViewController _dismiss](self, "_dismiss");
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXAppPasswordAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFPasswordPickerServiceViewController accountPickerViewController:fillUsernameForSavedAccount:].cold.1();
  }

}

+ (BOOL)_shouldRestoreStateForSystemAutoFillForAppID:(id)a3
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;

  LODWORD(v3) = objc_msgSend(a3, "isEqualToString:", lastUsedAppIDForSystemAutoFill);
  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v5 - *(double *)&timeIntervalSinceReferenceDateOfLastSystemAutoFill;

    if (v6 <= 120.0)
    {
      v3 = objc_msgSend((id)lastSearchQueryForSystemAutoFill, "length");
      LOBYTE(v3) = (v3 | lastUsedSavedAccountForSystemAutoFill) != 0;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (void)_restoreStateForSystemAutoFillToAccountPickerConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setInitialSearchQuery:", lastSearchQueryForSystemAutoFill);
  objc_msgSend(v4, "setSavedAccountToInitiallyShowDetailsFor:", lastUsedSavedAccountForSystemAutoFill);
  objc_msgSend(a1, "_rememberStateForSystemAutoFillWithSearchQuery:savedAccount:", 0, 0);

}

+ (void)_rememberStateForSystemAutoFillWithSearchQuery:(id)a3 savedAccount:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_storeStrong((id *)&lastSearchQueryForSystemAutoFill, a3);
  objc_storeStrong((id *)&lastUsedSavedAccountForSystemAutoFill, a4);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  timeIntervalSinceReferenceDateOfLastSystemAutoFill = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAutoFillDocumentTraits, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong(&self->_presentCredentialsHandler, 0);
  objc_storeStrong((id *)&self->_credentialType, 0);
  objc_storeStrong((id *)&self->_webFrameIdentifier, 0);
  objc_storeStrong((id *)&self->_externallyVerifiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_remoteUnlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_remoteLocalizedAppName, 0);
  objc_storeStrong((id *)&self->_remoteAppID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_webViewURL, 0);
  objc_storeStrong((id *)&self->_accountPickerViewController, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_credentialIdentityToFill, 0);
  objc_storeStrong((id *)&self->_externalCredentialViewController, 0);
}

void __89__SFPasswordPickerServiceViewController__authenticateToViewOtherPasswordsWithCompletion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to get authentication for other passwords: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_12(v2, v3, v4, 5.8081e-34);
  OUTLINED_FUNCTION_2_3(&dword_1A3B2D000, v7, v5, "Sending credential with username: %{private}@, site: %{private}@", v6);

  OUTLINED_FUNCTION_3_0();
}

void __85__SFPasswordPickerServiceViewController__sendCredentialToClient_needsAuthentication___block_invoke_117_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to get authentication to fill password with error: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_0(&dword_1A3B2D000, v0, v1, "View controller %p is configured for system AutoFill: %{BOOL}d");
  OUTLINED_FUNCTION_3_2();
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "View controller %p resolved app ID for credential lookup: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:completionHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_0(&dword_1A3B2D000, v0, v1, "View controller %p resolved that host app can set remote app properties: %d", v2, v3);
  OUTLINED_FUNCTION_3_2();
}

- (void)_authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, a2, a3, "View controller %p will show passwords", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_2();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1A3B2D000, v0, OS_LOG_TYPE_FAULT, "We don't support more than 3 credential provider extensions. If we ever do, then change this switch statement.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, a2, a3, "View controller %p attempting to authenticate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_2();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1A3B2D000, v0, OS_LOG_TYPE_DEBUG, "Not requesting hint strings.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Unable to get localized app name for host app", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_152_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5_0(&dword_1A3B2D000, a2, a3, "View controller %p got authentication result %d ", (const void *)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3_2();
}

void __127__SFPasswordPickerServiceViewController__authenticateAndSetPresentCredentialsHandlerWithSavedAccountContext_completionHandler___block_invoke_5_206_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Failed to open app with bundle ID %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_3_2();
}

- (void)_sendCredentialToClientAndDismiss:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_0(&dword_1A3B2D000, v0, v1, "View controller %p resolved that host app can receive credentials directly: %d", v2, v3);
  OUTLINED_FUNCTION_3_2();
}

- (void)setWebViewURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "View controller %p setWebViewURL: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setRemoteAppID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "View controller %p setRemoteAppID: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setRemoteLocalizedAppName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "View controller %p setRemoteLocalizedAppName: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setRemoteUnlocalizedAppName:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "View controller %p setRemoteUnlocalizedAppName: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "View controller %p setExternallyVerifiedAndApprovedSharedWebCredentialsDomains: %@");
  OUTLINED_FUNCTION_3_2();
}

- (void)setAuthenticationGracePeriod:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_2_3(&dword_1A3B2D000, a2, a3, "View controller %p setAuthenticationGracePeriod: %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_2();
}

- (void)setSystemAutoFillDocumentTraits:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A3B2D000, v0, v1, "View controller %p setSystemAutoFillDocumentTraits: %@d");
  OUTLINED_FUNCTION_3_2();
}

- (void)credentialListViewController:didFinishWithCredential:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to get application bundle identifier with error: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

- (void)credentialListViewController:didFinishWithText:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Received empty text value.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)accountPickerViewController:fillUsernameForSavedAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Client is not allowed to receive credentials directly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
