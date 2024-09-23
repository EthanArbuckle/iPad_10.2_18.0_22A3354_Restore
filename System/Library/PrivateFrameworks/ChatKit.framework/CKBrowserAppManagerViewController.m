@implementation CKBrowserAppManagerViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBrowserAppManagerViewController;
  -[CKBrowserViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[CKBrowserAppManagerViewController presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)viewDidLoad
{
  void *v3;
  CKAppManagerViewController *v4;
  CKAppManagerViewController *appViewController;
  UINavigationController *v6;
  UINavigationController *navController;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKBrowserAppManagerViewController;
  -[CKBrowserAppManagerViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[CKBrowserAppManagerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CKAppManagerViewController);
  appViewController = self->_appViewController;
  self->_appViewController = v4;

  -[CKAppManagerViewController setDelegate:](self->_appViewController, "setDelegate:", self);
  v6 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", self->_appViewController);
  navController = self->_navController;
  self->_navController = v6;

  -[UINavigationController view](self->_navController, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserAppManagerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "setFrame:");

  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v8);
  -[CKBrowserAppManagerViewController addChildViewController:](self, "addChildViewController:", self->_navController);
  -[UINavigationController didMoveToParentViewController:](self->_navController, "didMoveToParentViewController:", self);

}

- (BOOL)appAllowedByScreenTimeWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  if (!a3)
    return 1;
  v3 = a3;
  IMSharedDowntimeController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowedToShowAppExtensionWithBundleIdentifier:", v3);

  return v5;
}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKBrowserAppManagerViewController dismiss](self, "dismiss");
  objc_msgSend(v6, "appBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKBrowserAppManagerViewController appAllowedByScreenTimeWithBundleIdentifier:](self, "appAllowedByScreenTimeWithBundleIdentifier:", v5))
  {
    -[CKBrowserAppManagerViewController delegate_BrowserAppManagerDidSelectPlugin:](self, "delegate_BrowserAppManagerDidSelectPlugin:", v6);
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }

}

- (void)delegate_BrowserAppManagerDidSelectPlugin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKBrowserAppManagerViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "browserAppManagerDidSelectPlugin:", v4);

}

- (void)dismiss
{
  void *v2;
  id v3;

  -[CKBrowserViewController sendDelegate](self, "sendDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateAppManagerPlugin");

}

- (int64_t)browserPresentationStyle
{
  return 2;
}

- (BOOL)shouldShowChatChrome
{
  return 0;
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)isDismissing
{
  return 0;
}

- (int64_t)parentModalPresentationStyle
{
  return 4;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5;
  char isKindOfClass;
  CKBrowserFullscreenRevealAnimationController *v7;

  v5 = a3;
  NSClassFromString(CFSTR("CKFullscreenBrowserNavigationController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v7 = -[CKBrowserFullscreenRevealAnimationController initWithDirection:]([CKBrowserFullscreenRevealAnimationController alloc], "initWithDirection:", 1);
  else
    v7 = 0;
  return v7;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3;
  char isKindOfClass;
  CKBrowserFullscreenRevealAnimationController *v5;

  v3 = a3;
  NSClassFromString(CFSTR("CKFullscreenBrowserNavigationController"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = -[CKBrowserFullscreenRevealAnimationController initWithDirection:]([CKBrowserFullscreenRevealAnimationController alloc], "initWithDirection:", 0);
  else
    v5 = 0;
  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKBrowserFullscreenRevealPresentationController *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  NSClassFromString(CFSTR("CKFullscreenBrowserNavigationController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = -[CKBrowserFullscreenRevealPresentationController initWithPresentedViewController:presentingViewController:]([CKBrowserFullscreenRevealPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
    location = 0;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __132__CKBrowserAppManagerViewController_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
    v13[3] = &unk_1E2757948;
    objc_copyWeak(&v14, &location);
    -[CKBrowserFullscreenRevealPresentationController setDismissHandler:](v11, "setDismissHandler:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __132__CKBrowserAppManagerViewController_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismiss");

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3;

  -[CKBrowserViewController sendDelegate](self, "sendDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAndReloadInputViews:", 1);

}

- (BOOL)isManagingStickers
{
  return self->_isManagingStickers;
}

- (void)setIsManagingStickers:(BOOL)a3
{
  self->_isManagingStickers = a3;
}

- (CKBrowserAppManagerViewControllerDelegate)delegate
{
  return (CKBrowserAppManagerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appViewController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
}

@end
