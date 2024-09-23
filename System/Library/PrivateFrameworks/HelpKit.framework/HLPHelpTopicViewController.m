@implementation HLPHelpTopicViewController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7670], 0);

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showWebViewDelay, 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", 0);
  +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSessionItem:", self->_URLSessionItem);

  v5.receiver = self;
  v5.super_class = (Class)HLPHelpTopicViewController;
  -[HLPHelpTopicViewController dealloc](&v5, sel_dealloc);
}

- (HLPHelpTopicViewController)init
{
  HLPHelpTopicViewController *v2;
  uint64_t v3;
  NSMutableDictionary *webViewRequestsMap;
  uint64_t v5;
  NSMutableDictionary *webViewRequestsDataMap;
  void *v7;
  NSCache *v8;
  NSCache *topicCache;
  uint64_t v10;
  NSMutableArray *topicHistory;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HLPHelpTopicViewController;
  v2 = -[HLPHelpTopicViewController init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    webViewRequestsMap = v2->_webViewRequestsMap;
    v2->_webViewRequestsMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    webViewRequestsDataMap = v2->_webViewRequestsDataMap;
    v2->_webViewRequestsDataMap = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_RTL = objc_msgSend(v7, "userInterfaceLayoutDirection") == 1;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    topicCache = v2->_topicCache;
    v2->_topicCache = v8;

    -[NSCache setTotalCostLimit:](v2->_topicCache, "setTotalCostLimit:", 0x200000);
    v10 = objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    topicHistory = v2->_topicHistory;
    v2->_topicHistory = (NSMutableArray *)v10;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTopicViewController;
  -[HLPHelpTopicViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HLPHelpTopicViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[HLPHelpTopicViewController updateNavigationBar](self, "updateNavigationBar");
  -[HLPHelpTopicViewController updateBackgroundColor](self, "updateBackgroundColor");
  -[HLPHelpTopicViewController registerTraitChanges](self, "registerTraitChanges");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTopicViewController;
  -[HLPHelpTopicViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  -[HLPHelpTopicViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  -[NSLayoutConstraint setConstant:](self->_loadingViewTopConstraint, "setConstant:");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id interactivePopGestureRecognizerDelegate;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HLPHelpTopicViewController;
  -[HLPHelpTopicViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

  -[HLPHelpTopicViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  interactivePopGestureRecognizerDelegate = self->_interactivePopGestureRecognizerDelegate;
  self->_interactivePopGestureRecognizerDelegate = v7;

  -[HLPHelpTopicViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interactivePopGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[HLPHelpTopicViewController updateDoneButton](self, "updateDoneButton");
  -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HLPHelpTopicViewController fullBookView](self, "fullBookView") && v11)
  {
    -[HLPHelpBookController helpTopicItemForID:](self->_helpBookController, "helpTopicItemForID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "helpTopicViewController:selectedHelpTopicItem:accessType:", self, v12, 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTopicViewController;
  -[HLPHelpTopicViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_canShowTOC = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  id interactivePopGestureRecognizerDelegate;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HLPHelpTopicViewController;
  -[HLPHelpTopicViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[HLPHelpTopicViewController updateScrollPositionForCurrentTopicItem](self, "updateScrollPositionForCurrentTopicItem");
  -[HLPHelpTopicViewController saveCurrentTopicItem](self, "saveCurrentTopicItem");
  interactivePopGestureRecognizerDelegate = self->_interactivePopGestureRecognizerDelegate;
  -[HLPHelpTopicViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", interactivePopGestureRecognizerDelegate);

  v7 = self->_interactivePopGestureRecognizerDelegate;
  self->_interactivePopGestureRecognizerDelegate = 0;

}

- (void)setFullBookView:(BOOL)a3
{
  if (self->_fullBookView != a3)
  {
    self->_fullBookView = a3;
    -[HLPHelpTopicViewController updateNavigationBar](self, "updateNavigationBar");
  }
}

- (void)updateNavigationBar
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *tocBarButtonItem;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *backBarButtonItem;
  void *v11;
  void *v12;
  UIBarButtonItem *v13;
  UIBarButtonItem *forwardBarButtonItem;
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
  _QWORD v26[6];

  v26[5] = *MEMORY[0x24BDAC8D0];
  if (self->_displayHelpTopicsOnly || -[HLPHelpTopicViewController fullBookView](self, "fullBookView"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("list.bullet"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v25, 0, self, sel_showTableOfContent);
    tocBarButtonItem = self->_tocBarButtonItem;
    self->_tocBarButtonItem = v5;

    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Show Table of Contents"), &stru_24D32F538, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_tocBarButtonItem, "setAccessibilityLabel:", v8);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v23, "setWidth:", *(double *)&gHLPHelpTopicViewSpacerWidth);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.backward"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v24, 0, self, sel_backButtonTapped);
    backBarButtonItem = self->_backBarButtonItem;
    self->_backBarButtonItem = v9;

    -[UIBarButtonItem setEnabled:](self->_backBarButtonItem, "setEnabled:", 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v11, "setWidth:", *(double *)&gHLPHelpTopicViewSpacerWidth);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("chevron.forward"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithImage:style:target:action:", v12, 0, self, sel_forwardButtonTapped);
    forwardBarButtonItem = self->_forwardBarButtonItem;
    self->_forwardBarButtonItem = v13;

    -[UIBarButtonItem setEnabled:](self->_forwardBarButtonItem, "setEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Back"), &stru_24D32F538, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_backBarButtonItem, "setAccessibilityLabel:", v16);

    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Returns to the previously-visited topic."), &stru_24D32F538, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityHint:](self->_backBarButtonItem, "setAccessibilityHint:", v18);

    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Forward"), &stru_24D32F538, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityLabel:](self->_forwardBarButtonItem, "setAccessibilityLabel:", v20);

    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Navigates forward in the history of visited topics."), &stru_24D32F538, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityHint:](self->_forwardBarButtonItem, "setAccessibilityHint:", v22);

    v26[0] = self->_tocBarButtonItem;
    v26[1] = v23;
    v26[2] = self->_backBarButtonItem;
    v26[3] = v11;
    v26[4] = self->_forwardBarButtonItem;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HLPHelpTopicViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItems:", v3);

}

- (HLPHelpLoadingView)loadingView
{
  HLPHelpLoadingView *loadingView;
  HLPHelpLoadingView *v4;
  HLPHelpLoadingView *v5;
  HLPHelpLoadingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *loadingViewTopConstraint;
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

  loadingView = self->_loadingView;
  if (!loadingView)
  {
    v4 = [HLPHelpLoadingView alloc];
    v5 = -[HLPHelpLoadingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_loadingView;
    self->_loadingView = v5;

    -[HLPHelpLoadingView setDelegate:](self->_loadingView, "setDelegate:", self);
    -[HLPHelpLoadingView setSupportsDarkMode:](self->_loadingView, "setSupportsDarkMode:", self->_supportsDarkMode);
    -[HLPHelpLoadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HLPHelpTopicViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_loadingView);

    -[HLPHelpLoadingView topAnchor](self->_loadingView, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    loadingViewTopConstraint = self->_loadingViewTopConstraint;
    self->_loadingViewTopConstraint = v11;

    -[NSLayoutConstraint setActive:](self->_loadingViewTopConstraint, "setActive:", 1);
    -[HLPHelpLoadingView bottomAnchor](self->_loadingView, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[HLPHelpLoadingView leadingAnchor](self->_loadingView, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[HLPHelpLoadingView trailingAnchor](self->_loadingView, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    loadingView = self->_loadingView;
  }
  return loadingView;
}

- (WKWebView)webView
{
  WKWebView *webView;
  id v4;
  id v5;
  WKWebView *v6;
  WKWebView *v7;
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

  webView = self->_webView;
  if (!webView)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDFA920]);
    objc_msgSend(v4, "setAllowsInlineMediaPlayback:", 1);
    objc_msgSend(v4, "setURLSchemeHandler:forURLScheme:", self, CFSTR("apple-help-local"));
    objc_msgSend(v4, "setURLSchemeHandler:forURLScheme:", self, CFSTR("apple-help-remote-asset"));
    v5 = objc_alloc(MEMORY[0x24BDFA918]);
    v6 = (WKWebView *)objc_msgSend(v5, "initWithFrame:configuration:", v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v7 = self->_webView;
    self->_webView = v6;

    -[WKWebView setNavigationDelegate:](self->_webView, "setNavigationDelegate:", self);
    -[WKWebView scrollView](self->_webView, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    -[WKWebView setAllowsLinkPreview:](self->_webView, "setAllowsLinkPreview:", 0);
    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](self->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
      -[WKWebView setOpaque:](self->_webView, "setOpaque:", 0);
    -[HLPHelpTopicViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_webView);

    -[WKWebView leadingAnchor](self->_webView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[WKWebView trailingAnchor](self->_webView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[WKWebView topAnchor](self->_webView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[WKWebView bottomAnchor](self->_webView, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    webView = self->_webView;
  }
  return webView;
}

- (void)cleanup
{
  void *v2;
  id v3;

  -[HLPHelpTopicViewController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItems:", 0);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", kHLPHelpTopicViewControllerLastTopicHistoryItem);

}

- (void)setSupportsDarkMode:(BOOL)a3
{
  if (self->_supportsDarkMode != a3)
    self->_supportsDarkMode = a3;
  -[HLPHelpTopicViewController updateBackgroundColor](self, "updateBackgroundColor");
}

- (void)updateBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_supportsDarkMode)
  {
    if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
      objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    -[WKWebView setBackgroundColor:](self->_webView, "setBackgroundColor:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[WKWebView setBackgroundColor:](self->_webView, "setBackgroundColor:", v6);
  }

}

- (void)setHideDoneButton:(BOOL)a3
{
  self->_hideDoneButton = a3;
  -[HLPHelpTopicViewController updateDoneButton](self, "updateDoneButton");
}

- (void)updateDoneButton
{
  void *v3;
  id v4;

  if (-[HLPHelpTopicViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (self->_hideDoneButton)
      v4 = 0;
    else
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss);
    -[HLPHelpTopicViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", v4);

  }
}

- (void)backButtonTapped
{
  id v3;

  +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", 0, 2, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTopicViewController _loadWithInfo:](self, "_loadWithInfo:", v3);

}

- (void)forwardButtonTapped
{
  id v3;

  +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", 0, 3, 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTopicViewController _loadWithInfo:](self, "_loadWithInfo:", v3);

}

- (void)updateScrollPositionForCurrentTopicItem
{
  void *v3;
  id v4;

  -[WKWebView scrollView](self->_webView, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  -[HLPHelpTopicHistoryItem setContentSize:](self->_currentTopicHistoryItem, "setContentSize:");

  -[WKWebView scrollView](self->_webView, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  -[HLPHelpTopicHistoryItem setContentOffset:](self->_currentTopicHistoryItem, "setContentOffset:");

}

- (void)updateNavigationButtons
{
  HLPHelpTopicHistoryItem *v3;
  HLPHelpTopicHistoryItem *v4;

  if (-[NSMutableArray count](self->_topicHistory, "count"))
  {
    -[NSMutableArray firstObject](self->_topicHistory, "firstObject");
    v3 = (HLPHelpTopicHistoryItem *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](self->_backBarButtonItem, "setEnabled:", v3 != self->_currentTopicHistoryItem);

  }
  else
  {
    -[UIBarButtonItem setEnabled:](self->_backBarButtonItem, "setEnabled:", 0);
  }
  if (-[NSMutableArray count](self->_topicHistory, "count"))
  {
    -[NSMutableArray lastObject](self->_topicHistory, "lastObject");
    v4 = (HLPHelpTopicHistoryItem *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](self->_forwardBarButtonItem, "setEnabled:", v4 != self->_currentTopicHistoryItem);

  }
  else
  {
    -[UIBarButtonItem setEnabled:](self->_forwardBarButtonItem, "setEnabled:", 0);
  }
}

- (void)showTableOfContent
{
  void *v3;
  char v4;
  id v5;

  if (self->_canShowTOC && -[UIBarButtonItem isEnabled](self->_tocBarButtonItem, "isEnabled"))
  {
    -[HLPHelpTopicViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      self->_canShowTOC = 0;
      -[HLPHelpTopicViewController delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "helpTopicViewControllerTableOfContentButtonTapped:", self);

    }
  }
}

- (void)dismiss
{
  id v3;

  -[HLPHelpTopicViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "helpTopicViewControllerDoneButtonTapped:", self);

}

- (void)logAnalyticsContentViewedWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 fromTopicID:(id)a6 externalURLString:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[HLPHelpTopicViewController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HLPAnalyticsEventContentViewed eventWithTopicID:topicTitle:source:interfaceStyle:](HLPAnalyticsEventContentViewed, "eventWithTopicID:topicTitle:source:interfaceStyle:", v21, v12, v13, objc_msgSend(v16, "userInterfaceStyle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFromTopicID:", v18);

  }
  if (objc_msgSend(v15, "length"))
    objc_msgSend(v17, "setExternalURLString:", v15);
  objc_msgSend(v17, "log");
  -[HLPHelpTopicViewController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTopicViewController traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "helpTopicViewControllerContentViewed:topicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", self, v21, v12, v13, objc_msgSend(v20, "userInterfaceStyle"), v14, v15);

}

- (void)saveCurrentTopicItem
{
  HLPHelpBookController *helpBookController;
  void *v4;
  void *v5;
  HLPHelpTopicHistoryItem *currentTopicHistoryItem;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  helpBookController = self->_helpBookController;
  -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpBookController helpTopicItemForID:](helpBookController, "helpTopicItemForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isGlossary") & 1) == 0)
  {
    currentTopicHistoryItem = self->_currentTopicHistoryItem;
    if (currentTopicHistoryItem)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", currentTopicHistoryItem, 1, &v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      if (v8)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, kHLPHelpTopicViewControllerLastTopicHistoryItem);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "synchronize");

    v8 = 0;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setDarkModeEnabled:(BOOL)a3
{
  if (self->_darkModeEnabled != a3)
  {
    self->_darkModeEnabled = a3;
    if (a3 && !self->_supportsDarkMode)
      -[HLPHelpTopicViewController setSupportsDarkMode:](self, "setSupportsDarkMode:", 1);
  }
}

- (void)reloadCurrentTopic
{
  HLPHelpBookController *helpBookController;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  helpBookController = self->_helpBookController;
  -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpBookController helpTopicItemForID:](helpBookController, "helpTopicItemForID:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HLPHelpTopicHistoryItem anchor](self->_currentTopicHistoryItem, "anchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", v7, 4, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTopicViewController _loadWithInfo:](self, "_loadWithInfo:", v6);

}

- (void)loadWithInfo:(id)a3
{
  -[HLPHelpTopicViewController loadWithInfo:allowErrorMessage:](self, "loadWithInfo:allowErrorMessage:", a3, 1);
}

- (void)loadWithInfo:(id)a3 allowErrorMessage:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableArray *topicHistory;
  void *v7;
  id v8;

  v4 = a4;
  topicHistory = self->_topicHistory;
  v8 = a3;
  if (-[NSMutableArray count](topicHistory, "count"))
  {
    -[UIBarButtonItem setEnabled:](self->_tocBarButtonItem, "setEnabled:", 1);
  }
  else
  {
    objc_msgSend(v8, "helpTopicItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setEnabled:](self->_tocBarButtonItem, "setEnabled:", v7 != 0);

  }
  -[HLPHelpTopicViewController _loadWithInfo:allowErrorMessage:](self, "_loadWithInfo:allowErrorMessage:", v8, v4);

}

- (void)loadHelpTopicItem:(id)a3 searchTerms:(id)a4 anchor:(id)a5
{
  id v6;

  +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", a3, 0, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTopicViewController loadWithInfo:](self, "loadWithInfo:", v6);

}

- (void)_loadWithInfo:(id)a3
{
  -[HLPHelpTopicViewController _loadWithInfo:allowErrorMessage:](self, "_loadWithInfo:allowErrorMessage:", a3, 1);
}

- (void)_loadWithInfo:(id)a3 allowErrorMessage:(BOOL)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  HLPHelpTopicViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  HLPHelpTopicHistoryItem *v38;
  id v39;
  HLPHelpTopicHistoryItem *v40;
  void *v41;
  void *v42;
  char v43;
  HLPHelpTopicHistoryItem *v44;
  HLPHelpTopicHistoryItem *v45;
  HLPHelpTopicHistoryItem *v46;
  void *v47;
  void *v48;
  HLPHelpTopicHistoryItem *v49;
  NSCache *topicCache;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  HLPURLSessionItem *v65;
  HLPURLSessionItem *URLSessionItem;
  uint64_t v67;
  HLPHelpTopicHistoryItem *v68;
  HLPHelpTopicHistoryItem *v69;
  HLPHelpBookController *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  NSURL *helpBookURL;
  void *v77;
  void *v78;
  void *v79;
  HLPURLSessionItem *v80;
  HLPURLSessionItem *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  HLPHelpTopicHistoryItem *v88;
  HLPHelpTopicHistoryItem *currentTopicHistoryItem;
  HLPHelpBookController *helpBookController;
  void *v91;
  _BOOL4 v92;
  uint64_t v93;
  id obj;
  void *v95;
  _QWORD v96[4];
  id v97;
  id v98;
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  id v104;
  uint8_t buf[4];
  void *v106;
  uint64_t v107;

  v92 = a4;
  v107 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "helpTopicItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTerms");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v5, "accessType");
  HLPLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v106 = v6;
    _os_log_impl(&dword_2153AA000, v7, OS_LOG_TYPE_DEFAULT, "Loading topic %@", buf, 0xCu);
  }

  if (!self->_helpBookURL)
  {
    -[HLPHelpTopicViewController loadingView](self, "loadingView");
    v9 = (HLPHelpTopicViewController *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController showActivityIndicator:](v9, "showActivityIndicator:", 1);
LABEL_67:

    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showWebViewDelay, 0);
  v8 = self->_displayHelpTopicsOnly || +[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS");
  if (v8 && v93 == 1)
  {
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:](self, "logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:", v10, v11, CFSTR("link"), v12, &stru_24D32F538);

    v9 = objc_alloc_init(HLPHelpTopicViewController);
    -[HLPHelpTopicViewController setDisplayHelpTopicsOnly:](v9, "setDisplayHelpTopicsOnly:", self->_displayHelpTopicsOnly);
    if (objc_msgSend(v6, "isGlossary"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Glossary"), &stru_24D32F538, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTopicViewController setTitle:](v9, "setTitle:", v14);

    }
    else
    {
      if (!self->_showTopicNameAsTitle)
      {
LABEL_34:
        -[HLPHelpTopicViewController navigationController](self, "navigationController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "pushViewController:animated:", v9, 1);

        -[HLPHelpTopicViewController setFullBookView:](v9, "setFullBookView:", self->_fullBookView);
        -[HLPHelpTopicViewController setHideDoneButton:](v9, "setHideDoneButton:", self->_hideDoneButton);
        -[HLPHelpTopicViewController setHelpBookController:](v9, "setHelpBookController:", self->_helpBookController);
        -[HLPHelpTopicViewController setShowTopicNameAsTitle:](v9, "setShowTopicNameAsTitle:", self->_showTopicNameAsTitle);
        -[HLPHelpTopicViewController setSingleTopic:](v9, "setSingleTopic:", self->_singleTopic);
        -[HLPHelpTopicViewController setDelegate:](v9, "setDelegate:", self);
        -[HLPHelpTopicViewController setHelpBookURL:](v9, "setHelpBookURL:", self->_helpBookURL);
        -[HLPHelpTopicViewController setSupportsDarkMode:](v9, "setSupportsDarkMode:", self->_supportsDarkMode);
        -[HLPHelpTopicViewController loadHelpTopicItem:searchTerms:anchor:](v9, "loadHelpTopicItem:searchTerms:anchor:", v6, 0, v95);
        goto LABEL_67;
      }
      objc_msgSend(v6, "name");
      v31 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v31;
      if (v31)
        v32 = (const __CFString *)v31;
      else
        v32 = &stru_24D32F538;
      -[HLPHelpTopicViewController setTitle:](v9, "setTitle:", v32);
    }

    goto LABEL_34;
  }
  v15 = !v8;
  if (v93 != 5)
    v15 = 1;
  if ((v15 & 1) != 0)
  {
    if ((unint64_t)(v93 + 1) > 7)
      goto LABEL_43;
    if (((1 << (v93 + 1)) & 0xC7) == 0)
    {
      if (v93 == 2)
      {
        v87 = -[NSMutableArray indexOfObject:](self->_topicHistory, "indexOfObject:", self->_currentTopicHistoryItem)
            - 1;
        if (v87 > 0x7FFFFFFFFFFFFFFDLL)
          goto LABEL_43;
        -[HLPHelpTopicViewController updateScrollPositionForCurrentTopicItem](self, "updateScrollPositionForCurrentTopicItem");
        -[NSMutableArray objectAtIndexedSubscript:](self->_topicHistory, "objectAtIndexedSubscript:", v87);
        v88 = (HLPHelpTopicHistoryItem *)objc_claimAutoreleasedReturnValue();
        currentTopicHistoryItem = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v88;

        helpBookController = self->_helpBookController;
        -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpBookController helpTopicItemForID:](helpBookController, "helpTopicItemForID:", v91);
        v72 = objc_claimAutoreleasedReturnValue();

        -[HLPHelpTopicHistoryItem anchor](self->_currentTopicHistoryItem, "anchor");
        v73 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v93 != 3)
          goto LABEL_43;
        v67 = -[NSMutableArray indexOfObject:](self->_topicHistory, "indexOfObject:", self->_currentTopicHistoryItem);
        if (v67 == 0x7FFFFFFFFFFFFFFFLL
          || v67 + 1 >= (unint64_t)-[NSMutableArray count](self->_topicHistory, "count"))
        {
          goto LABEL_43;
        }
        -[HLPHelpTopicViewController updateScrollPositionForCurrentTopicItem](self, "updateScrollPositionForCurrentTopicItem");
        -[NSMutableArray objectAtIndexedSubscript:](self->_topicHistory, "objectAtIndexedSubscript:", v67 + 1);
        v68 = (HLPHelpTopicHistoryItem *)objc_claimAutoreleasedReturnValue();
        v69 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v68;

        v70 = self->_helpBookController;
        -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpBookController helpTopicItemForID:](v70, "helpTopicItemForID:", v71);
        v72 = objc_claimAutoreleasedReturnValue();

        -[HLPHelpTopicHistoryItem anchor](self->_currentTopicHistoryItem, "anchor");
        v73 = objc_claimAutoreleasedReturnValue();

      }
      v95 = (void *)v73;
      v6 = (void *)v72;
      goto LABEL_43;
    }
  }
  else
  {
    -[HLPHelpTopicViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "popToRootViewControllerAnimated:", 0);

  }
  objc_msgSend(v6, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if (!v20
    || (-[HLPHelpTopicViewController searchTerms](self, "searchTerms"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v22 = v21 == obj,
        v21,
        !v22))
  {
    if (v93 == 1)
    {
      -[HLPHelpTopicViewController updateScrollPositionForCurrentTopicItem](self, "updateScrollPositionForCurrentTopicItem");
      objc_msgSend(v6, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpTopicViewController logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:](self, "logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:", v23, v24, CFSTR("link"), v25, &stru_24D32F538);

      objc_msgSend(v5, "setAnalyticsLogged:", 1);
    }
    v26 = -[NSMutableArray indexOfObject:](self->_topicHistory, "indexOfObject:", self->_currentTopicHistoryItem);
    if (v26 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)-[NSMutableArray count](self->_topicHistory, "count") >= 2)
    {
      v27 = v26 + 1;
      if (-[NSMutableArray count](self->_topicHistory, "count") > v27)
      {
        v28 = -[NSMutableArray count](self->_topicHistory, "count");
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v27, v28 - v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray removeObjectsAtIndexes:](self->_topicHistory, "removeObjectsAtIndexes:", v29);

      }
    }
    v30 = self->_currentTopicHistoryItem;
    if (v30)
    {
      self->_currentTopicHistoryItem = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", kHLPHelpTopicViewControllerLastTopicHistoryItem);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v35 = (void *)MEMORY[0x24BDBCF20];
        v36 = objc_opt_class();
        objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = 0;
        objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v37, v30, &v104);
        v38 = (HLPHelpTopicHistoryItem *)objc_claimAutoreleasedReturnValue();
        v39 = v104;
        v40 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v38;

      }
      -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "isEqualToString:", v42);

      if ((v43 & 1) == 0)
      {
        v44 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = 0;

      }
    }

    if (v6)
    {
      v45 = self->_currentTopicHistoryItem;
      if (!v45)
      {
        v46 = objc_alloc_init(HLPHelpTopicHistoryItem);
        objc_msgSend(v6, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpTopicHistoryItem setIdentifier:](v46, "setIdentifier:", v47);

        objc_msgSend(v6, "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpTopicHistoryItem setName:](v46, "setName:", v48);

        -[HLPHelpTopicHistoryItem setAnchor:](v46, "setAnchor:", v95);
        v49 = self->_currentTopicHistoryItem;
        self->_currentTopicHistoryItem = v46;

        v45 = self->_currentTopicHistoryItem;
      }
      -[NSMutableArray addObject:](self->_topicHistory, "addObject:", v45);
    }
LABEL_43:
    objc_storeStrong((id *)&self->_searchTerms, obj);
    topicCache = self->_topicCache;
    objc_msgSend(v6, "identifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache objectForKey:](topicCache, "objectForKey:", v51);
    v9 = (HLPHelpTopicViewController *)objc_claimAutoreleasedReturnValue();

    self->_webViewLoaded = 0;
    -[HLPHelpTopicViewController webView](self, "webView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setAlpha:", 0.0);

    if (-[HLPHelpTopicViewController length](v9, "length"))
    {
      -[HLPHelpTopicViewController loadHTMLString:anchor:](self, "loadHTMLString:anchor:", v9, v95);
      goto LABEL_65;
    }
    objc_initWeak((id *)buf, self);
    if (!-[HLPHelpBookController serverType](self->_helpBookController, "serverType"))
    {
      objc_msgSend(v6, "hrefID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "length") == 0;

      if (v54)
      {
        if (!v92)
          goto LABEL_64;
        -[HLPHelpTopicViewController loadingView](self, "loadingView");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "showDefaultErrorMessage");
LABEL_63:

LABEL_64:
        objc_destroyWeak((id *)buf);
LABEL_65:
        -[HLPHelpTopicViewController delegate](self, "delegate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "helpTopicViewController:selectedHelpTopicItem:accessType:", self, v6, v93);

        -[HLPHelpTopicViewController updateNavigationButtons](self, "updateNavigationButtons");
        -[HLPHelpTopicViewController saveCurrentTopicItem](self, "saveCurrentTopicItem");
        if ((objc_msgSend(v5, "analyticsLogged") & 1) == 0)
        {
          objc_msgSend(v6, "identifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "name");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "analyticsSourceType");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[HLPHelpTopicViewController logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:](self, "logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:", v84, v85, v86, &stru_24D32F538, &stru_24D32F538);

        }
        goto LABEL_67;
      }
    }
    -[HLPHelpTopicViewController loadingView](self, "loadingView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "showActivityIndicator:", 1);

    if (-[HLPHelpBookController serverType](self->_helpBookController, "serverType"))
    {
      v56 = (void *)MEMORY[0x24BDD17C8];
      -[HLPHelpBookController topicPathFormat](self->_helpBookController, "topicPathFormat");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "stringWithFormat:", v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[HLPCommonDefines contentRequestHeaderFields](HLPCommonDefines, "contentRequestHeaderFields");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          objc_msgSend(v61, "setCachePolicy:", 1);
          objc_msgSend(v61, "setAllHTTPHeaderFields:", v62);
        }
        +[HLPJSONCacheController sharedInstance](HLPJSONCacheController, "sharedInstance");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v96[0] = MEMORY[0x24BDAC760];
        v96[1] = 3221225472;
        v96[2] = __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke_2;
        v96[3] = &unk_24D32EFE8;
        objc_copyWeak(&v99, (id *)buf);
        v97 = v6;
        v98 = v95;
        objc_msgSend(v63, "formattedDataForRequest:identifier:completionHandler:", v61, v64, v96);
        v65 = (HLPURLSessionItem *)objc_claimAutoreleasedReturnValue();
        URLSessionItem = self->_URLSessionItem;
        self->_URLSessionItem = v65;

        objc_destroyWeak(&v99);
      }
    }
    else
    {
      objc_msgSend(v6, "hrefID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v75)
      {
LABEL_62:
        +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "resumeSessionItem:", self->_URLSessionItem);
        goto LABEL_63;
      }
      helpBookURL = self->_helpBookURL;
      objc_msgSend(v6, "hrefID");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL URLByAppendingPathComponent:](helpBookURL, "URLByAppendingPathComponent:", v77);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[HLPStringCacheController sharedInstance](HLPStringCacheController, "sharedInstance");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hrefID");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = MEMORY[0x24BDAC760];
      v100[1] = 3221225472;
      v100[2] = __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke;
      v100[3] = &unk_24D32EFC0;
      objc_copyWeak(&v103, (id *)buf);
      v101 = v95;
      v102 = v6;
      objc_msgSend(v78, "formattedDataForRequest:identifier:completionHandler:", v60, v79, v100);
      v80 = (HLPURLSessionItem *)objc_claimAutoreleasedReturnValue();
      v81 = self->_URLSessionItem;
      self->_URLSessionItem = v80;

      objc_destroyWeak(&v103);
    }

    goto LABEL_62;
  }
  if (v95)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("window.location.hash='#%@'"), v95);
    v9 = (HLPHelpTopicViewController *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController webView](self, "webView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "evaluateJavaScript:completionHandler:", v9, 0);

    goto LABEL_67;
  }
LABEL_68:

}

void __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v9 = a3;
  v10 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!v16 || v10)
    {
      objc_msgSend(WeakRetained, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "helpTopicViewController:failToLoadWithError:", WeakRetained, v10);
    }
    else
    {
      objc_msgSend(WeakRetained, "loadHTMLString:anchor:", v16, *(_QWORD *)(a1 + 32));
      objc_msgSend(WeakRetained, "topicCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:cost:", v16, v14, objc_msgSend(v9, "length"));

      objc_msgSend(WeakRetained, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "helpTopicViewController:topicLoaded:", WeakRetained, *(_QWORD *)(a1 + 40));
    }

  }
  objc_msgSend(WeakRetained, "setURLSessionItem:", 0);

}

void __62__HLPHelpTopicViewController__loadWithInfo_allowErrorMessage___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v45 = a3;
  v44 = a5;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(WeakRetained, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "helpTopicViewController:failToLoadWithError:", WeakRetained, v11);

    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bookResponse"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("articles"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v14;

      v43 = v16;
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("categoryInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("categories"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v47;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v47 != v21)
              objc_enumerationMutation(v19);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "containsString:", CFSTR("passionpoints")))
            {
              objc_msgSend(*(id *)(a1 + 32), "setCategories:", &unk_24D33A508);
              objc_msgSend(WeakRetained, "delegate");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "helpTopicViewControllerCurrentTopicIsPassionPoint:", WeakRetained);

              goto LABEL_16;
            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          if (v20)
            continue;
          break;
        }
      }
LABEL_16:

      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("content"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("sections"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("title"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("text"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "helpBookController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "locale");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "isoCodes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = CFSTR("en");
      if (v30)
        v32 = (__CFString *)v30;
      v33 = v32;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<html lang=\"%@\"><head><meta charset=\"UTF-8\"><title>%@</title></head>"), v33, v40);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@</html>"), v34, v39);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "loadHTMLString:anchor:", v35, *(_QWORD *)(a1 + 40));
      objc_msgSend(WeakRetained, "topicCache");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKey:cost:", v35, v37, objc_msgSend(v45, "length"));

      objc_msgSend(WeakRetained, "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "helpTopicViewController:topicLoaded:", WeakRetained, *(_QWORD *)(a1 + 32));

    }
  }
  objc_msgSend(WeakRetained, "setURLSessionItem:", 0);

}

- (void)loadHTMLString:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;

  v6 = a4;
  if (a3)
  {
    v76 = v6;
    v7 = a3;
    -[HLPHelpTopicViewController webViewRequestsDataMap](self, "webViewRequestsDataMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    -[HLPHelpTopicViewController setDarkModeEnabled:](self, "setDarkModeEnabled:", objc_msgSend(v7, "containsString:", CFSTR("dark-mode-enabled")));
    objc_msgSend(MEMORY[0x24BDD1488], "HLPBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[HLPHelpBookController contentFormatVersion](self->_helpBookController, "contentFormatVersion") <= 4)
      v11 = CFSTR("app_old");
    else
      v11 = CFSTR("app");
    objc_msgSend(v9, "URLForResource:withExtension:", v11, CFSTR("css"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v12, 4, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HLPHelpTopicViewController supportsDarkMode](self, "supportsDarkMode")
      || -[HLPHelpTopicViewController supportsDarkMode](self, "supportsDarkMode"))
    {
      objc_msgSend(CFSTR(":root{color-scheme:light dark}"), "stringByAppendingString:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    v75 = v12;
    objc_msgSend(v12, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByDeletingLastPathComponent");
    v16 = objc_claimAutoreleasedReturnValue();

    v74 = (void *)v16;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("background-image: url(%@/"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("background-image: url(./"), v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v73 = (void *)v18;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<meta name='viewport' content='width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0'><style type=\"text/css\">%@</style></head>"),
      v18);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v10, "rangeOfString:", CFSTR("</head>"));
    v21 = v20;
    v22 = objc_msgSend(v10, "rangeOfString:", CFSTR("<body"));
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = v22;
      v25 = v23;
      v26 = objc_msgSend(v10, "rangeOfString:options:range:", CFSTR(">"), 0, v22 + v23, objc_msgSend(v10, "length") - (v22 + v23));
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = v26;
        v29 = v27;
        v69 = v19;
        v70 = v21;
        objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "userInterfaceIdiom");

        v32 = CFSTR("phone");
        if (v31 == 6)
          v32 = CFSTR("vision");
        if (v31 == 1)
          v33 = CFSTR("pad");
        else
          v33 = v32;
        v71 = objc_msgSend(v10, "rangeOfString:options:range:", CFSTR("class=\"), 0, v24, v29 - v24 + v28);
        v66 = v34;
        v67 = v33;
        if (v76)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("anchor-%@"), v76);
          v35 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }
        -[HLPHelpLocale isoCodes](self->_locale, "isoCodes");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v38 = (void *)MEMORY[0x24BDD17C8];
          -[HLPHelpLocale isoCodes](self->_locale, "isoCodes");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", CFSTR("data-locale=\"%@\"), v40);
          v68 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v68 = 0;
        }
        v21 = v70;
        v41 = (void *)v35;
        if (v71 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@ class=\"%@"), CFSTR("<body"), v67);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42;
          v44 = (void *)v68;
          if (v35)
            objc_msgSend(v42, "appendFormat:", CFSTR("%@ "), v35);
          objc_msgSend(v43, "appendString:", CFSTR("\"));
          v19 = v69;
          if (v68)
            objc_msgSend(v43, "appendFormat:", CFSTR(" %@"), v68);
          if (self->_fullBookView)
            objc_msgSend(v43, "appendFormat:", CFSTR(" %@"), CFSTR("hide-toc-button"));
          if (self->_supportsDarkMode)
            objc_msgSend(v43, "appendFormat:", CFSTR(" %@"), CFSTR("dark-mode-supported"));
          if (self->_singleTopic)
            objc_msgSend(v43, "appendFormat:", CFSTR(" %@"), CFSTR("single-topic"));
          v45 = CFSTR("<body");
          v46 = v10;
          v47 = v43;
          v48 = v24;
          v49 = v25;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@ "), CFSTR("class=\"), v67);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v50;
          if (self->_supportsDarkMode)
          {
            objc_msgSend(v50, "stringByAppendingFormat:", CFSTR("%@ "), CFSTR("dark-mode-supported"));
            v51 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v51;
          }
          v19 = v69;
          if (self->_fullBookView)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@ "), v43, CFSTR("hide-toc-button"));
            v52 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v52;
          }
          if (self->_singleTopic)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@ "), v43, CFSTR("single-topic"));
            v53 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v53;
          }
          if (v41)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@ "), v43, v41);
            v54 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v54;
          }
          if (v68)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v68, v43);
            v55 = objc_claimAutoreleasedReturnValue();

            v43 = (void *)v55;
          }
          v21 = v70;
          v48 = v71;
          v44 = (void *)v68;
          v49 = v66;
          v45 = CFSTR("class=\");
          v46 = v10;
          v47 = v43;
        }
        objc_msgSend(v46, "replaceOccurrencesOfString:withString:options:range:", v45, v47, 0, v48, v49);

      }
    }
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v19, v21, v72);
    if (+[HLPCommonDefines isInternalBuild](HLPCommonDefines, "isInternalBuild")
      || -[NSURL isFileURL](self->_helpBookURL, "isFileURL"))
    {
      -[HLPHelpTopicViewController updateHTMLStringPath:tag:attribute:](self, "updateHTMLStringPath:tag:attribute:", v10, CFSTR("<img"), CFSTR("src=\"));
      -[HLPHelpTopicViewController updateHTMLStringPath:tag:attribute:](self, "updateHTMLStringPath:tag:attribute:", v10, CFSTR("<video"), CFSTR("poster=\"));
      -[HLPHelpTopicViewController updateHTMLStringPath:tag:attribute:](self, "updateHTMLStringPath:tag:attribute:", v10, CFSTR("<source"), CFSTR("srcset=\"));
      -[HLPHelpTopicViewController updateHTMLStringPath:tag:attribute:useScheme:extension:](self, "updateHTMLStringPath:tag:attribute:useScheme:extension:", v10, CFSTR("<source"), CFSTR("src=\"), 1, CFSTR("mp4"));
    }
    v56 = objc_msgSend(v10, "rangeOfString:options:", CFSTR("</html>"), 4);
    if (v56 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v58 = v56;
      v59 = v57;
      objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("app"), CFSTR("js"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v60, 4, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<script>%@</script></html>"), v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v58, v59, v62);

    }
    -[HLPHelpTopicViewController webView](self, "webView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleURL");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (id)objc_msgSend(v63, "loadHTMLString:baseURL:", v10, v64);

    v6 = v76;
  }

}

- (void)updateHTMLStringPath:(id)a3 tag:(id)a4 attribute:(id)a5
{
  -[HLPHelpTopicViewController updateHTMLStringPath:tag:attribute:useScheme:extension:](self, "updateHTMLStringPath:tag:attribute:useScheme:extension:", a3, a4, a5, 1, 0);
}

- (void)updateHTMLStringPath:(id)a3 tag:(id)a4 attribute:(id)a5 useScheme:(BOOL)a6 extension:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  NSURL *helpBookURL;
  void *v20;
  uint64_t v21;
  BOOL v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  BOOL v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  HLPHelpTopicViewController *v40;
  id v41;

  v8 = a6;
  v41 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = objc_msgSend(v41, "rangeOfString:", v12);
  v17 = v16;
  v18 = -[NSURL isFileURL](self->_helpBookURL, "isFileURL");
  v40 = self;
  helpBookURL = self->_helpBookURL;
  if (v18)
    -[NSURL path](helpBookURL, "path");
  else
    -[NSURL absoluteString](helpBookURL, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HLPHelpBookController serverType](v40->_helpBookController, "serverType");
  if (v20)
    v22 = v15 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v22 = 1;
  if (!v22)
  {
    v23 = v21 == 1 && v8;
    v39 = v23;
    while (1)
    {
      v24 = v15 + v17;
      v25 = objc_msgSend(v41, "rangeOfString:options:range:", v13, 0, v24, objc_msgSend(v41, "length") - v24);
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        break;
LABEL_30:
      v15 = objc_msgSend(v41, "rangeOfString:options:range:", v12, 0, v24, objc_msgSend(v41, "length") - v24);
      v17 = v38;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_31;
    }
    v27 = v25 + v26;
    v28 = objc_msgSend(v41, "rangeOfString:options:range:", CFSTR("\"), 0, v27, objc_msgSend(v41, "length") - v27);
    v29 = v28 - v27;
    objc_msgSend(v41, "substringWithRange:", v27, v28 - v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v14)
    {
      objc_msgSend(v30, "pathExtension");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", v14);

    }
    else
    {
      v33 = 1;
    }
    if (objc_msgSend(v31, "length"))
      v34 = v33 == 0;
    else
      v34 = 1;
    if (v34)
    {
LABEL_29:

      goto LABEL_30;
    }
    if (-[NSURL isFileURL](v40->_helpBookURL, "isFileURL")
      || !objc_msgSend(v31, "hasPrefix:", CFSTR("http")))
    {
      objc_msgSend(v20, "stringByAppendingPathComponent:", v31);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v39)
      {
LABEL_26:
        if (-[NSURL isFileURL](v40->_helpBookURL, "isFileURL"))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://load?url=%@"), CFSTR("apple-help-local"), v31);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "stringByAddingPercentEscapes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v41, "replaceCharactersInRange:withString:", v27, v29, v31);
        v24 = objc_msgSend(v31, "length") + v27;
        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://load?url=%@"), CFSTR("apple-help-remote-asset"), v31);
      v35 = objc_claimAutoreleasedReturnValue();
    }
    v36 = (void *)v35;

    v31 = v36;
    goto LABEL_26;
  }
LABEL_31:

}

- (void)showWebViewDelay
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  int v8;
  HLPHelpBookController *helpBookController;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showWebViewDelay, 0);
  if (!self->_webViewLoaded)
  {
    self->_webViewLoaded = 1;
    -[HLPHelpTopicViewController webView](self, "webView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v5 = v4;

    if (v5 != 1.0)
    {
      -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HLPHelpBookController welcomeTopicIdentifier](self->_helpBookController, "welcomeTopicIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        helpBookController = self->_helpBookController;
        -[HLPHelpBookController welcomeTopicIdentifier](helpBookController, "welcomeTopicIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpBookController helpItemForID:](helpBookController, "helpItemForID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = objc_msgSend(v11, "isPassionPoints") ^ 1;
        else
          v12 = 1;

      }
      else
      {
        v12 = 0;
      }
      -[HLPHelpTopicHistoryItem anchor](self->_currentTopicHistoryItem, "anchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {

      }
      else if (!+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
      {
        -[WKWebView scrollView](self->_webView, "scrollView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contentSize");
        v16 = v15;
        v18 = v17;
        -[HLPHelpTopicHistoryItem contentSize](self->_currentTopicHistoryItem, "contentSize");
        v20 = v19;
        v22 = v21;

        if (v16 == v20 && v18 == v22)
        {
          -[HLPHelpTopicHistoryItem contentOffset](self->_currentTopicHistoryItem, "contentOffset");
          v28 = v27;
          v30 = v29;
          -[WKWebView scrollView](self->_webView, "scrollView");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setContentOffset:", v28, v30);

        }
        else
        {
          -[HLPHelpTopicHistoryItem setContentSize:](self->_currentTopicHistoryItem, "setContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
          v24 = 0.0;
          if ((v12 & 1) == 0)
          {
            -[HLPHelpTopicViewController view](self, "view");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "safeAreaInsets");
            v24 = v26;

          }
          -[HLPHelpTopicHistoryItem setContentOffset:](self->_currentTopicHistoryItem, "setContentOffset:", 0.0, v24);
        }
      }
      if (v12)
      {
        -[WKWebView scrollView](self->_webView, "scrollView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setContentOffset:", 0.0, 0.0);

      }
      -[HLPHelpTopicViewController loadingView](self, "loadingView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "showActivityIndicator:", 0);

      if (-[HLPHelpTopicViewController isViewLoaded](self, "isViewLoaded"))
      {
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __46__HLPHelpTopicViewController_showWebViewDelay__block_invoke;
        v35[3] = &unk_24D32E6B8;
        v35[4] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v35, 0.2);
      }
      else
      {
        -[HLPHelpTopicViewController webView](self, "webView");
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setAlpha:", 1.0);

      }
    }
  }
}

void __46__HLPHelpTopicViewController_showWebViewDelay__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showWebViewDelay, 0);
  -[HLPHelpTopicViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showWebViewDelay, 0, 3.0);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  objc_msgSend(a3, "evaluateJavaScript:completionHandler:", CFSTR("document.body.style.webkitUserSelect = \"none\";"),
    0);
  if (!self->_webViewLoaded)
    -[HLPHelpTopicViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_showWebViewDelay, 0, 0.1);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_showWebViewDelay, 0);
  -[HLPHelpTopicViewController loadingView](self, "loadingView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showActivityIndicator:", 0);

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  void *v10;
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
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  HLPHelpTopicItem *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD v60[6];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v59 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v8, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("helpkit"));

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD1808];
    objc_msgSend(v10, "URL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "queryItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HLPLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "absoluteString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_2153AA000, v21, OS_LOG_TYPE_DEFAULT, "decidePolicy %@", (uint8_t *)&buf, 0xCu);

    }
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("type")))
    {
      objc_msgSend(v19, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqualToString:", CFSTR("TOC")))
      {
        -[HLPHelpTopicViewController showTableOfContent](self, "showTableOfContent");
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("pp")) & 1) != 0
             || objc_msgSend(v24, "isEqualToString:", CFSTR("task")))
      {
        objc_msgSend(v17, "queryItems");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count") == 3;

        if (v36)
        {
          objc_msgSend(v17, "queryItems");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "value");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          -[HLPHelpTopicViewController traitCollection](self, "traitCollection");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[HLPAnalyticsEventContentViewed eventWithTopicID:topicTitle:source:interfaceStyle:](HLPAnalyticsEventContentViewed, "eventWithTopicID:topicTitle:source:interfaceStyle:", v58, &stru_24D32F538, CFSTR("deep_link"), objc_msgSend(v39, "userInterfaceStyle"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "log");

        }
      }

    }
    goto LABEL_34;
  }
  if (!objc_msgSend(v8, "navigationType"))
  {
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__2;
    v68 = __Block_byref_object_dispose__2;
    v69 = 0;
    if (-[HLPHelpBookController serverType](self->_helpBookController, "serverType") == 1)
    {
      v26 = objc_alloc(MEMORY[0x24BDD1808]);
      objc_msgSend(v10, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "absoluteString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v26, "initWithString:", v28);

      objc_msgSend(v29, "queryItems");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x24BDAC760];
      v60[1] = 3221225472;
      v60[2] = __86__HLPHelpTopicViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
      v60[3] = &unk_24D32F010;
      v60[4] = &v61;
      v60[5] = &buf;
      objc_msgSend(v30, "enumerateObjectsWithOptions:usingBlock:", 2, v60);

    }
    objc_msgSend(v10, "URL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scheme");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "hasPrefix:", CFSTR("http")))
    {
      v33 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

      if (v33)
      {
        v34 = 0;
        goto LABEL_32;
      }
    }
    else
    {

    }
    if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40)
      && !-[HLPHelpBookController serverType](self->_helpBookController, "serverType"))
    {
      objc_msgSend(v10, "URL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v42;

      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "stringByDeletingPathExtension");
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v44;

    }
    objc_msgSend(v10, "URL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "fragment");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v34, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)))
    {

      v34 = 0;
    }
    -[HLPHelpBookController helpTopicItemForID:](self->_helpBookController, "helpTopicItemForID:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v47 = (HLPHelpTopicItem *)objc_claimAutoreleasedReturnValue();
    if (v47
      || *((_BYTE *)v62 + 24)
      && (v47 = objc_alloc_init(HLPHelpTopicItem),
          -[HLPHelpItem setIdentifier:](v47, "setIdentifier:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)),
          -[HLPHelpTopicItem setCategories:](v47, "setCategories:", &unk_24D33A520),
          -[HLPHelpBookController addAsideTopic:](self->_helpBookController, "addAsideTopic:", v47),
          v47))
    {
      -[HLPHelpTopicItem hrefID](v47, "hrefID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "hasPrefix:", CFSTR("http"));

      if (v49)
      {
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)MEMORY[0x24BDBCF48];
        -[HLPHelpTopicItem hrefID](v47, "hrefID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "URLWithString:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "openURL:options:completionHandler:", v53, MEMORY[0x24BDBD1B8], 0);

      }
      else
      {
        +[HLPLoadInfo infoWithTopicItem:accesstype:searchTerms:anchor:](HLPLoadInfo, "infoWithTopicItem:accesstype:searchTerms:anchor:", v47, 1, 0, v34);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[HLPHelpTopicViewController _loadWithInfo:](self, "_loadWithInfo:", v50);
      }
      goto LABEL_33;
    }
LABEL_32:
    -[HLPHelpTopicHistoryItem identifier](self->_currentTopicHistoryItem, "identifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicHistoryItem name](self->_currentTopicHistoryItem, "name");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "absoluteString");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicViewController logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:](self, "logAnalyticsContentViewedWithTopicID:topicTitle:source:fromTopicID:externalURLString:", v54, v55, CFSTR("link"), &stru_24D32F538, v57);

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v47 = (HLPHelpTopicItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HLPHelpTopicItem openURL:options:completionHandler:](v47, "openURL:options:completionHandler:", v50, MEMORY[0x24BDBD1B8], 0);
LABEL_33:

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v61, 8);
LABEL_34:
    v25 = 0;
    goto LABEL_35;
  }
  v25 = 1;
LABEL_35:
  v9[2](v9, v25);

}

void __86__HLPHelpTopicViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("aside"));

  if (v7)
  {
    objc_msgSend(v14, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    objc_msgSend(v14, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("topicid"));

    if (v10)
    {
      objc_msgSend(v14, "value");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      *a4 = 1;
    }
  }

}

