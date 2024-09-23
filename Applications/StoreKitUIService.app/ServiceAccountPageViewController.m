@implementation ServiceAccountPageViewController

- (ServiceAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ServiceAccountPageViewController *v4;
  uint64_t v5;
  SUClientInterface *clientInterface;
  SUClientInterface *v7;
  void *v8;
  uint64_t v9;
  SSPromise *configurationPromise;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ServiceAccountPageViewController;
  v4 = -[ServiceAccountPageViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[SKProductPageViewController _defaultClientInterface](SKProductPageViewController, "_defaultClientInterface"));
    clientInterface = v4->_clientInterface;
    v4->_clientInterface = (SUClientInterface *)v5;

    -[SUClientInterface setDelegate:](v4->_clientInterface, "setDelegate:", v4);
    -[SUClientInterface setIgnoreDefaultKeyboardNotifications:](v4->_clientInterface, "setIgnoreDefaultKeyboardNotifications:", 1);
    v7 = v4->_clientInterface;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUWebViewManager defaultLocalStoragePath](SUWebViewManager, "defaultLocalStoragePath"));
    -[SUClientInterface setLocalStoragePath:](v7, "setLocalStoragePath:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _preloadConfiguration](v4, "_preloadConfiguration"));
    configurationPromise = v4->_configurationPromise;
    v4->_configurationPromise = (SSPromise *)v9;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SUClientInterface setDelegate:](self->_clientInterface, "setDelegate:", 0);
  if ((objc_opt_respondsToSelector(self->_underlyingViewController, "setEmbeddedParent:") & 1) != 0)
    -[ServiceAccountPageEmbedded setEmbeddedParent:](self->_underlyingViewController, "setEmbeddedParent:", 0);
  if ((unint64_t)(self->_type - 1) <= 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedNavigationController sharedController](ServiceBridgedNavigationController, "sharedController"));
    objc_msgSend(v3, "synchonrizeContinainerViewControllers");

  }
  v4.receiver = self;
  v4.super_class = (Class)ServiceAccountPageViewController;
  -[ServiceAccountPageViewController dealloc](&v4, "dealloc");
}

- (void)dismissHostViewController
{
  -[ServiceAccountPageViewController dismissHostViewControllerWithResult:error:](self, "dismissHostViewControllerWithResult:error:", 1, 0);
}

- (void)dismissHostViewControllerWithResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v8, "dismissViewControllerWithResult:error:", v7, v6);

}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIServiceAccountPageViewController);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIClientAccountPageViewController);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ServiceAccountPageViewController;
  -[ServiceAccountPageViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUClientInterface viewControllerFactory](self->_clientInterface, "viewControllerFactory"));
  v6 = objc_msgSend(v5, "newPlaceholderViewController");

  v7 = objc_msgSend(objc_alloc((Class)SUNavigationController), "initWithRootViewController:", v6);
  -[ServiceAccountPageViewController setContainerNavigationController:](self, "setContainerNavigationController:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController containerNavigationController](self, "containerNavigationController"));
  objc_msgSend(v8, "setClientInterface:", self->_clientInterface);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController containerNavigationController](self, "containerNavigationController"));
  -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v9);

}

- (void)setChildViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_childViewController;
  UIViewController *childViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIViewController *v14;

  v5 = (UIViewController *)a3;
  p_childViewController = &self->_childViewController;
  childViewController = self->_childViewController;
  if (childViewController != v5)
  {
    v14 = v5;
    if (childViewController)
    {
      -[UIViewController willMoveToParentViewController:](childViewController, "willMoveToParentViewController:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](*p_childViewController, "view"));
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController removeFromParentViewController](*p_childViewController, "removeFromParentViewController");
      v5 = v14;
    }
    -[UIViewController willMoveToParentViewController:](v5, "willMoveToParentViewController:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v14, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController view](self, "view"));
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "setFrame:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v14, "view"));
    objc_msgSend(v11, "setAutoresizingMask:", 18);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController view](self, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v14, "view"));
    objc_msgSend(v12, "addSubview:", v13);

    -[ServiceAccountPageViewController addChildViewController:](self, "addChildViewController:", v14);
    objc_storeStrong((id *)&self->_childViewController, a3);
    v5 = v14;
  }

}

