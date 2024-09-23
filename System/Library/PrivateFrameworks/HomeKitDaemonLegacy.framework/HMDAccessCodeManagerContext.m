@implementation HMDAccessCodeManagerContext

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccessCodeManagerContext)initWithHome:(id)a3 workQueue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMDAccessCodeManagerContext *v11;

  v6 = (void *)MEMORY[0x1E0CBA168];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessCodeManagerUUIDFromHomeUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMDAccessCodeManagerContext initWithHome:workQueue:UUID:](self, "initWithHome:workQueue:UUID:", v8, v7, v10);
  return v11;
}

- (HMDAccessCodeManagerContext)initWithHome:(id)a3 workQueue:(id)a4 UUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAccessCodeManagerContext *v12;
  HMDAccessCodeManagerContext *v13;
  HMDAccessCodeDemoDataMocker *v14;
  HMDAccessCodeDemoDataMocker *demoDataMocker;
  HMDRemoteMessageForwarder *v16;
  HMDRemoteMessageForwarder *remoteMessageForwarder;
  HMDAccessCodeManagerContext *result;
  HMDAccessCodeManagerContext *v19;
  SEL v20;
  id v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_9:
    v19 = (HMDAccessCodeManagerContext *)_HMFPreconditionFailure();
    -[HMDAccessCodeManagerContext configureWithMessageDispatcher:](v19, v20, v21);
    return result;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDAccessCodeManagerContext;
  v12 = -[HMDAccessCodeManagerContext init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_home, v8);
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v13->_UUID, a5);
    v14 = objc_alloc_init(HMDAccessCodeDemoDataMocker);
    demoDataMocker = v13->_demoDataMocker;
    v13->_demoDataMocker = v14;

    v16 = -[HMDRemoteMessageForwarder initWithHome:UUID:workQueue:]([HMDRemoteMessageForwarder alloc], "initWithHome:UUID:workQueue:", v8, v11, v9);
    remoteMessageForwarder = v13->_remoteMessageForwarder;
    v13->_remoteMessageForwarder = v16;

    objc_msgSend(MEMORY[0x1E0D28570], "blessWithImplicitContext:", v13->_workQueue);
  }

  return v13;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_messageDispatcher, a3);
  v5 = a3;
  -[HMDAccessCodeManagerContext remoteMessageForwarder](self, "remoteMessageForwarder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithMessageDispatcher:", v5);

}

- (BOOL)isFeatureEnabled
{
  return 1;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)+[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
}

- (HMDHomeWalletKeyManager)walletKeyManager
{
  void *v2;
  void *v3;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "walletKeyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHomeWalletKeyManager *)v3;
}

- (HMDHomeAdministratorHandler)administratorHandler
{
  void *v2;
  void *v3;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "administratorHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHomeAdministratorHandler *)v3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  char v3;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDeviceConfirmedPrimaryResident");

  return v3;
}

- (BOOL)primaryResidentSupportsAccessCodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResidentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsAccessCodes");

  return v6;
}

- (BOOL)isDemoDataMockerEnabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("accessCodeDemoDataMockerEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int64_t)accessoryReadWriteRetries
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDAccessCodeManagerAccessoryReadWriteRetries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (double)accessoryReadWriteRetryTimeInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDAccessCodeManagerAccessoryReadWriteRetryTimeInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(v4, "integerValue");

  return v5;
}

- (double)removedUserAccessCodeTimeToLive
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDAccessCodeManagerRemovedUserAccessCodeTimeToLive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(v4, "integerValue");

  return v5;
}

- (double)dataCleanUpCheckTimerInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDAccessCodeManagerDataCleanUpCheckTimerInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)residentDataSyncVerificationRetries
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDAccessCodeManagerResidentDataSyncVerificationRetries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (double)residentDataSyncVerificationRetryTimeInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDAccessCodeManagerResidentDataSyncVerificationRetryTimeInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(v4, "integerValue");

  return v5;
}

- (BOOL)isCurrentDeviceResidentCapable
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentCapable");

  return v3;
}

- (BOOL)isCurrentDeviceOwnerUser
{
  void *v2;
  void *v3;
  char v4;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isOwner");

  return v4;
}

- (BOOL)isCurrentDeviceOwnerController
{
  _BOOL4 v2;

  v2 = -[HMDAccessCodeManagerContext isCurrentDeviceOwnerUser](self, "isCurrentDeviceOwnerUser");
  if (v2)
    LOBYTE(v2) = isiOSDevice() || isMac();
  return v2;
}

- (BOOL)isResidentSupported
{
  void *v2;
  char v3;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentSupported");

  return v3;
}

