@implementation GKSignInViewController

- (GKSignInViewController)init
{
  GKSignInViewController *v2;
  uint64_t v3;
  GKGame *game;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKSignInViewController;
  v2 = -[GKSignInViewController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
    v3 = objc_claimAutoreleasedReturnValue();
    game = v2->_game;
    v2->_game = (GKGame *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__systemContentSizeSettingDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKSignInViewController;
  -[GKSignInViewController dealloc](&v4, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKSignInViewController;
  -[GKViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", self->_currentContentInsets.top, self->_currentContentInsets.left, self->_currentContentInsets.bottom, self->_currentContentInsets.right);
  -[GKSignInViewController signInInputView](self, "signInInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v5, v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  -[GKSignInViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNavigationBarHidden:", 0);

  -[GKSignInViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSignInViewController addCancelButtonToNavigationItem:](self, "addCancelButtonToNavigationItem:", v10);

}

- (void)addCancelButtonToNavigationItem:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0DC34F0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelSignIn);
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.SignIn.cancelButton"));
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKSignInViewController;
  -[GKSignInViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", self->_currentContentInsets.top, self->_currentContentInsets.left, self->_currentContentInsets.bottom, self->_currentContentInsets.right);
  -[GKSignInInputView bounds](self->_signInInputView, "bounds");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v3, v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKSignInViewController;
  -[GKViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKSignInViewController;
  -[GKSignInViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)loadView
{
  void *v3;
  int v4;
  GKSignInView *v5;
  GKSignInView *v6;
  GKSignInView *signInView;
  void *v8;
  void *v9;
  GKSignInView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)GKSignInViewController;
  -[GKViewController loadView](&v24, sel_loadView);
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "easySignInSheetEnabled");

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = [GKSignInView alloc];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __34__GKSignInViewController_loadView__block_invoke;
    v21 = &unk_1E59C48A0;
    objc_copyWeak(&v22, &location);
    v6 = -[GKSignInView initWithSignInAction:](v5, "initWithSignInAction:", &v18);
    signInView = self->_signInView;
    self->_signInView = v6;

    -[GKSignInView setTranslatesAutoresizingMaskIntoConstraints:](self->_signInView, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v18, v19, v20, v21);
    -[GKSignInViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_signInView);

    v9 = (void *)MEMORY[0x1E0CB3718];
    v10 = self->_signInView;
    -[GKSignInViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_gkInstallEdgeConstraintsForView:containedWithinParentView:", v10, v11);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    -[GKSignInViewController createSubviews](self, "createSubviews");
    -[GKSignInViewController setupAuthKitInlineViewController](self, "setupAuthKitInlineViewController");
    -[GKSignInViewController createConstraints](self, "createConstraints");
  }
  -[GKSignInViewController scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentInsetAdjustmentBehavior:", 0);

  -[GKSignInViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNavigationBarHidden:", 0);

  -[GKSignInViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "makeNavigationBarBackgroundTranslucent");

  v15 = (void *)objc_opt_new();
  -[GKSignInViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowImage:", v15);

  self->_constraintsCreated = 0;
}

void __34__GKSignInViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showAAUISignInController");

}

- (void)setupAuthKitInlineViewController
{
  AKInlineSignInViewController *v3;
  AKInlineSignInViewController *inlineSignInViewController;
  void *v5;
  void *v6;
  AKAppleIDAuthenticationInAppContext *v7;
  AKAppleIDAuthenticationInAppContext *authContext;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (AKInlineSignInViewController *)objc_alloc_init(MEMORY[0x1E0D00340]);
  inlineSignInViewController = self->_inlineSignInViewController;
  self->_inlineSignInViewController = v3;

  -[AKInlineSignInViewController setWantsAuthenticationProgress:](self->_inlineSignInViewController, "setWantsAuthenticationProgress:", 1);
  -[AKInlineSignInViewController authenticationController](self->_inlineSignInViewController, "authenticationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[AKInlineSignInViewController view](self->_inlineSignInViewController, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.SignIn.form"));

  v7 = (AKAppleIDAuthenticationInAppContext *)objc_alloc_init(MEMORY[0x1E0D002F8]);
  authContext = self->_authContext;
  self->_authContext = v7;

  -[AKAppleIDAuthenticationInAppContext setIsEphemeral:](self->_authContext, "setIsEphemeral:", 1);
  -[AKAppleIDAuthenticationInAppContext setServiceType:](self->_authContext, "setServiceType:", 6);
  -[AKAppleIDAuthenticationInAppContext setPresentingViewController:](self->_authContext, "setPresentingViewController:", self);
  -[AKInlineSignInViewController setDelegate:](self->_inlineSignInViewController, "setDelegate:", self);
  -[GKSignInViewController authContext](self, "authContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController setContext:](self->_inlineSignInViewController, "setContext:", v9);

  -[AKInlineSignInViewController setWantsAuthenticationProgress:](self->_inlineSignInViewController, "setWantsAuthenticationProgress:", 1);
  -[AKInlineSignInViewController setSecondaryButtonTarget:action:](self->_inlineSignInViewController, "setSecondaryButtonTarget:action:", self, sel_iForgotTapped);
  -[AKInlineSignInViewController setTertiaryButtonTarget:action:](self->_inlineSignInViewController, "setTertiaryButtonTarget:action:", self, sel_createAppleID);
  -[GKSignInViewController addChildViewController:](self, "addChildViewController:", self->_inlineSignInViewController);
  -[GKSignInViewController signInInputView](self, "signInInputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKInlineSignInViewController view](self->_inlineSignInViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[AKInlineSignInViewController didMoveToParentViewController:](self->_inlineSignInViewController, "didMoveToParentViewController:", self);
  -[AKInlineSignInViewController view](self->_inlineSignInViewController, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSignInViewController signInInputView](self, "signInInputView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF28]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if (objc_msgSend(v5, "success"))
  {
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountServicePrivate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__GKSignInViewController_signInController_didCompleteWithOperationsResults___block_invoke;
    v13[3] = &unk_1E59C6AC8;
    v13[4] = self;
    objc_msgSend(v8, "authenticatePlayerWithUsername:password:altDSID:usingFastPath:handler:", 0, 0, 0, 1, v13);

    goto LABEL_11;
  }
  objc_msgSend(v5, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (!*MEMORY[0x1E0D25460])
      v10 = (id)GKOSLoggers();
    v11 = (void *)*MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKSignInViewController signInController:didCompleteWithOperationsResults:].cold.1(v11, v5);
  }
  -[GKSignInViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_11:
  -[GKSignInViewController signInView](self, "signInView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "enablePrimaryButton");

}

uint64_t __76__GKSignInViewController_signInController_didCompleteWithOperationsResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "authenticateRequestCompletedWithErrorResponse:error:", a2, a3);
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4;

  -[GKSignInViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[GKSignInViewController signInView](self, "signInView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enablePrimaryButton");

}

- (void)signInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[5];
  id v21;

  v8 = a3;
  if (a4 && !a5)
  {
    v9 = *MEMORY[0x1E0CFFFC8];
    v10 = a4;
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke;
    block[3] = &unk_1E59C4708;
    block[4] = self;
    v15 = v8;
    v21 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountServicePrivate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2;
    v18[3] = &unk_1E59C6AF0;
    v18[4] = self;
    v19 = v15;
    objc_msgSend(v17, "authenticatePlayerWithUsername:password:altDSID:usingFastPath:handler:", v11, v12, v13, 1, v18);

  }
}

void __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startLoadingIndicator");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

void __80__GKSignInViewController_signInViewController_didAuthenticateWithResults_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopLoadingIndicator");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "authenticateRequestCompletedWithErrorResponse:error:", v7, v5);

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0CFAC38];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "clientInfoHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v8, CFSTR("X-MMe-Client-Info"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v11, CFSTR("X-MMe-Country"));

  return 1;
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a4, "URL", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsString:", CFSTR("skipCreateAppleID"));

  if (v7)
    self->_userShouldSkipCreateAppleID = 1;
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *u13ObjectModels;
  NSMutableArray *v14;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  NSObject **v18;
  NSObject *v19;
  id v20;
  uint8_t v21[16];

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5
    && *a5 == 2
    && (objc_msgSend(v9, "defaultPages"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        !v12))
  {
    v18 = (NSObject **)MEMORY[0x1E0D25460];
    v19 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v20 = (id)GKOSLoggers();
      v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1AB361000, v19, OS_LOG_TYPE_INFO, "Warning: AppleIDController received an object model with actionSignal=Push but no pages.", v21, 2u);
    }
  }
  else
  {
    u13ObjectModels = self->_u13ObjectModels;
    if (!u13ObjectModels)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = self->_u13ObjectModels;
      self->_u13ObjectModels = v14;

      u13ObjectModels = self->_u13ObjectModels;
    }
    -[NSMutableArray addObject:](u13ObjectModels, "addObject:", v10);
    objc_msgSend(v10, "clientInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("continue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && (objc_msgSend(v17, "BOOLValue") & 1) == 0)
      self->_userShouldSkipCreateAppleID = 1;

  }
}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  if (self->_userShouldSkipCreateAppleID)
  {
    -[GKDispatchGroup leave](self->_u13Group, "leave");
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = self->_u13ObjectModels;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12++), "populatePostbackDictionary:", v7);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "length"))
      -[GKSignInViewController remoteUIControllerDidDismiss:].cold.1();
    objc_msgSend(MEMORY[0x1E0CB34D0], "_gkPreferredSystemLanguage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
      -[GKSignInViewController remoteUIControllerDidDismiss:].cold.2();
    if (objc_msgSend(v15, "rangeOfString:", CFSTR("-")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v14, "lowercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@-%@"), v15, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length"))
      objc_msgSend(v7, "setObject:forKey:", v20, *MEMORY[0x1E0CFAB88]);
    objc_msgSend(v7, "setObject:forKey:", v15, *MEMORY[0x1E0CFAB80]);
    objc_msgSend(v14, "uppercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v21, *MEMORY[0x1E0CFAB78]);

    v22 = objc_alloc_init(MEMORY[0x1E0CFAD20]);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__GKSignInViewController_remoteUIControllerDidDismiss___block_invoke;
    v23[3] = &unk_1E59C6B18;
    v23[4] = self;
    objc_msgSend(v22, "createAppleIDWithParameters:handlerWithResponse:", v7, v23);

  }
}

void __55__GKSignInViewController_remoteUIControllerDidDismiss___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v6 = a5;
  objc_msgSend(v6, "responseDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "responseDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status-message"));
  v9 = objc_claimAutoreleasedReturnValue();

  if (v14 | v9)
  {
    v10 = *(void **)(a1 + 32);
    GKGameCenterUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "_gkPresentAlertWithTitle:message:buttonTitle:", v14, v9, v12);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "leave");

}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  GKDispatchGroup *u13Group;
  _QWORD v19[4];
  id v20;
  id v21;
  GKSignInViewController *v22;

  v9 = a6;
  v10 = *MEMORY[0x1E0CFFF98];
  v11 = a5;
  objc_msgSend(a4, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "code");

  if (v13 == -7006)
  {
    -[GKSignInViewController showLoginFailedAlert](self, "showLoginFailedAlert");
  }
  else if (v12)
  {
    v14 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKSignInViewController.m", 587, "-[GKSignInViewController authenticationController:shouldContinueWithAuthenticationResults:error:forContext:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dispatchGroupWithName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInViewController setU13Group:](self, "setU13Group:", v16);

    u13Group = self->_u13Group;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke;
    v19[3] = &unk_1E59C42A0;
    v20 = v12;
    v21 = v9;
    v22 = self;
    -[GKDispatchGroup perform:](u13Group, "perform:", v19);
    -[GKDispatchGroup enter](self->_u13Group, "enter");
    -[GKDispatchGroup wait](self->_u13Group, "wait");

  }
  return 1;
}

