@implementation AKToolsPickerController

- (AKToolsPickerController)initWithController:(id)a3
{
  id v4;
  AKToolsPickerController *v5;
  AKToolsPickerController *v6;
  AKToolsListViewController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKToolsPickerController;
  v5 = -[AKToolsPickerController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKToolsPickerController setController:](v5, "setController:", v4);
    v7 = -[AKToolsListViewController initWithNibName:bundle:]([AKToolsListViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[AKToolsPickerController setToolsListController:](v6, "setToolsListController:", v7);

  }
  return v6;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  objc_storeStrong((id *)&self->_navController, a3);
}

- (UIViewController)toolsListController
{
  return self->_toolsListController;
}

- (void)setToolsListController:(id)a3
{
  objc_storeStrong((id *)&self->_toolsListController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolsListController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
