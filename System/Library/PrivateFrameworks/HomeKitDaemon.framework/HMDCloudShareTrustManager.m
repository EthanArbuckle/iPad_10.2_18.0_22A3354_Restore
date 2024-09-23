@implementation HMDCloudShareTrustManager

- (HMDCloudShareTrustManager)initWithDatabase:(id)a3 isOwnedTrust:(BOOL)a4 queue:(id)a5 shareMessenger:(id)a6 ownerCloudShareID:(id)a7 logEventSubmitter:(id)a8 dailyScheduler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  HMDCloudShareTrustManager *v20;
  HMDCloudShareTrustManager *v21;
  id participantsManagerFactory;
  id requestInviteTimerFactory;
  HMDCloudShareTrustManagerMetricsEventDispatcher *v24;
  void *v25;
  uint64_t v26;
  HMDCloudShareTrustManagerMetricsEventDispatcher *metricsEventDispatcher;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)HMDCloudShareTrustManager;
  v20 = -[HMDCloudShareTrustManager init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_queue, a5);
    v21->_ownedTrust = a4;
    objc_storeStrong((id *)&v21->_ownerCloudShareID, a7);
    objc_storeStrong((id *)&v21->_database, a3);
    -[HMDDatabase addDelegate:](v21->_database, "addDelegate:", v21, v29, v30);
    v21->_configureState = 0;
    objc_storeStrong((id *)&v21->_cloudShareMessenger, a6);
    -[HMDCloudShareMessenger setDelegate:](v21->_cloudShareMessenger, "setDelegate:", v21);
    participantsManagerFactory = v21->_participantsManagerFactory;
    v21->_participantsManagerFactory = &__block_literal_global_34114;

    requestInviteTimerFactory = v21->_requestInviteTimerFactory;
    v21->_requestInviteTimerFactory = &__block_literal_global_2_34115;

    if (v18 && v19)
    {
      v24 = [HMDCloudShareTrustManagerMetricsEventDispatcher alloc];
      objc_msgSend(v16, "messageTargetUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMDCloudShareTrustManagerMetricsEventDispatcher initWithIdentifier:logEventSubmitter:dailyScheduler:dataSource:](v24, "initWithIdentifier:logEventSubmitter:dailyScheduler:dataSource:", v25, v18, v19, v21);
      metricsEventDispatcher = v21->_metricsEventDispatcher;
      v21->_metricsEventDispatcher = (HMDCloudShareTrustManagerMetricsEventDispatcher *)v26;

    }
    -[HMDCloudShareTrustManagerMetricsEventDispatcher registerForDailyTrustManagerEvents](v21->_metricsEventDispatcher, "registerForDailyTrustManagerEvents");
  }

  return v21;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeForCloudShareTrustManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_homeDidBecomeTrustZoneCapable_, CFSTR("HMDHomeOwnerBecameTrustZoneCapableNotification"), v4);

  -[HMDCloudShareTrustManager _configure](self, "_configure");
}

- (void)_configure
{
  NSObject *v3;
  void *v4;
  HMDCloudShareTrustManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  HMDCloudShareTrustManager *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCloudShareTrustManager configureState](self, "configureState"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMDCloudShareTrustManagerConfigureStateAsString(-[HMDCloudShareTrustManager configureState](v5, "configureState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping cloud share trust configure. Trust already in configure state: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDCloudShareTrustManager setConfigureState:](self, "setConfigureState:", 1);
    -[HMDCloudShareTrustManager cloudShareMessenger](self, "cloudShareMessenger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configure");

    v10 = -[HMDCloudShareTrustManager isOwnedTrust](self, "isOwnedTrust");
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v15;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring cloud share trust with owned trust", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDCloudShareTrustManager _configureWithOwnedZone](v12, "_configureWithOwnedZone");
    }
    else
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring cloud share trust with shared trust", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDCloudShareTrustManager _configureWithSharedZone](v12, "_configureWithSharedZone");
    }
  }
}

- (void)_configureWithOwnedZone
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x24BE4ECF0]);
  objc_msgSend(v4, "setShouldRebuildOnManateeKeyLoss:", 1);
  -[HMDCloudShareTrustManager database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneNameForCloudShareTrustManager:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "privateZonesWithName:configuration:delegate:error:", v7, v4, self, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;

  -[HMDCloudShareTrustManager _configureWithFetchZoneResult:error:](self, "_configureWithFetchZoneResult:error:", v8, v9);
}

