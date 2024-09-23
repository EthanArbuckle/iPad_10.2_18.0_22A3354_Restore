@implementation AMSUIWebSafariViewController

- (AMSUIWebSafariViewController)initWithContext:(id)a3
{
  id v5;
  AMSUIWebSafariViewController *v6;
  AMSUIWebSafariViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebSafariViewController;
  v6 = -[AMSUIWebSafariViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (NSURL)originalURL
{
  void *v2;
  void *v3;

  -[AMSUIWebSafariViewController model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)loadActionURL:(id)a3 data:(id)a4 callbackScheme:(id)a5 actionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSUIWebSafariPageModel *v14;
  void *v15;
  AMSUIWebSafariPageModel *v16;
  AMSUIWebSafariPageModel *model;
  void *v18;
  id actionHandler;
  AMSUIWebSafariPageModel *v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [AMSUIWebSafariPageModel alloc];
  -[AMSUIWebSafariViewController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSUIWebSafariPageModel initWithJSObject:context:](v14, "initWithJSObject:context:", MEMORY[0x24BDBD1B8], v15);

  -[AMSUIWebSafariPageModel setData:](v16, "setData:", v12);
  -[AMSUIWebSafariPageModel setCallbackScheme:](v16, "setCallbackScheme:", v11);

  -[AMSUIWebSafariPageModel setURL:](v16, "setURL:", v13);
  model = self->_model;
  self->_model = v16;
  v20 = v16;

  v18 = _Block_copy(v10);
  actionHandler = self->_actionHandler;
  self->_actionHandler = v18;

}

- (void)receiveCallbackURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[AMSUIWebOpenSafariAction resultFromURL:error:](AMSUIWebOpenSafariAction, "resultFromURL:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "postEvent:options:", CFSTR("SafariDataUpdate"), v5);

  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    -[AMSUIWebSafariViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2114;
    v17 = v13;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received URL with scheme: %@", (uint8_t *)&v14, 0x20u);

  }
  -[AMSUIWebSafariViewController _callActionHandlerWithURL:error:](self, "_callActionHandlerWithURL:error:", v4, 0);
  if (!-[AMSUIWebSafariViewController didHandleDismiss](self, "didHandleDismiss")
    && -[AMSUIWebSafariViewController shouldDismissOnCallback](self, "shouldDismissOnCallback"))
  {
    -[AMSUIWebSafariViewController setDidHandleDismiss:](self, "setDidHandleDismiss:", 1);
    -[UIViewController ams_dismissViewControllerAnimated:completion:](self, "ams_dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  id v6;
  id v7;
  AMSUIWebSafariPageModel *v8;
  AMSUIWebSafariPageModel *model;
  id v10;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_appearance, a4);
  v10 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (AMSUIWebSafariPageModel *)v10;
  else
    v8 = 0;

  model = self->_model;
  self->_model = v8;

}

- (void)loadView
{
  AMSUIWebDelegateProxy *v3;
  void *v4;
  void *v5;
  void *v6;
  AMSUIWebSafariWebView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AMSUIWebSafariWebView *v13;
  AMSUIWebSafariWebView *webView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AMSUIWebSafariViewController;
  -[AMSUICommonViewController loadView](&v24, sel_loadView);
  v3 = objc_alloc_init(AMSUIWebDelegateProxy);
  -[AMSUIWebDelegateProxy setDelegate:](v3, "setDelegate:", self);
  -[AMSUIWebSafariViewController appearance](self, "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UIViewController ams_setBackgroundColor:](self, "ams_setBackgroundColor:", v5);
  }
  else
  {
    +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController ams_setBackgroundColor:](self, "ams_setBackgroundColor:", v6);

  }
  v7 = [AMSUIWebSafariWebView alloc];
  -[AMSUIWebSafariViewController appearance](self, "appearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariViewController model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "callbackScheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariViewController model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSUIWebSafariWebView initWithAppearance:scheme:data:delegate:](v7, "initWithAppearance:scheme:data:delegate:", v8, v10, v12, self);
  webView = self->_webView;
  self->_webView = v13;

  -[AMSUIWebSafariViewController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariWebView setLogKey:](self->_webView, "setLogKey:", v16);

  -[AMSUIWebSafariViewController appearance](self, "appearance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "backgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[UIView ams_setBackgroundColor:](self->_webView, "ams_setBackgroundColor:", v18);
  }
  else
  {
    +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView ams_setBackgroundColor:](self->_webView, "ams_setBackgroundColor:", v19);

  }
  -[AMSUICommonViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariViewController webView](self, "webView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v21);

  -[AMSUIWebSafariViewController _startLoadingWebView](self, "_startLoadingWebView");
  -[AMSUIWebSafariViewController model](self, "model");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "loadingModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[AMSUIWebSafariViewController _transitionToLoading](self, "_transitionToLoading");
  }
  else
  {
    -[AMSUIWebSafariViewController _transitionToWebView](self, "_transitionToWebView");
    -[AMSUIWebSafariViewController _setupPageForWebView](self, "_setupPageForWebView");
  }

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    -[AMSUIWebSafariViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deallocated", buf, 0x16u);

  }
  -[AMSUIWebSafariViewController _handleDismiss](self, "_handleDismiss");
  v8.receiver = self;
  v8.super_class = (Class)AMSUIWebSafariViewController;
  -[AMSUICommonViewController dealloc](&v8, sel_dealloc);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig", a3);
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
    -[AMSUIWebSafariViewController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling swipe to dismiss", (uint8_t *)&v9, 0x16u);

  }
  -[AMSUIWebSafariViewController _handleDismiss](self, "_handleDismiss");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (-[AMSUIWebSafariViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
      -[AMSUIWebSafariViewController context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling disappear dismissal", buf, 0x16u);

    }
    -[AMSUIWebSafariViewController _handleDismiss](self, "_handleDismiss");
  }
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebSafariViewController;
  -[AMSUIWebSafariViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebSafariViewController;
  -[AMSUIWebSafariViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[AMSUIWebSafariViewController _setupPageForWebView](self, "_setupPageForWebView");
  if (-[AMSUIWebSafariViewController shouldSetPresentationDelegate](self, "shouldSetPresentationDelegate"))
  {
    -[AMSUIWebSafariViewController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)AMSUIWebSafariViewController;
  -[AMSUIWebSafariViewController viewWillLayoutSubviews](&v50, sel_viewWillLayoutSubviews);
  -[AMSUIWebSafariViewController toolbar](self, "toolbar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v5, v6);
  v8 = v7;
  v10 = v9;

  -[AMSUICommonViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12 - v10;
  -[AMSUICommonViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaInsets");
  v16 = v13 - v15;
  -[AMSUIWebSafariViewController toolbar](self, "toolbar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", 0.0, v16, v8, v10);

  -[AMSUICommonViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaInsets");
  v20 = v19;
  -[AMSUICommonViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  -[AMSUICommonViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25 - v10;
  -[AMSUICommonViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaInsets");
  v29 = v26 - v28;
  -[AMSUICommonViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safeAreaInsets");
  v32 = v29 - v31;
  -[AMSUIWebSafariViewController webView](self, "webView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", 0.0, v20, v23, v32);

  -[AMSUICommonViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[AMSUIWebSafariViewController placeholderPage](self, "placeholderPage");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", v36, v38, v40, v42);

  -[AMSUIWebSafariViewController webView](self, "webView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "scrollView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setContentInsetAdjustmentBehavior:", 2);

  -[AMSUIWebSafariViewController webView](self, "webView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "scrollView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setMasksToBounds:", 0);

}

- (void)safariView:(id)a3 didReceiveAction:(id)a4 body:(id)a5 replyHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
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
    v14 = objc_opt_class();
    -[AMSUIWebSafariViewController context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v14;
    v32 = 2114;
    v33 = v16;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received action: %@", buf, 0x20u);

  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("callback")))
  {
    -[AMSUIWebSafariViewController context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "runSafariCallback:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __78__AMSUIWebSafariViewController_safariView_didReceiveAction_body_replyHandler___block_invoke;
    v28[3] = &unk_24CB51B90;
    v28[4] = self;
    v29 = v11;
    objc_msgSend(v19, "addFinishBlock:", v28);

    goto LABEL_22;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("dismiss")))
  {
    -[AMSUIWebSafariViewController _dismiss](self, "_dismiss");
LABEL_21:
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x24BDBD1C8], 0);
    goto LABEL_22;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("pop")))
  {
    -[AMSUIWebSafariViewController _pop](self, "_pop");
    goto LABEL_21;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("finishedLoading")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("success"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("success"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

    }
    else
    {
      v22 = 0;
    }

    -[AMSUIWebSafariViewController _finishedLoadingWithSuccess:](self, "_finishedLoadingWithSuccess:", v22);
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v23, "OSLogObject");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = objc_opt_class();
    -[AMSUIWebSafariViewController context](self, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v25;
    v32 = 2114;
    v33 = v27;
    v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unknown safari action: %{public}@", buf, 0x20u);

  }
  (*((void (**)(id, _QWORD, const __CFString *))v11 + 2))(v11, 0, CFSTR("Error: Unknown safari action"));
LABEL_22:

}

void __78__AMSUIWebSafariViewController_safariView_didReceiveAction_body_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
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
    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Returning result: %{public}@ error: %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v12 + 16))(v12, v5, v13);

}

- (void)safariView:(id)a3 didRedirectToSchemeWithURL:(id)a4
{
  -[AMSUIWebSafariViewController receiveCallbackURL:](self, "receiveCallbackURL:", a4);
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3, a4);
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
    -[AMSUIWebSafariViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebSafariViewController webView](self, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commit navigation: %@", (uint8_t *)&v12, 0x20u);

  }
  -[AMSUIWebSafariViewController _updateButtons](self, "_updateButtons");
  -[AMSUIWebSafariViewController _setupPageForWebView](self, "_setupPageForWebView");
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[AMSUIWebSafariViewController setPerformingNavigation:](self, "setPerformingNavigation:", 0, a4);
  -[AMSUIWebSafariViewController _setupPageForWebView](self, "_setupPageForWebView");
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  -[AMSUIWebSafariViewController setPerformingNavigation:](self, "setPerformingNavigation:", 1, a4);
  -[AMSUIWebSafariViewController _setupPageForWebView](self, "_setupPageForWebView");
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig", a3, a4);
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
    -[AMSUIWebSafariViewController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did stop handling scheme.", (uint8_t *)&v10, 0x16u);

  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v7, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("http")))
  {

    goto LABEL_4;
  }
  objc_msgSend(v10, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("https"));

  if (v13)
  {
LABEL_4:
    objc_msgSend(v7, "targetFrame");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v8[2](v8, 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE082E8], "openStandardURL:", v10);
      v8[2](v8, 0);
    }
    goto LABEL_12;
  }
  objc_msgSend(v10, "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariViewController model](self, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callbackScheme");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_24CB5A078;
  v20 = objc_msgSend(v15, "isEqualToString:", v19);

  if (v20)
  {
    v8[2](v8, 3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "applicationsAvailableForOpeningURL:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count"))
    {
      v35 = v22;
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
        -[AMSUIWebSafariViewController context](self, "context");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logKey");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v25;
        v40 = 2114;
        v41 = v27;
        v42 = 2112;
        v43 = v10;
        _os_log_impl(&dword_211102000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to open URL with LS: %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __88__AMSUIWebSafariViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
      v36[3] = &unk_24CB51BB8;
      v36[4] = self;
      v29 = v10;
      v37 = v29;
      objc_msgSend(v28, "openURL:options:completionHandler:", v29, MEMORY[0x24BDBD1B8], v36);

      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_opt_class();
        -[AMSUIWebSafariViewController context](self, "context");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logKey");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v32;
        v40 = 2114;
        v41 = v34;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_211102000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Redirecting to app URL scheme for URL: %@", buf, 0x20u);

      }
      -[AMSUIWebSafariViewController setPerformingNavigation:](self, "setPerformingNavigation:", 0);
      -[AMSUIWebSafariViewController _setupPageForWebView](self, "_setupPageForWebView");
      v8[2](v8, 0);
      v22 = v35;
    }
    else
    {
      v8[2](v8, 1);
    }

  }
LABEL_12:

}

void __88__AMSUIWebSafariViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_211102000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Could not load app URL scheme for URL: %@", (uint8_t *)&v9, 0x20u);

    }
  }
}

- (void)_back:(id)a3
{
  id v3;
  id v4;

  -[AMSUIWebSafariViewController webView](self, "webView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "goBack");

}

- (void)_cancel:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig", a3);
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
    -[AMSUIWebSafariViewController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cancel selected", (uint8_t *)&v9, 0x16u);

  }
  -[AMSUIWebSafariViewController _dismiss](self, "_dismiss");
}

- (id)_createToolBar
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *toolbarLeft;
  void *v9;
  id v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *toolbarRight;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BEBD410], "fixedSpaceItemOfWidth:", 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BEBD640], "ams_systemChevronLeft");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIBarButtonItem *)objc_msgSend(v5, "initWithImage:style:target:action:", v6, 0, self, sel__back_);
  toolbarLeft = self->_toolbarLeft;
  self->_toolbarLeft = v7;

  objc_msgSend(v3, "addObject:", self->_toolbarLeft);
  objc_msgSend(MEMORY[0x24BEBD410], "fixedSpaceItemOfWidth:", 40.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BEBD640], "ams_systemChevronRight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIBarButtonItem *)objc_msgSend(v10, "initWithImage:style:target:action:", v11, 0, self, sel__forward_);
  toolbarRight = self->_toolbarRight;
  self->_toolbarRight = v12;

  objc_msgSend(v3, "addObject:", self->_toolbarRight);
  -[AMSUIWebSafariViewController model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v14, "showShareButton");

  if ((_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x24BEBD410], "flexibleSpaceItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__share_);
    objc_msgSend(v3, "addObject:", v16);

  }
  v17 = objc_alloc(MEMORY[0x24BEBDA90]);
  v18 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v18, "setItems:animated:", v3, 0);

  return v18;
}

