@implementation AKASAuthorizationProvider

- (AKASAuthorizationProvider)initWithAppName:(id)a3 teamIdentifier:(id)a4 bundleIdentifier:(id)a5 authorizationRequest:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AKASAuthorizationProvider *v15;
  id v16;
  uint64_t v17;
  AKCredentialRequestContext *requestContext;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *requestQueue;
  AKASAuthorizationProvider *v34;
  objc_super v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)AKASAuthorizationProvider;
  v15 = -[AKASAuthorizationProvider init](&v36, sel_init);
  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D00260]);
    objc_msgSend(v16, "setTeamID:", v12);
    objc_msgSend(v16, "setBundleID:", v13);
    objc_msgSend(v16, "setShouldSkipAuthorizationUI:", 1);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D001D0]), "initWithProxiedClientContext:", v16);
    requestContext = v15->_requestContext;
    v15->_requestContext = (AKCredentialRequestContext *)v17;

    objc_msgSend(v14, "authkitAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      _AKLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[AKASAuthorizationProvider initWithAppName:teamIdentifier:bundleIdentifier:authorizationRequest:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

      objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "authKitAccountRequestingAuthorization");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAuthkitAccount:", v29);

    }
    -[AKCredentialRequestContext setAuthorizationRequest:](v15->_requestContext, "setAuthorizationRequest:", v14);
    -[AKCredentialRequestContext authorizationRequest](v15->_requestContext, "authorizationRequest");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setClientID:", v13);

    objc_storeStrong((id *)&v15->_appName, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.AuthKit.AKASAuthorizationProvider", v31);
    requestQueue = v15->_requestQueue;
    v15->_requestQueue = (OS_dispatch_queue *)v32;

    v34 = v15;
  }

  return v15;
}

- (void)performAuthorizationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *requestQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  requestQueue = self->_requestQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7678CF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(requestQueue, v7);

}

void __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  _BYTE *v14;
  _QWORD v15[5];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    _AKLogSystem();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
  else
  {
    v10 = MEMORY[0x1C3B760D8](*(_QWORD *)(a1 + 40));
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v10;

    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_requirePassword");
    v14 = *(_BYTE **)(a1 + 32);
    if ((v13 & 1) != 0 || v14[40])
    {
      objc_msgSend(v14, "_showPasswordAuthenticationViewController");
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_18;
      v15[3] = &unk_1E7679140;
      v15[4] = v14;
      objc_msgSend(v14, "_performAuthorizationWithCompletionHandler:", v15);
    }
  }
}

void __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E7678CC8;
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a1[4];
  v2 = (_QWORD *)a1[5];
  if (v3)
  {
    v4 = v2[3];
    if (v4)
    {
      (*(void (**)(_QWORD))(v4 + 16))(v2[3]);
      v2 = (_QWORD *)a1[5];
      v5 = (void *)v2[3];
    }
    else
    {
      v5 = 0;
    }
    v2[3] = 0;

  }
  else
  {
    objc_msgSend(v2, "_handleAuthorizationError:", a1[6]);
  }
}

- (void)performAuthorizationWithLoginChoice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _AKLogSiwa();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AKASAuthorizationProvider performAuthorizationWithLoginChoice:completionHandler:].cold.1(v8);

    objc_msgSend(v6, "sharedAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCredentialRequestContext authorizationRequest](self->_requestContext, "authorizationRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "set_sharedAccount:", v9);

    -[AKCredentialRequestContext authorizationRequest](self->_requestContext, "authorizationRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set_isAuthorizingUsingSharedAccount:", 1);

  }
  -[AKASAuthorizationProvider performAuthorizationWithCompletionHandler:](self, "performAuthorizationWithCompletionHandler:", v7);

}

- (void)_showPasswordAuthenticationViewController
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  AKAuthorizationPasswordAuthenticationViewController *v9;

  v9 = objc_alloc_init(AKAuthorizationPasswordAuthenticationViewController);
  v3 = objc_alloc(MEMORY[0x1E0D00168]);
  -[AKCredentialRequestContext authorizationRequest](self->_requestContext, "authorizationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authkitAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithUsername:", v6);

  -[AKAuthorizationPasswordAuthenticationViewController setPresentationContext:](v9, "setPresentationContext:", v7);
  -[AKAuthorizationPasswordAuthenticationViewController setDelegate:](v9, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationProvider);
  objc_msgSend(WeakRetained, "authenticationProvider:showViewController:", self, v9);

}

