@implementation SL_OOPAWebViewController

- (SL_OOPAWebViewController)init
{
  SL_OOPAWebViewController *v2;
  int AppBooleanValue;
  BOOL v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  WKWebView *wkWebView;
  id v10;
  uint64_t v11;
  UIWebView *uiWebView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SL_OOPASpinnerTitle *v17;
  void *v18;
  Boolean keyExistsAndHasValidFormat;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SL_OOPAWebViewController;
  v2 = -[SL_OOPAWebViewController init](&v21, sel_init);
  if (v2)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SLUseWKWebView"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v4 = AppBooleanValue == 0;
    else
      v4 = 0;
    if (v4)
    {
      v10 = objc_alloc(MEMORY[0x1E0CEAC10]);
      v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      uiWebView = v2->_uiWebView;
      v2->_uiWebView = (UIWebView *)v11;

      -[UIWebView setDelegate:](v2->_uiWebView, "setDelegate:", v2);
      -[UIWebView setScalesPageToFit:](v2->_uiWebView, "setScalesPageToFit:", 1);
      -[UIWebView setKeyboardDisplayRequiresUserAction:](v2->_uiWebView, "setKeyboardDisplayRequiresUserAction:", 0);
      -[SL_OOPAWebViewController setView:](v2, "setView:", v2->_uiWebView);
    }
    else
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CEF638]);
      objc_msgSend(MEMORY[0x1E0CEF650], "nonPersistentDataStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWebsiteDataStore:", v6);

      v7 = objc_alloc(MEMORY[0x1E0CEF630]);
      v8 = objc_msgSend(v7, "initWithFrame:configuration:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      wkWebView = v2->_wkWebView;
      v2->_wkWebView = (WKWebView *)v8;

      -[WKWebView setNavigationDelegate:](v2->_wkWebView, "setNavigationDelegate:", v2);
      -[WKWebView addObserver:forKeyPath:options:context:](v2->_wkWebView, "addObserver:forKeyPath:options:context:", v2, CFSTR("loading"), 1, 0);
      -[SL_OOPAWebViewController setView:](v2, "setView:", v2->_wkWebView);

    }
    objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCookieAcceptPolicy:", 0);
    if (v2->_uiWebView)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF668]), "initWithIdentifier:", CFSTR("com.apple.AccountAuthenticationDialog.private"));
      objc_msgSend(v14, "setAutosaves:", 0);
      objc_msgSend(v14, "setPrivateBrowsingEnabled:", 1);
      objc_msgSend(v14, "setJavaScriptEnabled:", 1);
      -[UIWebView _browserView](v2->_uiWebView, "_browserView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "webView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPreferences:", v14);

    }
    v17 = objc_alloc_init(SL_OOPASpinnerTitle);
    -[SL_OOPAWebViewController navigationItem](v2, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitleView:", v17);

  }
  return v2;
}