void __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;

  v31 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0CFAC38]);
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CFAD58], "urlConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repairCloudAccountUIURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v32 = (void *)v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:cachePolicy:timeoutInterval:", v7, 1, 30.0);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", *(_QWORD *)(a1 + 32), CFSTR("X-Apple-AK-Continuation-Data"));
  v33 = v3;
  objc_msgSend(v3, "clientInfoHeader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v9, CFSTR("X-MMe-Client-Info"));

  objc_msgSend(*(id *)(a1 + 40), "altDSID");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_password");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v10, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addValue:forHTTPHeaderField:", v13, CFSTR("Authorization"));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("com.apple.GameCenter.u13"));
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "set_appleIDContext:", v14);
  v16 = objc_alloc_init(MEMORY[0x1E0D872F0]);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(void **)(v17 + 1120);
  *(_QWORD *)(v17 + 1120) = v16;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1120), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1120), "setSessionConfiguration:", v15);
  v19 = objc_alloc_init(MEMORY[0x1E0DC3A40]);
  v20 = *(_QWORD *)(a1 + 48);
  v21 = *(void **)(v20 + 1128);
  *(_QWORD *)(v20 + 1128) = v19;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if (v23 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1128), "setModalPresentationStyle:", 16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1128), "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMasksToBounds:", 1);

  }
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1128), 1, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1120), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1120), "setNavigationController:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1128));
  v26 = *(void **)(*(_QWORD *)(a1 + 48) + 1120);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke_2;
  v34[3] = &unk_1E59C6B40;
  v35 = v31;
  v27 = v31;
  objc_msgSend(v26, "loadRequest:completion:", v8, v34);

}

