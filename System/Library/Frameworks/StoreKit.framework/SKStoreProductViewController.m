@implementation SKStoreProductViewController

- (SKStoreProductViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SKStoreProductViewController *v4;
  int v5;
  SKProductRemoteViewTask *v6;
  SKProductRemoteViewTask *remoteViewTask;
  SKInvocationQueueProxy *v8;
  SKUIServiceProductPageViewController *serviceProxy;
  void *v10;
  uint64_t v11;
  NSString *bundleID;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SKStoreProductViewController;
  v4 = -[SKStoreProductViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = _os_feature_enabled_impl();
    v4->_productPageQFAEnabled = v5;
    if (v5)
    {
      v6 = -[SKProductRemoteViewTask initWithStoreController:]([SKProductRemoteViewTask alloc], "initWithStoreController:", v4);
      remoteViewTask = v4->_remoteViewTask;
      v4->_remoteViewTask = v6;

      v4->_viewWillAppearWasCalled = 0;
    }
    else
    {
      v8 = -[SKInvocationQueueProxy initWithProtocol:]([SKInvocationQueueProxy alloc], "initWithProtocol:", &unk_1EECAA888);
      serviceProxy = v4->_serviceProxy;
      v4->_serviceProxy = (SKUIServiceProductPageViewController *)v8;

      -[SKStoreProductViewController _requestRemoteViewController](v4, "_requestRemoteViewController");
      -[SKStoreProductViewController setTransitioningDelegate:](v4, "setTransitioningDelegate:", v4);
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleID = v4->_bundleID;
    v4->_bundleID = (NSString *)v11;

    -[SKStoreProductViewController setShowsStoreButton:](v4, "setShowsStoreButton:", 1);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (v14 == 1)
      -[SKStoreProductViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
    v4->_viewWasOnScreen = 0;
  }
  return v4;
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
  -[SKRemoteProductViewController setProductViewController:](self->_remoteViewController, "setProductViewController:", 0);
  v5 = -[_UIRemoteViewController disconnect](self->_remoteViewController, "disconnect");
  -[SKUIServiceProductPageViewController setInvocationTarget:](self->_serviceProxy, "setInvocationTarget:", 0);
  v6.receiver = self;
  v6.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController dealloc](&v6, sel_dealloc);
}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (int64_t)modalTransitionStyle
{
  return 12;
}

- (void)loadProductWithParameters:(NSDictionary *)parameters completionBlock:(void *)block
{
  NSDictionary *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SKProductRemoteViewTask *remoteViewTask;
  void *v14;
  id loadBlock;
  _QWORD v16[4];
  id v17;

  v6 = parameters;
  v7 = block;
  -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("adNetworkNonce"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)-[NSDictionary mutableCopy](v6, "mutableCopy");
      objc_msgSend(v8, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lowercaseString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("adNetworkNonce"));

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v9);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (NSDictionary *)v12;
    }
  }
  if (self->_productPageQFAEnabled)
  {
    remoteViewTask = self->_remoteViewTask;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke;
    v16[3] = &unk_1E5B26948;
    v17 = v7;
    -[SKProductRemoteViewTask lookupProductWithParameters:completion:](remoteViewTask, "lookupProductWithParameters:completion:", v6, v16);

  }
  else
  {
    if (self->_loadBlock != v7)
    {
      v14 = (void *)objc_msgSend(v7, "copy");
      loadBlock = self->_loadBlock;
      self->_loadBlock = v14;

    }
    -[SKUIServiceProductPageViewController loadProductWithParameters:](self->_serviceProxy, "loadProductWithParameters:", v6);
  }

}

void __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v4)
    {
      _SKErrorFromNSError(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_2;
      block[3] = &unk_1E5B26970;
      v7 = *(id *)(a1 + 32);
      v12 = v6;
      v13 = v7;
      v8 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_3;
      v9[3] = &unk_1E5B26758;
      v10 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], v9);
      v8 = v10;
    }

  }
}

