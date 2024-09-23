@implementation SFAuthenticationSession

- (SFAuthenticationSession)initWithURL:(NSURL *)URL callbackURLScheme:(NSString *)callbackURLScheme completionHandler:(SFAuthenticationCompletionHandler)completionHandler
{
  return -[SFAuthenticationSession initWithURL:callbackURLScheme:usingEphemeralSession:completionHandler:](self, "initWithURL:callbackURLScheme:usingEphemeralSession:completionHandler:", URL, callbackURLScheme, 0, completionHandler);
}

- (SFAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 completionHandler:(id)a6
{
  return -[SFAuthenticationSession initWithURL:callbackURLScheme:usingEphemeralSession:jitEnabled:completionHandler:](self, "initWithURL:callbackURLScheme:usingEphemeralSession:jitEnabled:completionHandler:", a3, a4, a5, 1, a6);
}

- (SFAuthenticationSession)initWithURL:(id)a3 callbackURLScheme:(id)a4 usingEphemeralSession:(BOOL)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  void *v12;
  id v13;
  id v14;
  void *v15;
  SFAuthenticationSession *v16;

  v7 = a6;
  v8 = a5;
  v12 = (void *)MEMORY[0x1E0C925F0];
  v13 = a7;
  v14 = a3;
  objc_msgSend(v12, "callbackWithCustomScheme:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SFAuthenticationSession initWithURL:callback:storageMode:jitEnabled:completionHandler:](self, "initWithURL:callback:storageMode:jitEnabled:completionHandler:", v14, v15, v8, v7, v13);

  return v16;
}

- (SFAuthenticationSession)initWithURL:(id)a3 callback:(id)a4 storageMode:(unint64_t)a5 jitEnabled:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  SFAuthenticationSession *v15;
  uint64_t v16;
  NSURL *initialURL;
  uint64_t v18;
  id completionHandler;
  SFAuthenticationSession *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SFAuthenticationSession;
  v15 = -[SFAuthenticationSession init](&v22, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    initialURL = v15->_initialURL;
    v15->_initialURL = (NSURL *)v16;

    objc_storeStrong((id *)&v15->_callback, a4);
    v18 = MEMORY[0x1A8598C40](v14);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = (id)v18;

    v15->_storageMode = a5;
    v15->_jitEnabled = a6;
    v20 = v15;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[SFAuthenticationSession cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)SFAuthenticationSession;
  -[SFAuthenticationSession dealloc](&v3, sel_dealloc);
}

- (BOOL)start
{
  return -[SFAuthenticationSession _startRequestingFromWebAuthenticationSession:inWindow:dryRun:](self, "_startRequestingFromWebAuthenticationSession:inWindow:dryRun:", 0, 0, 0);
}

- (BOOL)startASWebAuthenticationSessionInWindow:(id)a3 dryRun:(BOOL)a4
{
  return -[SFAuthenticationSession _startRequestingFromWebAuthenticationSession:inWindow:dryRun:](self, "_startRequestingFromWebAuthenticationSession:inWindow:dryRun:", 1, a3, a4);
}

- (BOOL)_startRequestingFromWebAuthenticationSession:(BOOL)a3 inWindow:(id)a4 dryRun:(BOOL)a5
{
  id v7;
  BOOL v8;
  void *v10;
  int v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  SFAuthenticationViewController *v15;
  SFAuthenticationViewController *authViewController;

  v7 = a4;
  if (self->_authViewController || self->_sessionStarted)
  {
    v8 = 0;
  }
  else
  {
    -[NSURL scheme](self->_initialURL, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "safari_isCaseInsensitiveEqualToString:", CFSTR("http"));

    if (v11)
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = WBS_LOG_CHANNEL_PREFIXAuthenticationSession();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SFAuthenticationSession _startRequestingFromWebAuthenticationSession:inWindow:dryRun:].cold.1((uint64_t)v13, v14);

    }
    v8 = 1;
    if (!a5)
    {
      v15 = -[SFAuthenticationViewController initWithURL:callback:storageMode:jitEnabled:presentationContextWindow:additionalHeaderFields:proxiedAssociatedDomains:]([SFAuthenticationViewController alloc], "initWithURL:callback:storageMode:jitEnabled:presentationContextWindow:additionalHeaderFields:proxiedAssociatedDomains:", self->_initialURL, self->_callback, self->_storageMode, self->_jitEnabled, v7, self->_additionalHeaderFields, self->_proxiedAssociatedDomains);
      authViewController = self->_authViewController;
      self->_authViewController = v15;

      -[SFSafariViewController setDelegate:](self->_authViewController, "setDelegate:", self);
      -[SFAuthenticationViewController setPresentationDelegate:](self->_authViewController, "setPresentationDelegate:", self);
      -[SFSafariViewController setModalPresentationStyle:](self->_authViewController, "setModalPresentationStyle:", 2);
      self->_sessionStarted = 1;
    }
  }

  return v8;
}