uint64_t __108__GKSignInViewController_authenticationController_shouldContinueWithAuthenticationResults_error_forContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)createSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIScrollView *v8;
  UIScrollView *scrollView;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  __int128 v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  GKSignInInputView *v21;
  GKSignInInputView *signInInputView;
  void *v23;
  UILabel *v24;
  UILabel *loginPromptLabel;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  UIImageView *v35;
  UIImageView *bubbleImageView;
  UILabel *v37;
  UILabel *signInLabel;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIActivityIndicatorView *v43;
  UIActivityIndicatorView *progressIndicator;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;

  v3 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  scrollView = self->_scrollView;
  self->_scrollView = v8;

  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKViewController colorPalette](self, "colorPalette");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v11);

  -[UIScrollView setOpaque:](self->_scrollView, "setOpaque:", 1);
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  self->_contentInsetsBeforeKeyboard.top = v12;
  self->_contentInsetsBeforeKeyboard.left = v13;
  self->_contentInsetsBeforeKeyboard.bottom = v14;
  self->_contentInsetsBeforeKeyboard.right = v15;
  v16 = *(_OWORD *)&self->_contentInsetsBeforeKeyboard.bottom;
  *(_OWORD *)&self->_currentContentInsets.top = *(_OWORD *)&self->_contentInsetsBeforeKeyboard.top;
  *(_OWORD *)&self->_currentContentInsets.bottom = v16;
  -[UIScrollView verticalScrollIndicatorInsets](self->_scrollView, "verticalScrollIndicatorInsets");
  self->_scrollIndicatorInsetsBeforeKeyboard.top = v17;
  self->_scrollIndicatorInsetsBeforeKeyboard.left = v18;
  self->_scrollIndicatorInsetsBeforeKeyboard.bottom = v19;
  self->_scrollIndicatorInsetsBeforeKeyboard.right = v20;
  v21 = -[GKSignInInputView initWithFrame:]([GKSignInInputView alloc], "initWithFrame:", v4, v5, v6, v7);
  signInInputView = self->_signInInputView;
  self->_signInInputView = v21;

  -[GKSignInInputView setTranslatesAutoresizingMaskIntoConstraints:](self->_signInInputView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSignInInputView setBackgroundColor:](self->_signInInputView, "setBackgroundColor:", v23);

  v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  loginPromptLabel = self->_loginPromptLabel;
  self->_loginPromptLabel = v24;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_loginPromptLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v26) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_loginPromptLabel, "setContentCompressionResistancePriority:forAxis:", 1, v26);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_loginPromptLabel, "setBackgroundColor:", v27);

  -[UILabel setLineBreakMode:](self->_loginPromptLabel, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_loginPromptLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_loginPromptLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_loginPromptLabel, "setFont:", v28);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_loginPromptLabel, "setTextColor:", v29);

  objc_msgSend(MEMORY[0x1E0D25AC8], "SIGN_IN_PROMPT_MESSAGE_TEXT");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_loginPromptLabel, "setText:", v30);

  -[UILabel setAccessibilityIdentifier:](self->_loginPromptLabel, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.SignIn.prompt"));
  v31 = objc_alloc(MEMORY[0x1E0DC3890]);
  v32 = (void *)MEMORY[0x1E0DC3870];
  GKGameCenterUIFrameworkBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "imageNamed:inBundle:", CFSTR("GKOnboardingIcon"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (UIImageView *)objc_msgSend(v31, "initWithImage:", v34);
  bubbleImageView = self->_bubbleImageView;
  self->_bubbleImageView = v35;

  -[UIImageView setAccessibilityIdentifier:](self->_bubbleImageView, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.SignIn.icon"));
  v37 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  signInLabel = self->_signInLabel;
  self->_signInLabel = v37;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_signInLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setBackgroundColor:](self->_signInLabel, "setBackgroundColor:", v39);

  -[UILabel setLineBreakMode:](self->_signInLabel, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_signInLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_signInLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B48], 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_signInLabel, "setFont:", v40);

  GKGameCenterUIFrameworkBundle();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_signInLabel, "setText:", v42);

  -[UILabel setAccessibilityIdentifier:](self->_signInLabel, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.SignIn.header"));
  v43 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  progressIndicator = self->_progressIndicator;
  self->_progressIndicator = v43;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setHidesWhenStopped:](self->_progressIndicator, "setHidesWhenStopped:", 1);
  -[GKViewController colorPalette](self, "colorPalette");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "activityIndicatorColor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](self->_progressIndicator, "setColor:", v46);

  -[UIActivityIndicatorView setAccessibilityIdentifier:](self->_progressIndicator, "setAccessibilityIdentifier:", CFSTR("UIA.GameCenter.SignIn.progressIndicator"));
  -[GKSignInViewController view](self, "view");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setBackgroundColor:", v47);

  objc_msgSend(v49, "addSubview:", self->_scrollView);
  v48 = (id)objc_msgSend(v49, "_gkApplyFakeStatusBarView");
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_signInInputView);
  -[GKSignInInputView addSubview:](self->_signInInputView, "addSubview:", self->_bubbleImageView);
  -[GKSignInInputView addSubview:](self->_signInInputView, "addSubview:", self->_signInLabel);
  -[GKSignInInputView addSubview:](self->_signInInputView, "addSubview:", self->_loginPromptLabel);
  -[GKSignInInputView addSubview:](self->_signInInputView, "addSubview:", self->_progressIndicator);

}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[GKSignInViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  -[GKSignInViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v5 + v7;

  -[GKSignInViewController signInInputView](self, "signInInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "signInInputViewHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", -v8);

  v11.receiver = self;
  v11.super_class = (Class)GKSignInViewController;
  -[GKSignInViewController viewSafeAreaInsetsDidChange](&v11, sel_viewSafeAreaInsetsDidChange);
}

- (void)_systemContentSizeSettingDidChange:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[GKSignInInputView subviews](self->_signInInputView, "subviews", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EEC66488))
          objc_msgSend(v8, "replayAndApplyStyleWithSystemContentChange:", 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKSignInViewController;
  -[GKSignInViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v9, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, a4);
  if (objc_msgSend(v6, "userInterfaceIdiom") == 1)
  {
    -[GKSignInViewController updateConstraintConstantsForTraitCollection:](self, "updateConstraintConstantsForTraitCollection:", v6);
    -[GKSignInViewController fullWidthViewConstraints](self, "fullWidthViewConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__GKSignInViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E59C6B68;
    v8[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  }
}

void __84__GKSignInViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "fullWidthContentWidthConstraintConstant");
  objc_msgSend(v3, "setConstant:");

}

- (void)updateConstraintConstantsForTraitCollection:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v6 = 291.0;
    else
      v6 = dbl_1AB7F8170[objc_msgSend(v7, "horizontalSizeClass") == 2];
  }
  else
  {
    v6 = 290.0;
  }
  -[GKSignInViewController setFullWidthContentWidthConstraintConstant:](self, "setFullWidthContentWidthConstraintConstant:", v6);

}

