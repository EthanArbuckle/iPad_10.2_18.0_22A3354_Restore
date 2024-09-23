@implementation OOPAWebViewController

- (OOPAWebViewController)init
{
  OOPAWebViewController *v2;
  id v3;
  void *v4;
  WKWebView *v5;
  WKWebView *webView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OOPAWebViewController;
  v2 = -[OOPAWebViewController init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)WKWebViewConfiguration);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[WKWebsiteDataStore nonPersistentDataStore](WKWebsiteDataStore, "nonPersistentDataStore"));
    objc_msgSend(v3, "setWebsiteDataStore:", v4);

    v5 = (WKWebView *)objc_msgSend(objc_alloc((Class)WKWebView), "initWithFrame:configuration:", v3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    webView = v2->_webView;
    v2->_webView = v5;

    -[WKWebView setNavigationDelegate:](v2->_webView, "setNavigationDelegate:", v2);
    -[OOPAWebViewController setView:](v2, "setView:", v2->_webView);

  }
  return v2;
}

- (void)setNavBarTitle:(id)a3
{
  NSString *v4;
  NSString *navBarTitle;
  OOPASpinnerTitle *v6;
  void *v7;
  void *v8;
  OOPASpinnerTitle *v9;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  navBarTitle = self->_navBarTitle;
  self->_navBarTitle = v4;

  if (self->_hasAlreadyAppeared)
  {
    v6 = [OOPASpinnerTitle alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navBarTitle](self, "navBarTitle"));
    v9 = -[OOPASpinnerTitle initWithTitle:](v6, "initWithTitle:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setTitleView:", v9);

  }
}

- (void)setAuthURL:(id)a3
{
  NSURL *v4;
  NSURL *authURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  authURL = self->_authURL;
  self->_authURL = v4;

  -[OOPAWebViewController _loadWebViewIfReady](self, "_loadWebViewIfReady");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  OOPASpinnerTitle *v6;
  void *v7;
  OOPASpinnerTitle *v8;
  void *v9;
  id v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *backButton;
  UIBarButtonItem *v14;
  UIBarButtonItem *forwardButton;
  void *v16;
  UIBarButtonItem *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[2];

  self->_hasAlreadyAppeared = 1;
  v20.receiver = self;
  v20.super_class = (Class)OOPAWebViewController;
  -[OOPAWebViewController viewWillAppear:](&v20, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setHidesBackButton:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navBarTitle](self, "navBarTitle"));
  if (v5)
  {
    v6 = [OOPASpinnerTitle alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navBarTitle](self, "navBarTitle"));
    v8 = -[OOPASpinnerTitle initWithTitle:](v6, "initWithTitle:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setTitleView:", v8);

  }
  v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelButtonTapped:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  v12 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 101, self, "_backButtonTapped:");
  backButton = self->_backButton;
  self->_backButton = v12;

  v14 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 102, self, "_forwardButtonTapped:");
  forwardButton = self->_forwardButton;
  self->_forwardButton = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
  v17 = self->_forwardButton;
  v21[0] = self->_backButton;
  v21[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  objc_msgSend(v16, "setLeftBarButtonItems:", v18);

  -[OOPAWebViewController _updateNavigationButtons](self, "_updateNavigationButtons");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController authURL](self, "authURL"));
  -[OOPAWebViewController _updateNavigationPromptWithActiveURL:](self, "_updateNavigationPromptWithActiveURL:", v19);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OOPAWebViewController;
  -[OOPAWebViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[OOPAWebViewController _loadWebViewIfReady](self, "_loadWebViewIfReady");
}

- (void)_loadWebViewIfReady
{
  if (self->_hasAlreadyAppeared && !self->_urlRequest)
  {
    if (self->_authURL)
      -[OOPAWebViewController _loadWebView](self, "_loadWebView");
  }
}

- (void)_loadWebView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSMutableURLRequest *v10;
  NSMutableURLRequest *urlRequest;
  id v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL resourceSpecifier](self->_authURL, "resourceSpecifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("https://gil.apple.com/"), "stringByAppendingString:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  v7 = _ACLogSystem();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100003FC4((uint64_t)v6, v8, v9);

  v10 = (NSMutableURLRequest *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v6, 1, 30.0));
  urlRequest = self->_urlRequest;
  self->_urlRequest = v10;

  v12 = +[NSURLConnection connectionWithRequest:delegate:](NSURLConnection, "connectionWithRequest:delegate:", self->_urlRequest, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "titleView"));
  objc_msgSend(v14, "startAnimating");

}

- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4
{
  return 1;
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = _ACLogSystem();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_100004030(v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "host"));
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("gil.apple.com"));

  if (v13)
  {
    v14 = v8;
  }
  else
  {
    v15 = objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v7, "cancel");
    v16 = -[WKWebView loadRequest:](self->_webView, "loadRequest:", v15);

    v14 = 0;
  }

  return v14;
}

- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  __SecTrust *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;

  v4 = a4;
  v5 = _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10000412C();

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protectionSpace"));
  v8 = (__SecTrust *)objc_msgSend(v7, "serverTrust");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protectionSpace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authenticationMethod"));
  v11 = objc_msgSend(v10, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

  if (v11)
  {
    if (SecTrustEvaluateWithError(v8, 0))
    {
      v12 = SecTrustCopyInfo(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      if (v13)
      {
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", kSecTrustInfoCompanyNameKey));
        v16 = v15;
        if (v15 && objc_msgSend(v15, "isEqualToString:", CFSTR("Apple Inc.")))
        {
          v17 = _ACLogSystem();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            sub_100004100();

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sender"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", v8));
          objc_msgSend(v19, "useCredential:forAuthenticationChallenge:", v20, v4);

          goto LABEL_15;
        }

      }
    }
  }
  v21 = _ACLogSystem();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    sub_1000040D4();

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sender"));
  objc_msgSend(v19, "cancelAuthenticationChallenge:", v4);
LABEL_15:

}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  v6 = _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100004158((uint64_t)v5, v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController delegate](self, "delegate"));
  objc_msgSend(v9, "webViewController:didFinishWithSuccess:response:", self, 0, 0);

}

- (void)_cancelButtonTapped:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;

  v4 = _ACLogSystem(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000041C4();

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController delegate](self, "delegate"));
  objc_msgSend(v6, "webViewController:didFinishWithSuccess:response:", self, 0, 0);

}

- (void)_backButtonTapped:(id)a3
{
  id v3;

  v3 = -[WKWebView goBack](self->_webView, "goBack", a3);
}

- (void)_forwardButtonTapped:(id)a3
{
  id v3;

  v3 = -[WKWebView goForward](self->_webView, "goForward", a3);
}

- (void)_updateNavigationButtons
{
  -[UIBarButtonItem setEnabled:](self->_backButton, "setEnabled:", -[WKWebView canGoBack](self->_webView, "canGoBack"));
  -[UIBarButtonItem setEnabled:](self->_forwardButton, "setEnabled:", -[WKWebView canGoForward](self->_webView, "canGoForward"));
}

- (void)_updateNavigationPromptWithActiveURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
    objc_msgSend(v4, "setPrompt:", v5);

  }
  else
  {
    objc_msgSend(v4, "setPrompt:", &stru_100008338);
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];

  v7 = (void (**)(id, _QWORD))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("account://"));

  if (v11)
  {
    v15 = _ACLogSystem(v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "\"OOPAWebViewController caught account:// redirect!\", v18, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController delegate](self, "delegate"));
    objc_msgSend(v17, "webViewController:didFinishWithSuccess:response:", self, 1, 0);

    v7[2](v7, 0);
  }
  else
  {
    v7[2](v7, 1);
  }

}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleView"));
  objc_msgSend(v4, "startAnimating");

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!self->_hidingWebView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleView"));
    objc_msgSend(v6, "stopAnimating");

  }
  -[OOPAWebViewController _updateNavigationButtons](self, "_updateNavigationButtons");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  -[OOPAWebViewController _updateNavigationPromptWithActiveURL:](self, "_updateNavigationPromptWithActiveURL:", v7);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v6 = a5;
  v9 = _ACLogSystem(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "\"OOPAWebViewController failed to load page with error: %@\", (uint8_t *)&v13, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OOPAWebViewController navigationItem](self, "navigationItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleView"));
  objc_msgSend(v12, "stopAnimating");

  -[OOPAWebViewController _updateNavigationButtons](self, "_updateNavigationButtons");
}

- (OOPAWebViewControllerDelegate)delegate
{
  return (OOPAWebViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)authURL
{
  return self->_authURL;
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_authURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_forwardButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
