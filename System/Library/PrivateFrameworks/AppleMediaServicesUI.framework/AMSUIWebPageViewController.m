@implementation AMSUIWebPageViewController

- (AMSUIWebPageViewController)initWithContext:(id)a3 dataProvider:(id)a4
{
  id v6;
  id v7;
  AMSUIWebPageViewController *v8;
  AMSUIWebPageViewController *v9;
  uint64_t v10;
  AMSUIWebView *webView;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebPageViewController;
  v8 = -[AMSUIWebPageViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v6);
    objc_msgSend(v7, "createWebView");
    v10 = objc_claimAutoreleasedReturnValue();
    webView = v9->_webView;
    v9->_webView = (AMSUIWebView *)v10;

  }
  return v9;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUIWebPageViewController;
  -[AMSUICommonViewController loadView](&v6, sel_loadView);
  +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController ams_setBackgroundColor:](self, "ams_setBackgroundColor:", v3);

  -[AMSUICommonViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebPageViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIWebPageViewController;
  -[AMSUIWebPageViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AMSUIWebPageViewController _applyAppearance](self, "_applyAppearance");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebPageViewController;
  -[AMSUIWebPageViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[AMSUIWebPageViewController _updateLayout](self, "_updateLayout");
}

- (id)loadRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[AMSUIWebPageViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loadUsingWebKit");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    -[AMSUIWebPageViewController _willEncodeRequest:](self, "_willEncodeRequest:", v7);
    -[AMSUIWebPageViewController _didEncodeRequest:](self, "_didEncodeRequest:", v7);
    -[AMSUIWebPageViewController webView](self, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadRequest:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BE08078]);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__AMSUIWebPageViewController_loadRequest___block_invoke;
    v12[3] = &unk_24CB51A88;
    objc_copyWeak(&v15, &location);
    v9 = v10;
    v13 = v9;
    v14 = v4;
    -[AMSUIWebPageViewController _downloadHTMLForRequest:completion:](self, "_downloadHTMLForRequest:completion:", v14, v12);

    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&location);

  return v9;
}

void __42__AMSUIWebPageViewController_loadRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  }
  else
  {
    objc_msgSend(WeakRetained, "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      v11 = *(void **)(a1 + 40);
    objc_msgSend(v15, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadRequest:response:responseData:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "finishWithPromise:", v14);
  }

}

- (id)dismissAppOverlay
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__AMSUIWebPageViewController_dismissAppOverlay__block_invoke;
  v8[3] = &unk_24CB4F4C0;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[AMSUIWebPageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

uint64_t __47__AMSUIWebPageViewController_dismissAppOverlay__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAppOverlayViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "finishWithSuccess");
}

