@implementation BuddyManagedConfigurationMigrationController

- (BuddyManagedConfigurationMigrationController)init
{
  NSBundle *v3;
  id v4;
  NSString *v5;
  BuddyManagedConfigurationMigrationController *v6;
  id location;

  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle", a2, self);
  v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("COMPLETING_SETUP"));
  v5 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4, &stru_100284738, CFSTR("Localizable"));
  location = -[BuddyManagedConfigurationMigrationController initWithSpinnerText:](self, "initWithSpinnerText:", v5);
  v6 = (BuddyManagedConfigurationMigrationController *)location;

  objc_storeStrong(&location, 0);
  return v6;
}

- (void)loadView
{
  id v2;
  objc_super v3;
  SEL v4;
  BuddyManagedConfigurationMigrationController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyManagedConfigurationMigrationController;
  -[BuddyManagedConfigurationMigrationController loadView](&v3, "loadView");
  v2 = -[BuddyManagedConfigurationMigrationController navigationItem](v5, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  dispatch_time_t v3;
  void *v4;
  NSObject *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9);
  void *v10;
  BuddyManagedConfigurationMigrationController *v11;
  id v12;
  void **block;
  int v14;
  int v15;
  uint64_t (*v16);
  void *v17;
  BuddyManagedConfigurationMigrationController *v18;
  id v19;
  id location[2];
  BuddyManagedConfigurationMigrationController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyManagedConfigurationMigrationController setWaitingForMigration:](v21, "setWaitingForMigration:", 1);
  v3 = dispatch_time(0, 2000000000);
  v4 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v14 = -1073741824;
  v15 = 0;
  v16 = sub_10016B0C0;
  v17 = &unk_1002806E0;
  v18 = v21;
  v19 = location[0];
  dispatch_after(v3, (dispatch_queue_t)v4, &block);

  v5 = dispatch_get_global_queue(0, 0);
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10016B19C;
  v10 = &unk_1002806E0;
  v11 = v21;
  v12 = location[0];
  dispatch_async(v5, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BOOL)isPaneVisible
{
  return self->_paneVisible;
}

- (void)setPaneVisible:(BOOL)a3
{
  self->_paneVisible = a3;
}

- (BOOL)waitingForMigration
{
  return self->_waitingForMigration;
}

- (void)setWaitingForMigration:(BOOL)a3
{
  self->_waitingForMigration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end
