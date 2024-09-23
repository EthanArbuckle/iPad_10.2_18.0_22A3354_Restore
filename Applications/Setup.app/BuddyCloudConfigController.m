@implementation BuddyCloudConfigController

+ (void)initialize
{
  if ((BFFIsiPad(a1, a2) & 1) != 0)
    qword_1002EEC50 = 0x404C800000000000;
  else
    qword_1002EEC50 = 18.0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyPendingRestoreState *v3;
  RestorableBackupItem *v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  BuddyCloudConfigController *v15;
  id v16;
  uint8_t buf[7];
  os_log_type_t v18;
  os_log_t oslog;
  BOOL v20;
  id location[2];
  BuddyCloudConfigController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyCloudConfigController pendingRestoreState](v22, "pendingRestoreState");
  v4 = -[BuddyPendingRestoreState backupItem](v3, "backupItem");
  v5 = v4 != 0;

  v20 = v5;
  if (v5)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v18;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Skipping cloud configuration due to pending restore", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  }
  else
  {
    v9 = dispatch_get_global_queue(25, 0);
    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_1001A8054;
    v14 = &unk_1002806E0;
    v15 = v22;
    v16 = location[0];
    dispatch_async(v9, &v10);

    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)startOver
{
  BuddyEnrollmentCoordinator *v2;

  v2 = -[BuddyCloudConfigController enrollmentCoordinator](self, "enrollmentCoordinator", a2, self);
  -[BuddyEnrollmentCoordinator interruptEnrollment](v2, "interruptEnrollment");

}

- (BOOL)shouldAllowStartOver
{
  return 1;
}

- (void)removeViewControllers:(id)a3 fromNavHierarchyOf:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t i;
  _QWORD __b[8];
  uint64_t v11;
  id v12;
  id v13;
  id location[3];
  _BYTE v15[128];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = objc_msgSend(v13, "viewControllers");
  v12 = objc_msgSend(v5, "mutableCopy");

  memset(__b, 0, sizeof(__b));
  v6 = location[0];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v7; ++i)
      {
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(__b[1] + 8 * i);
        objc_msgSend(v12, "removeObject:", v11);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v13, "setViewControllers:animated:", v12, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)setDelegate:(id)a3
{
  id location[2];
  BuddyCloudConfigController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeWeak((id *)&v4->_delegate, location[0]);
  objc_storeStrong(location, 0);
}

- (int)cloudConfigState
{
  return self->_cloudConfigState;
}

- (BuddyCloudConfigDisclosureViewController)disclosureViewController
{
  BuddyCloudConfigDisclosureViewController *v2;
  BuddyCloudConfigDisclosureViewController *disclosureViewController;
  BuddyEnrollmentCoordinator *v4;
  MCProfileConnection *v5;
  BuddyNetworkProvider *v6;
  BFFFlowItemDelegate *v7;

  if (!self->_disclosureViewController)
  {
    v2 = objc_alloc_init(BuddyCloudConfigDisclosureViewController);
    disclosureViewController = self->_disclosureViewController;
    self->_disclosureViewController = v2;

    -[BuddyCloudConfigDisclosureViewController setConfigController:](self->_disclosureViewController, "setConfigController:", self, a2);
    v4 = -[BuddyCloudConfigController enrollmentCoordinator](self, "enrollmentCoordinator");
    -[BuddyCloudConfigDisclosureViewController setEnrollmentCoordinator:](self->_disclosureViewController, "setEnrollmentCoordinator:", v4);

    v5 = -[BuddyCloudConfigController managedConfiguration](self, "managedConfiguration");
    -[BuddyCloudConfigDisclosureViewController setManagedConfiguration:](self->_disclosureViewController, "setManagedConfiguration:", v5);

    v6 = -[BuddyCloudConfigController networkProvider](self, "networkProvider");
    -[BuddyCloudConfigDisclosureViewController setNetworkProvider:](self->_disclosureViewController, "setNetworkProvider:", v6);

    v7 = -[BuddyCloudConfigController delegate](self, "delegate");
    -[BuddyWelcomeController setDelegate:](self->_disclosureViewController, "setDelegate:", v7);

  }
  return self->_disclosureViewController;
}

