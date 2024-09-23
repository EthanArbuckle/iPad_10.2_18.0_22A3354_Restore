@implementation WFWebViewController

- (WFWebViewController)initWithWebView:(id)a3
{
  id v4;
  WFWebViewController *v5;
  WFWebViewController *v6;
  void *v7;

  v4 = a3;
  v5 = -[WFWebViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    -[WFWebViewController setWebView:](v5, "setWebView:", v4);
    -[WFWebViewController webView](v6, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNavigationDelegate:", v6);

  }
  return v6;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v6 = a5;
  if (objc_msgSend(a4, "_wk_shouldAskAboutInsecureFormSubmission"))
  {
    objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("This is a non-secure form."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v8);

    WFLocalizedString(CFSTR("This form will be sent in a way that is not secure. Are you sure you want to send it?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMessage:", v9);

    objc_msgSend(MEMORY[0x24BEC14E0], "imageNamed:inBundle:", CFSTR("Privacy"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIcon:", v10);

    v11 = (void *)MEMORY[0x24BE19378];
    WFLocalizedString(CFSTR("Submit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v24[3] = &unk_24E343510;
    v14 = v6;
    v25 = v14;
    objc_msgSend(v11, "buttonWithTitle:style:handler:", v12, 0, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addButton:", v15);

    v16 = (void *)MEMORY[0x24BE19378];
    v19 = v13;
    v20 = 3221225472;
    v21 = __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
    v22 = &unk_24E343510;
    v23 = v14;
    objc_msgSend(v16, "cancelButtonWithHandler:", &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addButton:", v17, v19, v20, v21, v22);

    WFUserInterfaceFromViewController();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentAlert:", v7);

  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

- (WFWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  WFWebViewController *v4;
  WFWebViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWebViewController;
  v4 = -[WFWebViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFWebViewController updateNavigationItems](v4, "updateNavigationItems");
    -[WFWebViewController addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", v5, CFSTR("webView.title"), 0, WFWebViewControllerTitleContext);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[WFWebViewController removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("webView.title"), WFWebViewControllerTitleContext);
  v3.receiver = self;
  v3.super_class = (Class)WFWebViewController;
  -[WFWebViewController dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[WFWebViewController updateNavigationItems](self, "updateNavigationItems");
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFWebViewController;
  -[WFWebViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, a3);
  -[WFWebViewController updateNavigationItems](self, "updateNavigationItems");
}

- (void)updateNavigationItems
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[WFWebViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", self);

  if (!v6)
  {
    -[WFWebViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeftBarButtonItem:", 0);

    -[WFWebViewController navigationItem](self, "navigationItem");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItem:", 0);
    goto LABEL_7;
  }
  -[WFWebViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    -[WFWebViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  }
  -[WFWebViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done);
    -[WFWebViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRightBarButtonItem:", v13);

    -[WFWebViewController navigationItem](self, "navigationItem");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rightBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStyle:", 2);

LABEL_7:
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;
  objc_super v9;

  if ((void *)WFWebViewControllerTitleContext == a6)
  {
    -[WFWebViewController webView](self, "webView", a3, a4, a5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWebViewController setTitle:](self, "setTitle:", v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFWebViewController;
    -[WFWebViewController observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)loadView
{
  void *v3;
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
  objc_super v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)WFWebViewController;
  -[WFWebViewController loadView](&v27, sel_loadView);
  -[WFWebViewController webView](self, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFWebViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  v26 = (void *)objc_opt_new();
  objc_msgSend(v26, "configureWithOpaqueBackground");
  -[WFWebViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEdgeAppearance:", v26);

  v17 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v3, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeAreaLayoutGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v21;
  objc_msgSend(v3, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  objc_msgSend(v3, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  objc_msgSend(v3, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWebViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v15);

}

- (void)cancel
{
  void *v3;
  char v4;
  id v5;

  -[WFWebViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFWebViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webViewControllerDidCancel:", self);

  }
}

- (void)done
{
  void *v3;
  char v4;
  id v5;

  -[WFWebViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFWebViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "webViewControllerDidFinish:", self);

  }
}

- (WFWebViewControllerDelegate)delegate
{
  return (WFWebViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
