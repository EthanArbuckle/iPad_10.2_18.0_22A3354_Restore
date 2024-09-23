@implementation AMSUIWebViewController

- (AMSUIWebViewController)initWithBag:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  AMSUIWebViewController *v7;

  v4 = (void *)MEMORY[0x24BE08328];
  v5 = a3;
  objc_msgSend(v4, "currentProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSUIWebViewController initWithBag:account:clientInfo:](self, "initWithBag:account:clientInfo:", v5, 0, v6);

  return v7;
}

- (AMSUIWebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSUIWebViewController *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  AMSUIWebClientContext *v15;
  AMSUIWebClientContext *context;
  void *v17;
  AMSUIWebJSDataProvider *v18;
  AMSUIWebPageViewController *v19;
  AMSUIWebPageViewController *webPage;
  id v21;
  id v22;
  id v23;
  AMSUIWebPlaceholderViewController *v24;
  AMSUIWebContainerViewController *v25;
  void *v26;
  AMSUIWebContainerViewController *v27;
  AMSUIWebContainerViewController *rootContainer;
  AMSUIWebContainerViewController *v29;
  AMSUIWebFlowController *v30;
  AMSUIWebPluginLoader *v31;
  AMSUIWebPageViewController *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[AMSUIWebViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v11)
  {
    AMSSetLogKey();
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = objc_opt_class();
      v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing web view controller", buf, 0x16u);
    }

    v15 = -[AMSUIWebClientContext initWithAccount:clientInfo:backingBag:]([AMSUIWebClientContext alloc], "initWithAccount:clientInfo:backingBag:", v9, v10, v8);
    context = v11->_context;
    v11->_context = v15;

    -[AMSUIWebClientContext setActionDelegate:](v11->_context, "setActionDelegate:", v11);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08260]), "initWithContainerID:bag:", CFSTR("com.apple.AppleMediaServices"), v8);
    -[AMSUIWebClientContext setMetrics:](v11->_context, "setMetrics:", v17);

    -[AMSUIWebClientContext setLoadUsingWebKit:](v11->_context, "setLoadUsingWebKit:", 0);
    -[AMSUIWebClientContext setLogKey:](v11->_context, "setLogKey:", v12);
    v18 = -[AMSUIWebJSDataProvider initWithContext:]([AMSUIWebJSDataProvider alloc], "initWithContext:", v11->_context);
    -[AMSUIWebClientContext setDataProvider:](v11->_context, "setDataProvider:", v18);
    v19 = -[AMSUIWebPageViewController initWithContext:dataProvider:]([AMSUIWebPageViewController alloc], "initWithContext:dataProvider:", v11->_context, v18);
    -[AMSUIWebPageViewController setDelegate:](v19, "setDelegate:", v11);
    -[AMSUIWebClientContext setWebPage:](v11->_context, "setWebPage:", v19);
    v34 = (void *)v12;
    webPage = v11->_webPage;
    v11->_webPage = v19;
    v33 = v19;

    v21 = v8;
    v22 = v10;
    v23 = v9;
    v24 = -[AMSUIWebPlaceholderViewController initWithContext:]([AMSUIWebPlaceholderViewController alloc], "initWithContext:", v11->_context);
    -[AMSUIWebPlaceholderViewController setAnimateFadeIn:](v24, "setAnimateFadeIn:", 1);
    v25 = [AMSUIWebContainerViewController alloc];
    +[AMSUIWebAppearance defaultAppearance](AMSUIWebAppearance, "defaultAppearance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[AMSUIWebContainerViewController initWithViewController:appearance:navigationBar:context:](v25, "initWithViewController:appearance:navigationBar:context:", v24, v26, 0, v11->_context);

    -[AMSUIWebContainerViewController setShouldSkipInitialRefresh:](v27, "setShouldSkipInitialRefresh:", 1);
    rootContainer = v11->_rootContainer;
    v11->_rootContainer = v27;
    v29 = v27;

    v30 = -[AMSUIWebFlowController initWithRootContainer:context:]([AMSUIWebFlowController alloc], "initWithRootContainer:context:", v11->_rootContainer, v11->_context);
    -[AMSUIWebClientContext setFlowController:](v11->_context, "setFlowController:", v30);
    v31 = -[AMSUIWebPluginLoader initWithContext:]([AMSUIWebPluginLoader alloc], "initWithContext:", v11->_context);
    -[AMSUIWebClientContext setPluginLoader:](v11->_context, "setPluginLoader:", v31);

    v9 = v23;
    v10 = v22;
    v8 = v21;

  }
  return v11;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebViewController;
  -[AMSUICommonViewController loadView](&v13, sel_loadView);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 360.0, 500.0);

  -[AMSUIWebViewController rootContainer](self, "rootContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebViewController setChildViewController:](self, "setChildViewController:", v4);
  +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController ams_setBackgroundColor:](self, "ams_setBackgroundColor:", v5);

  -[AMSUIWebViewController childViewController](self, "childViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController ams_setChildViewController:](self, "ams_setChildViewController:", v6);

  if (objc_msgSend(MEMORY[0x24BE08100], "automationMode"))
  {
    -[AMSUIWebViewController automationView](self, "automationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_5:

      goto LABEL_6;
    }
    if (os_variant_has_internal_content())
    {
      v8 = objc_alloc(MEMORY[0x24BEBD708]);
      v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      -[AMSUIWebViewController setAutomationView:](self, "setAutomationView:", v9);

      -[AMSUIWebViewController automationView](self, "automationView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", CFSTR("WK2"));

      -[AMSUIWebViewController automationView](self, "automationView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 0.05);

      -[AMSUICommonViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController automationView](self, "automationView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v12);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)AMSUIWebViewController;
  -[AMSUIWebViewController viewWillAppear:](&v18, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web view controller is appearing", buf, 0x16u);

  }
  if (!-[AMSUIWebViewController hasAppeared](self, "hasAppeared"))
  {
    -[AMSUIWebViewController _rootNavigationController](self, "_rootNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 == 1)
    {
      -[AMSUIWebViewController _rootNavigationController](self, "_rootNavigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNavigationBarHidden:", 1);

    }
  }
  -[UIViewController ams_parentContainer](self, "ams_parentContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[AMSUIWebAppearance systemBackgroundColor](AMSUIWebAppearance, "systemBackgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundColor");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v14;
  -[UIViewController ams_setBackgroundColor:](self, "ams_setBackgroundColor:", v17);

  -[AMSUIWebViewController setHasAppeared:](self, "setHasAppeared:", 1);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)AMSUIWebViewController;
  -[AMSUIWebViewController viewWillLayoutSubviews](&v36, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIWebViewController childViewController](self, "childViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

  -[AMSUIWebViewController automationView](self, "automationView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AMSUIWebViewController automationView](self, "automationView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUICommonViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    objc_msgSend(v15, "sizeThatFits:", v17, v18);
    v20 = v19;
    v22 = v21;

    -[AMSUICommonViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v25 = v24 - v20;
    -[AMSUICommonViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaInsets");
    v28 = v25 - v27 + -10.0;
    -[AMSUICommonViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30 - v22;
    -[AMSUICommonViewController view](self, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "safeAreaInsets");
    v34 = v31 - v33;
    -[AMSUIWebViewController automationView](self, "automationView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v28, v34, v20, v22);

  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSUIWebViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentScrollViewForEdge:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ACAccount)account
{
  void *v2;
  void *v3;

  -[AMSUIWebViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  void *v2;
  void *v3;

  -[AMSUIWebViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagProtocol *)v3;
}

- (AMSUIWebAppearance)appearance
{
  void *v2;
  void *v3;

  -[AMSUIWebViewController rootContainer](self, "rootContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSUIWebAppearance *)v3;
}

- (AMSProcessInfo)clientInfo
{
  void *v2;
  void *v3;

  -[AMSUIWebViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)clientOptions
{
  void *v2;
  void *v3;

  -[AMSUIWebViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)loadUsingWebKit
{
  void *v2;
  char v3;

  -[AMSUIWebViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "loadUsingWebKit");

  return v3;
}

- (NSDictionary)metricsOverlay
{
  void *v2;
  void *v3;

  -[AMSUIWebViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)reducedMemoryMode
{
  void *v2;
  char v3;

  -[AMSUIWebViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "reducedMemoryMode");

  return v3;
}

- (void)setAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSUIWebViewController context](self, "context");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceCurrentAccount:clientInfo:", v4, v6);

}

- (void)setAppearance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIWebViewController rootContainer](self, "rootContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppearance:", v4);

}

- (void)setBag:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIWebViewController context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateBackingBag:", v4);

}

- (void)setClientInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSUIWebViewController context](self, "context");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replaceCurrentAccount:clientInfo:", v6, v4);

}

- (void)setClientOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[AMSUIWebViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientOptions:", v4);

  -[AMSUIWebViewController context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "syncProperties");

}

- (void)setLoadUsingWebKit:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSUIWebViewController context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoadUsingWebKit:", v3);

}

- (void)setMetricsOverlay:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics overlay updated: %@", (uint8_t *)&v10, 0x20u);

  }
  -[AMSUIWebViewController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetricsOverlay:", v4);

}

- (void)setReducedMemoryMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSUIWebViewController context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReducedMemoryMode:", v3);

}

- (id)loadBagValue:(id)a3
{
  return -[AMSUIWebViewController _loadRequest:bagValue:](self, "_loadRequest:bagValue:", 0, a3);
}

- (id)loadRequest:(id)a3
{
  return -[AMSUIWebViewController _loadRequest:bagValue:](self, "_loadRequest:bagValue:", a3, 0);
}

- (id)loadURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebViewController _loadRequest:bagValue:](self, "_loadRequest:bagValue:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (id)runJSRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[AMSUIWebViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "runJSRequest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)verifyTrustedURL:(id)a3 bag:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  objc_msgSend(a4, "arrayForKey:", CFSTR("trustedWebDomains"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valuePromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__AMSUIWebViewController_verifyTrustedURL_bag___block_invoke;
  v13[3] = &unk_24CB50D60;
  v14 = v5;
  v8 = v5;
  objc_msgSend(v7, "thenWithBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "catchWithBlock:", &__block_literal_global_34);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "binaryPromiseAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __47__AMSUIWebViewController_verifyTrustedURL_bag___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasPrefix:", CFSTR("."), (_QWORD)v16))
          {
            if ((objc_msgSend(v5, "hasSuffix:", v11) & 1) != 0)
              goto LABEL_14;
          }
          else if ((objc_msgSend(v5, "isEqualToString:", v11) & 1) != 0)
          {
LABEL_14:
            objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_17;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }

    v12 = (void *)MEMORY[0x24BE08340];
  }
  else
  {
    v12 = (void *)MEMORY[0x24BE08340];
  }
  AMSError();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "promiseWithError:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v13;
}

id __47__AMSUIWebViewController_verifyTrustedURL_bag___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (AMSErrorIsEqual())
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", MEMORY[0x24BDBD1C8]);
  else
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(MEMORY[0x24BE08238], "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v3);

  objc_msgSend(MEMORY[0x24BE08358], "bagKeySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v4);

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSUIWeb");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BE08060];
  objc_msgSend((id)objc_opt_class(), "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerBagKeySet:forProfile:profileVersion:", v3, v4, v5);

  v6 = (void *)MEMORY[0x24BE08050];
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bagForProfile:profileVersion:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)action:(id)a3 handleActionObject:(id)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  NSObject *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[AMSUIWebViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE08340]);
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      v28 = 2114;
      v29 = objc_opt_class();
      v30 = 2114;
      v31 = v5;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate (%{public}@) with action: %{public}@", buf, 0x2Au);

    }
    -[AMSUIWebViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __52__AMSUIWebViewController_action_handleActionObject___block_invoke;
    v22[3] = &unk_24CB4FA50;
    v15 = v8;
    v23 = v15;
    v16 = objc_msgSend(v14, "webViewController:handleDelegateAction:completion:", self, v5, v22);

    if (v16)
      v17 = v15;
    else
      v17 = 0;
    v18 = v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      AMSLogKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2114;
      v27 = v20;
      _os_log_impl(&dword_211102000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Caller does not respond to delegate", buf, 0x16u);

    }
    v17 = 0;
  }

  return v17;
}

void __52__AMSUIWebViewController_action_handleActionObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      AMSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

- (id)action:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSUIWebViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[AMSUIWebViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__AMSUIWebViewController_action_didResolveWithResult_error___block_invoke;
    v15[3] = &unk_24CB4FA50;
    v16 = v9;
    objc_msgSend(v12, "webViewController:didResolveWithResult:error:completion:", self, v7, v8, v15);

  }
  else
  {
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v13);

  }
  return v9;
}

void __60__AMSUIWebViewController_action_didResolveWithResult_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v5;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v7, "finishWithError:", v5);
    }
    else
    {
      AMSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "finishWithError:", v8);

    }
  }

}

- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleAuthenticateRequest:(id)a5
{
  return -[AMSUIWebViewController _handleAuthenticateRequest:pauseTimeouts:](self, "_handleAuthenticateRequest:pauseTimeouts:", a5, a4);
}

- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleAuthenticateCloudRequest:(id)a5
{
  return -[AMSUIWebViewController _handleAuthenticateCloudRequest:pauseTimeouts:](self, "_handleAuthenticateCloudRequest:pauseTimeouts:", a5, a4);
}

- (id)action:(id)a3 pauseTimeouts:(BOOL)a4 handleDialogRequest:(id)a5
{
  return -[AMSUIWebViewController _handleDialogRequest:pauseTimeouts:](self, "_handleDialogRequest:pauseTimeouts:", a5, a4);
}

- (void)action:(id)a3 didEncodeNetworkRequest:(id)a4
{
  -[AMSUIWebViewController _handleDidEncodeNetworkRequest:](self, "_handleDidEncodeNetworkRequest:", a4);
}

- (void)actionDidFinishPurchaseWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AMSUIWebViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2114;
      v18 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling purchase completed delegate callback", (uint8_t *)&v15, 0x16u);

    }
    -[AMSUIWebViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "webViewController:didFinishPurchaseWithResult:error:", self, v6, v7);

  }
}

