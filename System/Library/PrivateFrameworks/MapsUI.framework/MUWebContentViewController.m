@implementation MUWebContentViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)configureWithHTML:(id)a3 actionManager:(id)a4 initialDefaultHeight:(double)a5
{
  id v9;
  void *v10;
  char IsEnabled_PlaceCardShowcase;
  MUWebContentTraits *v12;
  MUWebContentTraits *webContentTraits;
  id v14;

  v14 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isNetworkReachable"))
  {
    IsEnabled_PlaceCardShowcase = MapsFeature_IsEnabled_PlaceCardShowcase();

    if ((IsEnabled_PlaceCardShowcase & 1) != 0)
    {
      objc_storeStrong((id *)&self->_html, a3);
      objc_storeStrong((id *)&self->_actionManager, a4);
      v12 = (MUWebContentTraits *)objc_opt_new();
      webContentTraits = self->_webContentTraits;
      self->_webContentTraits = v12;

      self->_defaultHeight = a5;
    }
  }
  else
  {

  }
}

- (MUWebContentViewController)initWithURL:(id)a3
{
  id v4;
  void *v5;
  MUWebContentViewController *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[MUWebContentViewController initWithURL:traits:](self, "initWithURL:traits:", v4, v5);

  return v6;
}

- (MUWebContentViewController)initWithURL:(id)a3 traits:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  MUWebContentViewController *v14;
  MUWebContentViewController *v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  MUWebContentViewController *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "resolvedURLForRelativeURL:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_7;
  +[MUWebContentBlocker sharedBlocker](MUWebContentBlocker, "sharedBlocker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldBlockLoadingOfURL:", v9);

  if ((v11 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isNetworkReachable");

  if (v13)
  {
    v22.receiver = self;
    v22.super_class = (Class)MUWebContentViewController;
    v14 = -[MUWebContentViewController init](&v22, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_url, a3);
      objc_storeStrong((id *)&v15->_resolvedURL, v9);
      objc_storeStrong((id *)&v15->_webContentTraits, a4);
      GEOConfigGetDouble();
      v15->_defaultHeight = v16;
      objc_opt_self();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)-[MUWebContentViewController registerForTraitChanges:withAction:](v15, "registerForTraitChanges:withAction:", v18, sel__propogateUserInterfaceStyleToWebModule);

    }
    self = v15;
    v20 = self;
  }
  else
  {
LABEL_7:
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_webViewFactoryItem)
  {
    +[MUWebViewFactory sharedWebViewFactory](MUWebViewFactory, "sharedWebViewFactory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "requeueItem:", self->_webViewFactoryItem);

  }
  v4.receiver = self;
  v4.super_class = (Class)MUWebContentViewController;
  -[MUWebContentViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *heightConstraint;
  MUWebBridgeConfiguration *v7;
  void *v8;
  MUWebViewFactoryItem *v9;
  MUWebViewFactoryItem *webViewFactoryItem;
  WKWebView *v11;
  WKWebView *webView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  void *v24;
  MUWebBridgeConfiguration *v25;
  void *v26;
  WKNavigation *v27;
  void *currentWebNavigation;
  NSURL *resolvedURL;
  void *v30;
  WKNavigation *v31;
  WKNavigation *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  MUWebBridgeConfiguration *v43;
  objc_super v44;
  _QWORD v45[7];

  v45[5] = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)MUWebContentViewController;
  -[MUWebContentViewController viewDidLoad](&v44, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[MUWebContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, 0, 0, 1.0, self->_defaultHeight);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v5;

  v7 = -[MUWebBridgeConfiguration initWithNativeControllerName:webControllerName:bridgeVersion:]([MUWebBridgeConfiguration alloc], "initWithNativeControllerName:webControllerName:bridgeVersion:", CFSTR("placeCardNativeController"), CFSTR("placeCardWebController"), CFSTR("1.0"));
  +[MUWebViewFactory sharedWebViewFactory](MUWebViewFactory, "sharedWebViewFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v7;
  objc_msgSend(v8, "dequeueItemWithBridgeConfiguration:", v7);
  v9 = (MUWebViewFactoryItem *)objc_claimAutoreleasedReturnValue();
  webViewFactoryItem = self->_webViewFactoryItem;
  self->_webViewFactoryItem = v9;

  -[MUWebViewFactoryItem webView](self->_webViewFactoryItem, "webView");
  v11 = (WKWebView *)objc_claimAutoreleasedReturnValue();
  webView = self->_webView;
  self->_webView = v11;

  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
  -[WKWebView setUIDelegate:](self->_webView, "setUIDelegate:", self);
  -[WKWebView setAccessibilityIdentifier:](self->_webView, "setAccessibilityIdentifier:", CFSTR("MUWebContentView"));
  -[MUWebContentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_webView);

  v35 = (void *)MEMORY[0x1E0CB3718];
  -[WKWebView leadingAnchor](self->_webView, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebContentViewController view](self, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v39;
  -[WKWebView trailingAnchor](self->_webView, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebContentViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v34;
  -[WKWebView topAnchor](self->_webView, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebContentViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v16;
  -[WKWebView bottomAnchor](self->_webView, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebContentViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self->_heightConstraint;
  v45[3] = v20;
  v45[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v22);

  if (self->_html)
  {
    GEOGetURL();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebContentTraits queryItems](self->_webContentTraits, "queryItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v43;
    +[MUWebBridge URLByAddingConfiguration:toURL:additionalQueryItems:](MUWebBridge, "URLByAddingConfiguration:toURL:additionalQueryItems:", v43, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[WKWebView loadHTMLString:baseURL:](self->_webView, "loadHTMLString:baseURL:", self->_html, v26);
    v27 = (WKNavigation *)objc_claimAutoreleasedReturnValue();
    currentWebNavigation = self->_currentWebNavigation;
    self->_currentWebNavigation = v27;
LABEL_3:

    goto LABEL_4;
  }
  v25 = v43;
  if (self->_url)
  {
    resolvedURL = self->_resolvedURL;
    if (resolvedURL)
    {
      -[MUWebContentTraits queryItems](self->_webContentTraits, "queryItems");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUWebBridge URLByAddingConfiguration:toURL:additionalQueryItems:](MUWebBridge, "URLByAddingConfiguration:toURL:additionalQueryItems:", v43, resolvedURL, v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v26);
      currentWebNavigation = (void *)objc_claimAutoreleasedReturnValue();
      -[WKWebView loadRequest:](self->_webView, "loadRequest:", currentWebNavigation);
      v31 = (WKNavigation *)objc_claimAutoreleasedReturnValue();
      v32 = self->_currentWebNavigation;
      self->_currentWebNavigation = v31;

      goto LABEL_3;
    }
  }
LABEL_4:
  -[MUWebContentViewController _startLoading](self, "_startLoading");

}

- (void)_startLoading
{
  self->_loading = 1;
  -[WKWebView setAlpha:](self->_webView, "setAlpha:", 0.0);
  -[MUWebContentViewController _addLoadingSpinner](self, "_addLoadingSpinner");
}

- (void)_finishLoading
{
  double v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_loading)
  {
    -[WKWebView alpha](self->_webView, "alpha");
    if (v3 != 1.0)
    {
      -[MUWebContentViewController delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isWebContentViewControllerParentPlacecardLoading:", self);

      if ((v5 & 1) != 0)
      {
        -[WKWebView setAlpha:](self->_webView, "setAlpha:", 1.0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", *MEMORY[0x1E0CC1AA8]);
        v6 = (void *)MEMORY[0x1E0CD28B0];
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAnimationTimingFunction:", v7);

        -[WKWebView setAlpha:](self->_webView, "setAlpha:", 1.0);
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      }
    }
    self->_loading = 0;
    -[MUWebContentViewController _removeLoadingSpinner](self, "_removeLoadingSpinner");
    -[MUWebContentViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "webContentViewControllerDidStopLoading:", self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("MUWebContentViewControllerDidFinishLoadingNotification"), self);

  }
}

- (void)_cancel
{
  void *v3;
  id v4;

  -[WKWebView stopLoading](self->_webView, "stopLoading");
  -[MUWebBridge closeConnection](self->_bridge, "closeConnection");
  if (self->_loading)
  {
    self->_loading = 0;
    -[MUWebContentViewController _removeLoadingSpinner](self, "_removeLoadingSpinner");
    -[MUWebContentViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "webContentViewControllerDidStopLoading:", self);

  }
  -[MUWebContentViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeWebContentViewController:arguments:", self, 0);

}

- (void)_addLoadingSpinner
{
  id v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v6;
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
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (!self->_activityIndicatorView)
  {
    if (-[MUWebContentViewController shouldAddLoadingIndicator](self, "shouldAddLoadingIndicator"))
    {
      v3 = objc_alloc(MEMORY[0x1E0DC3438]);
      v4 = (UIActivityIndicatorView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      activityIndicatorView = self->_activityIndicatorView;
      self->_activityIndicatorView = v4;

      -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityIndicatorView, "setActivityIndicatorViewStyle:", 100);
      -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
      v6 = self->_activityIndicatorView;
      -[MUWebContentViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_mapkit_insertSubviewAboveAllOtherSubviews:", v6);

      v17 = (void *)MEMORY[0x1E0CB3718];
      -[UIActivityIndicatorView centerXAnchor](v6, "centerXAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebContentViewController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "centerXAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      -[UIActivityIndicatorView centerYAnchor](v6, "centerYAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUWebContentViewController view](self, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "centerYAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateConstraints:", v16);

    }
  }
}

- (void)_removeLoadingSpinner
{
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v4;

  activityIndicatorView = self->_activityIndicatorView;
  if (activityIndicatorView)
  {
    -[UIActivityIndicatorView removeFromSuperview](activityIndicatorView, "removeFromSuperview");
    v4 = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;

  }
}

- (BOOL)shouldAddLoadingIndicator
{
  if (self->_url)
    return 1;
  else
    return GEOConfigGetBOOL();
}

- (void)_resetBridge
{
  MUWebBridge *bridge;
  MUWebBridge *v4;
  MUWebBridge *v5;
  MUWebBridge *v6;
  uint64_t v7;
  MUWebBridge *v8;
  MUWebBridge *v9;
  MUWebBridge *v10;
  MUWebBridge *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  bridge = self->_bridge;
  if (bridge)
    -[MUWebBridge closeConnection](bridge, "closeConnection");
  v4 = -[MUWebBridge initWithWebViewFactoryItem:]([MUWebBridge alloc], "initWithWebViewFactoryItem:", self->_webViewFactoryItem);
  v5 = self->_bridge;
  self->_bridge = v4;

  -[MUWebBridge setDelegate:](self->_bridge, "setDelegate:", self);
  objc_initWeak(&location, self);
  v6 = self->_bridge;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __42__MUWebContentViewController__resetBridge__block_invoke;
  v20[3] = &unk_1E2E041F0;
  objc_copyWeak(&v21, &location);
  -[MUWebBridge addCallableMethod:handler:](v6, "addCallableMethod:handler:", CFSTR("setHeight"), v20);
  v8 = self->_bridge;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __42__MUWebContentViewController__resetBridge__block_invoke_2;
  v18[3] = &unk_1E2E041F0;
  objc_copyWeak(&v19, &location);
  -[MUWebBridge addCallableMethod:handler:](v8, "addCallableMethod:handler:", CFSTR("getAnalyticsShortSessionSnapshot"), v18);
  v9 = self->_bridge;
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __42__MUWebContentViewController__resetBridge__block_invoke_3;
  v16[3] = &unk_1E2E041F0;
  objc_copyWeak(&v17, &location);
  -[MUWebBridge addCallableMethod:handler:](v9, "addCallableMethod:handler:", CFSTR("removeModule"), v16);
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  {
    v10 = self->_bridge;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __42__MUWebContentViewController__resetBridge__block_invoke_4;
    v14[3] = &unk_1E2E041F0;
    objc_copyWeak(&v15, &location);
    -[MUWebBridge addCallableMethod:handler:](v10, "addCallableMethod:handler:", CFSTR("invokeAction"), v14);
    v11 = self->_bridge;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __42__MUWebContentViewController__resetBridge__block_invoke_5;
    v12[3] = &unk_1E2E041F0;
    objc_copyWeak(&v13, &location);
    -[MUWebBridge addCallableMethod:handler:](v11, "addCallableMethod:handler:", CFSTR("layoutActions"), v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __42__MUWebContentViewController__resetBridge__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_setHeight:callbackHandler:", v6, v5);

}

void __42__MUWebContentViewController__resetBridge__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_getAnalyticsShortSessionSnapshotWithCallbackHandler:", v4);

}

void __42__MUWebContentViewController__resetBridge__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_removeModuleWithArguments:callbackHandler:", v6, v5);

}

void __42__MUWebContentViewController__resetBridge__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_invokeAction:callbackHandler:", v6, v5);

}

void __42__MUWebContentViewController__resetBridge__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_layoutAction:callbackHandler:", v6, v5);

}

- (void)updateActionOverBridge:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v5, "count"))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __53__MUWebContentViewController_updateActionOverBridge___block_invoke;
      v6[3] = &unk_1E2E04218;
      v6[4] = self;
      v7 = v4;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

    }
    -[MUWebBridge callMethod:arguments:callbackHandler:](self->_bridge, "callMethod:arguments:callbackHandler:", CFSTR("updateActions"), v4, &__block_literal_global_46);

  }
}

void __53__MUWebContentViewController_updateActionOverBridge___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForAction:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v6 = v7;
  }

}

void __53__MUWebContentViewController_updateActionOverBridge___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    MUGetMUWebContentLog_2();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_ERROR, "Error updating actions: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  id v6;
  WKNavigation *v7;
  NSObject *v8;
  void *v9;
  WKNavigation *currentWebNavigation;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (WKNavigation *)a4;
  MUGetMUWebContentLog_2();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_INFO, "<WKWebView: %p> starting to load content with at url %@", (uint8_t *)&v11, 0x16u);

  }
  currentWebNavigation = self->_currentWebNavigation;
  self->_currentWebNavigation = v7;

  -[MUWebContentViewController _startLoading](self, "_startLoading");
  -[MUWebContentViewController _resetBridge](self, "_resetBridge");

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_currentWebNavigation == a4)
  {
    MUGetMUWebContentLog_2();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218242;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_ERROR, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v11, 0x16u);
    }

    -[MUWebContentViewController _cancel](self, "_cancel");
  }

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_currentWebNavigation == a4)
  {
    MUGetMUWebContentLog_2();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 134218242;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_ERROR, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v11, 0x16u);
    }

    -[MUWebContentViewController _cancel](self, "_cancel");
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  MUGetMUWebContentLog_2();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218242;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> decide policy for response %@", (uint8_t *)&v14, 0x16u);
  }

  if (objc_msgSend(v8, "isForMainFrame"))
  {
    objc_msgSend(v8, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "response");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v13, "statusCode") - 200) >= 0x64)
      {
        v9[2](v9, 0);

        goto LABEL_8;
      }

    }
  }
  v9[2](v9, 1);
