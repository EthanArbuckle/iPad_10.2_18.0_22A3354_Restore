@implementation ServiceBridgedBarButtonItem

+ (id)itemFromItem:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class(a1));
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (SEL)action
{
  return -[UIBarButtonItem action](self->_underlyingBarButtonItem, "action");
}

- (BOOL)isEnabled
{
  return -[UIBarButtonItem isEnabled](self->_underlyingBarButtonItem, "isEnabled");
}

- (id)target
{
  return -[UIBarButtonItem target](self->_underlyingBarButtonItem, "target");
}

- (id)title
{
  return -[UIBarButtonItem title](self->_underlyingBarButtonItem, "title");
}

- (void)setAction:(SEL)a3
{
  -[UIBarButtonItem setAction:](self->_underlyingBarButtonItem, "setAction:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  -[UIBarButtonItem setEnabled:](self->_underlyingBarButtonItem, "setEnabled:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ServiceBridgedBarButtonItem proxyHandler](self, "proxyHandler"));
  objc_msgSend(v4, "navigationItemUpdated");

}

- (void)setTarget:(id)a3
{
  -[UIBarButtonItem setTarget:](self->_underlyingBarButtonItem, "setTarget:", a3);
}

- (void)setTitle:(id)a3
{
  id v4;

  -[UIBarButtonItem setTitle:](self->_underlyingBarButtonItem, "setTitle:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ServiceBridgedBarButtonItem proxyHandler](self, "proxyHandler"));
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
  objc_storeStrong((id *)&self->_underlyingBarButtonItem, 0);
}

@end
