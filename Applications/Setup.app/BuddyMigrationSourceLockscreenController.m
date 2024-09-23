@implementation BuddyMigrationSourceLockscreenController

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  void *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BuddyMigrationSourceLockscreenController *v12;
  objc_super v13;
  id v14;
  id location[2];
  BuddyMigrationSourceLockscreenController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13.receiver = v16;
  v13.super_class = (Class)BuddyMigrationSourceLockscreenController;
  -[BuddyMigrationLockscreenController deviceMigrationManager:didCompleteWithError:](&v13, "deviceMigrationManager:didCompleteWithError:", location[0], v14);
  v5 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_100167490;
  v10 = &unk_100280D00;
  v11 = v14;
  v12 = v16;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (BuddyMigrationSourceLockscreenErrorController)errorController
{
  return self->_errorController;
}

- (void)setErrorController:(id)a3
{
  objc_storeStrong((id *)&self->_errorController, a3);
}

- (BuddyMigrationLockscreenFinishedController)finishedController
{
  return self->_finishedController;
}

- (void)setFinishedController:(id)a3
{
  objc_storeStrong((id *)&self->_finishedController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedController, 0);
  objc_storeStrong((id *)&self->_errorController, 0);
}

@end