- (void)protocolHandler:(id)a3 didEncodeNetworkRequest:(id)a4
{
  -[AMSUIWebViewController _handleDidEncodeNetworkRequest:](self, "_handleDidEncodeNetworkRequest:", a4);
}

- (void)webPageViewController:(id)a3 didEncodeNetworkRequest:(id)a4
{
  -[AMSUIWebViewController _handleDidEncodeNetworkRequest:](self, "_handleDidEncodeNetworkRequest:", a4);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  -[AMSUIWebViewController _handleDialogRequest:pauseTimeouts:](self, "_handleDialogRequest:pauseTimeouts:", a5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", v8);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  -[AMSUIWebViewController _handleAuthenticateRequest:pauseTimeouts:](self, "_handleAuthenticateRequest:pauseTimeouts:", a5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", v8);

}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  -[AMSUIWebViewController _handleEngagementRequest:pauseTimeouts:](self, "_handleEngagementRequest:pauseTimeouts:", a5, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addFinishBlock:", v8);

}

- (id)presentingSceneIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AMSUICommonViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_applyMappingsToURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  -[AMSUIWebViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("commerce-ui-urls/v2-mapped-urls"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valuePromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__AMSUIWebViewController__applyMappingsToURL___block_invoke;
  v17[3] = &unk_24CB51F30;
  v17[4] = self;
  v10 = v4;
  v18 = v10;
  objc_msgSend(v8, "thenWithBlock:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_66;
  v15[3] = &unk_24CB4FA78;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "catchWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __46__AMSUIWebViewController__applyMappingsToURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v13[0] = MEMORY[0x24BDAC760];
  v13[2] = __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_61;
  v13[3] = &unk_24CB51F08;
  v4 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v16 = 0;
  v17 = &v16;
  v21 = 0;
  v13[1] = 3221225472;
  v14 = v4;
  v15 = &v16;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v13);
  v5 = v17;
  if (v17[5])
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      v9 = v17[5];
      *(_DWORD *)buf = 138543618;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully mapped URL to: %@", buf, 0x16u);
    }

  }
  else
  {
    v10 = *(id *)(a1 + 40);
    v6 = (void *)v5[5];
    v5[5] = (uint64_t)v10;
  }

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v17[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_61(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a2, 1, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v26 = v12;
      v27 = 2114;
      v28 = v9;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Invalid commerceUI pattern. %{public}@", buf, 0x16u);
    }

LABEL_15:
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "numberOfMatchesInString:options:range:", v13, 2, 0, objc_msgSend(v14, "length"));

  if (v15)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v7);
    objc_msgSend(*(id *)(a1 + 40), "query");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setQuery:", v16);

    objc_msgSend(*(id *)(a1 + 40), "fragment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFragment:", v17);

    objc_msgSend(v10, "URL");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v26 = v23;
        _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Mapped URL is not valid.", buf, 0xCu);
      }

    }
    *a4 = 1;
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __46__AMSUIWebViewController__applyMappingsToURL___block_invoke_66(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)_buildRequestWithRequest:(id)a3 bagValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  AMSUIWebViewController *v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (v9 = (void *)MEMORY[0x24BE08340],
        objc_msgSend(v6, "URL"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "promiseWithResult:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    objc_msgSend(v7, "valuePromise");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = (void *)MEMORY[0x24BE08340];
      AMSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "promiseWithError:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke;
  v26[3] = &unk_24CB51F58;
  v26[4] = self;
  objc_msgSend(v11, "thenWithBlock:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_2;
  v25[3] = &unk_24CB51F58;
  v25[4] = self;
  objc_msgSend(v15, "thenWithBlock:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_4;
  v21[3] = &unk_24CB51F80;
  v22 = v6;
  v23 = self;
  v24 = v7;
  v17 = v7;
  v18 = v6;
  objc_msgSend(v16, "thenWithBlock:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyMappingsToURL:", a2);
}

id __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "verifyTrustedURL:bag:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "promiseAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_3;
  v12[3] = &unk_24CB4F760;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v8, "thenWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", *(_QWORD *)(a1 + 32));
}

id __60__AMSUIWebViewController__buildRequestWithRequest_bagValue___block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = (void *)objc_msgSend(a1[4], "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v3);
  v7 = v6;

  objc_msgSend(v7, "setURL:", v3);
  objc_msgSend(v3, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(a1[6], "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1[5], "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setURL:", v9);

  if (!v8)
  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_dismiss
{
  -[AMSUIWebViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_handleAuthenticateRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  BOOL v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BE08340]);
  if (v4)
  {
    -[AMSUIWebViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startTimeoutInterruption");

  }
  -[AMSUIWebViewController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "flowController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke;
  v19[3] = &unk_24CB4F370;
  v19[4] = self;
  v20 = v6;
  v13 = v7;
  v21 = v13;
  v14 = v6;
  objc_msgSend(v11, "performSafeTransitionFrom:block:", self, v19);

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_84;
  v17[3] = &unk_24CB51FD0;
  v17[4] = self;
  v18 = v4;
  objc_msgSend(v13, "addFinishBlock:", v17);
  v15 = v13;

  return v15;
}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  AMSUIAuthenticateTaskCoordinator *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v6;
      v34 = 2114;
      v35 = v8;
      _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate for authentication", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (AMSUIAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "completionHandlerAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIAuthenticateTaskCoordinator webViewController:handleAuthenticateRequest:completion:](v9, "webViewController:handleAuthenticateRequest:completion:", v10, v11, v12);

  }
  else
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "hasAppeared");
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v17;
        v34 = 2114;
        v35 = v19;
        _os_log_impl(&dword_211102000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running authentication.", buf, 0x16u);

      }
      v9 = objc_alloc_init(AMSUIAuthenticateTaskCoordinator);
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "flowController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "currentContainer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIAuthenticateTaskCoordinator handleRequest:presentingViewController:](v9, "handleRequest:presentingViewController:", v20, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_77;
      v30[3] = &unk_24CB51FA8;
      v30[4] = *(_QWORD *)(a1 + 32);
      v31 = *(id *)(a1 + 48);
      objc_msgSend(v24, "addFinishBlock:", v30);

    }
    else
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "context");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logKey");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v26;
        v34 = 2114;
        v35 = v28;
        _os_log_impl(&dword_211102000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to run authentication", buf, 0x16u);

      }
      v29 = *(void **)(a1 + 48);
      AMSError();
      v9 = (AMSUIAuthenticateTaskCoordinator *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "finishWithError:", v9);
    }
  }

}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_77(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v13;
  v7 = v5;
  if (v13)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "currentLoadState");
    v6 = v13;
    if (v8 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "replaceCurrentAccount:clientInfo:", v10, v12);

      v6 = v13;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:error:", v6, v7);

}