- (void)_performAuthorizationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  AKCredentialRequestContext *requestContext;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D00158]);
  requestContext = self->_requestContext;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__AKASAuthorizationProvider__performAuthorizationWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E7679168;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "performAuthorizationWithContext:completion:", requestContext, v8);

}

uint64_t __72__AKASAuthorizationProvider__performAuthorizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleAuthorizationError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  if (-[AKASAuthorizationProvider _shouldContinueWithPasswordForError:](self, "_shouldContinueWithPasswordForError:", v4))
  {
    self->_didFailWithErrorRequiringPasswordAuth = 1;
  }
  objc_msgSend(MEMORY[0x1E0D00110], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUiProvider:", self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__AKASAuthorizationProvider__handleAuthorizationError___block_invoke;
  v6[3] = &unk_1E7679190;
  v6[4] = self;
  objc_msgSend(v5, "showAlertForError:withCompletion:", v4, v6);

}

void __55__AKASAuthorizationProvider__handleAuthorizationError___block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (a2)
    objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("AKErrorAlertShouldDismissUIAfterPresentationKey"));
  v7 = (void *)MEMORY[0x1E0CB35C8];
  if (v13)
  {
    objc_msgSend(v13, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v13, "code"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFFF10], -7001, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(v10 + 24);
  if (v11)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v9);
    v10 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v10 + 24);
  }
  else
  {
    v12 = 0;
  }
  *(_QWORD *)(v10 + 24) = 0;

}

- (BOOL)_shouldContinueWithPasswordForError:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFFF10]);

  v6 = (v5 & 1) == 0 && (objc_msgSend(v3, "code") == -7006 || objc_msgSend(v3, "code") == -7075);
  return v6;
}

- (_ASAuthenticationProviderLoginRowData)loginRowData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  AKLoginRowData *v7;
  uint64_t v8;
  AKLoginRowData *v9;

  -[AKASAuthorizationProvider _accountNameForLoginChoice:](self, "_accountNameForLoginChoice:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKASAuthorizationProvider _paneTitleForLoginChoice:](self, "_paneTitleForLoginChoice:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKASAuthorizationProvider _detailTextForLoginChoice:](self, "_detailTextForLoginChoice:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKASAuthorizationProvider _iconImageForLoginChoice:](self, "_iconImageForLoginChoice:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [AKLoginRowData alloc];
  if (-[AKCredentialRequestContext _requirePassword](self->_requestContext, "_requirePassword"))
    v8 = 3;
  else
    v8 = 0;
  v9 = -[AKLoginRowData initWithIconImage:paneTitleText:titleText:detailText:authenticationType:](v7, "initWithIconImage:paneTitleText:titleText:detailText:authenticationType:", v6, v4, v3, v5, v8);

  return (_ASAuthenticationProviderLoginRowData *)v9;
}

- (id)loginRowDataForLoginChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AKLoginRowData *v9;
  uint64_t v10;
  AKLoginRowData *v11;

  v4 = a3;
  -[AKASAuthorizationProvider _accountNameForLoginChoice:](self, "_accountNameForLoginChoice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKASAuthorizationProvider _paneTitleForLoginChoice:](self, "_paneTitleForLoginChoice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKASAuthorizationProvider _detailTextForLoginChoice:](self, "_detailTextForLoginChoice:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKASAuthorizationProvider _iconImageForLoginChoice:](self, "_iconImageForLoginChoice:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [AKLoginRowData alloc];
  if (-[AKCredentialRequestContext _requirePassword](self->_requestContext, "_requirePassword"))
    v10 = 3;
  else
    v10 = 0;
  v11 = -[AKLoginRowData initWithIconImage:paneTitleText:titleText:detailText:authenticationType:](v9, "initWithIconImage:paneTitleText:titleText:detailText:authenticationType:", v8, v6, v5, v7, v10);

  return v11;
}

