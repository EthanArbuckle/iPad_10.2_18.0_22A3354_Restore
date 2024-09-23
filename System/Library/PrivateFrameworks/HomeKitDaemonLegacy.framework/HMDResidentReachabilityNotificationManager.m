@implementation HMDResidentReachabilityNotificationManager

- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDResidentReachabilityNotificationManager *v9;

  v6 = a4;
  v7 = a3;
  +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDResidentReachabilityNotificationManager initWithResidentReachabilityContext:workQueue:timerFactory:bulletinBoard:](self, "initWithResidentReachabilityContext:workQueue:timerFactory:bulletinBoard:", v7, v6, &__block_literal_global_133361, v8);

  return v9;
}

- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4 timerFactory:(id)a5 bulletinBoard:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDResidentReachabilityNotificationManager *v15;
  HMDResidentReachabilityNotificationManager *v16;
  void *v17;
  id timerFactory;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDResidentReachabilityNotificationManager;
  v15 = -[HMDResidentReachabilityNotificationManager init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_reachabilityContext, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    v17 = _Block_copy(v13);
    timerFactory = v16->_timerFactory;
    v16->_timerFactory = v17;

    objc_storeStrong((id *)&v16->_bulletinBoard, a6);
    v16->_notificationEnabled = 0;
  }

  return v16;
}

- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "idsServerBag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentReachabilityNotificationManager configureWithHome:deviceMonitor:notificationCenter:idsServerBag:completionHandler:](self, "configureWithHome:deviceMonitor:notificationCenter:idsServerBag:completionHandler:", v8, v7, v11, v10, 0);

}

- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4 notificationCenter:(id)a5 idsServerBag:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a6;
  objc_storeWeak((id *)&self->_deviceMonitor, v13);
  objc_storeWeak((id *)&self->_home, v12);
  objc_storeWeak((id *)&self->_idsServerBag, v16);

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__HMDResidentReachabilityNotificationManager_configureWithHome_deviceMonitor_notificationCenter_idsServerBag_completionHandler___block_invoke;
  block[3] = &unk_1E89C0598;
  block[4] = self;
  v23 = v14;
  v24 = v12;
  v25 = v13;
  v26 = v15;
  v18 = v15;
  v19 = v13;
  v20 = v12;
  v21 = v14;
  dispatch_async(v17, block);

}

- (void)_handleNetworkReachabilityChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HMDResidentReachabilityNotificationManager__handleNetworkReachabilityChange___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleResidentAdded:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HMDResidentReachabilityNotificationManager__handleResidentAdded___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleResidentRemoved:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentRemoved___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleResidentUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentUpdated___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleCameraProfileSettingsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__HMDResidentReachabilityNotificationManager__handleCameraProfileSettingsDidChange___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleCameraProfileUnconfigured:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HMDResidentReachabilityNotificationManager__handleCameraProfileUnconfigured___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)updateNotificationEnabled
{
  NSObject *v3;
  _BOOL8 v4;
  _BOOL4 v5;
  void *v6;
  HMDResidentReachabilityNotificationManager *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  HMDResidentReachabilityContext *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HMDResidentReachabilityNotificationManager isReachabilityEventNotificationEnabledForAnyCamera](self, "isReachabilityEventNotificationEnabledForAnyCamera");
  v5 = -[HMDResidentReachabilityNotificationManager notificationEnabled](self, "notificationEnabled");
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4 == v5)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentReachabilityNotificationManager notificationEnabled](v7, "notificationEnabled");
      HMFEnabledStatusToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Resident reachability notifications not changing from %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentReachabilityNotificationManager notificationEnabled](v7, "notificationEnabled");
      HMFEnabledStatusToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMFEnabledStatusToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updating resident reachability notifications from %@ -> %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDResidentReachabilityNotificationManager setNotificationEnabled:](v7, "setNotificationEnabled:", v4);
    if (!-[HMDResidentReachabilityNotificationManager notificationEnabled](v7, "notificationEnabled"))
    {
      v13 = -[HMDResidentReachabilityContext initWithMostRecentReachability:]([HMDResidentReachabilityContext alloc], "initWithMostRecentReachability:", 0);
      -[HMDResidentReachabilityNotificationManager setReachabilityContext:](v7, "setReachabilityContext:", v13);

      -[HMDResidentReachabilityNotificationManager home](v7, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "saveToCurrentAccountWithReason:", CFSTR("Camera reachability notification disabled"));

    }
  }
}