- (void)createConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  GKSignInInputView *signInInputView;
  UIScrollView *v10;
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
  UILabel *signInLabel;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  UIScrollView *v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  GKSignInViewController *v50;
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  if (!self->_constraintsCreated)
  {
    -[GKSignInViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForView:withinView:insets:", self->_scrollView, v44, *MEMORY[0x1E0DC49E8], v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addConstraints:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    signInInputView = self->_signInInputView;
    v10 = self->_scrollView;
    objc_msgSend(v8, "_gkConstraintsForView:withinView:insets:", signInInputView, v10, v3, v4, v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v10;
    -[UIScrollView addConstraints:](v10, "addConstraints:", v11);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_signInInputView, 7, 0, v10, 7, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView addConstraint:](v10, "addConstraint:", v12);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_bubbleImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView bottomAnchor](self->_bubbleImageView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](self->_signInLabel, "firstBaselineAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -37.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UIImageView centerXAnchor](self->_bubbleImageView, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInInputView centerXAnchor](self->_signInInputView, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_signInLabel, 11, 0, self->_signInInputView, 3, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInInputView setTopToSignInBaselineConstraint:](self->_signInInputView, "setTopToSignInBaselineConstraint:", v19);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_loginPromptLabel, 12, 0, self->_signInLabel, 11, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInInputView setSignInBaselineToPromptTextTopConstraint:](self->_signInInputView, "setSignInBaselineToPromptTextTopConstraint:", v20);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_progressIndicator, 3, 0, self->_loginPromptLabel, 11, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInInputView setPromptTextToProgressIndicatorTopConstraint:](self->_signInInputView, "setPromptTextToProgressIndicatorTopConstraint:", v21);

    v22 = (void *)MEMORY[0x1E0CB3718];
    -[AKInlineSignInViewController view](self->_inlineSignInViewController, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 12, 0, self->_loginPromptLabel, 11, 1.0, 0.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInInputView setSignInFormToSignInLabelTopConstraint:](self->_signInInputView, "setSignInFormToSignInLabelTopConstraint:", v24);

    -[GKSignInViewController signInInputView](self, "signInInputView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "heightAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInInputView setSignInInputViewHeightConstraint:](self->_signInInputView, "setSignInInputViewHeightConstraint:", v29);

    -[GKSignInInputView signInInputViewHeightConstraint](self->_signInInputView, "signInInputViewHeightConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActive:", 1);

    -[GKSignInInputView allVariableConstraints](self->_signInInputView, "allVariableConstraints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v31);

    -[GKSignInViewController traitCollection](self, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInViewController updateConstraintConstantsForTraitCollection:](self, "updateConstraintConstantsForTraitCollection:", v32);

    signInLabel = self->_signInLabel;
    v52[0] = self->_loginPromptLabel;
    v52[1] = signInLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = self->_progressIndicator;
    -[AKInlineSignInViewController view](self->_inlineSignInViewController, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __43__GKSignInViewController_createConstraints__block_invoke;
    v48[3] = &unk_1E59C6B90;
    v39 = v42;
    v49 = v39;
    v50 = self;
    objc_msgSend(v37, "enumerateObjectsUsingBlock:", v48);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
    v45[0] = v38;
    v45[1] = 3221225472;
    v45[2] = __43__GKSignInViewController_createConstraints__block_invoke_2;
    v45[3] = &unk_1E59C6BB8;
    v45[4] = self;
    v46 = v39;
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v40 = v47;
    v41 = v39;
    objc_msgSend(v34, "enumerateObjectsUsingBlock:", v45);
    -[GKSignInViewController setFullWidthViewConstraints:](self, "setFullWidthViewConstraints:", v40);
    -[GKSignInInputView addConstraints:](self->_signInInputView, "addConstraints:", v41);
    -[GKSignInInputView setupConstraintConstantsForOrientation:](self->_signInInputView, "setupConstraintConstantsForOrientation:", -[GKSignInViewController interfaceOrientation](self, "interfaceOrientation"));
    -[GKSignInInputView setNeedsLayout](self->_signInInputView, "setNeedsLayout");
    self->_constraintsCreated = 1;

  }
}

void __43__GKSignInViewController_createConstraints__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintForView:centeredXInView:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1056));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __43__GKSignInViewController_createConstraints__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3718];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "fullWidthContentWidthConstraintConstant");
  objc_msgSend(v3, "_gkConstraintForView:withConstantWidth:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKSignInViewController;
  -[GKSignInViewController willAnimateRotationToInterfaceOrientation:duration:](&v8, sel_willAnimateRotationToInterfaceOrientation_duration_);
  -[GKSignInInputView setupConstraintConstantsForOrientation:](self->_signInInputView, "setupConstraintConstantsForOrientation:", a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__GKSignInViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke;
  v7[3] = &unk_1E59C4148;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, a4);
}

uint64_t __77__GKSignInViewController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "layoutIfNeeded");
}

- (void)startLoadingIndicator
{
  id v2;

  -[GKSignInViewController progressIndicator](self, "progressIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimating");

}

- (void)stopLoadingIndicator
{
  id v2;

  -[GKSignInViewController progressIndicator](self, "progressIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

- (void)signIn
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D25B00], "authenticatorForPlayerWithUsername:password:withPresentingViewController:", self->_appleID, 0, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__GKSignInViewController_signIn__block_invoke;
  v5[3] = &unk_1E59C4148;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__GKSignInViewController_signIn__block_invoke_3;
  v4[3] = &unk_1E59C6BE0;
  objc_msgSend(v3, "authenticateUsingAuthUIWithAuthUIDismissHandler:completionHandler:", v5, v4);

}

void __32__GKSignInViewController_signIn__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__GKSignInViewController_signIn__block_invoke_2;
  block[3] = &unk_1E59C4148;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __32__GKSignInViewController_signIn__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startLoadingIndicator");
}

void __32__GKSignInViewController_signIn__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "authenticateRequestCompletedWithErrorResponse:error:", a5, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__GKSignInViewController_signIn__block_invoke_4;
  v10[3] = &unk_1E59C4708;
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __32__GKSignInViewController_signIn__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "stopLoadingIndicator");
}

- (void)showPasswordChangeAlertWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;

  v4 = a3;
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v22, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke;
  v24[3] = &unk_1E59C4408;
  v25 = v4;
  v16 = v4;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke_2;
  v23[3] = &unk_1E59C4408;
  v23[4] = self;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v21);

  -[GKSignInViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

void __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:", *(_QWORD *)(a1 + 32));

}

void __57__GKSignInViewController_showPasswordChangeAlertWithURL___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishAuthenticationWithError:", v2);

}

- (void)authenticateRequestCompletedWithErrorResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  _QWORD v28[5];

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (objc_msgSend(MEMORY[0x1E0D252C0], "isGameCenter")
      && objc_msgSend(v6, "shouldShowLinkAccountsUI"))
    {
      objc_msgSend(v6, "playerID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKSignInViewController showAccountRemoteUIForPlayerID:mode:](self, "showAccountRemoteUIForPlayerID:mode:", v8, 3);
      goto LABEL_10;
    }
    if ((objc_msgSend(v6, "passwordChangeRequired") & 1) == 0)
    {
      -[GKSignInViewController finishAuthenticationWithError:](self, "finishAuthenticationWithError:", 0);
      goto LABEL_11;
    }
LABEL_9:
    objc_msgSend(v6, "passwordChangeURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKSignInViewController showPasswordChangeAlertWithURL:](self, "showPasswordChangeAlertWithURL:", v8);
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "passwordChangeRequired"))
    goto LABEL_9;
  if (!objc_msgSend(v7, "gkIsNotConnectedToInternetError"))
  {
    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D24C28]);

    if (v16)
    {
      v17 = objc_msgSend(v7, "code");
      if (v17 > 5)
      {
        if (v17 == 6)
        {
          objc_msgSend(v7, "userInfo");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CB3388]);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "playerID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[GKSignInViewController handleUnderlyingAuthenticationError:playerID:](self, "handleUnderlyingAuthenticationError:playerID:", v8, v26);

          if (!v27)
            -[GKSignInViewController showConnectionFailedAlert](self, "showConnectionFailedAlert");
          goto LABEL_10;
        }
        if (v17 == 15)
        {
          v18 = (void *)MEMORY[0x1E0DC3450];
          GKGameCenterUIFrameworkBundle();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          GKGetLocalizedStringFromTableInBundle();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v20, 0, 1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = (void *)MEMORY[0x1E0DC3448];
          GKGameCenterUIFrameworkBundle();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          GKGetLocalizedStringFromTableInBundle();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __78__GKSignInViewController_authenticateRequestCompletedWithErrorResponse_error___block_invoke;
          v28[3] = &unk_1E59C4408;
          v28[4] = self;
          objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addAction:", v24);

          -[GKSignInViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
          goto LABEL_10;
        }
      }
      else
      {
        if (v17 == 2)
          goto LABEL_11;
        if (v17 == 5)
        {
          -[GKSignInViewController showLoginFailedAlert](self, "showLoginFailedAlert");
          goto LABEL_11;
        }
      }
    }
    -[GKSignInViewController showConnectionFailedAlert](self, "showConnectionFailedAlert");
    goto LABEL_11;
  }
  GKGameCenterUIFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)-[GKSignInViewController _gkPresentAlertWithTitle:message:buttonTitle:](self, "_gkPresentAlertWithTitle:message:buttonTitle:", v9, v11, v13);

LABEL_10:
LABEL_11:

}

void __78__GKSignInViewController_authenticateRequestCompletedWithErrorResponse_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 15, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishAuthenticationWithError:", v2);

}

- (void)presentError:(id)a3 forAccountRemoteUIController:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = objc_msgSend(a4, "mode", a3);
  if (v5 == 3 || v5 == 2 || v5 == 1)
  {
    GKGameCenterUIFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (id)objc_claimAutoreleasedReturnValue();

    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
    v8 = 0;
  }
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)-[GKSignInViewController _gkPresentAlertWithTitle:message:buttonTitle:](self, "_gkPresentAlertWithTitle:message:buttonTitle:", v12, v8, v10);

}

- (void)accountRemoteUIController:(id)a3 finishedWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v5 = a3;
  objc_msgSend(v5, "playerForRemoteUI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if ((objc_msgSend(v5, "isServerAuthenticated") & 1) != 0)
  {
    if (objc_msgSend(v9, "isAuthenticated"))
    {
      -[GKSignInViewController finishAuthenticationWithError:](self, "finishAuthenticationWithError:", 0);
    }
    else if (objc_msgSend(v5, "mode") == 1)
    {
      -[GKSignInViewController cancelSignIn](self, "cancelSignIn");
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__GKSignInViewController_accountRemoteUIController_finishedWithError___block_invoke;
    v10[3] = &unk_1E59C45D8;
    v10[4] = self;
    objc_msgSend(v9, "signOutWithCompletionHandler:", v10);
  }
  -[GKSignInViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __70__GKSignInViewController_accountRemoteUIController_finishedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAuthenticationWithError:", 0);
}

- (void)loadAccountRemoteUIForPlayer:(id)a3 mode:(int64_t)a4 completionHandler:(id)a5
{
  -[GKSignInViewController loadAccountRemoteUIForPlayer:mode:url:postBody:completionHandler:](self, "loadAccountRemoteUIForPlayer:mode:url:postBody:completionHandler:", a3, a4, 0, 0, a5);
}

- (void)loadAccountRemoteUIForPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKSignInViewController.m"), 991, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  self->_loadingRemoteUI = 1;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke;
  v20[3] = &unk_1E59C6C78;
  v20[4] = self;
  v21 = v13;
  v22 = v16;
  v17 = v16;
  v18 = v13;
  +[GKAccountRemoteUIController accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:](GKAccountRemoteUIController, "accountRemoteUIControllerForPlayer:mode:url:postBody:completionHandler:", v18, a4, v14, v15, v20);

}

void __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void (*v13)(void);
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "code") == 3)
    {
      objc_msgSend(v7, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("GKRemoteUIErrorDomain"));

      if (v9)
      {
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v7, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_2;
        v19[3] = &unk_1E59C6C28;
        v12 = *(void **)(a1 + 40);
        v19[4] = *(_QWORD *)(a1 + 32);
        v20 = v12;
        objc_msgSend(v10, "showAuthKitAlertFromGreenBuddyWithAuthInfo:completion:", v11, v19);

LABEL_11:
        v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
        goto LABEL_12;
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 993) = 0;
    objc_msgSend(v7, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("GKRemoteUIErrorDomain")))
    {
      v15 = objc_msgSend(v7, "code");

      if (!v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "cancelAuthentication");
        objc_msgSend(*(id *)(a1 + 40), "startAuthenticationForExistingPrimaryPlayer");
        v16 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "finishAuthenticationWithError:", v17);

        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "finishAuthenticationWithError:", v7);
    goto LABEL_11;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 993) = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_4;
  v18[3] = &unk_1E59C6C50;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "setCompletionHandler:", v18);
  objc_msgSend(*(id *)(a1 + 32), "setAccountController:", v5);
  v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_12:
  v13();

}

void __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 993) = 0;
  if (objc_msgSend(a2, "code") == -7003)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "authenticationDidCompleteWithError:", v3);
    objc_msgSend(*(id *)(a1 + 32), "finishAuthenticationWithError:", v3);
    objc_msgSend(*(id *)(a1 + 40), "signOutWithCompletionHandler:", &__block_literal_global_29);

  }
}

void __91__GKSignInViewController_loadAccountRemoteUIForPlayer_mode_url_postBody_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(v7, "isServerAuthenticated") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 2, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "accountRemoteUIController:finishedWithError:", v7, v5);
  objc_msgSend(*(id *)(a1 + 32), "setAccountController:", 0);

}