- (void)dealloc
{
  WKWebView *wkWebView;
  objc_super v4;

  wkWebView = self->_wkWebView;
  if (wkWebView)
  {
    -[WKWebView removeObserver:forKeyPath:](wkWebView, "removeObserver:forKeyPath:", self, CFSTR("loading"));
    -[WKWebView setNavigationDelegate:](self->_wkWebView, "setNavigationDelegate:", 0);
  }
  else
  {
    -[UIWebView setDelegate:](self->_uiWebView, "setDelegate:", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)SL_OOPAWebViewController;
  -[SL_OOPAWebViewController dealloc](&v4, sel_dealloc);
}

- (void)setNavBarTitle:(id)a3
{
  -[SL_OOPAWebViewController setBackingTitle:](self, "setBackingTitle:", a3);
  -[SL_OOPAWebViewController _updateNavBarTitle](self, "_updateNavBarTitle");
}

- (void)_updateNavBarTitle
{
  void *v3;
  void *v4;
  id v5;

  -[SL_OOPAWebViewController backingTitle](self, "backingTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SL_OOPAWebViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (void)setAuthURL:(id)a3
{
  NSURL *v4;
  NSURL *authURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  authURL = self->_authURL;
  self->_authURL = v4;

  -[SL_OOPAWebViewController _loadWebViewIfReady](self, "_loadWebViewIfReady");
}

- (void)setAuthFlowDelegate:(id)a3
{
  id v5;
  SL_OOPAuthFlowDelegate *authFlowDelegate;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_authFlowDelegate, a3);
  objc_initWeak(&location, self);
  authFlowDelegate = self->_authFlowDelegate;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __48__SL_OOPAWebViewController_setAuthFlowDelegate___block_invoke;
  v10 = &unk_1E75909F8;
  objc_copyWeak(&v11, &location);
  -[SL_OOPAuthFlowDelegate setAuthFlowCompletion:](authFlowDelegate, "setAuthFlowCompletion:", &v7);
  -[SL_OOPAWebViewController _loadWebViewIfReady](self, "_loadWebViewIfReady", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SL_OOPAWebViewController;
  -[SL_OOPAWebViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  -[SL_OOPAWebViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped_);
  -[SL_OOPAWebViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  -[SL_OOPAWebViewController authURL](self, "authURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SL_OOPAWebViewController _updateNavigationPromptWithActiveURL:](self, "_updateNavigationPromptWithActiveURL:", v7);

  -[SL_OOPAWebViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "standardAppearance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SL_OOPAWebViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScrollEdgeAppearance:", v10);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SL_OOPAWebViewController;
  -[SL_OOPAWebViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SL_OOPAWebViewController _loadWebViewIfReady](self, "_loadWebViewIfReady");
}

- (void)_loadWebViewIfReady
{
  if (!self->_didLoadWebView && (self->_authURL || self->_authFlowDelegate))
    -[SL_OOPAWebViewController _loadWebView](self, "_loadWebView");
}

- (void)_loadWebView
{
  uint64_t v2;
  SL_OOPAuthFlowDelegate *authFlowDelegate;
  NSURL *v5;
  NSURL *authURL;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  SLExternalServiceGatekeeper *v10;
  NSURL *v11;
  NSURL *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  SL_OOPAWebViewController *v17;
  void (**v18)(_QWORD, _QWORD);
  _QWORD v19[5];

  self->_didLoadWebView = 1;
  authFlowDelegate = self->_authFlowDelegate;
  if (authFlowDelegate)
  {
    -[SL_OOPAuthFlowDelegate authURLForUsername:](authFlowDelegate, "authURLForUsername:", self->_username);
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    authURL = self->_authURL;
    self->_authURL = v5;

    v12 = self->_authURL;
    _SLLog(v2, 7, CFSTR("_authURL from delegate %@"));
  }
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__SL_OOPAWebViewController__loadWebView__block_invoke;
  v19[3] = &unk_1E7590A20;
  v19[4] = self;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3B6C8B8](v19, a2);
  -[SL_OOPAuthFlowDelegate initialRedirectURL](self->_authFlowDelegate, "initialRedirectURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [SLExternalServiceGatekeeper alloc];
    v11 = self->_authURL;
    v13 = v7;
    v14 = 3221225472;
    v15 = __40__SL_OOPAWebViewController__loadWebView__block_invoke_2;
    v16 = &unk_1E7590A70;
    v17 = self;
    v18 = v8;

  }
  else
  {
    ((void (**)(_QWORD, NSURL *))v8)[2](v8, self->_authURL);
  }
  -[SL_OOPAWebViewController startAnimating](self, "startAnimating", v12, v13, v14, v15, v16);

}

- (void)_didFinishWithSuccess:(BOOL)a3 response:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  if (!self->_didFinish)
  {
    v6 = a3;
    self->_didFinish = 1;
    v8 = a5;
    v9 = a4;
    -[SL_OOPAWebViewController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "webViewController:didFinishWithSuccess:response:error:", self, v6, v9, v8);

  }
}

- (BOOL)webView:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  uint64_t v5;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  if (!self->_authFlowDelegate)
  {
    objc_msgSend(v9, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "hasPrefix:", CFSTR("account://")))
    {
      _SLLog(v5, 5, CFSTR("SL_OOPAWebViewController caught account:// redirect!"));
      -[SL_OOPAWebViewController _didFinishWithSuccess:response:error:](self, "_didFinishWithSuccess:response:error:", 1, 0, 0);
      v10 = 0;
      goto LABEL_7;
    }

    if (!self->_authFlowDelegate)
      goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v10 = 1;
    goto LABEL_10;
  }
  v10 = 1;
  if (-[SL_OOPAuthFlowDelegate shouldHideWebViewForLoadWithRequest:](self->_authFlowDelegate, "shouldHideWebViewForLoadWithRequest:", v9))
  {
    -[SL_OOPAWebViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "snapshotViewAfterScreenUpdates:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SL_OOPAWebViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    objc_msgSend(v12, "setFrame:");

    objc_msgSend(v12, "setAutoresizingMask:", 18);
    -[SL_OOPAWebViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v12);

    self->_hidingWebView = 1;
LABEL_7:

  }
LABEL_10:

  return v10;
}

- (void)webView:(id)a3 didFailLoadWithError:(id)a4
{
  uint64_t v4;

  _SLLog(v4, 5, CFSTR("SL_OOPAWebViewController failed to load page with error: %@"));
  -[SL_OOPAWebViewController stopAnimating](self, "stopAnimating");
}

- (void)webViewDidFinishLoad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SL_OOPAuthFlowDelegate *authFlowDelegate;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (!self->_hidingWebView)
    -[SL_OOPAWebViewController stopAnimating](self, "stopAnimating");
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SL_OOPAWebViewController _updateNavigationPromptWithActiveURL:](self, "_updateNavigationPromptWithActiveURL:", v6);

  if (self->_authFlowDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    authFlowDelegate = self->_authFlowDelegate;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__SL_OOPAWebViewController_webViewDidFinishLoad___block_invoke;
    v8[3] = &unk_1E7590A98;
    v8[4] = self;
    v9 = v4;
    -[SL_OOPAuthFlowDelegate webViewDidFinishLoadWithPageTitleSupplier:](authFlowDelegate, "webViewDidFinishLoadWithPageTitleSupplier:", v8);

  }
}

- (void)_evaluateDocumentTitleForUIWebView:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v5;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  dispatch_time_t v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(id, void *);
  unint64_t v16;

  v9 = a3;
  v10 = (void (**)(id, void *))a5;
  if (a4)
  {
    objc_msgSend(v9, "stringByEvaluatingJavaScriptFromString:", CFSTR("document.title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "length"))
    {
      _SLLog(v5, 3, CFSTR("Found title for webview"));
      v10[2](v10, v11);
    }
    else
    {
      v12 = dispatch_time(0, 200000000);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __85__SL_OOPAWebViewController__evaluateDocumentTitleForUIWebView_retryCount_completion___block_invoke;
      v13[3] = &unk_1E7590AC0;
      v13[4] = self;
      v14 = v9;
      v16 = a4;
      v15 = v10;
      dispatch_after(v12, MEMORY[0x1E0C80D38], v13);

    }
  }
  else
  {
    _SLLog(v5, 3, CFSTR("No title for webview found"));
    v10[2](v10, 0);
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  SL_OOPAuthFlowDelegate *authFlowDelegate;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (self->_authFlowDelegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      authFlowDelegate = self->_authFlowDelegate;
      objc_msgSend(v8, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(authFlowDelegate) = -[SL_OOPAuthFlowDelegate shouldHideWebViewForLoadWithRequest:](authFlowDelegate, "shouldHideWebViewForLoadWithRequest:", v11);

      if ((_DWORD)authFlowDelegate)
      {
        -[SL_OOPAWebViewController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "snapshotViewAfterScreenUpdates:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[SL_OOPAWebViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bounds");
        objc_msgSend(v13, "setFrame:");

        objc_msgSend(v13, "setAutoresizingMask:", 18);
        -[SL_OOPAWebViewController view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addSubview:", v13);

        self->_hidingWebView = 1;
      }
    }
  }
  v9[2](v9, 1);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SL_OOPAuthFlowDelegate *authFlowDelegate;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  if (!self->_hidingWebView)
  {
    -[SL_OOPAWebViewController stopAnimating](self, "stopAnimating");
    objc_msgSend(v6, "backForwardList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SL_OOPAWebViewController _updateNavigationPromptWithActiveURL:](self, "_updateNavigationPromptWithActiveURL:", v10);

  }
  if (self->_authFlowDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    authFlowDelegate = self->_authFlowDelegate;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__SL_OOPAWebViewController_webView_didFinishNavigation___block_invoke;
    v12[3] = &unk_1E7590A98;
    v12[4] = self;
    v13 = v6;
    -[SL_OOPAuthFlowDelegate webViewDidFinishLoadWithPageTitleSupplier:](authFlowDelegate, "webViewDidFinishLoadWithPageTitleSupplier:", v12);

  }
}

- (void)_evaluateDocumentTitleForWebView:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (a4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke;
    v12[3] = &unk_1E7590AE8;
    v14 = v10;
    v12[4] = self;
    v13 = v9;
    v15 = a4;
    objc_msgSend(v13, "evaluateJavaScript:completionHandler:", CFSTR("document.title"), v12);

  }
  else
  {
    _SLLog(v5, 3, CFSTR("No title for webview found"));
    v11[2](v11, 0);
  }

}

- (void)webView:(id)a3 didReceiveServerRedirectForProvisionalNavigation:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SL_OOPAWebViewController *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("https"));
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v23, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("http")))
      goto LABEL_13;
  }
  objc_msgSend(v23, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("www.apple.com")) & 1) != 0)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v23, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "host");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "isEqualToString:", CFSTR("apple.com"));

  }
  if ((v10 & 1) != 0)
  {

    v16 = v23;
    if (!v13)
      goto LABEL_15;
    goto LABEL_10;
  }

  v16 = v23;
  if ((v13 & 1) != 0)
  {
LABEL_10:
    v17 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(v16, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsWithURL:resolvingAgainstBaseURL:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("error"), CFSTR("access_denied"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("account"), CFSTR("yahoo_japan"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "containsObject:", v9) || (objc_msgSend(v8, "containsObject:", v4) & 1) != 0)
      goto LABEL_14;
    objc_msgSend(v23, "URL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v6, 7, CFSTR("Dimissing auth UI because the server redirected us to %@"));

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SLErrorDomain"), -1, 0, v21);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SL_OOPAWebViewController _didFinishWithSuccess:response:error:](v22, "_didFinishWithSuccess:response:error:", 0, 0, v5);
LABEL_13:

LABEL_14:
    v16 = v23;
  }
LABEL_15:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_super v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("loading"))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WKWebView isLoading](self->_wkWebView, "isLoading"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v6, 5, CFSTR("SL_OOPAWebViewController observed WKWebView loading did change to %@"));

    if (-[WKWebView isLoading](self->_wkWebView, "isLoading", v14))
      -[SL_OOPAWebViewController startAnimating](self, "startAnimating");
    else
      -[SL_OOPAWebViewController stopAnimating](self, "stopAnimating");
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SL_OOPAWebViewController;
    -[SL_OOPAWebViewController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v11, v12, v13, a6);
  }

}

