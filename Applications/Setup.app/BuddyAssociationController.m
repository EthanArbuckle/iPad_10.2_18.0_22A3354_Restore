@implementation BuddyAssociationController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)controllerNeedsToRun
{
  BYRunState *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  id location[2];
  BuddyAssociationController *v9;
  char v10;

  v9 = self;
  location[1] = (id)a2;
  if ((+[AMSDevice deviceIsBundle](AMSDevice, "deviceIsBundle") & 1) != 0)
  {
    v2 = -[BuddyAssociationController runState](v9, "runState");
    v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun");

    if ((v3 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v4 = +[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore");
      location[0] = objc_msgSend(v4, "ams_activeiTunesAccount");

      if (location[0])
      {
        v5 = objc_msgSend(location[0], "ams_isBundleOwner");
        v6 = 1;
        if (v5)
          v6 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:account:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:account:", BYPrivacySubscriptionBundleIdentifier, location[0]);
        v10 = v6 & 1;

      }
      else
      {
        v10 = 1;
      }
      objc_storeStrong(location, 0);
    }
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyMediaServicesBag *v3;
  id v4;
  BuddyMediaServicesBag *v5;
  AMSBag *v6;
  BuddyMediaServicesBag *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  AMSUIDynamicViewController *v12;
  BuddyAssociationController *v13;
  AMSUIDynamicViewController *v14;
  AMSUIDynamicViewController *v15;
  id v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, char, id);
  void *v21;
  id v22;
  id location[2];
  BuddyAssociationController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc_init(BuddyMediaServicesBag);
  -[BuddyAssociationController setBag:](v24, "setBag:", v3);

  v4 = objc_alloc((Class)AMSUIDynamicViewController);
  v5 = -[BuddyAssociationController bag](v24, "bag");
  v6 = -[BuddyMediaServicesBag underlyingBag](v5, "underlyingBag");
  v7 = -[BuddyAssociationController bag](v24, "bag");
  v8 = -[BuddyMediaServicesBag getBundleURL](v7, "getBundleURL");
  v9 = objc_msgSend(v4, "initWithBag:bagValue:", v6, v8);
  -[BuddyAssociationController setDynamicViewController:](v24, "setDynamicViewController:", v9);

  v10 = +[ACAccountStore ams_sharedAccountStore](ACAccountStore, "ams_sharedAccountStore");
  v11 = objc_msgSend(v10, "ams_activeiTunesAccount");
  v12 = -[BuddyAssociationController dynamicViewController](v24, "dynamicViewController");
  -[AMSUIDynamicViewController setAccount:](v12, "setAccount:", v11);

  v13 = v24;
  v14 = -[BuddyAssociationController dynamicViewController](v24, "dynamicViewController");
  -[AMSUIDynamicViewController setDelegate:](v14, "setDelegate:", v13);

  v15 = -[BuddyAssociationController dynamicViewController](v24, "dynamicViewController");
  v16 = -[AMSUIDynamicViewController preload](v15, "preload");
  v17 = _NSConcreteStackBlock;
  v18 = -1073741824;
  v19 = 0;
  v20 = sub_100032BC8;
  v21 = &unk_100280690;
  v22 = location[0];
  objc_msgSend(v16, "resultWithCompletion:", &v17);

  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return -[BuddyAssociationController dynamicViewController](self, "dynamicViewController", a2, self);
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v7;
  AMSUIDynamicViewController *v8;
  id v9;
  id v10;
  UINavigationController *v11;
  ProximitySetupController *v12;
  BYAnalyticsManager *v13;
  UINavigationController *v14;
  BFFFlowItemDelegate *v15;
  BuddyEraseAlertController *v16;
  id v17;
  id v18;
  id location[2];
  BuddyAssociationController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v7 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("action"));
  LOBYTE(a4) = objc_msgSend(v7, "isEqualToString:", CFSTR("erase"));

  if ((a4 & 1) != 0)
  {
    v8 = -[BuddyAssociationController dynamicViewController](v20, "dynamicViewController");
    v9 = -[AMSUIDynamicViewController view](v8, "view");
    v10 = objc_msgSend(v9, "window");
    v11 = -[BuddyAssociationController navigationController](v20, "navigationController");
    v12 = -[BuddyAssociationController proximitySetupController](v20, "proximitySetupController");
    v13 = -[BuddyAssociationController analyticsManager](v20, "analyticsManager");
    v16 = +[BuddyEraseAlertController alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:](BuddyEraseAlertController, "alertControllerWithWindow:navigationController:proximitySetupController:analyticsManager:", v10, v11, v12, v13);

    v14 = -[BuddyAssociationController navigationController](v20, "navigationController");
    -[UINavigationController presentViewController:animated:completion:](v14, "presentViewController:animated:completion:", v16, 1, 0);

    objc_storeStrong((id *)&v16, 0);
  }
  else
  {
    v15 = -[BuddyAssociationController delegate](v20, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v15, "flowItemDone:", v20);

  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BuddyMediaServicesBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (AMSUIDynamicViewController)dynamicViewController
{
  return self->_dynamicViewController;
}

- (void)setDynamicViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicViewController, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end