- (void)helpTopicViewControllerContentViewed:(id)a3 topicID:(id)a4 topicTitle:(id)a5 source:(id)a6 interfaceStyle:(int64_t)a7 fromTopicID:(id)a8 externalURLString:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v15 = a9;
  v16 = a8;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  -[HLPHelpTopicViewController delegate](self, "delegate");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "helpTopicViewControllerContentViewed:topicID:topicTitle:source:interfaceStyle:fromTopicID:externalURLString:", self, v19, v18, v17, a7, v16, v15);

}

- (void)helpTopicViewControllerCurrentTopicIsPassionPoint:(id)a3
{
  id v3;

  -[HLPHelpTopicViewController webView](self, "webView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)helpTopicViewController:(id)a3 failToLoadWithError:(id)a4
{
  id v4;

  objc_msgSend(a3, "loadingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showDefaultErrorMessage");

}

- (void)helpTopicViewControllerShowHelpBookInfo:(id)a3
{
  id v4;

  -[HLPHelpTopicViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "helpTopicViewControllerShowHelpBookInfo:", self);

}

- (void)helpTopicViewController:(id)a3 selectedHelpTopicItem:(id)a4 accessType:(int64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[HLPHelpTopicViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "helpTopicViewController:selectedHelpTopicItem:accessType:", self, v7, a5);

}

- (void)showHelpBookInfo:(id)a3
{
  id v4;

  -[HLPHelpTopicViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "helpTopicViewControllerShowHelpBookInfo:", self);

}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a4, "request", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("apple-help-remote-asset"));

  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_webViewRequestsMap, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_webViewRequestsMap, "setObject:forKeyedSubscript:", 0, v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_webViewRequestsDataMap, "setObject:forKeyedSubscript:", 0, v10);
      +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancelSessionItem:", v8);

    }
  }

}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  HLPHelpTopicViewController *v43;
  id v44;
  id v45;
  __CFString *v46;
  id v47;
  id v48;
  id from;
  id location;
  const __CFString *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v5 = a4;
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDD1808]);
  objc_msgSend(v5, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithURL:resolvingAgainstBaseURL:", v9, 0);

  objc_msgSend(v10, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("png")) & 1) != 0)
  {
    v16 = CFSTR("image/png");
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("jpg")) & 1) != 0
         || (objc_msgSend(v15, "isEqualToString:", CFSTR("jpeg")) & 1) != 0)
  {
    v16 = CFSTR("image/jpeg");
  }
  else if (objc_msgSend(v15, "isEqualToString:", CFSTR("mp4")))
  {
    v16 = CFSTR("video/mp4");
  }
  else
  {
    v16 = CFSTR("text/plain");
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("apple-help-local")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v13);
      if (v18
        && (v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1848]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v17, v16, objc_msgSend(v18, "length"), 0)) != 0)
      {
        v20 = (void *)v19;
        objc_msgSend(v5, "didReceiveResponse:", v19);
        v21 = v18;
        objc_msgSend(v5, "didReceiveData:", v18);
        objc_msgSend(v5, "didFinish");
      }
      else
      {
        v21 = v18;
        v24 = (void *)MEMORY[0x24BDD1540];
        v51 = CFSTR("URL");
        v52[0] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("file not found"), -1, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "didFailWithError:", v25);

      }
      goto LABEL_20;
    }
  }
  else if (objc_msgSend(v11, "isEqualToString:", CFSTR("apple-help-remote-asset")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_21:

      goto LABEL_22;
    }
    -[HLPHelpTopicViewController webViewRequestsDataMap](self, "webViewRequestsDataMap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "absoluteString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v23);
    v36 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v36;
    if (v36)
    {
      -[HLPHelpTopicViewController updateURLSchemeTask:URL:MIMEType:data:error:](self, "updateURLSchemeTask:URL:MIMEType:data:error:", v5, v17, v16, v36, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HLPCommonDefines assetRequestHeaderFields](HLPCommonDefines, "assetRequestHeaderFields");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_msgSend(v26, "setCachePolicy:", 1);
        objc_msgSend(v26, "setAllHTTPHeaderFields:", v35);
      }
      from = 0;
      +[HLPDataCacheController sharedInstance](HLPDataCacheController, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __57__HLPHelpTopicViewController_webView_startURLSchemeTask___block_invoke;
      v41[3] = &unk_24D32F038;
      objc_copyWeak(&v47, &location);
      v33 = v39;
      v42 = v33;
      objc_copyWeak(&v48, &from);
      v43 = self;
      v44 = v5;
      v45 = v17;
      v46 = (__CFString *)v16;
      objc_msgSend(v27, "formattedDataForRequest:identifier:completionHandler:", v26, v34, v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak(&from, v28);

      v29 = objc_loadWeakRetained(&from);
      if (v29)
      {
        +[HLPURLSessionManager defaultManager](HLPURLSessionManager, "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_loadWeakRetained(&from);
        objc_msgSend(v30, "resumeSessionItem:", v31);

        v32 = objc_loadWeakRetained(&from);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_webViewRequestsMap, "setObject:forKeyedSubscript:", v32, v33);

      }
      objc_destroyWeak(&v48);

      objc_destroyWeak(&v47);
      objc_destroyWeak(&from);

      objc_destroyWeak(&location);
      v21 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:

}

void __57__HLPHelpTopicViewController_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  void *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  v10 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "webViewRequestsMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 80));
    v15 = objc_msgSend(v14, "isCancelled");

    if ((v15 & 1) == 0)
    {
      if (v18)
        v16 = v18;
      else
        v16 = v9;
      objc_msgSend(*(id *)(a1 + 40), "updateURLSchemeTask:URL:MIMEType:data:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v16, v10);
    }
    objc_msgSend(WeakRetained, "webViewRequestsMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

  }
}

- (void)updateURLSchemeTask:(id)a3 URL:(id)a4 MIMEType:(id)a5 data:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  const __CFString *v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allHTTPHeaderFields");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("Range"));
  v17 = objc_claimAutoreleasedReturnValue();

  v44 = (void *)v17;
  v18 = -[HLPHelpTopicViewController rangeFromData:byteRangeString:](self, "rangeFromData:byteRangeString:", v14, v17);
  v20 = 0x24BDBC000;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1848]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v12, v13, objc_msgSend(v14, "length"), 0);
  }
  else
  {
    v22 = v18;
    v42 = v13;
    v23 = v19 - v18 + 1;
    v48[0] = CFSTR("Content-Range");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bytes %ld-%ld/%lu"), v18, v19, objc_msgSend(v14, "length"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = CFSTR("Content-Length");
    v49[0] = v24;
    v41 = v23;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_alloc(MEMORY[0x24BDD15B8]);
    v28 = (void *)MEMORY[0x24BDBCF48];
    v43 = v12;
    objc_msgSend(v12, "absoluteString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLWithString:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v27, "initWithURL:statusCode:HTTPVersion:headerFields:", v30, 206, CFSTR("HTTP/1.1"), v26);

    objc_msgSend(v15, "URL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[HLPHelpTopicViewController webViewRequestsDataMap](self, "webViewRequestsDataMap");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      -[HLPHelpTopicViewController webViewRequestsDataMap](self, "webViewRequestsDataMap");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v14, v32);

    }
    objc_msgSend(v14, "subdataWithRange:", v22, v41);
    v36 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v36;
    v13 = v42;
    v12 = v43;
    v20 = 0x24BDBC000uLL;
  }
  objc_msgSend(v11, "didReceiveResponse:", v21);
  if (a7 || !v14)
  {
    v37 = v20;
    v38 = (void *)MEMORY[0x24BDD1540];
    v46 = CFSTR("URL");
    v47 = v12;
    objc_msgSend(*(id *)(v37 + 3696), "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("file not found"), -1, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didFailWithError:", v40);

  }
  else
  {
    objc_msgSend(v11, "didReceiveData:", v14);
    objc_msgSend(v11, "didFinish");
  }

}

