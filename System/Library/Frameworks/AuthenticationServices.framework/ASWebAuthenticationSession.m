@implementation ASWebAuthenticationSession

- (ASWebAuthenticationSession)initWithURL:(NSURL *)URL callbackURLScheme:(NSString *)callbackURLScheme completionHandler:(ASWebAuthenticationSessionCompletionHandler)completionHandler
{
  return -[ASWebAuthenticationSession initWithURL:callbackURLScheme:usingEphemeralSession:completionHandler:](self, "initWithURL:callbackURLScheme:usingEphemeralSession:completionHandler:", URL, callbackURLScheme, 0, completionHandler);
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 completionHandler:(id)a5
{
  return -[ASWebAuthenticationSession initWithURL:callback:usingEphemeralSession:jitEnabled:completionHandler:](self, "initWithURL:callback:usingEphemeralSession:jitEnabled:completionHandler:", a3, a4, 0, 1, a5);
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 completionHandler:(id)a6
{
  return -[ASWebAuthenticationSession initWithURL:callbackURLScheme:usingEphemeralSession:jitEnabled:completionHandler:](self, "initWithURL:callbackURLScheme:usingEphemeralSession:jitEnabled:completionHandler:", a3, a4, a5, 1, a6);
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  ASWebAuthenticationSession *v15;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a3;
  +[ASWebAuthenticationSessionCallback callbackWithCustomScheme:](ASWebAuthenticationSessionCallback, "callbackWithCustomScheme:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ASWebAuthenticationSession initWithURL:callback:usingEphemeralSession:jitEnabled:completionHandler:](self, "initWithURL:callback:usingEphemeralSession:jitEnabled:completionHandler:", v13, v14, v8, v7, v12);

  return v15;
}

- (ASWebAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  ASWebAuthenticationSession *v17;
  uint64_t v18;
  id originalCompletionHandler;
  uint64_t v20;
  ASAuthorizationSingleSignOnProvider *ssoProvider;
  NSObject *v22;
  void *v23;
  ASAuthorizationController *v24;
  void *v25;
  uint64_t v26;
  ASAuthorizationController *authorizationController;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_class *v31;
  uint64_t v32;
  SFAuthenticationSession *authenticationSession;
  ASWebAuthenticationSession *v34;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  objc_super v41;
  uint8_t buf[8];
  uint64_t v43;
  Class (*v44)(uint64_t);
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];

  v8 = a6;
  v9 = a5;
  v51[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(v13, "customScheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "containsString:", CFSTR(":")) & 1) != 0
    || objc_msgSend(v15, "containsString:", CFSTR("/")))
  {
    v16 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ASWebAuthenticationSession initWithURL:callback:usingEphemeralSession:jitEnabled:completionHandler:].cold.1(v16);
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("The provided scheme is not valid. A scheme should not include special characters such as \":\" or \"/\"."), 0);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v36);
    }
  }
  v41.receiver = self;
  v41.super_class = (Class)ASWebAuthenticationSession;
  v17 = -[ASWebAuthenticationSession init](&v41, sel_init);
  if (v17)
  {
    objc_initWeak(&location, v17);
    v18 = MEMORY[0x212BBEFEC](v14);
    originalCompletionHandler = v17->_originalCompletionHandler;
    v17->_originalCompletionHandler = (id)v18;

    -[ASWebAuthenticationSession setPrefersEphemeralWebBrowserSession:](v17, "setPrefersEphemeralWebBrowserSession:", v9);
    +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:](ASAuthorizationSingleSignOnProvider, "authorizationProviderWithIdentityProviderURL:", v12);
    v20 = objc_claimAutoreleasedReturnValue();
    ssoProvider = v17->_ssoProvider;
    v17->_ssoProvider = (ASAuthorizationSingleSignOnProvider *)v20;

    if (-[ASAuthorizationSingleSignOnProvider canPerformAuthorization](v17->_ssoProvider, "canPerformAuthorization")
      && objc_msgSend(v12, "safari_isEligibleforDirectSSO"))
    {
      v22 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20E4D9000, v22, OS_LOG_TYPE_DEFAULT, "Sending request direct to SSO extension.", buf, 2u);
      }
      -[ASAuthorizationSingleSignOnProvider createRequest](v17->_ssoProvider, "createRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRequestedOperation:", CFSTR("direct_request"));
      v24 = [ASAuthorizationController alloc];
      v51[0] = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[ASAuthorizationController initWithAuthorizationRequests:](v24, "initWithAuthorizationRequests:", v25);
      authorizationController = v17->_authorizationController;
      v17->_authorizationController = (ASAuthorizationController *)v26;

      -[ASAuthorizationController setDelegate:](v17->_authorizationController, "setDelegate:", v17);
      -[ASAuthorizationController setPresentationContextProvider:](v17->_authorizationController, "setPresentationContextProvider:", v17);
      objc_storeStrong((id *)&v17->_callback, a4);

    }
    v28 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __102__ASWebAuthenticationSession_initWithURL_callback_usingEphemeralSession_jitEnabled_completionHandler___block_invoke;
    v37[3] = &unk_24C952018;
    objc_copyWeak(&v39, &location);
    v38 = v14;
    v29 = (void *)MEMORY[0x212BBEFEC](v37);
    v47 = 0;
    v48 = &v47;
    v49 = 0x2050000000;
    v30 = (void *)getSFAuthenticationSessionClass_softClass;
    v50 = getSFAuthenticationSessionClass_softClass;
    if (!getSFAuthenticationSessionClass_softClass)
    {
      *(_QWORD *)buf = v28;
      v43 = 3221225472;
      v44 = __getSFAuthenticationSessionClass_block_invoke;
      v45 = &unk_24C94F880;
      v46 = &v47;
      __getSFAuthenticationSessionClass_block_invoke((uint64_t)buf);
      v30 = (void *)v48[3];
    }
    v31 = objc_retainAutorelease(v30);
    _Block_object_dispose(&v47, 8);
    v32 = objc_msgSend([v31 alloc], "initWithURL:callback:storageMode:jitEnabled:completionHandler:", v12, v13, v17->_storageMode, v8, v29);
    authenticationSession = v17->_authenticationSession;
    v17->_authenticationSession = (SFAuthenticationSession *)v32;

    v34 = v17;
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, 0, 0);
  }

  return v17;
}