- (void)_configureWithSharedZone
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudShareTrustManager *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerSharedSubscriptionForExternalRecordType:", 0);

  -[HMDCloudShareTrustManager database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneNameForCloudShareTrustManager:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingSharedZoneIDWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Got zoneID for shared trust zone: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCloudShareTrustManager database](v11, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x24BE4EC68]);
    v20 = 0;
    objc_msgSend(v15, "sharedZonesWithID:configuration:delegate:error:", v9, v16, v11, &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;

    -[HMDCloudShareTrustManager _configureWithFetchZoneResult:error:](v11, "_configureWithFetchZoneResult:error:", v17, v18);
  }
  else
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v19;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@No shared trust zone exists yet", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCloudShareTrustManager _requestShareInvitationForSharedZone](v11, "_requestShareInvitationForSharedZone");
    -[HMDCloudShareTrustManager setConfigureState:](v11, "setConfigureState:", 0);
  }

}

- (void)_requestShareInvitationForSharedZone
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCloudShareTrustManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCloudShareTrustManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCloudShareTrustManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isOwnerCapableForTrustManager:", self) & 1) != 0)
  {
    -[HMDCloudShareTrustManager ownerCloudShareID](self, "ownerCloudShareID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@We have a cloud share ID for the owner, but we aren't invited to the share", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
    -[HMDCloudShareTrustManager _startRequestInviteTimer](self, "_startRequestInviteTimer");
    objc_msgSend(v4, "ownerForCloudShareTrustManager:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Requesting trust zone share invitation from trust owner with id: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCloudShareTrustManager cloudShareMessenger](v12, "cloudShareMessenger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "requestShareInvitationDataFromUser:", v10);

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Skipping request for trust invitation due to owner being incapable of setting up trust", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)_configureWithFetchZoneResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCloudShareTrustManager *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCloudShareTrustManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  const __CFString *v36;
  uint64_t v37;
  _BYTE v38[22];
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v38 = 138543362;
      *(_QWORD *)&v38[4] = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Did fetch trust cloud zone", v38, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v6, "cloudZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudShareTrustManager setCloudZone:](v10, "setCloudZone:", v14);

    if (-[HMDCloudShareTrustManager isOwnedTrust](v10, "isOwnedTrust"))
    {
      -[HMDCloudShareTrustManager cloudZone](v10, "cloudZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v15, "registerSubscriptionForExternalRecordType:", 0);

    }
    objc_msgSend(v6, "localZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudShareTrustManager setLocalZone:](v10, "setLocalZone:", v17);

    -[HMDCloudShareTrustManager localZone](v10, "localZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startUp");

    if (-[HMDCloudShareTrustManager isOwnedTrust](v10, "isOwnedTrust"))
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v10;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v38 = 138543362;
        *(_QWORD *)&v38[4] = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Starting participant manager to share trust zone", v38, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      -[HMDCloudShareTrustManager dataSource](v20, "dataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "homeForCloudShareTrustManager:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDCloudShareTrustManager participantsManagerFactory](v20, "participantsManagerFactory");
      v25 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HMDCloudShareTrustManager queue](v20, "queue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cloudZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, void *))v25)[2](v25, v26, v27, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudShareTrustManager setCloudShareParticipantsManager:](v20, "setCloudShareParticipantsManager:", v28);

      -[HMDCloudShareTrustManager cloudShareParticipantsManager](v20, "cloudShareParticipantsManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setDataSource:", v20);

      -[HMDCloudShareTrustManager cloudShareParticipantsManager](v20, "cloudShareParticipantsManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setDelegate:", v20);

      -[HMDCloudShareTrustManager cloudShareParticipantsManager](v20, "cloudShareParticipantsManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "configure");

      -[HMDCloudShareTrustManager cloudShareParticipantsManager](v20, "cloudShareParticipantsManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "updateShareParticipants");

    }
    objc_msgSend(v6, "cloudZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudShareTrustManager _configureOwnerCloudShareIDWithCloudZone:](v10, "_configureOwnerCloudShareIDWithCloudZone:", v33);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[HMDCloudShareTrustManager isOwnedTrust](v10, "isOwnedTrust");
      v36 = CFSTR("Shared Zone");
      *(_DWORD *)v38 = 138543874;
      *(_QWORD *)&v38[4] = v34;
      *(_WORD *)&v38[12] = 2112;
      if (v35)
        v36 = CFSTR("Owned Zone");
      *(_QWORD *)&v38[14] = v36;
      v39 = 2112;
      v40 = v7;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to open trust zone: %@, error: %@", v38, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCloudShareTrustManager setConfigureState:](v10, "setConfigureState:", 0);
    -[HMDCloudShareTrustManager metricsEventDispatcher](v10, "metricsEventDispatcher");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDCloudShareTrustManager isOwnedTrust](v10, "isOwnedTrust"))
      v37 = 1;
    else
      v37 = 2;
    objc_msgSend(v33, "submitFailureEventWithEventErrorCode:error:", v37, v7, *(_OWORD *)v38);
  }

}

- (void)_configureOwnerCloudShareIDWithCloudZone:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCloudShareTrustManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching trust owner cloud share id", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "fetchOwnerParticipantCloudShareID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE6B628];
  -[HMDCloudShareTrustManager queue](v7, "queue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "schedulerWithDispatchQueue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reschedule:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke;
  v19[3] = &unk_24E79BD80;
  v19[4] = v7;
  v16 = (id)objc_msgSend(v14, "addFailureBlock:", v19);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke_15;
  v18[3] = &unk_24E77A0D8;
  v18[4] = v7;
  v17 = (id)objc_msgSend(v14, "addSuccessBlock:", v18);

}

