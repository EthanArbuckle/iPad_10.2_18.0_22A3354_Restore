@implementation ServiceStoreProductViewController

- (ServiceStoreProductViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ServiceStoreProductViewController *v4;
  id v5;
  SKUIApplicationController *v6;
  SKUIApplicationController *applicationController;
  id v8;
  SKUIApplicationController *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  UINavigationController *v17;
  UINavigationController *loadingPlaceholderViewController;
  ServiceProductPageConfiguration *v19;
  ServiceProductPageConfiguration *pageConfiguration;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *logKey;
  objc_super v27;
  id v28;

  v27.receiver = self;
  v27.super_class = (Class)ServiceStoreProductViewController;
  v4 = -[ServiceStoreProductViewController initWithNibName:bundle:](&v27, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)SKUIMutableApplicationControllerOptions);
    objc_msgSend(v5, "setPageRenderMetricsEnabled:", 1);
    v6 = (SKUIApplicationController *)objc_msgSend(objc_alloc((Class)SKUIApplicationController), "initWithClientContextClass:options:", objc_opt_class(ServiceClientContext), v5);
    applicationController = v4->_applicationController;
    v4->_applicationController = v6;

    -[SKUIApplicationController setDelegate:](v4->_applicationController, "setDelegate:", v4);
    -[SKUIApplicationController _setHidesTabBar:](v4->_applicationController, "_setHidesTabBar:", 1);
    v8 = objc_msgSend(objc_alloc((Class)SKUITabBarItem), "initWithTabIdentifier:", CFSTR("main"));
    v9 = v4->_applicationController;
    v28 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    -[SKUIApplicationController setTabBarItems:](v9, "setTabBarItems:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController clientContext](v4->_applicationController, "clientContext"));
    v12 = -[ServiceStoreProductViewController _newCancelButtonItemWithClientContext:](v4, "_newCancelButtonItemWithClientContext:", v11);

    v13 = objc_alloc_init((Class)UIViewController);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationItem"));
    objc_msgSend(v14, "setLeftBarButtonItem:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v15, "setBackgroundColor:", v16);

    v17 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v13);
    loadingPlaceholderViewController = v4->_loadingPlaceholderViewController;
    v4->_loadingPlaceholderViewController = v17;

    v19 = objc_alloc_init(ServiceProductPageConfiguration);
    pageConfiguration = v4->_pageConfiguration;
    v4->_pageConfiguration = v19;

    -[ServiceProductPageConfiguration setShowsStoreButton:](v4->_pageConfiguration, "setShowsStoreButton:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("-")));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
    logKey = v4->_logKey;
    v4->_logKey = (NSString *)v24;

  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  ServiceStoreProductViewController *v9;
  id v10;
  id location;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController rootViewController](self->_applicationController, "rootViewController"));
  self->_didShow = 1;
  -[ServiceStoreProductViewController _sendInstallAttributionIfAllowed](self, "_sendInstallAttributionIfAllowed");
  if ((SKUIViewControllerIsDescendent(v5, self) & 1) == 0)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100012FC4;
    v7[3] = &unk_100049620;
    objc_copyWeak(&v10, &location);
    v8 = v5;
    v9 = self;
    -[ServiceStoreProductViewController _presentOnboardingIfNeededWithCompletion:](self, "_presentOnboardingIfNeededWithCompletion:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  v6.receiver = self;
  v6.super_class = (Class)ServiceStoreProductViewController;
  -[ServiceStoreProductViewController viewDidAppear:](&v6, "viewDidAppear:", v3);

}

- (void)viewDidLayoutSubviews
{
  UINavigationController *loadingPlaceholderViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  loadingPlaceholderViewController = self->_loadingPlaceholderViewController;
  if (loadingPlaceholderViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController parentViewController](loadingPlaceholderViewController, "parentViewController"));

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController rootViewController](self->_applicationController, "rootViewController"));
      objc_msgSend(v5, "addChildViewController:", self->_loadingPlaceholderViewController);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_loadingPlaceholderViewController, "view"));
      objc_msgSend(v7, "setAutoresizingMask:", 18);
      objc_msgSend(v6, "bounds");
      objc_msgSend(v7, "setFrame:");
      objc_msgSend(v6, "addSubview:", v7);

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)ServiceStoreProductViewController;
  -[ServiceStoreProductViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!self->_preview)
    -[SKUIApplicationController _resetDocumentControllers](self->_applicationController, "_resetDocumentControllers");
  v5.receiver = self;
  v5.super_class = (Class)ServiceStoreProductViewController;
  -[ServiceStoreProductViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIApplicationController _stopApplication](self->_applicationController, "_stopApplication");
  -[SKUIApplicationController setDelegate:](self->_applicationController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ServiceStoreProductViewController;
  -[ServiceStoreProductViewController dealloc](&v3, "dealloc");
}