void __102__ASWebAuthenticationSession_initWithURL_callback_usingEphemeralSession_jitEnabled_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  id v15;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidate");

  v8 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v15 = v9;
  if (v9)
  {
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.AuthenticationServices.WebAuthenticationSession"));

    if (v11)
    {
      v12 = v15;
    }
    else
    {
      v14 = objc_msgSend(v15, "code") == 1;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.WebAuthenticationSession"), v14, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v6, v13);
}

- (BOOL)canStart
{
  return -[ASWebAuthenticationSession _startDryRun:](self, "_startDryRun:", 1);
}

- (BOOL)start
{
  return -[ASWebAuthenticationSession _startDryRun:](self, "_startDryRun:", 0);
}

- (BOOL)_startDryRun:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id WeakRetained;
  void *v7;
  int v8;
  char v9;
  void *v10;
  char IsExtension;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v3 = a3;
  v27[1] = *MEMORY[0x24BDAC8D0];
  -[SFAuthenticationSession setStorageMode:](self->_authenticationSession, "setStorageMode:", self->_storageMode);
  v5 = (void *)-[NSDictionary copy](self->_additionalHeaderFields, "copy");
  -[SFAuthenticationSession setAdditionalHeaderFields:](self->_authenticationSession, "setAdditionalHeaderFields:", v5);

  if (self->_originalCompletionHandler)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContextProvider);
    objc_msgSend(WeakRetained, "presentationAnchorForWebAuthenticationSession:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!dyld_program_sdk_at_least()
      || -[ASWebAuthenticationSession _skipPresentationAnchorCheck](self, "_skipPresentationAnchorCheck"))
    {
      goto LABEL_4;
    }
    if (v7)
    {
      objc_msgSend(v7, "windowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "activationState"))
      {

        goto LABEL_4;
      }
      IsExtension = _UIApplicationIsExtension();

      if ((IsExtension & 1) != 0)
        goto LABEL_4;
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDD0BA0];
      v24 = *MEMORY[0x24BDD0BA0];
      v25 = CFSTR("The UIWindowScene for the returned window was not in the foreground active state.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      v16 = 3;
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDD0BA0];
      v26 = *MEMORY[0x24BDD0BA0];
      v27[0] = CFSTR("Cannot start ASWebAuthenticationSession without providing presentation context. Set presentationContextProvider before calling -start.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      v16 = 2;
    }
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.WebAuthenticationSession"), v16, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_4;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("com.apple."));

      if (v21)
      {
        v22 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[ASWebAuthenticationSession _startDryRun:].cold.1(v22, v18, v13);

LABEL_4:
        if (-[ASWebAuthenticationSession _validateAdditionalHeaderFieldsDryRun:](self, "_validateAdditionalHeaderFieldsDryRun:", v3))
        {
          v8 = dyld_program_minos_at_least();
          if (!v3 && v8)
            objc_storeStrong((id *)&self->_referenceToSelf, self);
          if (self->_authorizationController
            && -[ASAuthorizationSingleSignOnProvider canPerformAuthorization](self->_ssoProvider, "canPerformAuthorization"))
          {
            if (!v3)
              -[ASAuthorizationController performRequests](self->_authorizationController, "performRequests");
            v9 = 1;
            goto LABEL_32;
          }
          v9 = -[SFAuthenticationSession startASWebAuthenticationSessionInWindow:dryRun:](self->_authenticationSession, "startASWebAuthenticationSessionInWindow:dryRun:", v7, v3);
          if ((v9 & 1) != 0 || v3)
          {
LABEL_32:

            return v9;
          }
          -[ASWebAuthenticationSession _invalidate](self, "_invalidate");
        }
LABEL_31:
        v9 = 0;
        goto LABEL_32;
      }
      -[ASWebAuthenticationSession _cancelWithError:](self, "_cancelWithError:", v18);
    }

    goto LABEL_31;
  }
  return 0;
}

