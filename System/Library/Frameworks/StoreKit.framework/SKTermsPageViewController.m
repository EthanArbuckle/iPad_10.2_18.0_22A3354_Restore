@implementation SKTermsPageViewController

- (SKTermsPageViewController)init
{
  return -[SKTermsPageViewController initWithTerms:](self, "initWithTerms:", 0);
}

- (SKTermsPageViewController)initWithTerms:(id)a3
{
  id v4;
  SKTermsPageViewController *v5;
  SKTermsPageViewController *v6;
  uint64_t v7;
  NSString *terms;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)SKTermsPageViewController;
    v5 = -[SKTermsPageViewController init](&v10, sel_init);
    v6 = v5;
    if (v5)
    {
      -[SKTermsPageViewController _markupTermsWithHTML:](v5, "_markupTermsWithHTML:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      terms = v6->_terms;
      v6->_terms = (NSString *)v7;

    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (unint64_t)edgesForExtendedLayout
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UINavigationBar *navbar;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  double Height;
  double v23;
  UIToolbar *toolbar;
  double v25;
  double v26;
  double v27;
  NSString *terms;
  WKWebView *webview;
  void *v30;
  void *v31;
  id v32;
  double v33;
  double v34;
  double Width;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[SKTermsPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v36 = v7;
  -[UINavigationBar setFrame:](self->_navbar, "setFrame:", v5, v7, v9, v11);
  -[UINavigationBar sizeToFit](self->_navbar, "sizeToFit");
  navbar = self->_navbar;
  if (navbar)
  {
    -[UINavigationBar frame](navbar, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "statusBarFrame");
  Height = CGRectGetHeight(v38);
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = v20;
  v23 = Height + CGRectGetHeight(v39);

  -[UINavigationBar setFrame:](self->_navbar, "setFrame:", v14, v16, v18, v23);
  -[UIToolbar setFrame:](self->_toolbar, "setFrame:", v5, v36, v9, v11);
  -[UIToolbar sizeToFit](self->_toolbar, "sizeToFit");
  toolbar = self->_toolbar;
  if (toolbar)
  {
    -[UIToolbar frame](toolbar, "frame");
    toolbar = self->_toolbar;
  }
  else
  {
    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  -[UIToolbar setFrame:](toolbar, "setFrame:", v25, v11 - v27, v26);
  -[WKWebView setFrame:](self->_webview, "setFrame:", v5, v36, v9, v11);
  terms = self->_terms;
  if (terms)
  {
    webview = self->_webview;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "resourceURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[WKWebView loadHTMLString:baseURL:](webview, "loadHTMLString:baseURL:", terms, v31);

  }
  -[UINavigationBar frame](self->_navbar, "frame");
  v33 = CGRectGetHeight(v40);
  -[UIToolbar frame](self->_toolbar, "frame");
  v34 = CGRectGetHeight(v41);
  -[WKWebView scrollView](self->_webview, "scrollView");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v42.origin.x = v5;
  v42.origin.y = v36;
  v42.size.width = v9;
  v42.size.height = v11;
  Width = CGRectGetWidth(v42);
  v43.origin.x = v5;
  v43.origin.y = v36;
  v43.size.width = v9;
  v43.size.height = v11;
  objc_msgSend(v37, "setFrame:", v5, v33, Width, CGRectGetHeight(v43) - v33 - v34);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SKTermsPageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5.receiver = self;
  v5.super_class = (Class)SKTermsPageViewController;
  -[SKTermsPageViewController viewDidLoad](&v5, sel_viewDidLoad);
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)_dismissViewController
{
  -[SKTermsPageViewController _dismissViewControllerAnimated:](self, "_dismissViewControllerAnimated:", 1);
}

- (void)_buttonAccept:(id)a3
{
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
  _QWORD v18[5];

  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_1E5B2D460, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AGREE_TEXT"), &stru_1E5B2D460, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5B2D460, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13);

  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_1E5B2D460, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __43__SKTermsPageViewController__buttonAccept___block_invoke;
  v18[3] = &unk_1E5B26D60;
  v18[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v17);

  -[SKTermsPageViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __43__SKTermsPageViewController__buttonAccept___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewControllerAnimated:withAcceptance:", 1, 1);
}

- (void)_buttonDecline:(id)a3
{
  -[SKTermsPageViewController _dismissViewControllerAnimated:withAcceptance:](self, "_dismissViewControllerAnimated:withAcceptance:", 1, 0);
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__SKTermsPageViewController__dismissViewControllerAnimated___block_invoke;
  v3[3] = &unk_1E5B267D8;
  v3[4] = self;
  -[SKTermsPageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, v3);
}

void __60__SKTermsPageViewController__dismissViewControllerAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1000));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1000));
    objc_msgSend(v4, "termsPageViewControllerDidFinish:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_dismissViewControllerAnimated:(BOOL)a3 withAcceptance:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__SKTermsPageViewController__dismissViewControllerAnimated_withAcceptance___block_invoke;
  v4[3] = &unk_1E5B26D88;
  v4[4] = self;
  v5 = a4;
  -[SKTermsPageViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, v4);
}

void __75__SKTermsPageViewController__dismissViewControllerAnimated_withAcceptance___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1000));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1000));
    objc_msgSend(v4, "termsPageViewControllerDidFinish:withAcceptance:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_loadSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  WKWebView *v10;
  WKWebView *webview;
  WKWebView *v12;
  void *v13;
  void *v14;
  UINavigationBar *v15;
  UINavigationBar *navbar;
  id v17;
  void *v18;
  void *v19;
  UIToolbar *v20;
  UIToolbar *toolbar;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIToolbar *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  v34 = objc_alloc_init(MEMORY[0x1E0CEF638]);
  objc_msgSend(v34, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextInteractionEnabled:", 0);

  v10 = (WKWebView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF630]), "initWithFrame:configuration:", v34, v4, v5, v6, v7);
  webview = self->_webview;
  self->_webview = v10;

  -[WKWebView setNavigationDelegate:](self->_webview, "setNavigationDelegate:", self);
  -[WKWebView setAllowsLinkPreview:](self->_webview, "setAllowsLinkPreview:", 0);
  -[WKWebView setOpaque:](self->_webview, "setOpaque:", 0);
  v12 = self->_webview;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKWebView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[WKWebView scrollView](self->_webview, "scrollView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setShowsBackgroundShadow:", 0);

  objc_msgSend(v8, "addSubview:", self->_webview);
  v15 = (UINavigationBar *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A28]), "initWithFrame:", v4, v5, v6, v7);
  navbar = self->_navbar;
  self->_navbar = v15;

  v17 = objc_alloc(MEMORY[0x1E0DC3A48]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_1E5B2D460, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v17, "initWithTitle:", v19);

  -[UINavigationBar pushNavigationItem:animated:](self->_navbar, "pushNavigationItem:animated:", v33, 0);
  objc_msgSend(v8, "addSubview:", self->_navbar);
  -[UINavigationBar setDelegate:](self->_navbar, "setDelegate:", self);
  v20 = (UIToolbar *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E68]), "initWithFrame:", v4, v5, v6, v7);
  toolbar = self->_toolbar;
  self->_toolbar = v20;

  v22 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_1E5B2D460, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "initWithTitle:style:target:action:", v24, 2, self, sel__buttonAccept_);

  v26 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DISAGREE"), &stru_1E5B2D460, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "initWithTitle:style:target:action:", v28, 0, self, sel__buttonDecline_);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v31 = self->_toolbar;
  v35[0] = v29;
  v35[1] = v30;
  v35[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIToolbar setItems:](v31, "setItems:", v32);

  -[UIToolbar setTranslucent:](self->_toolbar, "setTranslucent:", 1);
  objc_msgSend(v8, "addSubview:", self->_toolbar);
  -[SKTermsPageViewController setView:](self, "setView:", v8);

}

- (id)_markupTermsWithHTML:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a3;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<style type=\"text/css\"> p.p1 {background-color: transparent; color:#4C566C;text-shadow: white 0px 1px 1px; font-family: Helvetica; font-size: 9pt; } </style>"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<html><head>%@</head><body><p class=\"p1\">%@</p></body></html>"), v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("<br/>"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void (**v6)(id, BOOL);

  v6 = (void (**)(id, BOOL))a5;
  v6[2](v6, objc_msgSend(a4, "navigationType") != 0);

}

- (SKTermsPageViewControllerDelegate)delegate
{
  return (SKTermsPageViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webview, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_terms, 0);
  objc_storeStrong((id *)&self->_navbar, 0);
}

@end