- (void)_dismiss
{
  -[AMSUIWebSafariViewController _handleDismiss](self, "_handleDismiss");
  -[UIViewController ams_dismissViewControllerAnimated:completion:](self, "ams_dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_finishedLoadingWithSuccess:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[AMSUIWebSafariViewController _transitionToWebView](self, "_transitionToWebView");
  }
  else
  {
    AMSError();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebSafariViewController _transitionToErrorViewWithError:](self, "_transitionToErrorViewWithError:", v4);

  }
}

- (void)_forward:(id)a3
{
  id v3;
  id v4;

  -[AMSUIWebSafariViewController webView](self, "webView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "goForward");

}

- (void)_handleDismiss
{
  id v3;

  -[AMSUIWebSafariViewController setDidHandleDismiss:](self, "setDidHandleDismiss:", 1);
  AMSError();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariViewController _callActionHandlerWithURL:error:](self, "_callActionHandlerWithURL:error:", 0, v3);

}

- (BOOL)_callActionHandlerWithURL:(id)a3 error:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);

  v6 = (unint64_t)a3;
  v7 = (uint64_t)a4;
  if (!(v6 | v7))
  {
    AMSError();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {

    v6 = 0;
  }
  -[AMSUIWebSafariViewController actionHandler](self, "actionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AMSUIWebSafariViewController actionHandler](self, "actionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, v6, v7);

    -[AMSUIWebSafariViewController setActionHandler:](self, "setActionHandler:", 0);
  }

  return v8 != 0;
}

