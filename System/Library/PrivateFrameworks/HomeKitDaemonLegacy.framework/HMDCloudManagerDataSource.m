@implementation HMDCloudManagerDataSource

- (HMDCloudManagerDataSource)initWithHomeManager:(id)a3
{
  id v4;
  HMDCloudManagerDataSource *v5;
  HMDCloudManagerDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDCloudManagerDataSource;
  v5 = -[HMDCloudManagerDataSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_homeManager, v4);

  return v6;
}

- (BOOL)isControllerKeyAvailable
{
  void *v2;
  char v3;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v3 = objc_msgSend(v2, "getControllerPublicKey:secretKey:username:allowCreation:error:", &v5, 0, 0, 0, 0);

  return v3;
}

- (BOOL)isKeychainSyncEnabled
{
  void *v2;
  char v3;

  +[HMDAppleAccountSettings sharedSettings](HMDAppleAccountSettings, "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeychainSyncEnabled");

  return v3;
}

- (unint64_t)dataMigrationOptions
{
  return DMGetUserDataDisposition() & 0x1E;
}

- (id)queryDatabaseOperationWithBlock:(id)a3
{
  return +[HMDSyncOperation queryDatabaseOperationWithBlock:](HMDSyncOperation, "queryDatabaseOperationWithBlock:", a3);
}

- (BOOL)supportsKeyTransferServer
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsKeyTransferServer");

  return v3;
}

- (id)keyTransferAgent
{
  void *v2;
  void *v3;

  -[HMDCloudManagerDataSource homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyTransferAgent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeManager);
}

@end
