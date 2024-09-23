@implementation BuddyMigrationStoreRenewController

- (void)fetchAccounts:(id)a3
{
  void (**v3)(id, id, id);
  MBDeviceTransferPreflight *v4;
  id v5;
  MBDeviceTransferPreflight *v6;
  id v7;
  id location[2];
  BuddyMigrationStoreRenewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = (void (**)(id, id, id))location[0];
    v4 = -[BuddyMigrationStoreRenewController preflightInformation](v9, "preflightInformation");
    v5 = -[MBDeviceTransferPreflight appleIDs](v4, "appleIDs");
    v6 = -[BuddyMigrationStoreRenewController preflightInformation](v9, "preflightInformation");
    v7 = -[MBDeviceTransferPreflight activeAppleID](v6, "activeAppleID");
    v3[2](v3, v5, v7);

  }
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  BuddyMiscState *v3;
  BuddyTargetDeviceMigrationManager *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  BuddyMigrationStoreRenewController *v10;
  id v11;
  id location[2];
  BuddyMigrationStoreRenewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyStoreRenewController miscState](v13, "miscState");
  v4 = -[BuddyMiscState migrationManager](v3, "migrationManager");
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_100149C9C;
  v9 = &unk_100283660;
  v10 = v13;
  v11 = location[0];
  -[BuddyTargetDeviceMigrationManager waitForPreflight:](v4, "waitForPreflight:", &v5);

  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_localizedExtraStoresSignInTextKeyForStoreContentMap:(id)a3
{
  id v3;
  id v4;
  objc_super v6;
  id v7;
  id location[2];
  BuddyMigrationStoreRenewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v9;
  v6.super_class = (Class)BuddyMigrationStoreRenewController;
  v3 = -[BuddyStoreRenewController _localizedExtraStoresSignInTextKeyForStoreContentMap:](&v6, "_localizedExtraStoresSignInTextKeyForStoreContentMap:", location[0]);
  v7 = objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v7, "appendString:", CFSTR("_MIGRATION"));
  v4 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (MBDeviceTransferPreflight)preflightInformation
{
  return self->_preflightInformation;
}

- (void)setPreflightInformation:(id)a3
{
  objc_storeStrong((id *)&self->_preflightInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightInformation, 0);
}

@end