uint64_t __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __74__SKStoreProductViewController_loadProductWithParameters_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadProductWithParameters:(NSDictionary *)parameters impression:(SKAdImpression *)impression completionBlock:(void *)block
{
  NSDictionary *v8;
  SKAdImpression *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  SKProductRemoteViewTask *remoteViewTask;
  void *v16;
  id loadBlock;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = parameters;
  v9 = impression;
  v10 = block;
  -[SKAdImpression adImpressionIdentifier](v9, "adImpressionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v26 = (id)-[NSDictionary mutableCopy](v8, "mutableCopy");
    -[SKStoreProductViewController _impressionDictFromImpression:](self, "_impressionDictFromImpression:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke;
    v20[3] = &unk_1E5B274C0;
    v20[4] = &v21;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v20);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v22[5]);
    v14 = objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v21, 8);
    v8 = (NSDictionary *)v14;
  }
  if (self->_productPageQFAEnabled)
  {
    remoteViewTask = self->_remoteViewTask;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_2;
    v18[3] = &unk_1E5B26948;
    v19 = v10;
    -[SKProductRemoteViewTask lookupProductWithParameters:completion:](remoteViewTask, "lookupProductWithParameters:completion:", v8, v18);

  }
  else
  {
    if (self->_loadBlock != v10)
    {
      v16 = (void *)objc_msgSend(v10, "copy");
      loadBlock = self->_loadBlock;
      self->_loadBlock = v16;

    }
    -[SKUIServiceProductPageViewController loadProductWithParameters:](self->_serviceProxy, "loadProductWithParameters:", v8);
  }

}

uint64_t __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", a3, a2);
}

void __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  char v12;
  _QWORD block[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v5)
    {
      _SKErrorFromNSError(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_3;
      block[3] = &unk_1E5B26970;
      v8 = *(id *)(a1 + 32);
      v14 = v7;
      v15 = v8;
      v9 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_4;
      v10[3] = &unk_1E5B274E8;
      v11 = *(id *)(a1 + 32);
      v12 = a2;
      dispatch_async(MEMORY[0x1E0C80D38], v10);
      v9 = v11;
    }

  }
}

uint64_t __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __85__SKStoreProductViewController_loadProductWithParameters_impression_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)loadView
{
  void *v3;
  SKObservableView *v4;

  v4 = objc_alloc_init(SKObservableView);
  -[SKObservableView setDelegate:](v4, "setDelegate:", self);
  -[SKObservableView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKObservableView setBackgroundColor:](v4, "setBackgroundColor:", v3);

  -[SKStoreProductViewController setView:](self, "setView:", v4);
  -[SKStoreProductViewController _addRemoteView](self, "_addRemoteView");

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  if (SKAllowsLandscapePhone())
    return 26;
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SKStoreProductViewController _configureForFullScreenPresentationOrThrowException](self, "_configureForFullScreenPresentationOrThrowException");
  if (-[SKStoreProductViewController _isInvalidSubclass](self, "_isInvalidSubclass"))
    -[SKStoreProductViewController _didFinishWithResult:](self, "_didFinishWithResult:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SKProductRemoteViewTask *remoteViewTask;
  void *v12;
  SKUIServiceProductPageViewController *serviceProxy;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v19;

  v3 = a3;
  -[SKStoreProductViewController presentingViewController](self, "presentingViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = isMyViewVisible(self);

    if (v7)
    {
      if (self->_productPageQFAEnabled)
        v8 = 1152;
      else
        v8 = 1048;
      v9 = *(Class *)((char *)&self->super.super.super.isa + v8);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setVisibleInClientWindow:", v10);

      self->_viewWasOnScreen = 1;
    }
  }
  if (self->_productPageQFAEnabled)
  {
    remoteViewTask = self->_remoteViewTask;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKStoreProductViewController _isPeeking](self, "_isPeeking"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKProductRemoteViewTask setPreview:](remoteViewTask, "setPreview:", v12);

    -[SKProductRemoteViewTask storeProductViewControllerWillAppear](self->_remoteViewTask, "storeProductViewControllerWillAppear");
    self->_viewWillAppearWasCalled = 1;
  }
  else
  {
    serviceProxy = self->_serviceProxy;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SKStoreProductViewController _isPeeking](self, "_isPeeking"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIServiceProductPageViewController setPreview:](serviceProxy, "setPreview:", v14);

  }
  -[SKStoreProductViewController setPresentationStyleIfNeeded](self, "setPresentationStyleIfNeeded");
  -[SKStoreProductViewController setNoClippingIfNeeded](self, "setNoClippingIfNeeded");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_originalStatusBarStyle = objc_msgSend(v15, "statusBarStyle");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStatusBarStyle:animated:", 0, v3);

  }
  -[SKStoreProductViewController _forceOrientationBackToSupportedOrientation](self, "_forceOrientationBackToSupportedOrientation");
  v19.receiver = self;
  v19.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController viewWillAppear:](&v19, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  SKScrollDetector *v6;
  SKScrollDetector *scrollDetector;
  SKScrollDetector *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[SKStoreProductViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[SKScrollDetector initWithDelegate:]([SKScrollDetector alloc], "initWithDelegate:", self);
    scrollDetector = self->_scrollDetector;
    self->_scrollDetector = v6;

    v8 = self->_scrollDetector;
    -[SKStoreProductViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKScrollDetector findAndListenForScrollingOfView:](v8, "findAndListenForScrollingOfView:", v9);

  }
  -[SKStoreProductViewController _configureForFullScreenPresentationOrThrowException](self, "_configureForFullScreenPresentationOrThrowException");
  if (self->_productPageQFAEnabled)
    -[SKProductRemoteViewTask storeProductViewControllerDidAppear](self->_remoteViewTask, "storeProductViewControllerDidAppear");
  v10.receiver = self;
  v10.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController viewDidAppear:](&v10, sel_viewDidAppear_, v3);
}

