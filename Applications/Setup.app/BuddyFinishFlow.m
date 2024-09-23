@implementation BuddyFinishFlow

- (BuddyFinishFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddyFinishFlow *v10;
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
  v12.super_class = (Class)BuddyFinishFlow;
  v17 = -[BuddyFinishFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v12, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v15, v14, v13);
  objc_storeStrong(&v17, v17);
  if (v17)
    objc_msgSend(v17, "_updateClassList");
  v10 = (BuddyFinishFlow *)v17;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v17, 0);
  return v10;
}

+ (id)allowedFlowItems
{
  _QWORD v5[3];

  v5[0] = objc_opt_class(BuddyAppStoreController);
  v5[1] = objc_opt_class(BuddyAppStoreCoverSheetController);
  v5[2] = objc_opt_class(BuddyFinishedController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

- (void)startFlowAnimated:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyFinishFlow *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  -[BuddyFinishFlow _updateClassList](self, "_updateClassList");
  v3.receiver = v6;
  v3.super_class = (Class)BuddyFinishFlow;
  -[BuddyFinishFlow startFlowAnimated:](&v3, "startFlowAnimated:", v4);
}

- (void)_updateClassList
{
  BuddySuspendTask *v2;
  NSURL *v3;
  unsigned __int8 v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  BYPreferencesController *v8;
  uint64_t v10;
  _QWORD v11[3];

  v2 = -[BuddyFinishFlow suspendTask](self, "suspendTask");
  v3 = -[BuddySuspendTask launchURL](v2, "launchURL");
  v7 = 0;
  v4 = 0;
  if (v3)
  {
    v8 = -[BuddyFinishFlow buddyPreferencesExcludedFromBackup](self, "buddyPreferencesExcludedFromBackup");
    v7 = 1;
    v4 = +[BuddySuspendTask hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:](BuddySuspendTask, "hasSuspendTaskWithBuddyPreferencesExcludedFromBackup:");
  }
  if ((v7 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v11[0] = objc_opt_class(BuddyAppStoreCoverSheetController);
    v11[1] = objc_opt_class(BuddyFinishedController);
    v11[2] = objc_opt_class(BuddyAppStoreController);
    v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3);
    -[BuddyFinishFlow setClassList:](self, "setClassList:", v5);

  }
  else
  {
    v10 = objc_opt_class(BuddyFinishedController);
    v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1);
    -[BuddyFinishFlow setClassList:](self, "setClassList:", v6);

  }
}

- (unint64_t)allowedTerminationSources
{
  return 3;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  char v3;
  uint64_t v4;
  NSString *v5;
  NSObject *v6;
  os_log_type_t v7;
  _TtP5Setup20LockdownModeProvider_ *v8;
  unsigned __int8 v9;
  BYRunState *v10;
  unsigned __int8 v11;
  _TtC5Setup28SetupUserDispositionProvider *v12;
  BuddySetupMethod *v13;
  id v14;
  id v15;
  id v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(NSObject *, char, id);
  void *v21;
  BuddyFinishFlow *v22;
  id v23;
  id v24;
  int v25;
  uint8_t v26[7];
  char v27;
  os_log_t v28;
  char v29;
  id v30;
  char v31;
  id v32;
  os_log_type_t v33;
  os_log_t oslog;
  id obj;
  char v36;
  id v37;
  id location[2];
  BuddyFinishFlow *v39;
  uint8_t buf[24];

  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  v36 = 0;
  obj = 0;
  v3 = SADSUninstallIneligibleAppsWithError(&obj);
  objc_storeStrong(&v37, obj);
  v36 = v3 & 1;
  if ((v3 & 1) != 0 || !v37)
  {
    if ((v36 & 1) == 0)
    {
      v28 = (os_log_t)(id)_BYLoggingFacility(v4);
      v27 = 16;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v6 = v28;
        v7 = v27;
        sub_100038C3C(v26);
        _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "Error deleting ineligible apps but no error provided.", v26, 2u);
      }
      objc_storeStrong((id *)&v28, 0);
    }
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v4);
    v33 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v31 = 0;
      v29 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v5 = (NSString *)v37;
      }
      else if (v37)
      {
        v32 = objc_msgSend(v37, "domain");
        v31 = 1;
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v32, objc_msgSend(v37, "code"));
        v30 = v5;
        v29 = 1;
      }
      else
      {
        v5 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v5);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v33, "Error deleting ineligible apps: %{public}@", buf, 0xCu);
      if ((v29 & 1) != 0)

      if ((v31 & 1) != 0)
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  if (location[0])
  {
    v8 = -[BuddyFinishFlow lockdownModeProvider](v39, "lockdownModeProvider");
    v9 = -[LockdownModeProvider hasStagedEnablement](v8, "hasStagedEnablement");

    if ((v9 & 1) != 0)
    {
      (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
      v25 = 1;
    }
    else
    {
      v10 = -[BuddyFinishFlow runState](v39, "runState");
      v11 = -[BYRunState hasCompletedInitialRun](v10, "hasCompletedInitialRun");

      if ((v11 & 1) != 0)
      {
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
        v25 = 1;
      }
      else
      {
        v24 = +[BYDevice currentDevice](BYDevice, "currentDevice");
        v12 = -[BuddyFinishFlow userDispositionProvider](v39, "userDispositionProvider");
        v13 = -[BuddyFinishFlow setupMethod](v39, "setupMethod");
        v14 = -[BuddySetupMethod dataTransferMethod](v13, "dataTransferMethod");
        v15 = objc_msgSend(v24, "deviceClass");
        v16 = objc_msgSend(v24, "serialNumber");
        v17 = _NSConcreteStackBlock;
        v18 = -1073741824;
        v19 = 0;
        v20 = sub_1001199A0;
        v21 = &unk_1002831A0;
        v22 = v39;
        v23 = location[0];
        -[SetupUserDispositionProvider isNewUserWithDataTransferMethod:deviceClass:serialNumber:completionHandler:](v12, "isNewUserWithDataTransferMethod:deviceClass:serialNumber:completionHandler:", v14, v15, v16, &v17);

        objc_storeStrong(&v23, 0);
        objc_storeStrong((id *)&v22, 0);
        objc_storeStrong(&v24, 0);
        v25 = 0;
      }
    }
  }
  else
  {
    v25 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
  objc_storeStrong((id *)&self->_suspendTask, a3);
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, a3);
}

- (_TtC5Setup28SetupUserDispositionProvider)userDispositionProvider
{
  return self->_userDispositionProvider;
}

- (void)setUserDispositionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userDispositionProvider, a3);
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (_TtP5Setup20LockdownModeProvider_)lockdownModeProvider
{
  return self->_lockdownModeProvider;
}

- (void)setLockdownModeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownModeProvider, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_setupMethod, 0);
  objc_storeStrong((id *)&self->_userDispositionProvider, 0);
  objc_storeStrong((id *)&self->_buddyPreferencesExcludedFromBackup, 0);
  objc_storeStrong((id *)&self->_suspendTask, 0);
}

@end
