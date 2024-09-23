@implementation BuddyMigrationSourceProgressController

- (BuddyMigrationSourceProgressController)init
{
  NSBundle *v3;
  NSString *v4;
  UIImage *v5;
  BuddyMigrationSourceProgressController *v6;
  objc_super v8;
  SEL v9;
  id location;

  v9 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MIGRATING_TITLE_SOURCE"), &stru_100284738, CFSTR("Migration"));
  v5 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Transfer Progress Source"));
  location = 0;
  v8.receiver = self;
  v8.super_class = (Class)BuddyMigrationSourceProgressController;
  location = -[BuddyMigrationSourceProgressController initWithTitle:detailText:icon:](&v8, "initWithTitle:detailText:icon:", v4, 0, v5);
  v6 = (BuddyMigrationSourceProgressController *)location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  BuddyMigrationSourceProgressController *v4;
  BYBuddyDaemonMigrationSourceClient *v5;
  BYBuddyDaemonMigrationSourceClient *v6;
  void **v7;
  int v8;
  int v9;
  void (*v10)(id *, void *);
  void *v11;
  BuddyMigrationSourceProgressController *v12;
  objc_super v13;
  BOOL v14;
  SEL v15;
  BuddyMigrationSourceProgressController *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BuddyMigrationSourceProgressController;
  -[BuddyMigrationSourceProgressController viewWillAppear:](&v13, "viewWillAppear:", a3);
  if ((-[BuddyMigrationSourceProgressController isMovingToParentViewController](v16, "isMovingToParentViewController") & 1) != 0)
  {
    v3 = objc_alloc_init((Class)BYBuddyDaemonMigrationSourceClient);
    -[BuddyMigrationSourceProgressController setMigrationSourceClient:](v16, "setMigrationSourceClient:", v3);

    v4 = v16;
    v5 = -[BuddyMigrationSourceProgressController migrationSourceClient](v16, "migrationSourceClient");
    -[BYBuddyDaemonMigrationSourceClient setDelegate:](v5, "setDelegate:", v4);

    v6 = -[BuddyMigrationSourceProgressController migrationSourceClient](v16, "migrationSourceClient");
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_10017794C;
    v11 = &unk_100283DB8;
    v12 = v16;
    -[BYBuddyDaemonMigrationSourceClient registerAsUserInterfaceHost:](v6, "registerAsUserInterfaceHost:", &v7);

    objc_storeStrong((id *)&v12, 0);
  }
}

- (NSString)internalStatistics
{
  return (NSString *)-[BuddyMigrationSourceProgressController internalProgressText](self, "internalProgressText", a2, self);
}

- (void)confirmCancellation:(id)a3
{
  id v3;
  id v4;
  id location[2];
  BuddyMigrationSourceProgressController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = +[BuddyMigrationCancelAlertController alertControllerForSource:](BuddyMigrationCancelAlertController, "alertControllerForSource:", location[0]);
  -[BuddyMigrationSourceProgressController presentViewController:animated:completion:](v6, "presentViewController:animated:completion:", v3, 1, 0, v3);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelMigration
{
  NSObject *v2;
  BuddyMigrationSourceProgressController *v3;
  NSError *v4;
  void **block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  BuddyMigrationSourceProgressController *v10;
  objc_super v11;
  SEL v12;
  BuddyMigrationSourceProgressController *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyMigrationSourceProgressController;
  -[BuddyMigrationProgressController cancelMigration](&v11, "cancelMigration");
  v2 = dispatch_get_global_queue(2, 0);
  block = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100177CF8;
  v9 = &unk_100280730;
  v10 = v13;
  dispatch_async(v2, &block);

  v3 = v13;
  v4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), 202, 0);
  -[BuddyMigrationSourceProgressController deviceMigrationManager:didCompleteWithError:](v3, "deviceMigrationManager:didCompleteWithError:", 0, v4);

  objc_storeStrong((id *)&v10, 0);
}

- (id)createLockscreenController
{
  BuddyMigrationSourceLockscreenController *v2;
  NSString *v3;
  BuddyMigrationSourceLockscreenController *v4;

  v2 = [BuddyMigrationSourceLockscreenController alloc];
  v3 = -[BuddyMigrationProgressController progressTitle](self, "progressTitle", a2);
  v4 = -[BuddyMigrationLockscreenController initWithProgressTitle:](v2, "initWithProgressTitle:", v3);

  return v4;
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  void *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddyMigrationSourceProgressController *v11;
  id v12;
  objc_super v13;
  id v14;
  id location[2];
  BuddyMigrationSourceProgressController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13.receiver = v16;
  v13.super_class = (Class)BuddyMigrationSourceProgressController;
  -[BuddyMigrationProgressController deviceMigrationManager:didCompleteWithError:](&v13, "deviceMigrationManager:didCompleteWithError:", location[0], v14);
  v5 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_100177EEC;
  v10 = &unk_100280D00;
  v11 = v16;
  v12 = v14;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BYBuddyDaemonMigrationSourceClient)migrationSourceClient
{
  return self->_migrationSourceClient;
}

- (void)setMigrationSourceClient:(id)a3
{
  objc_storeStrong((id *)&self->_migrationSourceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationSourceClient, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