- (void)viewWillLayoutSubviews
{
  OUTLINED_FUNCTION_0_5(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "[%@] Invalid use of SKStoreProductViewController.", a5, a6, a7, a8, 2u);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStatusBarStyle:animated:", self->_originalStatusBarStyle, v3);

  if (self->_productPageQFAEnabled)
    -[SKProductRemoteViewTask storeProductViewControllerWillDisappear](self->_remoteViewTask, "storeProductViewControllerWillDisappear");
  v6.receiver = self;
  v6.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v5;
  objc_super v6;
  uint8_t buf[4];
  SKStoreProductViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: dismissViewControllerAnimated.", buf, 0xCu);
  }
  if (self->_productPageQFAEnabled)
    -[SKProductRemoteViewTask storeProductViewControllerWillDismiss](self->_remoteViewTask, "storeProductViewControllerWillDismiss");
  v6.receiver = self;
  v6.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, 1, v5);

}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (int)_preferredStatusBarVisibility
{
  return 2;
}

+ (void)getCanLoadURL:(id)a3 withURLBag:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, _QWORD);
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isOnDeviceAppInstallationAllowed");

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v8, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("http"))
      && objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("https")))
    {
      v10[2](v10, 0);
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __73__SKStoreProductViewController_getCanLoadURL_withURLBag_completionBlock___block_invoke;
      v14[3] = &unk_1E5B27510;
      v17 = a1;
      v15 = v8;
      v16 = v10;
      objc_msgSend(v9, "loadValueForKey:completionBlock:", CFSTR("ix-store-sheet"), v14);

    }
  }
  else
  {
    v10[2](v10, 0);
  }

}

void __73__SKStoreProductViewController_getCanLoadURL_withURLBag_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_defaultIXStoreSheetDictionary");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  v6 = v3;
  objc_msgSend(*(id *)(a1 + 48), "_validateURL:withSheetInfo:completionBlock:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 40));

}

+ (void)getCanLoadURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DAF660];
  v8 = a3;
  objc_msgSend(v7, "contextWithBagType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsExpiredBags:", 1);
  objc_msgSend(v9, "setUsesCachedBagsOnly:", 1);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF658]), "initWithURLBagContext:", v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SKStoreProductViewController_getCanLoadURL_completionBlock___block_invoke;
  v12[3] = &unk_1E5B27558;
  v13 = v6;
  v11 = v6;
  objc_msgSend(a1, "getCanLoadURL:withURLBag:completionBlock:", v8, v10, v12);

}

void __62__SKStoreProductViewController_getCanLoadURL_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(MEMORY[0x1E0DAF660], "contextWithBagType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsExpiredBags:", 1);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF658]), "initWithURLBagContext:", v2);
  objc_msgSend(v1, "loadWithCompletionBlock:", &__block_literal_global_7);

}

- (void)finishImmediately
{
  int *v2;

  if (self->_productPageQFAEnabled)
    v2 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
  else
    v2 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "finishImmediately");
}

- (void)loadProductWithPageDictionary:(id)a3 completionBlock:(id)a4
{
  id v6;

  if (self->_productPageQFAEnabled)
  {
    -[SKProductRemoteViewTask loadProductWithPageDictionary:completionBlock:](self->_remoteViewTask, "loadProductWithPageDictionary:completionBlock:", a3, a4);
  }
  else
  {
    v6 = a3;
    -[SKStoreProductViewController _setLoadBlock:](self, "_setLoadBlock:", a4);
    -[SKUIServiceProductPageViewController loadProductWithPageDictionary:](self->_serviceProxy, "loadProductWithPageDictionary:", v6);
  }

}

- (void)loadProductWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (!self->_productPageQFAEnabled)
    -[SKStoreProductViewController _setLoadBlock:](self, "_setLoadBlock:", v6);
  self->_productPageStyle = objc_msgSend(v8, "productPageStyle");
  v7 = (void *)objc_msgSend(v8, "copyXPCEncoding");
  if (self->_productPageQFAEnabled)
    -[SKProductRemoteViewTask loadProductWithRequest:completionBlock:](self->_remoteViewTask, "loadProductWithRequest:completionBlock:", v7, v6);
  else
    -[SKUIServiceProductPageViewController loadProductWithRequest:](self->_serviceProxy, "loadProductWithRequest:", v7);

}

