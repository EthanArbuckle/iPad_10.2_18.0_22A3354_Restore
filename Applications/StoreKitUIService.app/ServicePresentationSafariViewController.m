@implementation ServicePresentationSafariViewController

- (ServicePresentationSafariViewController)initWithSafariViewController:(id)a3 proxyHandler:(id)a4
{
  id v6;
  id v7;
  ServicePresentationSafariViewController *v8;
  ServicePresentationSafariViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ServicePresentationSafariViewController;
  v8 = -[ServicePresentationSafariViewController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_proxyHandler, v7);
    -[ServicePresentationSafariViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 2);
    -[ServicePresentationSafariViewController _setChildViewController:](v9, "_setChildViewController:", v6);
  }

  return v9;
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UIView);
  objc_msgSend(v4, "setOpaque:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[ServicePresentationSafariViewController setView:](self, "setView:", v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ServicePresentationSafariViewController;
  -[ServicePresentationSafariViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationSafariViewController childViewControllers](self, "childViewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  if (!v5 || (objc_msgSend(v5, "isBeingPresented") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationSafariViewController proxyHandler](self, "proxyHandler"));
    objc_msgSend(v6, "dismissViewController");

  }
}

- (void)_setChildViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "willMoveToParentViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationSafariViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  -[ServicePresentationSafariViewController addChildViewController:](self, "addChildViewController:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServicePresentationSafariViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(v9, "didMoveToParentViewController:", self);
}

- (ServiceBridgedPresentationControllerProxy)proxyHandler
{
  return (ServiceBridgedPresentationControllerProxy *)objc_loadWeakRetained((id *)&self->_proxyHandler);
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
