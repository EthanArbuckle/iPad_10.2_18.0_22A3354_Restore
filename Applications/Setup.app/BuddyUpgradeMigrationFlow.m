@implementation BuddyUpgradeMigrationFlow

- (BuddyUpgradeMigrationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddyUpgradeMigrationFlow *v10;
  NSArray *v11;
  BuddyUpgradeMigrationFlow *v12;
  objc_super v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  id v19;
  _QWORD v20[3];

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15 = 0;
  objc_storeStrong(&v15, a6);
  v9 = v19;
  v19 = 0;
  v14.receiver = v9;
  v14.super_class = (Class)BuddyUpgradeMigrationFlow;
  v10 = -[BuddyUpgradeMigrationFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v14, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v17, v16, v15);
  v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    v20[0] = objc_opt_class(BuddyMigrationReconnectController);
    v20[1] = objc_opt_class(BuddyMigrationPreparationController);
    v20[2] = objc_opt_class(BuddyMigrationTargetProgressController);
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3);
    objc_msgSend(v19, "setClassList:", v11);

  }
  v12 = (BuddyUpgradeMigrationFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

+ (BOOL)controllerNeedsToRunWithPreferences:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t buf[15];
  char v7;
  os_log_t oslog;
  id v9;
  id location[3];
  char v11;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = +[BuddyMigrationState loadFromPreferences:](BuddyMigrationState, "loadFromPreferences:", location[0]);
  if (v9)
  {
    v11 = 1;
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(0);
    v7 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v3 = oslog;
      v4 = v7;
      sub_100038C3C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "No migration state found on disk!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    +[BuddyMigrationState removeFromPreferences:](BuddyMigrationState, "removeFromPreferences:", location[0]);
    v11 = 0;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

+ (id)allowedFlowItems
{
  _QWORD v5[3];

  v5[0] = objc_opt_class(BuddyMigrationPreparationController);
  v5[1] = objc_opt_class(BuddyMigrationReconnectController);
  v5[2] = objc_opt_class(BuddyMigrationTargetProgressController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

@end
