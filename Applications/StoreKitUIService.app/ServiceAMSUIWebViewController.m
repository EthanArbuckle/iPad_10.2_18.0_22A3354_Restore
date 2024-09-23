@implementation ServiceAMSUIWebViewController

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ServiceAMSUIWebViewController;
  -[ServiceAMSUIWebViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAMSUIWebViewController embeddedParent](self, "embeddedParent"));
  v5 = objc_opt_respondsToSelector(v4, "attemptDismissHostViewController");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAMSUIWebViewController embeddedParent](self, "embeddedParent"));
    objc_msgSend(v6, "attemptDismissHostViewController");

  }
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAMSUIWebViewController embeddedParent](self, "embeddedParent"));
  objc_msgSend(v5, "dismissHostViewController");

  v6.receiver = self;
  v6.super_class = (Class)ServiceAMSUIWebViewController;
  -[ServiceAMSUIWebViewController dismissAnimated:](&v6, "dismissAnimated:", v3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceAMSUIWebViewController embeddedParent](self, "embeddedParent"));
  objc_msgSend(v7, "dismissHostViewController");

  v8.receiver = self;
  v8.super_class = (Class)ServiceAMSUIWebViewController;
  -[ServiceAMSUIWebViewController dismissViewControllerAnimated:completion:](&v8, "dismissViewControllerAnimated:completion:", v4, v6);

}

- (ServiceAccountPageEmbeddedParent)embeddedParent
{
  return (ServiceAccountPageEmbeddedParent *)objc_loadWeakRetained((id *)&self->_embeddedParent);
}

- (void)setEmbeddedParent:(id)a3
{
  objc_storeWeak((id *)&self->_embeddedParent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_embeddedParent);
}

@end