- (void)_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  HMDResidentReachabilityNotificationManager *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  void *v13;
  HMDResidentReachabilityNotificationManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDResidentReachabilityNotificationManager *v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  HMDResidentReachabilityNotificationManager *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDResidentReachabilityContext *v30;
  HMDResidentReachabilityContext *v31;
  const __CFString *v32;
  void *v33;
  const char *v34;
  void *v35;
  HMDResidentReachabilityNotificationManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDResidentReachabilityNotificationManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  HMDResidentReachabilityContext *v44;
  HMDResidentReachabilityContext *v45;
  int v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDResidentReachabilityNotificationManager deviceMonitor](self, "deviceMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReachable");

  if ((v6 & 1) != 0)
  {
    -[HMDResidentReachabilityNotificationManager evaluateDebounceTimer](self, "evaluateDebounceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138543362;
        v47 = v11;
        v12 = "%{public}@Debounce timer active, delaying check";
LABEL_22:
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v46, 0xCu);

        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (!-[HMDResidentReachabilityNotificationManager anyEnabledResidentSupportsReachabilityNotifications](self, "anyEnabledResidentSupportsReachabilityNotifications"))
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138543362;
        v47 = v11;
        v12 = "%{public}@No enabled resident supports Reachability Notifications";
        goto LABEL_22;
      }
LABEL_23:

      objc_autoreleasePoolPop(v8);
      return;
    }
    if (!-[HMDResidentReachabilityNotificationManager notificationEnabled](self, "notificationEnabled"))
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138543362;
        v47 = v11;
        v12 = "%{public}@There is no camera or all camera settings disabled reachability notification";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    -[HMDResidentReachabilityNotificationManager home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (-[HMDResidentReachabilityNotificationManager hasReachableResidents](self, "hasReachableResidents"))
      {
        -[HMDResidentReachabilityNotificationManager unreachableBulletinDebounceTimer](self, "unreachableBulletinDebounceTimer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "suspend");

        v19 = (void *)MEMORY[0x1D17BA0A0](-[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](self, "setUnreachableBulletinDebounceTimer:", 0));
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 138543362;
          v47 = v22;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Home has reachable residents supporting notification", (uint8_t *)&v46, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
        v23 = -[HMDResidentReachabilityNotificationManager shouldPostReachableNotification](v20, "shouldPostReachableNotification");
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = v20;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v23)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 138543362;
            v47 = v28;
            _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Posting reachable notification", (uint8_t *)&v46, 0xCu);

          }
          objc_autoreleasePoolPop(v24);
          -[HMDResidentReachabilityNotificationManager bulletinBoard](v25, "bulletinBoard");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v17, 1, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v25, "hasMultipleResidents"));

          v30 = [HMDResidentReachabilityContext alloc];
          v31 = -[HMDResidentReachabilityContext initWithMostRecentReachability:](v30, "initWithMostRecentReachability:", MEMORY[0x1E0C9AAB0]);
          -[HMDResidentReachabilityNotificationManager setReachabilityContext:](v25, "setReachabilityContext:", v31);

          v32 = CFSTR("Posted reachable resident notification");
LABEL_33:
          objc_msgSend(v17, "saveToCurrentAccountWithReason:", v32);
LABEL_40:

          return;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 138543362;
          v47 = v33;
          v34 = "%{public}@Not posting reachable notification due to no previous unreachable notification posted or previ"
                "ously posting reachable notification";
          goto LABEL_38;
        }
      }
      else
      {
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        v36 = self;
        HMFGetOSLogHandle();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 138543362;
          v47 = v38;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Home does not have reachable residents supporting camera recording", (uint8_t *)&v46, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
        if (-[HMDResidentReachabilityNotificationManager shouldPostUnreachableNotification](v36, "shouldPostUnreachableNotification"))
        {
          v39 = (void *)MEMORY[0x1D17BA0A0](-[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](v36, "setUnreachableBulletinDebounceTimer:", 0));
          v40 = v36;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 138543362;
            v47 = v42;
            _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Posting unreachable notification", (uint8_t *)&v46, 0xCu);

          }
          objc_autoreleasePoolPop(v39);
          -[HMDResidentReachabilityNotificationManager bulletinBoard](v40, "bulletinBoard");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v17, 0, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v40, "hasMultipleResidents"));

          v44 = [HMDResidentReachabilityContext alloc];
          v45 = -[HMDResidentReachabilityContext initWithMostRecentReachability:](v44, "initWithMostRecentReachability:", MEMORY[0x1E0C9AAA0]);
          -[HMDResidentReachabilityNotificationManager setReachabilityContext:](v40, "setReachabilityContext:", v45);

          v32 = CFSTR("Posted no reachable resident notification");
          goto LABEL_33;
        }
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = v36;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 138543362;
          v47 = v33;
          v34 = "%{public}@Not posting unreachable notification due to previously posting unreachable notification";
          goto LABEL_38;
        }
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = 138543362;
        v47 = v33;
        v34 = "%{public}@Our home has been deallocated";