- (void)presentAccountRemoteUIControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  GKRemoteUINavigationController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  GKSignInViewController *remoteUIPresentingViewController;
  GKRemoteUINavigationController *v19;

  v3 = a3;
  v5 = [GKRemoteUINavigationController alloc];
  -[GKSignInViewController accountController](self, "accountController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[GKRemoteUINavigationController initWithRemoteUIController:](v5, "initWithRemoteUIController:", v6);

  if ((objc_msgSend(MEMORY[0x1E0D252C0], "isGameCenter") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if (v8 == 1 && (!*MEMORY[0x1E0D253F8] || *MEMORY[0x1E0D25B68] != 0))
    {
      -[GKRemoteUINavigationController setModalPresentationStyle:](v19, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "formSheetSize");
      -[GKRemoteUINavigationController setFormSheetSize:](v19, "setFormSheetSize:");

      -[GKRemoteUINavigationController view](v19, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMasksToBounds:", 1);

      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "formSheetCornerRadius");
      v15 = v14;
      -[GKRemoteUINavigationController view](v19, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCornerRadius:", v15);

    }
  }
  if (self->_remoteUIPresentingViewController)
    remoteUIPresentingViewController = (GKSignInViewController *)self->_remoteUIPresentingViewController;
  else
    remoteUIPresentingViewController = self;
  -[GKSignInViewController presentViewController:animated:completion:](remoteUIPresentingViewController, "presentViewController:animated:completion:", v19, v3, 0);

}

- (void)showAccountRemoteUIForAccountName:(id)a3 mode:(int64_t)a4
{
  -[GKSignInViewController showAccountRemoteUIForAccountName:mode:url:postBody:](self, "showAccountRemoteUIForAccountName:mode:url:postBody:", a3, a4, 0, 0);
}

- (void)showAccountRemoteUIForPlayerID:(id)a3 mode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  -[GKSignInViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 0);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0D25330], "authenticatedLocalPlayersFiltered:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __62__GKSignInViewController_showAccountRemoteUIForPlayerID_mode___block_invoke;
  v13 = &unk_1E59C6CA0;
  v9 = v6;
  v14 = v9;
  v15 = &v16;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v10);

  -[GKSignInViewController showAccountRemoteUIForLocalPlayer:mode:url:postBody:](self, "showAccountRemoteUIForLocalPlayer:mode:url:postBody:", v17[5], a4, 0, 0, v10, v11, v12, v13);
  _Block_object_dispose(&v16, 8);

}

void __62__GKSignInViewController_showAccountRemoteUIForPlayerID_mode___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (void)showAccountRemoteUIForAccountName:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[GKSignInViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInteractionEnabled:", 0);

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0D25330], "authenticatedLocalPlayersFiltered:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __78__GKSignInViewController_showAccountRemoteUIForAccountName_mode_url_postBody___block_invoke;
  v19 = &unk_1E59C6CA0;
  v15 = v10;
  v20 = v15;
  v21 = &v22;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v16);

  -[GKSignInViewController showAccountRemoteUIForLocalPlayer:mode:url:postBody:](self, "showAccountRemoteUIForLocalPlayer:mode:url:postBody:", v23[5], a4, v11, v12, v16, v17, v18, v19);
  _Block_object_dispose(&v22, 8);

}

void __78__GKSignInViewController_showAccountRemoteUIForAccountName_mode_url_postBody___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "accountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

- (void)showAccountRemoteUIForLocalPlayer:(id)a3 mode:(int64_t)a4 url:(id)a5 postBody:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v10 = (void *)MEMORY[0x1E0D25298];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (id)objc_msgSend(v10, "proxyForPlayer:", v13);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__GKSignInViewController_showAccountRemoteUIForLocalPlayer_mode_url_postBody___block_invoke;
  v15[3] = &unk_1E59C45D8;
  v15[4] = self;
  -[GKSignInViewController loadAccountRemoteUIForPlayer:mode:url:postBody:completionHandler:](self, "loadAccountRemoteUIForPlayer:mode:url:postBody:completionHandler:", v13, a4, v12, v11, v15);

}

void __78__GKSignInViewController_showAccountRemoteUIForLocalPlayer_mode_url_postBody___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  if (v10)
  {
    if (objc_msgSend(v10, "code") != 3)
    {
      v4 = *(void **)(a1 + 32);
      GKGameCenterUIFrameworkBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v4, "_gkPresentAlertForError:title:defaultMessage:", v10, v6, v8);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "presentAccountRemoteUIControllerAnimated:", 1);
  }

}

- (void)showAuthKitAlertFromGreenBuddyWithAuthInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GKSignInViewController *remoteUIPresentingViewController;
  void *v16;
  GKSignInViewController *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("authUsername"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("authOkUrl"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cancelUrl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  remoteUIPresentingViewController = (GKSignInViewController *)self->_remoteUIPresentingViewController;
  if (!remoteUIPresentingViewController)
    remoteUIPresentingViewController = self;
  v16 = (void *)MEMORY[0x1E0D25B00];
  v17 = remoteUIPresentingViewController;
  objc_msgSend(v16, "authenticatorForPlayerWithUsername:password:withPresentingViewController:", v8, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __80__GKSignInViewController_showAuthKitAlertFromGreenBuddyWithAuthInfo_completion___block_invoke;
  v22[3] = &unk_1E59C6CC8;
  v22[4] = self;
  v23 = v11;
  v24 = v14;
  v25 = v6;
  v19 = v6;
  v20 = v14;
  v21 = v11;
  objc_msgSend(v18, "authenticateUsingAuthUIAllowingAppleIDCreation:usernameEditable:dismissHandler:completionHandler:", 0, 0, 0, v22);

}

void __80__GKSignInViewController_showAuthKitAlertFromGreenBuddyWithAuthInfo_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = v18;
  if (v13 && v14 && !v18)
  {
    v20 = (void *)a1[4];
    v21 = a1[5];
    if (v15)
      v22 = v15;
    else
      v22 = v13;
    v26[0] = CFSTR("authUsername");
    v26[1] = CFSTR("authPassword");
    v27[0] = v22;
    v27[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "showAccountRemoteUIForAccountName:mode:url:postBody:", v13, 1, v21, v23);

  }
  else
  {
    v24 = a1[6];
    if (v24)
      objc_msgSend(MEMORY[0x1E0D25B00], "postURL:postBody:completion:", v24, MEMORY[0x1E0C9AA70], 0);
  }
  v25 = a1[7];
  if (v25)
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v19);

}

