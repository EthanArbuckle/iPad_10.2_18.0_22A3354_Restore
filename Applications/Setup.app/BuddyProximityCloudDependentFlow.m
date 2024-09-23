@implementation BuddyProximityCloudDependentFlow

- (BuddyProximityCloudDependentFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddyProximityCloudDependentFlow *v10;
  objc_super v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  id v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v13 = 0;
  objc_storeStrong(&v13, a6);
  v9 = v17;
  v17 = 0;
  v12.receiver = v9;
  v12.super_class = (Class)BuddyProximityCloudDependentFlow;
  v17 = -[BuddyProximityCloudDependentFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v12, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v15, v14, v13);
  objc_storeStrong(&v17, v17);
  if (v17)
    objc_msgSend(v17, "_updateClassListWithPasscodeShownInitially:", 0);
  v10 = (BuddyProximityCloudDependentFlow *)v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

- (void)configureFlowItem:(id)a3
{
  id v3;
  uint64_t v4;
  UIViewController *v5;
  objc_super v6;
  id v7;
  id location[2];
  BuddyProximityCloudDependentFlow *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = objc_opt_class(BuddyProximityCloudDependentHostController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v7 = location[0];
    v5 = -[BuddyProximityCloudDependentFlow viewController](v9, "viewController");
    objc_msgSend(v7, "setViewController:", v5);

    objc_storeStrong(&v7, 0);
  }
  v6.receiver = v9;
  v6.super_class = (Class)BuddyProximityCloudDependentFlow;
  -[BuddyProximityCloudDependentFlow configureFlowItem:](&v6, "configureFlowItem:", location[0]);
  objc_storeStrong(location, 0);
}

+ (id)allowedFlowItems
{
  _QWORD v5[3];

  v5[0] = objc_opt_class(BuddyAssociationController);
  v5[1] = objc_opt_class(BuddyPasscodeFlow);
  v5[2] = objc_opt_class(BuddyProximityCloudDependentHostController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAppleID;
}

- (BOOL)controllerNeedsToRun
{
  MCProfileConnection *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BuddyNetworkProvider *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  ProximitySetupController *v12;
  char v13;
  ProximitySetupController *v14;
  BuddyProximitySetupDependentController *v15;
  BOOL v16;
  id v17;
  id v18;
  _WORD v20[3];
  os_log_type_t v21;
  os_log_t v22;
  uint8_t buf[15];
  os_log_type_t v24;
  os_log_t oslog[2];
  BuddyProximityCloudDependentFlow *v26;

  v26 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyProximityCloudDependentFlow managedConfiguration](self, "managedConfiguration");
  v3 = -[MCProfileConnection effectiveBoolValueForSetting:](v2, "effectiveBoolValueForSetting:", MCFeatureAccountModificationAllowed);

  if (v3 == 2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v4);
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog[0];
      v6 = v24;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Skipping proximity sign in, account modification is restricted", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 0;
  }
  else
  {
    v7 = -[BuddyProximityCloudDependentFlow networkProvider](v26, "networkProvider");
    v8 = !-[BuddyNetworkProvider networkReachable](v7, "networkReachable");

    if ((v8 & 1) != 0)
    {
      v22 = (os_log_t)(id)_BYLoggingFacility(v9);
      v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v22;
        v11 = v21;
        sub_100038C3C(v20);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Skipping proximity sign in, network is not reachable", (uint8_t *)v20, 2u);
      }
      objc_storeStrong((id *)&v22, 0);
      return 0;
    }
    else
    {
      v12 = -[BuddyProximityCloudDependentFlow proximitySetupController](v26, "proximitySetupController");
      v13 = !-[ProximitySetupController hasConnection](v12, "hasConnection");

      if ((v13 & 1) != 0)
      {
        return 0;
      }
      else
      {
        v14 = -[BuddyProximityCloudDependentFlow proximitySetupController](v26, "proximitySetupController");
        v15 = -[ProximitySetupController dependentController](v14, "dependentController");
        v16 = v15 == 0;

        if (v16)
        {
          return 0;
        }
        else
        {
          v17 = +[ACAccountStore defaultStore](ACAccountStore, "defaultStore");
          v18 = objc_msgSend(v17, "aa_primaryAppleAccount");

          return v18 == 0;
        }
      }
    }
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  ProximitySetupController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  BuddyProximityCloudDependentFlow *v9;
  id v10;
  id location[2];
  BuddyProximityCloudDependentFlow *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityCloudDependentFlow proximitySetupController](v12, "proximitySetupController");
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10016BC40;
  v8 = &unk_100281078;
  v9 = v12;
  v10 = location[0];
  -[ProximitySetupController waitForIntent:](v3, "waitForIntent:", &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)responsibleForViewController:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t i;
  id v12;
  uint64_t v13;
  BOOL v14;
  UIViewController *v15;
  UIViewController *v16;
  objc_super v18;
  char v19;
  id v20;
  int v21;
  _QWORD __b[8];
  id v23;
  id v24;
  id location[2];
  BuddyProximityCloudDependentFlow *v26;
  char v27;
  _BYTE v28[128];

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyProximityCloudDependentFlow controllers](v26, "controllers");
  v4 = objc_msgSend(v3, "lastObject");
  v5 = objc_opt_class(BuddyPasscodeFlow);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0)
    goto LABEL_22;
  v7 = -[BuddyProximityCloudDependentFlow controllers](v26, "controllers");
  v24 = objc_msgSend(v7, "lastObject");

  memset(__b, 0, sizeof(__b));
  v8 = objc_msgSend(v24, "controllers");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v9; ++i)
      {
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v8);
        v23 = *(id *)(__b[1] + 8 * i);
        v12 = v23;
        v13 = objc_opt_class(UIViewController);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0 && v23 == location[0])
        {
          v27 = 1;
          v21 = 1;
          goto LABEL_19;
        }
        v19 = 0;
        v14 = 0;
        if ((objc_opt_respondsToSelector(v23, "viewController") & 1) != 0)
        {
          v20 = objc_msgSend(v23, "viewController");
          v19 = 1;
          v14 = v20 == location[0];
        }
        if ((v19 & 1) != 0)

        if (v14)
        {
          v27 = 1;
          v21 = 1;
          goto LABEL_19;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
    }
    while (v9);
  }
  v21 = 0;
