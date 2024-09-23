@implementation QLNavigationState

- (BOOL)navigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (BOOL)toolBarHidden
{
  return self->_toolBarHidden;
}

- (void)setToolBarHidden:(BOOL)a3
{
  self->_toolBarHidden = a3;
}

- (BOOL)translucentNavigationBar
{
  return self->_translucentNavigationBar;
}

- (void)setTranslucentNavigationBar:(BOOL)a3
{
  self->_translucentNavigationBar = a3;
}

- (BOOL)translucentToolbar
{
  return self->_translucentToolbar;
}

- (void)setTranslucentToolbar:(BOOL)a3
{
  self->_translucentToolbar = a3;
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
}

@end