- (void)setUnderlyingViewController:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_underlyingViewController, a3);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedNavigationItem itemFromItem:](ServiceBridgedNavigationItem, "itemFromItem:", v7));
  objc_msgSend(v6, "setProxyHandler:", self);
  objc_msgSend(v5, "su_setBridgedNavigationItem:", v6);

}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  -[ServiceAccountPageViewController _hostAuditToken](self, "_hostAuditToken");
  v8 = v10;
  v9 = v11;
  if (sub_10000F240(&v8, CFSTR("com.apple.ios.StoreKit.account-page"))
    || (v8 = v10, v9 = v11, sub_10000F240(&v8, kSSITunesStorePrivateEntitlement)))
  {
    v3 = 0;
    v4 = 1;
  }
  else
  {
    v5 = SSError(SSErrorDomain, 107, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v4 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v6, "didPrepareWithResult:error:", v7, v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServiceAccountPageViewController;
  -[ServiceAccountPageViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)1
    && !-[ServiceAccountPageViewController loadFromBridgedNavigation](self, "loadFromBridgedNavigation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedNavigationController sharedController](ServiceBridgedNavigationController, "sharedController"));
    objc_msgSend(v4, "setProxyHandler:", self);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServiceAccountPageViewController;
  -[ServiceAccountPageViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)1
    || (id)-[ServiceAccountPageViewController type](self, "type") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedNavigationController sharedController](ServiceBridgedNavigationController, "sharedController"));
    objc_msgSend(v4, "synchonrizeContinainerViewControllers");

  }
}

- (id)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v9;
  void *v10;
  objc_super v11;
  objc_super v12;

  if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController underlyingViewController](self, "underlyingViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "su_bridgedNavigationItem"));
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)ServiceAccountPageViewController;
      v9 = -[ServiceAccountPageViewController navigationItem](&v12, "navigationItem");
      v6 = (id)objc_claimAutoreleasedReturnValue(v9);
    }
    v10 = v6;

    return v10;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ServiceAccountPageViewController;
    v7 = -[ServiceAccountPageViewController navigationItem](&v11, "navigationItem");
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }
}

- (id)navigationController
{
  void *v3;
  id v4;
  objc_super v6;

  if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedNavigationController sharedController](ServiceBridgedNavigationController, "sharedController"));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ServiceAccountPageViewController;
    v4 = -[ServiceAccountPageViewController navigationController](&v6, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedPresentationController sharedController](ServiceBridgedPresentationController, "sharedController"));
  -[ServiceAccountPageViewController presentationBounds](self, "presentationBounds");
  LODWORD(v5) = objc_msgSend(v8, "saveViewController:animated:presentationBounds:proxyHandler:", v7, v5, self);

  if ((_DWORD)v5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    objc_msgSend(v9, "presentBridgedViewController");

  }
}

- (void)navigationItemUpdated
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController underlyingViewController](self, "underlyingViewController"));
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController navigationItemOptionsFromViewController:](self, "navigationItemOptionsFromViewController:", v3));

  -[ServiceAccountPageViewController setBridgedNavigationItemWithOptions:](self, "setBridgedNavigationItemWithOptions:", v4);
}

- (void)setBridgedNavigationItemWithOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v5, "setBridgedNavigationItemWithOptions:", v4);

}

- (id)navigationItemOptionsFromViewController:(id)a3
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "navigationItem"));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "hidesBackButton")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, SKUIServiceNavigationOptionBackButtonHidden);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backButtonTitle"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backButtonTitle"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, SKUIServiceNavigationOptionBackButtonTitle);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightBarButtonItem"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightBarButtonItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, SKUIServiceNavigationOptionRightButtonTitle);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightBarButtonItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v11, "style")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, SKUIServiceNavigationOptionRightButtonStyle);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rightBarButtonItem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "isEnabled")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, SKUIServiceNavigationOptionRightButtonEnabled);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, SKUIServiceNavigationOptionTitle);

  }
  return v4;
}