LABEL_19:

  if (!v21)
    v21 = 0;
  objc_storeStrong(&v24, 0);
  if (!v21)
  {
LABEL_22:
    v15 = -[BuddyProximityCloudDependentFlow viewController](v26, "viewController");
    v16 = (UIViewController *)location[0];

    if (v15 == v16)
    {
      v27 = 1;
    }
    else
    {
      v18.receiver = v26;
      v18.super_class = (Class)BuddyProximityCloudDependentFlow;
      v27 = -[BuddyProximityCloudDependentFlow responsibleForViewController:](&v18, "responsibleForViewController:", location[0]);
    }
    v21 = 1;
  }
  objc_storeStrong(location, 0);
  return v27 & 1;
}

- (void)_updateClassListWithPasscodeShownInitially:(BOOL)a3
{
  NSArray *v3;
  id v4;
  BOOL v5;
  SEL v6;
  BuddyProximityCloudDependentFlow *v7;
  _QWORD v8[3];

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  if (!v5)
    objc_msgSend(v4, "addObject:", objc_opt_class(BuddyProximityCloudDependentHostController));
  v8[0] = objc_opt_class(BuddyPasscodeFlow);
  v8[1] = objc_opt_class(BuddyProximityCloudDependentHostController);
  v8[2] = objc_opt_class(BuddyAssociationController);
  v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3);
  objc_msgSend(v4, "addObjectsFromArray:", v3);

  -[BuddyProximityCloudDependentFlow setClassList:](v7, "setClassList:", v4);
  objc_storeStrong(&v4, 0);
}

- (void)_flowItemDone
{
  void *v2;
  id v3;
  UIViewController *v4;
  _BYTE *v5;
  id v6;
  id v7;
  id v8;
  NSIndexSet *v9;
  id v10;
  ProximitySetupController *v11;
  id v12;
  id location;
  _BYTE *v14;
  id v15[2];
  BuddyProximityCloudDependentFlow *v16;
  char *v17;
  id v18;
  id v19;
  char *v20;

  v16 = self;
  v15[1] = (id)a2;
  v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  v15[0] = -[BuddyProximityCloudDependentFlow navigationController](v16, "navigationController");
  v3 = objc_msgSend(v15[0], "viewControllers");
  v4 = -[BuddyProximityCloudDependentFlow viewController](v16, "viewController");
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  v14 = v5;
  v6 = objc_msgSend(v15[0], "viewControllers");
  v7 = v5;
  v8 = objc_msgSend(v15[0], "viewControllers");
  v18 = v7;
  v17 = (char *)((_BYTE *)objc_msgSend(v8, "count") - v14);
  v19 = v7;
  v20 = v17;
  v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v7, v17);
  location = objc_msgSend(v6, "objectsAtIndexes:", v9);

  v10 = -[BuddyProximityCloudDependentFlow navigationFlowDelegate](v16, "navigationFlowDelegate");
  objc_msgSend(v10, "removeViewControllersOnNextPush:", location);

  v11 = -[BuddyProximityCloudDependentFlow proximitySetupController](v16, "proximitySetupController");
  -[ProximitySetupController removeObserver:](v11, "removeObserver:", v16);

  v12 = -[BuddyProximityCloudDependentFlow flowItemDelegate](v16, "flowItemDelegate");
  objc_msgSend(v12, "flowItemDone:", v16);

  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
}

