@implementation BuddyMoveFromAndroidController

+ (BOOL)showMoveFromAndroidRestoreChoice
{
  id v2;
  char v3;

  v2 = +[BuddyCloudConfigManager sharedManager](BuddyCloudConfigManager, "sharedManager", a2);
  v3 = objc_msgSend(v2, "cloudConfigWantsToSkipControllerClass:", objc_opt_class(a1)) ^ 1;

  return v3 & 1;
}

- (BuddyMoveFromAndroidController)init
{
  BuddyMoveFromAndroidController *v2;
  id v3;
  void *v4;
  BuddyMoveFromAndroidController *v5;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  id v12;
  void **v13;
  int v14;
  int v15;
  void (*v16)(id *, char, id);
  void *v17;
  id v18;
  id from;
  objc_super v20;
  SEL v21;
  id location;

  v21 = a2;
  location = 0;
  v20.receiver = self;
  v20.super_class = (Class)BuddyMoveFromAndroidController;
  v2 = -[BuddyMoveFromAndroidController init](&v20, "init");
  location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    v3 = objc_alloc_init((Class)sub_10009504C());
    v4 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v3;

    objc_initWeak(&from, location);
    v13 = _NSConcreteStackBlock;
    v14 = -1073741824;
    v15 = 0;
    v16 = sub_100095138;
    v17 = &unk_100281BC8;
    objc_copyWeak(&v18, &from);
    objc_msgSend(*((id *)location + 1), "setCompletionHandler:", &v13);
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_1000951B0;
    v11 = &unk_1002806B8;
    objc_copyWeak(&v12, &from);
    objc_msgSend(*((id *)location + 1), "setResetHandler:", &v7);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
  }
  v5 = (BuddyMoveFromAndroidController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAndroid;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (id)viewController
{
  return self->_welcomeViewController;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)responsibleForViewController:(id)a3
{
  NSBundle *v3;
  NSBundle *v4;
  unsigned __int8 v5;
  id location[2];
  BuddyMoveFromAndroidController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(location[0]));
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v8->_welcomeViewController));
  v5 = -[NSBundle isEqual:](v3, "isEqual:", v4);

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)_welcomeKitDidFinishWithSuccess:(BOOL)a3 settings:(id)a4
{
  BuddyDisplayZoomExecutor *v4;
  BuddySetupMethod *v5;
  BFFFlowItemDelegate *v6;
  BFFFlowItemDelegate *v7;
  id v8;
  id v9;
  BOOL v10;
  SEL v11;
  BuddyMoveFromAndroidController *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  v9 = 0;
  objc_storeStrong(&v9, a4);
  if (v10)
  {
    if (v9)
    {
      if ((objc_msgSend(v9, "enableDisplayZoom") & 1) != 0)
      {
        v4 = -[BuddyMoveFromAndroidController displayZoomExecutor](v12, "displayZoomExecutor");
        -[BuddyDisplayZoomExecutor setPendingOption:chosenByUser:](v4, "setPendingOption:chosenByUser:", 1, 0);
      }
      else
      {
        v4 = -[BuddyMoveFromAndroidController displayZoomExecutor](v12, "displayZoomExecutor");
        -[BuddyDisplayZoomExecutor setPendingOption:chosenByUser:](v4, "setPendingOption:chosenByUser:", 0, 0);
      }

    }
    v5 = -[BuddyMoveFromAndroidController setupMethod](v12, "setupMethod");
    -[BuddySetupMethod setDataTransferMethod:](v5, "setDataTransferMethod:", 3);

    v6 = -[BuddyMoveFromAndroidController delegate](v12, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v6, "flowItemDone:", v12);

  }
  else
  {
    v7 = -[BuddyMoveFromAndroidController delegate](v12, "delegate");
    v8 = -[BFFFlowItemDelegate popToBuddyControllerWithClass:withOffset:animated:](v7, "popToBuddyControllerWithClass:withOffset:animated:", objc_opt_class(BuddyMoveFromAndroidController), 1, 1);

  }
  objc_storeStrong(&v9, 0);
}

- (void)_eraseDevice
{
  BFFNavigationController *v2;
  id v3;
  id v4;
  BFFNavigationController *v5;
  ProximitySetupController *v6;
  BYAnalyticsManager *v7;
  BFFNavigationController *v8;
  id location[2];
  BuddyMoveFromAndroidController *v10;

  v10 = self;
  location[1] = (id)a2;
  v2 = -[BuddyMoveFromAndroidController navigationController](self, "navigationController");
  v3 = -[BFFNavigationController view](v2, "view");
  v4 = objc_msgSend(v3, "window");
  v5 = -[BuddyMoveFromAndroidController navigationController](v10, "navigationController");
  v6 = -[BuddyMoveFromAndroidController proximitySetupController](v10, "proximitySetupController");
  v7 = -[BuddyMoveFromAndroidController analyticsManager](v10, "analyticsManager");
  location[0] = +[BuddyEraseAlertController alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:](BuddyEraseAlertController, "alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:", v4, v5, v6, v7);

  v8 = -[BuddyMoveFromAndroidController navigationController](v10, "navigationController");
  -[BFFNavigationController presentViewController:animated:completion:](v8, "presentViewController:animated:completion:", location[0], 1, 0);

  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BFFNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_displayZoomExecutor, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_displayZoomExecutor, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_welcomeViewController, 0);
}

@end
