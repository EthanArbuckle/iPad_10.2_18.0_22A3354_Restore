@implementation BuddyDemoController

- (void)_setupCompleted:(BOOL)a3
{
  NSObject *v3;
  os_log_type_t v4;
  BuddyActivationRecord *v5;
  unsigned __int8 v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_log_type_t v9;
  BuddyMiscState *v10;
  MSDWelcomeViewController *v11;
  id v12;
  MSDWelcomeViewController *v13;
  _BYTE *v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  NSIndexSet *v19;
  BFFFlowItemDelegate *v20;
  BFFFlowItemDelegate *v21;
  id location;
  _BYTE *v23;
  id v24;
  uint8_t v25[7];
  char v26;
  os_log_t v27;
  char v28;
  id v29;
  uint8_t buf[15];
  os_log_type_t v31;
  os_log_t oslog;
  BOOL v33;
  SEL v34;
  BuddyDemoController *v35;
  char *v36;
  id v37;
  id v38;
  char *v39;

  v35 = self;
  v34 = a2;
  v33 = a3;
  if (a3)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(self);
    v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog;
      v4 = v31;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Demo setup completed", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v5 = -[BuddyDemoController activationRecord](v35, "activationRecord");
    v28 = 0;
    v6 = 1;
    if (!-[BuddyActivationRecord impliesEarlyExit](v5, "impliesEarlyExit"))
    {
      v29 = -[BuddyDemoController deviceConfiguration](v35, "deviceConfiguration");
      v28 = 1;
      v6 = objc_msgSend(v29, "inStoreDemoMode");
    }
    if ((v28 & 1) != 0)

    if ((v6 & 1) != 0)
    {
      v7 = (void (**)(_QWORD))-[BuddyDemoController exitBuddyForDemoSetUpBlock](v35, "exitBuddyForDemoSetUpBlock");
      v7[2](v7);

      return;
    }
  }
  else
  {
    v27 = (os_log_t)(id)_BYLoggingFacility(self);
    v26 = 16;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v8 = v27;
      v9 = v26;
      sub_100038C3C(v25);
      _os_log_error_impl((void *)&_mh_execute_header, v8, v9, "Demo setup failed!", v25, 2u);
    }
    objc_storeStrong((id *)&v27, 0);
  }
  v10 = -[BuddyDemoController miscState](v35, "miscState");
  -[BuddyMiscState setCompletedDemoSetup:](v10, "setCompletedDemoSetup:", 1);

  v11 = -[BuddyDemoController demoViewController](v35, "demoViewController");
  v24 = -[MSDWelcomeViewController navigationController](v11, "navigationController");

  v12 = objc_msgSend(v24, "viewControllers");
  v13 = -[BuddyDemoController demoViewController](v35, "demoViewController");
  v14 = objc_msgSend(v12, "indexOfObject:", v13);

  v23 = v14;
  v15 = objc_msgSend(v24, "viewControllers");
  v16 = v14;
  v17 = objc_msgSend(v24, "viewControllers");
  v18 = (char *)objc_msgSend(v17, "count");
  v37 = v16;
  v36 = (char *)(v18 - v23);
  v38 = v16;
  v39 = (char *)(v18 - v23);
  v19 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v16, v18 - v23);
  location = objc_msgSend(v15, "objectsAtIndexes:", v19);

  v20 = -[BuddyDemoController delegate](v35, "delegate");
  -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v20, "removeViewControllersOnNextPush:", location);

  v21 = -[BuddyDemoController delegate](v35, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v21, "flowItemDone:", v35);

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v24, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (BOOL)controllerNeedsToRun
{
  BYRunState *v2;
  char v3;
  BYDeviceConfiguration *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  MCProfileConnection *v9;
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  BuddyMiscState *v14;
  unsigned __int8 v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _WORD v20[3];
  os_log_type_t v21;
  os_log_t v22;
  uint8_t v23[7];
  os_log_type_t v24;
  os_log_t v25;
  uint8_t buf[7];
  os_log_type_t v27;
  os_log_t oslog;
  char v29;
  id v30;
  char v31;
  SEL v32;
  BuddyDemoController *v33;

  v33 = self;
  v32 = a2;
  v2 = -[BuddyDemoController runState](self, "runState");
  v3 = 0;
  if ((-[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun") & 1) != 0)
    v3 = BYIsRunningInStoreDemoMode() ^ 1;

  if ((v3 & 1) != 0)
    return 0;
  v31 = 0;
  v4 = -[BuddyDemoController deviceConfiguration](v33, "deviceConfiguration");
  v29 = 0;
  v5 = 1;
  if ((-[BYDeviceConfiguration inStoreDemoMode](v4, "inStoreDemoMode") & 1) == 0)
  {
    v30 = -[BuddyDemoController activationRecord](v33, "activationRecord");
    v29 = 1;
    v5 = objc_msgSend(v30, "impliesDemod");
  }
  if ((v29 & 1) != 0)

  v31 = v5 & 1;
  if ((v5 & 1) != 0)
  {
    v9 = -[BuddyDemoController managedConfiguration](v33, "managedConfiguration");
    v10 = -[MCProfileConnection activationRecordIndicatesCloudConfigurationIsAvailable](v9, "activationRecordIndicatesCloudConfigurationIsAvailable");

    if ((v10 & 1) != 0)
    {
      v25 = (os_log_t)(id)_BYLoggingFacility(v11);
      v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v25;
        v13 = v24;
        sub_100038C3C(v23);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Skipping demo setup due to cloud configuration", v23, 2u);
      }
      objc_storeStrong((id *)&v25, 0);
      return 0;
    }
    else
    {
      v14 = -[BuddyDemoController miscState](v33, "miscState");
      v15 = -[BuddyMiscState completedDemoSetup](v14, "completedDemoSetup");

      if ((v15 & 1) != 0)
      {
        v22 = (os_log_t)(id)_BYLoggingFacility(v16);
        v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v22;
          v18 = v21;
          sub_100038C3C(v20);
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "Skipping demo setup because it has completed", (uint8_t *)v20, 2u);
        }
        objc_storeStrong((id *)&v22, 0);
        return 0;
      }
      else
      {
        return 1;
      }
    }
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v27;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Skipping demo setup because this isn't a demo device", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 0;
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(sub_10013A310(), "needsToRun:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)isEphemeral
{
  return 1;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return 1;
}

- (id)viewController
{
  MSDWelcomeViewController *v2;
  id v3;
  MSDWelcomeViewController *v4;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, char);
  void *v10;
  id v11;
  id location[2];
  BuddyDemoController *v13;
  MSDWelcomeViewController *v14;

  v13 = self;
  location[1] = (id)a2;
  v2 = -[BuddyDemoController demoViewController](self, "demoViewController");

  if (v2)
  {
    v14 = -[BuddyDemoController demoViewController](v13, "demoViewController");
  }
  else
  {
    objc_initWeak(location, v13);
    v3 = objc_alloc_init((Class)sub_10013A310());
    -[BuddyDemoController setDemoViewController:](v13, "setDemoViewController:", v3);

    v6 = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_10013A5AC;
    v10 = &unk_1002807D0;
    objc_copyWeak(&v11, location);
    v4 = -[BuddyDemoController demoViewController](v13, "demoViewController");
    -[MSDWelcomeViewController setCompletionHandler:](v4, "setCompletionHandler:", &v6);

    v14 = -[BuddyDemoController demoViewController](v13, "demoViewController");
    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  return v14;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyActivationRecord)activationRecord
{
  return self->_activationRecord;
}

- (void)setActivationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_activationRecord, a3);
}

- (id)exitBuddyForDemoSetUpBlock
{
  return self->_exitBuddyForDemoSetUpBlock;
}

- (void)setExitBuddyForDemoSetUpBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BYDeviceConfiguration)deviceConfiguration
{
  return self->_deviceConfiguration;
}

- (void)setDeviceConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_deviceConfiguration, a3);
}

- (MSDWelcomeViewController)demoViewController
{
  return self->_demoViewController;
}

- (void)setDemoViewController:(id)a3
{
  objc_storeStrong((id *)&self->_demoViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoViewController, 0);
  objc_storeStrong((id *)&self->_deviceConfiguration, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong(&self->_exitBuddyForDemoSetUpBlock, 0);
  objc_storeStrong((id *)&self->_activationRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