- (void)_endFlowPrematurely
{
  NSObject *v2;
  void *v3;
  void **v4;
  int v5;
  int v6;
  id (*v7)(uint64_t);
  void *v8;
  BuddyProximityCloudDependentFlow *v9;
  void **block;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15[2];
  BuddyProximityCloudDependentFlow *v16;

  v16 = self;
  v15[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_10016C6A8;
  v14 = &unk_100280730;
  v15[0] = v16;
  dispatch_async(v2, &block);

  v3 = &_dispatch_main_q;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10016C6F4;
  v8 = &unk_100280730;
  v9 = v16;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(v15, 0);
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v5;
  uint64_t v6;
  id v7;
  BuddyMiscState *v8;
  ProximitySetupController *v9;
  unsigned __int8 v10;
  uint64_t v11;
  BuddyProximityCloudDependentFlow *v12;
  id v13;
  void (**v14)(id, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  objc_super v17;
  uint8_t buf[15];
  os_log_type_t v19;
  os_log_t oslog;
  id v21;
  Class v22;
  id location[2];
  BuddyProximityCloudDependentFlow *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v5 = location[0];
  v6 = objc_opt_class(BuddyPasscodeFlow);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v21 = location[0];
    v7 = -[BuddyProximityCloudDependentFlow passcodeFlowCompletion](v24, "passcodeFlowCompletion");

    if (v7)
    {
      v8 = -[BuddyProximityCloudDependentFlow miscState](v24, "miscState");
      -[BuddyMiscState setHasPresentedPasscodeFlow:](v8, "setHasPresentedPasscodeFlow:", 1);

      v9 = -[BuddyProximityCloudDependentFlow proximitySetupController](v24, "proximitySetupController");
      v10 = -[ProximitySetupController hasConnection](v9, "hasConnection");

      if ((v10 & 1) != 0)
      {
        v12 = v24;
        v13 = objc_msgSend(v21, "viewControllers");
        -[BuddyProximityCloudDependentFlow removeViewControllersOnNextPush:](v12, "removeViewControllersOnNextPush:", v13);

        v14 = (void (**)(id, uint64_t))-[BuddyProximityCloudDependentFlow passcodeFlowCompletion](v24, "passcodeFlowCompletion");
        v14[2](v14, 1);

      }
      else
      {
        oslog = (os_log_t)(id)_BYLoggingFacility(v11);
        v19 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v15 = oslog;
          v16 = v19;
          sub_100038C3C(buf);
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Prematurely ending dependent flow after passcode/biometrics due to loss of proximity connection", buf, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        -[BuddyProximityCloudDependentFlow _endFlowPrematurely](v24, "_endFlowPrematurely");
      }
      -[BuddyProximityCloudDependentFlow setPasscodeFlowCompletion:](v24, "setPasscodeFlowCompletion:", 0);
    }
    objc_storeStrong(&v21, 0);
  }
  v17.receiver = v24;
  v17.super_class = (Class)BuddyProximityCloudDependentFlow;
  -[BuddyProximityCloudDependentFlow flowItemDone:nextItemClass:](&v17, "flowItemDone:nextItemClass:", location[0], v22);
  objc_storeStrong(location, 0);
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
  id v7;
  uint64_t v8;
  char isKindOfClass;
  BOOL v10;
  objc_super v11;
  int v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  BOOL v19;
  id v20;
  id location[2];
  BuddyProximityCloudDependentFlow *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = a5;
  v7 = location[0];
  v8 = objc_opt_class(BuddyProximityCloudDependentHostController);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);
  v17 = 0;
  v15 = 0;
  v13 = 0;
  v10 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    v18 = -[BuddyProximityCloudDependentFlow navigationController](v22, "navigationController");
    v17 = 1;
    v16 = objc_msgSend(v18, "topViewController");
    v15 = 1;
    v14 = -[BuddyProximityCloudDependentFlow viewController](v22, "viewController");
    v13 = 1;
    v10 = v16 == v14;
  }
  if ((v13 & 1) != 0)

  if ((v15 & 1) != 0)
  if ((v17 & 1) != 0)

  if (v10)
  {
    v12 = 1;
  }
  else
  {
    v11.receiver = v22;
    v11.super_class = (Class)BuddyProximityCloudDependentFlow;
    -[BuddyProximityCloudDependentFlow pushFlowItem:inFlow:animated:](&v11, "pushFlowItem:inFlow:animated:", location[0], v20, v19);
    v12 = 0;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)setupPasscodeAndBiometricWithCompletion:(id)a3
{
  void *v3;
  void **block;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  BuddyProximityCloudDependentFlow *v9;
  id v10;
  id location[2];
  BuddyProximityCloudDependentFlow *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10016CBB8;
  v8 = &unk_1002806E0;
  v9 = v12;
  v10 = location[0];
  dispatch_async((dispatch_queue_t)v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  NSString *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  id v12;
  ProximitySetupController *v13;
  NSObject *v14;
  void *v15;
  void **v16;
  int v17;
  int v18;
  id (*v19)(uint64_t);
  void *v20;
  BuddyProximityCloudDependentFlow *v21;
  os_log_type_t v22;
  os_log_t v23;
  void **v24;
  int v25;
  int v26;
  void (*v27)(uint64_t);
  void *v28;
  BuddyProximityCloudDependentFlow *v29;
  uint8_t v30[7];
  os_log_type_t v31;
  os_log_t oslog;
  void **block;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  BuddyProximityCloudDependentFlow *v38;
  char v39;
  id v40;
  char v41;
  id v42;
  char v43;
  id v44;
  char v45;
  id v46;
  char v47;
  id v48;
  char v49;
  NSString *v50;
  os_log_type_t v51;
  id v52;
  id location[2];
  BuddyProximityCloudDependentFlow *v54;
  uint8_t v55[16];
  uint8_t buf[24];

  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "error");

  if (v3)
  {
    v52 = (id)_BYLoggingFacility(v4);
    v51 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(location[0], "accountType");
      v49 = 0;
      v47 = 0;
      v45 = 0;
      v43 = 0;
      v41 = 0;
      v39 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v6 = (NSString *)objc_msgSend(location[0], "error");
        v50 = v6;
        v49 = 1;
      }
      else
      {
        v48 = objc_msgSend(location[0], "error");
        v47 = 1;
        if (v48)
        {
          v46 = objc_msgSend(location[0], "error");
          v45 = 1;
          v44 = objc_msgSend(v46, "domain");
          v43 = 1;
          v42 = objc_msgSend(location[0], "error");
          v41 = 1;
          v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v44, objc_msgSend(v42, "code"));
          v40 = v6;
          v39 = 1;
        }
        else
        {
          v6 = 0;
        }
      }
      sub_100069408((uint64_t)buf, (uint64_t)v5, (uint64_t)v6);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v52, v51, "Sign-in failed for account type (%ld): %{public}@", buf, 0x16u);
      if ((v39 & 1) != 0)

      if ((v41 & 1) != 0)
      if ((v43 & 1) != 0)

      if ((v45 & 1) != 0)
      if ((v47 & 1) != 0)

      if ((v49 & 1) != 0)
    }
    objc_storeStrong(&v52, 0);
    v7 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    v34 = -1073741824;
    v35 = 0;
    v36 = sub_10016D5B4;
    v37 = &unk_100280730;
    v38 = v54;
    dispatch_async(v7, &block);

    objc_storeStrong((id *)&v38, 0);
  }
  else
  {
    v8 = (char *)objc_msgSend(location[0], "accountType");
    if (v8)
    {
      if ((unint64_t)(v8 - 1) < 2)
      {
        v23 = (os_log_t)(id)_BYLoggingFacility(v8);
        v22 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          sub_1000342B4((uint64_t)v55, (uint64_t)objc_msgSend(location[0], "accountType"));
          _os_log_impl((void *)&_mh_execute_header, v23, v22, "Sign-in unnecessary for account type (%ld)", v55, 0xCu);
        }
        objc_storeStrong((id *)&v23, 0);
      }
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(0);
      v31 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v9 = oslog;
        v10 = v31;
        sub_100038C3C(v30);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Sign-in succeeded!", v30, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v11 = +[BFFAppleAccountInfo primaryAccountInfo](BFFAppleAccountInfo, "primaryAccountInfo");
      v12 = objc_msgSend(location[0], "authResults");
      objc_msgSend(v11, "updateWithAuthenticationResults:", v12);

      v13 = -[BuddyProximityCloudDependentFlow proximitySetupController](v54, "proximitySetupController");
      -[ProximitySetupController setSignedIniCloudAccount:](v13, "setSignedIniCloudAccount:", 1);

      v14 = dispatch_get_global_queue(0, 0);
      v24 = _NSConcreteStackBlock;
      v25 = -1073741824;
      v26 = 0;
      v27 = sub_10016D600;
      v28 = &unk_100280730;
      v29 = v54;
      dispatch_async(v14, &v24);

      objc_storeStrong((id *)&v29, 0);
    }
  }
  v15 = &_dispatch_main_q;
  v16 = _NSConcreteStackBlock;
  v17 = -1073741824;
  v18 = 0;
  v19 = sub_10016D64C;
  v20 = &unk_100280730;
  v21 = v54;
  dispatch_async((dispatch_queue_t)v15, &v16);

  objc_storeStrong((id *)&v21, 0);
  objc_storeStrong(location, 0);
}

