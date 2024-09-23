@implementation BCWebViewController

- (BCWebViewController)initWithCallbackURI:(id)a3
{
  id v5;
  BCWebViewController *v6;
  BCWebViewController *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  WKWebView *webkitView;
  BCProgressIndicatorView *v13;
  BCProgressIndicatorView *progressIndicatorView;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BCWebViewController;
  v6 = -[BCWebViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackURI, a3);
    v8 = objc_alloc_init(MEMORY[0x24BDFA920]);
    objc_msgSend(MEMORY[0x24BDFA928], "nonPersistentDataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWebsiteDataStore:", v9);

    v10 = objc_alloc(MEMORY[0x24BDFA918]);
    v11 = objc_msgSend(v10, "initWithFrame:configuration:", v8, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    webkitView = v7->_webkitView;
    v7->_webkitView = (WKWebView *)v11;

    v13 = objc_alloc_init(BCProgressIndicatorView);
    progressIndicatorView = v7->_progressIndicatorView;
    v7->_progressIndicatorView = v13;

  }
  return v7;
}

- (void)loadURL:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BDD1840];
  v6 = a3;
  v9 = (id)objc_msgSend([v5 alloc], "initWithURL:", v6);
  -[BCWebViewController webkitView](self, "webkitView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "loadRequest:", v9);

  if (self)
  {
    objc_storeStrong((id *)&self->_originURL, a3);

    self->_wasCallbackCaptured = 0;
  }
  else
  {

  }
}

- (void)reload
{
  NSObject *v3;
  BCServerErrorView *serverErrorView;
  BCServerErrorView *v5;
  BCInvalidCertificatView *invalidCertificatView;
  BCInvalidCertificatView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSURL *originURL;
  uint8_t v13[16];

  LogCategory_Daemon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21C655000, v3, OS_LOG_TYPE_DEFAULT, "BCWebViewController: reload", v13, 2u);
  }

  if (self)
  {
    self->_wasCallbackCaptured = 0;
    serverErrorView = self->_serverErrorView;
    if (serverErrorView)
    {
      -[BCServerErrorView removeFromSuperview](serverErrorView, "removeFromSuperview");
      v5 = self->_serverErrorView;
      self->_serverErrorView = 0;

    }
    invalidCertificatView = self->_invalidCertificatView;
    if (invalidCertificatView)
    {
      -[BCInvalidCertificatView removeFromSuperview](invalidCertificatView, "removeFromSuperview");
      v7 = self->_invalidCertificatView;
      self->_invalidCertificatView = 0;

    }
  }
  -[BCWebViewController webkitView](self, "webkitView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[BCWebViewController webkitView](self, "webkitView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "reload");

  }
  else
  {
    if (self)
      originURL = self->_originURL;
    else
      originURL = 0;
    -[BCWebViewController loadURL:](self, "loadURL:", originURL);
  }
}

