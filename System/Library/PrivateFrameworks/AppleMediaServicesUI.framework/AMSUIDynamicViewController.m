@implementation AMSUIDynamicViewController

- (AMSUIDynamicViewController)initWithBag:(id)a3 bagValue:(id)a4
{
  id v6;
  id v7;
  AMSUIDynamicViewController *v8;
  uint64_t v9;
  AMSUIDynamicViewController *dynamicViewController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIDynamicViewController;
  v8 = -[AMSUICommonViewController init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)getAMSUIDDynamicViewControllerClass()), "initWithBag:bagValue:", v6, v7);
    dynamicViewController = v8->_dynamicViewController;
    v8->_dynamicViewController = (AMSUIDynamicViewController *)v9;

    -[AMSUIDynamicViewController _setup](v8, "_setup");
  }

  return v8;
}

- (AMSUIDynamicViewController)initWithBag:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  AMSUIDynamicViewController *v8;
  uint64_t v9;
  AMSUIDynamicViewController *dynamicViewController;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIDynamicViewController;
  v8 = -[AMSUICommonViewController init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)getAMSUIDDynamicViewControllerClass()), "initWithBag:URL:", v6, v7);
    dynamicViewController = v8->_dynamicViewController;
    v8->_dynamicViewController = (AMSUIDynamicViewController *)v9;

    -[AMSUIDynamicViewController _setup](v8, "_setup");
  }

  return v8;
}

- (ACAccount)account
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (BOOL)anonymousMetrics
{
  void *v2;
  char v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "anonymousMetrics");

  return v3;
}

- (AMSBagProtocol)bag
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSBagProtocol *)v3;
}

- (AMSProcessInfo)clientInfo
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSProcessInfo *)v3;
}

- (NSDictionary)clientOptions
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (AMSUIDynamicViewControllerDelegate)delegate
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController delegateProxy](self, "delegateProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSUIDynamicViewControllerDelegate *)v3;
}

- (NSDictionary)internalClientOptions
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "internalClientOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)mediaClientIdentifier
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaClientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)metricsOverlay
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
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
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccount:", v4);

}

- (void)setAnonymousMetrics:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnonymousMetrics:", v3);

}

- (void)setBag:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBag:", v4);

}

- (void)setClientInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientInfo:", v4);

}

- (void)setClientOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientOptions:", v4);

}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController delegateProxy](self, "delegateProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)setInternalClientOptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalClientOptions:", v4);

}

- (void)setMediaClientIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaClientIdentifier:", v4);

}

- (void)setMediaContentDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaContentDelegate:", v4);

}

- (void)setMetricsOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetricsOverlay:", v4);

}

- (id)preload
{
  void *v2;
  void *v3;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)reloadContentViewImpressionItems
{
  id v2;

  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadContentViewImpressionItems");

}

- (void)_setup
{
  AMSUIDynamicViewControllerDelegateProxy *v3;
  AMSUIDynamicViewControllerDelegateProxy *delegateProxy;

  v3 = -[AMSUIDynamicViewControllerDelegateProxy initWithDynamicViewController:]([AMSUIDynamicViewControllerDelegateProxy alloc], "initWithDynamicViewController:", self);
  delegateProxy = self->_delegateProxy;
  self->_delegateProxy = v3;

  -[AMSUIDynamicViewController setDelegate:](self->_dynamicViewController, "setDelegate:", self->_delegateProxy);
}

- (BOOL)isBeingDismissed
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isBeingDismissed");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    return -[AMSUIDynamicViewController isBeingDismissed](&v7, sel_isBeingDismissed);
  }
}

- (BOOL)isMovingFromParentViewController
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMovingFromParentViewController");

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    return -[AMSUIDynamicViewController isMovingFromParentViewController](&v7, sel_isMovingFromParentViewController);
  }
}

- (id)navigationItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v8;
  void *v9;
  objc_super v10;

  -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[AMSUIDynamicViewController parentViewController](self, "parentViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        v4,
        (isKindOfClass & 1) == 0))
  {
    -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AMSUIDynamicViewController;
    -[AMSUIDynamicViewController navigationItem](&v10, sel_navigationItem);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    -[AMSUIDynamicViewController title](&v7, sel_title);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSUIDynamicViewController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v4);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AMSUIDynamicViewController;
    -[AMSUIDynamicViewController setTitle:](&v7, sel_setTitle_, v4);
  }

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIDynamicViewController;
  -[AMSUIDynamicViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUICommonViewController setChildViewController:](self, "setChildViewController:", v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIDynamicViewController;
  -[AMSUIDynamicViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
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
  v14.super_class = (Class)AMSUIDynamicViewController;
  -[AMSUIDynamicViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  -[AMSUICommonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUIDynamicViewController dynamicViewController](self, "dynamicViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

}

+ (AMSBagKeySet)bagKeySet
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BE08298]);
  objc_msgSend(MEMORY[0x24BE08238], "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v3);

  objc_msgSend(MEMORY[0x24BE08358], "bagKeySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionBagKeySet:", v4);

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)CFSTR("AMSUIDynamic");
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)CFSTR("1");
}

+ (id)createBagForSubProfile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BE08060];
  objc_msgSend((id)objc_opt_class(), "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerBagKeySet:forProfile:profileVersion:", v3, v4, v5);

  v6 = (void *)MEMORY[0x24BE08050];
  objc_msgSend((id)objc_opt_class(), "bagSubProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bagSubProfileVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bagForProfile:profileVersion:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AMSUIMediaContentDelegate)mediaContentDelegate
{
  return (AMSUIMediaContentDelegate *)objc_loadWeakRetained((id *)&self->_mediaContentDelegate);
}

- (AMSUIDynamicViewControllerDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (AMSUIDynamicViewController)dynamicViewController
{
  return self->_dynamicViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewController, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_destroyWeak((id *)&self->_mediaContentDelegate);
}

@end
