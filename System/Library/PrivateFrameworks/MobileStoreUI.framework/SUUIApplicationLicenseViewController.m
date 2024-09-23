@implementation SUUIApplicationLicenseViewController

- (SUUIApplicationLicenseViewController)initWithLicenseAgreementPage:(id)a3
{
  id v4;
  SUUIApplicationLicenseViewController *v5;
  uint64_t v6;
  SUUIApplicationLicensePage *licensePage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIApplicationLicenseViewController;
  v5 = -[SUUIApplicationLicenseViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    licensePage = v5->_licensePage;
    v5->_licensePage = (SUUIApplicationLicensePage *)v6;

  }
  return v5;
}

- (SUUIApplicationLicenseViewController)initWithLicenseAgreementURL:(id)a3
{
  id v4;
  SUUIApplicationLicenseViewController *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIApplicationLicenseViewController;
  v5 = -[SUUIApplicationLicenseViewController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (void)reloadData
{
  SSVLoadURLOperation *v3;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v5;
  void *v6;
  SSVLoadURLOperation *v7;
  void *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id location;

  if (!self->_licensePage && !self->_loadOperation)
  {
    if (self->_url)
    {
      v3 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2040]), "initWithURL:", self->_url);
      loadOperation = self->_loadOperation;
      self->_loadOperation = v3;

      v5 = self->_loadOperation;
      +[SSVURLDataConsumer consumer](SUUIApplicationLicenseDataConsumer, "consumer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setDataConsumer:](v5, "setDataConsumer:", v6);

      v7 = self->_loadOperation;
      -[SUUIViewController clientContext](self, "clientContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForConfigurationKey:", CFSTR("sfsuffix"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setStoreFrontSuffix:](v7, "setStoreFrontSuffix:", v9);

      objc_initWeak(&location, self);
      v10 = self->_loadOperation;
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __50__SUUIApplicationLicenseViewController_reloadData__block_invoke;
      v15 = &unk_2511F5748;
      objc_copyWeak(&v16, &location);
      -[SSVLoadURLOperation setOutputBlock:](v10, "setOutputBlock:", &v12);
      -[SUUIViewController operationQueue](self, "operationQueue", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addOperation:", self->_loadOperation);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

void __50__SUUIApplicationLicenseViewController_reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUUIApplicationLicenseViewController_reloadData__block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __50__SUUIApplicationLicenseViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_displayPage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)loadView
{
  UIWebView *webView;
  UIWebView *v4;
  UIWebView *v5;
  UIWebView *v6;
  void *v7;
  void *v8;
  void *v9;
  SUUIApplicationLicensePage *licensePage;
  void *v11;

  webView = self->_webView;
  if (!webView)
  {
    v4 = (UIWebView *)objc_alloc_init(MEMORY[0x24BEBDB50]);
    v5 = self->_webView;
    self->_webView = v4;

    v6 = self->_webView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIWebView scrollView](self->_webView, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    licensePage = self->_licensePage;
    webView = self->_webView;
    if (licensePage)
    {
      -[SUUIApplicationLicensePage licenseAgreementHTML](licensePage, "licenseAgreementHTML");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v11, 0);

      webView = self->_webView;
    }
  }
  -[SUUIApplicationLicenseViewController setView:](self, "setView:", webView);
  -[SUUIViewController showDefaultNavigationItems](self, "showDefaultNavigationItems");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUUIApplicationLicenseViewController reloadData](self, "reloadData");
  v5.receiver = self;
  v5.super_class = (Class)SUUIApplicationLicenseViewController;
  -[SUUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)_displayPage:(id)a3 error:(id)a4
{
  id v7;
  SSVLoadURLOperation *loadOperation;
  SUUIApplicationLicensePage **p_licensePage;
  UIWebView *webView;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  if (v7)
  {
    -[SUUIViewController showError:](self, "showError:", v7);
  }
  else
  {
    p_licensePage = &self->_licensePage;
    objc_storeStrong((id *)&self->_licensePage, a3);
    webView = self->_webView;
    if (webView)
    {
      -[SUUIApplicationLicensePage licenseAgreementHTML](*p_licensePage, "licenseAgreementHTML");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWebView loadHTMLString:baseURL:](webView, "loadHTMLString:baseURL:", v11, 0);

    }
    -[SUUIApplicationLicensePage title](*p_licensePage, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIApplicationLicenseViewController setTitle:](self, "setTitle:", v12);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_licensePage, 0);
}

@end