- (BuddyCloudConfigLoginViewController)loginViewController
{
  BuddyCloudConfigLoginViewController *v2;
  BuddyCloudConfigLoginViewController *loginViewController;
  MCProfileConnection *v4;

  if (!self->_loginViewController)
  {
    v2 = objc_alloc_init(BuddyCloudConfigLoginViewController);
    loginViewController = self->_loginViewController;
    self->_loginViewController = v2;

    -[BuddyCloudConfigLoginViewController setConfigController:](self->_loginViewController, "setConfigController:", self, a2);
    v4 = -[BuddyCloudConfigController managedConfiguration](self, "managedConfiguration");
    -[BuddyCloudConfigLoginViewController setManagedConfiguration:](self->_loginViewController, "setManagedConfiguration:", v4);

  }
  return self->_loginViewController;
}

- (id)viewController
{
  unsigned int v2;
  BuddyCloudConfigDisclosureViewController *v3;
  id v4;
  BuddyCloudConfigLoginViewController *v5;
  id v6;
  id v7;
  id location[2];
  BuddyCloudConfigController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v2 = -[BuddyCloudConfigController cloudConfigState](self, "cloudConfigState");
  if (v2 < 2)
    goto LABEL_6;
  if (v2 == 2)
    goto LABEL_8;
  if (v2 - 3 < 2)
  {
LABEL_6:
    v3 = -[BuddyCloudConfigController disclosureViewController](v10, "disclosureViewController");
    v4 = location[0];
    location[0] = v3;

    goto LABEL_8;
  }
  if (v2 == 6)
  {
    v5 = -[BuddyCloudConfigController loginViewController](v10, "loginViewController");
    v6 = location[0];
    location[0] = v5;

  }
LABEL_8:
  v7 = location[0];
  objc_storeStrong(location, 0);
  return v7;
}

- (id)view
{
  id v2;
  id v3;

  v2 = -[BuddyCloudConfigController viewController](self, "viewController", a2, self);
  v3 = objc_msgSend(v2, "view");

  return v3;
}

- (NSMutableArray)controllersToRemove
{
  NSMutableArray *v2;
  NSMutableArray *controllersToRemove;

  if (!self->_controllersToRemove)
  {
    v2 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    controllersToRemove = self->_controllersToRemove;
    self->_controllersToRemove = v2;

  }
  return self->_controllersToRemove;
}

- (void)_completeCloudConfig
{
  BuddyCloudConfigDisclosureViewController *v2;
  BuddyCloudConfigDisclosureViewController *v3;
  BuddyCloudConfigDisclosureViewController *v4;
  BuddyCloudConfigLoginViewController *v5;
  BuddyCloudConfigLoginViewController *v6;
  BFFFlowItemDelegate *v7;
  id WeakRetained;
  id location[2];
  BuddyCloudConfigController *v10;

  v10 = self;
  location[1] = (id)a2;
  -[BuddyCloudConfigController setCloudConfigState:](self, "setCloudConfigState:", 8);
  location[0] = +[NSMutableArray array](NSMutableArray, "array");
  v2 = -[BuddyCloudConfigController disclosureViewController](v10, "disclosureViewController");

  if (v2)
  {
    v3 = -[BuddyCloudConfigController disclosureViewController](v10, "disclosureViewController");
    objc_msgSend(location[0], "addObject:", v3);

    v4 = -[BuddyCloudConfigController disclosureViewController](v10, "disclosureViewController");
    -[BuddyCloudConfigDisclosureViewController setConfigController:](v4, "setConfigController:", 0);

  }
  v5 = -[BuddyCloudConfigController loginViewController](v10, "loginViewController");

  if (v5)
  {
    v6 = -[BuddyCloudConfigController loginViewController](v10, "loginViewController");
    objc_msgSend(location[0], "addObject:", v6);

  }
  v7 = -[BuddyCloudConfigController delegate](v10, "delegate");
  -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v7, "removeViewControllersOnNextPush:", location[0]);

  WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  objc_msgSend(WeakRetained, "flowItemDone:", v10);

  objc_storeStrong(location, 0);
}