- (void)pushBridgedViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController navigationItemOptionsFromViewController:](self, "navigationItemOptionsFromViewController:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v6, "pushBridgedViewControllerAnimated:options:", v4, v7);

}

- (void)popBridgedViewControllersToIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v4, "popBridgedViewControllersToIndex:", a3);

}

- (void)dismissViewController
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v2, "dismissBridgedViewController");

}

- (void)loadWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  if (-[ServiceAccountPageViewController loadFromBridgedNavigation](self, "loadFromBridgedNavigation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedNavigationController sharedController](ServiceBridgedNavigationController, "sharedController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));

    -[ServiceAccountPageViewController setUnderlyingViewController:](self, "setUnderlyingViewController:", v6);
    -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v6);

  }
  else if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)2)
  {
    v7 = objc_alloc_init((Class)UIView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v7, "setOpaque:", 0);
    -[ServiceAccountPageViewController setView:](self, "setView:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
    objc_msgSend(v10, "makeKeyWindow");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedPresentationController sharedController](ServiceBridgedPresentationController, "sharedController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "removeSavedViewController"));

    if (v12)
    {
      -[ServiceAccountPageViewController setPresentingBridgedViewController:](self, "setPresentingBridgedViewController:", v12);
      -[ServiceAccountPageViewController showViewController:sender:](self, "showViewController:sender:", v12, self);
    }

  }
  else
  {
    objc_initWeak(&location, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController configurationPromise](self, "configurationPromise"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100015A10;
    v14[3] = &unk_100049880;
    objc_copyWeak(&v16, &location);
    v15 = v4;
    objc_msgSend(v13, "addFinishBlock:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (void)applicationWillEnterForeground
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController underlyingViewController](self, "underlyingViewController"));
  v2 = objc_opt_class(SUNavigationContainerViewController);
  if ((objc_opt_isKindOfClass(v7, v2) & 1) != 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "embeddedViewController"));

    v7 = (id)v3;
  }
  v4 = objc_opt_class(SUStorePageViewController);
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
  {
    v5 = v7;
    objc_msgSend(v5, "applicationWillEnterForeground");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeChildViewController"));

    objc_msgSend(v6, "applicationWillEnterForeground");
  }

}

- (void)applicationDidEnterBackground
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController underlyingViewController](self, "underlyingViewController"));
  v2 = objc_opt_class(SUNavigationContainerViewController);
  if ((objc_opt_isKindOfClass(v7, v2) & 1) != 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "embeddedViewController"));

    v7 = (id)v3;
  }
  v4 = objc_opt_class(SUStorePageViewController);
  if ((objc_opt_isKindOfClass(v7, v4) & 1) != 0)
  {
    v5 = v7;
    objc_msgSend(v5, "applicationDidEnterBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeChildViewController"));

    objc_msgSend(v6, "applicationDidEnterBackground");
  }

}

- (void)performRedeemOperationWithCode:(id)a3 cameraRecognized:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  SKUIRedeemCameraViewController **p_redeemCameraViewController;
  id WeakRetained;
  id v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  p_redeemCameraViewController = &self->_redeemCameraViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_redeemCameraViewController);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)p_redeemCameraViewController);
    objc_msgSend(v11, "performRedeemOperationWithCode:cameraRecognized:completion:", v12, v6, v8);

  }
}

- (void)bridgedRightButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController underlyingViewController](self, "underlyingViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "su_bridgedNavigationItem"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightBarButtonItem"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "target"));
    objc_msgSend(v5, "performSelector:", objc_msgSend(v6, "action"));

  }
}

- (void)dismissPresentingBridgedViewController
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController presentingBridgedViewController](self, "presentingBridgedViewController"));

    if (v3)
    {
      objc_initWeak(&location, self);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_100015EFC;
      v4[3] = &unk_100048FD0;
      objc_copyWeak(&v5, &location);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

- (void)redeemCameraCodeDetected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController redeemCameraScriptObject](self, "redeemCameraScriptObject"));
  objc_msgSend(v5, "codeDetected:", v4);

}