- (void)_cancelButtonTapped:(id)a3
{
  uint64_t v3;

  _SLLog(v3, 7, CFSTR("SL_OOPAWebViewController: user tapped Cancel."));
  -[SL_OOPAWebViewController _didFinishWithSuccess:response:error:](self, "_didFinishWithSuccess:response:error:", 0, 0, 0);
}

- (void)_updateNavigationPromptWithActiveURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SL_OOPAWebViewController setHostString:](self, "setHostString:", v4);

  -[SL_OOPAWebViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v7, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrompt:", v6);

  }
  else
  {
    objc_msgSend(v5, "setPrompt:", &stru_1E7592238);
  }

}

- (void)startAnimating
{
  void *v3;
  void *v4;

  -[SL_OOPAWebViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

  -[UIActivityIndicatorView startAnimating](self->_webPageLoading, "startAnimating");
}

- (void)stopAnimating
{
  void *v3;
  void *v4;

  -[SL_OOPAWebViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  -[UIActivityIndicatorView stopAnimating](self->_webPageLoading, "stopAnimating");
}

- (SL_OOPAWebViewControllerDelegate)delegate
{
  return (SL_OOPAWebViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SL_OOPAuthFlowDelegate)authFlowDelegate
{
  return self->_authFlowDelegate;
}

- (NSURL)authURL
{
  return self->_authURL;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSString)backingTitle
{
  return self->_backingTitle;
}

- (void)setBackingTitle:(id)a3
{
  objc_storeStrong((id *)&self->_backingTitle, a3);
}

- (NSString)hostString
{
  return self->_hostString;
}

- (void)setHostString:(id)a3
{
  objc_storeStrong((id *)&self->_hostString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostString, 0);
  objc_storeStrong((id *)&self->_backingTitle, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
  objc_storeStrong((id *)&self->_authFlowDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webPageLoading, 0);
  objc_storeStrong((id *)&self->_spinnerTitleView, 0);
  objc_storeStrong((id *)&self->_uiWebView, 0);
  objc_storeStrong((id *)&self->_wkWebView, 0);
}

@end