LABEL_8:

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  MUGetMUWebContentLog_2();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15 = 134218242;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> decide policy for action %@", (uint8_t *)&v15, 0x16u);
  }

  if (objc_msgSend(v8, "navigationType"))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "openURL:completionHandler:", v14, 0);

    v11 = 0;
  }
  v9[2](v9, v11);

}

- (void)webBridgeDidConnect:(id)a3
{
  id v4;
  MUWebBridge *bridge;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  MUWebBridge *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  id location;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  bridge = self->_bridge;
  -[MUWebContentViewController mk_theme](self, "mk_theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "javaScriptName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebBridge callMethod:arguments:callbackHandler:](bridge, "callMethod:arguments:callbackHandler:", CFSTR("setTheme"), v9, 0);

  if (!v7)
  if (MapsFeature_IsEnabled_PlaceCardShowcase())
  {
    -[MUWebContentViewController actionManager](self, "actionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "supportedPlaceEnrichmentActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v11, "count"))
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __50__MUWebContentViewController_webBridgeDidConnect___block_invoke;
      v24[3] = &unk_1E2E04218;
      v24[4] = self;
      v13 = v12;
      v25 = v13;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v24);
      v14 = objc_alloc(MEMORY[0x1E0C99D20]);
      v15 = objc_alloc(MEMORY[0x1E0C99D80]);
      v16 = (void *)objc_msgSend(v13, "copy");
      v27 = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithObjects:forKeys:", v17, &unk_1E2E55D08);
      v19 = (void *)objc_msgSend(v14, "initWithObjects:", v18, 0);

      v20 = (void *)objc_msgSend(v19, "copy");
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }
  v21 = self->_bridge;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __50__MUWebContentViewController_webBridgeDidConnect___block_invoke_2;
  v22[3] = &unk_1E2E04260;
  objc_copyWeak(&v23, &location);
  -[MUWebBridge callMethod:arguments:callbackHandler:](v21, "callMethod:arguments:callbackHandler:", CFSTR("initializeModule"), v20, v22);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __50__MUWebContentViewController_webBridgeDidConnect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryForAction:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v6 = v7;
  }

}