- (void)keyboardDidChangeFrame:(CGRect)a3 animationCurve:(int64_t)a4 duration:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v13[0] = UIKeyboardFrameEndUserInfoKey;
  v12 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v12, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
  v14[0] = v7;
  v13[1] = UIKeyboardAnimationCurveUserInfoKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v14[1] = v8;
  v13[2] = UIKeyboardAnimationDurationUserInfoKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v14[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:userInfo:", SUKeyboardDidChangeNotification, 0, v10);

}

- (void)keyboardWillChangeFrame:(CGRect)a3 animationCurve:(int64_t)a4 duration:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v12;
  _QWORD v13[3];
  _QWORD v14[3];

  v13[0] = UIKeyboardFrameEndUserInfoKey;
  v12 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", &v12, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
  v14[0] = v7;
  v13[1] = UIKeyboardAnimationCurveUserInfoKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v14[1] = v8;
  v13[2] = UIKeyboardAnimationDurationUserInfoKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v14[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:userInfo:", SUKeyboardWillChangeNotification, 0, v10);

}

- (void)setReferrer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController clientInterface](self, "clientInterface"));
  objc_msgSend(v5, "setHostApplicationIdentifier:", v4);

}

- (void)overrideIPadRedeemCamera:(id)a3 completion:(id)a4
{
  SKUIRedeemCameraViewController **p_redeemCameraViewController;
  id v7;
  id v8;

  p_redeemCameraViewController = &self->_redeemCameraViewController;
  v7 = a4;
  objc_storeWeak((id *)p_redeemCameraViewController, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v8, "overrideRedeemCameraWithCompletion:", v7);

}

- (void)clientInterface:(id)a3 overrideCreditCardPresentationFromViewController:(id)a4 completion:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v7, "overrideCreditCardPresentationWithCompletion:", v6);

}

- (void)clientInterface:(id)a3 overrideRedeemCameraPerformAction:(int64_t)a4 withObject:(id)a5
{
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a5;
  if (a4 == 1)
  {
    v7 = objc_opt_class(SUScriptRedeemCameraViewController);
    if ((objc_opt_isKindOfClass(v9, v7) & 1) != 0)
      -[ServiceAccountPageViewController setRedeemCameraScriptObject:](self, "setRedeemCameraScriptObject:", v9);

    v9 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v8, "overrideRedeemCameraPerformAction:withObject:", a4, v9);

}

- (void)clientInterface:(id)a3 financeInterruptionResolved:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy", a3));
  objc_msgSend(v5, "financeInterruptionResolved:", v4);

}

- (void)clientInterfaceDidFinishLoading:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  self->_finishedLoading = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController underlyingViewController](self, "underlyingViewController", a3));
  v5 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstViewController"));

    v4 = (void *)v6;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftBarButtonItems"));

  v9 = (char *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      v13 = 0;
      v14 = &v10[(_QWORD)v11];
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13), "tag") == (id)999)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leftBarButtonItems"));
          v17 = objc_msgSend(v16, "mutableCopy");

          objc_msgSend(v17, "removeObjectAtIndex:", &v13[(_QWORD)v11]);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationItem"));
          objc_msgSend(v18, "setLeftBarButtonItems:animated:", v17, 1);

          goto LABEL_13;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = (char *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v11 = v14;
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v19, "didFinishLoading");

}

- (void)_cancelButtonAction:(id)a3
{
  -[ServiceAccountPageViewController dismissHostViewControllerWithResult:error:](self, "dismissHostViewControllerWithResult:error:", 0, 0);
}

- (id)_preloadConfiguration
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v2 = objc_alloc_init((Class)SSPromise);
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100016710;
  v15 = sub_100016720;
  v16 = objc_alloc_init((Class)SKUIConfigurationPreloader);
  v3 = (void *)v12[5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016728;
  v8[3] = &unk_1000498A8;
  v4 = v2;
  v9 = v4;
  v10 = &v11;
  objc_msgSend(v3, "preloadConfigurationForPurpose:withCompletionBlock:", 0, v8);
  v5 = v9;
  v6 = v4;

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_bagKeyForConfigURLString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];

  v7[0] = SKAccountPagePaymentsShippingURLString;
  v7[1] = SKAccountPageManageSubscriptionsURLString;
  v8[0] = CFSTR("paymentsAndShippingUrl");
  v8[1] = CFSTR("manageSubscriptionsUrl");
  v7[2] = SKAccountPageEditBillingURLString;
  v8[2] = CFSTR("editBillingUrl");
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  return v5;
}