- (id)_accountNameForLoginChoice:(id)a3
{
  void *v3;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (a3)
  {
    objc_msgSend(a3, "user");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAABrandingEnabled");

    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
      objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKCredentialRequestContext authorizationRequest](self->_requestContext, "authorizationRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "authkitAccount");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "familyNameForAccount:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFamilyName:", v11);

      objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKCredentialRequestContext authorizationRequest](self->_requestContext, "authorizationRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "authkitAccount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "givenNameForAccount:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGivenName:", v15);

      v16 = objc_alloc_init(MEMORY[0x1E0CB3858]);
      objc_msgSend(v16, "stringFromPersonNameComponents:", v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x1E0D002B8];
      -[AKCredentialRequestContext authorizationRequest](self->_requestContext, "authorizationRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "authkitAccount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "username");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "formattedUsernameFromUsername:", v20);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)_iconImageForLoginChoice:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize](AKAuthorizationSubPaneMetrics, "scopeImageViewSize");
  v5 = v4;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "sharedAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shareInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "participantHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[AKSignInWithAppleAvatarManager avatarImageForUserHandle:diameter:](AKSignInWithAppleAvatarManager, "avatarImageForUserHandle:diameter:", v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[AKSignInWithAppleAvatarManager avatarImageForPrimaryAccountOwnerWithDiameter:](AKSignInWithAppleAvatarManager, "avatarImageForPrimaryAccountOwnerWithDiameter:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", CFSTR("blackLogo"), v4, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "automaskedImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_paneTitleForLoginChoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *appName;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_PICKER_SHARED_ACCOUNT"), &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    appName = self->_appName;
    -[AKASAuthorizationProvider _accountNameForLoginChoice:](self, "_accountNameForLoginChoice:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, appName, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTHORIZE_APPLE_ACCOUNT_WELCOME_BACK_APPNAME_FORMAT"), &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v7, self->_appName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_detailTextForLoginChoice:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_WITH_APPLE_PICKER"), &stru_1E7679C68, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((isKindOfClass & 1) != 0)
      v10 = CFSTR("AUTHORIZE_SHARED_ACCOUNT_LOGIN_CHOICE_SUBTITLE");
    else
      v10 = CFSTR("AUTHORIZE_EXISTING_ACCOUNT_LOGIN_CHOICE_SUBTITLE");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E7679C68, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ — %@"), v7, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_WITH_APPLE_PICKER"), &stru_1E7679C68, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)passwordAuthenticationCompletedWithResults:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void (**completionHandlerForCurrentRequest)(id, _QWORD, void *);
  id v9;
  _QWORD v10[5];

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "ak_isUserCancelError") & 1) == 0)
    {
      _AKLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[AKASAuthorizationProvider passwordAuthenticationCompletedWithResults:error:].cold.1((uint64_t)v6, v7);

    }
    completionHandlerForCurrentRequest = (void (**)(id, _QWORD, void *))self->_completionHandlerForCurrentRequest;
    if (completionHandlerForCurrentRequest)
    {
      completionHandlerForCurrentRequest[2](completionHandlerForCurrentRequest, 0, v6);
      v9 = self->_completionHandlerForCurrentRequest;
    }
    else
    {
      v9 = 0;
    }
    self->_completionHandlerForCurrentRequest = 0;

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke;
    v10[3] = &unk_1E7679140;
    v10[4] = self;
    -[AKASAuthorizationProvider _performAuthorizationWithCompletionHandler:](self, "_performAuthorizationWithCompletionHandler:", v10);
  }

}

void __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke_2;
  block[3] = &unk_1E7678CC8;
  block[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void __78__AKASAuthorizationProvider_passwordAuthenticationCompletedWithResults_error___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  v2 = a1[4];
  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(v2 + 24);
  if (v3)
  {
    v3[2](v3, a1[5], a1[6]);
    v2 = a1[4];
    v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(v2 + 24);
  }
  *(_QWORD *)(v2 + 24) = 0;

}

- (BOOL)alertHandlerShowAlert:(id)a3 primaryAction:(id)a4 altAction:(id)a5
{
  _ASAuthenticationPresentationProvider **p_presentationProvider;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  p_presentationProvider = &self->_presentationProvider;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_presentationProvider);
  objc_msgSend(WeakRetained, "authenticationProvider:presentAlert:primaryAction:alternateAction:", self, v11, v10, v9);

  return 1;
}

- (_ASAuthenticationPresentationProvider)presentationProvider
{
  return (_ASAuthenticationPresentationProvider *)objc_loadWeakRetained((id *)&self->_presentationProvider);
}

- (void)setPresentationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_presentationProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationProvider);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong(&self->_completionHandlerForCurrentRequest, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)initWithAppName:(uint64_t)a3 teamIdentifier:(uint64_t)a4 bundleIdentifier:(uint64_t)a5 authorizationRequest:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1BD795000, a1, a3, "Request did not contain a preset account. Attempting to set the account.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __71__AKASAuthorizationProvider_performAuthorizationWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1BD795000, a1, a3, "Authentication provider cannot perform request because there is already a request being processed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)performAuthorizationWithLoginChoice:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "Selected shared account from credential picker", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)passwordAuthenticationCompletedWithResults:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "Password authentication failed in authentication provider with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
