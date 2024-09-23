@implementation AKBaseSignInViewController

- (id)_initWithAuthController:(id)a3
{
  id v5;
  AKBaseSignInViewController *v6;
  AKBaseSignInViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKBaseSignInViewController;
  v6 = -[AKBaseSignInViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_authenticationController, a3);

  return v7;
}

- (id)_initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKBaseSignInViewController;
  return -[AKBaseSignInViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD795000, log, OS_LOG_TYPE_DEBUG, "AKBaseSignInViewController deallocated", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKBaseSignInViewController;
  -[AKBaseSignInViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AKBaseSignInViewController _setPasswordFieldHiddenIfNeeded](self, "_setPasswordFieldHiddenIfNeeded");
  -[AKBaseSignInViewController _beginProximityAdvertisement](self, "_beginProximityAdvertisement");
}

- (void)_beginProximityAdvertisement
{
  AKAppleIDProximityAuthenticationContext *v3;
  AKAppleIDProximityAuthenticationContext *proximityContext;
  NSObject *v5;
  void *v6;
  AKAppleIDProximityAuthenticationContext *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x1E0D001E8], "isProxForAuthkitEnabled"))
  {
    v3 = objc_alloc_init(AKAppleIDProximityAuthenticationContext);
    proximityContext = self->_proximityContext;
    self->_proximityContext = v3;

    -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](self->_proximityContext, "setPresentingViewController:", self);
    -[AKAppleIDProximityAuthenticationContext setAuthenticationType:](self->_proximityContext, "setAuthenticationType:", 2);
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BD795000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to begin proximity authentication", buf, 2u);
    }

    -[AKBaseSignInViewController authenticationController](self, "authenticationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_proximityContext;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke;
    v8[3] = &unk_1E7678DE8;
    v8[4] = self;
    objc_msgSend(v6, "authenticateWithContext:completion:", v7, v8);

  }
}

void __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "code") == -13002 || objc_msgSend(v7, "code") == -13003))
  {
    _AKLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke_cold_1((uint64_t)v7, v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_provideDelegateWithAuthResults:error:", v5, v7);
  }

}

- (void)_endProximityAdvertisement
{
  NSObject *v3;
  void *v4;
  AKAppleIDProximityAuthenticationContext *proximityContext;
  _QWORD v6[5];
  uint8_t buf[16];

  _AKLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD795000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to end proximity authentication", buf, 2u);
  }

  if (self->_proximityContext)
  {
    if (objc_msgSend(MEMORY[0x1E0D001E8], "isProxForAuthkitEnabled"))
    {
      -[AKBaseSignInViewController authenticationController](self, "authenticationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      proximityContext = self->_proximityContext;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __56__AKBaseSignInViewController__endProximityAdvertisement__block_invoke;
      v6[3] = &unk_1E7678DE8;
      v6[4] = self;
      objc_msgSend(v4, "endProximityAuthenticationForContext:completion:", proximityContext, v6);

    }
  }
}

void __56__AKBaseSignInViewController__endProximityAdvertisement__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 976);
  *(_QWORD *)(v1 + 976) = 0;

}

- (void)_setPasswordFieldHiddenIfNeeded
{
  void *v3;
  id v4;

  -[AKBaseSignInViewController context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_requiresPasswordInput") & 1) != 0)
  {
    -[AKBaseSignInViewController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[AKBaseSignInViewController _setPasswordFieldHidden:animated:](self, "_setPasswordFieldHidden:animated:", 0, 0);
  }
  else
  {

  }
}

- (AKAppleIDAuthenticationController)authenticationController
{
  AKAppleIDAuthenticationController *authenticationController;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *v5;

  authenticationController = self->_authenticationController;
  if (!authenticationController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x1E0D00130]);
    v5 = self->_authenticationController;
    self->_authenticationController = v4;

    authenticationController = self->_authenticationController;
  }
  return authenticationController;
}

- (BOOL)_isSignInAllowed
{
  void *v3;
  _BOOL4 v4;

  -[AKBaseSignInViewController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEphemeral") & 1) != 0)
    LOBYTE(v4) = 1;
  else
    v4 = !-[AKBaseSignInViewController _isAccountModificationRestricted](self, "_isAccountModificationRestricted");

  return v4;
}

- (BOOL)_isAccountModificationRestricted
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]);

  return v3 == 2;
}

