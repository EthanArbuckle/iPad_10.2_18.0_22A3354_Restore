@implementation HMDDatabaseZoneManager

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 40, 1);
}

- (HMDDatabaseZoneManager)initWithDatabase:(id)a3 zoneName:(id)a4 home:(id)a5 messageTargetUUID:(id)a6 workQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCloudShareMessenger *v17;
  HMDDatabaseZoneManager *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[HMDCloudShareMessenger initWithMessageTargetUUID:workQueue:home:]([HMDCloudShareMessenger alloc], "initWithMessageTargetUUID:workQueue:home:", v13, v12, v14);

  v18 = -[HMDDatabaseZoneManager initWithDatabase:zoneName:home:shareMessenger:workQueue:](self, "initWithDatabase:zoneName:home:shareMessenger:workQueue:", v16, v15, v14, v17, v12);
  return v18;
}

- (HMDDatabaseZoneManager)initWithDatabase:(id)a3 zoneName:(id)a4 home:(id)a5 shareMessenger:(id)a6 workQueue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDDatabaseZoneManager *v18;
  HMDDatabaseZoneManager *v19;
  uint64_t v20;
  NSString *zoneName;
  HMDDatabaseZoneManagerConfiguration *v22;
  HMDDatabaseZoneManagerConfiguration *defaultConfiguration;
  id participantsManagerFactory;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HMDDatabaseZoneManager;
  v18 = -[HMDDatabaseZoneManager init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_state = 0;
    objc_storeStrong((id *)&v18->_database, a3);
    objc_msgSend(v14, "hmf_stringWithSmallestEncoding");
    v20 = objc_claimAutoreleasedReturnValue();
    zoneName = v19->_zoneName;
    v19->_zoneName = (NSString *)v20;

    objc_storeWeak((id *)&v19->_home, v15);
    objc_storeStrong((id *)&v19->_shareMessenger, a6);
    objc_storeStrong((id *)&v19->_workQueue, a7);
    v22 = objc_alloc_init(HMDDatabaseZoneManagerConfiguration);
    defaultConfiguration = v19->_defaultConfiguration;
    v19->_defaultConfiguration = v22;

    participantsManagerFactory = v19->_participantsManagerFactory;
    v19->_participantsManagerFactory = &__block_literal_global_60754;

  }
  return v19;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDDatabaseZoneManager shareMessenger](self, "shareMessenger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)containerIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDDatabaseZoneManager database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)configure
{
  void *v3;
  void *v4;
  id v5;

  -[HMDDatabaseZoneManager database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDelegate:", self);

  -[HMDDatabaseZoneManager shareMessenger](self, "shareMessenger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HMDDatabaseZoneManager shareMessenger](self, "shareMessenger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configure");

}

- (BOOL)start
{
  HMDDatabaseZoneManager *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDDatabaseZoneManager defaultConfiguration](v2, "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[HMDDatabaseZoneManager startWithConfiguration:](v2, "startWithConfiguration:", v4);

  return (char)v2;
}

- (BOOL)startWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDDatabaseZoneManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDDatabaseZoneManager *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v9;
    v20 = 2112;
    v21 = (uint64_t)v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting zone manager with configuration: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (-[HMDDatabaseZoneManager state](v7, "state"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v7;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDDatabaseZoneManager state](v11, "state");
      v18 = 138543618;
      v19 = v13;
      v20 = 2048;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Zone manager was asked to start but it isn't idle: %ld", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = 0;
  }
  else
  {
    -[HMDDatabaseZoneManager setState:](v7, "setState:", 1);
    if (objc_msgSend(v4, "isZoneOwner"))
    {
      if (objc_msgSend(v4, "shouldCreateZone"))
        v16 = -[HMDDatabaseZoneManager _fetchPrivateZonesWithConfiguration:](v7, "_fetchPrivateZonesWithConfiguration:", v4);
      else
        v16 = -[HMDDatabaseZoneManager _fetchExistingPrivateZonesWithConfiguration:](v7, "_fetchExistingPrivateZonesWithConfiguration:", v4);
    }
    else
    {
      v16 = -[HMDDatabaseZoneManager _fetchSharedZonesWithConfiguration:](v7, "_fetchSharedZonesWithConfiguration:", v4);
    }
    v15 = v16;
  }

  return v15;
}

- (id)remove
{
  NSObject *v3;
  void *v4;
  HMDDatabaseZoneManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDDatabaseZoneManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Asked to remove zone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if (-[HMDDatabaseZoneManager state](v5, "state") == 2)
  {
    -[HMDDatabaseZoneManager setState:](v5, "setState:", 3);
    v8 = (void *)MEMORY[0x1E0D519E8];
    -[HMDDatabaseZoneManager workQueue](v5, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "schedulerWithDispatchQueue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDatabaseZoneManager database](v5, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager localZone](v5, "localZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeLocalAndCloudDataForLocalZone:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "reschedule:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __32__HMDDatabaseZoneManager_remove__block_invoke;
    v22[3] = &unk_1E89BAB68;
    v22[4] = v5;
    objc_msgSend(v14, "flatMap:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v5;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove backing store because it is not running", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)updateShareParticipants
{
  NSObject *v3;
  void *v4;
  int64_t v5;
  id v6;

  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDDatabaseZoneManager participantsManager](self, "participantsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDDatabaseZoneManager participantsManager](self, "participantsManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateShareParticipants");
  }
  else
  {
    -[HMDDatabaseZoneManager defaultConfiguration](self, "defaultConfiguration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isZoneOwner") & 1) == 0)
    {
      v5 = -[HMDDatabaseZoneManager state](self, "state");

      if (v5)
        return;
      -[HMDDatabaseZoneManager defaultConfiguration](self, "defaultConfiguration");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDDatabaseZoneManager _requestShareInvitationWithConfiguration:](self, "_requestShareInvitationWithConfiguration:");
    }
  }

}

- (BOOL)_fetchPrivateZonesWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDDatabaseZoneManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  HMDDatabaseZoneManager *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching private zones", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDDatabaseZoneManager database](v7, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManager zoneName](v7, "zoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudZoneConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManager delegate](v7, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v10, "privateZonesWithName:configuration:delegate:error:", v11, v12, v13, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (v14)
  {
    v16 = -[HMDDatabaseZoneManager _handleFetchZonesResult:configuration:](v7, "_handleFetchZonesResult:configuration:", v14, v4);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch private zones: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDDatabaseZoneManager _tearDownState](v18, "_tearDownState");
    v16 = 0;
  }

  return v16;
}

