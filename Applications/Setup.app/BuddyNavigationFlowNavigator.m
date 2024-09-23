@implementation BuddyNavigationFlowNavigator

- (BuddyNavigationFlowNavigator)initWithNavigationController:(id)a3
{
  id v3;
  BuddyNavigationFlowNavigator *v4;
  objc_super v6;
  id location[2];
  id v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyNavigationFlowNavigator;
  v8 = -[BuddyNavigationFlowNavigator init](&v6, "init");
  objc_storeStrong(&v8, v8);
  if (v8)
    objc_storeWeak((id *)v8 + 1, location[0]);
  v4 = (BuddyNavigationFlowNavigator *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)addDelegateObserver:(id)a3
{
  BFFNavigationController *v3;
  id location[2];
  BuddyNavigationFlowNavigator *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyNavigationFlowNavigator navigationController](v5, "navigationController");
  -[BFFNavigationController addDelegateObserver:](v3, "addDelegateObserver:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)topViewController
{
  BFFNavigationController *v2;
  id v3;

  v2 = -[BuddyNavigationFlowNavigator navigationController](self, "navigationController", a2, self);
  v3 = -[BFFNavigationController topViewController](v2, "topViewController");

  return v3;
}

- (id)presentedViewController
{
  BFFNavigationController *v2;
  id v3;

  v2 = -[BuddyNavigationFlowNavigator navigationController](self, "navigationController", a2, self);
  v3 = -[BFFNavigationController presentedViewController](v2, "presentedViewController");

  return v3;
}

- (id)viewControllers
{
  BFFNavigationController *v2;
  id v3;

  v2 = -[BuddyNavigationFlowNavigator navigationController](self, "navigationController", a2, self);
  v3 = -[BFFNavigationController viewControllers](v2, "viewControllers");

  return v3;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BFFNavigationController *v5;
  BOOL v6;
  id location[2];
  BuddyNavigationFlowNavigator *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5 = -[BuddyNavigationFlowNavigator navigationController](v8, "navigationController");
  -[BFFNavigationController setViewControllers:animated:](v5, "setViewControllers:animated:", location[0], v6);

  objc_storeStrong(location, 0);
}

- (id)view
{
  BFFNavigationController *v2;
  id v3;

  v2 = -[BuddyNavigationFlowNavigator navigationController](self, "navigationController", a2, self);
  v3 = -[BFFNavigationController view](v2, "view");

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BFFNavigationController *v4;
  id location[2];
  BuddyNavigationFlowNavigator *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[BuddyNavigationFlowNavigator navigationController](v6, "navigationController");
  -[BFFNavigationController pushViewController:animated:](v4, "pushViewController:animated:", location[0], 1);

  objc_storeStrong(location, 0);
}

- (void)pushViewController:(id)a3 completion:(id)a4
{
  BFFNavigationController *v5;
  id v6;
  id location[2];
  BuddyNavigationFlowNavigator *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddyNavigationFlowNavigator navigationController](v8, "navigationController");
  -[BFFNavigationController pushViewController:completion:](v5, "pushViewController:completion:", location[0], v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)pushViewController:(id)a3 usingShieldColor:(id)a4 completion:(id)a5
{
  BFFNavigationController *v7;
  id v8;
  id v9;
  id location[2];
  BuddyNavigationFlowNavigator *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = -[BuddyNavigationFlowNavigator navigationController](v11, "navigationController");
  -[BFFNavigationController pushViewController:usingShieldColor:completion:](v7, "pushViewController:usingShieldColor:completion:", location[0], v9, v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  BFFNavigationController *v5;
  id v6;
  BOOL v8;
  id location[2];
  BuddyNavigationFlowNavigator *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = a4;
  v5 = -[BuddyNavigationFlowNavigator navigationController](v10, "navigationController");
  v6 = -[BFFNavigationController popToViewController:animated:](v5, "popToViewController:animated:", location[0], v8);

  objc_storeStrong(location, 0);
  return v6;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BFFNavigationController *v3;
  id v4;
  BOOL v6;

  v6 = a3;
  v3 = -[BuddyNavigationFlowNavigator navigationController](self, "navigationController");
  v4 = -[BFFNavigationController popToRootViewControllerAnimated:](v3, "popToRootViewControllerAnimated:", v6);

  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BFFNavigationController *v7;
  id v8;
  BOOL v9;
  id location[2];
  BuddyNavigationFlowNavigator *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = -[BuddyNavigationFlowNavigator navigationController](v11, "navigationController");
  -[BFFNavigationController presentViewController:animated:completion:](v7, "presentViewController:animated:completion:", location[0], v9, v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BFFNavigationController *v4;
  id v5;
  BOOL v6;
  SEL v7;
  BuddyNavigationFlowNavigator *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = 0;
  objc_storeStrong(&v5, a4);
  v4 = -[BuddyNavigationFlowNavigator navigationController](v8, "navigationController");
  -[BFFNavigationController dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", v6, v5);

  objc_storeStrong(&v5, 0);
}

- (BFFNavigationController)navigationController
{
  return (BFFNavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
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
