@implementation SKAccountPageViewController

+ (void)isCommerceUIURL:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CFDC68];
  v7 = a3;
  v8 = [v6 alloc];
  +[SKAccountPageBagProvider sharedBag](SKAccountPageBagProvider, "sharedBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithBag:", v9);

  objc_msgSend(v10, "isCommerceUIURL:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__SKAccountPageViewController_isCommerceUIURL_completion___block_invoke;
  v13[3] = &unk_1E5B26948;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "addFinishBlock:", v13);

}

void __58__SKAccountPageViewController_isCommerceUIURL_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = v5;
  v8 = v5;
  if (v5)
  {
    NSLog(CFSTR("Error parsing the URL through bag regexes: %@"), v5);
    v6 = v8;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    v6 = v8;
  }

}

- (SKAccountPageViewController)initWithAccountURL:(id)a3
{
  return -[SKAccountPageViewController initWithAccountURL:forceLegacy:](self, "initWithAccountURL:forceLegacy:", a3, 0);
}

- (SKAccountPageViewController)initWithAccountURL:(id)a3 forceLegacy:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  id v7;
  SKAccountPageViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  AMSMutableBinaryPromise *v12;
  AMSMutableBinaryPromise *connectionSetupPromise;
  void *v14;
  objc_super v16;

  v5 = a4;
  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SKAccountPageViewController;
  v8 = -[SKAccountPageViewController init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "processName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_referrer, v11);
    if (!v10)
    {

    }
    v12 = (AMSMutableBinaryPromise *)objc_alloc_init(MEMORY[0x1E0CFDBA8]);
    connectionSetupPromise = v8->_connectionSetupPromise;
    v8->_connectionSetupPromise = v12;

    -[SKAccountPageViewController _overrideScheme:](v8, "_overrideScheme:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAccountPageViewController _beginURLParsing:forceLegacy:](v8, "_beginURLParsing:forceLegacy:", v14, v5);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (id)-[_UIAsyncInvocation invoke](self->_cancelRequest, "invoke");
  -[SKRemoteAccountPageViewController setAccountPageViewController:](self->_remoteViewController, "setAccountPageViewController:", 0);
  v5 = -[SKRemoteAccountPageViewController disconnect](self->_remoteViewController, "disconnect");
  -[SKUIServiceAccountPageViewController setInvocationTarget:](self->_serviceProxy, "setInvocationTarget:", 0);
  v6.receiver = self;
  v6.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController dealloc](&v6, sel_dealloc);
}

- (void)loadWithCompletionBlock:(id)a3
{
  void *v4;
  id loadBlock;
  dispatch_time_t v6;
  _QWORD block[5];

  if (self->_loadBlock)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Double load"));
  }
  else
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    loadBlock = self->_loadBlock;
    self->_loadBlock = v4;

  }
  self->_isLoading = 1;
  -[SKAccountPageViewController beginAppearanceTransition:animated:](self, "beginAppearanceTransition:animated:", 1, 0);
  v6 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SKAccountPageViewController_loadWithCompletionBlock___block_invoke;
  block[3] = &unk_1E5B267D8;
  block[4] = self;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);
}

uint64_t __55__SKAccountPageViewController_loadWithCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishLoading");
}

- (void)prepareWithCompletionBlock:(id)a3
{
  void *v4;
  id prepareBlock;

  if (self->_prepareBlock)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Double prepare"));
  }
  else
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    prepareBlock = self->_prepareBlock;
    self->_prepareBlock = v4;

  }
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SKAccountPageViewController setView:](self, "setView:", v4);
  -[SKAccountPageViewController _addRemoteView](self, "_addRemoteView");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SKAccountPageViewController _setupNavigationItem](self, "_setupNavigationItem");
}

- (void)viewDidLayoutSubviews
{
  SKUIServiceAccountPageViewController *serviceProxy;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  serviceProxy = self->_serviceProxy;
  -[SKAccountPageViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SKUIServiceAccountPageViewController setPresentationBounds:](serviceProxy, "setPresentationBounds:");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (!self->_viewHasAppeared)
  {
    if (self->_remoteViewController)
      -[SKAccountPageViewController _handleLegacyViewWillAppear](self, "_handleLegacyViewWillAppear");
    self->_viewHasAppeared = 1;
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  _QWORD v5[5];
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, v4);
  if (!self->_isRemoteViewControllerReady)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__SKAccountPageViewController_willMoveToParentViewController___block_invoke;
    v5[3] = &unk_1E5B268B8;
    v5[4] = self;
    objc_msgSend(v4, "_beginDelayingPresentation:cancellationHandler:", v5, 10.0);
  }

}