void __67__AMSUIWebViewController__handleAuthenticateRequest_pauseTimeouts___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v6;
      v13 = "%{public}@: [%{public}@] Authentication failed. %{public}@";
      v14 = v9;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_10:
      _os_log_impl(&dword_211102000, v14, v15, v13, (uint8_t *)&v20, v16);

    }
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v12;
      v13 = "%{public}@: [%{public}@] Authentication succeeded";
      v14 = v9;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
      goto LABEL_10;
    }
  }

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "flowController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopTimeoutInterruption");

  }
}

- (id)_handleAuthenticateCloudRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  BOOL v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_opt_class();
    AMSLogKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Beginning Cloud Auth Task", buf, 0x16u);

  }
  if (v4)
  {
    -[AMSUIWebViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "flowController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startTimeoutInterruption");

  }
  v13 = objc_alloc_init(MEMORY[0x24BE08340]);
  -[AMSUIWebViewController context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "flowController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke;
  v21[3] = &unk_24CB52020;
  v21[4] = self;
  v22 = v6;
  v24 = v4;
  v16 = v13;
  v23 = v16;
  v17 = v6;
  objc_msgSend(v15, "performSafeTransitionFrom:block:", self, v21);

  v18 = v23;
  v19 = v16;

  return v19;
}