- (void)cancel
{
  SFAuthenticationViewController *authViewController;
  void *v4;
  SFAuthenticationViewController *v5;
  _QWORD v6[5];

  authViewController = self->_authViewController;
  if (authViewController)
  {
    -[SFAuthenticationViewController presentingViewController](authViewController, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = self->_authViewController;
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __33__SFAuthenticationSession_cancel__block_invoke;
      v6[3] = &unk_1E4ABFE00;
      v6[4] = self;
      -[SFAuthenticationViewController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, v6);
    }
    else
    {
      self->_authViewController = 0;

    }
  }
}

void __33__SFAuthenticationSession_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (id)_authenticationSessionErrorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariServices.Authentication"), a3, 0);
}

- (id)presentingViewControllerForAuthenticationViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SFAuthenticationSession _delegate](self, "_delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_presentingViewControllerForAuthenticationSession:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)safariViewControllerDidFinish:(id)a3
{
  SFAuthenticationViewController *authViewController;
  void (**completionHandler)(id, _QWORD, id);
  id v6;

  authViewController = self->_authViewController;
  self->_authViewController = 0;

  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    -[SFAuthenticationSession _authenticationSessionErrorWithCode:](self, "_authenticationSessionErrorWithCode:", 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, 0, v6);

  }
}

- (void)safariViewController:(id)a3 hostApplicationOpenURL:(id)a4
{
  id v5;
  SFAuthenticationViewController *authViewController;
  void (**completionHandler)(id, id, _QWORD);
  _QWORD v8[5];

  v5 = a4;
  authViewController = self->_authViewController;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SFAuthenticationSession_safariViewController_hostApplicationOpenURL___block_invoke;
  v8[3] = &unk_1E4ABFE00;
  v8[4] = self;
  -[SFAuthenticationViewController dismissViewControllerAnimated:completion:](authViewController, "dismissViewControllerAnimated:completion:", 1, v8);
  completionHandler = (void (**)(id, id, _QWORD))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, v5, 0);

}

void __71__SFAuthenticationSession_safariViewController_hostApplicationOpenURL___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;

}

- (void)safariViewController:(id)a3 didDecideCookieSharingForURL:(id)a4 shouldCancel:(BOOL)a5 withError:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void (**completionHandler)(id, _QWORD, id);
  NSObject *v15;
  void *v16;
  __int16 v17[8];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (self->_authViewController)
  {
    if (v7)
    {
      v13 = WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 0;
        _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_DEFAULT, "SFAuthenticationSession was cancelled by user.", (uint8_t *)v17, 2u);
      }
      completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
      if (completionHandler)
      {
        if (v12)
        {
          completionHandler[2](self->_completionHandler, 0, v12);
        }
        else
        {
          -[SFAuthenticationSession _authenticationSessionErrorWithCode:](self, "_authenticationSessionErrorWithCode:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          completionHandler[2](completionHandler, 0, v16);

        }
      }
    }
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SFAuthenticationSession safariViewController:didDecideCookieSharingForURL:shouldCancel:withError:].cold.1(v15);
  }

}

- (_SFAuthenticationSessionDelegate)_delegate
{
  return (_SFAuthenticationSessionDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void)set_delegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (unint64_t)storageMode
{
  return self->_storageMode;
}

- (void)setStorageMode:(unint64_t)a3
{
  self->_storageMode = a3;
}

- (BOOL)isSessionStarted
{
  return self->_sessionStarted;
}

- (void)setSessionStarted:(BOOL)a3
{
  self->_sessionStarted = a3;
}

- (BOOL)jitEnabled
{
  return self->_jitEnabled;
}

- (void)setJitEnabled:(BOOL)a3
{
  self->_jitEnabled = a3;
}

- (NSDictionary)additionalHeaderFields
{
  return self->_additionalHeaderFields;
}

- (void)setAdditionalHeaderFields:(id)a3
{
  objc_storeStrong((id *)&self->_additionalHeaderFields, a3);
}

- (NSArray)proxiedAssociatedDomains
{
  return self->_proxiedAssociatedDomains;
}

- (void)setProxiedAssociatedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHeaderFields, 0);
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_proxiedAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_authViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_initialURL, 0);
}

- (void)_startRequestingFromWebAuthenticationSession:(uint64_t)a1 inWindow:(NSObject *)a2 dryRun:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "%{public}@ support for http scheme is deprecated and will be removed in a future version of iOS. Use https scheme instead.", (uint8_t *)&v2, 0xCu);
}

- (void)safariViewController:(os_log_t)log didDecideCookieSharingForURL:shouldCancel:withError:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "SFAuthenticationSession has already been cancelled but we still got a privacy alert callback from view service.", v1, 2u);
}

@end