- (void)_loadURLWithActiveConfiguration:(id)a3
{
  void *v4;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  ServiceSKUIRedeemViewController *v21;
  ServiceSKUIGiftViewController *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *i;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  unsigned int v56;
  ServiceSKUIDonationViewController *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  id v68;
  void *v69;
  void *v70;
  ServiceSKUIGiftViewController *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  ServiceSKUIRedeemViewController *v86;
  _BYTE v87[128];
  _BYTE location[12];
  __int16 v89;
  void *v90;

  v77 = a3;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v5 |= 2u;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "OSLogObject"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v7 = v5;
  else
    v7 = v5 & 2;
  if ((_DWORD)v7)
  {
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = objc_opt_class(self);
    v89 = 2112;
    v90 = v75;
    v8 = *(id *)&location[4];
    v9 = (void *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v6, 0, "%{public}@: Setting service host registry bundleID: %@", location, 22);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4));
      free(v9);
      v72 = v10;
      SSFileLog(v4, CFSTR("%@"));

    }
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceHostRegistry sharedInstance](ServiceHostRegistry, "sharedInstance"));
  objc_msgSend(v11, "setRegisteredHostBundleId:", v75);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "path"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _bagKeyForConfigURLString:](self, "_bagKeyForConfigURLString:", v12));

  if (v76)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "OSLogObject", v72));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v17 = v15;
    else
      v17 = v15 & 2;
    if ((_DWORD)v17)
    {
      v18 = (void *)objc_opt_class(self);
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v18;
      v89 = 2112;
      v90 = v76;
      v19 = v18;
      LODWORD(v73) = 22;
      v20 = (void *)_os_log_send_and_compose_impl(v17, 0, 0, 0, &_mh_execute_header, v16, 0, "%{public}@: Using config URL/bag key mapping: %@", location, v73);

      if (!v20)
      {
LABEL_21:

        v21 = (ServiceSKUIRedeemViewController *)objc_alloc_init((Class)SSURLBag);
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_100017440;
        v84[3] = &unk_1000498F8;
        v85 = (id)objc_claimAutoreleasedReturnValue(+[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self));
        v22 = (ServiceSKUIGiftViewController *)v85;
        -[ServiceSKUIRedeemViewController loadValueForKey:completionBlock:](v21, "loadValueForKey:completionBlock:", v76, v84);

        goto LABEL_63;
      }
      v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4));
      free(v20);
      SSFileLog(v13, CFSTR("%@"));
    }

    goto LABEL_21;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "pathComponents"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
  v25 = objc_msgSend(v24, "isEqual:", SKAccountPageRedeemURLString);

  if (v25)
  {
    v21 = -[ServiceSKUIRedeemViewController initWithRedeemCategory:]([ServiceSKUIRedeemViewController alloc], "initWithRedeemCategory:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceClientContext defaultContext](ServiceClientContext, "defaultContext"));
    -[ServiceSKUIRedeemViewController setClientContext:](v21, "setClientContext:", v26);

    -[ServiceSKUIRedeemViewController setClientInterface:](v21, "setClientInterface:", self->_clientInterface);
    -[ServiceSKUIRedeemViewController setEmbeddedParent:](v21, "setEmbeddedParent:", self);
    -[ServiceSKUIRedeemViewController setCameraDelegate:](v21, "setCameraDelegate:", self);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "pathComponents"));
    v28 = (unint64_t)objc_msgSend(v27, "count") > 1;

    if (v28)
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "pathComponents"));
      v22 = (ServiceSKUIGiftViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectAtIndexedSubscript:", 1));
    }
    else
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v77, 1));
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "queryItems"));
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v81;
        while (2)
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(_QWORD *)v81 != v49)
              objc_enumerationMutation(v47);
            v51 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "name", v72));
            v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("code"));

            if (v53)
            {
              v22 = (ServiceSKUIGiftViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "value"));
              goto LABEL_41;
            }
          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v80, v87, 16);
          if (v48)
            continue;
          break;
        }
      }
      v22 = 0;
