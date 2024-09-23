@implementation ServiceBridgedNavigationItem

+ (id)itemFromItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class(a1));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backButtonTitle"));
    objc_msgSend(v5, "setBackButtonTitle:", v6);

    objc_msgSend(v5, "setHidesBackButton:", objc_msgSend(v4, "hidesBackButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftBarButtonItems"));
    objc_msgSend(v5, "setLeftBarButtonItems:", v7);

    objc_msgSend(v5, "setLeftItemsSupplementBackButton:", objc_msgSend(v4, "leftItemsSupplementBackButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "prompt"));
    objc_msgSend(v5, "setPrompt:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightBarButtonItems"));
    objc_msgSend(v5, "setRightBarButtonItems:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    objc_msgSend(v5, "setTitle:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleView"));
    objc_msgSend(v5, "setTitleView:", v11);

  }
  return v5;
}

- (id)rightBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ServiceBridgedNavigationItem;
  v3 = -[ServiceBridgedNavigationItem rightBarButtonItem](&v8, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceBridgedBarButtonItem itemFromItem:](ServiceBridgedBarButtonItem, "itemFromItem:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationItem proxyHandler](self, "proxyHandler"));
  objc_msgSend(v5, "setProxyHandler:", v6);

  return v5;
}

- (void)setBackButtonTitle:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServiceBridgedNavigationItem;
  -[ServiceBridgedNavigationItem setBackButtonTitle:](&v5, "setBackButtonTitle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationItem proxyHandler](self, "proxyHandler"));
  objc_msgSend(v4, "navigationItemUpdated");

}

- (void)setHidesBackButton:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServiceBridgedNavigationItem;
  -[ServiceBridgedNavigationItem setHidesBackButton:](&v5, "setHidesBackButton:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationItem proxyHandler](self, "proxyHandler"));
  objc_msgSend(v4, "navigationItemUpdated");

}

- (void)setRightBarButtonItem:(id)a3 animated:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ServiceBridgedNavigationItem;
  -[ServiceBridgedNavigationItem setRightBarButtonItem:animated:](&v6, "setRightBarButtonItem:animated:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationItem proxyHandler](self, "proxyHandler"));
  objc_msgSend(v5, "navigationItemUpdated");

}

- (void)setTitle:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ServiceBridgedNavigationItem;
  -[ServiceBridgedNavigationItem setTitle:](&v5, "setTitle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceBridgedNavigationItem proxyHandler](self, "proxyHandler"));
  objc_msgSend(v4, "navigationItemUpdated");

}

- (ServiceBridgedNavigationItemProxy)proxyHandler
{
  return (ServiceBridgedNavigationItemProxy *)objc_loadWeakRetained((id *)&self->_proxyHandler);
}

- (void)setProxyHandler:(id)a3
{
  objc_storeWeak((id *)&self->_proxyHandler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyHandler);
}

@end