- (void)_pop
{
  id v3;
  id v4;

  -[AMSUIWebSafariViewController _handleDismiss](self, "_handleDismiss");
  -[AMSUIWebSafariViewController navigationController](self, "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)_presentActivityViewControllerWithActivityItems:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BE8F650];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithActivityItems:applicationActivities:", v5, 0);

  -[AMSUICommonViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceView:", v6);

  -[AMSUIWebSafariViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_presentPlaceholderModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSUIWebSafariViewController placeholderPage](self, "placeholderPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_removeFromParentViewController");

  -[AMSUIWebSafariViewController setPlaceholderPage:](self, "setPlaceholderPage:", 0);
  objc_msgSend(v4, "createViewControllerForContainer:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebSafariViewController appearance](self, "appearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willPresentPageModel:appearance:", v4, v6);

  -[UIViewController ams_setChildViewController:](self, "ams_setChildViewController:", v7);
  -[AMSUIWebSafariViewController setPlaceholderPage:](self, "setPlaceholderPage:", v7);

}

- (void)_refresh:(id)a3
{
  id v3;
  id v4;

  -[AMSUIWebSafariViewController webView](self, "webView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "reload");

}

- (void)_startLoadingWebView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebSafariViewController model](self, "model");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[AMSUIWebSafariViewController webView](self, "webView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AMSUIWebSafariViewController webView](self, "webView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v7)
      {
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          goto LABEL_14;
        v11 = objc_opt_class();
        -[AMSUIWebSafariViewController context](self, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v11;
        v27 = 2114;
        v28 = v13;
        _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Safari already loaded", (uint8_t *)&v25, 0x16u);

      }
      else
      {
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "OSLogObject");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_opt_class();
          -[AMSUIWebSafariViewController context](self, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logKey");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSUIWebSafariViewController model](self, "model");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "URL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[AMSUIWebSafariViewController model](self, "model");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "callbackScheme");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138544130;
          v26 = v15;
          v27 = 2114;
          v28 = v17;
          v29 = 2112;
          v30 = v19;
          v31 = 2114;
          v32 = v21;
          _os_log_impl(&dword_211102000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading safari url: %@, scheme: %{public}@", (uint8_t *)&v25, 0x2Au);

        }
        -[AMSUIWebSafariViewController webView](self, "webView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BDD1840];
        -[AMSUIWebSafariViewController model](self, "model");
        v10 = objc_claimAutoreleasedReturnValue();
        -[NSObject URL](v10, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "requestWithURL:", v12);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v9, "loadRequest:", v23);

      }
LABEL_14:

    }
  }
}