- (BOOL)_fetchExistingPrivateZonesWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDDatabaseZoneManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  HMDDatabaseZoneManager *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching existing private zones", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDDatabaseZoneManager database](v7, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManager zoneName](v7, "zoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudZoneConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManager delegate](v7, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v10, "existingPrivateZonesWithName:configuration:delegate:error:", v11, v12, v13, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;

  if (v14)
  {
    v16 = -[HMDDatabaseZoneManager _handleFetchZonesResult:configuration:](v7, "_handleFetchZonesResult:configuration:", v14, v4);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@No existing private zones exist", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDDatabaseZoneManager _tearDownState](v18, "_tearDownState");
    v16 = 0;
  }

  return v16;
}

- (BOOL)_fetchSharedZonesWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDDatabaseZoneManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  void *v29;
  HMDDatabaseZoneManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDDatabaseZoneManager *v35;
  NSObject *v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching shared zones", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "externalRecordTypesForSubscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "externalRecordTypesForSubscriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          -[HMDDatabaseZoneManager database](v7, "database");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (id)objc_msgSend(v17, "registerSharedSubscriptionForExternalRecordType:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v13);
    }
  }
  else
  {
    -[HMDDatabaseZoneManager database](v7, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v11, "registerSharedSubscriptionForExternalRecordType:", 0);
  }

  -[HMDDatabaseZoneManager database](v7, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManager zoneName](v7, "zoneName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "existingSharedZoneIDWithName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[HMDDatabaseZoneManager database](v7, "database");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudZoneConfiguration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager delegate](v7, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v23, "sharedZonesWithID:configuration:delegate:error:", v22, v24, v25, &v39);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v39;

    if (v26)
    {
      v28 = -[HMDDatabaseZoneManager _handleFetchZonesResult:configuration:](v7, "_handleFetchZonesResult:configuration:", v26, v4);
    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = v7;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v37;
        v46 = 2112;
        v47 = v27;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch shared zones: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      -[HMDDatabaseZoneManager _tearDownState](v35, "_tearDownState");
      v28 = 0;
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = v7;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDatabaseZoneManager zoneName](v30, "zoneName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v32;
      v46 = 2112;
      v47 = v33;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@No shared zone exists with zone name %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    -[HMDDatabaseZoneManager _requestShareInvitationWithConfiguration:](v30, "_requestShareInvitationWithConfiguration:", v4);
    -[HMDDatabaseZoneManager _tearDownState](v30, "_tearDownState");
    v28 = 0;
  }

  return v28;
}

