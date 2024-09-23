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
  v9 = -[HMDResidentReachabilityNotificationManager initWithResidentReachabilityContext:workQueue:timerFactory:bulletinBoard:](self, "initWithResidentReachabilityContext:workQueue:timerFactory:bulletinBoard:", v7, v6, &__block_literal_global_186311, v8);

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
  HMDResidentReachabilityContext *v19;
  HMDResidentReachabilityContext *userPreferredReachabilityContext;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDResidentReachabilityNotificationManager;
  v15 = -[HMDResidentReachabilityNotificationManager init](&v22, sel_init);
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
    v19 = objc_alloc_init(HMDResidentReachabilityContext);
    userPreferredReachabilityContext = v16->_userPreferredReachabilityContext;
    v16->_userPreferredReachabilityContext = v19;

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

  v6 = (void *)MEMORY[0x24BDD16D0];
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __128__HMDResidentReachabilityNotificationManager_configureWithHome_deviceMonitor_notificationCenter_idsServerBag_completionHandler___block_invoke;
  block[3] = &unk_24E799A68;
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDResidentReachabilityNotificationManager__handleNetworkReachabilityChange___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleResidentAdded:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMDResidentReachabilityNotificationManager__handleResidentAdded___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleResidentRemoved:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentRemoved___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleResidentUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentUpdated___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleUserPreferredResidentReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__HMDResidentReachabilityNotificationManager__handleUserPreferredResidentReachable___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleUserPreferredReachabilityBulletinDebounceTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDResidentReachabilityNotificationManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDResidentReachabilityContext *v16;
  void *v17;
  HMDResidentReachabilityContext *v18;
  void *v19;
  HMDResidentReachabilityNotificationManager *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userSelectedPreferredResident");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v22;
      v23 = "%{public}@Home is no longer in manual selection, ignore preferred reachability bulletin";
      v24 = v21;
      v25 = OS_LOG_TYPE_INFO;
      v26 = 12;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v24, v25, v23, (uint8_t *)&v27, v26);

    }