- (void)_setupPageForWebView
{
  void *v3;
  void *v4;
  UIToolbar *v5;
  UIToolbar *toolbar;
  void *v7;

  if (-[AMSUIWebSafariViewController pageState](self, "pageState") == 3)
  {
    -[AMSUIWebSafariViewController model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "hideToolBar") & 1) == 0)
    {
      -[AMSUIWebSafariViewController toolbar](self, "toolbar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
LABEL_6:
        -[AMSUIWebSafariViewController _setupSafariNavBarWithSpinner:](self, "_setupSafariNavBarWithSpinner:", -[AMSUIWebSafariViewController performingNavigation](self, "performingNavigation"));
        return;
      }
      -[AMSUIWebSafariViewController _createToolBar](self, "_createToolBar");
      v5 = (UIToolbar *)objc_claimAutoreleasedReturnValue();
      toolbar = self->_toolbar;
      self->_toolbar = v5;

      -[AMSUICommonViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIWebSafariViewController toolbar](self, "toolbar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addSubview:", v7);

    }
    goto LABEL_6;
  }
}

- (void)_share:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  _QWORD v20[4];
  id v21;
  AMSUIWebSafariViewController *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebSafariViewController webView](self, "webView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIWebSafariViewController webView](self, "webView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[AMSUIWebSafariViewController webView](self, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("pdf"));

    if (v13)
    {
      -[AMSUIWebSafariViewController webView](self, "webView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __39__AMSUIWebSafariViewController__share___block_invoke;
      v20[3] = &unk_24CB51978;
      v8 = v8;
      v21 = v8;
      v22 = self;
      objc_msgSend(v14, "_getMainResourceDataWithCompletionHandler:", v20);

    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__AMSUIWebSafariViewController__share___block_invoke_2_68;
      block[3] = &unk_24CB4F0E8;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      -[AMSUIWebSafariViewController context](self, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logKey");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v16;
      v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_211102000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No URL to share", buf, 0x16u);

    }
  }

}

void __39__AMSUIWebSafariViewController__share___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    dispatch_get_global_queue(2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__AMSUIWebSafariViewController__share___block_invoke_2;
    block[3] = &unk_24CB4F370;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    v9 = v6;
    v10 = v3;
    dispatch_async(v4, block);

  }
}