void __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  AMSUIAuthenticateCloudTask *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "hasAppeared"))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "flowController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[AMSUIAuthenticateCloudTask initWithAuthRequest:presentingViewController:]([AMSUIAuthenticateCloudTask alloc], "initWithAuthRequest:presentingViewController:", *(_QWORD *)(a1 + 40), v4);
    -[AMSUIAuthenticateCloudTask performAuthenticate](v5, "performAuthenticate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke_2;
    v13[3] = &unk_24CB51FF8;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v6, "addFinishBlock:", v13);
    objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to run authentication", buf, 0x16u);

    }
    v12 = *(void **)(a1 + 48);
    AMSError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithError:", v4);
  }

}

void __72__AMSUIWebViewController__handleAuthenticateCloudRequest_pauseTimeouts___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    AMSLogKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished Cloud Auth Task", (uint8_t *)&v8, 0x16u);

  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopTimeoutInterruption");

  }
}

- (id)_handleDialogRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  BOOL v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    -[AMSUIWebViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling dialog", buf, 0x16u);

  }
  if (v4)
  {
    -[AMSUIWebViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flowController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startTimeoutInterruption");

  }
  -[AMSUIWebViewController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "flowController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke;
  v24[3] = &unk_24CB4F370;
  v24[4] = self;
  v25 = v6;
  v18 = v7;
  v26 = v18;
  v19 = v6;
  objc_msgSend(v16, "performSafeTransitionFrom:block:", self, v24);

  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke_94;
  v22[3] = &unk_24CB52048;
  v22[4] = self;
  v23 = v4;
  objc_msgSend(v18, "addFinishBlock:", v22);
  v20 = v18;

  return v20;
}

void __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  AMSUIAlertDialogTask *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AMSUIAlertDialogTask *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "hasAppeared"))
  {
    v2 = [AMSUIAlertDialogTask alloc];
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:](v2, "initWithRequest:presentingViewController:", v3, v6);

    -[AMSUIAlertDialogTask present](v20, "present");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v7);

LABEL_5:
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v20 = (AMSUIAlertDialogTask *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "completionHandlerAdapter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIAlertDialogTask webViewController:handleDialogRequest:completion:](v20, "webViewController:handleDialogRequest:completion:", v10, v11, v12);

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v15;
    v23 = 2114;
    v24 = v17;
    _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to run dialog", buf, 0x16u);

  }
  v18 = *(void **)(a1 + 48);
  AMSError();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "finishWithError:", v19);

}

void __61__AMSUIWebViewController__handleDialogRequest_pauseTimeouts___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v6;
      v13 = "%{public}@: [%{public}@] Dialog failed. %{public}@";
      v14 = v9;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_10:
      _os_log_impl(&dword_211102000, v14, v15, v13, (uint8_t *)&v20, v16);

    }
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v12;
      v13 = "%{public}@: [%{public}@] Dialog succeeded";
      v14 = v9;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
      goto LABEL_10;
    }
  }

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "flowController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopTimeoutInterruption");

  }
}

- (id)_handleEngagementRequest:(id)a3 pauseTimeouts:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[5];
  BOOL v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    -[AMSUIWebViewController context](self, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2114;
    v30 = v12;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling engagement request", buf, 0x16u);

  }
  if (v4)
  {
    -[AMSUIWebViewController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flowController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startTimeoutInterruption");

  }
  -[AMSUIWebViewController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "flowController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke;
  v24[3] = &unk_24CB4F370;
  v24[4] = self;
  v25 = v6;
  v18 = v7;
  v26 = v18;
  v19 = v6;
  objc_msgSend(v16, "performSafeTransitionFrom:block:", self, v24);

  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke_101;
  v22[3] = &unk_24CB52070;
  v22[4] = self;
  v23 = v4;
  objc_msgSend(v18, "addFinishBlock:", v22);
  v20 = v18;

  return v20;
}

void __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke(uint64_t a1)
{
  AMSUIEngagementTask *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AMSUIEngagementTask *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "hasAppeared"))
  {
    v2 = [AMSUIEngagementTask alloc];
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flowController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[AMSUIEngagementTask initWithRequest:bag:presentingViewController:](v2, "initWithRequest:bag:presentingViewController:", v3, v5, v8);

    -[AMSUIEngagementTask presentEngagement](v17, "presentEngagement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "finishWithPromise:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to run engagement request", buf, 0x16u);

    }
    v15 = *(void **)(a1 + 48);
    AMSError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithError:", v16);

  }
}

