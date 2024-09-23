@implementation HMDUserDataSource

- (id)userDataControllerWithDelegate:(id)a3 dataSource:(id)a4 queue:(id)a5 userID:(id)a6 homeID:(id)a7 sharedSettingsController:(id)a8 privateSettingsController:(id)a9 isCurrentUser:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HMDUserDataController *v23;
  uint64_t v25;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  LOBYTE(v25) = a10;
  v23 = -[HMDUserDataController initWithDelegate:dataSource:queue:userID:homeID:sharedSettingsController:privateSettingsController:isCurrentUser:]([HMDUserDataController alloc], "initWithDelegate:dataSource:queue:userID:homeID:sharedSettingsController:privateSettingsController:isCurrentUser:", v22, v21, v20, v19, v18, v17, v16, v25);

  return v23;
}

- (id)userDataBackingStoreControllerWithDelegate:(id)a3 queue:(id)a4 zoneName:(id)a5 shareMessenger:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  HMDUserSettingsBackingStoreController *v13;
  void *v14;
  HMDUserSettingsBackingStoreController *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [HMDUserSettingsBackingStoreController alloc];
  +[HMDDatabase defaultDatabase](HMDDatabase, "defaultDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMDUserSettingsBackingStoreController initWithDelegate:queue:zoneName:database:shareMessenger:](v13, "initWithDelegate:queue:zoneName:database:shareMessenger:", v12, v11, v10, v14, v9);

  return v15;
}

- (BOOL)isCurrentUser:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "keyStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getCurrentPairingIdentityWithPrivilege(2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "pairingIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v3;
}

@end