uint64_t __62__SKAccountPageViewController_willMoveToParentViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didPrepareWithResult:error:", 0, 0);
  return 0;
}

- (void)didMoveToParentViewController:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  if (!a3)
  {
    -[SKAccountPageViewController presentingAccountPageViewController](self, "presentingAccountPageViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else if (!self->_financeInterruptionCalled)
    {
      -[SKAccountPageViewController _financeInterruptionResolved:](self, "_financeInterruptionResolved:", 0);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKAccountPageViewController;
  -[SKAccountPageViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[SKAccountPageViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SKAccountPageViewController _setupPreWarmedViewController](self, "_setupPreWarmedViewController");
}

- (void)_handleLegacyViewWillAppear
{
  SKUIServiceAccountPageViewController *serviceProxy;
  NSURL *v4;

  -[SKAccountPageViewController _setupRemoteViewController:](self, "_setupRemoteViewController:", 0);
  if (!self->_cameraDidShow)
  {
    serviceProxy = self->_serviceProxy;
    v4 = self->_accountURL;
    -[SKUIServiceAccountPageViewController setShowAccountGlyph:](serviceProxy, "setShowAccountGlyph:", -[SKAccountPageViewController showAccountGlyph](self, "showAccountGlyph"));
    -[SKUIServiceAccountPageViewController loadWithURL:](self->_serviceProxy, "loadWithURL:", v4);

  }
  self->_cameraDidShow = 0;
}

- (void)_setupNotificationCenter
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sk_applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__sk_applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardDidChangeNotification_, *MEMORY[0x1E0DC4E60], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillChangeNotification_, *MEMORY[0x1E0DC4FD8], 0);

}

- (void)_sk_applicationWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;

  if (-[SKAccountPageViewController isViewLoaded](self, "isViewLoaded", a3))
  {
    -[SKAccountPageViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[SKUIServiceAccountPageViewController applicationWillEnterForeground](self->_serviceProxy, "applicationWillEnterForeground");
  }
}

- (void)_sk_applicationDidEnterBackground:(id)a3
{
  -[SKUIServiceAccountPageViewController applicationDidEnterBackground](self->_serviceProxy, "applicationDidEnterBackground", a3);
}

- (void)_keyboardDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", *MEMORY[0x1E0DC4E40]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (int)objc_msgSend(v16, "intValue");

  objc_msgSend(v4, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "valueForKey:", *MEMORY[0x1E0DC4E48]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  -[SKAccountPageViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "keyWindow");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertRect:fromView:", v24, v8, v10, v12, v14);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[SKUIServiceAccountPageViewController keyboardDidChangeFrame:animationCurve:duration:](self->_serviceProxy, "keyboardDidChangeFrame:animationCurve:duration:", v17, v26, v28, v30, v32, v21);
}

- (void)_keyboardWillChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", *MEMORY[0x1E0DC4E40]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (int)objc_msgSend(v16, "intValue");

  objc_msgSend(v4, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "valueForKey:", *MEMORY[0x1E0DC4E48]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  -[SKAccountPageViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "keyWindow");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertRect:fromView:", v24, v8, v10, v12, v14);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[SKUIServiceAccountPageViewController keyboardWillChangeFrame:animationCurve:duration:](self->_serviceProxy, "keyboardWillChangeFrame:animationCurve:duration:", v17, v26, v28, v30, v32, v21);
}

- (void)_didPrepareWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void (**prepareBlock)(id, _BOOL8, _QWORD);
  id v8;
  id v9;

  v4 = a3;
  v6 = a4;
  v9 = v6;
  if (v4)
  {
    -[SKAccountPageViewController _addRemoteView](self, "_addRemoteView", v6);
    v6 = v9;
    if (self->_viewHasAppeared)
    {
      -[SKAccountPageViewController _handleLegacyViewWillAppear](self, "_handleLegacyViewWillAppear", v9);
      v6 = v9;
    }
  }
  prepareBlock = (void (**)(id, _BOOL8, _QWORD))self->_prepareBlock;
  if (prepareBlock)
  {
    ((void (**)(id, _BOOL8, id))prepareBlock)[2](prepareBlock, v4, v9);
    v8 = self->_prepareBlock;
    self->_prepareBlock = 0;

    v6 = v9;
  }

}