LABEL_12:

    objc_autoreleasePoolPop(v19);
    goto LABEL_13;
  }
  if (!-[HMDResidentReachabilityNotificationManager shouldPostUserPreferredReachableNotification](self, "shouldPostUserPreferredReachableNotification")&& !-[HMDResidentReachabilityNotificationManager shouldPostUserPreferredUnreachableNotification](self, "shouldPostUserPreferredUnreachableNotification"))
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v22;
      v29 = 1024;
      LODWORD(v30) = -[HMDResidentReachabilityNotificationManager isUserPreferredReachable](v20, "isUserPreferredReachable");
      v23 = "%{public}@Not posting reachable: %{BOOL}d notification due to no previous situation";
      v24 = v21;
      v25 = OS_LOG_TYPE_DEFAULT;
      v26 = 18;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentReachabilityNotificationManager home](v7, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v9;
    v29 = 2112;
    v30 = v11;
    v31 = 1024;
    v32 = -[HMDResidentReachabilityNotificationManager isUserPreferredReachable](v7, "isUserPreferredReachable");
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Posting user perferred resident reachable notification for home: %@, reachable: %{BOOL}d", (uint8_t *)&v27, 0x1Cu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDResidentReachabilityNotificationManager bulletinBoard](v7, "bulletinBoard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDResidentReachabilityNotificationManager isUserPreferredReachable](v7, "isUserPreferredReachable");
  -[HMDResidentReachabilityNotificationManager electedPrimary](v7, "electedPrimary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentReachabilityNotificationManager previousPrimary](v7, "previousPrimary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertUserPreferredHomeHubReachabilityBulletinForHome:reachable:electedPrimary:previousPrimary:", v4, v13, v14, v15);

  v16 = [HMDResidentReachabilityContext alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDResidentReachabilityNotificationManager isUserPreferredReachable](v7, "isUserPreferredReachable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDResidentReachabilityContext initWithMostRecentReachability:](v16, "initWithMostRecentReachability:", v17);
  -[HMDResidentReachabilityNotificationManager setUserPreferredReachabilityContext:](v7, "setUserPreferredReachabilityContext:", v18);

LABEL_13:
}

- (BOOL)shouldPostUserPreferredReachableNotification
{
  void *v3;
  void *v4;
  int v5;

  if (-[HMDResidentReachabilityNotificationManager isUserPreferredReachable](self, "isUserPreferredReachable"))
  {
    -[HMDResidentReachabilityNotificationManager userPreferredReachabilityContext](self, "userPreferredReachabilityContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mostRecentReachability");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = objc_msgSend(v4, "BOOLValue") ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)shouldPostUserPreferredUnreachableNotification
{
  char v3;
  void *v4;
  void *v5;

  if (-[HMDResidentReachabilityNotificationManager isUserPreferredReachable](self, "isUserPreferredReachable"))
    return 0;
  -[HMDResidentReachabilityNotificationManager userPreferredReachabilityContext](self, "userPreferredReachabilityContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mostRecentReachability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v3 = objc_msgSend(v5, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (void)_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  HMDResidentReachabilityNotificationManager *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  HMDResidentReachabilityNotificationManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  HMDResidentReachabilityNotificationManager *v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDResidentReachabilityNotificationManager *v30;
  NSObject *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  HMDResidentReachabilityNotificationManager *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDResidentReachabilityContext *v40;
  HMDResidentReachabilityContext *v41;
  const __CFString *v42;
  void *v43;
  HMDResidentReachabilityNotificationManager *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  HMDResidentReachabilityNotificationManager *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDResidentReachabilityNotificationManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  HMDResidentReachabilityContext *v58;
  HMDResidentReachabilityContext *v59;
  int v60;
  void *v61;
  uint64_t v62;

  v3 = a3;
  v62 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentReachabilityNotificationManager deviceMonitor](self, "deviceMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isReachable");

  if ((v7 & 1) != 0)
  {
    -[HMDResidentReachabilityNotificationManager evaluateDebounceTimer](self, "evaluateDebounceTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 138543362;
        v61 = v12;
        v13 = "%{public}@Debounce timer active, delaying check";
LABEL_15:
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v60, 0xCu);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    if (!-[HMDResidentReachabilityNotificationManager anyEnabledResidentSupportsReachabilityNotifications](self, "anyEnabledResidentSupportsReachabilityNotifications"))
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 138543362;
        v61 = v12;
        v13 = "%{public}@No enabled resident supports Reachability Notifications";
        goto LABEL_15;
      }
LABEL_16:

      objc_autoreleasePoolPop(v9);
      return;
    }
    -[HMDResidentReachabilityNotificationManager home](self, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "currentUser");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isRestrictedGuest");

      if (!v21)
      {
        if (-[HMDResidentReachabilityNotificationManager hasReachableResidents](self, "hasReachableResidents"))
        {
          -[HMDResidentReachabilityNotificationManager unreachableBulletinDebounceTimer](self, "unreachableBulletinDebounceTimer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "suspend");

          v29 = (void *)MEMORY[0x227676638](-[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](self, "setUnreachableBulletinDebounceTimer:", 0));
          v30 = self;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 138543362;
            v61 = v32;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Home has reachable residents supporting notification", (uint8_t *)&v60, 0xCu);

          }
          objc_autoreleasePoolPop(v29);
          v33 = -[HMDResidentReachabilityNotificationManager shouldPostReachableNotification](v30, "shouldPostReachableNotification");
          v34 = (void *)MEMORY[0x227676638]();
          v35 = v30;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if (!v33)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = 138543362;
              v61 = v52;
              _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Not posting reachable notification due to no previous unreachable notification posted or previously posting reachable notification", (uint8_t *)&v60, 0xCu);

            }
            v27 = v34;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 138543362;
            v61 = v38;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Posting reachable notification", (uint8_t *)&v60, 0xCu);

          }
          objc_autoreleasePoolPop(v34);
          -[HMDResidentReachabilityNotificationManager bulletinBoard](v35, "bulletinBoard");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v19, 1, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v35, "hasMultipleResidents"));

          v40 = [HMDResidentReachabilityContext alloc];
          v41 = -[HMDResidentReachabilityContext initWithMostRecentReachability:](v40, "initWithMostRecentReachability:", MEMORY[0x24BDBD1C8]);
          -[HMDResidentReachabilityNotificationManager setReachabilityContext:](v35, "setReachabilityContext:", v41);

          v42 = CFSTR("Posted reachable resident notification");
        }
        else
        {
          v43 = (void *)MEMORY[0x227676638]();
          v44 = self;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 138543362;
            v61 = v46;
            _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Home does not have reachable residents supporting camera recording", (uint8_t *)&v60, 0xCu);

          }
          objc_autoreleasePoolPop(v43);
          if (!-[HMDResidentReachabilityNotificationManager shouldPostUnreachableNotification](v44, "shouldPostUnreachableNotification"))
          {
            v22 = MEMORY[0x227676638]();
            v23 = v44;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              goto LABEL_21;
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 138543362;
            v61 = v25;
            v26 = "%{public}@Not posting unreachable notification due to previously posting unreachable notification";
            goto LABEL_20;
          }
          if (v3)
          {
            v47 = (void *)MEMORY[0x227676638]();
            v48 = v44;
            HMFGetOSLogHandle();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = 138543362;
              v61 = v50;
              _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting resident discovery before posting unreachable notification", (uint8_t *)&v60, 0xCu);

            }
            objc_autoreleasePoolPop(v47);
            objc_msgSend(v19, "residentDeviceManager");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "discoverPrimaryResidentForRequester:", 0);

            -[HMDResidentReachabilityNotificationManager _startUnreachableBulletinDebounceTimer](v48, "_startUnreachableBulletinDebounceTimer");
            goto LABEL_23;
          }
          v53 = (void *)MEMORY[0x227676638](-[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](v44, "setUnreachableBulletinDebounceTimer:", 0));
          v54 = v44;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 138543362;
            v61 = v56;
            _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Posting unreachable notification", (uint8_t *)&v60, 0xCu);

          }
          objc_autoreleasePoolPop(v53);
          -[HMDResidentReachabilityNotificationManager bulletinBoard](v54, "bulletinBoard");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v19, 0, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v54, "hasMultipleResidents"));

          v58 = [HMDResidentReachabilityContext alloc];
          v59 = -[HMDResidentReachabilityContext initWithMostRecentReachability:](v58, "initWithMostRecentReachability:", MEMORY[0x24BDBD1C0]);
          -[HMDResidentReachabilityNotificationManager setReachabilityContext:](v54, "setReachabilityContext:", v59);

          v42 = CFSTR("Posted no reachable resident notification");
        }
        objc_msgSend(v19, "saveToCurrentAccountWithReason:", v42);
        goto LABEL_23;
      }
      v22 = MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 138543362;
        v61 = v25;
        v26 = "%{public}@Current user is a guest in this home, suppressing resident reachability update bulletin";