- (void)loadProductWithURL:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  SKProductRemoteViewTask *remoteViewTask;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  if (self->_productPageQFAEnabled
    || (-[SKStoreProductViewController _setLoadBlock:](self, "_setLoadBlock:", v7), self->_productPageQFAEnabled))
  {
    remoteViewTask = self->_remoteViewTask;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke;
    v9[3] = &unk_1E5B26948;
    v10 = v7;
    -[SKProductRemoteViewTask loadProductWithURL:completionBlock:](remoteViewTask, "loadProductWithURL:completionBlock:", v6, v9);

  }
  else
  {
    -[SKUIServiceProductPageViewController loadProductWithURL:](self->_serviceProxy, "loadProductWithURL:", v6);
  }

}

void __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  v5 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke_2;
    block[3] = &unk_1E5B27580;
    v8 = *(id *)(a1 + 32);
    v9 = a2;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __67__SKStoreProductViewController_loadProductWithURL_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)setAdditionalBuyParameters:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *additionalBuyParameters;
  int *v7;
  NSString *v8;

  v4 = (NSString *)a3;
  if (self->_additionalBuyParameters != v4)
  {
    v8 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    additionalBuyParameters = self->_additionalBuyParameters;
    self->_additionalBuyParameters = v5;

    if (self->_productPageQFAEnabled)
      v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setAdditionalBuyParameters:", v8);
    v4 = v8;
  }

}

- (void)setAffiliateIdentifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *affiliateIdentifier;
  int *v7;
  NSString *v8;

  v4 = (NSString *)a3;
  if (self->_affiliateIdentifier != v4)
  {
    v8 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    affiliateIdentifier = self->_affiliateIdentifier;
    self->_affiliateIdentifier = v5;

    if (self->_productPageQFAEnabled)
      v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setAffiliateIdentifier:", v8);
    v4 = v8;
  }

}

- (void)setClientIdentifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *clientIdentifier;
  int *v7;
  NSString *v8;

  v4 = (NSString *)a3;
  if (self->_clientIdentifier != v4)
  {
    v8 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    clientIdentifier = self->_clientIdentifier;
    self->_clientIdentifier = v5;

    if (self->_productPageQFAEnabled)
      v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setClientIdentifier:", v8);
    v4 = v8;
  }

}

- (void)setHostBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *hostBundleIdentifier;
  int *v7;
  NSString *v8;

  v4 = (NSString *)a3;
  if (self->_hostBundleIdentifier != v4)
  {
    v8 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    hostBundleIdentifier = self->_hostBundleIdentifier;
    self->_hostBundleIdentifier = v5;

    if (self->_productPageQFAEnabled)
      v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setHostBundleIdentifier:", v8);
    v4 = v8;
  }

}

- (void)setCancelButtonTitle:(id)a3
{
  int *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_cancelButtonTitle != v6)
  {
    objc_storeStrong((id *)&self->_cancelButtonTitle, a3);
    if (self->_productPageQFAEnabled)
      v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setCancelButtonTitle:", v6);
  }

}

- (void)setRightBarButtonTitle:(id)a3
{
  int *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_rightBarButtonTitle != v6)
  {
    objc_storeStrong((id *)&self->_rightBarButtonTitle, a3);
    if (self->_productPageQFAEnabled)
      v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setRightBarButtonTitle:", v6);
  }

}

- (void)setShowsRightBarButton:(BOOL)a3
{
  SKUIServiceProductPageViewController *serviceProxy;
  id v4;

  if (self->_showsRightBarButton != a3)
  {
    self->_showsRightBarButton = a3;
    if (self->_productPageQFAEnabled)
    {
      -[SKProductRemoteViewTask setShowsRightBarButton:](self->_remoteViewTask, "setShowsRightBarButton:");
    }
    else
    {
      serviceProxy = self->_serviceProxy;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIServiceProductPageViewController setShowsRightBarButton:](serviceProxy, "setShowsRightBarButton:", v4);

    }
  }
}

- (void)setPromptString:(id)a3
{
  int *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_promptString != v6)
  {
    objc_storeStrong((id *)&self->_promptString, a3);
    if (self->_productPageQFAEnabled)
      v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setPromptString:", v6);
  }

}

- (void)setProductPageStyle:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_productPageStyle != a3)
  {
    self->_productPageStyle = a3;
    if (self->_productPageQFAEnabled)
      v3 = 1152;
    else
      v3 = 1048;
    v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProductPageStyle:");

  }
}