- (void)_didFinishLoading
{
  void (**loadBlock)(id, SEL);
  id v4;

  loadBlock = (void (**)(id, SEL))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, a2);
    v4 = self->_loadBlock;
    self->_loadBlock = 0;

    self->_isLoading = 0;
    -[SKAccountPageViewController _addRemoteView](self, "_addRemoteView");
    -[SKAccountPageViewController endAppearanceTransition](self, "endAppearanceTransition");
  }
}

- (void)_dismissViewControllerWithResult:(BOOL)a3 error:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;

  if (self->_prepareBlock)
  {
    -[SKAccountPageViewController _didPrepareWithResult:error:](self, "_didPrepareWithResult:error:", 0, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "accountPageViewControllerDidFinish:", self);

    }
    else if (-[SKAccountPageViewController _isBridgedNavigationViewController](self, "_isBridgedNavigationViewController"))
    {
      -[SKAccountPageViewController _popAllBridgedNavigationViewControllers](self, "_popAllBridgedNavigationViewControllers");
    }
    else
    {
      -[SKAccountPageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }
}

- (void)_financeInterruptionResolved:(BOOL)a3
{
  _BOOL8 v3;
  SKAccountPageViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v7;
  void *v8;
  id v9;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SKAccountPageViewController presentingAccountPageViewController](self, "presentingAccountPageViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SKAccountPageViewController presentingAccountPageViewController](self, "presentingAccountPageViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_financeInterruptionResolved:", v3);
    }
    else
    {
      self->_financeInterruptionCalled = 1;
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "accountPageViewController:financeInterruptionResolved:", self, v3);
    }

  }
}

- (void)_overrideCreditCardPresentationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__SKAccountPageViewController__overrideCreditCardPresentationWithCompletion___block_invoke;
  v6[3] = &unk_1E5B26970;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __77__SKAccountPageViewController__overrideCreditCardPresentationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getSUCreditCardReaderViewControllerClass_softClass;
  v10 = getSUCreditCardReaderViewControllerClass_softClass;
  if (!getSUCreditCardReaderViewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getSUCreditCardReaderViewControllerClass_block_invoke;
    v6[3] = &unk_1E5B26828;
    v6[4] = &v7;
    __getSUCreditCardReaderViewControllerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  v4 = objc_alloc_init(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  objc_msgSend(v4, "setCompletionBlock:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setModalPresentationStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1026) = 1;

}

- (void)_overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke;
  block[3] = &unk_1E5B269C0;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (*(_QWORD *)(a1 + 48) == 1
    && (v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1000)), v2, !v2))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v4 = (void *)getSURedeemCameraViewControllerClass_softClass;
    v16 = getSURedeemCameraViewControllerClass_softClass;
    v5 = MEMORY[0x1E0C809B0];
    if (!getSURedeemCameraViewControllerClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getSURedeemCameraViewControllerClass_block_invoke;
      location[3] = &unk_1E5B26828;
      location[4] = &v13;
      __getSURedeemCameraViewControllerClass_block_invoke((uint64_t)location);
      v4 = (void *)v14[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v13, 8);
    v7 = objc_alloc_init(v6);
    objc_initWeak(location, *(id *)(a1 + 32));
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke_2;
    v10[3] = &unk_1E5B26998;
    objc_copyWeak(&v11, location);
    objc_msgSend(v7, "setCodeHandler:", v10);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
    objc_msgSend(v8, "setModalPresentationStyle:", 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1000), v7);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1026) = 1;

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1000));

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1000));
      objc_msgSend(v9, "performAction:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

    }
  }
}

void __77__SKAccountPageViewController__overrideRedeemCameraPerformAction_withObject___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[127], "redeemCameraCodeDetected:", v5);

}