LABEL_20:
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v60, 0xCu);

      }
    }
    else
    {
      v22 = MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 138543362;
        v61 = v25;
        v26 = "%{public}@Our home has been deallocated";
        goto LABEL_20;
      }
    }
LABEL_21:

    v27 = (void *)v22;
LABEL_22:
    objc_autoreleasePoolPop(v27);
LABEL_23:

    return;
  }
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 138543362;
    v61 = v17;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Network unreachable, clearing debounce timer and delaying check until reachable", (uint8_t *)&v60, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDResidentReachabilityNotificationManager setEvaluateDebounceTimer:](v15, "setEvaluateDebounceTimer:", 0);
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
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_26_186262);

  return v4;
}

- (BOOL)hasMultipleResidents
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledResidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (BOOL)anyEnabledResidentSupportsReachabilityNotifications
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDResidentReachabilityNotificationManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledResidents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

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

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentReachabilityNotificationManager evaluateDebounceTimer](self, "evaluateDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Debounce timer already active", buf, 0xCu);

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

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDResidentReachabilityNotificationManager unreachableBulletinDebounceTimer](self, "unreachableBulletinDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Unreachable bulletin timer already active", buf, 0xCu);

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

  v26 = *MEMORY[0x24BDAC8D0];
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
      v8 = (void *)MEMORY[0x227676638](v6);
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@ResidentReachabilityNotificationAfterConnectivityDelay from IDS is 0.0 so disabling and not posting reachability notification", (uint8_t *)&v22, 0xCu);

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
  v15 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Creating time for %f", (uint8_t *)&v22, 0x16u);

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
  id v16;
  void *v17;
  HMDResidentReachabilityNotificationManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDResidentReachabilityNotificationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentReachabilityNotificationManager evaluateDebounceTimer](self, "evaluateDebounceTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Debounce timer fired", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDResidentReachabilityNotificationManager setEvaluateDebounceTimer:](v8, "setEvaluateDebounceTimer:", 0);
    -[HMDResidentReachabilityNotificationManager _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:](v8, "_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:", 1);
  }
  -[HMDResidentReachabilityNotificationManager unreachableBulletinDebounceTimer](self, "unreachableBulletinDebounceTimer");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Unreachable Bulletin Timer fired", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](v13, "setUnreachableBulletinDebounceTimer:", 0);
    -[HMDResidentReachabilityNotificationManager _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:](v13, "_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:", 0);
  }
  -[HMDResidentReachabilityNotificationManager userPreferredReachabilityBulletinDebounceTimer](self, "userPreferredReachabilityBulletinDebounceTimer");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v4)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@User preferred resident Reachability Bulletin Timer fired", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDResidentReachabilityNotificationManager setUserPreferredReachabilityBulletinDebounceTimer:](v18, "setUserPreferredReachabilityBulletinDebounceTimer:", 0);
    -[HMDResidentReachabilityNotificationManager _handleUserPreferredReachabilityBulletinDebounceTimer](v18, "_handleUserPreferredReachabilityBulletinDebounceTimer");
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

