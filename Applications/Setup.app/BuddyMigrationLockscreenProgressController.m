@implementation BuddyMigrationLockscreenProgressController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  id v2;
  UIImage *v3;
  id v4;
  objc_super v5;
  SEL v6;
  BuddyMigrationLockscreenProgressController *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationLockscreenProgressController;
  -[BuddyMigrationLockscreenProgressController loadView](&v5, "loadView");
  v2 = -[BuddyMigrationLockscreenProgressController headerView](v7, "headerView");
  v3 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Lock"));
  objc_msgSend(v2, "setIcon:accessibilityLabel:", v3, 0);

  v4 = -[BuddyMigrationLockscreenProgressController headerView](v7, "headerView");
  objc_msgSend(v4, "setIconInheritsTint:", 1);

}

- (void)setTitle:(id)a3
{
  id v3;
  id location[2];
  BuddyMigrationLockscreenProgressController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyMigrationLockscreenProgressController loadViewIfNeeded](v5, "loadViewIfNeeded");
  v3 = -[BuddyMigrationLockscreenProgressController headerView](v5, "headerView");
  objc_msgSend(v3, "setTitle:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didChangeConnectionInformation:(id)a4
{
  void *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddyMigrationLockscreenProgressController *v11;
  id v12;
  id v13;
  id location[2];
  BuddyMigrationLockscreenProgressController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_1001C4070;
  v10 = &unk_100280D00;
  v11 = v15;
  v12 = v13;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didUpdateProgress:(id)a4
{
  void *v5;
  void **v6;
  int v7;
  int v8;
  id (*v9)(uint64_t);
  void *v10;
  BuddyMigrationLockscreenProgressController *v11;
  id v12;
  id v13;
  id location[2];
  BuddyMigrationLockscreenProgressController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v5 = &_dispatch_main_q;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_1001C433C;
  v10 = &unk_100280D00;
  v11 = v15;
  v12 = v13;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)deviceMigrationManager:(id)a3 didCompleteWithError:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