void __50__MUWebContentViewController_webBridgeDidConnect___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    MUGetMUWebContentLog_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_ERROR, "Error initializing module: %@", (uint8_t *)&v7, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_cancel");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_finishLoading");
  }

}

- (void)_propogateUserInterfaceStyleToWebModule
{
  MUWebBridge *bridge;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[MUWebBridge connectionState](self->_bridge, "connectionState") == 1)
  {
    bridge = self->_bridge;
    -[MUWebContentViewController mk_theme](self, "mk_theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "javaScriptName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebBridge callMethod:arguments:callbackHandler:](bridge, "callMethod:arguments:callbackHandler:", CFSTR("setTheme"), v7, 0);

    if (!v5)
  }
}

- (void)_setHeight:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, uint64_t);
  double v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  void (**v15)(id, uint64_t);
  _QWORD v16[4];
  id v17[2];
  id location;

  v5 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  -[NSLayoutConstraint constant](self->_heightConstraint, "constant");
  if (v9 == a3)
  {
    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    -[MUWebContentViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isWebContentViewControllerParentPlacecardLoading:", self);

    objc_initWeak(&location, self);
    -[MUWebContentViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__MUWebContentViewController__setHeight_animated_completion___block_invoke;
    v16[3] = &unk_1E2E04288;
    objc_copyWeak(v17, &location);
    v17[1] = *(id *)&a3;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __61__MUWebContentViewController__setHeight_animated_completion___block_invoke_59;
    v14[3] = &unk_1E2E02EC0;
    v15 = v8;
    objc_msgSend(v12, "webContentViewController:performHeightChangeWithBlock:animated:completion:", self, v16, v5 & (v11 ^ 1u), v14);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

}

void __61__MUWebContentViewController__setHeight_animated_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    MUGetMUWebContentLog_2();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v4;
      _os_log_impl(&dword_191DB8000, v3, OS_LOG_TYPE_ERROR, "Setting web view height: %f", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained[121], "setConstant:", *(double *)(a1 + 40));
  }

}