- (void)_finishConfigure
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCloudShareTrustManager *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager setConfigureState:](self, "setConfigureState:", 2);
  -[HMDCloudShareTrustManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didFinishConfiguringForCloudShareTrustManager:", self);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Trust manager finished configuring", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDCloudShareTrustManager isOwnedTrust](v6, "isOwnedTrust"))
  {
    -[HMDCloudShareTrustManager updateCloudShareIDForAllUsers](v6, "updateCloudShareIDForAllUsers");
    -[HMDCloudShareTrustManager discoverUntrustedUsers](v6, "discoverUntrustedUsers");
  }
  else
  {
    -[HMDCloudShareTrustManager updateCurrentUserCloudShareID](v6, "updateCurrentUserCloudShareID");
  }
}

- (BOOL)isTrustConfigured
{
  return -[HMDCloudShareTrustManager configureState](self, "configureState") == 2;
}

- (void)removeTrust
{
  NSObject *v3;
  void *v4;
  HMDCloudShareTrustManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  HMDCloudShareTrustManager *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCloudShareTrustManager configureState](self, "configureState") == 3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMDCloudShareTrustManagerConfigureStateAsString(-[HMDCloudShareTrustManager configureState](v5, "configureState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v7;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Skipping remove trust due to configure state: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDCloudShareTrustManager setConfigureState:](self, "setConfigureState:", 3);
    -[HMDCloudShareTrustManager cloudShareMessenger](self, "cloudShareMessenger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unconfigure");

    -[HMDCloudShareTrustManager dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "zoneNameForCloudShareTrustManager:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[HMDCloudShareTrustManager isOwnedTrust](self, "isOwnedTrust");
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Removing owned cloud share trust", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDCloudShareTrustManager database](v14, "database");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removePrivateZonesWithName:", v11);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v32 = v20;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Removing shared cloud share trust", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      -[HMDCloudShareTrustManager database](v14, "database");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeSharedZonesWithName:", v11);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v19;
    v22 = (void *)MEMORY[0x24BE6B628];
    -[HMDCloudShareTrustManager queue](v14, "queue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "schedulerWithDispatchQueue:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reschedule:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __40__HMDCloudShareTrustManager_removeTrust__block_invoke;
    v30[3] = &unk_24E79BD80;
    v30[4] = v14;
    v27 = (id)objc_msgSend(v25, "addFailureBlock:", v30);
    v29[0] = v26;
    v29[1] = 3221225472;
    v29[2] = __40__HMDCloudShareTrustManager_removeTrust__block_invoke_17;
    v29[3] = &unk_24E79BCF0;
    v29[4] = v14;
    v28 = (id)objc_msgSend(v25, "addSuccessBlock:", v29);

  }
}

- (void)updateCurrentUserCloudShareID
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];

  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager cloudZone](self, "cloudZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchCurrentParticipantCloudShareID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE6B628];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedulerWithDispatchQueue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke;
  v14[3] = &unk_24E79BD80;
  v14[4] = self;
  v11 = (id)objc_msgSend(v9, "addFailureBlock:", v14);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke_19;
  v13[3] = &unk_24E77A0D8;
  v13[4] = self;
  v12 = (id)objc_msgSend(v9, "addSuccessBlock:", v13);

}