- (HMFTimer)userPreferredReachabilityBulletinDebounceTimer
{
  return self->_userPreferredReachabilityBulletinDebounceTimer;
}

- (void)setUserPreferredReachabilityBulletinDebounceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_userPreferredReachabilityBulletinDebounceTimer, a3);
}

- (NSString)previousPrimary
{
  return self->_previousPrimary;
}

- (void)setPreviousPrimary:(id)a3
{
  objc_storeStrong((id *)&self->_previousPrimary, a3);
}

- (NSString)electedPrimary
{
  return self->_electedPrimary;
}

- (void)setElectedPrimary:(id)a3
{
  objc_storeStrong((id *)&self->_electedPrimary, a3);
}

- (BOOL)isUserPreferredReachable
{
  return self->_isUserPreferredReachable;
}

- (void)setIsUserPreferredReachable:(BOOL)a3
{
  self->_isUserPreferredReachable = a3;
}

- (HMDResidentReachabilityContext)userPreferredReachabilityContext
{
  return (HMDResidentReachabilityContext *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUserPreferredReachabilityContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPreferredReachabilityContext, 0);
  objc_storeStrong((id *)&self->_electedPrimary, 0);
  objc_storeStrong((id *)&self->_previousPrimary, 0);
  objc_storeStrong((id *)&self->_userPreferredReachabilityBulletinDebounceTimer, 0);
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

uint64_t __67__HMDResidentReachabilityNotificationManager_hasReachableResidents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReachableByIDS");
}

