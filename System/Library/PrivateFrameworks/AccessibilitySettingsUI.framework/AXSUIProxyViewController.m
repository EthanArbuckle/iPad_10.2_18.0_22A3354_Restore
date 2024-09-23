@implementation AXSUIProxyViewController

- (AXSUIProxyViewController)init
{
  AXSUIProxyViewController *v3;

  -[AXSUIProxyViewController makeController](self, "makeController");
  v3 = (AXSUIProxyViewController *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)makeController
{
  return 0;
}

- (UIViewController)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
  objc_storeStrong((id *)&self->_wrapped, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end