- (void)proximitySetupSelectedAccountType:(int64_t)a3
{
  ;
}

- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4
{
  id v4[4];

  v4[3] = self;
  v4[2] = (id)a2;
  v4[1] = (id)a3;
  v4[0] = 0;
  objc_storeStrong(v4, a4);
  objc_storeStrong(v4, 0);
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  BuddyAppleIDSignInTask *v5;
  BuddyFeatureFlags *v6;
  id v7;
  BuddyAppleIDSignInTask *v8;
  id v9;
  BuddyAppleIDSignInTask *v10;
  BuddyAppleIDSignInTask *v11;
  BuddyAppleIDSignInTask *v12;
  BuddyAppleIDSignInTask *v13;
  id v14;
  void **v15;
  int v16;
  int v17;
  void (*v18)(NSObject *, char, id);
  void *v19;
  BuddyProximityCloudDependentFlow *v20;
  id v21;
  id v22;
  id location[2];
  BuddyProximityCloudDependentFlow *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v5 = [BuddyAppleIDSignInTask alloc];
  v6 = -[BuddyProximityCloudDependentFlow featureFlags](v24, "featureFlags");
  v7 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
  v8 = -[BuddyAppleIDSignInTask initWithFeatureFlags:accountTools:](v5, "initWithFeatureFlags:accountTools:", v6, v7);
  -[BuddyProximityCloudDependentFlow setSignInTask:](v24, "setSignInTask:", v8);

  v9 = -[BuddyProximityCloudDependentFlow navigationController](v24, "navigationController");
  v10 = -[BuddyProximityCloudDependentFlow signInTask](v24, "signInTask");
  -[BuddyAppleIDSignInTask setNavigationController:](v10, "setNavigationController:", v9);

  v11 = -[BuddyProximityCloudDependentFlow signInTask](v24, "signInTask");
  -[BuddyAppleIDSignInTask setEnableFindMy:](v11, "setEnableFindMy:", 0);

  v12 = -[BuddyProximityCloudDependentFlow signInTask](v24, "signInTask");
  -[BuddyAppleIDSignInTask setRestoreFromBackupMode:](v12, "setRestoreFromBackupMode:", 1);

  v13 = -[BuddyProximityCloudDependentFlow signInTask](v24, "signInTask");
  v14 = location[0];
  v15 = _NSConcreteStackBlock;
  v16 = -1073741824;
  v17 = 0;
  v18 = sub_10016D8F4;
  v19 = &unk_1002831A0;
  v20 = v24;
  v21 = v22;
  -[BuddyAppleIDSignInTask signInToAllServicesWithAuthenticationResults:completion:](v13, "signInToAllServicesWithAuthenticationResults:completion:", v14, &v15);

  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionTerminated
{
  void *v2;
  void **block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  BuddyProximityCloudDependentFlow *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10016DAB8;
  v7 = &unk_100280730;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (id)passcodeFlowCompletion
{
  return self->_passcodeFlowCompletion;
}

- (void)setPasscodeFlowCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BuddyAppleIDSignInTask)signInTask
{
  return self->_signInTask;
}

- (void)setSignInTask:(id)a3
{
  objc_storeStrong((id *)&self->_signInTask, a3);
}

- (BOOL)presentedPasscodeFlow
{
  return self->_presentedPasscodeFlow;
}

- (void)setPresentedPasscodeFlow:(BOOL)a3
{
  self->_presentedPasscodeFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInTask, 0);
  objc_storeStrong(&self->_passcodeFlowCompletion, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end