- (void)loadProductWithParameters:(id)a3
{
  id v4;
  NSString *logKey;
  int v6;
  ServiceStoreProductViewController *v7;
  __int16 v8;
  NSString *v9;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Loading product with page parameters.", (uint8_t *)&v6, 0x16u);
  }
  -[ServiceProductPageConfiguration setProductParameters:](self->_pageConfiguration, "setProductParameters:", v4);
  -[ServiceStoreProductViewController _startIfReady](self, "_startIfReady");

}

- (void)_startIfReady
{
  id v3;
  id v4;
  id v5;
  void *v6;

  if (!self->_didStart
    && -[ServiceStoreProductViewController isViewLoaded](self, "isViewLoaded")
    && -[ServiceProductPageConfiguration isLoadable](self->_pageConfiguration, "isLoadable"))
  {
    v3 = -[SKUIApplicationController _applicationMode](self->_applicationController, "_applicationMode");
    if (v3 == (id)2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000298D4();
      v5 = objc_alloc((Class)NSError);
      v4 = objc_msgSend(v5, "initWithDomain:code:userInfo:", SKUIErrorDomain, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
      objc_msgSend(v6, "loadDidFinishWithResult:error:", &__kCFBooleanFalse, v4);

    }
    else if (v3 == (id)1)
    {
      v4 = -[ServiceProductPageConfiguration copyITMLOptionsDictionary](self->_pageConfiguration, "copyITMLOptionsDictionary");
      -[SKUIApplicationController resumeApplicationWithOptions:](self->_applicationController, "resumeApplicationWithOptions:", v4);
    }
    else
    {
      if (v3)
      {
LABEL_13:
        self->_didStart = 1;
        return;
      }
      v4 = -[ServiceProductPageConfiguration copyITMLOptionsDictionary](self->_pageConfiguration, "copyITMLOptionsDictionary");
      -[SKUIApplicationController loadApplicationWithOptions:](self->_applicationController, "loadApplicationWithOptions:", v4);
    }

    goto LABEL_13;
  }
}

- (id)_clientViewControllerProxy
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serviceProductPageViewControllerClientProxy"));

  return v3;
}

- (void)_sendInstallAttributionIfAllowed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *logKey;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  ServiceStoreProductViewController *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  if (self->_didLoad && self->_didShow)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceProductPageConfiguration productParameters](self->_pageConfiguration, "productParameters"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterAdNetworkIdentifier));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemID"));
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      if (v8)
      {
        v22 = v4;
        v23 = v6;
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterITunesItemIdentifier));
        v21 = v5;
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterAdNetworkCampaignIdentifier));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterAdNetworkNonce));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterAdNetworkTimestamp));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterAdNetworkAttributionSignature));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterAdNetworkVersion));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", SKStoreProductParameterAdNetworkSourceAppStoreIdentifier));
        v16 = (void *)objc_opt_new(ASDInstallAttributionParamsConfig);
        v24 = (void *)v9;
        v17 = v9;
        v18 = (void *)v10;
        v5 = v21;
        objc_msgSend(v16, "setAppAdamId:", v17);
        objc_msgSend(v16, "setAdNetworkId:", CFSTR("com.apple.advp"));
        objc_msgSend(v16, "setCampaignId:", v18);
        objc_msgSend(v16, "setImpressionId:", v11);
        objc_msgSend(v16, "setSourceAppAdamId:", v15);
        objc_msgSend(v16, "setTimestamp:", v12);
        objc_msgSend(v16, "setAttributionSignature:", v13);
        objc_msgSend(v16, "setSourceAppBundleId:", v21);
        objc_msgSend(v16, "setOverrideCampaignLimit:", 0);
        objc_msgSend(v16, "setVersion:", v14);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          logKey = self->_logKey;
          *(_DWORD *)buf = 138544130;
          v26 = self;
          v27 = 2114;
          v28 = logKey;
          v29 = 2114;
          v30 = v21;
          v31 = 2114;
          v32 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: SKAdNetwork - Adding install attribution params for source app bundle ID: %{public}@ adam ID: %{public}@", buf, 0x2Au);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[ASDInstallAttribution sharedInstance](ASDInstallAttribution, "sharedInstance"));
        objc_msgSend(v20, "addInstallAttributionParamsWithConfig:", v16);

        v4 = v22;
        v6 = v23;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1000299BC();
      }

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100029948();
    }

  }
}

- (id)_newCancelButtonItemWithClientContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)UIBarButtonItem);
  objc_msgSend(v5, "setAction:", "_cancelButtonAction:");
  v6 = objc_msgSend(v5, "setTarget:", self);
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:", CFSTR("CLOSE_SHEET_BUTTON")));
    objc_msgSend(v5, "setTitle:", v7);
  }
  else
  {
    v8 = SKUIBundle(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CLOSE_SHEET_BUTTON"), &stru_10004A1F0, 0));
    objc_msgSend(v5, "setTitle:", v9);

  }
  return v5;
}

- (void)_cancelButtonAction:(id)a3
{
  -[ServiceStoreProductViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 0);
}

- (void)_presentOnboardingIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  ServiceStoreProductViewController *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  ServiceStoreProductViewController *v22;
  void (**v23)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if ((objc_msgSend(sub_100013A40(), "shouldShowOnboarding") & 1) != 0)
  {
    if (!self->_presentingOnboarding
      && -[ServiceStoreProductViewController shouldShowOnboarding](self, "shouldShowOnboarding"))
    {
      self->_presentingOnboarding = 1;
      v5 = self;
      v6 = sub_100013A40();
      v18 = _NSConcreteStackBlock;
      v19 = 3221225472;
      v20 = sub_100013AF8;
      v21 = &unk_100049818;
      v22 = v5;
      v23 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForMediaType:completion:", 0, &v18));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view", v18, v19, v20, v21, v22));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController view](v5, "view"));
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v8, "frame");
      -[ServiceStoreProductViewController addChildViewController:](v5, "addChildViewController:", v7);
      objc_msgSend(v8, "setAutoresizingMask:", 18);
      objc_msgSend(v8, "setFrame:", v11, 0.0, v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController view](v5, "view"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
      objc_msgSend(v16, "addSubview:", v17);

      objc_msgSend(v7, "didMoveToParentViewController:", v5);
    }
  }
  else
  {
    v4[2](v4);
  }

}

- (id)legacyScriptInterfaceForApplication:(id)a3
{
  return objc_alloc_init((Class)SKScriptInterface);
}

- (void)application:(id)a3 didCompletePurchase:(id)a4
{
  self->_didPurchase = 1;
}

- (void)application:(id)a3 didCompleteSoftwarePurchase:(id)a4
{
  self->_didPurchase = 1;
}

- (void)application:(id)a3 didFailToLoadWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100029A30();
  v8 = objc_alloc((Class)_UIContentUnavailableView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clientContext"));
  v10 = SKUIErrorDocumentTitle();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v8, "initWithFrame:title:style:", v11, 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_loadingPlaceholderViewController, "topViewController"));
  objc_msgSend(v13, "setView:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v14, "loadDidFinishWithResult:error:", &__kCFBooleanFalse, v7);

}

- (void)application:(id)a3 didStopWithOptions:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *logKey;
  int v9;
  ServiceStoreProductViewController *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  void *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKey:", CFSTR("type")));
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("close")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("download-complete")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("goto-store")) & 1) != 0
           || (objc_msgSend(v5, "isEqualToString:", CFSTR("goto-url")) & 1) != 0)
    {
      v7 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("purchased")) & 1) != 0)
    {
      v7 = 4;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("right")))
    {
      v7 = 5;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = logKey;
    v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product load stopped with type: %{public}@.", (uint8_t *)&v9, 0x20u);
  }
  -[ServiceStoreProductViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", v7);

}

