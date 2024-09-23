@implementation BuddyScreenTimeController

+ (void)setScreenTimeEnabled:(BOOL)a3 presented:(BOOL)a4 buddyPreferences:(id)a5
{
  unsigned __int8 v5;
  uint64_t v6;
  id v7;
  NSNumber *v8;
  os_log_t oslog;
  id obj;
  id v11;
  id v12;
  id location;
  BOOL v14;
  BOOL v15;
  SEL v16;
  id v17;
  uint8_t buf[24];

  v17 = a1;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v12 = objc_alloc_init((Class)STManagementState);
  v11 = 0;
  obj = 0;
  v5 = objc_msgSend(v12, "setScreenTimeEnabled:error:", v15, &obj);
  objc_storeStrong(&v11, obj);
  if ((v5 & 1) == 0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v6);
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100039500((uint64_t)buf, (uint64_t)v11);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to set Screen Time enabled: %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v7 = location;
  v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14);
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("ScreenTimePresented"));

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearScreenTimeSetting:(id)a3
{
  void *v3;
  id location[2];
  id v5;

  v5 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class(v5);
  objc_msgSend(v3, "setScreenTimeEnabled:presented:buddyPreferences:", 0, 0, location[0]);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipScreenTime;
}

+ (unint64_t)applicableDispositions
{
  return 4;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  BYPreferencesController *v2;
  unsigned __int8 v3;
  BOOL v4;
  char v6;
  BYCapabilities *v7;
  BOOL v9;

  v2 = -[BuddyScreenTimeController buddyPreferences](self, "buddyPreferences");
  v3 = -[BYPreferencesController BOOLForKey:](v2, "BOOLForKey:", CFSTR("ScreenTimePresented"));

  v6 = 0;
  v4 = 0;
  if ((v3 & 1) == 0)
  {
    v7 = -[BuddyScreenTimeController capabilities](self, "capabilities");
    v6 = 1;
    v4 = (-[BYCapabilities isScreenTimeRestricted](v7, "isScreenTimeRestricted") & 1) == 0;
  }
  v9 = v4;
  if ((v6 & 1) != 0)

  return v9;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v3;
  STManagementState *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, id);
  void *v9;
  id v10;
  id v11[3];
  id from;
  id location[2];
  BuddyScreenTimeController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_alloc_init((Class)STManagementState);
  -[BuddyScreenTimeController setManagementState:](v14, "setManagementState:", v3);

  objc_initWeak(&from, v14);
  v4 = -[BuddyScreenTimeController managementState](v14, "managementState");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000EF6C4;
  v9 = &unk_100282CA8;
  objc_copyWeak(v11, &from);
  v10 = location[0];
  -[STManagementState screenTimeStateWithCompletionHandler:](v4, "screenTimeStateWithCompletionHandler:", &v5);

  objc_storeStrong(&v10, 0);
  objc_destroyWeak(v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return -[BuddyScreenTimeController screenTimeViewController](self, "screenTimeViewController", a2, self);
}

- (void)setScreenTimeEnabled:(BOOL)a3
{
  STSetupAssistantViewController *v3;
  objc_class *v4;
  NSString *v5;
  STSetupAssistantViewController *v6;
  id v7;
  id v8;
  STManagementState *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  BOOL v16;
  id location;
  BOOL v18;
  SEL v19;
  BuddyScreenTimeController *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  v3 = -[BuddyScreenTimeController screenTimeViewController](self, "screenTimeViewController");
  v4 = (objc_class *)objc_opt_class(v20);
  v5 = NSStringFromClass(v4);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManager, "startAnimatingSpinnerFor:identifier:", v3, v5);

  v6 = -[BuddyScreenTimeController screenTimeViewController](v20, "screenTimeViewController");
  v7 = -[STSetupAssistantViewController view](v6, "view");
  v8 = objc_msgSend(v7, "window");
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);

  objc_initWeak(&location, v20);
  v9 = -[BuddyScreenTimeController managementState](v20, "managementState");
  LOBYTE(v8) = v18;
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_1000EFA98;
  v14 = &unk_100282CF8;
  objc_copyWeak(&v15, &location);
  v16 = v18;
  -[STManagementState setScreenTimeEnabled:completionHandler:](v9, "setScreenTimeEnabled:completionHandler:", v8 & 1, &v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)controllerWasPopped
{
  BYPreferencesController *v2;
  BYPaneFeatureAnalyticsManager *v3;

  v2 = -[BuddyScreenTimeController buddyPreferences](self, "buddyPreferences", a2);
  -[BYPreferencesController setObject:forKey:](v2, "setObject:forKey:", &__kCFBooleanFalse, CFSTR("ScreenTimePresented"));

  v3 = -[BuddyScreenTimeController paneFeatureAnalyticsManager](self, "paneFeatureAnalyticsManager");
  -[BYPaneFeatureAnalyticsManager clearActionForFeature:](v3, "clearActionForFeature:", 0);

}

- (void)continueSetup
{
  -[BuddyScreenTimeController setScreenTimeEnabled:](self, "setScreenTimeEnabled:", 1, a2, self);
}

- (void)setupSkipped
{
  BYRunState *v2;
  unsigned __int8 v3;
  BYPreferencesController *v4;
  BFFFlowItemDelegate *v5;

  v2 = -[BuddyScreenTimeController runState](self, "runState");
  v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun");

  if ((v3 & 1) != 0)
  {
    v4 = -[BuddyScreenTimeController buddyPreferences](self, "buddyPreferences");
    -[BYPreferencesController setObject:forKey:](v4, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("ScreenTimePresented"));

    v5 = -[BuddyScreenTimeController delegate](self, "delegate");
    -[BFFFlowItemDelegate flowItemDone:](v5, "flowItemDone:", self);

  }
  else
  {
    -[BuddyScreenTimeController setScreenTimeEnabled:](self, "setScreenTimeEnabled:", 0);
  }
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_settingsManager, a3);
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, a3);
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (STSetupAssistantViewController)screenTimeViewController
{
  return self->_screenTimeViewController;
}

- (void)setScreenTimeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeViewController, a3);
}

- (int64_t)screenTimeState
{
  return self->_screenTimeState;
}

- (void)setScreenTimeState:(int64_t)a3
{
  self->_screenTimeState = a3;
}

- (STManagementState)managementState
{
  return self->_managementState;
}

- (void)setManagementState:(id)a3
{
  objc_storeStrong((id *)&self->_managementState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_screenTimeViewController, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_paneFeatureAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