- (BOOL)_handleFetchZonesResult:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDatabaseZoneManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  HMDDatabaseZoneManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager zoneName](v9, "zoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v69 = v11;
    v70 = 2112;
    v71 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetched zones with name %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "localZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManager setLocalZone:](v9, "setLocalZone:", v13);

  objc_msgSend(v6, "cloudZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManager setCloudZone:](v9, "setCloudZone:", v14);

  if (objc_msgSend(v7, "isZoneOwner"))
  {
    objc_msgSend(v7, "externalRecordTypesForSubscriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDDatabaseZoneManager cloudZone](v9, "cloudZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      v57 = v6;
      objc_msgSend(v16, "subscriptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "na_map:", &__block_literal_global_8_60734);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = v7;
      objc_msgSend(v7, "externalRecordTypesForSubscriptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v19;
      objc_msgSend(v19, "hmf_removedObjectsFromSet:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v63 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
            v28 = (void *)MEMORY[0x1D17BA0A0]();
            v29 = v9;
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v69 = v31;
              v70 = 2112;
              v71 = v27;
              _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing externalRecordType: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v28);
            -[HMDDatabaseZoneManager cloudZone](v29, "cloudZone");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (id)objc_msgSend(v32, "unregisterSubscriptionForExternalRecordType:", v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        }
        while (v24);
      }

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v7 = v56;
      objc_msgSend(v56, "externalRecordTypesForSubscriptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v59 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
            -[HMDDatabaseZoneManager cloudZone](v9, "cloudZone");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (id)objc_msgSend(v40, "registerSubscriptionForExternalRecordType:", v39);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        }
        while (v36);
      }

      v17 = v55;
      v6 = v57;
    }
    else
    {
      v42 = (id)objc_msgSend(v16, "registerSubscriptionForExternalRecordType:", 0);
    }

    -[HMDDatabaseZoneManager participantsManagerFactory](v9, "participantsManagerFactory");
    v43 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager workQueue](v9, "workQueue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager cloudZone](v9, "cloudZone");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager home](v9, "home");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v43)[2](v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager setParticipantsManager:](v9, "setParticipantsManager:", v47);

    -[HMDDatabaseZoneManager dataSource](v9, "dataSource");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDatabaseZoneManager participantsManager](v9, "participantsManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setDataSource:", v48);

    -[HMDDatabaseZoneManager participantsManager](v9, "participantsManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setDelegate:", v9);

    -[HMDDatabaseZoneManager participantsManager](v9, "participantsManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "configure");

    -[HMDDatabaseZoneManager participantsManager](v9, "participantsManager");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "updateShareParticipants");

  }
  -[HMDDatabaseZoneManager setState:](v9, "setState:", 2);
  -[HMDDatabaseZoneManager delegate](v9, "delegate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v53, "zoneManagerDidStart:", v9);

  return 1;
}

- (void)_sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  HMDDatabaseZoneManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD aBlock[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;
  if (v12)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__HMDDatabaseZoneManager__sendShareInvitation_toUser_device___block_invoke;
    aBlock[3] = &unk_1E89BDB38;
    aBlock[4] = self;
    v14 = _Block_copy(aBlock);
    if (!(v9 | v10))
      _HMFPreconditionFailure();
    v15 = v14;
    if (v9)
    {
      -[HMDDatabaseZoneManager shareMessenger](self, "shareMessenger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDatabaseZoneManager defaultConfiguration](self, "defaultConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "minimumHomeKitVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDatabaseZoneManager defaultConfiguration](self, "defaultConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "requiredSupportedFeatures");
      v19 = v10;
      v20 = v8;
      v21 = v13;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendShareInvitationData:toUser:minimumHomeKitVersion:requiredSupportedFeatures:completion:", v12, v9, v17, v22, v15);

      v13 = v21;
      v8 = v20;
      v10 = v19;

    }
    else
    {
      if (!v10)
      {
LABEL_11:

        goto LABEL_12;
      }
      -[HMDDatabaseZoneManager shareMessenger](self, "shareMessenger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sendShareInvitationData:toDevice:completion:", v12, v10, v15);
    }

    goto LABEL_11;
  }
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v26;
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize invitation %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v23);
LABEL_12:

}