- (void)_overrideRedeemCameraWithCompletion:(id)a3
{
  void *v4;
  id redeemCompletionHandler;
  _QWORD block[5];

  v4 = (void *)objc_msgSend(a3, "copy");
  redeemCompletionHandler = self->redeemCompletionHandler;
  self->redeemCompletionHandler = v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SKAccountPageViewController__overrideRedeemCameraWithCompletion___block_invoke;
  block[3] = &unk_1E5B267D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __67__SKAccountPageViewController__overrideRedeemCameraWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v3 = (void *)getSKUIClientContextClass_softClass;
  v20 = getSKUIClientContextClass_softClass;
  if (!getSKUIClientContextClass_softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getSKUIClientContextClass_block_invoke;
    v15 = &unk_1E5B26828;
    v16 = &v17;
    __getSKUIClientContextClass_block_invoke((uint64_t)&v12);
    v3 = (void *)v18[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v4, "defaultContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v6 = (void *)getSKUIRedeemConfigurationClass_softClass;
  v20 = getSKUIRedeemConfigurationClass_softClass;
  if (!getSKUIRedeemConfigurationClass_softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getSKUIRedeemConfigurationClass_block_invoke;
    v15 = &unk_1E5B26828;
    v16 = &v17;
    __getSKUIRedeemConfigurationClass_block_invoke((uint64_t)&v12);
    v6 = (void *)v18[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v17, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initWithOperationQueue:category:clientContext:", v2, 0, v5);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v9 = (void *)getSKUIRedeemViewControllerClass_softClass;
  v20 = getSKUIRedeemViewControllerClass_softClass;
  if (!getSKUIRedeemViewControllerClass_softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __getSKUIRedeemViewControllerClass_block_invoke;
    v15 = &unk_1E5B26828;
    v16 = &v17;
    __getSKUIRedeemViewControllerClass_block_invoke((uint64_t)&v12);
    v9 = (void *)v18[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v17, 8);
  v11 = (void *)objc_msgSend([v10 alloc], "initWithRedeemCategory:", 0);
  objc_msgSend(v11, "setModalPresentationStyle:", 0);
  objc_msgSend(v11, "setClientContext:", v5);
  objc_msgSend(v11, "setOperationQueue:", v2);
  objc_msgSend(v11, "setCameraRedeemVisible:", 1);
  objc_msgSend(v11, "setCameraDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "setRedeemConfiguration:", v8);
  objc_msgSend(v11, "setShouldPerformInitialOperationOnAppear:", 0);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1026) = 1;

}

- (void)_setBridgedNavigationItemWithOptions:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ServiceNavigationItemOptionBackButtonTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v25;
  if ((isKindOfClass & 1) != 0)
  {
    -[SKAccountPageViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "setTitle:", v4);
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
      objc_msgSend(v9, "setTitle:", v4);
      -[SKAccountPageViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBackBarButtonItem:", v9);

    }
    v6 = v25;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ServiceNavigationItemOptionBackButtonHidden"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_msgSend(v11, "BOOLValue");
    -[SKAccountPageViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidesBackButton:animated:", v12, 1);

  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ServiceNavigationItemOptionRightButtonTitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ServiceNavigationItemOptionRightButtonStyle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ServiceNavigationItemOptionRightButtonEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v15, "integerValue");
      -[SKAccountPageViewController navigationItem](self, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rightBarButtonItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v20, "setTitle:", v14);
        objc_msgSend(v20, "setStyle:", v18);
        objc_msgSend(v20, "setEnabled:", v17);
      }
      else
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v14, v18, self, sel__bridgedRightButtonPressed_);
        objc_msgSend(v21, "setEnabled:", v17);
        -[SKAccountPageViewController navigationItem](self, "navigationItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setRightBarButtonItem:", v21);

      }
    }
  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ServiceNavigationItemOptionTitle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SKAccountPageViewController navigationItem](self, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:", v23);

  }
}