- (void)cloudConfigDidFinishFromViewController:(id)a3 wasApplied:(BOOL)a4
{
  uint64_t v5;
  MCProfileConnection *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *, void *);
  void *v11;
  id v12;
  BuddyCloudConfigController *v13;
  os_log_type_t v14;
  os_log_t oslog;
  BOOL v16;
  id location[2];
  BuddyCloudConfigController *v18;
  uint8_t buf[8];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046FA0(buf, v16);
    _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Completed cloud configuration. Was applied: %d", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v16)
  {
    v6 = -[BuddyCloudConfigController managedConfiguration](v18, "managedConfiguration");
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_1001A8CC0;
    v11 = &unk_100284240;
    v12 = location[0];
    v13 = v18;
    -[MCProfileConnection cloudConfigurationUIDidCompleteWasApplied:completionHandler:](v6, "cloudConfigurationUIDidCompleteWasApplied:completionHandler:", 1, &v7);

    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    -[BuddyCloudConfigController _completeCloudConfig](v18, "_completeCloudConfig");
  }
  objc_storeStrong(location, 0);
}

- (void)transitionToDisclosureViewFromController:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  BuddyCloudConfigDisclosureViewController *v10;
  id v11;
  NSMutableArray *v12;
  BuddyCloudConfigDisclosureViewController *v13;
  id v14;
  id v15;
  BuddyCloudConfigDisclosureViewController *v16;
  id v17;
  BuddyCloudConfigDisclosureViewController *v18;
  id v19;
  uint8_t buf[15];
  os_log_type_t v21;
  os_log_t oslog;
  id location[2];
  BuddyCloudConfigController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v21;
    sub_100038C3C(buf);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Showing disclosure view controller.", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyCloudConfigController setCloudConfigState:](v24, "setCloudConfigState:", 0);
  v6 = objc_msgSend(location[0], "navigationController");
  v7 = objc_msgSend(v6, "viewControllers");
  v19 = objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v19, "count"))
  {
    v8 = objc_msgSend(v19, "lastObject");
    v9 = location[0];

    if (v8 == v9)
    {
      v10 = -[BuddyCloudConfigController disclosureViewController](v24, "disclosureViewController");
      objc_msgSend(v19, "insertObject:atIndex:", v10, (char *)objc_msgSend(v19, "count") - 1);

      v11 = objc_msgSend(location[0], "navigationController");
      objc_msgSend(v11, "setViewControllers:", v19);

      v12 = (NSMutableArray *)objc_msgSend(location[0], "navigationController");
      v13 = -[BuddyCloudConfigController disclosureViewController](v24, "disclosureViewController");
      v14 = -[NSMutableArray popToViewController:animated:](v12, "popToViewController:animated:", v13, 1);

    }
    else
    {
      v15 = objc_msgSend(location[0], "navigationController");
      v16 = -[BuddyCloudConfigController disclosureViewController](v24, "disclosureViewController");
      objc_msgSend(v15, "pushViewController:animated:", v16, 0);

      v12 = -[BuddyCloudConfigController controllersToRemove](v24, "controllersToRemove");
      -[NSMutableArray addObject:](v12, "addObject:", location[0]);
    }

  }
  else
  {
    v17 = objc_msgSend(location[0], "navigationController");
    v18 = -[BuddyCloudConfigController disclosureViewController](v24, "disclosureViewController");
    objc_msgSend(v17, "pushViewController:animated:", v18, 0);

  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)transitionToErrorViewInDisclosureViewControllerFromController:(id)a3 lastError:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSMutableArray *v8;
  id v9;
  BuddyCloudConfigDisclosureViewController *v10;
  id v11;
  BuddyCloudConfigDisclosureViewController *v12;
  _WORD v13[3];
  os_log_type_t v14;
  os_log_t oslog;
  id v16;
  id location[2];
  BuddyCloudConfigController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = oslog;
    v7 = v14;
    sub_100038C3C(v13);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Showing disclosure view controller to show error.", (uint8_t *)v13, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyCloudConfigController setCloudConfigState:](v18, "setCloudConfigState:", 5);
  v8 = -[BuddyCloudConfigController controllersToRemove](v18, "controllersToRemove");
  -[NSMutableArray addObject:](v8, "addObject:", location[0]);

  v9 = v16;
  v10 = -[BuddyCloudConfigController disclosureViewController](v18, "disclosureViewController");
  -[BuddyCloudConfigDisclosureViewController setLastRetrievalError:](v10, "setLastRetrievalError:", v9);

  v11 = objc_msgSend(location[0], "navigationController");
  v12 = -[BuddyCloudConfigController disclosureViewController](v18, "disclosureViewController");
  objc_msgSend(v11, "pushViewController:animated:", v12, 0);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)transitionToLoginViewControllerFromController:(id)a3 lastError:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSMutableArray *v8;
  BuddyCloudConfigLoginViewController *v9;
  id v10;
  BuddyCloudConfigLoginViewController *v11;
  id v12;
  BuddyCloudConfigLoginViewController *v13;
  _WORD v14[3];
  os_log_type_t v15;
  os_log_t oslog;
  id v17;
  id location[2];
  BuddyCloudConfigController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = oslog;
    v7 = v15;
    sub_100038C3C(v14);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Showing login view contoller.", (uint8_t *)v14, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyCloudConfigController setCloudConfigState:](v19, "setCloudConfigState:", 6);
  v8 = -[BuddyCloudConfigController controllersToRemove](v19, "controllersToRemove");
  -[NSMutableArray addObject:](v8, "addObject:", location[0]);

  v9 = -[BuddyCloudConfigController loginViewController](v19, "loginViewController");
  -[BuddyCloudConfigLoginViewController clearInput](v9, "clearInput");

  v10 = v17;
  v11 = -[BuddyCloudConfigController loginViewController](v19, "loginViewController");
  -[BuddyCloudConfigLoginViewController setLastError:](v11, "setLastError:", v10);

  v12 = objc_msgSend(location[0], "navigationController");
  v13 = -[BuddyCloudConfigController loginViewController](v19, "loginViewController");
  objc_msgSend(v12, "pushViewController:animated:", v13, 1);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)transitionToSoftwareUpdateControllerFromController:(id)a3 lastError:(id)a4
{
  NSAssertionHandler *v5;
  BuddyCloudConfigDisclosureViewController *v6;
  BuddyCloudConfigDisclosureViewController *v7;
  NSMutableArray *v8;
  id v9;
  BuddyCloudConfigDisclosureViewController *v10;
  BuddyCloudConfigController *v11;
  id v12;
  UINavigationController *v13;
  id obj;
  id location;
  SEL v16;
  BuddyCloudConfigController *v17;

  v17 = self;
  v16 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  if (!sub_1001A9778(obj))
  {
    v5 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v5, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("BuddyCloudConfigController.m"), 391, CFSTR("This method should only be called with a Software Update error."));

  }
  -[BuddyCloudConfigController setCloudConfigState:](v17, "setCloudConfigState:", 3);
  v6 = (BuddyCloudConfigDisclosureViewController *)location;
  v7 = -[BuddyCloudConfigController disclosureViewController](v17, "disclosureViewController");

  if (v6 != v7)
  {
    v8 = -[BuddyCloudConfigController controllersToRemove](v17, "controllersToRemove");
    -[NSMutableArray addObject:](v8, "addObject:", location);

    v9 = objc_msgSend(location, "navigationController");
    v10 = -[BuddyCloudConfigController disclosureViewController](v17, "disclosureViewController");
    objc_msgSend(v9, "pushViewController:animated:", v10, 0);

  }
  v11 = v17;
  v12 = obj;
  v13 = -[BuddyCloudConfigController navController](v17, "navController");
  -[BuddyCloudConfigController _suggestSoftwareUpdateWithSoftwareUpdateRequiredError:navigationController:](v11, "_suggestSoftwareUpdateWithSoftwareUpdateRequiredError:navigationController:", v12, v13);

  objc_storeStrong(&obj, 0);
  objc_storeStrong(&location, 0);
}

