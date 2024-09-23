@implementation BuddySimpleTCController

- (void)viewDidLoad
{
  id v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  id v6;
  id v7;
  id v8;
  NSBundle *v9;
  NSString *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  WKWebView *v21;
  WKWebView *v22;
  BuddySimpleTCController *v23;
  WKWebView *v24;
  WKWebView *v25;
  WKWebView *v26;
  WKWebView *v27;
  UIScrollView *v28;
  WKWebView *v29;
  id v30;
  NSBundle *v31;
  NSURL *v32;
  id v33;
  WKWebView *v34;
  UIScrollView *v35;
  WKWebView *v36;
  UIScrollView *v37;
  WKWebView *v38;
  UIScrollView *v39;
  id v40;
  WKWebView *v41;
  WKWebView *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  WKWebView *v48;
  id v49;
  id v50;
  NSArray *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  WKWebView *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  WKWebView *v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  id location;
  objc_super v70;
  SEL v71;
  BuddySimpleTCController *v72;
  _QWORD v73[4];

  v72 = self;
  v71 = a2;
  v70.receiver = self;
  v70.super_class = (Class)BuddySimpleTCController;
  -[BuddySimpleTCController viewDidLoad](&v70, "viewDidLoad");
  v2 = -[BuddySimpleTCController titleString](v72, "titleString");
  -[BuddySimpleTCController setTitle:](v72, "setTitle:", v2);

  -[BuddySimpleTCController setModalInPresentation:](v72, "setModalInPresentation:", 1);
  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_100284738, CFSTR("Localizable"));
  v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, v72, "_agreeTapped:");
  v7 = -[BuddySimpleTCController navigationItem](v72, "navigationItem");
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v10 = -[NSBundle localizedStringForKey:value:table:](v9, "localizedStringForKey:value:table:", CFSTR("DISAGREE"), &stru_100284738, CFSTR("Localizable"));
  v11 = objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, v72, "_disagreeTapped:");
  v12 = -[BuddySimpleTCController navigationItem](v72, "navigationItem");
  objc_msgSend(v12, "setLeftBarButtonItem:", v11);

  location = objc_alloc_init((Class)WKWebViewConfiguration);
  objc_msgSend(location, "setSuppressesIncrementalRendering:", 1);
  objc_msgSend(location, "setDataDetectorTypes:", 0);
  v13 = objc_msgSend(location, "preferences");
  objc_msgSend(v13, "setMinimumFontSize:", 0.0);

  v14 = objc_msgSend(location, "preferences");
  objc_msgSend(v14, "setTextInteractionEnabled:", 0);

  objc_msgSend(location, "setIgnoresViewportScaleLimits:", 0);
  v15 = objc_alloc((Class)WKWebView);
  v16 = sub_10010A6AC();
  v20 = objc_msgSend(v15, "initWithFrame:configuration:", location, v16, v17, v18, v19);
  -[BuddySimpleTCController setWebView:](v72, "setWebView:", v20);

  v21 = -[BuddySimpleTCController webView](v72, "webView");
  -[WKWebView setOpaque:](v21, "setOpaque:", 0);

  v22 = -[BuddySimpleTCController webView](v72, "webView");
  -[WKWebView setAllowsLinkPreview:](v22, "setAllowsLinkPreview:", 0);

  v23 = v72;
  v24 = -[BuddySimpleTCController webView](v72, "webView");
  -[WKWebView setNavigationDelegate:](v24, "setNavigationDelegate:", v23);

  v25 = -[BuddySimpleTCController webView](v72, "webView");
  -[WKWebView _setDragInteractionPolicy:](v25, "_setDragInteractionPolicy:", 2);

  v26 = -[BuddySimpleTCController webView](v72, "webView");
  -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v27 = -[BuddySimpleTCController webView](v72, "webView");
  v28 = -[WKWebView scrollView](v27, "scrollView");
  -[UIScrollView _setShowsBackgroundShadow:](v28, "_setShowsBackgroundShadow:", 0);

  v29 = -[BuddySimpleTCController webView](v72, "webView");
  v30 = -[BuddySimpleTCController termsContent](v72, "termsContent");
  v31 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v32 = -[NSBundle resourceURL](v31, "resourceURL");
  v33 = -[WKWebView loadHTMLString:baseURL:](v29, "loadHTMLString:baseURL:", v30, v32);

  v34 = -[BuddySimpleTCController webView](v72, "webView");
  v35 = -[WKWebView scrollView](v34, "scrollView");
  -[UIScrollView _setIndicatorInsetAdjustmentBehavior:](v35, "_setIndicatorInsetAdjustmentBehavior:", 2);

  v36 = -[BuddySimpleTCController webView](v72, "webView");
  v37 = -[WKWebView scrollView](v36, "scrollView");
  -[UIScrollView setContentInsetAdjustmentBehavior:](v37, "setContentInsetAdjustmentBehavior:", 2);

  v68 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  v67 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v38 = -[BuddySimpleTCController webView](v72, "webView");
  v39 = -[WKWebView scrollView](v38, "scrollView");
  -[UIScrollView setContentInset:](v39, "setContentInset:", v67, v68);

  v40 = -[BuddySimpleTCController view](v72, "view");
  v41 = -[BuddySimpleTCController webView](v72, "webView");
  objc_msgSend(v40, "addSubview:", v41);

  v66 = -[BuddySimpleTCController view](v72, "view");
  v65 = objc_msgSend(v66, "safeAreaLayoutGuide");
  v63 = objc_msgSend(v65, "topAnchor");
  v64 = -[BuddySimpleTCController webView](v72, "webView");
  v62 = -[WKWebView topAnchor](v64, "topAnchor");
  v61 = objc_msgSend(v63, "constraintEqualToAnchor:");
  v73[0] = v61;
  v60 = -[BuddySimpleTCController view](v72, "view");
  v59 = objc_msgSend(v60, "layoutMarginsGuide");
  v57 = objc_msgSend(v59, "rightAnchor");
  v58 = -[BuddySimpleTCController webView](v72, "webView");
  v56 = -[WKWebView rightAnchor](v58, "rightAnchor");
  v55 = objc_msgSend(v57, "constraintEqualToAnchor:");
  v73[1] = v55;
  v54 = -[BuddySimpleTCController view](v72, "view");
  v53 = objc_msgSend(v54, "safeAreaLayoutGuide");
  v52 = objc_msgSend(v53, "bottomAnchor");
  v42 = -[BuddySimpleTCController webView](v72, "webView");
  v43 = -[WKWebView bottomAnchor](v42, "bottomAnchor");
  v44 = objc_msgSend(v52, "constraintEqualToAnchor:", v43);
  v73[2] = v44;
  v45 = -[BuddySimpleTCController view](v72, "view");
  v46 = objc_msgSend(v45, "layoutMarginsGuide");
  v47 = objc_msgSend(v46, "leftAnchor");
  v48 = -[BuddySimpleTCController webView](v72, "webView");
  v49 = -[WKWebView leftAnchor](v48, "leftAnchor");
  v50 = objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  v73[3] = v50;
  v51 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 4);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v51);

  objc_storeStrong(&location, 0);
}