void __65__AMSUIWebViewController__handleEngagementRequest_pauseTimeouts___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      v24 = 2114;
      v25 = v6;
      v13 = "%{public}@: [%{public}@] Engagement request failed. %{public}@";
      v14 = v9;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_10:
      _os_log_impl(&dword_211102000, v14, v15, v13, (uint8_t *)&v20, v16);

    }
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v12;
      v13 = "%{public}@: [%{public}@] Engagement request succeeded";
      v14 = v9;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
      goto LABEL_10;
    }
  }

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "flowController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stopTimeoutInterruption");

  }
}

- (void)_handleDidEncodeNetworkRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMSUIWebViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      AMSLogKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Calling delegate to decorate request", (uint8_t *)&v12, 0x16u);

    }
    -[AMSUIWebViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "webViewController:didEncodeNetworkRequest:", self, v4);

  }
}

- (id)_lazyPromiseForLoadingRequest:(id)a3 bagValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x24BE081C8]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke;
  v13[3] = &unk_24CB520E8;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = (void *)objc_msgSend(v8, "initWithBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCurrentLoadState:", 1);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    objc_msgSend(WeakRetained, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting promise to load request", buf, 0x16u);

  }
  objc_msgSend(WeakRetained, "_buildRequestWithRequest:bagValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_106;
  v12[3] = &unk_24CB520C0;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v11 = v3;
  v13 = v11;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v10, "addFinishBlock:", v12);

  objc_destroyWeak(&v15);
}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_106(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!v6)
  {
    objc_msgSend(v5, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(WeakRetained, "lastLoadedURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v14)
      {
        objc_msgSend(a1[4], "finishWithResult:", MEMORY[0x24BDBD1C8]);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(WeakRetained, "_loadMescalSessionForRequestWithURL:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_2;
    v15[3] = &unk_24CB52098;
    v15[4] = WeakRetained;
    v16 = v5;
    objc_copyWeak(&v19, a1 + 6);
    v17 = a1[5];
    v18 = a1[4];
    objc_msgSend(v13, "addFinishBlock:", v15);

    objc_destroyWeak(&v19);
    goto LABEL_8;
  }
  objc_msgSend(a1[4], "finishWithError:", v6);
LABEL_9:

}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v9;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Mescal account prime session loaded.", buf, 0x16u);

    }
LABEL_11:

    goto LABEL_12;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v12;
      v28 = 2114;
      v29 = v14;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load mescal account prime session. %{public}@", buf, 0x20u);

    }
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "webPage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loadRequest:", *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_107;
  v23 = &unk_24CB4F588;
  objc_copyWeak(&v25, (id *)(a1 + 64));
  v24 = *(id *)(a1 + 48);
  objc_msgSend(v17, "addSuccessBlock:", &v20);
  v18 = *(void **)(a1 + 56);
  objc_msgSend(v17, "promiseAdapter", v20, v21, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "finishWithPromise:", v19);

  objc_destroyWeak(&v25);
}

void __65__AMSUIWebViewController__lazyPromiseForLoadingRequest_bagValue___block_invoke_107(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    objc_msgSend(WeakRetained, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished loading the request", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLastLoadedURL:", v9);

}

- (id)_lazyPromiseForBagSnapshot
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BE081C8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__AMSUIWebViewController__lazyPromiseForBagSnapshot__block_invoke;
  v5[3] = &unk_24CB52110;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __52__AMSUIWebViewController__lazyPromiseForBagSnapshot__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    objc_msgSend(WeakRetained, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: starting promise to load the bag snapshot.", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(WeakRetained, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "promiseAdapter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithPromise:", v12);

}

- (id)_lazyPromiseForLoadingSession
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BE081C8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke;
  v5[3] = &unk_24CB52110;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _BYTE buf[24];
  void *v21;
  id v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)AMSSetLogKey();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    AMSLogKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: starting promise to load the session.", buf, 0x16u);

  }
  dispatch_get_global_queue(2, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke_110;
  v18[3] = &unk_24CB4F4C0;
  v18[4] = WeakRetained;
  v19 = v3;
  v14 = v18;
  v15 = v3;
  AMSLogKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v13;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
  v21 = &unk_24CB4F3C0;
  v22 = v16;
  v23 = v14;
  v17 = v16;
  dispatch_async(v12, buf);

}

void __55__AMSUIWebViewController__lazyPromiseForLoadingSession__block_invoke_110(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSUIWebProtocolHandler *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (void *)MEMORY[0x24BDD1858];
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_configurationWithProcessInfo:bag:", v4, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08410]), "initWithConfiguration:delegate:delegateQueue:", v12, *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setURLSession:", v7);

  v9 = objc_alloc_init(AMSUIWebProtocolHandler);
  -[AMSUIWebProtocolHandler setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProtocolHandler:", v9);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x24BDBD1C8]);
}

- (id)_lazyPromiseForPageLoad
{
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BE081C8]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke;
  v5[3] = &unk_24CB52110;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_msgSend(v2, "initWithBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_2;
  v5[3] = &unk_24CB4F588;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  AMSUIWebFlowOptions *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentLoadState:", 2);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    objc_msgSend(WeakRetained, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v5;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: starting promise to refresh the page.", buf, 0x16u);

  }
  v8 = objc_alloc_init(AMSUIWebFlowOptions);
  -[AMSUIWebFlowOptions setAnimated:](v8, "setAnimated:", 1);
  -[AMSUIWebFlowOptions setDisableTimeout:](v8, "setDisableTimeout:", 1);
  -[AMSUIWebFlowOptions setSuppressErrorPage:](v8, "setSuppressErrorPage:", 1);
  objc_msgSend(WeakRetained, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flowController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flowController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "refreshPageForContainer:options:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_115;
  v15[3] = &unk_24CB4F510;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v14, "addFinishBlock:", v15);

}