- (void)updateCloudShareIDForAllUsers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeForCloudShareTrustManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v5, "users", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[HMDCloudShareTrustManager updateCloudShareIDForUser:](self, "updateCloudShareIDForUser:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)updateCloudShareIDForUser:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCloudShareTrustManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((objc_msgSend(v4, "isOwner") & 1) == 0)
  {
    objc_msgSend(v4, "cloudShareID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v10;
        v29 = 2112;
        v30 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud share ID for shared user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDCloudShareTrustManager cloudZone](v8, "cloudZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchCloudShareIDForShareParticipantClientIdentifier:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BE6B628];
      -[HMDCloudShareTrustManager queue](v8, "queue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "schedulerWithDispatchQueue:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reschedule:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = MEMORY[0x24BDAC760];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke;
      v25[3] = &unk_24E79BCC8;
      v25[4] = v8;
      v20 = v4;
      v26 = v20;
      v21 = (id)objc_msgSend(v18, "addFailureBlock:", v25);
      v23[0] = v19;
      v23[1] = 3221225472;
      v23[2] = __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke_20;
      v23[3] = &unk_24E77A100;
      v23[4] = v8;
      v24 = v20;
      v22 = (id)objc_msgSend(v18, "addSuccessBlock:", v23);

    }
  }

}

- (void)discoverUntrustedUsers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  HMDCloudShareTrustManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDCloudShareTrustManager *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self;
  objc_msgSend(v3, "homeForCloudShareTrustManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v4, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v11, "cloudShareID");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = objc_msgSend(v11, "isOwner");

          if ((v14 & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v8);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HMDCloudShareTrustManager cloudZone](v37, "cloudZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "participants");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v43 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "clientIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "userWithUUID:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v5, "removeObject:", v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v18);
  }
  v36 = v4;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v39 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v37;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v32;
          v52 = 2112;
          v53 = v33;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Discovered untrusted user with id: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        -[HMDCloudShareTrustManager delegate](v30, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "cloudShareTrustManager:didRemoveUserWithUUID:", v30, v35);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v25);
  }

}

- (void)sendShareInvitation:(id)a3 toUser:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCloudShareTrustManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeKitVersion *v23;
  void *v24;
  void *v25;
  HMDCloudShareTrustManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDCloudShareTrustManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD aBlock[5];
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (unint64_t)a5;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v40 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v40;
  if (v12)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke;
    aBlock[3] = &unk_24E789D30;
    aBlock[4] = self;
    v14 = (unint64_t)v9;
    v39 = (id)v14;
    v15 = _Block_copy(aBlock);
    if (!(v14 | v10))
      _HMFPreconditionFailure();
    v16 = v15;
    if (v14)
    {
      v35 = v9;
      v36 = v13;
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v14, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v20;
        v43 = 2112;
        v44 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending trust zone invitation to user: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDCloudShareTrustManager cloudShareMessenger](v18, "cloudShareMessenger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("6.0"));
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendShareInvitationData:toUser:minimumHomeKitVersion:requiredSupportedFeatures:completion:", v12, v14, v23, v24, v16);

      v9 = v35;
      v13 = v36;
    }
    else
    {
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = v13;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v33;
        v43 = 2112;
        v44 = v34;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Sending trust zone invitation to device: %@", buf, 0x16u);

        v13 = v37;
      }

      objc_autoreleasePoolPop(v30);
      -[HMDCloudShareTrustManager cloudShareMessenger](v31, "cloudShareMessenger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sendShareInvitationData:toDevice:completion:", v12, v10, v16);
    }

    goto LABEL_15;
  }
  v25 = (void *)MEMORY[0x227676638]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v28;
    v43 = 2112;
    v44 = v13;
    _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize trust zone invitation: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
  -[HMDCloudShareTrustManager metricsEventDispatcher](v26, "metricsEventDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "submitFailureEventWithEventErrorCode:error:", 10, v13);

LABEL_16:
}

- (void)homeDidBecomeTrustZoneCapable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDCloudShareTrustManager_homeDidBecomeTrustZoneCapable___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_homeDidBecomeTrustZoneCapable:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCloudShareTrustManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCloudShareTrustManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Owner is now capable of establishing trust zones", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCloudShareTrustManager requestInviteTimer](v7, "requestInviteTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v7;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping reconfigure since a request invite timer exists", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    -[HMDCloudShareTrustManager _configure](v7, "_configure");
  }

}

- (int64_t)configureState
{
  os_unfair_lock_s *p_lock;
  int64_t configureState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  configureState = self->_configureState;
  os_unfair_lock_unlock(p_lock);
  return configureState;
}