- (void)applicationDidDisplayFirstPage:(id)a3
{
  NSString *logKey;
  void *v5;
  UINavigationController *loadingPlaceholderViewController;
  void *v7;
  int v8;
  ServiceStoreProductViewController *v9;
  __int16 v10;
  NSString *v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product load completed.", (uint8_t *)&v8, 0x16u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](self->_loadingPlaceholderViewController, "view"));
  objc_msgSend(v5, "removeFromSuperview");

  -[UINavigationController removeFromParentViewController](self->_loadingPlaceholderViewController, "removeFromParentViewController");
  loadingPlaceholderViewController = self->_loadingPlaceholderViewController;
  self->_loadingPlaceholderViewController = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v7, "loadDidFinishWithResult:error:", &__kCFBooleanTrue, 0);

  self->_didLoad = 1;
  -[ServiceStoreProductViewController _sendInstallAttributionIfAllowed](self, "_sendInstallAttributionIfAllowed");
}

- (void)_sendDidFinishWithResult:(int64_t)a3
{
  NSString *logKey;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  ServiceStoreProductViewController *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  int64_t v14;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = logKey;
    v13 = 2048;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product finished with result: %ld.", buf, 0x20u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController delegate](self, "delegate"));
  objc_msgSend(v6, "serviceProductPageViewControllerFinishWithResult:", a3);

  -[SKUIApplicationController _resetDocumentControllers](self->_applicationController, "_resetDocumentControllers");
  v7 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014268;
  block[3] = &unk_1000490B8;
  block[4] = self;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)finishImmediately
{
  -[ServiceStoreProductViewController _sendDidFinishWithResult:](self, "_sendDidFinishWithResult:", 4 * self->_didPurchase);
}

- (void)finishStarRatingPromptWithRating:(id)a3
{
  void (**starRatingCompletionBlock)(id, _BOOL8);
  _BOOL8 v5;
  id v6;

  starRatingCompletionBlock = (void (**)(id, _BOOL8))self->_starRatingCompletionBlock;
  if (starRatingCompletionBlock)
  {
    v5 = a3 != 0;
    objc_msgSend(a3, "floatValue");
    starRatingCompletionBlock[2](starRatingCompletionBlock, v5);
    v6 = self->_starRatingCompletionBlock;
    self->_starRatingCompletionBlock = 0;

  }
}

- (void)loadProductWithPageDictionary:(id)a3
{
  id v4;
  NSString *logKey;
  int v6;
  ServiceStoreProductViewController *v7;
  __int16 v8;
  NSString *v9;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Loading product with page dictionary.", (uint8_t *)&v6, 0x16u);
  }
  -[ServiceProductPageConfiguration setProductPageDictionary:](self->_pageConfiguration, "setProductPageDictionary:", v4);
  -[ServiceStoreProductViewController _startIfReady](self, "_startIfReady");

}

- (void)loadProductWithRequest:(id)a3
{
  id v4;
  NSString *logKey;
  id v6;
  void *v7;
  ServiceProductPageConfiguration *pageConfiguration;
  void *v9;
  int v10;
  ServiceStoreProductViewController *v11;
  __int16 v12;
  NSString *v13;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    v10 = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = logKey;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Loading product with encoded request.", (uint8_t *)&v10, 0x16u);
  }
  v6 = objc_msgSend(objc_alloc((Class)SKStorePageRequest), "initWithXPCEncoding:", v4);
  -[ServiceProductPageConfiguration setProductPageStyle:](self->_pageConfiguration, "setProductPageStyle:", objc_msgSend(v6, "productPageStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productURL"));
  pageConfiguration = self->_pageConfiguration;
  if (v7)
  {
    -[ServiceProductPageConfiguration setProductURL:](pageConfiguration, "setProductURL:", v7);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productParameters"));
    -[ServiceProductPageConfiguration setProductParameters:](pageConfiguration, "setProductParameters:", v9);

  }
  -[ServiceStoreProductViewController _startIfReady](self, "_startIfReady");

}

- (void)loadProductWithURL:(id)a3
{
  void *v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100029AB0((uint64_t)self, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
  objc_msgSend(v5, "loadDidFinishWithResult:error:", &__kCFBooleanFalse, 0);

}

- (void)setAdditionalBuyParameters:(id)a3
{
  SKUIApplicationController *applicationController;
  id v4;
  id v5;

  applicationController = self->_applicationController;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController clientContext](applicationController, "clientContext"));
  objc_msgSend(v5, "_setAdditionalPurchaseParameters:", v4);

}