- (void)_pushBridgedViewControllerAnimated:(BOOL)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  SKAccountPageViewController *v9;
  SKAccountPageViewController *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;
  id location;

  v6 = a4;
  -[SKAccountPageViewController preWarmedViewController](self, "preWarmedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[SKAccountPageViewController initWithAccountURL:forceLegacy:]([SKAccountPageViewController alloc], "initWithAccountURL:forceLegacy:", 0, 1);
  v10 = v9;

  objc_initWeak(&location, v10);
  -[SKAccountPageViewController connectionSetupPromise](v10, "connectionSetupPromise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SKAccountPageViewController__pushBridgedViewControllerAnimated_options___block_invoke;
  v13[3] = &unk_1E5B269E8;
  objc_copyWeak(&v15, &location);
  v13[4] = self;
  v12 = v6;
  v14 = v12;
  v16 = a3;
  objc_msgSend(v11, "addFinishBlock:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __74__SKAccountPageViewController__pushBridgedViewControllerAnimated_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAccount:", v2);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setDelegate:", v3);

  objc_msgSend(WeakRetained, "setPresentingAccountPageViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setType:", 1);
  objc_msgSend(WeakRetained, "_setupRemoteViewController:", 1);
  objc_msgSend(WeakRetained, "_setBridgedNavigationItemWithOptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", WeakRetained, *(unsigned __int8 *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "setPreWarmedViewController:", 0);
}

- (void)_popBridgedViewControllersToIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  if (a3 == -1)
  {
    -[SKAccountPageViewController _popAllBridgedNavigationViewControllers](self, "_popAllBridgedNavigationViewControllers");
  }
  else
  {
    v4 = -[SKAccountPageViewController _indexForFirstBridgedNavigationViewController](self, "_indexForFirstBridgedNavigationViewController")+ a3;
    -[SKAccountPageViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 > v4)
    {
      -[SKAccountPageViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v4);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      -[SKAccountPageViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "popToViewController:animated:", v12, 1);

    }
  }
}

- (void)_presentBridgedViewController
{
  void *v3;
  void *v4;
  SKAccountPageViewController *v5;
  SKAccountPageViewController *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  -[SKAccountPageViewController preWarmedViewController](self, "preWarmedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = -[SKAccountPageViewController initWithAccountURL:forceLegacy:]([SKAccountPageViewController alloc], "initWithAccountURL:forceLegacy:", 0, 1);
  v6 = v5;

  objc_initWeak(&location, v6);
  -[SKAccountPageViewController connectionSetupPromise](v6, "connectionSetupPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SKAccountPageViewController__presentBridgedViewController__block_invoke;
  v8[3] = &unk_1E5B26A10;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v7, "addFinishBlock:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __60__SKAccountPageViewController__presentBridgedViewController__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setAccount:", v2);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setDelegate:", v3);

  objc_msgSend(WeakRetained, "setPresentingAccountPageViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setType:", 2);
  objc_msgSend(WeakRetained, "_setupRemoteViewController:", 1);
  objc_msgSend(WeakRetained, "setModalPresentationStyle:", 5);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOpaque:", 0);

  objc_msgSend(*(id *)(a1 + 32), "presentModalViewController:withTransition:", WeakRetained, 0);
  objc_msgSend(*(id *)(a1 + 32), "setPreWarmedViewController:", 0);

}

- (void)_dismissBridgedViewController
{
  -[SKAccountPageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)_bridgedRightButtonPressed:(id)a3
{
  -[SKUIServiceAccountPageViewController bridgedRightButtonPressed](self->_serviceProxy, "bridgedRightButtonPressed", a3);
}

- (void)redeemCameraViewController:(id)a3 didFinishWithRedeem:(id)a4
{
  void (**redeemCompletionHandler)(id, id, _QWORD);
  id v7;
  id v8;

  v8 = a3;
  redeemCompletionHandler = (void (**)(id, id, _QWORD))self->redeemCompletionHandler;
  if (redeemCompletionHandler)
  {
    redeemCompletionHandler[2](redeemCompletionHandler, a4, 0);
    v7 = self->redeemCompletionHandler;
    self->redeemCompletionHandler = 0;

  }
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)overrideRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v5 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0DAF538];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "sharedConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (!v13)
    goto LABEL_9;
  LODWORD(v18) = 138543362;
  *(_QWORD *)((char *)&v18 + 4) = objc_opt_class();
  v15 = *(id *)((char *)&v18 + 4);
  LODWORD(v17) = 12;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v18, v17, v18);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
LABEL_9:

  }
  -[SKUIServiceAccountPageViewController performRedeemOperationWithCode:cameraRecognized:completion:](self->_serviceProxy, "performRedeemOperationWithCode:cameraRecognized:completion:", v10, v5, v9);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)_beginURLParsing:(id)a3 forceLegacy:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  SKAccountPageViewController *v11;
  BOOL v12;

  v6 = a3;
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke;
  block[3] = &unk_1E5B26A88;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v26[0] = CFSTR("paymentsShipping");
  v26[1] = CFSTR("manageSubscriptions");
  v27[0] = CFSTR("paymentsAndShippingUrl");
  v27[1] = CFSTR("manageSubscriptionsUrl");
  v26[2] = CFSTR("editBilling");
  v27[2] = CFSTR("editBillingUrl");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v2, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Generic config URL detected for %@, pulling underlying URL from bag key %@"), v6, v5);

    v7 = *(void **)(a1 + 40);
    v8 = v5;