- (void)setConfigureState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDCloudShareTrustManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_configureState == 3)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMDCloudShareTrustManagerConfigureStateAsString(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Cannot change from removed state to: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCloudShareTrustManager metricsEventDispatcher](v7, "metricsEventDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "submitFailureEventWithEventErrorCode:", 5);

  }
  else
  {
    self->_configureState = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)cloudZone:(id)a3 didUpdateParticipantWithClientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCloudShareTrustManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HMDCloudShareTrustManager *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v11;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust zone updated participant with client identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCloudShareTrustManager dataSource](v9, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeForCloudShareTrustManager:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "userWithUUID:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[HMDCloudShareTrustManager queue](v9, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __80__HMDCloudShareTrustManager_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke;
    v20[3] = &unk_24E79C268;
    v20[4] = v9;
    v21 = v14;
    dispatch_async(v15, v20);

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find user with UUID matching updated participant client identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)cloudZone:(id)a3 didRemoveParticipantWithClientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCloudShareTrustManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Trust zone removed participant with client identifier: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCloudShareTrustManager delegate](v9, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cloudShareTrustManager:didRemoveUserWithUUID:", v9, v7);

}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCloudShareTrustManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trust zone created unknown model: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCloudShareTrustManager metricsEventDispatcher](v9, "metricsEventDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitFailureEventWithEventErrorCode:", 6);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCloudShareTrustManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trust zone deleted unknown model: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCloudShareTrustManager metricsEventDispatcher](v9, "metricsEventDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitFailureEventWithEventErrorCode:", 7);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCloudShareTrustManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trust zone updated unknown model: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCloudShareTrustManager metricsEventDispatcher](v9, "metricsEventDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitFailureEventWithEventErrorCode:", 8);

  return 0;
}

- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDCloudShareTrustManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received invitation request from user %@ and device %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDCloudShareTrustManager cloudShareParticipantsManager](v13, "cloudShareParticipantsManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inviteUser:usingDevice:", v9, v10);

}

- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDCloudShareTrustManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  HMDCloudShareTrustManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v47 = v15;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received trust zone invitation", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  v16 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  objc_msgSend(v16, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v17, v9, &v45);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v45;

  if (v18)
  {
    -[HMDCloudShareTrustManager database](v13, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "acceptInvitation:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BE6B628];
    -[HMDCloudShareTrustManager queue](v13, "queue");
    v23 = v10;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "schedulerWithDispatchQueue:", v24);
    v40 = v18;
    v25 = v19;
    v26 = v9;
    v27 = v8;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reschedule:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v23;
    v30 = MEMORY[0x24BDAC760];
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke;
    v43[3] = &unk_24E79B3A0;
    v43[4] = v13;
    v31 = v23;
    v44 = v31;
    v32 = (id)objc_msgSend(v29, "addFailureBlock:", v43);
    v41[0] = v30;
    v41[1] = 3221225472;
    v41[2] = __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke_36;
    v41[3] = &unk_24E77A128;
    v41[4] = v13;
    v33 = v31;
    v8 = v27;
    v9 = v26;
    v19 = v25;
    v18 = v40;
    v42 = v33;
    v34 = (id)objc_msgSend(v29, "addSuccessBlock:", v41);

  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v13;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v38;
      v48 = 2112;
      v49 = v19;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize trust zone invitation data, error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    -[HMDCloudShareTrustManager metricsEventDispatcher](v36, "metricsEventDispatcher");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "submitFailureEventWithEventErrorCode:error:", 9, v19);

    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v19);
  }

}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5;
  NSObject *v6;
  char v7;
  void *v8;

  v5 = a4;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[HMDCloudShareTrustManager configureState](self, "configureState") == 3)
  {
    v7 = 0;
  }
  else
  {
    -[HMDCloudShareTrustManager dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "cloudShareTrustManager:shouldShareTrustWithUser:", self, v5);

  }
  return v7;
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCloudShareTrustManager sendShareInvitation:toUser:device:](self, "sendShareInvitation:toUser:device:", v9, v7, 0);
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCloudShareTrustManager sendShareInvitation:toUser:device:](self, "sendShareInvitation:toUser:device:", v9, 0, v7);
}

- (BOOL)canUseUntrustedAccountHandlesForParticipantManager:(id)a3
{
  return 1;
}

- (BOOL)isFromOwner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeForCloudShareTrustManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "isOwner");
  else
    v7 = 0;

  return v7;
}

