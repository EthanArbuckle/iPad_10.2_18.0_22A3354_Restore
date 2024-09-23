@implementation BuddyRestoreFlow

- (BuddyRestoreFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v9;
  BuddyRestoreFlow *v10;
  NSArray *v11;
  BuddyRestoreFlow *v12;
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
  v14.super_class = (Class)BuddyRestoreFlow;
  v10 = -[BuddyRestoreFlow initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:](&v14, "initWithNavigationController:flowDelegate:flowStarter:dependencyInjector:", location[0], v17, v16, v15);
  v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    v20[0] = objc_opt_class(BuddyRestoreUpdateController);
    v20[1] = objc_opt_class(BuddyRestoreStoreRenewController);
    v20[2] = objc_opt_class(BackupRestoreProgressController);
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3);
    objc_msgSend(v19, "setClassList:", v11);

  }
  v12 = (BuddyRestoreFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

+ (id)allowedFlowItems
{
  _QWORD v5[3];

  v5[0] = objc_opt_class(BuddyRestoreStoreRenewController);
  v5[1] = objc_opt_class(BackupRestoreProgressController);
  v5[2] = objc_opt_class(BuddyRestoreUpdateController);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, a1);
}

- (void)setPendingRestoreState:(id)a3
{
  id v3;
  id location[2];
  BuddyRestoreFlow *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_pendingRestoreState, location[0]);
  v3 = objc_msgSend(location[0], "backupItem");
  -[BuddyRestoreFlow setBackupItem:](v5, "setBackupItem:", v3);

  objc_storeStrong(location, 0);
}

- (id)firstItem
{
  id v2;
  RestorableBackupItem *v3;
  id v4;
  objc_super v6;
  id location[2];
  BuddyRestoreFlow *v8;

  v8 = self;
  location[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyRestoreFlow;
  location[0] = -[BuddyRestoreFlow firstItem](&v6, "firstItem");
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyRestoreFlowItem) & 1) != 0)
  {
    v2 = location[0];
    v3 = -[BuddyRestoreFlow backupItem](v8, "backupItem");
    objc_msgSend(v2, "setBackupItem:", v3);

  }
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  id v4;
  RestorableBackupItem *v5;
  id v6;
  objc_super v8;
  id location[4];
  BuddyRestoreFlow *v10;

  v10 = self;
  location[3] = (id)a2;
  location[2] = a3;
  location[1] = a4;
  v8.receiver = self;
  v8.super_class = (Class)BuddyRestoreFlow;
  location[0] = -[BuddyRestoreFlow controllerFollowingControllerClass:requestedNext:](&v8, "controllerFollowingControllerClass:requestedNext:", a3, a4);
  if ((objc_msgSend(location[0], "conformsToProtocol:", &OBJC_PROTOCOL___BuddyRestoreFlowItem) & 1) != 0)
  {
    v4 = location[0];
    v5 = -[BuddyRestoreFlow backupItem](v10, "backupItem");
    objc_msgSend(v4, "setBackupItem:", v5);

  }
  v6 = location[0];
  objc_storeStrong(location, 0);
  return v6;
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_buddyPreferences, a3);
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
  objc_storeStrong((id *)&self->_backupItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupItem, 0);
  objc_storeStrong((id *)&self->_buddyPreferences, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
}

@end