void __39__AMSUIWebSafariViewController__share___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedPushNotificationConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v20 = objc_opt_class();
      v21 = 2114;
      v22 = v4;
      _os_log_impl(&dword_211102000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Writing pdf asset to %{public}@", buf, 0x16u);
    }

    v11 = (void *)a1[6];
    v18 = 0;
    objc_msgSend(v11, "writeToURL:options:error:", v4, 1, &v18);
    v8 = v18;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedPushNotificationConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v8;
        _os_log_impl(&dword_211102000, v13, OS_LOG_TYPE_INFO, "%{public}@: Error writing pdf asset: %{public}@", buf, 0x16u);
      }

    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__AMSUIWebSafariViewController__share___block_invoke_64;
  block[3] = &unk_24CB4F4C0;
  block[4] = a1[5];
  v17 = v4;
  v15 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __39__AMSUIWebSafariViewController__share___block_invoke_64(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v1, "_presentActivityViewControllerWithActivityItems:", v2);

}

void __39__AMSUIWebSafariViewController__share___block_invoke_2_68(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(*(id *)(a1 + 32), "webView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewPrintFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v6, 0);
  objc_msgSend(v2, "_presentActivityViewControllerWithActivityItems:", v7);

}

- (void)_startErrorTimer
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__AMSUIWebSafariViewController__startErrorTimer__block_invoke;
  v7[3] = &unk_24CB4F0E8;
  v7[4] = self;
  v3 = v7;
  AMSLogKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_time(0, 30000000000);
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_2;
  block[3] = &unk_24CB4F3C0;
  v9 = v4;
  v10 = v3;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

}