- (BOOL)isHomeAppForegrounded
{
  void *v2;
  char v3;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCharacteristicNotificationRegistrations");

  return v3;
}

- (BOOL)hasHomeOnboardedForAccessCodes
{
  void *v2;
  char v3;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasOnboardedForAccessCode");

  return v3;
}

- (HMDDevice)residentCommunicationHandlerPreferredDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentCommunicationHandlerForHome:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "preferredDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v6;
}

- (id)_performMockedWriteRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessCodeManagerContext *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManagerContext demoDataMocker](self, "demoDataMocker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleWriteRequests:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to mock data for write requests: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)performWriteRequests:(id)a3 withRetries:(int64_t)a4 timeInterval:(double)a5 loggingObject:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMDAccessCodeManagerContext *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (-[HMDAccessCodeManagerContext isDemoDataMockerEnabled](self, "isDemoDataMockerEnabled"))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Demo Data Mocker is enabled, not writing to real accessory.", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDAccessCodeManagerContext _performMockedWriteRequests:](v13, "_performMockedWriteRequests:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAccessCodeManagerContext home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "performWriteRequests:withRetries:timeInterval:loggingObject:", v10, a4, v11, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)performReadRequests:(id)a3 withRetries:(int64_t)a4 timeInterval:(double)a5 loggingObject:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMDAccessCodeManagerContext *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (-[HMDAccessCodeManagerContext isDemoDataMockerEnabled](self, "isDemoDataMockerEnabled"))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Demo Data Mocker is enabled, not reading from real accessory.", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDAccessCodeManagerContext _performMockedReadRequests:](v13, "_performMockedReadRequests:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAccessCodeManagerContext home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "performReadRequests:withRetries:timeInterval:loggingObject:", v10, a4, v11, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)_performMockedReadRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessCodeManagerContext *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManagerContext demoDataMocker](self, "demoDataMocker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleReadRequests:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to mock data for write requests: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)redispatchToResidentMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDAccessCodeManagerContext home](self, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManagerContext UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManagerContext workQueue](self, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "redispatchToResidentMessage:target:responseQueue:", v4, v5, v6);

}

- (id)userForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDAccessCodeManagerContext home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)userWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDAccessCodeManagerContext home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__HMDAccessCodeManagerContext_userWithUUID___block_invoke;
  v10[3] = &unk_1E89B7AD8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)accessoriesSupportingAccessCodes
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessCodeManagerContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_2935);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)UUIDsOfAccessoriesSupportingAccessCodes
{
  void *v2;
  void *v3;

  -[HMDAccessCodeManagerContext accessoriesSupportingAccessCodes](self, "accessoriesSupportingAccessCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)UUIDsOfHAPAccessoriesSupportingAccessCodes
{
  void *v2;
  void *v3;

  -[HMDAccessCodeManagerContext accessoriesSupportingAccessCodes](self, "accessoriesSupportingAccessCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)UUIDsOfMatterAccessoriesSupportingAccessCodes
{
  void *v2;
  void *v3;

  -[HMDAccessCodeManagerContext accessoriesSupportingAccessCodes](self, "accessoriesSupportingAccessCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_45);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)hapAccessoryWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDAccessCodeManagerContext home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HMDAccessCodeManagerContext_hapAccessoryWithUUID___block_invoke;
  v10[3] = &unk_1E89BA910;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)generateAccessCodeValueFromConstraints:(id)a3 accessoryAccessCodes:(id)a4 homeAccessCodes:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CBA168], "generateAccessCodeValueFromConstraints:accessoryAccessCodes:homeAccessCodes:", a3, a4, a5);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (HMDRemoteMessageForwarder)remoteMessageForwarder
{
  return (HMDRemoteMessageForwarder *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAccessCodeDemoDataMocker)demoDataMocker
{
  return (HMDAccessCodeDemoDataMocker *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoDataMocker, 0);
  objc_storeStrong((id *)&self->_remoteMessageForwarder, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
}

uint64_t __52__HMDAccessCodeManagerContext_hapAccessoryWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

id __76__HMDAccessCodeManagerContext_UUIDsOfMatterAccessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "supportsCHIP"))
  {
    objc_msgSend(v2, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __73__HMDAccessCodeManagerContext_UUIDsOfHAPAccessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "supportsCHIP") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __70__HMDAccessCodeManagerContext_UUIDsOfAccessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __63__HMDAccessCodeManagerContext_accessoriesSupportingAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCode");
}

uint64_t __44__HMDAccessCodeManagerContext_userWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1)
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_47);
  return (id)logCategory__hmf_once_v5;
}

void __42__HMDAccessCodeManagerContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5;
  logCategory__hmf_once_v5 = v0;

}

@end
