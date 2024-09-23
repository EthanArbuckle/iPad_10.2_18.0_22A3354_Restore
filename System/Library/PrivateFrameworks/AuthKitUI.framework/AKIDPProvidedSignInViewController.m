@implementation AKIDPProvidedSignInViewController

- (AKIDPProvidedSignInViewController)initWithIDPHandler:(id)a3
{
  id v5;
  AKIDPProvidedSignInViewController *v6;
  AKIDPProvidedSignInViewController *v7;
  uint64_t v8;
  WKWebView *webView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKIDPProvidedSignInViewController;
  v6 = -[AKIDPProvidedSignInViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idpHandler, a3);
    -[AKIDPHandler setDelegate:](v7->_idpHandler, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0CEF630], "ak_idpWebViewWithFrame:idpHandler:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = objc_claimAutoreleasedReturnValue();
    webView = v7->_webView;
    v7->_webView = (WKWebView *)v8;

  }
  return v7;
}

- (void)loadView
{
  id v3;

  -[AKIDPProvidedSignInViewController webView](self, "webView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKIDPProvidedSignInViewController;
  -[AKIDPProvidedSignInViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AKIDPProvidedSignInViewController setupTitleView](self, "setupTitleView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKIDPProvidedSignInViewController;
  -[AKIDPProvidedSignInViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[AKIDPProvidedSignInViewController idpHandler](self, "idpHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController _setNavigationTitle:](self, "_setNavigationTitle:", v8);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKIDPProvidedSignInViewController;
  -[AKIDPProvidedSignInViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[AKIDPProvidedSignInViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  -[AKIDPProvidedSignInViewController webView](self, "webView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController idpHandler](self, "idpHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "loadRequest:", v7);

}

- (void)_cancelBarButtonPressed:(id)a3
{
  id v3;

  -[AKIDPProvidedSignInViewController idpHandler](self, "idpHandler", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void)setupTitleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[AKIDPProvidedSignInViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundImage:forBarMetrics:", 0, 0);

  }
  -[AKIDPProvidedSignInViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setHidesShadow:", 0);

  v9 = objc_alloc(MEMORY[0x1E0CEA658]);
  v10 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("LockIcon"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithImage:", v12);
  -[AKIDPProvidedSignInViewController setSecureIconView:](self, "setSecureIconView:", v13);

  -[AKIDPProvidedSignInViewController secureIconView](self, "secureIconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentMode:", 4);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController secureIconView](self, "secureIconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTintColor:", v15);

  -[AKIDPProvidedSignInViewController secureIconView](self, "secureIconView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  -[AKIDPProvidedSignInViewController secureIconView](self, "secureIconView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 0.0);

  v19 = objc_alloc(MEMORY[0x1E0CEA700]);
  v20 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AKIDPProvidedSignInViewController setTitleLabel:](self, "setTitleLabel:", v20);

  -[AKIDPProvidedSignInViewController webView](self, "webView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0CEB570], *MEMORY[0x1E0CEB420]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFont:", v24);

  v26 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  -[AKIDPProvidedSignInViewController secureIconView](self, "secureIconView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v27;
  -[AKIDPProvidedSignInViewController titleLabel](self, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v26, "initWithArrangedSubviews:", v29);
  -[AKIDPProvidedSignInViewController setTitleStackView:](self, "setTitleStackView:", v30);

  -[AKIDPProvidedSignInViewController titleStackView](self, "titleStackView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setSpacing:", 6.0);

  -[AKIDPProvidedSignInViewController titleStackView](self, "titleStackView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController navigationItem](self, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTitleView:", v32);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelBarButtonPressed_);
  -[AKIDPProvidedSignInViewController navigationItem](self, "navigationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setLeftBarButtonItem:", v34);

}

- (void)_setNavigationTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CEA508];
  v5 = a3;
  objc_msgSend(v4, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[AKIDPProvidedSignInViewController titleLabel](self, "titleLabel");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v5);
  }
  else
  {
    -[AKIDPProvidedSignInViewController navigationItem](self, "navigationItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrompt:", v5);
  }

}

- (void)IDPHandler:(id)a3 didFinishLoadingPageInWebView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  char v11;

  v5 = a4;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  LODWORD(v6) = objc_msgSend(v5, "hasOnlySecureContent");
  v8 = v6 ^ 1;
  -[AKIDPProvidedSignInViewController secureIconView](self, "secureIconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__AKIDPProvidedSignInViewController_IDPHandler_didFinishLoadingPageInWebView___block_invoke;
  v10[3] = &unk_1E7678B30;
  v10[4] = self;
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v10, 0.3);
}

void __78__AKIDPProvidedSignInViewController_IDPHandler_didFinishLoadingPageInWebView___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  else
    v1 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "secureIconView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)IDPHandler:(id)a3 didStartLoadingPageInWebView:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "URL", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKIDPProvidedSignInViewController _setNavigationTitle:](self, "_setNavigationTitle:", v5);

}

- (WKWebView)webView
{
  return self->_webView;
}

- (AKIDPHandler)idpHandler
{
  return self->_idpHandler;
}

- (void)setIdpHandler:(id)a3
{
  objc_storeStrong((id *)&self->_idpHandler, a3);
}

- (UIImageView)secureIconView
{
  return self->_secureIconView;
}

- (void)setSecureIconView:(id)a3
{
  objc_storeStrong((id *)&self->_secureIconView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
  objc_storeStrong((id *)&self->_titleStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_secureIconView, 0);
  objc_storeStrong((id *)&self->_idpHandler, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