- (CloudShareTrustManagerTrustStatusCounts)trustStatusCounts
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t (**v23)(void *, _QWORD, uint64_t);
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  CloudShareTrustManagerTrustStatusCounts *result;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD aBlock[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeForCloudShareTrustManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v5;
  objc_msgSend(v5, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v6, "count");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v8)
  {
    v9 = v8;
    v35 = 0;
    v36 = 0;
    v39 = 0;
    v40 = 0;
    v10 = 0;
    v37 = 0;
    v38 = 0;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isOwner", v32) & 1) == 0)
        {
          -[HMDCloudShareTrustManager cloudShareParticipantsManager](self, "cloudShareParticipantsManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "participatingUsers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v13);

          if ((v16 & 1) != 0)
          {
            -[HMDCloudShareTrustManager cloudShareParticipantsManager](self, "cloudShareParticipantsManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isAcceptedParticipatingUser:", v13);

            objc_msgSend(v13, "cloudShareID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              ++v37;
              if (v19)
                ++v36;
              else
                ++v35;
            }
            else
            {
              ++v40;
              v20 = v38;
              if (v19)
                v20 = v38 + 1;
              v38 = v20;
              v39 += objc_msgSend(v13, "hasDeviceWithHomeKitVersionGreaterThanVersion:", CFSTR("6.2"));
            }
          }
          else
          {
            ++v10;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v9);
  }
  else
  {
    v35 = 0;
    v36 = 0;
    v39 = 0;
    v40 = 0;
    v10 = 0;
    v37 = 0;
    v38 = 0;
  }

  v21 = 1;
  if (((v32 - 1) & ~((v32 - 1) >> 63)) != 1)
    v21 = 2;
  if (v32 - 1 <= 0)
    v22 = 0;
  else
    v22 = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HMDCloudShareTrustManager_trustStatusCounts__block_invoke;
  aBlock[3] = &__block_descriptor_40_e11_Q24__0Q8Q16l;
  aBlock[4] = (v32 - 1) & ~((v32 - 1) >> 63);
  v23 = (uint64_t (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v24 = v23[2](v23, v37, 100);
  v25 = v23[2](v23, v36, 100);
  v26 = v23[2](v23, v38, 0);
  v27 = v23[2](v23, v39, 0);
  v28 = v23[2](v23, v10, 0);
  v29 = v23[2](v23, v40, 0);
  v30 = v23[2](v23, v35, 0);
  retstr->var0 = v22;
  retstr->var1 = v24;
  retstr->var2 = v25;
  retstr->var3 = v26;
  retstr->var4 = v27;
  retstr->var5 = v28;
  retstr->var6 = v29;
  retstr->var7 = v30;

  return result;
}

- (id)homeForCloudShareTrustManagerMetricsEventDispatcher:(id)a3
{
  void *v4;
  void *v5;

  -[HMDCloudShareTrustManager dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeForCloudShareTrustManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  v5 = a5;
  v7 = a4;
  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneNameForCloudShareTrustManager:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v7, "isEqualToString:", v9);
  if ((_DWORD)v8 && -[HMDCloudShareTrustManager isOwnedTrust](self, "isOwnedTrust") == v5)
  {
    -[HMDCloudShareTrustManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__HMDCloudShareTrustManager_database_didCreateZoneWithName_isPrivate___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v10, block);

  }
}

- (void)_didCreateZone
{
  NSObject *v3;
  void *v4;
  HMDCloudShareTrustManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCloudShareTrustManager *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Trust zone has been created", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCloudShareTrustManager metricsEventDispatcher](v5, "metricsEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitTrustZoneCreatedEvent");

  if (-[HMDCloudShareTrustManager configureState](v5, "configureState") == 3)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = v5;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Forcing trust from removed to unconfigured state due to a zone creation notification", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    os_unfair_lock_lock_with_options();
    v10->_configureState = 0;
    os_unfair_lock_unlock(&v10->_lock);
  }
  -[HMDCloudShareTrustManager _configure](v5, "_configure");
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  v5 = a5;
  v7 = a4;
  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneNameForCloudShareTrustManager:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v8) = objc_msgSend(v7, "isEqualToString:", v9);
  if ((_DWORD)v8 && -[HMDCloudShareTrustManager isOwnedTrust](self, "isOwnedTrust") == v5)
  {
    -[HMDCloudShareTrustManager queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__HMDCloudShareTrustManager_database_didRemoveZoneWithName_isPrivate___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v10, block);

  }
}

- (void)_didRemoveZone
{
  NSObject *v3;
  void *v4;
  HMDCloudShareTrustManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Trust zone has been removed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCloudShareTrustManager metricsEventDispatcher](v5, "metricsEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitTrustZoneRemovedEvent");

  -[HMDCloudShareTrustManager delegate](v5, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didRemoveTrustZoneInCloudShareTrustManager:", v5);

  -[HMDCloudShareTrustManager setConfigureState:](v5, "setConfigureState:", 3);
  -[HMDCloudShareTrustManager setCloudZone:](v5, "setCloudZone:", 0);
  -[HMDCloudShareTrustManager setLocalZone:](v5, "setLocalZone:", 0);
}