LABEL_41:

    }
    if (v22)
    {
      -[ServiceSKUIRedeemViewController setInitialCode:](v21, "setInitialCode:", v22);
      -[ServiceSKUIRedeemViewController setAttempsAutomaticRedeem:](v21, "setAttempsAutomaticRedeem:", 1);
    }
    -[ServiceAccountPageViewController setUnderlyingViewController:](self, "setUnderlyingViewController:", v21, v72);
    -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v21);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "pathComponents"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstObject"));
    v31 = objc_msgSend(v30, "isEqual:", SKAccountPageGiftURLString);

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "pathComponents"));
      v33 = (unint64_t)objc_msgSend(v32, "count") > 1;

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "pathComponents"));
        v21 = (ServiceSKUIRedeemViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectAtIndexedSubscript:", 1));

        v22 = (ServiceSKUIGiftViewController *)objc_alloc_init((Class)SSLookupRequest);
        -[ServiceSKUIGiftViewController setKeyProfile:](v22, "setKeyProfile:", SSLookupKeyProfileLockup);
        v86 = v21;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));
        -[ServiceSKUIGiftViewController setValue:forRequestParameter:](v22, "setValue:forRequestParameter:", v35, SSLookupParameterItemIdentifiers);

        -[ServiceSKUIGiftViewController setValue:forRequestParameter:](v22, "setValue:forRequestParameter:", CFSTR("2"), SSLookupParameterProtocolVersion);
        objc_initWeak((id *)location, self);
        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472;
        v78[2] = sub_100017830;
        v78[3] = &unk_100049920;
        objc_copyWeak(&v79, (id *)location);
        -[ServiceSKUIGiftViewController startWithLookupBlock:](v22, "startWithLookupBlock:", v78);
        objc_destroyWeak(&v79);
        objc_destroyWeak((id *)location);
      }
      else
      {
        v21 = (ServiceSKUIRedeemViewController *)objc_msgSend(objc_alloc((Class)SKUIGift), "initWithGiftCategory:", 0);
        v22 = -[ServiceSKUIGiftViewController initWithGift:]([ServiceSKUIGiftViewController alloc], "initWithGift:", v21);
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceClientContext defaultContext](ServiceClientContext, "defaultContext"));
        -[ServiceSKUIGiftViewController setClientContext:](v22, "setClientContext:", v54);

        -[ServiceSKUIGiftViewController setEmbeddedParent:](v22, "setEmbeddedParent:", self);
        -[ServiceAccountPageViewController setUnderlyingViewController:](self, "setUnderlyingViewController:", v22);
        -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v22);
      }
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "path"));
      v37 = objc_msgSend(v36, "isEqual:", SKAccountPageCustomURLString);

      if (v37)
      {
        v21 = (ServiceSKUIRedeemViewController *)objc_msgSend(v77, "copyQueryStringDictionaryWithUnescapedValues:", 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSKUIRedeemViewController objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("url")));
        v22 = (ServiceSKUIGiftViewController *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v38));

        if (v22)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSKUIRedeemViewController objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("shouldSignRequests")));
          v40 = objc_msgSend(v39, "BOOLValue");

          v41 = objc_alloc_init((Class)SUWebViewController);
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController account](self, "account"));
          objc_msgSend(v41, "setAccount:", v42);

          objc_msgSend(v41, "setStyle:", 0);
          objc_msgSend(v41, "setShouldSignRequests:", v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "webView"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "scrollView"));
          objc_msgSend(v44, "_setContentInsetAdjustmentBehavior:", 0);

          objc_msgSend(v41, "reloadWithStorePage:forURL:", 0, v22);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "webView"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v22));
          objc_msgSend(v45, "loadRequest:", v46);

          -[ServiceAccountPageViewController _presentViewController:](self, "_presentViewController:", v41);
        }
        else
        {
          v59 = SSError(SKUIErrorDomain, 4, 0, 0);
          v41 = (id)objc_claimAutoreleasedReturnValue(v59);
          -[ServiceAccountPageViewController dismissHostViewControllerWithResult:error:](self, "dismissHostViewControllerWithResult:error:", 0, v41);
        }

      }
      else
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "path"));
        v56 = objc_msgSend(v55, "isEqual:", SKAccountPageCharityURLString);

        if (v56)
        {
          v21 = (ServiceSKUIRedeemViewController *)objc_msgSend(v77, "copyQueryStringDictionaryWithUnescapedValues:", 1);
          v22 = (ServiceSKUIGiftViewController *)objc_claimAutoreleasedReturnValue(-[ServiceSKUIRedeemViewController objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("id")));
          v57 = -[ServiceSKUIDonationViewController initWithCharityIdentifier:]([ServiceSKUIDonationViewController alloc], "initWithCharityIdentifier:", v22);
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceClientContext defaultContext](ServiceClientContext, "defaultContext"));
          -[ServiceSKUIDonationViewController setClientContext:](v57, "setClientContext:", v58);

          -[ServiceSKUIDonationViewController setEmbeddedParent:](v57, "setEmbeddedParent:", self);
          -[ServiceAccountPageViewController setUnderlyingViewController:](self, "setUnderlyingViewController:", v57);
          -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v57);

        }
        else
        {
          if (v77)
          {
            v21 = -[ServiceSUAccountViewController initWithExternalAccountURL:]([ServiceSUAccountViewController alloc], "initWithExternalAccountURL:", v77);
          }
          else
          {
            v21 = objc_alloc_init(ServiceSUAccountViewController);
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "activeAccount"));
            v62 = v61 == 0;

            if (v62)
              -[ServiceSKUIRedeemViewController setStyle:](v21, "setStyle:", 1);
            else
              -[ServiceSKUIRedeemViewController setStyle:](v21, "setStyle:", 2);
          }
          if ((objc_opt_respondsToSelector(v21, "setShowAccountGlyph:") & 1) != 0)
            -[ServiceSKUIRedeemViewController setShowAccountGlyph:](v21, "setShowAccountGlyph:", -[ServiceAccountPageViewController showAccountGlyph](self, "showAccountGlyph"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController clientInterface](self, "clientInterface", v72));
          objc_msgSend(v63, "setShowDialogOnError:", 1);

          -[ServiceSKUIRedeemViewController setClientInterface:](v21, "setClientInterface:", self->_clientInterface);
          -[ServiceSKUIRedeemViewController setEmbeddedParent:](v21, "setEmbeddedParent:", self);
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSKUIRedeemViewController authenticationContext](v21, "authenticationContext"));
          v22 = (ServiceSKUIGiftViewController *)objc_msgSend(v64, "mutableCopy");

          if (!v22)
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController account](self, "account"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "ams_DSID"));
            v67 = v66 == 0;

            v68 = objc_alloc((Class)SSMutableAuthenticationContext);
            if (v67)
            {
              v69 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "activeAccount"));
              v71 = (ServiceSKUIGiftViewController *)objc_msgSend(v68, "initWithAccount:", v70);
            }
            else
            {
              v69 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController account](self, "account"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "ams_DSID"));
              v71 = (ServiceSKUIGiftViewController *)objc_msgSend(v68, "initWithAccountIdentifier:", v70);
            }
            v22 = v71;

          }
          -[ServiceSKUIGiftViewController setDisplaysOnLockScreen:](v22, "setDisplaysOnLockScreen:", 1);
          -[ServiceSKUIRedeemViewController setAuthenticationContext:](v21, "setAuthenticationContext:", v22);
          -[ServiceAccountPageViewController setPresentedAccountViewController:](self, "setPresentedAccountViewController:", v21);
          -[ServiceAccountPageViewController _presentViewController:](self, "_presentViewController:", v21);
        }
      }
    }
  }
