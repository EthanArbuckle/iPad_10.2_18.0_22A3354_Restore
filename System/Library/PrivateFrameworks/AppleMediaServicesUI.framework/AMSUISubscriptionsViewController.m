@implementation AMSUISubscriptionsViewController

- (AMSUISubscriptionsViewController)initWithAccount:(id)a3 bag:(id)a4
{
  return -[AMSUISubscriptionsViewController initWithAccount:bag:clientInfo:](self, "initWithAccount:bag:clientInfo:", a3, a4, 0);
}

- (AMSUISubscriptionsViewController)initWithAccount:(id)a3 bag:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSUISubscriptionsViewController *v11;
  AMSUIWebViewController *v12;
  AMSUIWebViewController *webViewController;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSUISubscriptionsViewController;
  v11 = -[AMSUISubscriptionsViewController init](&v15, sel_init);
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

  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (AMSBagProtocol)bag
{
  void *v2;
  void *v3;

  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  void *v2;
  void *v3;

  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)metricsOverlay
{
  void *v2;
  void *v3;

  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
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
  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccount:", v4);

}

- (void)setBag:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBag:", v4);

}

- (void)setClientInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientInfo:", v4);

}

- (void)setMetricsOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetricsOverlay:", v4);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUISubscriptionsViewController;
  -[AMSUISubscriptionsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[AMSUISubscriptionsViewController _setup](self, "_setup");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUISubscriptionsViewController;
  -[AMSUISubscriptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AMSUISubscriptionsViewController _startLoading](self, "_startLoading");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUISubscriptionsViewController;
  -[AMSUISubscriptionsViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[AMSUISubscriptionsViewController _setupLayout](self, "_setupLayout");
}

+ (AMSBagKeySet)bagKeySet
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(v2, "addBagKey:valueType:", CFSTR("manageSubscriptionsDynamicUIUrl"), 5);
  +[AMSUIDynamicViewController bagKeySet](AMSUIDynamicViewController, "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v3);

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSUIManageSubscriptions");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
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

- (void)_setupChildViewController
{
  id v3;

  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUISubscriptionsViewController _setChildViewController:](self, "_setChildViewController:", v3);

}

- (void)_setChildViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AMSUISubscriptionsViewController addChildViewController:](self, "addChildViewController:", v6);
  -[AMSUISubscriptionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(v6, "ams_didMoveToParentViewController:", self);
}

- (void)_setupLayout
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
  void *v12;
  id v13;

  -[AMSUISubscriptionsViewController view](self, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AMSUISubscriptionsViewController webViewController](self, "webViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (void)_startLoading
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[AMSUISubscriptionsViewController bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForKey:", CFSTR("manageSubscriptionsV2Url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __49__AMSUISubscriptionsViewController__startLoading__block_invoke;
  v11 = &unk_24CB508D8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "transformWithBlock:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUISubscriptionsViewController webViewController](self, "webViewController", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "loadBagValue:", v5);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __49__AMSUISubscriptionsViewController__startLoading__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(v3, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(WeakRetained, "subscriptionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1838];
    objc_msgSend(WeakRetained, "subscriptionType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryItemWithName:value:", CFSTR("subscriptionType"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  objc_msgSend(v7, "URL");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v3;
  v17 = v16;

  objc_msgSend(MEMORY[0x24BE08340], "promiseWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)subscriptionType
{
  return self->_subscriptionType;
}

- (void)setSubscriptionType:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionType, a3);
}

- (AMSUIWebViewController)webViewController
{
  return self->_webViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewController, 0);
  objc_storeStrong((id *)&self->_subscriptionType, 0);
}

@end