- (BOOL)_canBeginAuthenticationWithOption:(unint64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (-[AKBaseSignInViewController isAuthInProgress](self, "isAuthInProgress"))
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AKBaseSignInViewController _canBeginAuthenticationWithOption:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    if (a3 - 2 < 2)
      return !-[AKBaseSignInViewController _isAccountModificationRestricted](self, "_isAccountModificationRestricted");
    if (a3 == 1)
      return -[AKBaseSignInViewController _isSignInAllowed](self, "_isSignInAllowed");
  }
  return 0;
}

- (void)_beginAuthenticationIfPossibleWithOption:(unint64_t)a3 withUsername:(id)a4 password:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;

  v8 = a4;
  v9 = a5;
  if (-[AKBaseSignInViewController _canBeginAuthenticationWithOption:](self, "_canBeginAuthenticationWithOption:", a3))
  {
    -[AKBaseSignInViewController setAuthInProgress:](self, "setAuthInProgress:", 1);
    -[AKBaseSignInViewController delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("you must set a delegate before the button is pressed"));
    -[AKBaseSignInViewController startAnimating](self, "startAnimating");
    -[AKBaseSignInViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKBaseSignInViewController _serverFriendlyUsername:](self, "_serverFriendlyUsername:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUsername:", v12);
    if (v9)
      objc_msgSend(v11, "_setPassword:", v9);
    objc_msgSend(v11, "setNeedsCredentialRecovery:", a3 == 2);
    objc_msgSend(v11, "setNeedsNewAppleID:", a3 == 3);
    objc_msgSend(v11, "setAuthenticationType:", 2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __93__AKBaseSignInViewController__beginAuthenticationIfPossibleWithOption_withUsername_password___block_invoke;
      v20[3] = &unk_1E7678D18;
      v20[4] = self;
      v21 = v11;
      -[NSObject signInViewController:willPerformAuthenticationWithContext:completionHandler:](v10, "signInViewController:willPerformAuthenticationWithContext:completionHandler:", self, v21, v20);

    }
    else
    {
      -[AKBaseSignInViewController _authenticateWithContext:](self, "_authenticateWithContext:", v11);
    }

  }
  else
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AKBaseSignInViewController _beginAuthenticationIfPossibleWithOption:withUsername:password:].cold.1(v10, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __93__AKBaseSignInViewController__beginAuthenticationIfPossibleWithOption_withUsername_password___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authenticateWithContext:", *(_QWORD *)(a1 + 40));
}

- (void)_authenticateWithContext:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[AKBaseSignInViewController _endProximityAdvertisement](self, "_endProximityAdvertisement");
  -[AKBaseSignInViewController authenticationController](self, "authenticationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__AKBaseSignInViewController__authenticateWithContext___block_invoke;
  v6[3] = &unk_1E7678FB0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "authenticateWithContext:completion:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __55__AKBaseSignInViewController__authenticateWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[6];

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_provideDelegateWithAuthResults:error:", v7, v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__AKBaseSignInViewController__authenticateWithContext___block_invoke_2;
  v9[3] = &unk_1E7678D18;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __55__AKBaseSignInViewController__authenticateWithContext___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAuthInProgress:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "stopAnimating");
}

- (void)_provideDelegateWithAuthResults:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[AKBaseSignInViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v7, "signInViewController:didAuthenticateWithResults:error:", self, v8, v6);

  }
}

- (id)_serverFriendlyUsername:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("@")) & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "normalizedFormatFor:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)usesDarkMode
{
  return self->_usesDarkMode;
}

- (void)setUsesDarkMode:(BOOL)a3
{
  self->_usesDarkMode = a3;
}

- (AKAppleIDAuthenticationInAppContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (AKSignInViewControllerDelegate)delegate
{
  return (AKSignInViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isAuthInProgress
{
  return self->_authInProgress;
}

- (void)setAuthInProgress:(BOOL)a3
{
  self->_authInProgress = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_proximityContext, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
}

void __58__AKBaseSignInViewController__beginProximityAdvertisement__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1BD795000, a2, OS_LOG_TYPE_ERROR, "AKInlineSignInViewController - attempt to broadcast for proximity failed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_canBeginAuthenticationWithOption:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1BD795000, a1, a3, "Authentication is already in progress.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_beginAuthenticationIfPossibleWithOption:(uint64_t)a3 withUsername:(uint64_t)a4 password:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1BD795000, a1, a3, "Authentication not possible due to a restriction MCFeatureAccountModificationAllowed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