- (id)logIdentifier
{
  void *v3;
  void *v4;

  -[HMDCloudShareTrustManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneNameForCloudShareTrustManager:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudShareTrustManager isOwnedTrust](self, "isOwnedTrust");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("isOwnedTrust"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  HMDCloudShareTrustManagerConfigureStateAsString(-[HMDCloudShareTrustManager configureState](self, "configureState", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("configureState"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCloudShareTrustManager ownerCloudShareID](self, "ownerCloudShareID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("ownerCloudShareID"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_startRequestInviteTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDCloudShareTrustManager *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, double, double);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCloudShareTrustManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager requestInviteTimer](self, "requestInviteTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Request invite timer already started", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    -[HMDCloudShareTrustManager requestInviteTimerFactory](self, "requestInviteTimerFactory");
    v9 = (void (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 3, 30.0, 86400.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudShareTrustManager setRequestInviteTimer:](self, "setRequestInviteTimer:", v10);

    -[HMDCloudShareTrustManager requestInviteTimer](self, "requestInviteTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[HMDCloudShareTrustManager queue](self, "queue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudShareTrustManager requestInviteTimer](self, "requestInviteTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegateQueue:", v12);

    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Starting request invite timer", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDCloudShareTrustManager requestInviteTimer](v15, "requestInviteTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resume");

  }
}

- (void)_cancelRequestInviteTimer
{
  NSObject *v3;

  -[HMDCloudShareTrustManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCloudShareTrustManager setRequestInviteTimer:](self, "setRequestInviteTimer:", 0);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDCloudShareTrustManager *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCloudShareTrustManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCloudShareTrustManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCloudShareTrustManager requestInviteTimer](self, "requestInviteTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == v4)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Request invite timer fired", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    if (-[HMDCloudShareTrustManager configureState](v8, "configureState") == 2
      || -[HMDCloudShareTrustManager configureState](v8, "configureState") == 3)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
LABEL_12:

        objc_autoreleasePoolPop(v13);
        -[HMDCloudShareTrustManager _cancelRequestInviteTimer](v14, "_cancelRequestInviteTimer");
        goto LABEL_13;
      }
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMDCloudShareTrustManagerConfigureStateAsString(-[HMDCloudShareTrustManager configureState](v14, "configureState"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Canceling request invite timer due to trust manager configure state: %@", (uint8_t *)&v21, 0x16u);

    }
    else
    {
      -[HMDCloudShareTrustManager requestInviteTimer](v8, "requestInviteTimer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeInterval");
      v20 = v19;

      if (v20 < 86400.0)
      {
        -[HMDCloudShareTrustManager _configure](v8, "_configure");
        goto LABEL_13;
      }
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Canceling request invite timer due to reaching max interval time", (uint8_t *)&v21, 0xCu);
    }

    goto LABEL_12;
  }
  if (v10)
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received timer did fire call from unknown timer: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
LABEL_13:

}

- (HMDCloudShareTrustManagerDataSource)dataSource
{
  return (HMDCloudShareTrustManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDCloudShareTrustManagerDelegate)delegate
{
  return (HMDCloudShareTrustManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCloudShareMessenger)cloudShareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isOwnedTrust
{
  return self->_ownedTrust;
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCloudZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocalZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMDCloudShareParticipantsManager)cloudShareParticipantsManager
{
  return (HMDCloudShareParticipantsManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCloudShareParticipantsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HMFTimer)requestInviteTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequestInviteTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (HMDCloudShareTrustManagerMetricsEventDispatcher)metricsEventDispatcher
{
  return (HMDCloudShareTrustManagerMetricsEventDispatcher *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMetricsEventDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMBShareUserID)ownerCloudShareID
{
  return (HMBShareUserID *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOwnerCloudShareID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (id)participantsManagerFactory
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setParticipantsManagerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (id)requestInviteTimerFactory
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setRequestInviteTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestInviteTimerFactory, 0);
  objc_storeStrong(&self->_participantsManagerFactory, 0);
  objc_storeStrong((id *)&self->_ownerCloudShareID, 0);
  objc_storeStrong((id *)&self->_metricsEventDispatcher, 0);
  objc_storeStrong((id *)&self->_requestInviteTimer, 0);
  objc_storeStrong((id *)&self->_cloudShareParticipantsManager, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_cloudShareMessenger, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __70__HMDCloudShareTrustManager_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didRemoveZone");
}

uint64_t __70__HMDCloudShareTrustManager_database_didCreateZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCreateZone");
}

unint64_t __46__HMDCloudShareTrustManager_trustStatusCounts__block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    return (unint64_t)((double)a2 * 100.0 / (double)v3);
  return a3;
}

void __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Trust zone invitation was not accepted: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "metricsEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitFailureEventWithEventErrorCode:error:", 11, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __75__HMDCloudShareTrustManager_messenger_didReceiveInvitationData_completion___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Trust zone invitation was accepted", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_configure");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __80__HMDCloudShareTrustManager_cloudZone_didUpdateParticipantWithClientIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCloudShareIDForUser:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__HMDCloudShareTrustManager_homeDidBecomeTrustZoneCapable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_homeDidBecomeTrustZoneCapable:", *(_QWORD *)(a1 + 40));
}

void __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Trust zone invitation was accepted by user with id: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 40), "cloudShareID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@User already has cloud share ID. Skip cloud pull. user id: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Fetch due to new participant"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "cloudZone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "performCloudPullWithOptions:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BE6B628];
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "schedulerWithDispatchQueue:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reschedule:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = MEMORY[0x24BDAC760];
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_26;
      v32[3] = &unk_24E79BD80;
      v32[4] = *(_QWORD *)(a1 + 32);
      v29 = (id)objc_msgSend(v27, "addFailureBlock:", v32);
      v31[0] = v28;
      v31[1] = 3221225472;
      v31[2] = __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_27;
      v31[3] = &unk_24E79BCF0;
      v31[4] = *(_QWORD *)(a1 + 32);
      v30 = (id)objc_msgSend(v27, "addSuccessBlock:", v31);

    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v18;
      v35 = 2112;
      v36 = v19;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Trust zone invitation was not accepted by user with id: %@ error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "metricsEventDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "submitFailureEventWithEventErrorCode:error:", 11, v5);

  }
}