uint64_t __49__AMSUIWebViewController__lazyPromiseForPageLoad__block_invoke_115(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)(a1 + 32);
  if (a3)
    v5 = 0;
  else
    v5 = MEMORY[0x24BDBD1C8];
  return objc_msgSend(v4, "finishWithResult:error:", v5, a3);
}

- (id)_parseWebPropertiesFromRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(v5, "ams_parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    if (v10
      && (objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      objc_msgSend(v4, "setURL:", v11);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dsid"));
      v13 = objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[NSObject longLongValue](v13, "longLongValue"));
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("accountType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;

      v51 = (void *)v14;
      if (v14)
      {
        if (v19)
        {
          v20 = (void *)MEMORY[0x24BDB4398];
          -[AMSUIWebViewController context](self, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "clientInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "accountMediaType");
          v48 = v19;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "ams_sharedAccountStoreForMediaType:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v48;
          objc_msgSend(v24, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", 0, v51, 0, v48);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v26)
            {
              objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v26, "OSLogObject");
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v44 = objc_opt_class();
              -[AMSUIWebViewController context](self, "context");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "logKey");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v44;
              v54 = 2114;
              v55 = v28;
              _os_log_impl(&dword_211102000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap: parsed URL is replacing the account...", buf, 0x16u);

            }
            -[AMSUIWebViewController context](self, "context");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[AMSUIWebViewController context](self, "context");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "clientInfo");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "replaceCurrentAccount:clientInfo:", v25, v31);

            v19 = v48;
          }
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("signatureResumption"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v32, "BOOLValue"))
      {
        -[AMSUIWebViewController context](self, "context");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "additionalHeaders");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v33, "mutableCopy");
        v35 = v34;
        v49 = v19;
        if (v34)
          v36 = v34;
        else
          v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v47 = v36;

        objc_msgSend(MEMORY[0x24BE081B0], "resumptionHeaders");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v37;
        if (v37)
          v39 = v37;
        else
          v39 = MEMORY[0x24BDBD1B8];
        objc_msgSend(v47, "addEntriesFromDictionary:", v39);

        v40 = (void *)objc_msgSend(v47, "copy");
        -[AMSUIWebViewController context](self, "context");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setAdditionalHeaders:", v40);

        -[AMSUIWebViewController context](self, "context");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setSignatureResumption:", 1);

        v19 = v49;
      }

      v10 = v50;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_opt_class();
        -[AMSUIWebViewController context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v15;
        v54 = 2114;
        v55 = v17;
        _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unable to extract URL from query string", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (id)_loadMescalSessionForRequestWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  AMSUIWebViewController *v14;

  v4 = a3;
  -[AMSUIWebViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForKey:", CFSTR("account-flow-url-patterns"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valuePromise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__AMSUIWebViewController__loadMescalSessionForRequestWithURL___block_invoke;
  v12[3] = &unk_24CB52138;
  v13 = v4;
  v14 = self;
  v9 = v4;
  objc_msgSend(v8, "thenWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __62__AMSUIWebViewController__loadMescalSessionForRequestWithURL___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;

  v3 = (objc_class *)MEMORY[0x24BDD1798];
  v4 = a2;
  v20 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPattern:options:error:", v4, 1, &v20);

  v6 = v20;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "rangeOfFirstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_alloc(MEMORY[0x24BE08250]);
      objc_msgSend(*(id *)(a1 + 40), "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v8, "initWithBag:", v10);
      objc_msgSend(*(id *)(a1 + 40), "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMescalSession:", v11);

    }
    v13 = (void *)MEMORY[0x24BE08340];
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 40), "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mescalSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", v16 != 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "promiseWithResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE08340], "promiseWithError:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_loadRequest:(id)a3 bagValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v6 = a4;
  -[AMSUIWebViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)AMSSetLogKey();

  if (-[AMSUIWebViewController hasStarted](self, "hasStarted"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v12;
      v57 = 2114;
      v58 = v13;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Multiple loadRequest calls are not supported.", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x24BE08078];
    AMSError();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "promiseWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AMSUIWebViewController context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBootstrapComplete:", 0);

    -[AMSUIWebViewController setHasStarted:](self, "setHasStarted:", 1);
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v44, CFSTR("request"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, CFSTR("bagValue"));
    -[AMSUIWebViewController context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hashedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("account"));

    -[AMSUIWebViewController context](self, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clientInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("clientInfo"));

    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_opt_class();
      -[AMSUIWebViewController context](self, "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logKey");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebViewController context](self, "context");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "clientOptions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v56 = v25;
      v57 = 2114;
      v58 = v27;
      v59 = 2114;
      v60 = v15;
      v61 = 2114;
      v62 = v29;
      _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting bootstrap: %{public}@ options: %{public}@", buf, 0x2Au);

    }
    -[AMSUIWebViewController _parseWebPropertiesFromRequest:](self, "_parseWebPropertiesFromRequest:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebViewController _lazyPromiseForBagSnapshot](self, "_lazyPromiseForBagSnapshot");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v30;
    -[AMSUIWebViewController _lazyPromiseForLoadingSession](self, "_lazyPromiseForLoadingSession");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v31;
    -[AMSUIWebViewController _lazyPromiseForLoadingRequest:bagValue:](self, "_lazyPromiseForLoadingRequest:bagValue:", v43, v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v32;
    -[AMSUIWebViewController _lazyPromiseForPageLoad](self, "_lazyPromiseForPageLoad");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v33;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE08340], "promiseWithAll:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v36 = MEMORY[0x24BDAC760];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke;
    v52[3] = &unk_24CB52160;
    objc_copyWeak(&v53, (id *)buf);
    objc_msgSend(v35, "addSuccessBlock:", v52);
    v37 = objc_alloc_init(MEMORY[0x24BE08340]);
    objc_msgSend(v37, "finishWithPromise:", v35);
    -[AMSUIWebViewController context](self, "context");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "flowController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = MEMORY[0x24BDAC9B8];
    v49[0] = v36;
    v49[1] = 3221225472;
    v49[2] = __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_152;
    v49[3] = &unk_24CB4F588;
    objc_copyWeak(&v51, (id *)buf);
    v41 = v37;
    v50 = v41;
    objc_msgSend(v39, "startTimeout:queue:block:", MEMORY[0x24BDAC9B8], v49, 30.0);

    v45[0] = v36;
    v45[1] = 3221225472;
    v45[2] = __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_2;
    v45[3] = &unk_24CB52188;
    objc_copyWeak(&v48, (id *)buf);
    v46 = v44;
    v47 = v6;
    objc_msgSend(v41, "addErrorBlock:", v45);
    objc_msgSend(v41, "binaryPromiseAdapter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v48);
    objc_destroyWeak(&v51);

    objc_destroyWeak(&v53);
    objc_destroyWeak((id *)buf);

  }
  return v16;
}

void __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    objc_msgSend(WeakRetained, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bootstrap succeeded", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(WeakRetained, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBootstrapComplete:", 1);

}