LABEL_63:

}

- (void)_presentViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  ServiceSUNavigationController *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)SUNavigationContainerViewController), "initWithChildViewController:", v4);
  if ((id)-[ServiceAccountPageViewController type](self, "type") == (id)1)
  {
    objc_msgSend(v5, "setBridgedNavigation:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedNavigationController sharedController](ServiceBridgedNavigationController, "sharedController"));
    objc_msgSend(v6, "setupWithContainerViewController:", v5);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController navigationController](self, "navigationController"));

  if (v7)
  {
    -[ServiceAccountPageViewController setUnderlyingViewController:](self, "setUnderlyingViewController:", v4);
    -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v5);
  }
  else
  {
    v8 = -[ServiceSUNavigationController initWithRootViewController:]([ServiceSUNavigationController alloc], "initWithRootViewController:", v5);
    -[ServiceSUNavigationController setEmbeddedParent:](v8, "setEmbeddedParent:", self);
    -[ServiceAccountPageViewController setUnderlyingViewController:](self, "setUnderlyingViewController:", v4);
    -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v8);

  }
  v9 = dispatch_time(0, 3000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100017B90;
  v11[3] = &unk_100049590;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);

}

- (void)_presentErrorViewControllerWithError:(id)a3
{
  id v4;
  void *v5;
  ServiceErrorViewController *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  id v13;
  ServiceErrorViewController *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  self->_finishedLoading = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAccountPageViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v5, "didFinishLoading");

  objc_initWeak(&location, self);
  v6 = [ServiceErrorViewController alloc];
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKUIURL));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANNOT_CONNECT_TO_ITUNES_STORE"), &stru_10004A1F0, 0));
  v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SKUIURL));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_10004A1F0, 0));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100017E24;
  v15[3] = &unk_100049730;
  objc_copyWeak(&v17, &location);
  v13 = v4;
  v16 = v13;
  v14 = -[ServiceErrorViewController initWithTitle:message:buttonTitle:actionBlock:](v6, "initWithTitle:message:buttonTitle:actionBlock:", v9, 0, v12, v15);

  -[ServiceAccountPageViewController setChildViewController:](self, "setChildViewController:", v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
  objc_storeStrong((id *)&self->_clientInterface, a3);
}

