@implementation BuddyMigrationTargetProgressController

- (BuddyMigrationTargetProgressController)init
{
  UIImage *v3;
  BuddyMigrationTargetProgressController *v4;
  objc_super v6;
  SEL v7;
  id location;

  v7 = a2;
  v3 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Transfer Progress Target"));
  location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationTargetProgressController;
  location = -[BuddyMigrationProgressController initWithTitle:icon:](&v6, "initWithTitle:icon:", &stru_100284738, v3);
  v4 = (BuddyMigrationTargetProgressController *)location;

  objc_storeStrong(&location, 0);
  return v4;
}

- (void)viewDidLoad
{
  NSBundle *v2;
  NSString *v3;
  NSString *v4;
  NSString *v5;
  objc_super v6;
  SEL v7;
  BuddyMigrationTargetProgressController *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMigrationTargetProgressController;
  -[BuddyMigrationTargetProgressController viewDidLoad](&v6, "viewDidLoad");
  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("MIGRATING_TITLE_DESTINATION"), &stru_100284738, CFSTR("Migration"));
  v4 = -[BuddyMigrationTargetProgressController sourceDeviceName](v8, "sourceDeviceName");
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, v4);
  -[BuddyMigrationProgressController setProgressTitle:](v8, "setProgressTitle:", v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  BuddyMigrationTargetProgressController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationTargetProgressController;
  -[BuddyMigrationProgressController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if ((-[BuddyMigrationTargetProgressController isMovingToParentViewController](v8, "isMovingToParentViewController") & 1) != 0)
  {
    v3 = -[BuddyMigrationProgressController miscState](v8, "miscState");
    v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
    -[BuddyTargetDeviceMigrationManager addDelegate:](v4, "addDelegate:", v8);

  }
}

- (void)confirmCancellation:(id)a3
{
  void **v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t, char);
  void *v7;
  id v8;
  id v9;
  id location[2];
  BuddyMigrationTargetProgressController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100135CC4;
  v7 = &unk_100281A80;
  v8 = location[0];
  v9 = +[BuddyMigrationCancelAlertController alertControllerForTargetWithNeedsErase:completion:](BuddyMigrationCancelAlertController, "alertControllerForTargetWithNeedsErase:completion:", 1, &v3);
  -[BuddyMigrationTargetProgressController presentViewController:animated:completion:](v11, "presentViewController:animated:completion:", v9, 1, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelMigration
{
  BuddyMiscState *v2;
  BuddyTargetDeviceMigrationManager *v3;
  BYAnalyticsManager *v4;
  DDRResetService *v5;
  id v6;
  id location;
  objc_super v8;
  SEL v9;
  BuddyMigrationTargetProgressController *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)BuddyMigrationTargetProgressController;
  -[BuddyMigrationProgressController cancelMigration](&v8, "cancelMigration");
  v2 = -[BuddyMigrationProgressController miscState](v10, "miscState");
  v3 = -[BuddyMiscState migrationManager](v2, "migrationManager");
  -[BuddyTargetDeviceMigrationManager cancelWithCause:](v3, "cancelWithCause:", 2);

  v4 = -[BuddyMigrationProgressController analyticsManager](v10, "analyticsManager");
  -[BYAnalyticsManager commitThenUpload](v4, "commitThenUpload");

  location = objc_alloc_init((Class)DDRResetOptions);
  v6 = objc_msgSend(objc_alloc((Class)DDRResetRequest), "initWithMode:options:reason:", 4, location, CFSTR("Migration Cancellation Erase"));
  v5 = +[DDRResetService sharedInstance](DDRResetService, "sharedInstance");
  -[DDRResetService resetWithRequest:completion:](v5, "resetWithRequest:completion:", v6, &stru_100283490);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&location, 0);
}

- (id)createLockscreenController
{
  BuddyMigrationTargetLockscreenController *v2;
  NSString *v3;
  BuddyMigrationTargetLockscreenController *v4;

  v2 = [BuddyMigrationTargetLockscreenController alloc];
  v3 = -[BuddyMigrationProgressController progressTitle](self, "progressTitle", a2);
  v4 = -[BuddyMigrationLockscreenController initWithProgressTitle:](v2, "initWithProgressTitle:", v3);

  return v4;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  char v5;
  ProximitySetupController *v6;
  NSString *v7;
  NSObject *v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  BuddyMigrationTargetProgressController *v14;
  id v15;
  int v16;
  id location[2];
  BuddyMigrationTargetProgressController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationProgressController miscState](v18, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  v5 = -[BuddyTargetDeviceMigrationManager willMigrate](v4, "willMigrate") ^ 1;

  if ((v5 & 1) != 0)
  {
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v16 = 1;
  }
  else
  {
    v6 = -[BuddyMigrationProgressController proximitySetupController](v18, "proximitySetupController");
    v7 = -[ProximitySetupController deviceName](v6, "deviceName");
    -[BuddyMigrationTargetProgressController setSourceDeviceName:](v18, "setSourceDeviceName:", v7);

    v8 = dispatch_get_global_queue(0, 0);
    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_10013626C;
    v13 = &unk_1002806E0;
    v14 = v18;
    v15 = location[0];
    dispatch_async(v8, &v9);

    objc_storeStrong(&v15, 0);
    objc_storeStrong((id *)&v14, 0);
    v16 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  BuddyMiscState *v5;
  BuddyTargetDeviceMigrationManager *v6;
  void *v7;
  void **block;
  int v9;
  int v10;
  void (*v11)(id *);
  void *v12;
  id v13;
  id v14;
  BuddyMigrationTargetProgressController *v15;
  objc_super v16;
  id v17;
  id location[2];
  BuddyMigrationTargetProgressController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver = v19;
  v16.super_class = (Class)BuddyMigrationTargetProgressController;
  -[BuddyMigrationProgressController deviceMigrationManager:didCompleteWithError:](&v16, "deviceMigrationManager:didCompleteWithError:", location[0], v17);
  v5 = -[BuddyMigrationProgressController miscState](v19, "miscState");
  v6 = -[BuddyMiscState migrationManager](v5, "migrationManager");
  -[BuddyTargetDeviceMigrationManager removeDelegate:](v6, "removeDelegate:", v19);

  if (v17)
  {
    v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_100136518;
    v12 = &unk_100281000;
    v13 = v17;
    v14 = location[0];
    v15 = v19;
    dispatch_async((dispatch_queue_t)v7, &block);

    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (NSString)sourceDeviceName
{
  return self->_sourceDeviceName;
}

- (void)setSourceDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDeviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDeviceName, 0);
}

@end
