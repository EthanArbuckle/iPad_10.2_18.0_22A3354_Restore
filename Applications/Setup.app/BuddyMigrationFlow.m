@implementation BuddyMigrationFlow

- (BuddyMigrationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddyMigrationFlow *v10;
  NSArray *v11;
  BuddyMigrationFlow *v12;
  objc_super v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  id v19;
  _QWORD v20[4];

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
  v14.super_class = (Class)BuddyMigrationFlow;
  v10 = -[BuddyMigrationFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v14, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v17, v16, v15);
  v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    v20[0] = objc_opt_class(BuddyMigrationPreparationController);
    v20[1] = objc_opt_class(BuddyMigrationUpdateController);
    v20[2] = objc_opt_class(BuddyMigrationStoreRenewController);
    v20[3] = objc_opt_class(BuddyMigrationTargetProgressController);
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4);
    objc_msgSend(v19, "setClassList:", v11);

  }
  v12 = (BuddyMigrationFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

- (void)startFlowAnimated:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  BuddyMigrationFlow *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMigrationFlow;
  -[BuddyMigrationFlow startFlowAnimated:](&v3, "startFlowAnimated:", a3);
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  BuddyMiscState *v4;
  BuddyTargetDeviceMigrationManager *v5;
  unsigned __int8 v6;
  BuddyMiscState *v7;
  BuddyTargetDeviceMigrationManager *v8;
  objc_super v10;
  id location;
  id v12;
  char v13;
  Class v14;
  Class v15;
  SEL v16;
  BuddyMigrationFlow *v17;
  id v18;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v4 = -[BuddyMigrationFlow miscState](self, "miscState");
  v5 = -[BuddyMiscState migrationManager](v4, "migrationManager");
  v6 = -[BuddyTargetDeviceMigrationManager willMigrate](v5, "willMigrate");

  v13 = v6 & 1;
  if ((v6 & 1) != 0 || v15 != (Class)objc_opt_class(BuddyMigrationStoreRenewController))
  {
    v10.receiver = v17;
    v10.super_class = (Class)BuddyMigrationFlow;
    v18 = -[BuddyMigrationFlow controllerFollowingControllerClass:requestedNext:](&v10, "controllerFollowingControllerClass:requestedNext:", v15, v14);
  }
  else
  {
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MBErrorDomain"), 202, 0);
    location = -[BuddyMigrationTargetErrorController initWithError:]([BuddyMigrationTargetErrorController alloc], "initWithError:", v12);
    v7 = -[BuddyMigrationFlow miscState](v17, "miscState");
    v8 = -[BuddyMiscState migrationManager](v7, "migrationManager");
    objc_msgSend(location, "setForceErase:", -[BuddyTargetDeviceMigrationManager hasTransferredData](v8, "hasTransferredData"));

    -[BuddyMigrationFlow configureFlowItem:](v17, "configureFlowItem:", location);
    v18 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v12, 0);
  }
  return v18;
}

+ (id)allowedFlowItems
{
  _QWORD v5[5];

  v5[0] = objc_opt_class(BuddyMigrationPreparationController);
  v5[1] = objc_opt_class(BuddyMigrationStoreRenewController);
  v5[2] = objc_opt_class(BuddyMigrationTargetErrorController);
  v5[3] = objc_opt_class(BuddyMigrationTargetProgressController);
  v5[4] = objc_opt_class(BuddyMigrationUpdateController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 5, a2, a1);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  void (**v3)(id, unint64_t);
  BuddyMiscState *v4;
  BuddyTargetDeviceMigrationManager *v5;
  id location[2];
  BuddyMigrationFlow *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(id, unint64_t))location[0];
  v4 = -[BuddyMigrationFlow miscState](v7, "miscState");
  v5 = -[BuddyMiscState migrationManager](v4, "migrationManager");
  v3[2](v3, -[BuddyTargetDeviceMigrationManager migrationInProgressOrCompleted](v5, "migrationInProgressOrCompleted"));

  objc_storeStrong(location, 0);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
  objc_storeStrong((id *)&self->_miscState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscState, 0);
}

@end