LABEL_3:
    objc_msgSend(v7, "_URLForBagKey:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v10 = (void *)v9;

    v2 = v10;
    goto LABEL_5;
  }
  objc_msgSend(v2, "pathComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("account"));

  if ((v14 & 1) != 0 || !v2)
  {
    NSLog(CFSTR("Account URL config detected, pulling underlying URL from bag"));
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ams_activeiTunesAccount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 40);
    if (v23)
      v8 = CFSTR("modifyAccount");
    else
      v8 = CFSTR("signup");
    goto LABEL_3;
  }
  objc_msgSend(v2, "pathComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", CFSTR("redeem"));

  if (v17)
  {
    NSLog(CFSTR("Redeem URL config detected, pulling underlying URL from bag"));
    objc_msgSend(*(id *)(a1 + 40), "_redeemURLFromRedeemConfigURL:", v2);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
LABEL_5:
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", &unk_1E5B4A1E8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0CFDC68]);
    +[SKAccountPageBagProvider sharedBag](SKAccountPageBagProvider, "sharedBag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithBag:", v19);

    objc_msgSend(v20, "typeForURL:", v2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_97;
  v24[3] = &unk_1E5B26A60;
  v24[4] = *(_QWORD *)(a1 + 40);
  v25 = v2;
  v21 = v2;
  objc_msgSend(v11, "addFinishBlock:", v24);

}

void __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_2;
  v10[3] = &unk_1E5B26A38;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __60__SKAccountPageViewController__beginURLParsing_forceLegacy___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 968), *(id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    NSLog(CFSTR("Could determine link type, falling back to legacy: %@"), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_setupLegacyContainer");
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 56), "integerValue");
    switch(v2)
    {
      case 2:
        NSLog(CFSTR("Dynamic UI view controllers not yet supported."));
        break;
      case 1:
        objc_msgSend(*(id *)(a1 + 32), "_setupLegacyContainer");
        break;
      case 0:
        objc_msgSend(*(id *)(a1 + 32), "_setupWebViewController");
        break;
    }
    objc_msgSend(*(id *)(a1 + 32), "connectionSetupPromise");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithSuccess:error:", *(_QWORD *)(a1 + 48) == 0);

  }
}

- (id)_URLForBagKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0DAF660];
  v4 = a3;
  objc_msgSend(v3, "contextWithBagType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF658]), "initWithURLBagContext:", v5);
  objc_msgSend(v6, "valueForKey:error:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_redeemURLFromRedeemConfigURL:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SKAccountPageViewController *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v7, "queryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v24 = self;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("code"));

          if (v16)
          {
            objc_msgSend(v14, "value");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
      v8 = 0;
LABEL_13:
      self = v24;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_msgSend(v4, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[SKAccountPageViewController _URLForBagKey:](self, "_URLForBagKey:", CFSTR("redeemCodeLanding"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("code"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "queryItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayByAddingObject:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setQueryItems:", v21);

    objc_msgSend(v18, "URL");
    v22 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v22;
  }

  return v17;
}

- (void)_setupWebViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  AMSUIWebViewController *v7;
  AMSUIWebViewController *webViewController;
  void *v9;
  id v10;

  objc_msgSend(getAMSUIWebViewControllerClass(), "createBagForSubProfile");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SKAccountPageViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_activeiTunesAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7 = (AMSUIWebViewController *)objc_msgSend(objc_alloc((Class)getAMSUIWebViewControllerClass()), "initWithBag:account:clientInfo:", v10, v5, 0);
  webViewController = self->_webViewController;
  self->_webViewController = v7;

  -[AMSUIWebViewController loadURL:](self->_webViewController, "loadURL:", self->_accountURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", &__block_literal_global_1);
  -[SKAccountPageViewController _addRemoteView](self, "_addRemoteView");

}

void __54__SKAccountPageViewController__setupWebViewController__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSLog(CFSTR("Embedded web container loaded, %@"), a3);
}

- (void)_setupLegacyContainer
{
  SKInvocationQueueProxy *v3;
  SKUIServiceAccountPageViewController *serviceProxy;

  v3 = -[SKInvocationQueueProxy initWithProtocol:]([SKInvocationQueueProxy alloc], "initWithProtocol:", &unk_1EECAA7C8);
  serviceProxy = self->_serviceProxy;
  self->_serviceProxy = (SKUIServiceAccountPageViewController *)v3;

  -[SKAccountPageViewController _requestRemoteViewController](self, "_requestRemoteViewController");
  -[SKAccountPageViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  -[SKAccountPageViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[SKAccountPageViewController _setupNotificationCenter](self, "_setupNotificationCenter");
  -[SKAccountPageViewController _addRemoteView](self, "_addRemoteView");
}

- (void)_setupNavigationItem
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v4, "configureWithDefaultBackground");
  -[SKAccountPageViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEdgeAppearance:", v4);

}

- (id)_overrideScheme:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("http")))
    {

    }
    else
    {
      objc_msgSend(v3, "scheme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("https"));

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v3, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setScheme:", CFSTR("https"));
        objc_msgSend(v11, "URL");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
    }
  }
  v9 = v3;
LABEL_6:

  return v9;
}

