@implementation ServiceSUNavigationController

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSUNavigationController embeddedParent](self, "embeddedParent"));
  objc_msgSend(v5, "dismissHostViewController");

  v6.receiver = self;
  v6.super_class = (Class)ServiceSUNavigationController;
  -[ServiceSUNavigationController dismissAnimated:](&v6, "dismissAnimated:", v3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceSUNavigationController embeddedParent](self, "embeddedParent"));
  objc_msgSend(v7, "dismissHostViewController");

  v8.receiver = self;
  v8.super_class = (Class)ServiceSUNavigationController;
  -[ServiceSUNavigationController dismissViewControllerAnimated:completion:](&v8, "dismissViewControllerAnimated:completion:", v4, v6);

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