- (void)setShowsStoreButton:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_showsStoreButton != a3)
  {
    self->_showsStoreButton = a3;
    if (self->_productPageQFAEnabled)
      v3 = 1152;
    else
      v3 = 1048;
    v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShowsStoreButton:");

  }
}

- (void)setScriptContextDictionary:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  NSDictionary *scriptContextDictionary;
  int *v7;
  NSDictionary *v8;

  v4 = (NSDictionary *)a3;
  if (self->_scriptContextDictionary != v4)
  {
    v8 = v4;
    v5 = (NSDictionary *)-[NSDictionary copy](v4, "copy");
    scriptContextDictionary = self->_scriptContextDictionary;
    self->_scriptContextDictionary = v5;

    if (self->_productPageQFAEnabled)
      v7 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v7 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setScriptContextDictionary:", v8);
    v4 = v8;
  }

}

- (void)setUsageContext:(id)a3
{
  int *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_usageContext != v6)
  {
    objc_storeStrong((id *)&self->_usageContext, a3);
    if (self->_productPageQFAEnabled)
      v5 = &OBJC_IVAR___SKStoreProductViewController__remoteViewTask;
    else
      v5 = &OBJC_IVAR___SKStoreProductViewController__serviceProxy;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "setUsageContext:", v6);
  }

}

- (void)setAskToBuy:(BOOL)a3
{
  SKUIServiceProductPageViewController *serviceProxy;
  id v4;

  if (self->_askToBuy != a3)
  {
    self->_askToBuy = a3;
    if (self->_productPageQFAEnabled)
    {
      -[SKProductRemoteViewTask setAskToBuy:](self->_remoteViewTask, "setAskToBuy:");
    }
    else
    {
      serviceProxy = self->_serviceProxy;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[SKUIServiceProductPageViewController setAskToBuy:](serviceProxy, "setAskToBuy:", v4);

    }
  }
}

- (void)_didFinish
{
  id WeakRetained;
  char v4;
  id v5;
  int v6;
  SKStoreProductViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: didFinish.", (uint8_t *)&v6, 0xCu);
  }
  -[SKStoreProductViewController _fireLoadBlockBeforeFinishing](self, "_fireLoadBlockBeforeFinishing");
  -[SKStoreProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "productViewControllerDidFinish:", self);

  }
}

- (void)_didFinishWithResult:(int64_t)a3
{
  id WeakRetained;
  char v6;
  id v7;

  -[SKStoreProductViewController _fireLoadBlockBeforeFinishing](self, "_fireLoadBlockBeforeFinishing");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SKStoreProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "productViewController:didFinishWithResult:", self, a3);

  }
  else
  {
    -[SKStoreProductViewController _didFinish](self, "_didFinish");
  }
}

- (void)_didFinishDismissal
{
  void (**dismissalCompleted)(id, SEL);
  id v4;
  int v5;
  SKStoreProductViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dismissalCompleted = (void (**)(id, SEL))self->_dismissalCompleted;
  if (dismissalCompleted)
  {
    dismissalCompleted[2](dismissalCompleted, a2);
    v4 = self->_dismissalCompleted;
  }
  else
  {
    v4 = 0;
  }
  self->_dismissalCompleted = 0;

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: dismiss end delay.", (uint8_t *)&v5, 0xCu);
  }
  -[SKStoreProductViewController _endDelayingPresentation](self, "_endDelayingPresentation");
}

- (void)_loadDidFinishWithResult:(BOOL)a3 error:(id)a4
{
  void (**loadBlock)(id, BOOL, id);
  id v6;

  loadBlock = (void (**)(id, BOOL, id))self->_loadBlock;
  if (loadBlock)
  {
    loadBlock[2](loadBlock, a3, a4);
    v6 = self->_loadBlock;
    self->_loadBlock = 0;

  }
}

- (void)_userDidInteractWithProduct:(unint64_t)a3
{
  SKStoreProductViewControllerDelegatePrivate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "productViewController:userDidInteractWithProduct:", self, a3);

  }
}

- (void)_presentPageWithRequest:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v4 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "productViewController:presentProductWithRequest:animated:", self, v9, v4);

  }
}