uint64_t __61__MUWebContentViewController__setHeight_animated_completion___block_invoke_59(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setHeight:(id)a3 callbackHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, const __CFString *);
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD, const __CFString *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, const __CFString *))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("height"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    v7[2](v7, 0, CFSTR("invalid arguments"));
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("height"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("animated"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  GEOConfigGetDouble();
  if (v13 < v16)
    v16 = v13;
  v17 = fmax(v16, 0.0);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__MUWebContentViewController__setHeight_callbackHandler___block_invoke;
  v18[3] = &unk_1E2E02EC0;
  v19 = v7;
  -[MUWebContentViewController _setHeight:animated:completion:](self, "_setHeight:animated:completion:", v15, v18, v17);

LABEL_8:
}

uint64_t __57__MUWebContentViewController__setHeight_callbackHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_getAnalyticsShortSessionSnapshotWithCallbackHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D27698], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__MUWebContentViewController__getAnalyticsShortSessionSnapshotWithCallbackHandler___block_invoke;
  v6[3] = &unk_1E2E042B0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "shortSessionValues:", v6);

}

void __83__MUWebContentViewController__getAnalyticsShortSessionSnapshotWithCallbackHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, int a7, double a8, double a9, double a10)
{
  id v15;
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
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  v15 = objc_alloc(MEMORY[0x1E0C99E08]);
  v33[0] = CFSTR("sessionID");
  v31[0] = CFSTR("high");
  objc_msgSend(MEMORY[0x1E0D27698], "highBytesStringFromSession:", a2, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = CFSTR("low");
  v32[0] = v16;
  objc_msgSend(MEMORY[0x1E0D27698], "lowBytesStringFromSession:", a2, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v18;
  v33[1] = CFSTR("sequenceNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v19;
  v33[2] = CFSTR("relativeTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v15, "initWithDictionary:", v21);

  if (a7)
  {
    v29[0] = CFSTR("underagedUser");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("managedAccount");
    v30[0] = v23;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addEntriesFromDictionary:", v25);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_removeModuleWithArguments:(id)a3 callbackHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[MUWebContentViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeWebContentViewController:arguments:", self, v6);

  (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
}

- (void)_invokeAction:(id)a3 callbackHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MUWebContentViewController actionManager](self, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MUWebContentViewController__invokeAction_callbackHandler___block_invoke;
  v11[3] = &unk_1E2E01D80;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performActionUsingArguments:contextMenu:completion:", v9, 0, v11);

}

void __60__MUWebContentViewController__invokeAction_callbackHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (a2)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error performing actions from arguments: %@"), *(_QWORD *)(a1 + 32));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

    }
  }
}

- (void)_layoutAction:(id)a3 callbackHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MUWebContentViewController actionManager](self, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__MUWebContentViewController__layoutAction_callbackHandler___block_invoke;
  v11[3] = &unk_1E2E01D80;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "layoutActionsUsingArguments:completion:", v9, v11);

}

void __60__MUWebContentViewController__layoutAction_callbackHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (a2)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error during layoutAction. Arguments: %@"), *(_QWORD *)(a1 + 32));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

    }
  }
}

+ (id)resolvedURLForRelativeURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    GEOGetURL();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "relativeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLWithString:relativeToURL:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (MUWebContentViewControllerDelegate)delegate
{
  return (MUWebContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (MUPlaceEnrichmentActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webContentTraits, 0);
  objc_storeStrong((id *)&self->_currentWebNavigation, 0);
  objc_storeStrong((id *)&self->_html, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_bridge, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_webViewFactoryItem, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end
