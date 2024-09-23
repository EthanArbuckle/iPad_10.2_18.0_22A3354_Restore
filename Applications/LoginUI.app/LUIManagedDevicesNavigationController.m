@implementation LUIManagedDevicesNavigationController

- (LUIManagedDevicesNavigationController)initWithOrganizationName:(id)a3
{
  id v4;
  LUIManagedDevicesViewController *v5;
  LUIManagedDevicesNavigationController *v6;
  LUIManagedDevicesNavigationController *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[LUIManagedDevicesViewController initWithOrganizationName:]([LUIManagedDevicesViewController alloc], "initWithOrganizationName:", v4);

  v9.receiver = self;
  v9.super_class = (Class)LUIManagedDevicesNavigationController;
  v6 = -[LUIManagedDevicesNavigationController initWithRootViewController:](&v9, "initWithRootViewController:", v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_managedDevicesViewController, v5);
    -[LUIManagedDevicesNavigationController _setupNavigationItem](v7, "_setupNavigationItem");
  }

  return v7;
}

- (void)_setupNavigationItem
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesNavigationController managedDevicesViewController](self, "managedDevicesViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationItem"));

  v4 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

}

- (void)doneButtonPressed:(id)a3
{
  -[LUIManagedDevicesNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (LUIManagedDevicesViewController)managedDevicesViewController
{
  return self->_managedDevicesViewController;
}

- (void)setManagedDevicesViewController:(id)a3
{
  objc_storeStrong((id *)&self->_managedDevicesViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedDevicesViewController, 0);
}

@end
