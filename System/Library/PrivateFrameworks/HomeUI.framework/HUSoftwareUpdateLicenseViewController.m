@implementation HUSoftwareUpdateLicenseViewController

- (HUSoftwareUpdateLicenseViewController)initWithURL:(id)a3
{
  id v5;
  HUWebViewController *v6;
  HUSoftwareUpdateLicenseViewController *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateLicenseViewController.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v6 = -[HUWebViewController initWithURL:]([HUWebViewController alloc], "initWithURL:", v5);
  v7 = -[HUSoftwareUpdateLicenseViewController _initWithWebViewController:](self, "_initWithWebViewController:", v6);

  return v7;
}

- (HUSoftwareUpdateLicenseViewController)initWithDocument:(id)a3
{
  id v5;
  HUWebViewController *v6;
  HUSoftwareUpdateLicenseViewController *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateLicenseViewController.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("document"));

  }
  v6 = -[HUWebViewController initWithDocument:]([HUWebViewController alloc], "initWithDocument:", v5);
  v7 = -[HUSoftwareUpdateLicenseViewController _initWithWebViewController:](self, "_initWithWebViewController:", v6);

  return v7;
}

- (id)_initWithWebViewController:(id)a3
{
  id v5;
  HUSoftwareUpdateLicenseViewController *v6;
  id *p_isa;
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
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  objc_super v39;

  v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  v6 = -[HUSoftwareUpdateLicenseViewController init](&v39, sel_init);
  p_isa = (id *)&v6->super.super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webViewController, a3);
    objc_msgSend(p_isa[129], "setShowsShareButton:", 0);
    objc_msgSend(p_isa, "webViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setZoomEnabled:", 0);

    objc_msgSend(p_isa, "addChildViewController:", v5);
    objc_msgSend(v5, "didMoveToParentViewController:", p_isa);
    objc_msgSend(p_isa, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoresizingMask:", 18);

    objc_msgSend(p_isa, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUIDelegate:", p_isa);

    objc_msgSend(p_isa, "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setLayoutMode:", 4);

    objc_msgSend(p_isa, "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(p_isa, "webView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setShowsBackgroundShadow:", 0);

    objc_msgSend(p_isa, "webView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDecelerationRate:", 0.998);

    objc_msgSend(p_isa, "webView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setScrollEnabled:", 0);

    objc_msgSend(p_isa, "webView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", p_isa);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = p_isa[126];
    p_isa[126] = (id)v23;

    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[126], "setBackgroundColor:", v25);

    v26 = p_isa[126];
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTitleColor:forState:", v27, 0);

    v28 = p_isa[126];
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateLicenseViewControllerEmailButtonTitle"), CFSTR("HUSoftwareUpdateLicenseViewControllerEmailButtonTitle"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTitle:forState:", v29, 0);

    objc_msgSend(p_isa[126], "addTarget:action:forControlEvents:", p_isa, sel__emailTermsAndConditions_, 64);
    if ((objc_msgSend(MEMORY[0x1E0CC68B8], "canSendMail") & 1) == 0)
      objc_msgSend(p_isa[126], "setEnabled:", 0);
    v30 = objc_opt_new();
    v31 = p_isa[125];
    p_isa[125] = (id)v30;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[125], "setBackgroundColor:", v32);

    v33 = p_isa[125];
    objc_msgSend(p_isa, "retainCopyOfTermsButton");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v34);

    v35 = p_isa[125];
    objc_msgSend(p_isa, "webViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addSubview:", v37);

  }
  return p_isa;
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[HUSoftwareUpdateLicenseViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hu_preloadContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HUSoftwareUpdateLicenseViewController_hu_preloadContent__block_invoke;
  v7[3] = &unk_1E6F55128;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

id __58__HUSoftwareUpdateLicenseViewController_hu_preloadContent__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loadLicense");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)loadView
{
  id v3;

  -[HUSoftwareUpdateLicenseViewController scrollView](self, "scrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateLicenseViewController setView:](self, "setView:", v3);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  -[HUSoftwareUpdateLicenseViewController viewWillLayoutSubviews](&v8, sel_viewWillLayoutSubviews);
  -[HUSoftwareUpdateLicenseViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[HUSoftwareUpdateLicenseViewController retainCopyOfTermsButton](self, "retainCopyOfTermsButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[HUSoftwareUpdateLicenseViewController retainCopyOfTermsButton](self, "retainCopyOfTermsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 32.0, v5, 38.0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  CGFloat v27;
  void *v28;
  _QWORD v29[7];
  objc_super v30;
  CGRect v31;

  v30.receiver = self;
  v30.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  -[HUSoftwareUpdateLicenseViewController viewDidLayoutSubviews](&v30, sel_viewDidLayoutSubviews);
  -[HUSoftwareUpdateLicenseViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[HUSoftwareUpdateLicenseViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8 + 32.0;

  -[HUSoftwareUpdateLicenseViewController webViewController](self, "webViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[HUSoftwareUpdateLicenseViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v19;

  -[HUSoftwareUpdateLicenseViewController webViewController](self, "webViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v13, v15, v20, v17);

  -[HUSoftwareUpdateLicenseViewController webView](self, "webView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateLicenseViewController _evaluateHeight:](self, "_evaluateHeight:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__HUSoftwareUpdateLicenseViewController_viewDidLayoutSubviews__block_invoke;
  v29[3] = &unk_1E6F60920;
  v29[4] = self;
  *(double *)&v29[5] = v5;
  *(double *)&v29[6] = v9;
  v25 = (id)objc_msgSend(v24, "addSuccessBlock:", v29);

  -[HUSoftwareUpdateLicenseViewController webView](self, "webView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v27 = CGRectGetMaxY(v31) + 32.0;
  -[HUSoftwareUpdateLicenseViewController scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentSize:", v5, v27);

}

void __62__HUSoftwareUpdateLicenseViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  CGFloat v6;
  double v7;
  float v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "retainCopyOfTermsButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = CGRectGetMaxY(v17) + 32.0;
  v7 = *(double *)(a1 + 40);
  objc_msgSend(v4, "floatValue");
  v9 = v8;

  v10 = *(double *)(a1 + 48) + v9 + 10.0;
  objc_msgSend(*(id *)(a1 + 32), "webViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, v6, v7, v10);

  v13 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "webView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v14 = CGRectGetMaxY(v18) + 32.0;
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentSize:", v13, v14);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  -[HUSoftwareUpdateLicenseViewController viewDidLoad](&v12, sel_viewDidLoad);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateLicenseTitle"), CFSTR("HUSoftwareUpdateLicenseTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateLicenseViewController setTitle:](self, "setTitle:", v3);

  v4 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateLicenseDisagreeButtonTitle"), CFSTR("HUSoftwareUpdateLicenseDisagreeButtonTitle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 0, self, sel__disagreeToTerms_);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v8 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateLicenseAgreeButtonTitle"), CFSTR("HUSoftwareUpdateLicenseAgreeButtonTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, self, sel__agreeToTerms_);

  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateLicenseViewController setToolbarItems:](self, "setToolbarItems:", v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUSoftwareUpdateLicenseViewController;
  -[HUSoftwareUpdateLicenseViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[HUSoftwareUpdateLicenseViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", 0);

}

- (id)loadLicense
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke;
  v3[3] = &unk_1E6F4C660;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke_2;
  v6[3] = &unk_1E6F4C0D8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "evaluateJavaScript:completionHandler:", CFSTR("document.documentElement.outerHTML.toString()"), v6);

}

void __52__HUSoftwareUpdateLicenseViewController_loadLicense__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_opt_class();
  v8 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v8;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "setLicense:", v5);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "license");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v7);

}

- (void)_agreeToTerms:(id)a3
{
  void *v5;
  void *v6;
  void (**v7)(void);

  -[HUSoftwareUpdateLicenseViewController agreeHandler](self, "agreeHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateLicenseViewController.m"), 179, CFSTR("Agree handler must be set before presenting HUSoftwareUpdateLicenseViewController"));

  }
  -[HUSoftwareUpdateLicenseViewController agreeHandler](self, "agreeHandler");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();

}

- (void)_disagreeToTerms:(id)a3
{
  void *v5;
  void *v6;
  void (**v7)(void);

  -[HUSoftwareUpdateLicenseViewController disagreeHandler](self, "disagreeHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateLicenseViewController.m"), 185, CFSTR("Disagree handler must be set before presenting HUSoftwareUpdateLicenseViewController"));

  }
  -[HUSoftwareUpdateLicenseViewController disagreeHandler](self, "disagreeHandler");
  v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v7[2]();

}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  void *v6;
  id v7;

  v7 = a5;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:", v7);

  }
  else
  {
    -[HUSoftwareUpdateLicenseViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)_emailTermsAndConditions:(id)a3
{
  void *v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CC68B8]);
  -[HUSoftwareUpdateLicenseViewController license](self, "license");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessageBody:isHTML:", v4, 1);

  objc_msgSend(v5, "setMailComposeDelegate:", self);
  -[HUSoftwareUpdateLicenseViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (id)_evaluateHeight:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke;
  v8[3] = &unk_1E6F4C660;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke_2;
  v6[3] = &unk_1E6F4C610;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "evaluateJavaScript:completionHandler:", CFSTR("Math.max( document.body.scrollHeight, document.body.offsetHeight)"), v6);

}

void __57__HUSoftwareUpdateLicenseViewController__evaluateHeight___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v7;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v4, "finishWithResult:", v6);
}

- (WKWebView)webView
{
  void *v2;
  void *v3;

  -[HUSoftwareUpdateLicenseViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WKWebView *)v3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (HMHTMLDocument)document
{
  return self->_document;
}

- (id)agreeHandler
{
  return self->_agreeHandler;
}

- (void)setAgreeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (id)disagreeHandler
{
  return self->_disagreeHandler;
}

- (void)setDisagreeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIButton)retainCopyOfTermsButton
{
  return self->_retainCopyOfTermsButton;
}

- (NSString)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
  objc_storeStrong((id *)&self->_license, a3);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (HUWebViewController)webViewController
{
  return self->_webViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewController, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_retainCopyOfTermsButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong(&self->_disagreeHandler, 0);
  objc_storeStrong(&self->_agreeHandler, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