void __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_152(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)AMSSetLogKey();

    objc_msgSend(WeakRetained, "_stringForLoadState:", objc_msgSend(WeakRetained, "currentLoadState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AMSErrorWithFormat();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6, v5);

  }
}

void __48__AMSUIWebViewController__loadRequest_bagValue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    objc_msgSend(WeakRetained, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Bootstrap failed. %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(WeakRetained, "_showErrorViewWithError:request:bagValue:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_rootNavigationController
{
  void *v2;
  void *v3;

  -[AMSUIWebViewController rootContainer](self, "rootContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_showErrorViewWithError:(id)a3 request:(id)a4 bagValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke;
  v14[3] = &unk_24CB51790;
  v14[4] = self;
  v15 = v8;
  v11 = v8;
  objc_copyWeak(&v18, &location);
  v16 = v9;
  v17 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  AMSUIWebErrorPageModel *v7;
  uint64_t v8;
  void *v9;
  AMSUIWebErrorPageModel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v7 = [AMSUIWebErrorPageModel alloc];
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke_2;
    v17[3] = &unk_24CB521B0;
    objc_copyWeak(&v20, (id *)(a1 + 64));
    v18 = *(id *)(a1 + 48);
    v19 = *(id *)(a1 + 56);
    v10 = -[AMSUIWebErrorPageModel initWithError:context:actionBlock:](v7, "initWithError:context:actionBlock:", v8, v9, v17);

    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "flowController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "flowController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v12, "replaceWithPageModel:forContainer:options:", v10, v15, 0);

    objc_destroyWeak(&v20);
  }
}

void __67__AMSUIWebViewController__showErrorViewWithError_request_bagValue___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  AMSUIWebLoadingPageModel *v5;
  void *v6;
  AMSUIWebLoadingPageModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((a2 & 1) == 0)
  {
    v15 = WeakRetained;
    v5 = [AMSUIWebLoadingPageModel alloc];
    objc_msgSend(v15, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSUIWebLoadingPageModel initWithContext:](v5, "initWithContext:", v6);

    objc_msgSend(v15, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flowController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "flowController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v9, "replaceWithPageModel:forContainer:options:", v7, v12, 0);

    objc_msgSend(v15, "setHasStarted:", 0);
    v14 = (id)objc_msgSend(v15, "_loadRequest:bagValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    WeakRetained = v15;
  }

}

- (id)_stringForLoadState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_24CB521D0[a3];
}

- (AMSUIWebDelegate)delegate
{
  return (AMSUIWebDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)automationView
{
  return self->_automationView;
}

- (void)setAutomationView:(id)a3
{
  objc_storeStrong((id *)&self->_automationView, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
  objc_storeStrong((id *)&self->_childViewController, a3);
}

- (int64_t)currentLoadState
{
  return self->_currentLoadState;
}

- (void)setCurrentLoadState:(int64_t)a3
{
  self->_currentLoadState = a3;
}

- (BOOL)hasAppeared
{
  return self->_hasAppeared;
}

- (void)setHasAppeared:(BOOL)a3
{
  self->_hasAppeared = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (NSURL)lastLoadedURL
{
  return self->_lastLoadedURL;
}

- (void)setLastLoadedURL:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoadedURL, a3);
}

- (AMSUIWebContainerViewController)rootContainer
{
  return self->_rootContainer;
}

- (AMSUIWebPageViewController)webPage
{
  return self->_webPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webPage, 0);
  objc_storeStrong((id *)&self->_rootContainer, 0);
  objc_storeStrong((id *)&self->_lastLoadedURL, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_automationView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
