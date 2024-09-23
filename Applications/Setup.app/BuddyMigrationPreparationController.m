@implementation BuddyMigrationPreparationController

- (BuddyMigrationPreparationController)init
{
  NSBundle *v3;
  NSString *v4;
  id v5;
  id v6;
  BuddyMigrationPreparationController *v7;
  objc_super v9;
  SEL v10;
  id location;

  v10 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("MIGRATION_PREPARING"), &stru_100284738, CFSTR("Migration"));
  location = 0;
  v9.receiver = self;
  v9.super_class = (Class)BuddyMigrationPreparationController;
  location = -[BuddyMigrationPreparationController initWithSpinnerText:](&v9, "initWithSpinnerText:", v4);
  objc_storeStrong(&location, location);

  if (location)
  {
    v5 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v5, "setTitle:", &stru_100284738);

    v6 = objc_msgSend(location, "navigationItem");
    objc_msgSend(v6, "setHidesBackButton:animated:", 1, 0);

  }
  v7 = (BuddyMigrationPreparationController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  unsigned __int8 v5;
  dispatch_time_t v6;
  void *v7;
  NSObject *v8;
  void **v9;
  int v10;
  int v11;
  id (*v12)(uint64_t);
  void *v13;
  BuddyMigrationPreparationController *v14;
  void **block;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  BuddyMigrationPreparationController *v20;
  id v21;
  int v22;
  id location[2];
  BuddyMigrationPreparationController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationPreparationController miscState](v24, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  v5 = -[BuddyTargetDeviceMigrationManager requiresUpdateToMigrate](v4, "requiresUpdateToMigrate");

  if ((v5 & 1) != 0)
  {
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
    v22 = 1;
  }
  else
  {
    -[BuddyMigrationPreparationController setWaiting:](v24, "setWaiting:", 1);
    v6 = dispatch_time(0, 2000000000);
    v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v16 = -1073741824;
    v17 = 0;
    v18 = sub_10007B204;
    v19 = &unk_1002806E0;
    v20 = v24;
    v21 = location[0];
    dispatch_after(v6, (dispatch_queue_t)v7, &block);

    -[BuddyMigrationPreparationController setExtendedInitializationCompletion:](v24, "setExtendedInitializationCompletion:", location[0]);
    v8 = dispatch_get_global_queue(0, 0);
    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_10007B278;
    v13 = &unk_100280730;
    v14 = v24;
    dispatch_async(v8, &v9);

    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong((id *)&v20, 0);
    v22 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_waitForKeychainAndPreflight
{
  BuddyMiscState *v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(id *, void *);
  void *v7;
  BuddyMigrationPreparationController *v8;
  id location[2];
  BuddyMigrationPreparationController *v10;

  v10 = self;
  location[1] = (id)a2;
  v2 = -[BuddyMigrationPreparationController miscState](self, "miscState");
  location[0] = -[BuddyMiscState migrationManager](v2, "migrationManager");

  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10007B36C;
  v7 = &unk_100280B80;
  v8 = v10;
  objc_msgSend(location[0], "waitForKeychain:", &v3);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_waitForPreflight
{
  BuddyMiscState *v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(id *, void *, void *);
  void *v7;
  BuddyMigrationPreparationController *v8;
  id location[2];
  BuddyMigrationPreparationController *v10;

  v10 = self;
  location[1] = (id)a2;
  v2 = -[BuddyMigrationPreparationController miscState](self, "miscState");
  location[0] = -[BuddyMiscState migrationManager](v2, "migrationManager");

  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10007B5E8;
  v7 = &unk_100281848;
  v8 = v10;
  objc_msgSend(location[0], "waitForPreflight:", &v3);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_controllerDone
{
  id v2;
  id v3;
  void (**v4)(id, _QWORD);

  -[BuddyMigrationPreparationController setWaiting:](self, "setWaiting:", 0, a2);
  if (-[BuddyMigrationPreparationController isPaneVisible](self, "isPaneVisible"))
  {
    v2 = -[BuddyMigrationPreparationController delegate](self, "delegate");
    objc_msgSend(v2, "flowItemDone:", self);

  }
  else
  {
    v3 = -[BuddyMigrationPreparationController extendedInitializationCompletion](self, "extendedInitializationCompletion");

    if (v3)
    {
      v4 = (void (**)(id, _QWORD))-[BuddyMigrationPreparationController extendedInitializationCompletion](self, "extendedInitializationCompletion");
      v4[2](v4, 0);

      -[BuddyMigrationPreparationController setExtendedInitializationCompletion:](self, "setExtendedInitializationCompletion:", 0);
    }
  }
}

- (void)_showOutOfSpaceError
{
  id location[2];
  BuddyMigrationPreparationController *v3;

  v3 = self;
  location[1] = (id)a2;
  location[0] = -[BuddyMigrationTargetErrorController initForInsufficientSpace]([BuddyMigrationTargetErrorController alloc], "initForInsufficientSpace");
  -[BuddyMigrationPreparationController _showErrorController:](v3, "_showErrorController:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)_showError:(id)a3
{
  BuddyMigrationTargetErrorController *v3;
  BuddyMigrationTargetErrorController *v4;
  id v5;
  id location[2];
  BuddyMigrationPreparationController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [BuddyMigrationTargetErrorController alloc];
  v4 = -[BuddyMigrationTargetErrorController initWithError:](v3, "initWithError:", location[0]);
  -[BuddyMigrationPreparationController _showErrorController:](v7, "_showErrorController:", v4, v4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_showErrorController:(id)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  unsigned __int8 v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(id, uint64_t);
  dispatch_time_t v10;
  void *v11;
  void **block;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  BuddyMigrationPreparationController *v17;
  id v18;
  id location[2];
  BuddyMigrationPreparationController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyMigrationPreparationController miscState](v20, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  v5 = -[BuddyTargetDeviceMigrationManager hasTransferredData](v4, "hasTransferredData");
  objc_msgSend(location[0], "setForceErase:", v5 & 1);

  v6 = -[BuddyMigrationPreparationController delegate](v20, "delegate");
  objc_msgSend(location[0], "setDelegate:", v6);

  -[BuddyMigrationPreparationController setWaiting:](v20, "setWaiting:", 0);
  if (-[BuddyMigrationPreparationController isPaneVisible](v20, "isPaneVisible"))
  {
    v7 = -[BuddyMigrationPreparationController delegate](v20, "delegate");
    objc_msgSend(v7, "flowItemDone:nextItem:", v20, location[0]);

  }
  else
  {
    v8 = -[BuddyMigrationPreparationController extendedInitializationCompletion](v20, "extendedInitializationCompletion");

    if (v8)
    {
      v9 = (void (**)(id, uint64_t))-[BuddyMigrationPreparationController extendedInitializationCompletion](v20, "extendedInitializationCompletion");
      v9[2](v9, 1);

      -[BuddyMigrationPreparationController setExtendedInitializationCompletion:](v20, "setExtendedInitializationCompletion:", 0);
      v10 = dispatch_time(0, 1000000000);
      v11 = &_dispatch_main_q;
      block = _NSConcreteStackBlock;
      v13 = -1073741824;
      v14 = 0;
      v15 = sub_10007BB34;
      v16 = &unk_100280D00;
      v17 = v20;
      v18 = location[0];
      dispatch_after(v10, (dispatch_queue_t)v11, &block);

      objc_storeStrong(&v18, 0);
      objc_storeStrong((id *)&v17, 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_ableToMigrateWithPreflightInformation:(id)a3
{
  BOOL v3;
  id v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = 0;
  if (location[0])
  {
    v4 = objc_msgSend(location[0], "sourceDeviceDataSize");
    v3 = v4 < objc_msgSend(location[0], "targetDeviceFreeSpaceSize");
  }
  objc_storeStrong(location, 0);
  return v3;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (BOOL)isPaneVisible
{
  return self->_paneVisible;
}

- (void)setPaneVisible:(BOOL)a3
{
  self->_paneVisible = a3;
}

- (BOOL)waiting
{
  return self->_waiting;
}

- (void)setWaiting:(BOOL)a3
{
  self->_waiting = a3;
}

- (id)extendedInitializationCompletion
{
  return self->_extendedInitializationCompletion;
}

- (void)setExtendedInitializationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extendedInitializationCompletion, 0);
  objc_storeStrong((id *)&self->_miscState, 0);
}

@end