- (void)removeControllersToRemove
{
  NSMutableArray *v3;
  UINavigationController *v4;
  NSMutableArray *v5;

  v3 = -[BuddyCloudConfigController controllersToRemove](self, "controllersToRemove", a2);
  v4 = -[BuddyCloudConfigController navController](self, "navController");
  -[BuddyCloudConfigController removeViewControllers:fromNavHierarchyOf:](self, "removeViewControllers:fromNavHierarchyOf:", v3, v4);

  v5 = -[BuddyCloudConfigController controllersToRemove](self, "controllersToRemove");
  -[NSMutableArray removeAllObjects](v5, "removeAllObjects");

}

+ (Class)disclosureViewControllerClass
{
  return (Class)objc_opt_class(BuddyCloudConfigDisclosureViewController);
}

- (void)_suggestSoftwareUpdateWithSoftwareUpdateRequiredError:(id)a3 navigationController:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _WORD v20[7];
  char v21;
  os_log_t v22;
  os_log_type_t v23;
  os_log_t oslog;
  id v25;
  id v26;
  id v27;
  id v28;
  id location[2];
  BuddyCloudConfigController *v30;
  uint8_t buf[24];

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v5 = objc_msgSend(location[0], "userInfo");
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:", kDMCErrorDetailsSUInfoKey);
  v27 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OSVersion"));

  v7 = objc_msgSend(location[0], "userInfo");
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", kDMCErrorDetailsSUInfoKey);
  v26 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BuildVersion"));

  v9 = objc_msgSend(location[0], "userInfo");
  v10 = objc_msgSend(v9, "objectForKeyedSubscript:", kDMCErrorDetailsSUInfoKey);
  v25 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RequireBetaProgram"));

  oslog = (os_log_t)(id)_BYLoggingFacility(v11);
  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)v25);
    _os_log_impl((void *)&_mh_execute_header, oslog, v23, "Required Beta Program: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v25)
  {
    v12 = objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Token"));
    v13 = objc_opt_class(NSString);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    if ((isKindOfClass & 1) != 0)
    {
      v16 = sub_1001A9C38();
      v17 = objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("Token"));
      objc_msgSend(v16, "enrollInProgramWithMDMToken:completion:", v17, &stru_100284260);

    }
    else
    {
      v22 = (os_log_t)(id)_BYLoggingFacility(v15);
      v21 = 17;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v18 = v22;
        v19 = v21;
        sub_100038C3C(v20);
        _os_log_fault_impl((void *)&_mh_execute_header, v18, v19, "Required Beta Program but no valid token provided, skipping beta enrollment", (uint8_t *)v20, 2u);
      }
      objc_storeStrong((id *)&v22, 0);
    }
  }
  -[BuddyCloudConfigController _suggestSoftwareUpdateWithOSVersion:buildVersion:navigationController:](v30, "_suggestSoftwareUpdateWithOSVersion:buildVersion:navigationController:", v27, v26, v28);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (void)_suggestSoftwareUpdateWithOSVersion:(id)a3 buildVersion:(id)a4 navigationController:(id)a5
{
  BuddyNetworkProvider *v7;
  BFFFlowItemDelegate *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  BuddyCloudConfigController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v10 = objc_alloc_init((Class)SUScanOptions);
  objc_msgSend(v10, "setForced:", 1);
  objc_msgSend(v10, "setIdentifier:", CFSTR("com.apple.purplebuddy.software_update"));
  objc_msgSend(v10, "setRequestedPMV:", location[0]);
  objc_msgSend(v10, "setRequestedBuild:", v12);
  v9 = objc_alloc_init(BuddyMandatoryUpdateController);
  objc_msgSend(v9, "setMdmUpdateOptions:", v10);
  v7 = -[BuddyCloudConfigController networkProvider](v14, "networkProvider");
  objc_msgSend(v9, "setNetworkProvider:", v7);

  v8 = -[BuddyCloudConfigController delegate](v14, "delegate");
  objc_msgSend(v9, "setDelegate:", v8);

  objc_msgSend(v11, "pushViewController:animated:", v9, 1);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->enrollmentCoordinator, a3);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UINavigationController)navController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navController);
}

- (void)setNavController:(id)a3
{
  objc_storeWeak((id *)&self->_navController, a3);
}

- (void)setDisclosureViewController:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureViewController, a3);
}

- (void)setLoginViewController:(id)a3
{
  objc_storeStrong((id *)&self->_loginViewController, a3);
}

- (void)setCloudConfigState:(int)a3
{
  self->_cloudConfigState = a3;
}

- (void)setControllersToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_controllersToRemove, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllersToRemove, 0);
  objc_storeStrong((id *)&self->_loginViewController, 0);
  objc_storeStrong((id *)&self->_disclosureViewController, 0);
  objc_destroyWeak((id *)&self->_navController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
  objc_storeStrong((id *)&self->enrollmentCoordinator, 0);
}

@end