LABEL_38:
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)&v46, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v24);
    goto LABEL_40;
  }
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 138543362;
    v47 = v16;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Network unreachable, clearing debounce timer and delaying check until reachable", (uint8_t *)&v46, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDResidentReachabilityNotificationManager setEvaluateDebounceTimer:](v14, "setEvaluateDebounceTimer:", 0);
}

- (BOOL)hasReachableResidents
{
  void *v2;
  void *v3;
  char v4;

  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledResidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_29_133313);

  return v4;
}

- (BOOL)hasMultipleResidents
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledResidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_30_133312);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = (unint64_t)objc_msgSend(v4, "count") > 1;
  return (char)v2;
}

- (BOOL)isReachabilityEventNotificationEnabledForAnyCamera
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v4 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v3);
        v6 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
        v8 = v7;

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v8, "cameraProfiles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "currentSettings", v19);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v14, "supportedFeatures") & 2) != 0)
              {
                objc_msgSend(v14, "notificationSettings");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "isReachabilityEventNotificationEnabled");

                if ((v16 & 1) != 0)
                {

                  v17 = 1;
                  goto LABEL_24;
                }
              }
              else
              {

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v4 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_24:

  return v17;
}

- (BOOL)anyEnabledResidentSupportsReachabilityNotifications
{
  void *v2;
  void *v3;
  char v4;

  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledResidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_32_133310);

  return v4;
}

- (BOOL)shouldPostReachableNotification
{
  void *v2;
  void *v3;
  int v4;

  -[HMDResidentReachabilityNotificationManager reachabilityContext](self, "reachabilityContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentReachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)shouldPostUnreachableNotification
{
  void *v2;
  void *v3;
  char v4;

  -[HMDResidentReachabilityNotificationManager reachabilityContext](self, "reachabilityContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mostRecentReachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)_startDebounceTimer
{
  void *v3;
  void *v4;
  HMDResidentReachabilityNotificationManager *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDResidentReachabilityNotificationManager evaluateDebounceTimer](self, "evaluateDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Debounce timer already active", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDResidentReachabilityNotificationManager _createTimer](self, "_createTimer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDResidentReachabilityNotificationManager setEvaluateDebounceTimer:](self, "setEvaluateDebounceTimer:");

  }
}

- (void)_startUnreachableBulletinDebounceTimer
{
  void *v3;
  void *v4;
  HMDResidentReachabilityNotificationManager *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDResidentReachabilityNotificationManager unreachableBulletinDebounceTimer](self, "unreachableBulletinDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Unreachable bulletin timer already active", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDResidentReachabilityNotificationManager _createTimer](self, "_createTimer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](self, "setUnreachableBulletinDebounceTimer:");

  }
}

- (id)_createTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  HMDResidentReachabilityNotificationManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  HMDResidentReachabilityNotificationManager *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(double);
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDResidentReachabilityNotificationManager idsServerBag](self, "idsServerBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentSelectionReachabilityNotificationAfterConnectivityDelay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "doubleValue");
    if (fabs(v7) < 2.22044605e-16)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0](v6);
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@ResidentReachabilityNotificationAfterConnectivityDelay from IDS is 0.0 so disabling and not posting reachability notification", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v12 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v5, "doubleValue");
    v13 = v14;
  }
  else
  {
    v13 = 600.0;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v18;
    v24 = 2048;
    v25 = v13;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Creating time for %f", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDResidentReachabilityNotificationManager timerFactory](v16, "timerFactory");
  v19 = (void (**)(double))objc_claimAutoreleasedReturnValue();
  v19[2](v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setDelegate:", v16);
  -[HMDResidentReachabilityNotificationManager workQueue](v16, "workQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegateQueue:", v20);

  objc_msgSend(v12, "resume");
LABEL_11:

  return v12;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDResidentReachabilityNotificationManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  HMDResidentReachabilityNotificationManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentReachabilityNotificationManager evaluateDebounceTimer](self, "evaluateDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Debounce timer fired", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentReachabilityNotificationManager setEvaluateDebounceTimer:](v8, "setEvaluateDebounceTimer:", 0);
    -[HMDResidentReachabilityNotificationManager _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:](v8, "_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:", 1);
  }
  -[HMDResidentReachabilityNotificationManager unreachableBulletinDebounceTimer](self, "unreachableBulletinDebounceTimer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Unreachable Bulletin Timer fired", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](v13, "setUnreachableBulletinDebounceTimer:", 0);
    -[HMDResidentReachabilityNotificationManager _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:](v13, "_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:", 0);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDResidentReachabilityContext)reachabilityContext
{
  return (HMDResidentReachabilityContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReachabilityContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  return (HMDRemoteDeviceMonitor *)objc_loadWeakRetained((id *)&self->_deviceMonitor);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (HMDIDSServerBag)idsServerBag
{
  return (HMDIDSServerBag *)objc_loadWeakRetained((id *)&self->_idsServerBag);
}

- (HMFTimer)evaluateDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEvaluateDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMFTimer)unreachableBulletinDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUnreachableBulletinDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)notificationEnabled
{
  return self->_notificationEnabled;
}