- (SUNavigationController)containerNavigationController
{
  return self->_containerNavigationController;
}

- (void)setContainerNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_containerNavigationController, a3);
}

- (BOOL)finishedLoading
{
  return self->_finishedLoading;
}

- (void)setFinishedLoading:(BOOL)a3
{
  self->_finishedLoading = a3;
}

- (ServiceAccountPageEmbedded)underlyingViewController
{
  return self->_underlyingViewController;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (SSPromise)configurationPromise
{
  return self->_configurationPromise;
}

- (void)setConfigurationPromise:(id)a3
{
  objc_storeStrong((id *)&self->_configurationPromise, a3);
}

- (SUAccountViewController)presentedAccountViewController
{
  return self->_presentedAccountViewController;
}

- (void)setPresentedAccountViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedAccountViewController, a3);
}

- (BOOL)showAccountGlyph
{
  return self->_showAccountGlyph;
}

- (void)setShowAccountGlyph:(BOOL)a3
{
  self->_showAccountGlyph = a3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)loadFromBridgedNavigation
{
  return self->_loadFromBridgedNavigation;
}

- (void)setLoadFromBridgedNavigation:(BOOL)a3
{
  self->_loadFromBridgedNavigation = a3;
}

- (CGRect)presentationBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationBounds.origin.x;
  y = self->_presentationBounds.origin.y;
  width = self->_presentationBounds.size.width;
  height = self->_presentationBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationBounds:(CGRect)a3
{
  self->_presentationBounds = a3;
}

- (SUScriptRedeemCameraViewController)redeemCameraScriptObject
{
  return (SUScriptRedeemCameraViewController *)objc_loadWeakRetained((id *)&self->_redeemCameraScriptObject);
}

- (void)setRedeemCameraScriptObject:(id)a3
{
  objc_storeWeak((id *)&self->_redeemCameraScriptObject, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (UIViewController)presentingBridgedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingBridgedViewController);
}

- (void)setPresentingBridgedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingBridgedViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingBridgedViewController);
  objc_destroyWeak((id *)&self->_redeemCameraScriptObject);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_presentedAccountViewController, 0);
  objc_storeStrong((id *)&self->_configurationPromise, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_underlyingViewController, 0);
  objc_storeStrong((id *)&self->_containerNavigationController, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_destroyWeak((id *)&self->_redeemCameraViewController);
}

@end