- (void)_popAllBridgedNavigationViewControllers
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = -[SKAccountPageViewController _indexForFirstBridgedNavigationViewController](self, "_indexForFirstBridgedNavigationViewController")- 1;
  -[SKAccountPageViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > v3)
  {
    -[SKAccountPageViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[SKAccountPageViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "popToViewController:animated:", v11, 1);

  }
}

- (unint64_t)_indexForFirstBridgedNavigationViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SKAccountPageViewController navigationController](self, "navigationController", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SKAccountPageViewController navigationController](self, "navigationController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "viewControllers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v12, "indexOfObject:", v9);

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v10;
}

- (BOOL)_isBridgedNavigationViewController
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SKAccountPageViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "count") > 1 || -[SKAccountPageViewController type](self, "type") == 1;

  return v5;
}

- (void)_addRemoteView
{
  SKRemoteAccountPageViewController *v3;
  SKRemoteAccountPageViewController *v4;
  void *v5;
  AMSUIWebViewController *v6;
  AMSUIWebViewController *v7;
  int v8;
  void *v9;
  void *v10;
  SKRemoteAccountPageViewController *v11;
  SKRemoteAccountPageViewController *v12;

  if (!self->_isLoading)
  {
    v3 = self->_remoteViewController;
    v4 = v3;
    if (self->_webViewController)
    {
      v11 = v3;
      -[SKAccountPageViewController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        v6 = self->_webViewController;
      else
        v6 = (AMSUIWebViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_webViewController);
      v7 = v6;

      -[SKAccountPageViewController addChildViewController:](self, "addChildViewController:", v7);
      v4 = (SKRemoteAccountPageViewController *)v7;
    }
    if (v4)
    {
      v12 = v4;
      v8 = -[SKAccountPageViewController isViewLoaded](self, "isViewLoaded");
      v4 = v12;
      if (v8)
      {
        -[SKAccountPageViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKRemoteAccountPageViewController view](v12, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bounds");
        objc_msgSend(v10, "setFrame:");
        objc_msgSend(v10, "setAutoresizingMask:", 18);
        objc_msgSend(v9, "addSubview:", v10);

        v4 = v12;
      }
    }

  }
}

- (void)_setupPreWarmedViewController
{
  void *v3;
  void *v4;
  SKAccountPageViewController *v5;

  -[SKAccountPageViewController preWarmedViewController](self, "preWarmedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v5 = -[SKAccountPageViewController initWithAccountURL:forceLegacy:]([SKAccountPageViewController alloc], "initWithAccountURL:forceLegacy:", 0, 1);
    -[SKAccountPageViewController account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKAccountPageViewController setAccount:](v5, "setAccount:", v4);

    -[SKAccountPageViewController setPreWarmedViewController:](self, "setPreWarmedViewController:", v5);
  }
}

- (void)_setupRemoteViewController:(BOOL)a3
{
  void *v5;

  if (!self->_isRemoteViewControllerSetup || a3)
  {
    if (self->_account)
      -[SKUIServiceAccountPageViewController setAccount:](self->_serviceProxy, "setAccount:");
    if (self->_referrer)
      -[SKUIServiceAccountPageViewController setReferrer:](self->_serviceProxy, "setReferrer:");
    if (-[SKAccountPageViewController _isBridgedNavigationViewController](self, "_isBridgedNavigationViewController")
      || self->_loadBlock)
    {
      -[SKUIServiceAccountPageViewController setType:](self->_serviceProxy, "setType:", 1);
      if (-[SKAccountPageViewController type](self, "type") == 1)
        -[SKUIServiceAccountPageViewController setLoadFromBridgedNavigation:](self->_serviceProxy, "setLoadFromBridgedNavigation:", 1);
    }
    else
    {
      if (-[SKAccountPageViewController type](self, "type") == 2)
      {
        -[SKUIServiceAccountPageViewController setType:](self->_serviceProxy, "setType:", 2);
        -[SKUIServiceAccountPageViewController setLoadFromBridgedNavigation:](self->_serviceProxy, "setLoadFromBridgedNavigation:", 0);
      }
      -[SKAccountPageViewController navigationController](self, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNavigationBarHidden:", 1);

    }
    self->_isRemoteViewControllerSetup = 1;
  }
}

- (void)_requestRemoteViewController
{
  uint64_t v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *cancelRequest;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SKAccountPageViewController__requestRemoteViewController__block_invoke;
  v7[3] = &unk_1E5B268B8;
  v7[4] = self;
  -[SKAccountPageViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v7, 10.0);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __59__SKAccountPageViewController__requestRemoteViewController__block_invoke_2;
  v6[3] = &unk_1E5B26AD0;
  v6[4] = self;
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteAccountPageViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceAccountPageViewController"), CFSTR("com.apple.ios.StoreKitUIService"), v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v4;

}

uint64_t __59__SKAccountPageViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didPrepareWithResult:error:", 0, 0);
  return 0;
}

void __59__SKAccountPageViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = a3;
  if (v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1008), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "setAccountPageViewController:");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 1016);
    objc_msgSend(*(id *)(v7 + 1008), "serviceViewControllerProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInvocationTarget:", v9);

    objc_msgSend(*(id *)(a1 + 32), "_setupRemoteViewController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
  }
  else
  {
    NSLog(CFSTR("Could not request view controller: %@"), v6);
    objc_msgSend(*(id *)(a1 + 32), "_didPrepareWithResult:error:", 0, v6);
  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 976);
  *(_QWORD *)(v10 + 976) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1024) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_endDelayingPresentation");
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_endDelayingPresentation");

}