- (void)_resetRemoteViewController
{
  void *v3;
  id v4;
  _UIAsyncInvocation *cancelRequest;
  SKRemoteProductViewController *remoteViewController;
  id WeakRetained;
  char v8;
  id v9;

  if (-[SKRemoteProductViewController isViewLoaded](self->_remoteViewController, "isViewLoaded"))
  {
    -[SKRemoteProductViewController view](self->_remoteViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

  }
  v4 = (id)-[_UIAsyncInvocation invoke](self->_cancelRequest, "invoke");
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = 0;

  -[SKUIServiceProductPageViewController setInvocationTarget:](self->_serviceProxy, "setInvocationTarget:", 0);
  -[SKRemoteProductViewController setProductViewController:](self->_remoteViewController, "setProductViewController:", 0);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "productViewController:didFinishWithResult:", self, 1);

  }
  else
  {
    -[SKStoreProductViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (BOOL)_isInvalidSubclass
{
  int has_internal_content;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((-[SKStoreProductViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    goto LABEL_2;
  -[NSString lowercaseString](self->_bundleID, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple."));

  if (v5)
  {
    has_internal_content = os_variant_has_internal_content();
    if (has_internal_content)
    {
      has_internal_content = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (has_internal_content)
      {
        -[SKStoreProductViewController _isInvalidSubclass].cold.1();
LABEL_2:
        LOBYTE(has_internal_content) = 0;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      -[SKStoreProductViewController _isInvalidSubclass].cold.2((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
    LOBYTE(has_internal_content) = 1;
  }
  return has_internal_content;
}

- (BOOL)_isPeeking
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[SKStoreProductViewController presentationController](self, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "presentationStyle") == 20)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[SKStoreProductViewController presentationController](self, "presentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (void)setParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKStoreProductViewController;
  -[SKStoreProductViewController setParentViewController:](&v3, sel_setParentViewController_, a3);
}

- (void)setPresentationStyleIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  -[SKStoreProductViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    v4 = (void *)MEMORY[0x1E0CB37E8];
    if (self->_productPageQFAEnabled)
      v5 = 1152;
    else
      v5 = 1048;
    v6 = *(Class *)((char *)&self->super.super.super.isa + v5);
    v7 = 0;
    goto LABEL_8;
  }
  if (-[SKStoreProductViewController _isPeeking](self, "_isPeeking"))
    goto LABEL_4;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  if (self->_productPageQFAEnabled)
    v8 = 1152;
  else
    v8 = 1048;
  v6 = *(Class *)((char *)&self->super.super.super.isa + v8);
  v7 = 4294967294;
LABEL_8:
  objc_msgSend(v4, "numberWithInt:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPresentationStyle:", v9);

}

- (void)setNoClippingIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  SKRemoteProductViewController *remoteViewController;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("com.apple.Spotlight"), "isEqualToString:", v4);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
    v9 = v5 == 0;
  else
    v9 = 1;
  if (!v9 && v7 == 1)
    -[_UIRemoteViewController _setViewClipsToBounds:](remoteViewController, "_setViewClipsToBounds:", 0);
}

- (void)_addRemoteView
{
  void *v3;
  void *v4;
  id v5;

  if (self->_remoteViewController)
  {
    if (-[SKStoreProductViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SKRemoteProductViewController view](self->_remoteViewController, "view");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v3);

      -[SKStoreProductViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSubview:", v5);
      objc_msgSend(v4, "bounds");
      objc_msgSend(v5, "setFrame:");
      objc_msgSend(v5, "setAutoresizingMask:", 18);

    }
  }
}

+ (id)_defaultIXStoreSheetDictionary
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("itunes[.]apple[.]com"), CFSTR("new[.]itunes[.]com"), 0);
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("host-patterns"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "addObject:", CFSTR("^/([a-z][a-z]/)?(app|app-bundle|album|movie|tv-season)([/?]|$)"));
  objc_msgSend(v4, "addObject:", CFSTR("^/redir/.*[&?]mt=[0123456789]+(&|$)"));
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("path-patterns"));

  return v2;
}

- (void)_fireLoadBlockBeforeFinishing
{
  id v3;

  if (self->_loadBlock)
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKErrorDomain"), 0, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[SKStoreProductViewController _loadDidFinishWithResult:error:](self, "_loadDidFinishWithResult:error:", 0, v3);

    }
  }
}

- (void)_forceOrientationBackToSupportedOrientation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "statusBarOrientation") - 3) <= 1
    && (-[SKStoreProductViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") & 0x18) == 0)
  {
    if (!-[SKStoreProductViewController isViewLoaded](self, "isViewLoaded")
      || (-[SKStoreProductViewController view](self, "view"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "window"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v3,
          !v4))
    {
      -[SKStoreProductViewController presentedViewController](self, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v4, "_setRotatableViewOrientation:duration:force:", 1, 1, 0.0);

  }
}

- (void)_requestRemoteViewController
{
  uint64_t v3;
  _UIAsyncInvocation *v4;
  _UIAsyncInvocation *cancelRequest;
  _QWORD v6[5];
  id v7;
  id location;
  _QWORD v9[5];

  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SKStoreProductViewController__requestRemoteViewController__block_invoke;
  v9[3] = &unk_1E5B268B8;
  v9[4] = self;
  -[SKStoreProductViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", v9, 10.0);
  objc_initWeak(&location, self);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __60__SKStoreProductViewController__requestRemoteViewController__block_invoke_2;
  v6[3] = &unk_1E5B268E0;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SKRemoteProductViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ServiceProductPageViewController"), CFSTR("com.apple.ios.StoreKitUIService"), v6);
  v4 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
  cancelRequest = self->_cancelRequest;
  self->_cancelRequest = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __60__SKStoreProductViewController__requestRemoteViewController__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  SSError();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_loadDidFinishWithResult:error:", 0, v2);

  return 0;
}

void __60__SKStoreProductViewController__requestRemoteViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  char *WeakRetained;
  _QWORD *v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v6 = a2;
  v7 = a3;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (v6)
  {
    v10 = (id *)(WeakRetained + 1040);
    objc_storeStrong((id *)WeakRetained + 130, a2);
    objc_msgSend(*v10, "setProductViewController:", v9);
    v11 = (void *)v9[131];
    objc_msgSend(*v10, "serviceViewControllerProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInvocationTarget:", v12);

    objc_msgSend(v9, "setPresentationStyleIfNeeded");
    objc_msgSend(v9, "setNoClippingIfNeeded");
    objc_msgSend(v9, "addChildViewController:", *v10);
    objc_msgSend(v9, "_addRemoteView");
  }
  else
  {
    NSLog(CFSTR("Could not request view controller: %@"), v7);
    SSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_loadDidFinishWithResult:error:", 0, v13);

    v15.receiver = *(id *)(a1 + 32);
    v15.super_class = (Class)SKStoreProductViewController;
    objc_msgSendSuper2(&v15, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  v14 = (void *)v9[124];
  v9[124] = 0;

  objc_msgSend(v9, "_endDelayingPresentation");
}

- (void)_setLoadBlock:(id)a3
{
  void *v4;
  id loadBlock;

  if (self->_loadBlock != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    loadBlock = self->_loadBlock;
    self->_loadBlock = v4;

  }
}

- (void)_configureForFullScreenPresentationOrThrowException
{
  void *v3;

  -[SKStoreProductViewController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (dyld_program_sdk_at_least())
      -[SKStoreProductViewController _throwUnsupportedPresentationException](self, "_throwUnsupportedPresentationException");
    -[SKStoreProductViewController setPresentationStyleIfNeeded](self, "setPresentationStyleIfNeeded");
  }
}

- (void)_throwUnsupportedPresentationException
{
  void *v2;
  objc_class *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", CFSTR("SKUnsupportedPresentationException"), CFSTR("%@ must be used in a modal view controller"), v4);

}

+ (void)_validateURL:(id)a3 withSheetInfo:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("host-patterns"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "host");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v38 = v8;
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v45;
            while (2)
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v45 != v15)
                  objc_enumerationMutation(v12);
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), 1, 0);
                v18 = objc_msgSend(v17, "rangeOfFirstMatchInString:options:range:", v11, 0, 0, objc_msgSend((id)v11, "length"));

                if (v18 != 0x7FFFFFFFFFFFFFFFLL)
                {

                  v8 = v38;
                  goto LABEL_17;
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
              if (v14)
                continue;
              break;
            }
          }

          v11 = 0;
          v8 = v38;
        }
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
LABEL_17:
      objc_msgSend(v8, "objectForKey:", CFSTR("path-patterns"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = (void *)MEMORY[0x1E0CB37A0];
          objc_msgSend(v7, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithString:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v7, "parameterString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v7, "parameterString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "appendFormat:", CFSTR(";%@"), v24);

            }
            objc_msgSend(v7, "query");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v7, "query");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "appendFormat:", CFSTR("?%@"), v26);

            }
            objc_msgSend(v7, "fragment");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v7, "fragment");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "appendFormat:", CFSTR("#%@"), v28);

            }
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v36 = v19;
            obj = v19;
            v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v29)
            {
              v30 = v29;
              v37 = v10;
              v31 = *(_QWORD *)v41;
LABEL_28:
              v32 = 0;
              while (1)
              {
                if (*(_QWORD *)v41 != v31)
                  objc_enumerationMutation(obj);
                v33 = 1;
                v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v32), 1, 0);
                v35 = objc_msgSend(v34, "rangeOfFirstMatchInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length"));

                if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                  break;
                if (v30 == ++v32)
                {
                  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                  if (v30)
                    goto LABEL_28;
                  v33 = 0;
                  break;
                }
              }
              v10 = v37;
            }
            else
            {
              v33 = 0;
            }

            v19 = v36;
          }
          else
          {
            v33 = 0;
          }

        }
        else
        {
          v33 = 0;
        }
      }
      else
      {
        v33 = 1;
      }

      v11 = v33 != 0;
    }

  }
  else
  {
    v11 = 0;
  }
  v9[2](v9, v11);

}