- (void)updateNavigationBar
{
  NSObject *v2;
  uint8_t v3[16];

  LogCategory_Daemon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C655000, v2, OS_LOG_TYPE_DEFAULT, "BCWebViewController: updateNavigationBar", v3, 2u);
  }

}

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[BCWebViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BCProgressIndicatorView *v8;
  void *v9;
  void *v10;
  void *v11;
  BCProgressIndicatorView *v12;
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
  BCProgressIndicatorView *v24;
  objc_super v25;
  uint8_t buf[8];
  void *v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)BCWebViewController;
  -[BCWebViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[BCWebViewController setupSubviews](self, "setupSubviews");
  -[BCWebViewController setupConstraints](self, "setupConstraints");
  if (self)
  {
    LogCategory_Daemon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C655000, v3, OS_LOG_TYPE_DEFAULT, "BCWebViewController: setupObservers", buf, 2u);
    }

    -[BCWebViewController webkitView](self, "webkitView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("hasOnlySecureContent"), 1, 0);

    -[BCWebViewController webkitView](self, "webkitView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("estimatedProgress"), 1, 0);

    -[BCWebViewController webkitView](self, "webkitView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("canGoBack"), 1, 0);

    -[BCWebViewController webkitView](self, "webkitView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("canGoForward"), 1, 0);

    -[BCProgressIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_progressIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)MEMORY[0x24BDD1628];
    v24 = self->_progressIndicatorView;
    -[BCProgressIndicatorView topAnchor](v24, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCWebViewController webkitView](self, "webkitView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v20;
    v8 = self->_progressIndicatorView;
    -[BCProgressIndicatorView leadingAnchor](v8, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCWebViewController webkitView](self, "webkitView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v10, -0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v11;
    v12 = self->_progressIndicatorView;
    -[BCProgressIndicatorView trailingAnchor](v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCWebViewController webkitView](self, "webkitView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v17);

  }
}

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BCProgressIndicatorView *progressIndicatorView;
  id v10;

  _SFIPhoneSafariUserAgentString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController webkitView](self, "webkitView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomUserAgent:", v3);

  -[BCWebViewController webkitView](self, "webkitView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationDelegate:", self);

  -[BCWebViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController webkitView](self, "webkitView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[BCWebViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    progressIndicatorView = self->_progressIndicatorView;
  else
    progressIndicatorView = 0;
  v10 = v8;
  objc_msgSend(v8, "addSubview:", progressIndicatorView);

}

- (void)setupConstraints
{
  void *v3;
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
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  -[BCWebViewController webkitView](self, "webkitView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v16 = (void *)MEMORY[0x24BDD1628];
  -[BCWebViewController webkitView](self, "webkitView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  -[BCWebViewController webkitView](self, "webkitView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  -[BCWebViewController webkitView](self, "webkitView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v7;
  -[BCWebViewController webkitView](self, "webkitView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v13);

}

- (void)presentCertificatErrorForHost:(id)a3
{
  id v4;
  NSObject *v5;
  id *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v4;
    _os_log_impl(&dword_21C655000, v5, OS_LOG_TYPE_DEFAULT, "BCWebViewController: presentCertificatErrorForHost: %@", buf, 0xCu);
  }

  v26 = v4;
  v6 = -[BCInvalidCertificatView initWithHost:]((id *)[BCInvalidCertificatView alloc], v4);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BCWebViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  v18 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v6, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController webkitView](self, "webkitView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v22;
  objc_msgSend(v6, "leftAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController webkitView](self, "webkitView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  objc_msgSend(v6, "rightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController webkitView](self, "webkitView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v10;
  objc_msgSend(v6, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCWebViewController webkitView](self, "webkitView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v15);

  if (self)
    objc_storeStrong((id *)&self->_invalidCertificatView, v6);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  double v18;
  float v19;
  BCProgressIndicatorView *progressIndicatorView;
  dispatch_time_t v21;
  _QWORD block[5];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((!self || !self->_wasCallbackCaptured)
    && objc_msgSend(v9, "isEqualToString:", CFSTR("hasOnlySecureContent")))
  {
    -[BCWebViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCWebViewController webkitView](self, "webkitView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didChangeSecureStatus:", objc_msgSend(v13, "hasOnlySecureContent"));

  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("canGoBack")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("canGoForward")))
  {
    -[BCWebViewController updateNavigationBar](self, "updateNavigationBar");
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("estimatedProgress")))
  {
    -[BCWebViewController webkitView](self, "webkitView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "estimatedProgress");
    v16 = v15;

    if (self)
    {
      -[BCProgressIndicatorView progress](self->_progressIndicatorView, "progress");
      v19 = *(float *)&v18;
      progressIndicatorView = self->_progressIndicatorView;
    }
    else
    {
      objc_msgSend(0, "progress");
      v19 = *(float *)&v18;
      progressIndicatorView = 0;
    }
    *(float *)&v18 = v16;
    -[BCProgressIndicatorView setProgress:animated:](progressIndicatorView, "setProgress:animated:", 1, v18);
    if (v16 >= 1.0)
    {
      v17 = v16;
      v21 = dispatch_time(0, (uint64_t)(float)(vabds_f32(v17, v19) * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__BCWebViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_24E064CC8;
      block[4] = self;
      dispatch_after(v21, MEMORY[0x24BDAC9B8], block);
    }
  }

}

uint64_t __70__BCWebViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return -[BCProgressIndicatorView hide](*(_QWORD *)(v1 + 1008));
  else
    return -[BCProgressIndicatorView hide](0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = a3;
  objc_msgSend(v8, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LogCategory_Daemon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "baseURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v14;
    _os_log_impl(&dword_21C655000, v13, OS_LOG_TYPE_DEFAULT, "BCWebViewController: decidePolicyFor %@", (uint8_t *)&v20, 0xCu);

  }
  -[BCWebViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "didChangeNavigationURL:", v16);
  if (objc_msgSend(v15, "shouldHandleRedirectURI:", v12))
  {
    LogCategory_Daemon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "baseURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_21C655000, v17, OS_LOG_TYPE_DEFAULT, "BCWebViewController: capturing URL: %@", (uint8_t *)&v20, 0xCu);

    }
    if (self)
      self->_wasCallbackCaptured = 1;
    v9[2](v9, 0);
    objc_msgSend(v8, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "didReceiveCallbackRequest:", v19);

  }
  else
  {
    v9[2](v9, 1);
  }

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  BCServerErrorView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BCServerErrorView *serverErrorView;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t v42[16];
  __int128 buf;
  void *v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_error_impl(&dword_21C655000, v7, OS_LOG_TYPE_ERROR, "BCWebViewController: didFailProvisionalNavigation error: %@", (uint8_t *)&buf, 0xCu);
  }

  if (!self || !self->_wasCallbackCaptured)
  {
    -[BCWebViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD1308]))
    {
      v10 = v6;
      v11 = v10;
      if (self)
      {
        v12 = objc_msgSend(v10, "code") + 1206;

        if (v12 < 6)
        {
          LogCategory_Daemon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_21C655000, v13, OS_LOG_TYPE_DEFAULT, "BCWebViewController: provisional error is related to certificate", (uint8_t *)&buf, 2u);
          }

          objc_msgSend(v11, "userInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD1310]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "host");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_webkit_decodeHostName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          -[BCWebViewController presentCertificatErrorForHost:](self, "presentCertificatErrorForHost:", v17);
          objc_msgSend(v8, "didChangeSecureStatus:", 0);

          goto LABEL_16;
        }
        goto LABEL_12;
      }

    }
    else
    {

      if (self)
      {
LABEL_12:
        v40 = v8;
        v41 = v6;
        LogCategory_Daemon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_21C655000, v18, OS_LOG_TYPE_DEFAULT, "BCWebViewController: presentServerError", v42, 2u);
        }

        v19 = (BCServerErrorView *)objc_opt_new();
        -[BCServerErrorView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[BCWebViewController view](self, "view");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSubview:", v19);

        v32 = (void *)MEMORY[0x24BDD1628];
        -[BCServerErrorView topAnchor](v19, "topAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[BCWebViewController webkitView](self, "webkitView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "topAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintEqualToAnchor:", v37);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = v36;
        -[BCServerErrorView leftAnchor](v19, "leftAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[BCWebViewController webkitView](self, "webkitView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "leftAnchor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "constraintEqualToAnchor:", v33);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)&buf + 1) = v31;
        -[BCServerErrorView rightAnchor](v19, "rightAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[BCWebViewController webkitView](self, "webkitView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rightAnchor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintEqualToAnchor:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v23;
        -[BCServerErrorView bottomAnchor](v19, "bottomAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[BCWebViewController webkitView](self, "webkitView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bottomAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v27;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &buf, 4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "activateConstraints:", v28);

        serverErrorView = self->_serverErrorView;
        self->_serverErrorView = v19;

        v8 = v40;
        v6 = v41;
      }
    }
    objc_msgSend(v8, "didChangeSecureStatus:", 0);
LABEL_16:

  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  NSObject *v5;
  BCProgressIndicatorView *progressIndicatorView;
  uint8_t v7[16];

  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21C655000, v5, OS_LOG_TYPE_DEFAULT, "BCWebViewController: didStartProvisionalNavigation", v7, 2u);
  }

  if (self)
    progressIndicatorView = self->_progressIndicatorView;
  else
    progressIndicatorView = 0;
  -[BCProgressIndicatorView show](progressIndicatorView);
}

- (BCWebViewControllerDelegate)delegate
{
  return (BCWebViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WKWebView)webkitView
{
  return self->_webkitView;
}

- (void)setWebkitView:(id)a3
{
  objc_storeStrong((id *)&self->_webkitView, a3);
}

- (NSString)callbackURI
{
  return self->_callbackURI;
}

- (void)setCallbackURI:(id)a3
{
  objc_storeStrong((id *)&self->_callbackURI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_serverErrorView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_invalidCertificatView, 0);
  objc_storeStrong((id *)&self->_callbackURI, 0);
  objc_storeStrong((id *)&self->_webkitView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
