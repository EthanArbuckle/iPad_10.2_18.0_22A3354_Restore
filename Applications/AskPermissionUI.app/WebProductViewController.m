@implementation WebProductViewController

- (WebProductViewController)initWithRequest:(id)a3
{
  id v5;
  WebProductViewController *v6;
  WebProductViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WebProductViewController;
  v6 = -[WebProductViewController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebProductViewController;
  -[WebProductViewController loadView](&v5, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebProductViewController;
  -[WebProductViewController viewDidLoad](&v3, "viewDidLoad");
  -[WebProductViewController _setup](self, "_setup");
  -[WebProductViewController _loadWebsite](self, "_loadWebsite");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WebProductViewController;
  -[WebProductViewController viewWillLayoutSubviews](&v20, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController bannerLabel](self, "bannerLabel"));
  objc_msgSend(v8, "heightForWidth:", v5 + -30.0);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController view](self, "view"));
  objc_msgSend(v11, "center");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v16, "setCenter:", v13, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController bannerLabel](self, "bannerLabel"));
  objc_msgSend(v17, "setFrame:", 15.0, 15.0, v5 + -30.0, v10);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController separatorView](self, "separatorView"));
  objc_msgSend(v18, "setFrame:", 0.0, v10 + 30.0, v5, 0.5);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController webView](self, "webView"));
  objc_msgSend(v19, "setFrame:", 0.0, v10 + 30.0, v5, v7 - v10);

}

- (void)_setup
{
  -[WebProductViewController _setupNavigationItem](self, "_setupNavigationItem");
  -[WebProductViewController _setupSubviews](self, "_setupSubviews");
}

- (void)_setupNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "approve"));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", v5));

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v14, 0, self, "_approveButtonAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController request](self, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "decline"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Localizations stringWithKey:](Localizations, "stringWithKey:", v10));

  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", v11, 0, self, "_declineButtonAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setLeftBarButtonItem:", v12);

}

- (void)_setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = objc_alloc_init((Class)WKWebView);
  -[WebProductViewController setWebView:](self, "setWebView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController webView](self, "webView"));
  objc_msgSend(v4, "setCustomUserAgent:", CFSTR("MobileAskPermissionUI/1.0"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController webView](self, "webView"));
  objc_msgSend(v5, "setNavigationDelegate:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController webView](self, "webView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scrollView"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController webView](self, "webView"));
  objc_msgSend(v8, "addSubview:", v9);

  v10 = objc_alloc_init((Class)UILabel);
  -[WebProductViewController setBannerLabel:](self, "setBannerLabel:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController bannerLabel](self, "bannerLabel"));
  objc_msgSend(v12, "setFont:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController bannerLabel](self, "bannerLabel"));
  objc_msgSend(v13, "setNumberOfLines:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController request](self, "request"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "body"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController bannerLabel](self, "bannerLabel"));
  objc_msgSend(v17, "setText:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController bannerLabel](self, "bannerLabel"));
  objc_msgSend(v18, "setTextAlignment:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController bannerLabel](self, "bannerLabel"));
  objc_msgSend(v19, "addSubview:", v20);

  v21 = objc_alloc_init((Class)UIView);
  -[WebProductViewController setSeparatorView:](self, "setSeparatorView:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController separatorView](self, "separatorView"));
  objc_msgSend(v23, "setBackgroundColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController view](self, "view"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController separatorView](self, "separatorView"));
  objc_msgSend(v24, "addSubview:", v25);

  v26 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[WebProductViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v27, "setHidesWhenStopped:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v28, "startAnimating");

  v30 = (id)objc_claimAutoreleasedReturnValue(-[WebProductViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v30, "addSubview:", v29);

}

- (void)_approveButtonAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[WebProductViewController actionDelegate](self, "actionDelegate"));
  objc_msgSend(v2, "productViewControllerDidFinishWithAction:", 0);

}

- (void)_declineButtonAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[WebProductViewController actionDelegate](self, "actionDelegate"));
  objc_msgSend(v2, "productViewControllerDidFinishWithAction:", 1);

}

- (void)_loadWebsite
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController request](self, "request"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "previewURL"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController webView](self, "webView"));
  v6 = objc_msgSend(v5, "loadRequest:", v7);

}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pinchGestureRecognizer"));
  objc_msgSend(v4, "setEnabled:", 0);

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig"));
  if (!v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "OSLogObject"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v12 = 138543618;
    v13 = (id)objc_opt_class(self);
    v14 = 2114;
    v15 = v6;
    v9 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Web view failed to load. Error: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v10, "stopAnimating");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController actionDelegate](self, "actionDelegate"));
  objc_msgSend(v11, "productViewControllerDidFinishWithAction:", 3);

}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedUIServiceConfig](APLogConfig, "sharedUIServiceConfig", a3, a4));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](APLogConfig, "sharedConfig"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "OSLogObject"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class(self);
    v7 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Web view loaded succesfully.", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebProductViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v8, "stopAnimating");

}

- (ProductViewControllerActionDelegate)actionDelegate
{
  return (ProductViewControllerActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (ApprovalRequest)request
{
  return self->_request;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UILabel)bannerLabel
{
  return self->_bannerLabel;
}

- (void)setBannerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bannerLabel, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
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
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_bannerLabel, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
}

@end
