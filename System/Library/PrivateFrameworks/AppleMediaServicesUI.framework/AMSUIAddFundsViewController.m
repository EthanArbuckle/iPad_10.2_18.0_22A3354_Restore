@implementation AMSUIAddFundsViewController

- (AMSUIAddFundsViewController)initWithAccount:(id)a3 bag:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  AMSUIAddFundsViewController *v10;

  v6 = (void *)MEMORY[0x24BE08328];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "currentProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSUIAddFundsViewController initWithAccount:bag:clientInfo:](self, "initWithAccount:bag:clientInfo:", v8, v7, v9);

  return v10;
}

- (AMSUIAddFundsViewController)initWithAccount:(id)a3 bag:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSUIAddFundsViewController *v11;
  AMSUIWebViewController *v12;
  AMSUIWebViewController *webViewController;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIAddFundsViewController;
  v11 = -[AMSUICommonViewController init](&v15, sel_init);
  if (v11)
  {
    v12 = -[AMSUIWebViewController initWithBag:account:clientInfo:]([AMSUIWebViewController alloc], "initWithBag:account:clientInfo:", v9, v8, v10);
    webViewController = v11->_webViewController;
    v11->_webViewController = v12;

  }
  return v11;
}

- (ACAccount)account
{
  void *v2;
  void *v3;

  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  void *v2;
  void *v3;

  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  void *v2;
  void *v3;

  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)metricsOverlay
{
  void *v2;
  void *v3;

  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsOverlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setAccount:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccount:", v4);

}

- (void)setBag:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBag:", v4);

}

- (void)setClientInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientInfo:", v4);

}

- (void)setMetricsOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetricsOverlay:", v4);

}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIAddFundsViewController;
  -[AMSUICommonViewController loadView](&v4, sel_loadView);
  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController setChildViewController:](self, "setChildViewController:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSUIAddFundsViewController;
  -[AMSUIAddFundsViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIAddFundsViewController bag](self, "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForKey:", CFSTR("AddFundsUrl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "loadBagValue:", v6);

}

- (void)viewWillLayoutSubviews
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
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUIAddFundsViewController;
  -[AMSUIAddFundsViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIAddFundsViewController webViewController](self, "webViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

+ (id)bagKeySet
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(v2, "addBagKey:valueType:", CFSTR("AddFundsUrl"), 5);
  +[AMSUIWebViewController bagKeySet](AMSUIWebViewController, "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v3);

  return v2;
}

+ (id)bagSubProfile
{
  return CFSTR("AMSUIAddFundsProfile");
}

+ (id)bagSubProfileVersion
{
  return CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BE08060];
  objc_msgSend(a1, "bagKeySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bagSubProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bagSubProfileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerBagKeySet:forProfile:profileVersion:", v4, v5, v6);

  v7 = (void *)MEMORY[0x24BE08050];
  objc_msgSend(a1, "bagSubProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bagSubProfileVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bagForProfile:profileVersion:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AMSUIWebViewController)webViewController
{
  return self->_webViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewController, 0);
}

@end