void __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Cloud pull fail with error:%@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "metricsEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitFailureEventWithEventErrorCode:error:", 12, v3);

}

void __63__HMDCloudShareTrustManager_sendShareInvitation_toUser_device___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud pull was successful", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "updateCloudShareIDForAllUsers");

}

void __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud share ID for %@: %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "metricsEventDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitFailureEventWithEventErrorCode:error:", 4, v3);

}

void __55__HMDCloudShareTrustManager_updateCloudShareIDForUser___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received cloud share ID for %@: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "updateCloudShareID:", v3);

}

void __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch cloud share id for current user, error: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "setConfigureState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLocalZone:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCloudZone:", 0);
  objc_msgSend(*(id *)(a1 + 32), "metricsEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitFailureEventWithEventErrorCode:error:", 4, v3);

}

void __58__HMDCloudShareTrustManager_updateCurrentUserCloudShareID__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeForCloudShareTrustManager:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received current user cloud share id: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v6, "updateCloudShareID:", v3);

}

void __40__HMDCloudShareTrustManager_removeTrust__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed cloud share trust removal, error: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "metricsEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitFailureEventWithEventErrorCode:error:", 3, v3);

}

void __40__HMDCloudShareTrustManager_removeTrust__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud share trust has been removed", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "setCloudZone:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLocalZone:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didRemoveTrustZoneInCloudShareTrustManager:", *(_QWORD *)(a1 + 32));

}

void __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Could not read owner cloud share id in trust zone, error: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "setConfigureState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCloudShareParticipantsManager:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setLocalZone:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCloudZone:", 0);
  objc_msgSend(*(id *)(a1 + 32), "metricsEventDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submitFailureEventWithEventErrorCode:error:", 4, v3);

}

void __70__HMDCloudShareTrustManager__configureOwnerCloudShareIDWithCloudZone___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudShareTrustManager:didFetchOwnerCloudShareID:", *(_QWORD *)(a1 + 32), v3);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Read trust zone owner cloud share ID: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "setOwnerCloudShareID:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_finishConfigure");

}

id __131__HMDCloudShareTrustManager_initWithDatabase_isOwnedTrust_queue_shareMessenger_ownerCloudShareID_logEventSubmitter_dailyScheduler___block_invoke_2(double a1, double a2, uint64_t a3, uint64_t a4)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F170]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", a4, 0, a1, a2);
}

HMDCloudShareParticipantsManager *__131__HMDCloudShareTrustManager_initWithDatabase_isOwnedTrust_queue_shareMessenger_ownerCloudShareID_logEventSubmitter_dailyScheduler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
  if (logCategory__hmf_once_t54 != -1)
    dispatch_once(&logCategory__hmf_once_t54, &__block_literal_global_39_34123);
  return (id)logCategory__hmf_once_v55;
}

void __40__HMDCloudShareTrustManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v55;
  logCategory__hmf_once_v55 = v0;

}

@end