- (void)_requestShareInvitationWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDatabaseZoneManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[HMDDatabaseZoneManager participantsManager](self, "participantsManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "areShareModificationsEnabledForManager:", v6),
        v6,
        v7))
  {
    if (objc_msgSend(v4, "shouldCreateZone"))
    {
      v18 = v4;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[HMDDatabaseZoneManager home](self, "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "users");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v14, "isCurrentUser") & 1) == 0
              && (objc_opt_respondsToSelector() & 1) != 0
              && objc_msgSend(v5, "zoneManager:shouldRequestShareInvitationFromUser:", self, v14))
            {
              -[HMDDatabaseZoneManager shareMessenger](self, "shareMessenger");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "requestShareInvitationDataFromUser:", v14);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

      -[HMDDatabaseZoneManager database](self, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v16, "synchronizeSharedZones");

      v4 = v18;
    }
  }

}

- (void)_tearDownState
{
  NSObject *v3;
  id v4;

  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDDatabaseZoneManager state](self, "state"))
  {
    -[HMDDatabaseZoneManager setCloudZone:](self, "setCloudZone:", 0);
    -[HMDDatabaseZoneManager setLocalZone:](self, "setLocalZone:", 0);
    -[HMDDatabaseZoneManager setParticipantsManager:](self, "setParticipantsManager:", 0);
    -[HMDDatabaseZoneManager setState:](self, "setState:", 0);
    -[HMDDatabaseZoneManager delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "zoneManagerDidStop:", self);

  }
}

- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  HMDDatabaseZoneManager *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v12, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v13, v9, &v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v30;

  if (v14)
  {
    -[HMDDatabaseZoneManager database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "acceptInvitation:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0D519E8];
    -[HMDDatabaseZoneManager workQueue](self, "workQueue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "schedulerWithDispatchQueue:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __72__HMDDatabaseZoneManager_messenger_didReceiveInvitationData_completion___block_invoke;
    v27[3] = &unk_1E89AD568;
    v27[4] = self;
    v28 = v15;
    v29 = v10;
    v22 = (id)objc_msgSend(v21, "addCompletionBlock:", v27);

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v26;
      v33 = 2112;
      v34 = v9;
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive share invitation from invitation data: %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v15);
  }

}

- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDDatabaseZoneManager participantsManager](self, "participantsManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inviteUser:usingDevice:", v8, v7);

}

- (void)messengerDidReceiveShareAccessRevocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDDatabaseZoneManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Synchronizing shared zones due to share revocation", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDDatabaseZoneManager database](v7, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "synchronizeSharedZones");

}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDDatabaseZoneManager _sendShareInvitation:toUser:device:](self, "_sendShareInvitation:toUser:device:", v9, v7, 0);
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDDatabaseZoneManager _sendShareInvitation:toUser:device:](self, "_sendShareInvitation:toUser:device:", v9, 0, v7);
}

- (void)manager:(id)a3 didRevokeShareAccessForUser:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a4;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDDatabaseZoneManager shareMessenger](self, "shareMessenger");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyOfShareAccessRevocationForUser:", v5);

}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDDatabaseZoneManager *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMDDatabaseZoneManager zoneName](self, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
  {
    -[HMDDatabaseZoneManager defaultConfiguration](self, "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isZoneOwner");

    if (v12 == v5)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling zone creation by starting", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDDatabaseZoneManager workQueue](v14, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__HMDDatabaseZoneManager_database_didCreateZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = v14;
      dispatch_async(v17, block);

    }
  }
  else
  {

  }
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDDatabaseZoneManager *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMDDatabaseZoneManager zoneName](self, "zoneName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
  {
    -[HMDDatabaseZoneManager defaultConfiguration](self, "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isZoneOwner");

    if (v12 == v5)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling zone removal by tearing down state", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDDatabaseZoneManager workQueue](v14, "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__HMDDatabaseZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = v14;
      dispatch_async(v17, block);

    }
  }
  else
  {

  }
}

- (void)database:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDDatabaseZoneManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HMDDatabaseZoneManager_database_didReceiveMessageWithUserInfo___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (HMDDatabaseZoneManagerDataSource)dataSource
{
  return (HMDDatabaseZoneManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDDatabaseZoneManagerDelegate)delegate
{
  return (HMDDatabaseZoneManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setLocalZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCloudZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMDDatabaseZoneManagerConfiguration)defaultConfiguration
{
  return (HMDDatabaseZoneManagerConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDefaultConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 80, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCloudShareParticipantsManager)participantsManager
{
  return (HMDCloudShareParticipantsManager *)objc_getProperty(self, a2, 96, 1);
}

- (void)setParticipantsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (id)participantsManagerFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setParticipantsManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_participantsManagerFactory, 0);
  objc_storeStrong((id *)&self->_participantsManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __65__HMDDatabaseZoneManager_database_didReceiveMessageWithUserInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "zoneManager:didReceiveMessageWithUserInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __67__HMDDatabaseZoneManager_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownState");
}

uint64_t __67__HMDDatabaseZoneManager_database_didCreateZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

void __72__HMDDatabaseZoneManager_messenger_didReceiveInvitationData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully accepted invitation and created shared zone with ID %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "start");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 40);
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to accept received invitation: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

  }
}

void __61__HMDDatabaseZoneManager__sendShareInvitation_toUser_device___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      v11 = "%{public}@Zone invitation was successfully accepted";
      v12 = v9;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 12;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v12, v13, v11, (uint8_t *)&v15, v14);

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v5;
    v11 = "%{public}@Zone invitation was not accepted: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v6);
}

uint64_t __64__HMDDatabaseZoneManager__handleFetchZonesResult_configuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordType");
}

uint64_t __32__HMDDatabaseZoneManager_remove__block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(*(id *)(a1 + 32), "_tearDownState");
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

HMDCloudShareParticipantsManager *__82__HMDDatabaseZoneManager_initWithDatabase_zoneName_home_shareMessenger_workQueue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  HMDCloudShareParticipantsManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = -[HMDCloudShareParticipantsManager initWithQueue:cloudZone:home:]([HMDCloudShareParticipantsManager alloc], "initWithQueue:cloudZone:home:", v8, v7, v6);

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1)
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_27_60759);
  return (id)logCategory__hmf_once_v23;
}

void __37__HMDDatabaseZoneManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v23;
  logCategory__hmf_once_v23 = v0;

}

@end