- (void)cancel
{
  ASAuthorizationSingleSignOnProvider *ssoProvider;
  ASAuthorizationController *authorizationController;

  ssoProvider = self->_ssoProvider;
  self->_ssoProvider = 0;

  authorizationController = self->_authorizationController;
  self->_authorizationController = 0;

  -[ASWebAuthenticationSession _invalidate](self, "_invalidate");
  -[SFAuthenticationSession cancel](self->_authenticationSession, "cancel");
}

- (void)setPrefersEphemeralWebBrowserSession:(BOOL)prefersEphemeralWebBrowserSession
{
  _BOOL4 v3;

  v3 = prefersEphemeralWebBrowserSession;
  if ((-[SFAuthenticationSession isSessionStarted](self->_authenticationSession, "isSessionStarted") & 1) == 0)
    self->_storageMode = v3;
}

- (BOOL)prefersEphemeralWebBrowserSession
{
  return self->_storageMode == 1;
}

- (NSArray)proxiedAssociatedDomains
{
  return (NSArray *)-[SFAuthenticationSession proxiedAssociatedDomains](self->_authenticationSession, "proxiedAssociatedDomains");
}

- (void)setProxiedAssociatedDomains:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[SFAuthenticationSession isSessionStarted](self->_authenticationSession, "isSessionStarted") & 1) == 0)
    -[SFAuthenticationSession setProxiedAssociatedDomains:](self->_authenticationSession, "setProxiedAssociatedDomains:", v4);

}

- (void)_invalidate
{
  ASWebAuthenticationSession *referenceToSelf;

  referenceToSelf = self->_referenceToSelf;
  self->_referenceToSelf = 0;

}

- (void)_cancelWithError:(id)a3
{
  id originalCompletionHandler;

  (*((void (**)(void))self->_originalCompletionHandler + 2))();
  originalCompletionHandler = self->_originalCompletionHandler;
  self->_originalCompletionHandler = 0;

}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  ASAuthorizationSingleSignOnProvider *ssoProvider;
  ASAuthorizationController *authorizationController;
  id v7;

  v7 = a4;
  ssoProvider = self->_ssoProvider;
  self->_ssoProvider = 0;

  authorizationController = self->_authorizationController;
  self->_authorizationController = 0;

  if (objc_msgSend(v7, "safari_matchesErrorDomain:andCode:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1003))
  {
    -[ASWebAuthenticationSession performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__startDryRun_, MEMORY[0x24BDBD1C0], 0);
  }
  else
  {
    (*((void (**)(void))self->_originalCompletionHandler + 2))();
    -[ASWebAuthenticationSession _invalidate](self, "_invalidate");
  }

}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  ASAuthorizationSingleSignOnProvider *ssoProvider;
  ASAuthorizationController *authorizationController;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  ssoProvider = self->_ssoProvider;
  self->_ssoProvider = 0;

  authorizationController = self->_authorizationController;
  self->_authorizationController = 0;

  objc_msgSend(v13, "credential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "credential");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authenticatedResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ASWebAuthenticationSessionCallback matchesURL:](self->_callback, "matchesURL:", v11))
    {
      (*((void (**)(void))self->_originalCompletionHandler + 2))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1002, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void))self->_originalCompletionHandler + 2))();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.AuthorizationError"), 1002, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_originalCompletionHandler + 2))();
  }

  -[ASWebAuthenticationSession _invalidate](self, "_invalidate");
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContextProvider);
  objc_msgSend(WeakRetained, "presentationAnchorForWebAuthenticationSession:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)handleSSOExtensionIdentifier:(id *)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[2];
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__ASWebAuthenticationSession_handleSSOExtensionIdentifier___block_invoke;
  v6[3] = &__block_descriptor_64_e20_v20__0B8__NSError_12l;
  v3 = *(_OWORD *)&a3->var0[4];
  v7 = *(_OWORD *)a3->var0;
  v8 = v3;
  v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  objc_msgSend(MEMORY[0x24BE04350], "isExtensionProcessWithAuditToken:completion:", v5, v6);
}