- (SKAccountPageViewControllerDelegate)delegate
{
  return (SKAccountPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)referrer
{
  return self->_referrer;
}

- (void)setReferrer:(id)a3
{
  objc_storeStrong((id *)&self->_referrer, a3);
}

- (BOOL)showAccountGlyph
{
  return self->_showAccountGlyph;
}

- (void)setShowAccountGlyph:(BOOL)a3
{
  self->_showAccountGlyph = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (SKAccountPageViewController)preWarmedViewController
{
  return self->_preWarmedViewController;
}

- (void)setPreWarmedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_preWarmedViewController, a3);
}

- (SKAccountPageViewController)presentingAccountPageViewController
{
  return (SKAccountPageViewController *)objc_loadWeakRetained((id *)&self->_presentingAccountPageViewController);
}

- (void)setPresentingAccountPageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingAccountPageViewController, a3);
}

- (AMSUIWebViewController)webViewController
{
  return self->_webViewController;
}

- (void)setWebViewController:(id)a3
{
  objc_storeStrong((id *)&self->_webViewController, a3);
}

- (AMSMutableBinaryPromise)connectionSetupPromise
{
  return self->_connectionSetupPromise;
}

- (void)setConnectionSetupPromise:(id)a3
{
  objc_storeStrong((id *)&self->_connectionSetupPromise, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionSetupPromise, 0);
  objc_storeStrong((id *)&self->_webViewController, 0);
  objc_destroyWeak((id *)&self->_presentingAccountPageViewController);
  objc_storeStrong((id *)&self->_preWarmedViewController, 0);
  objc_storeStrong((id *)&self->_referrer, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->redeemCompletionHandler, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_presentedRedeemCameraViewController);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_storeStrong(&self->_prepareBlock, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_accountURL, 0);
}

@end