void __48__AMSUIWebSafariViewController__startErrorTimer__block_invoke(uint64_t a1)
{
  id v2;

  AMSError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_transitionToErrorViewWithError:", v2);

}

- (void)_transitionToErrorViewWithError:(id)a3
{
  id v4;
  AMSUIWebErrorPageModel *v5;
  void *v6;
  AMSUIWebErrorPageModel *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  if (-[AMSUIWebSafariViewController pageState](self, "pageState") == 1
    || !-[AMSUIWebSafariViewController pageState](self, "pageState"))
  {
    -[AMSUIWebSafariViewController setPageState:](self, "setPageState:", 2);
    objc_initWeak(&location, self);
    v5 = [AMSUIWebErrorPageModel alloc];
    -[AMSUIWebSafariViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke;
    v11 = &unk_24CB51BE0;
    objc_copyWeak(&v12, &location);
    v7 = -[AMSUIWebErrorPageModel initWithError:context:actionBlock:](v5, "initWithError:context:actionBlock:", v4, v6, &v8);

    -[AMSUIWebSafariViewController _presentPlaceholderModel:](self, "_presentPlaceholderModel:", v7, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke_2;
  v4[3] = &unk_24CB50ED0;
  objc_copyWeak(&v5, v1);
  objc_msgSend(v3, "evaluateJavaScript:completionHandler:", CFSTR("AMSSafari.retryCallback();"), v4);

  objc_destroyWeak(&v5);
}

void __64__AMSUIWebSafariViewController__transitionToErrorViewWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      objc_msgSend(WeakRetained, "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v4;
      _os_log_impl(&dword_211102000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to run retry script. %{public}@", (uint8_t *)&v16, 0x20u);

    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      objc_msgSend(WeakRetained, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully ran retry script", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(WeakRetained, "_transitionToLoading");
  }

}

- (void)_transitionToLoading
{
  void *v3;
  void *v4;

  if (-[AMSUIWebSafariViewController pageState](self, "pageState") == 2
    || !-[AMSUIWebSafariViewController pageState](self, "pageState"))
  {
    -[AMSUIWebSafariViewController setPageState:](self, "setPageState:", 1);
    -[AMSUIWebSafariViewController model](self, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadingModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebSafariViewController _presentPlaceholderModel:](self, "_presentPlaceholderModel:", v4);

    -[AMSUIWebSafariViewController _startErrorTimer](self, "_startErrorTimer");
  }
}

- (void)_transitionToWebView
{
  void *v3;

  if (-[AMSUIWebSafariViewController pageState](self, "pageState") != 3)
  {
    -[AMSUIWebSafariViewController setPageState:](self, "setPageState:", 3);
    -[AMSUIWebSafariViewController _setupPageForWebView](self, "_setupPageForWebView");
    -[AMSUIWebSafariViewController placeholderPage](self, "placeholderPage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_removeFromParentViewController");

    -[AMSUIWebSafariViewController setPlaceholderPage:](self, "setPlaceholderPage:", 0);
  }
}

- (void)_setupSafariNavBarWithSpinner:(BOOL)a3
{
  _BOOL4 v3;
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
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void **v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];

  v3 = a3;
  v40[1] = *MEMORY[0x24BDAC8D0];
  if (-[AMSUIWebSafariViewController pageState](self, "pageState") == 3)
  {
    -[UIViewController ams_navigationItemViewController](self, "ams_navigationItemViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[AMSUIWebSafariViewController model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "setTitle:", v9);
    }
    else
    {
      v36 = v3;
      v37 = v6;
      -[AMSUIWebSafariViewController webView](self, "webView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v5, "setTitle:", v12);
      }
      else
      {
        -[AMSUIWebSafariViewController model](self, "model");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setTitle:", v14);

      }
      v6 = v37;
      v3 = v36;
    }

    -[AMSUIWebSafariViewController model](self, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "includesLeftItems"))
    {

    }
    else
    {
      -[AMSUIWebSafariViewController navigationController](self, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "viewControllers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 <= 1)
      {
        v20 = objc_alloc(MEMORY[0x24BEBD410]);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        AMSUILocalizedStringFromBundle(CFSTR("CANCEL"), 0, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v20, "initWithTitle:style:target:action:", v22, 0, self, sel__cancel_);

        objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("cancel_bar_button_item"));
        v40[0] = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLeftBarButtonItems:", v24);

      }
    }
    -[AMSUIWebSafariViewController model](self, "model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "navigationBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "includesRightItems");

    if ((v27 & 1) != 0)
      goto LABEL_21;
    if (v3)
    {
      objc_msgSend(v6, "rightBarButtonItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "customView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
LABEL_21:

        return;
      }
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v31);
      objc_msgSend(v32, "setAccessibilityIdentifier:", CFSTR("activity_indicator_bar_button_item"));
      objc_msgSend(v31, "startAnimating");
      v39 = v32;
      v33 = &v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.clockwise"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithImage:style:target:action:", v32, 0, self, sel__refresh_);
      objc_msgSend(v31, "setAccessibilityIdentifier:", CFSTR("refresh_bar_button_item"));
      v38 = v31;
      v33 = &v38;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItems:", v34);

    goto LABEL_21;
  }
}

- (void)_updateButtons
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[AMSUIWebSafariViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canGoBack");
  -[AMSUIWebSafariViewController toolbarLeft](self, "toolbarLeft");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  -[AMSUIWebSafariViewController webView](self, "webView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "canGoForward");
  -[AMSUIWebSafariViewController toolbarRight](self, "toolbarRight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (BOOL)shouldDismissOnCallback
{
  return self->_shouldDismissOnCallback;
}

- (void)setShouldDismissOnCallback:(BOOL)a3
{
  self->_shouldDismissOnCallback = a3;
}

- (BOOL)shouldSetPresentationDelegate
{
  return self->_shouldSetPresentationDelegate;
}

- (void)setShouldSetPresentationDelegate:(BOOL)a3
{
  self->_shouldSetPresentationDelegate = a3;
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_appearance, a3);
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (BOOL)didHandleDismiss
{
  return self->_didHandleDismiss;
}

- (void)setDidHandleDismiss:(BOOL)a3
{
  self->_didHandleDismiss = a3;
}

- (UIViewController)placeholderPage
{
  return self->_placeholderPage;
}

- (void)setPlaceholderPage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderPage, a3);
}

- (AMSUIWebSafariPageModel)model
{
  return self->_model;
}

- (int64_t)pageState
{
  return self->_pageState;
}

- (void)setPageState:(int64_t)a3
{
  self->_pageState = a3;
}

- (BOOL)performingNavigation
{
  return self->_performingNavigation;
}

- (void)setPerformingNavigation:(BOOL)a3
{
  self->_performingNavigation = a3;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (UIBarButtonItem)toolbarLeft
{
  return self->_toolbarLeft;
}

- (UIBarButtonItem)toolbarRight
{
  return self->_toolbarRight;
}

- (AMSUIWebSafariWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_toolbarRight, 0);
  objc_storeStrong((id *)&self->_toolbarLeft, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_placeholderPage, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end
