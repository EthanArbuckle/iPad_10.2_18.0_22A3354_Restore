@implementation MUWebBasedPlacecardViewController

- (MUWebBasedPlacecardViewController)initWithURL:(id)a3 traits:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  MUWebBasedPlacecardViewController *v11;
  MUWebBasedPlacecardViewController *v12;
  MUWebBasedPlacecardViewController *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isNetworkReachable");

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)MUWebBasedPlacecardViewController;
    v11 = -[MUWebBasedPlacecardViewController init](&v15, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_url, a3);
      objc_storeStrong((id *)&v12->_webContentTraits, a4);
      v12->_defaultHeight = 800.0;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *heightConstraint;
  MUWebPlacecardBridgeConfiguration *v7;
  MUWebPlacecardBridge *v8;
  void *v9;
  MUWebPlacecardBridge *v10;
  MUWebPlacecardBridge *bridge;
  WKWebView *v12;
  WKWebView *webView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  void *v23;
  void *v24;
  id v25;
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
  MUWebPlacecardBridgeConfiguration *v36;
  objc_super v37;
  _QWORD v38[7];

  v38[5] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)MUWebBasedPlacecardViewController;
  -[MUWebBasedPlacecardViewController viewDidLoad](&v37, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[MUWebBasedPlacecardViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, 0, 0, 1.0, self->_defaultHeight);
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v5;

  v7 = -[MUWebPlacecardBridgeConfiguration initWithNativeControllerName:webControllerName:]([MUWebPlacecardBridgeConfiguration alloc], "initWithNativeControllerName:webControllerName:", CFSTR("PlacecardNativeController"), CFSTR("PlacecardWebController"));
  v8 = [MUWebPlacecardBridge alloc];
  -[MUWebBasedPlacecardViewController webBridgeDelegate](self, "webBridgeDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v7;
  v10 = -[MUWebPlacecardBridge initWithConfiguration:delegate:](v8, "initWithConfiguration:delegate:", v7, v9);
  bridge = self->_bridge;
  self->_bridge = v10;

  -[MUWebPlacecardBridge webView](self->_bridge, "webView");
  v12 = (WKWebView *)objc_claimAutoreleasedReturnValue();
  webView = self->_webView;
  self->_webView = v12;

  -[WKWebView setAccessibilityIdentifier:](self->_webView, "setAccessibilityIdentifier:", CFSTR("MUWebPlacecard"));
  -[MUWebBasedPlacecardViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_webView);

  v28 = (void *)MEMORY[0x1E0CB3718];
  -[WKWebView leadingAnchor](self->_webView, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebBasedPlacecardViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v32;
  -[WKWebView trailingAnchor](self->_webView, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebBasedPlacecardViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v27;
  -[WKWebView topAnchor](self->_webView, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebBasedPlacecardViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v17;
  -[WKWebView bottomAnchor](self->_webView, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUWebBasedPlacecardViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_heightConstraint;
  v38[3] = v21;
  v38[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v23);

  if (self->_url)
  {
    objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[WKWebView loadRequest:](self->_webView, "loadRequest:", v24);

  }
}

- (void)callMethod:(id)a3 arguments:(id)a4
{
  -[MUWebPlacecardBridge callMethod:arguments:](self->_bridge, "callMethod:arguments:", a3, a4);
}

- (NSURL)url
{
  return self->_url;
}

- (MUWebPlacecardBridgeDelegate)webBridgeDelegate
{
  return (MUWebPlacecardBridgeDelegate *)objc_loadWeakRetained((id *)&self->_webBridgeDelegate);
}

- (void)setWebBridgeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_webBridgeDelegate, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_webBridgeDelegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_webContentTraits, 0);
  objc_storeStrong((id *)&self->_bridge, 0);
}

@end