- (void)showViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  GKNavigationController *v9;

  v4 = a3;
  v9 = -[GKNavigationController initWithRootViewController:]([GKNavigationController alloc], "initWithRootViewController:", v4);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    if (*MEMORY[0x1E0D253F8])
      v7 = *MEMORY[0x1E0D25B68] == 0;
    else
      v7 = 0;
    if (!v7)
    {
      -[GKNavigationController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 16);
      objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "formSheetSize");
      -[GKNavigationController setFormSheetSize:](v9, "setFormSheetSize:");

    }
  }
  -[GKSignInViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)finishAuthenticationWithError:(id)a3
{
  void (**completionHandler)(id, id);

  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    -[GKSignInViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[GKSignInViewController stopLoadingIndicator](self, "stopLoadingIndicator", a3);
}

- (BOOL)handleUnderlyingAuthenticationError:(id)a3 playerID:(id)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = objc_msgSend(a3, "code");
  switch(v7)
  {
    case 5048:
      GKGameCenterUIFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)-[GKSignInViewController _gkPresentAlertWithTitle:message:buttonTitle:](self, "_gkPresentAlertWithTitle:message:buttonTitle:", v10, 0, v12);

LABEL_7:
      v8 = 1;
      break;
    case 5046:
      -[GKSignInViewController showAccountDisabledAlert](self, "showAccountDisabledAlert");
      goto LABEL_7;
    case 5029:
      v8 = 1;
      -[GKSignInViewController showAccountRemoteUIForPlayerID:mode:](self, "showAccountRemoteUIForPlayerID:mode:", v6, 1);
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (void)showPasswordResetAlertWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__GKSignInViewController_showPasswordResetAlertWithTitle_message___block_invoke;
  block[3] = &unk_1E59C54B8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__GKSignInViewController_showPasswordResetAlertWithTitle_message___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  GKGameCenterUIFrameworkBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v1, "_gkPresentConfirmationAlertWithTitle:message:buttonTitle:block:cancelAction:", v2, v3, v4, &__block_literal_global_294, 0);

}

void __66__GKSignInViewController_showPasswordResetAlertWithTitle_message___block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D24C20]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:", v0);

}

- (void)showPasswordAlertWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GKSignInViewController_showPasswordAlertWithTitle_message___block_invoke;
  block[3] = &unk_1E59C54B8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __61__GKSignInViewController_showPasswordAlertWithTitle_message___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  GKGameCenterUIFrameworkBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v1, "_gkPresentAlertWithTitle:message:buttonTitle:", v2, v3, v4);

}

- (void)showLoginFailedAlert
{
  void *v3;
  id v4;

  GKGameCenterUIFrameworkBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSignInViewController showPasswordAlertWithTitle:message:](self, "showPasswordAlertWithTitle:message:", v3, 0);

}

- (void)showForgotPasswordAlert
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  GKGameCenterUIFrameworkBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSignInViewController showPasswordResetAlertWithTitle:message:](self, "showPasswordResetAlertWithTitle:message:", v3, v5);

}

- (void)showAccountDisabledAlert
{
  void *v3;
  id v4;

  GKGameCenterUIFrameworkBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSignInViewController showPasswordResetAlertWithTitle:message:](self, "showPasswordResetAlertWithTitle:message:", v3, 0);

}

- (void)showConnectionFailedAlert
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GKSignInViewController_showConnectionFailedAlert__block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__GKSignInViewController_showConnectionFailedAlert__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v1 = *(void **)(a1 + 32);
  GKGameCenterUIFrameworkBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v1, "_gkPresentAlertWithTitle:message:buttonTitle:", v2, 0, v4);

}

- (void)createAppleID
{
  id v2;

  -[GKSignInViewController setEditing:](self, "setEditing:", 0);
  objc_msgSend(MEMORY[0x1E0D25270], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openICloudSettings");

}

- (void)showAAUISignInController
{
  GKAAUISignInController *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  GKAAUISignInController *v8;
  _QWORD v9[4];
  GKAAUISignInController *v10;
  id v11;
  id location;

  v3 = objc_alloc_init(GKAAUISignInController);
  -[AAUISignInController setServiceType:](v3, "setServiceType:", *MEMORY[0x1E0CFCF28]);
  -[GKAAUISignInController setDelegate:](v3, "setDelegate:", self);
  -[AAUISignInController _setShouldForceOperation:](v3, "_setShouldForceOperation:", 1);
  if (objc_msgSend(MEMORY[0x1E0D25330], "usesGameOverlayUI")
    && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "userInterfaceIdiom"),
        v4,
        v5 == 1))
  {
    v6 = 18;
  }
  else
  {
    v6 = 5;
  }
  -[GKAAUISignInController setModalPresentationStyle:](v3, "setModalPresentationStyle:", v6);
  -[GKSignInViewController signInView](self, "signInView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disablePrimaryButton");

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__GKSignInViewController_showAAUISignInController__block_invoke;
  v9[3] = &unk_1E59C6D10;
  objc_copyWeak(&v11, &location);
  v8 = v3;
  v10 = v8;
  -[AAUISignInController prepareInViewController:completion:](v8, "prepareInViewController:completion:", self, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __50__GKSignInViewController_showAAUISignInController__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "signInView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enablePrimaryButton");

  }
}