- (_NSRange)rangeFromData:(id)a3 byteRangeString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 && (v9 = objc_msgSend(v6, "rangeOfString:", CFSTR("bytes=")), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v7, "substringFromIndex:", v9 + v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count") == 2)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v14, "integerValue");

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v15, "integerValue");
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("*")))
        v11 = objc_msgSend(v5, "length");

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  v16 = v8;
  v17 = v11;
  result.length = v17;
  result.location = v16;
  return result;
}

- (void)registerTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__HLPHelpTopicViewController_registerTraitChanges__block_invoke;
  v5[3] = &unk_24D32E540;
  v5[4] = self;
  v4 = (id)-[HLPHelpTopicViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

void __50__HLPHelpTopicViewController_registerTraitChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "helpTopicViewController:traitCollectionChanged:", *(_QWORD *)(a1 + 32), v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  double v3;
  id v4;

  v4 = a3;
  if (+[HLPCommonDefines isVisionOS](HLPCommonDefines, "isVisionOS"))
  {
    objc_msgSend(v4, "contentOffset");
    if (v3 != 0.0)
    {
      objc_msgSend(v4, "contentOffset");
      objc_msgSend(v4, "setContentOffset:", 0.0);
    }
  }

}

- (HLPHelpTopicViewControllerDelegate)delegate
{
  return (HLPHelpTopicViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (BOOL)supportsDarkMode
{
  return self->_supportsDarkMode;
}

- (BOOL)displayHelpTopicsOnly
{
  return self->_displayHelpTopicsOnly;
}

- (void)setDisplayHelpTopicsOnly:(BOOL)a3
{
  self->_displayHelpTopicsOnly = a3;
}

- (BOOL)hideDoneButton
{
  return self->_hideDoneButton;
}

- (BOOL)showTopicNameAsTitle
{
  return self->_showTopicNameAsTitle;
}

- (void)setShowTopicNameAsTitle:(BOOL)a3
{
  self->_showTopicNameAsTitle = a3;
}

- (BOOL)isSingleTopic
{
  return self->_singleTopic;
}

- (void)setSingleTopic:(BOOL)a3
{
  self->_singleTopic = a3;
}

- (NSURL)helpBookURL
{
  return self->_helpBookURL;
}

- (void)setHelpBookURL:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookURL, a3);
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (HLPHelpLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
  objc_storeStrong((id *)&self->_helpBookController, a3);
}

- (HLPHelpTopicHistoryItem)currentTopicHistoryItem
{
  return self->_currentTopicHistoryItem;
}

- (void)setCurrentTopicHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_currentTopicHistoryItem, a3);
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (BOOL)darkModeEnabled
{
  return self->_darkModeEnabled;
}

