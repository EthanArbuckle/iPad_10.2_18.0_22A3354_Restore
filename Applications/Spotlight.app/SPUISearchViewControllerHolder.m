@implementation SPUISearchViewControllerHolder

- (SPUISearchViewControllerHolder)init
{
  SPUISearchViewControllerHolder *v2;
  SPUISearchViewController *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SPUISearchViewControllerHolder;
  v2 = -[SPUISearchViewControllerHolder init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(SPUISearchViewController);
    -[SPUISearchViewControllerHolder setSearchViewController:](v2, "setSearchViewController:", v3);

    v4 = objc_alloc((Class)SPUINavigationController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewControllerHolder searchViewController](v2, "searchViewController"));
    v6 = objc_msgSend(v4, "initWithSearchViewController:", v5);

    -[SPUISearchViewControllerHolder setNavigationController:](v2, "setNavigationController:", v6);
    if (+[SPUIDefaults enableFloatingWindow](SPUIDefaults, "enableFloatingWindow"))
    {
      v7 = objc_msgSend(objc_alloc((Class)SPUIPlatterContainerViewController), "initWithNavigationController:", v6);
      -[SPUISearchViewControllerHolder setPlatterViewController:](v2, "setPlatterViewController:", v7);

    }
    if (+[SPUIDefaults bottomSearchFieldEnabled](SPUIDefaults, "bottomSearchFieldEnabled"))
    {
      v8 = objc_msgSend(objc_alloc((Class)SPUIUnifiedFieldViewController), "initWithNavigationController:", v6);
      -[SPUISearchViewControllerHolder setUnifiedFieldController:](v2, "setUnifiedFieldController:", v8);

    }
  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005500;
  block[3] = &unk_10000C540;
  block[4] = a1;
  if (qword_100012578 != -1)
    dispatch_once(&qword_100012578, block);
  return (id)qword_100012570;
}

- (CALayer)searchProtectorLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewControllerHolder unifiedFieldController](self, "unifiedFieldController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchProtectorLayer"));

  return (CALayer *)v3;
}

- (SPUIUnifiedFieldViewController)unifiedFieldController
{
  return self->_unifiedFieldController;
}

- (void)setUnifiedFieldController:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedFieldController, a3);
}

- (void)setSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_searchViewController, a3);
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (SPUISearchViewController)searchViewController
{
  return self->_searchViewController;
}

- (UIViewController)rootViewController
{
  void *v3;

  if (+[SPUIDefaults bottomSearchFieldEnabled](SPUIDefaults, "bottomSearchFieldEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewControllerHolder unifiedFieldController](self, "unifiedFieldController"));
  }
  else if ((+[SPUIDefaults enableFloatingWindow](SPUIDefaults, "enableFloatingWindow") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewControllerHolder platterViewController](self, "platterViewController"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewControllerHolder navigationController](self, "navigationController"));
  }
  return (UIViewController *)v3;
}

- (SPUINavigationController)navigationController
{
  return self->_navigationController;
}

- (SPUIPlatterContainerViewController)platterViewController
{
  return self->_platterViewController;
}

- (void)setPlatterViewController:(id)a3
{
  objc_storeStrong((id *)&self->_platterViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedFieldController, 0);
  objc_storeStrong((id *)&self->_platterViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
}

@end