void __84__HMDResidentReachabilityNotificationManager__handleUserPreferredResidentReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void (**v28)(double);
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsUserPreferredReachable:", objc_msgSend(v2, "hmf_BOOLForKey:", CFSTR("HMDResidentDeviceManagerUserPreferredResidentReachabilityKey")));

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_stringForKey:", CFSTR("HMDResidentDeviceManagerUserPreferredResidentNameKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPreviousPrimary:", v4);

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_stringForKey:", CFSTR("HMDResidentDeviceManagerBackupResidentNameKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setElectedPrimary:", v6);

  objc_msgSend(*(id *)(a1 + 32), "userPreferredReachabilityBulletinDebounceTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@User preferred reachability changed, start a debounce timer", (uint8_t *)&v34, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "idsServerBag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "residentSelectionUserPreferredReachabilityNotificationDelay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(v15, "doubleValue");
      if (fabs(v17) < 2.22044605e-16)
      {
        v18 = (void *)MEMORY[0x227676638](v16);
        v19 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543362;
          v35 = v21;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@ResidentSelectionUserPreferredReachabilityNotificationDelay from IDS is 0.0 so disabling and not posting user preferred reachability notification", (uint8_t *)&v34, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
LABEL_17:

        return;
      }
      objc_msgSend(v15, "doubleValue");
      v22 = v23;
    }
    else
    {
      v22 = 600.0;
    }
    v24 = (void *)MEMORY[0x227676638]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v27;
      v36 = 2048;
      v37 = v22;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@User preferred reachability changed, start a debounce timer with delay %f", (uint8_t *)&v34, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(*(id *)(a1 + 32), "timerFactory");
    v28 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v28[2](v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUserPreferredReachabilityBulletinDebounceTimer:", v29);

    objc_msgSend(*(id *)(a1 + 32), "userPreferredReachabilityBulletinDebounceTimer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDelegate:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "userPreferredReachabilityBulletinDebounceTimer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegateQueue:", v32);

    objc_msgSend(*(id *)(a1 + 32), "userPreferredReachabilityBulletinDebounceTimer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "resume");

    goto LABEL_17;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543362;
    v35 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@User preferred reachability bulletin debounce timer is active", (uint8_t *)&v34, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
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

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resident Reachability changed, checking home: %@", (uint8_t *)&v9, 0x16u);

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

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setEvaluateDebounceTimer:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "anyEnabledResidentSupportsReachabilityNotifications");
  v3 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was removed, starting debounce timer", (uint8_t *)&v11, 0xCu);

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
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Last resident was reomved", (uint8_t *)&v11, 0xCu);

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

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
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
    v8 = &stru_24E79DB48;
    if (v7)
      v8 = CFSTR("re");
    v10 = 138543618;
    v11 = v5;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was added, %@starting debounce timer", (uint8_t *)&v10, 0x16u);

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

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "deviceMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReachable");

  v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became reachable, starting debounce timer", (uint8_t *)&v11, 0xCu);

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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became unreachable, clearing debounce timer", (uint8_t *)&v11, 0xCu);

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
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t result;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543362;
    v20 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting debounce timer", (uint8_t *)&v19, 0xCu);

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
  v16 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "residentDeviceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", v16, sel__handleUserPreferredResidentReachable_, CFSTR("HMDResidentDeviceManagerUserPreferredResidentReachabilityNotification"), v17);

  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __92__HMDResidentReachabilityNotificationManager_initWithResidentReachabilityContext_workQueue___block_invoke(double a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33_186314 != -1)
    dispatch_once(&logCategory__hmf_once_t33_186314, &__block_literal_global_27_186315);
  return (id)logCategory__hmf_once_v34_186316;
}

void __57__HMDResidentReachabilityNotificationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v34_186316;
  logCategory__hmf_once_v34_186316 = v0;

}

@end