- (void)setAffiliateIdentifier:(id)a3
{
  SKUIApplicationController *applicationController;
  id v4;
  id v5;

  applicationController = self->_applicationController;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController clientContext](applicationController, "clientContext"));
  objc_msgSend(v5, "_setPurchaseAffiliateIdentifier:", v4);

}

- (void)setAskToBuy:(BOOL)a3
{
  -[ServiceProductPageConfiguration setParentalRequest:](self->_pageConfiguration, "setParentalRequest:", a3);
}

- (void)setCancelButtonTitle:(id)a3
{
  -[ServiceProductPageConfiguration setCancelButtonTitle:](self->_pageConfiguration, "setCancelButtonTitle:", a3);
}

- (void)setClientIdentifier:(id)a3
{
  SKUIApplicationController *applicationController;
  id v4;
  void *v5;
  id v6;

  applicationController = self->_applicationController;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController clientContext](applicationController, "clientContext"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientInterface"));

  objc_msgSend(v6, "setClientIdentifier:", v4);
}

- (void)setPreview:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(a3, "BOOLValue");
  self->_preview = (char)v4;
  -[UINavigationController setNavigationBarHidden:](self->_loadingPlaceholderViewController, "setNavigationBarHidden:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController clientContext](self->_applicationController, "clientContext"));
  objc_msgSend(v5, "sendAppPreviewStateChanged:", self->_preview);

}

- (void)setProductPageStyle:(id)a3
{
  -[ServiceProductPageConfiguration setProductPageStyle:](self->_pageConfiguration, "setProductPageStyle:", objc_msgSend(a3, "integerValue"));
}

- (void)setPromptString:(id)a3
{
  -[ServiceProductPageConfiguration setParentalRequestPromptString:](self->_pageConfiguration, "setParentalRequestPromptString:", a3);
}

- (void)setRightBarButtonTitle:(id)a3
{
  -[ServiceProductPageConfiguration setRightButtonTitle:](self->_pageConfiguration, "setRightButtonTitle:", a3);
}

- (void)setScriptContextDictionary:(id)a3
{
  -[ServiceProductPageConfiguration setScriptContextDictionary:](self->_pageConfiguration, "setScriptContextDictionary:", a3);
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  -[ServiceProductPageConfiguration setShowsRightButton:](self->_pageConfiguration, "setShowsRightButton:", a3);
}

- (void)setShowsStoreButton:(BOOL)a3
{
  -[ServiceProductPageConfiguration setShowsStoreButton:](self->_pageConfiguration, "setShowsStoreButton:", a3);
}

- (void)setupWithClientBundleID:(id)a3 bagType:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController clientContext](self->_applicationController, "clientContext"));
  v12 = v6;
  objc_msgSend(v7, "setHostApplicationIdentifier:", v12);
  -[ServiceProductPageConfiguration setHostApplicationIdentifier:](self->_pageConfiguration, "setHostApplicationIdentifier:", v12);
  if (v12)
  {
    v8 = objc_alloc_init((Class)SKUIURL);
    objc_msgSend(v8, "setReferrerApplicationName:", v12);
    objc_msgSend(v7, "setPurchaseReferrerURL:", v8);

  }
  objc_msgSend(v7, "_setPurchaseURLBagType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
  objc_msgSend(v7, "_setPurchaseAffiliateIdentifier:", v11);

}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKUIApplicationController rootViewController](self->_applicationController, "rootViewController"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    if (v13 != v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceStoreProductViewController transitionCoordinator](self, "transitionCoordinator"));
      objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v14, v13, v11);

    }
  }
  v15.receiver = self;
  v15.super_class = (Class)ServiceStoreProductViewController;
  -[ServiceStoreProductViewController willRotateToInterfaceOrientation:duration:](&v15, "willRotateToInterfaceOrientation:duration:", a3, a4);

}

- (ServiceStoreProductViewControllerDelegate)delegate
{
  return (ServiceStoreProductViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldShowOnboarding
{
  return self->_shouldShowOnboarding;
}

- (void)setShouldShowOnboarding:(BOOL)a3
{
  self->_shouldShowOnboarding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_pageConfiguration, 0);
  objc_storeStrong((id *)&self->_loadingPlaceholderViewController, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong(&self->_starRatingCompletionBlock, 0);
}

@end
