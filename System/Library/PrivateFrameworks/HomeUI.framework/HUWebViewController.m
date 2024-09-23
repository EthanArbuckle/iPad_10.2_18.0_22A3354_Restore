@implementation HUWebViewController

- (HUWebViewController)initWithURL:(id)a3
{
  id v5;
  HUWebViewController *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUWebViewController.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v6 = -[HUWebViewController _initWithDocument:orMaybeAURL:](self, "_initWithDocument:orMaybeAURL:", 0, v5);

  return v6;
}

- (HUWebViewController)initWithDocument:(id)a3
{
  id v5;
  HUWebViewController *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUWebViewController.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("document"));

  }
  v6 = -[HUWebViewController _initWithDocument:orMaybeAURL:](self, "_initWithDocument:orMaybeAURL:", v5, 0);

  return v6;
}

- (id)_initWithDocument:(id)a3 orMaybeAURL:(id)a4
{
  id v6;
  id v7;
  HUWebViewController *v8;
  id v9;
  uint64_t v10;
  WKWebView *webView;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUWebViewController;
  v8 = -[HUWebViewController init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CEF638]);
    objc_msgSend(v9, "setDataDetectorTypes:", 0);
    v10 = objc_opt_new();
    webView = v8->_webView;
    v8->_webView = (WKWebView *)v10;

    -[WKWebView setTranslatesAutoresizingMaskIntoConstraints:](v8->_webView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WKWebView setNavigationDelegate:](v8->_webView, "setNavigationDelegate:", v8);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKWebView setBackgroundColor:](v8->_webView, "setBackgroundColor:", v12);

    -[HUWebViewController _startLoadWithDocument:orMaybeAURL:](v8, "_startLoadWithDocument:orMaybeAURL:", v6, v7);
  }

  return v8;
}

- (void)_startLoadWithDocument:(id)a3 orMaybeAURL:(id)a4
{
  id v7;
  id v8;
  NAFuture *v9;
  NAFuture *loadingFuture;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSURL *v15;
  NSURL *URL;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v7 = a3;
  v8 = a4;
  if (!self->_loadingFuture)
  {
    v9 = (NAFuture *)objc_opt_new();
    loadingFuture = self->_loadingFuture;
    self->_loadingFuture = v9;

    if (v7)
    {
      objc_storeStrong((id *)&self->_document, a3);
      -[HUWebViewController webView](self, "webView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUWebViewController document](self, "document");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v11, "loadHTMLString:baseURL:", v13, 0);

    }
    else
    {
      if (!v8)
      {
LABEL_7:
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __58__HUWebViewController__startLoadWithDocument_orMaybeAURL___block_invoke;
        v20[3] = &unk_1E6F4DD08;
        objc_copyWeak(&v21, &location);
        v19 = (id)objc_msgSend(v18, "afterDelay:performBlock:", v20, 3.0);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      v15 = (NSURL *)objc_msgSend(v8, "copy");
      URL = self->_URL;
      self->_URL = v15;

      -[HUWebViewController webView](self, "webView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v11, "loadRequest:", v12);
    }

    goto LABEL_7;
  }
LABEL_8:

}

void __58__HUWebViewController__startLoadWithDocument_orMaybeAURL___block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "loadingFuture");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isFinished");

  if ((v2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_safeSetObject:forKey:", v4, CFSTR("document"));

    objc_msgSend(WeakRetained, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_safeSetObject:forKey:", v5, CFSTR("URL"));

    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:operation:options:", 26, CFSTR("Loading software update license"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logError:operationDescription:", v6, 0);

    objc_msgSend(WeakRetained, "loadingFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v6);

  }
}

- (void)loadView
{
  id v3;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[HUWebViewController setView:](self, "setView:", v3);

  -[HUWebViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWebViewController webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v20 = (void *)MEMORY[0x1E0CB3718];
  -[HUWebViewController webView](self, "webView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWebViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "safeAreaLayoutGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  -[HUWebViewController webView](self, "webView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWebViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "safeAreaLayoutGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v18;
  -[HUWebViewController webView](self, "webView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWebViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v9;
  -[HUWebViewController webView](self, "webView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUWebViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v15);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUWebViewController;
  -[HUWebViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[HUWebViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  if (-[HUWebViewController _shouldShare](self, "_shouldShare"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__share_);
    -[HUWebViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRightBarButtonItem:", v8);

  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_scrollEnabled = a3;
  -[HUWebViewController webView](self, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (void)setZoomEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_zoomEnabled = a3;
  -[HUWebViewController webView](self, "webView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZoomEnabled:", v3);

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a4;
  v6 = (void (**)(id, uint64_t))a5;
  if (objc_msgSend(v12, "navigationType"))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "request");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v8, "openURL:", v10);

    v7 = 0;
  }
  v6[2](v6, v7);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[HUWebViewController loadingFuture](self, "loadingFuture");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithError:", v6);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  float v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "defaultFontSize");
  v10 = v9;
  v11 = (void *)objc_opt_new();
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  if (v8 == v10)
  {
    objc_msgSend(v11, "finishWithNoResult");
  }
  else
  {
    v14 = v8 / v10 * 100.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='%f%%';"),
      floorf(v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __51__HUWebViewController_webView_didFinishNavigation___block_invoke;
    v18[3] = &unk_1E6F4C610;
    v19 = v12;
    objc_msgSend(v5, "evaluateJavaScript:completionHandler:", v15, v18);

  }
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __51__HUWebViewController_webView_didFinishNavigation___block_invoke_2;
  v17[3] = &unk_1E6F502A0;
  v17[4] = self;
  v16 = (id)objc_msgSend(v12, "addSuccessBlock:", v17);

}

uint64_t __51__HUWebViewController_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

void __51__HUWebViewController_webView_didFinishNavigation___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "loadingFuture");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithNoResult");

}

- (BOOL)_shouldShare
{
  BOOL v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0)
    return 0;
  -[HUWebViewController document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v3 = -[HUWebViewController showsShareButton](self, "showsShareButton");
  else
    v3 = 0;

  return v3;
}

- (void)_share:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[7];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (-[HUWebViewController _shouldShare](self, "_shouldShare", a3))
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA2D8]);
    -[HUWebViewController document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithActivityItems:applicationActivities:", v7, 0);

    objc_msgSend(v8, "setExcludedActivityCategories:", 1);
    v9 = *MEMORY[0x1E0CEB1E8];
    v15[0] = *MEMORY[0x1E0CEB1B8];
    v15[1] = v9;
    v10 = *MEMORY[0x1E0CEB228];
    v15[2] = *MEMORY[0x1E0CEB1A8];
    v15[3] = v10;
    v15[4] = *MEMORY[0x1E0CEB220];
    v15[5] = CFSTR("com.apple.mobilenotes.SharingExtension");
    v15[6] = CFSTR("com.apple.reminders.RemindersEditorExtension");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExcludedActivityTypes:", v11);

    -[HUWebViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rightBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "popoverPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBarButtonItem:", v13);

    -[HUWebViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (HMHTMLDocument)document
{
  return self->_document;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (BOOL)showsShareButton
{
  return self->_showsShareButton;
}

- (void)setShowsShareButton:(BOOL)a3
{
  self->_showsShareButton = a3;
}

- (BOOL)zoomEnabled
{
  return self->_zoomEnabled;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (NAFuture)loadingFuture
{
  return self->_loadingFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingFuture, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