- (void)iForgotTapped
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  objc_msgSend(v3, "setNeedsCredentialRecovery:", 1);
  objc_msgSend(v3, "setPresentingViewController:", self);
  -[GKSignInViewController appleID](self, "appleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsername:", v4);

  -[GKSignInViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  v6 = objc_alloc_init(MEMORY[0x1E0D00130]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__GKSignInViewController_iForgotTapped__block_invoke;
  v7[3] = &unk_1E59C6D38;
  v7[4] = self;
  objc_msgSend(v6, "authenticateWithContext:completion:", v3, v7);

}

void __39__GKSignInViewController_iForgotTapped__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__GKSignInViewController_iForgotTapped__block_invoke_2;
  block[3] = &unk_1E59C4148;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __39__GKSignInViewController_iForgotTapped__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  id v33;
  CGPoint v34;
  CGRect v35;

  objc_msgSend(a3, "userInfo");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;

  -[GKSignInViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", 0.0, 0.0, v6, 0.0);

  -[GKSignInViewController scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollIndicatorInsets:", 0.0, 0.0, v6, 0.0);

  self->_currentContentInsets.top = 0.0;
  self->_currentContentInsets.left = 0.0;
  self->_currentContentInsets.bottom = v6;
  self->_currentContentInsets.right = 0.0;
  -[GKSignInViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v17 - v6;
  -[GKSignInViewController inlineSignInViewController](self, "inlineSignInViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[GKSignInViewController scrollView](self, "scrollView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "contentOffset");
  v31 = v24 - v30;

  v35.origin.x = v11;
  v35.origin.y = v13;
  v35.size.width = v15;
  v35.size.height = v18;
  v34.x = v22;
  v34.y = v31;
  if (!CGRectContainsPoint(v35, v34))
  {
    -[GKSignInViewController scrollView](self, "scrollView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scrollRectToVisible:animated:", 1, v22, v31, v26, v28);

  }
}

- (void)keyboardWillHide:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[GKSignInViewController scrollView](self, "scrollView", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInset:", v4, v5, v6, v7);

  self->_currentContentInsets.top = v4;
  self->_currentContentInsets.left = v5;
  self->_currentContentInsets.bottom = v6;
  self->_currentContentInsets.right = v7;
  -[GKSignInViewController scrollView](self, "scrollView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollIndicatorInsets:", v4, v5, v6, v7);

}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_storeStrong((id *)&self->_appleID, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (BOOL)disablesSignIn
{
  return self->_disablesSignIn;
}

- (void)setDisablesSignIn:(BOOL)a3
{
  self->_disablesSignIn = a3;
}

- (UIViewController)remoteUIPresentingViewController
{
  return self->_remoteUIPresentingViewController;
}

- (void)setRemoteUIPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIPresentingViewController, a3);
}

- (BOOL)isLoadingRemoteUI
{
  return self->_loadingRemoteUI;
}

- (void)setLoadingRemoteUI:(BOOL)a3
{
  self->_loadingRemoteUI = a3;
}

- (GKSignInView)signInView
{
  return self->_signInView;
}

- (void)setSignInView:(id)a3
{
  objc_storeStrong((id *)&self->_signInView, a3);
}

- (UIActivityIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (UILabel)signInLabel
{
  return self->_signInLabel;
}

- (void)setSignInLabel:(id)a3
{
  objc_storeStrong((id *)&self->_signInLabel, a3);
}

- (UILabel)loginPromptLabel
{
  return self->_loginPromptLabel;
}

- (void)setLoginPromptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_loginPromptLabel, a3);
}

- (GKSignInInputView)signInInputView
{
  return self->_signInInputView;
}

- (void)setSignInInputView:(id)a3
{
  objc_storeStrong((id *)&self->_signInInputView, a3);
}

- (BOOL)constraintsCreated
{
  return self->_constraintsCreated;
}

- (void)setConstraintsCreated:(BOOL)a3
{
  self->_constraintsCreated = a3;
}

- (UIEdgeInsets)currentContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_currentContentInsets.top;
  left = self->_currentContentInsets.left;
  bottom = self->_currentContentInsets.bottom;
  right = self->_currentContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCurrentContentInsets:(UIEdgeInsets)a3
{
  self->_currentContentInsets = a3;
}

- (UIEdgeInsets)contentInsetsBeforeKeyboard
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsetsBeforeKeyboard.top;
  left = self->_contentInsetsBeforeKeyboard.left;
  bottom = self->_contentInsetsBeforeKeyboard.bottom;
  right = self->_contentInsetsBeforeKeyboard.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_contentInsetsBeforeKeyboard = a3;
}

- (UIEdgeInsets)scrollIndicatorInsetsBeforeKeyboard
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_scrollIndicatorInsetsBeforeKeyboard.top;
  left = self->_scrollIndicatorInsetsBeforeKeyboard.left;
  bottom = self->_scrollIndicatorInsetsBeforeKeyboard.bottom;
  right = self->_scrollIndicatorInsetsBeforeKeyboard.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setScrollIndicatorInsetsBeforeKeyboard:(UIEdgeInsets)a3
{
  self->_scrollIndicatorInsetsBeforeKeyboard = a3;
}

- (UIImageView)bubbleImageView
{
  return self->_bubbleImageView;
}

- (void)setBubbleImageView:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleImageView, a3);
}

- (AKInlineSignInViewController)inlineSignInViewController
{
  return self->_inlineSignInViewController;
}

- (void)setInlineSignInViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inlineSignInViewController, a3);
}

- (AKAppleIDAuthenticationInAppContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (double)fullWidthContentWidthConstraintConstant
{
  return self->_fullWidthContentWidthConstraintConstant;
}

- (void)setFullWidthContentWidthConstraintConstant:(double)a3
{
  self->_fullWidthContentWidthConstraintConstant = a3;
}

- (double)horizontalPaddingConstraintConstant
{
  return self->_horizontalPaddingConstraintConstant;
}

- (void)setHorizontalPaddingConstraintConstant:(double)a3
{
  self->_horizontalPaddingConstraintConstant = a3;
}

- (double)labelWidthConstraintConstant
{
  return self->_labelWidthConstraintConstant;
}

- (void)setLabelWidthConstraintConstant:(double)a3
{
  self->_labelWidthConstraintConstant = a3;
}

- (NSMutableArray)fullWidthViewConstraints
{
  return self->_fullWidthViewConstraints;
}

- (void)setFullWidthViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_fullWidthViewConstraints, a3);
}

- (RemoteUIController)remoteU13Controller
{
  return self->_remoteU13Controller;
}

- (void)setRemoteU13Controller:(id)a3
{
  objc_storeStrong((id *)&self->_remoteU13Controller, a3);
}

- (UINavigationController)u13NavigationController
{
  return self->_u13NavigationController;
}

- (void)setU13NavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_u13NavigationController, a3);
}

- (NSMutableArray)u13ObjectModels
{
  return self->_u13ObjectModels;
}

- (void)setU13ObjectModels:(id)a3
{
  objc_storeStrong((id *)&self->_u13ObjectModels, a3);
}

- (GKDispatchGroup)u13Group
{
  return self->_u13Group;
}

- (void)setU13Group:(id)a3
{
  objc_storeStrong((id *)&self->_u13Group, a3);
}

- (BOOL)userShouldSkipCreateAppleID
{
  return self->_userShouldSkipCreateAppleID;
}

- (void)setUserShouldSkipCreateAppleID:(BOOL)a3
{
  self->_userShouldSkipCreateAppleID = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (GKAccountRemoteUIController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
  objc_storeStrong((id *)&self->_accountController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_u13Group, 0);
  objc_storeStrong((id *)&self->_u13ObjectModels, 0);
  objc_storeStrong((id *)&self->_u13NavigationController, 0);
  objc_storeStrong((id *)&self->_remoteU13Controller, 0);
  objc_storeStrong((id *)&self->_fullWidthViewConstraints, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_inlineSignInViewController, 0);
  objc_storeStrong((id *)&self->_bubbleImageView, 0);
  objc_storeStrong((id *)&self->_signInInputView, 0);
  objc_storeStrong((id *)&self->_loginPromptLabel, 0);
  objc_storeStrong((id *)&self->_signInLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_signInView, 0);
  objc_storeStrong((id *)&self->_remoteUIPresentingViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
}

- (void)signInController:(void *)a1 didCompleteWithOperationsResults:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AB361000, v3, OS_LOG_TYPE_ERROR, "signInController:didCompleteWithOperationsResults returned error: %@", (uint8_t *)&v5, 0xCu);

}

- (void)remoteUIControllerDidDismiss:.cold.1()
{
  __assert_rtn("-[GKSignInViewController remoteUIControllerDidDismiss:]", "GKSignInViewController.m", 540, "0");
}

- (void)remoteUIControllerDidDismiss:.cold.2()
{
  __assert_rtn("-[GKSignInViewController remoteUIControllerDidDismiss:]", "GKSignInViewController.m", 545, "0");
}

@end
