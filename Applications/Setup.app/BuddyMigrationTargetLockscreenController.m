@implementation BuddyMigrationTargetLockscreenController

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  void *v5;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddyMigrationTargetLockscreenController *v11;
  id v12;
  int v13;
  objc_super v14;
  id v15;
  id location[2];
  BuddyMigrationTargetLockscreenController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14.receiver = v17;
  v14.super_class = (Class)BuddyMigrationTargetLockscreenController;
  -[BuddyMigrationLockscreenController deviceMigrationManager:didCompleteWithError:](&v14, "deviceMigrationManager:didCompleteWithError:", location[0], v15);
  if (v15)
  {
    v5 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v7 = -1073741824;
    v8 = 0;
    v9 = sub_1000760C4;
    v10 = &unk_100280D00;
    v11 = v17;
    v12 = v15;
    dispatch_async((dispatch_queue_t)v5, &block);

    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (BuddyMigrationTargetLockscreenErrorController)errorController
{
  return self->_errorController;
}

- (void)setErrorController:(id)a3
{
  objc_storeStrong((id *)&self->_errorController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorController, 0);
}

@end