- (HLPURLSessionItem)URLSessionItem
{
  return self->_URLSessionItem;
}

- (void)setURLSessionItem:(id)a3
{
  objc_storeStrong((id *)&self->_URLSessionItem, a3);
}

- (NSCache)topicCache
{
  return self->_topicCache;
}

- (void)setTopicCache:(id)a3
{
  objc_storeStrong((id *)&self->_topicCache, a3);
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerms, a3);
}

- (NSMutableDictionary)webViewRequestsMap
{
  return self->_webViewRequestsMap;
}

- (void)setWebViewRequestsMap:(id)a3
{
  objc_storeStrong((id *)&self->_webViewRequestsMap, a3);
}

- (NSMutableDictionary)webViewRequestsDataMap
{
  return self->_webViewRequestsDataMap;
}

- (void)setWebViewRequestsDataMap:(id)a3
{
  objc_storeStrong((id *)&self->_webViewRequestsDataMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewRequestsDataMap, 0);
  objc_storeStrong((id *)&self->_webViewRequestsMap, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_topicCache, 0);
  objc_storeStrong((id *)&self->_URLSessionItem, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_currentTopicHistoryItem, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_helpBookURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_forwardBarButtonItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tocBarButtonItem, 0);
  objc_storeStrong((id *)&self->_topicHistory, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong(&self->_interactivePopGestureRecognizerDelegate, 0);
}

@end