void __59__ASWebAuthenticationSession_handleSSOExtensionIdentifier___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  CFTypeRef cfa[2];
  const void *cf;
  __int128 v5;

  if ((a2 & 1) != 0)
  {
    *(_OWORD *)cfa = *(_OWORD *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 48);
    WBSApplicationIdentifierFromAuditToken();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
    objc_msgSend(MEMORY[0x24BE04350], "setOriginatorBundleIdentifier:", v2, 0, cfa[1], v5);
    if (cf)
      CFRelease(cf);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE04350], "setOriginatorBundleIdentifier:", 0);
  }
}

+ (void)resetSSOExtensionIdentifier
{
  objc_msgSend(MEMORY[0x24BE04350], "setOriginatorBundleIdentifier:", 0);
}

- (id)presentationContextProvider
{
  return objc_loadWeakRetained((id *)&self->_presentationContextProvider);
}

- (void)setPresentationContextProvider:(id)presentationContextProvider
{
  objc_storeWeak((id *)&self->_presentationContextProvider, presentationContextProvider);
}

- (NSDictionary)additionalHeaderFields
{
  return self->_additionalHeaderFields;
}

- (void)setAdditionalHeaderFields:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHeaderFields, a3);
}

- (BOOL)_skipPresentationAnchorCheck
{
  return self->__skipPresentationAnchorCheck;
}

- (void)_setSkipPresentationAnchorCheck:(BOOL)a3
{
  self->__skipPresentationAnchorCheck = a3;
}

- (BOOL)shouldFailOnHTTPErrorResponse
{
  return self->_shouldFailOnHTTPErrorResponse;
}

- (void)setShouldFailOnHTTPErrorResponse:(BOOL)a3
{
  self->_shouldFailOnHTTPErrorResponse = a3;
}

- (NSArray)customAnchorCertificates
{
  return self->_customAnchorCertificates;
}

- (void)setCustomAnchorCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_customAnchorCertificates, a3);
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_storageMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAnchorCertificates, 0);
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
  objc_destroyWeak((id *)&self->_presentationContextProvider);
  objc_storeStrong((id *)&self->_referenceToSelf, 0);
  objc_storeStrong(&self->_originalCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authenticationSession, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_ssoProvider, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
}

- (BOOL)_validateAdditionalHeaderFieldsDryRun:(BOOL)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[ASWebAuthenticationSession additionalHeaderFields](self, "additionalHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASWebAuthenticationSession _areAdditionalHeaderFieldsValid:](self, "_areAdditionalHeaderFieldsValid:", v5);

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FD8];
    v13[0] = CFSTR("One or more provided headers are invalid.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServices.WebAuthenticationSession"), 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[ASWebAuthenticationSession(Shared) _validateAdditionalHeaderFieldsDryRun:].cold.1((uint64_t)v9, v10);
      if (a3)
        goto LABEL_5;
    }
    else if (a3)
    {
LABEL_5:

      return v6;
    }
    -[ASWebAuthenticationSession _cancelWithError:](self, "_cancelWithError:", v9);
    goto LABEL_5;
  }
  return v6;
}

- (BOOL)_areAdditionalHeaderFieldsValid:(id)a3
{
  id v4;
  int v5;
  _QWORD v7[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__ASWebAuthenticationSession_Shared___areAdditionalHeaderFieldsValid___block_invoke;
    v7[3] = &unk_24C952078;
    v7[4] = self;
    v5 = objc_msgSend(v4, "safari_containsEntryPassingTest:", v7) ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

uint64_t __70__ASWebAuthenticationSession_Shared___areAdditionalHeaderFieldsValid___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isForbiddenHeaderFieldName:value:", a2, a3);
}

- (BOOL)_isForbiddenHeaderFieldName:(id)a3 value:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(&unk_24C96DFC0, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(&unk_24C96DFC0);
      if ((objc_msgSend(v4, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8)) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(&unk_24C96DFC0, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(&unk_24C96DFD8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (!v9)
    {
      v13 = 0;
      goto LABEL_19;
    }
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_11:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(&unk_24C96DFD8);
      if ((objc_msgSend(v4, "safari_hasCaseInsensitivePrefix:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12)) & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(&unk_24C96DFD8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        v13 = 0;
        if (v10)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
  }
  v13 = 1;
LABEL_19:

  return v13;
}

- (void)initWithURL:(os_log_t)log callback:usingEphemeralSession:jitEnabled:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E4D9000, log, OS_LOG_TYPE_ERROR, "The provided scheme is not valid. A scheme should not include special characters such as \":\" or \"/\".", v1, 2u);
}

- (void)_startDryRun:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543362;
  v9 = v7;
  _os_log_error_impl(&dword_20E4D9000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Please adopt the new API as soon as possible (rdar://50384281).", (uint8_t *)&v8, 0xCu);

}

@end