- (void)setNotificationEnabled:(BOOL)a3
{
  self->_notificationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreachableBulletinDebounceTimer, 0);
  objc_storeStrong((id *)&self->_evaluateDebounceTimer, 0);
  objc_destroyWeak((id *)&self->_idsServerBag);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_deviceMonitor);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_reachabilityContext, 0);
}

uint64_t __97__HMDResidentReachabilityNotificationManager_anyEnabledResidentSupportsReachabilityNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCameraRecordingReachabilityNotifications");

  return v3;
}

uint64_t __66__HMDResidentReachabilityNotificationManager_hasMultipleResidents__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCameraRecording");

  return v3;
}

uint64_t __67__HMDResidentReachabilityNotificationManager_hasReachableResidents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsCameraRecording"))
    v4 = objc_msgSend(v2, "isReachable");
  else
    v4 = 0;

  return v4;
}

uint64_t __79__HMDResidentReachabilityNotificationManager__handleCameraProfileUnconfigured___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received a camera profile is unconfigured, updating notification enabled if needed", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "updateNotificationEnabled");
}

uint64_t __84__HMDResidentReachabilityNotificationManager__handleCameraProfileSettingsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Received camera profile settings did change notification, updating notification enabled if needed", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("HMDCameraProfileSettingsIsInitialSettingsUpdateNotificationKey"));

  if (!v7)
    return objc_msgSend(*(id *)(a1 + 32), "updateNotificationEnabled");
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Initial settings update", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  return objc_msgSend(*(id *)(a1 + 32), "setNotificationEnabled:", objc_msgSend(*(id *)(a1 + 32), "isReachabilityEventNotificationEnabledForAnyCamera"));
}

uint64_t __69__HMDResidentReachabilityNotificationManager__handleResidentUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Resident Reachability changed, checking home: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:", 1);
}

void __69__HMDResidentReachabilityNotificationManager__handleResidentRemoved___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  HMDResidentReachabilityContext *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEvaluateDebounceTimer:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "anyEnabledResidentSupportsReachabilityNotifications");
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was removed, starting debounce timer", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimer");
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Last resident was reomved", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v9 = -[HMDResidentReachabilityContext initWithMostRecentReachability:]([HMDResidentReachabilityContext alloc], "initWithMostRecentReachability:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setReachabilityContext:", v9);

    objc_msgSend(*(id *)(a1 + 32), "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveToCurrentAccountWithReason:", CFSTR("All residents were removed"));

  }
}

uint64_t __67__HMDResidentReachabilityNotificationManager__handleResidentAdded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "evaluateDebounceTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRunning");
    v8 = &stru_1E89C3E38;
    if (v7)
      v8 = CFSTR("re");
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was added, %@starting debounce timer", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setEvaluateDebounceTimer:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimer");
}

uint64_t __79__HMDResidentReachabilityNotificationManager__handleNetworkReachabilityChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "deviceMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReachable");

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became reachable, starting debounce timer", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    return objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimer");
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became unreachable, clearing debounce timer", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    return objc_msgSend(*(id *)(a1 + 32), "setEvaluateDebounceTimer:", 0);
  }
}

uint64_t __128__HMDResidentReachabilityNotificationManager_configureWithHome_deviceMonitor_notificationCenter_idsServerBag_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t result;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting debounce timer", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_startDebounceTimer");
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "residentDeviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", v7, sel__handleResidentUpdated_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), v8);

  v10 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "residentDeviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", v10, sel__handleResidentAdded_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), v11);

  v13 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "residentDeviceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v13, sel__handleResidentRemoved_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), v14);

  objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleNetworkReachabilityChange_, CFSTR("HMDRemoteDeviceMonitorReachableNotification"), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleCameraProfileSettingsDidChange_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), 0);
  objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handleCameraProfileUnconfigured_, CFSTR("HMDCameraProfileUnconfiguredNotification"), 0);
  objc_msgSend(*(id *)(a1 + 32), "setNotificationEnabled:", objc_msgSend(*(id *)(a1 + 32), "isReachabilityEventNotificationEnabledForAnyCamera"));
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __92__HMDResidentReachabilityNotificationManager_initWithResidentReachabilityContext_workQueue___block_invoke(double a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t30_133364 != -1)
    dispatch_once(&logCategory__hmf_once_t30_133364, &__block_literal_global_33_133365);
  return (id)logCategory__hmf_once_v31_133366;
}

void __57__HMDResidentReachabilityNotificationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v31_133366;
  logCategory__hmf_once_v31_133366 = v0;

}

@end