- (id)_impressionDictFromImpression:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "advertisedAppStoreItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("id"));

  objc_msgSend(v3, "signature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("adNetworkAttributionSignature"));

  objc_msgSend(v3, "adCampaignIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("adNetworkCampaignId"));

  objc_msgSend(v3, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("sourceIdentifier"));

  objc_msgSend(v3, "adNetworkIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("adNetworkId"));

  objc_msgSend(v3, "adImpressionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("adNetworkNonce"));

  objc_msgSend(v3, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("adNetworkImpressionTimestamp"));

  objc_msgSend(v3, "version");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("adNetworkPayloadVersion"));

  objc_msgSend(v3, "sourceAppStoreItemIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("adNetworkSourceAppStoreIdentifier"));
  return v4;
}

- (void)sk_didBecomeOnScreen:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_productPageQFAEnabled)
    v3 = 1152;
  else
    v3 = 1048;
  v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisibleInClientWindow:");

}

- (void)sk_didBecomeOffScreen:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_productPageQFAEnabled)
    v3 = 1152;
  else
    v3 = 1048;
  v4 = *(Class *)((char *)&self->super.super.super.isa + v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVisibleInClientWindow:");

}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[SKRemoteDismissingTransition initWithViewController:]([SKRemoteDismissingTransition alloc], "initWithViewController:", self);
}