- (id)termsContent
{
  return 0;
}

- (id)titleString
{
  return 0;
}

- (void)_agreeTapped:(id)a3
{
  id WeakRetained;
  id location[2];
  BuddySimpleTCController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_termsAndConditionsDelegate);
  objc_msgSend(WeakRetained, "buddyTCSubController:didFinishWithAgree:", v5, 1);

  objc_storeStrong(location, 0);
}

- (void)_disagreeTapped:(id)a3
{
  id WeakRetained;
  id location[2];
  BuddySimpleTCController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_termsAndConditionsDelegate);
  objc_msgSend(WeakRetained, "buddyTCSubController:didFinishWithAgree:", v5, 0);

  objc_storeStrong(location, 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  id v8;
  NSBundle *v9;
  NSURL *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  if (v12)
  {
    v7 = objc_msgSend(v13, "request");
    v8 = objc_msgSend(v7, "URL");
    v9 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle resourceURL](v9, "resourceURL");
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if ((v11 & 1) != 0)
      (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    else
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BuddyTCSubControllerDelegate)termsAndConditionsDelegate
{
  return (BuddyTCSubControllerDelegate *)objc_loadWeakRetained((id *)&self->_termsAndConditionsDelegate);
}

- (void)setTermsAndConditionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_termsAndConditionsDelegate, a3);
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_termsAndConditionsDelegate);
}

@end