- (id)presentAppOverlayWithAdamID:(id)a3
{
  id v4;
  AMSUIWebAppOverlayViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  AMSUIWebAppOverlayViewController *v9;
  void *v10;
  AMSUIWebAppOverlayViewController *v11;
  void *v12;
  _QWORD v14[5];
  AMSUIWebAppOverlayViewController *v15;

  v4 = a3;
  v5 = [AMSUIWebAppOverlayViewController alloc];
  -[AMSUIWebPageViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSUIWebAppOverlayViewController initWithAppAdamID:hostBundleIdentifier:](v5, "initWithAppAdamID:hostBundleIdentifier:", v4, v8);

  -[AMSUIWebAppOverlayViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 4);
  -[AMSUIWebAppOverlayViewController setTransitioningDelegate:](v9, "setTransitioningDelegate:", self);
  -[AMSUIWebAppOverlayViewController setViewRespectsSystemMinimumLayoutMargins:](v9, "setViewRespectsSystemMinimumLayoutMargins:", 0);
  -[AMSUIWebPageViewController setAppOverlayViewController:](self, "setAppOverlayViewController:", v9);
  -[AMSUIWebAppOverlayViewController preload](v9, "preload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke;
  v14[3] = &unk_24CB51AB0;
  v14[4] = self;
  v15 = v9;
  v11 = v9;
  objc_msgSend(v10, "thenWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_opt_new();
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke_2;
  v7[3] = &unk_24CB4F0E8;
  v5 = v2;
  v8 = v5;
  objc_msgSend(v4, "presentViewController:animated:completion:", v3, 1, v7);

  return v5;
}

uint64_t __58__AMSUIWebPageViewController_presentAppOverlayWithAdamID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess");
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[AMSUIWebPageViewController webView](self, "webView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "underlyingWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  AMSUIToastPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[AMSUIToastPresentationController initWithPresentedViewController:presentingViewController:]([AMSUIToastPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  -[AMSUIToastPresentationController setDismissDelayTimeInterval:](v8, "setDismissDelayTimeInterval:", 0.0);
  return v8;
}

- (void)willPresentPageModel:(id)a3 appearance:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  if (v9)
  {
    objc_storeStrong((id *)&self->_model, v9);
    objc_storeStrong((id *)&self->_appearance, a4);
    -[AMSUIWebPageViewController _applyAppearance](self, "_applyAppearance");
    -[AMSUIWebPageViewController _updateLayout](self, "_updateLayout");
    -[AMSUIWebPageViewController _updateToolbarButtonItems](self, "_updateToolbarButtonItems");
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
      -[AMSUIWebPageViewController context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Invalid browser page model: %{public}@", (uint8_t *)&v15, 0x20u);

    }
  }

}

- (void)_applyAppearance
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[AMSUIWebPageViewController appearance](self, "appearance");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  +[AMSUIWebAppearance defaultPlatformBackgroundColor](AMSUIWebAppearance, "defaultPlatformBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "backgroundColor");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  -[UIViewController ams_setBackgroundColor:](self, "ams_setBackgroundColor:", v6);

  objc_msgSend(v16, "backgroundColor");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v3;
  -[AMSUIWebPageViewController webView](self, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ams_setBackgroundColor:", v9);

  objc_msgSend(v16, "backgroundColor");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = v3;
  -[AMSUIWebPageViewController webView](self, "webView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "underlyingWebView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ams_setBackgroundColor:", v13);

}

- (id)_appOverlayTransitioning
{
  _BOOL4 IsReduceMotionEnabled;
  __objc2_class **v3;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v3 = off_24CB4DFC0;
  if (!IsReduceMotionEnabled)
    v3 = off_24CB4E030;
  return objc_alloc_init(*v3);
}

- (void)_didEncodeRequest:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AMSUIWebPageViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[AMSUIWebPageViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "webPageViewController:didEncodeNetworkRequest:", self, v7);

  }
}

- (void)_downloadHTMLForRequest:(id)a3 completion:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
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
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  id v38;
  AMSUIWebPageViewController *v39;

  v30 = a4;
  v6 = objc_msgSend(a3, "mutableCopy");
  -[AMSUIWebPageViewController _willEncodeRequest:](self, "_willEncodeRequest:", v6);
  -[AMSUIWebPageViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x24BE083F8]);
  -[AMSUIWebPageViewController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithBag:", v11);

  -[AMSUIWebPageViewController context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccount:", v14);

  -[AMSUIWebPageViewController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClientInfo:", v16);

  -[AMSUIWebPageViewController context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLogUUID:", v18);

  -[AMSUIWebPageViewController context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mescalSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    objc_msgSend(v12, "setMescalType:", 1);
  -[AMSUIWebPageViewController context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUrlKnownToBeTrusted:", objc_msgSend(v21, "disableTrustedDomains"));

  v22 = objc_alloc_init(MEMORY[0x24BE081B8]);
  objc_msgSend(v22, "setPurpose:", 1);
  objc_msgSend(v22, "setStyle:", objc_msgSend(MEMORY[0x24BE081B8], "preferredAttestationStyle"));
  objc_msgSend(v12, "setKeychainOptions:", v22);
  v31 = (void *)v6;
  objc_msgSend(v12, "requestByEncodingRequest:parameters:", v6, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  if (v20)
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke;
    v37[3] = &unk_24CB50720;
    v38 = v20;
    v39 = self;
    objc_msgSend(v23, "thenWithBlock:", v37);
    v25 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v25;
  }
  v35[0] = v24;
  v35[1] = 3221225472;
  v35[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2_28;
  v35[3] = &unk_24CB50720;
  v35[4] = self;
  v36 = v8;
  v26 = v8;
  objc_msgSend(v23, "thenWithBlock:", v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v24;
  v32[1] = 3221225472;
  v32[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3_29;
  v32[3] = &unk_24CB51AD8;
  v32[4] = self;
  v33 = v20;
  v34 = v30;
  v28 = v30;
  v29 = v20;
  objc_msgSend(v27, "addFinishBlock:", v32);

}

id __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primeSignatureForData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2;
  v18[3] = &unk_24CB51950;
  v8 = v3;
  v19 = v8;
  objc_msgSend(v6, "addSuccessBlock:", v18);
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3;
  v17[3] = &unk_24CB4F560;
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "addErrorBlock:", v17);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_25;
  v14[3] = &unk_24CB51978;
  v9 = objc_alloc_init(MEMORY[0x24BE08340]);
  v15 = v9;
  v16 = v8;
  v10 = v8;
  objc_msgSend(v6, "addFinishBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forHTTPHeaderField:", v3, *MEMORY[0x24BE07DE0]);

}

void __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v3;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to prime sign: %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

uint64_t __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

id __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_2_28(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_didEncodeRequest:", v4);
  objc_msgSend(*(id *)(a1 + 40), "dataTaskPromiseWithRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __65__AMSUIWebPageViewController__downloadHTMLForRequest_completion___block_invoke_3_29(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
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
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_addCookiesForResult:", v6);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "versionNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(v6, "responseHeaders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE07DE8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setVersionNumber:", v12);

  if (!v11)
  {

  }
  objc_msgSend(v6, "responseHeaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE07DE0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40) && objc_msgSend(v15, "length"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v15, 0);
    objc_msgSend(*(id *)(a1 + 40), "verifyPrimeSignature:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v17, "resultWithError:", &v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v32;

    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v18)
    {
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v29 = v17;
      v23 = v19;
      v24 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v31 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v24;
      v19 = v23;
      v17 = v29;
      v35 = 2114;
      v36 = v26;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Verify prime finished.", buf, 0x16u);

    }
    else
    {
      if (!v20)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v30 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v31 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logKey");
      v27 = v19;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v30;
      v35 = 2114;
      v36 = v28;
      v37 = 2114;
      v38 = v27;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Verify prime failed: %{public}@", buf, 0x20u);

      v19 = v27;
    }

    v16 = v31;
LABEL_17:

  }
  if (!v6 || v7)
  {
    if (!v7)
    {
      AMSError();
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_updateToolbarButtonItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[AMSUIWebPageViewController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "leftButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BEBD410];
  v8 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke;
  v23[3] = &unk_24CB4F0E8;
  v9 = v6;
  v24 = v9;
  objc_msgSend(v7, "barButtonItemWithWebButtonModel:navigationBarModel:actionBlock:", v9, 0, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("left_bar_button_item"));
    objc_msgSend(v3, "addObject:", v11);
  }
  objc_msgSend(v5, "rightButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BEBD410];
  v18 = v8;
  v19 = 3221225472;
  v20 = __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke_2;
  v21 = &unk_24CB4F0E8;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v13, "barButtonItemWithWebButtonModel:navigationBarModel:actionBlock:", v14, 0, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("right_bar_button_item"), v18, v19, v20, v21);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    objc_msgSend(v3, "addObject:", v17);

    objc_msgSend(v3, "addObject:", v16);
  }
  -[AMSUIWebPageViewController setToolbarItems:](self, "setToolbarItems:", v3, v18, v19, v20, v21);

}

void __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "runAction");

}

void __55__AMSUIWebPageViewController__updateToolbarButtonItems__block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "runAction");

}

- (void)_updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[AMSUICommonViewController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AMSUIWebPageViewController webView](self, "webView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_willEncodeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[AMSUIWebPageViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "additionalHeaders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__AMSUIWebPageViewController__willEncodeRequest___block_invoke;
  v8[3] = &unk_24CB50978;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

}

uint64_t __49__AMSUIWebPageViewController__willEncodeRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (AMSUIWebPageViewControllerDelegate)delegate
{
  return (AMSUIWebPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMSUIWebView)webView
{
  return self->_webView;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (AMSUIWebAppearance)appearance
{
  return self->_appearance;
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (AMSUIWebAppOverlayViewController)appOverlayViewController
{
  return self->_appOverlayViewController;
}

- (void)setAppOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appOverlayViewController, a3);
}

- (AMSUIWebPageModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_appOverlayViewController, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