- (BOOL)dismissRemoteViewControllerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id dismissalCompleted;
  int v10;
  SKStoreProductViewController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SKUIServiceProductPageViewController invocationTarget](self->_serviceProxy, "invocationTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: dismiss begin delay.", (uint8_t *)&v10, 0xCu);
    }
    -[SKStoreProductViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", 0, 5.0);
    v7 = _Block_copy(v4);
    dismissalCompleted = self->_dismissalCompleted;
    self->_dismissalCompleted = v7;

    -[SKUIServiceProductPageViewController dismissViewControllerAnimated:](self->_serviceProxy, "dismissViewControllerAnimated:", MEMORY[0x1E0C9AAB0]);
  }
  else if (v6)
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_1ABFBE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@: no invocation target.", (uint8_t *)&v10, 0xCu);
  }

  return v5 != 0;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSString)additionalBuyParameters
{
  return self->_additionalBuyParameters;
}

- (NSString)affiliateIdentifier
{
  return self->_affiliateIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (NSDictionary)scriptContextDictionary
{
  return self->_scriptContextDictionary;
}

- (int64_t)productPageStyle
{
  return self->_productPageStyle;
}

- (NSString)usageContext
{
  return self->_usageContext;
}

- (BOOL)askToBuy
{
  return self->_askToBuy;
}

- (BOOL)showsStoreButton
{
  return self->_showsStoreButton;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (NSString)rightBarButtonTitle
{
  return self->_rightBarButtonTitle;
}

- (BOOL)showsRightBarButton
{
  return self->_showsRightBarButton;
}

- (NSString)promptString
{
  return self->_promptString;
}

- (BOOL)automaticallyDismisses
{
  return self->_automaticallyDismisses;
}

- (void)setAutomaticallyDismisses:(BOOL)a3
{
  self->_automaticallyDismisses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageContext, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewTask, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_dismissalCompleted, 0);
  objc_storeStrong((id *)&self->_scrollDetector, 0);
  objc_storeStrong((id *)&self->_promptString, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_scriptContextDictionary, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_cancelRequest, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalBuyParameters, 0);
}

- (void)didChangeAlpha:(double)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3 > 0.300000012;
  if (self->_viewWasOnScreen != v3)
  {
    if (self->_productPageQFAEnabled)
      v5 = 1152;
    else
      v5 = 1048;
    v6 = *(Class *)((char *)&self->super.super.super.isa + v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3 > 0.300000012);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVisibleInClientWindow:", v7);

    self->_viewWasOnScreen = v3;
  }
}

- (void)didChangeHidden
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[SKStoreProductViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden") ^ 1;

  if (self->_viewWasOnScreen != (_DWORD)v4)
  {
    if (self->_productPageQFAEnabled)
      v5 = 1152;
    else
      v5 = 1048;
    v6 = *(Class *)((char *)&self->super.super.super.isa + v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVisibleInClientWindow:", v7);

    self->_viewWasOnScreen = v4;
  }
}

- (void)_isInvalidSubclass
{
  OUTLINED_FUNCTION_0_5(&dword_1ABFBE000, MEMORY[0x1E0C81028], a3, "[%@] Subclassing SKStoreProductViewController is not supported.", a5, a6, a7, a8, 2u);
}

@end
