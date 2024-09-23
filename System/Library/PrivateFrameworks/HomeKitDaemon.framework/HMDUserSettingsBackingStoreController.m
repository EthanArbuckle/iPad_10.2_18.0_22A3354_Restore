@implementation HMDUserSettingsBackingStoreController

- (HMDUserSettingsBackingStoreController)initWithDelegate:(id)a3 queue:(id)a4 zoneName:(id)a5 database:(id)a6 shareMessenger:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDUserSettingsBackingStoreController *v17;
  uint64_t v18;
  OS_os_log *logger;
  uint64_t v20;
  HMMLogEventSubmitting *logEventSubmitter;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDUserSettingsBackingStoreController;
  v17 = -[HMDUserSettingsBackingStoreController init](&v23, sel_init);
  if (v17)
  {
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    logger = v17->_logger;
    v17->_logger = (OS_os_log *)v18;

    v17->_startupSignPost = 0;
    objc_storeWeak((id *)&v17->_delegate, v12);
    objc_storeStrong((id *)&v17->_workQueue, a4);
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v20 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v17->_logEventSubmitter;
    v17->_logEventSubmitter = (HMMLogEventSubmitting *)v20;

    objc_storeStrong((id *)&v17->_zoneName, a5);
    objc_storeStrong((id *)&v17->_database, a6);
    objc_storeStrong((id *)&v17->_shareMessenger, a7);
    -[HMDCloudShareMessenger setDelegate:](v17->_shareMessenger, "setDelegate:", v17);
    -[HMDCloudShareMessenger configure](v17->_shareMessenger, "configure");
    v17->_runState = 0;
    v17->_logEventRunState = 0;
    objc_msgSend(v15, "addDelegate:", v17);
  }

  return v17;
}

- (void)start
{
  NSObject *v3;
  void *v4;
  HMDUserSettingsBackingStoreController *v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDUserSettingsBackingStoreController *v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  NSObject *logger;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDUserSettingsBackingStoreController *v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDUserSettingsBackingStoreController runState](self, "runState"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      HMDUserSettingsBackingStoreControllerRunStateAsString(-[HMDUserSettingsBackingStoreController runState](v5, "runState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v7;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Already in run state %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDUserSettingsBackingStoreController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isCurrentUser"))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v13;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Starting backing store controller to fetch owned zone for user %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDUserSettingsBackingStoreController _updateRunState:](v11, "_updateRunState:", 1);
      -[HMDUserSettingsBackingStoreController _updateLogEventRunState:](v11, "_updateLogEventRunState:", 1);
      logger = v11->_logger;
      if (os_signpost_enabled(logger))
      {
        v16 = logger;
        objc_msgSend(v9, "userUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = CFSTR("Owned");
        v28 = 2112;
        v29 = v17;
        _os_signpost_emit_with_name_impl(&dword_2218F0000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserZone.Startup", "Type=%{signpost.description:attribute}@ User=%{signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);

      }
      v11->_startupSignPost = 0xEEEEB0B5B2B2EEEELL;
      -[HMDUserSettingsBackingStoreController _startWithOwnedZone](v11, "_startWithOwnedZone");
    }
    else if ((objc_msgSend(v9, "isCurrentUser") & 1) == 0
           && objc_msgSend(v9, "isRunningOnHomeOwnersDevice"))
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v21;
        v28 = 2112;
        v29 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Starting backing store controller to fetch shared zone for user %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDUserSettingsBackingStoreController _updateRunState:](v19, "_updateRunState:", 1);
      -[HMDUserSettingsBackingStoreController _updateLogEventRunState:](v19, "_updateLogEventRunState:", 1);
      v23 = v19->_logger;
      if (os_signpost_enabled(v23))
      {
        v24 = v23;
        objc_msgSend(v9, "userUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = CFSTR("Shared");
        v28 = 2112;
        v29 = v25;
        _os_signpost_emit_with_name_impl(&dword_2218F0000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserZone.Startup", "Type=%{signpost.description:attribute}@ User=%{signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);

      }
      v19->_startupSignPost = 0xEEEEB0B5B2B2EEEELL;
      -[HMDUserSettingsBackingStoreController _startWithSharedZone](v19, "_startWithSharedZone");
    }

  }
}

- (id)loadPrivateUserDataModelWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserSettingsBackingStoreController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchModelWithModelID:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)loadSharedUserDataModelWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserSettingsBackingStoreController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchModelWithModelID:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)loadAssistantAccessControlModelWithModelID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMDUserSettingsBackingStoreController *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchModelWithModelID:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v10 && !v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Obtained model of unexpected type %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

  return v12;
}

- (void)registerForAssistantAccessControlModelUpdates:(id)a3 modelID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserSettingsBackingStoreController setAssistantAccessControlModelUpdateReceiver:](self, "setAssistantAccessControlModelUpdateReceiver:", v6);
  -[HMDUserSettingsBackingStoreController setAssistantAccessControlModelID:](self, "setAssistantAccessControlModelID:", v8);

}

- (id)loadMediaContentAccessControlModelWithModelID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchModelWithModelID:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)registerForMediaContentAccessControlModelUpdates:(id)a3 modelID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserSettingsBackingStoreController setMediaContentProfileAccessControlModelUpdateReceiver:](self, "setMediaContentProfileAccessControlModelUpdateReceiver:", v6);
  -[HMDUserSettingsBackingStoreController setMediaContentProfileAccessControlModelID:](self, "setMediaContentProfileAccessControlModelID:", v8);

}

- (id)loadUserListeningHistoryUpdateControlModelWithModelID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchModelWithModelID:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)registerForUserListeningHistoryUpdateControlModelUpdates:(id)a3 modelID:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserSettingsBackingStoreController setUserListeningHistoryUpdateControlModelUpdateReceiver:](self, "setUserListeningHistoryUpdateControlModelUpdateReceiver:", v6);
  -[HMDUserSettingsBackingStoreController setUserListeningHistoryUpdateModelID:](self, "setUserListeningHistoryUpdateModelID:", v8);

}

- (void)registerForSharedUserDataModelUpdates:(id)a3 modelID:(id)a4
{
  id v6;

  v6 = a4;
  -[HMDUserSettingsBackingStoreController setSharedUserDataModelUpdateReceiver:](self, "setSharedUserDataModelUpdateReceiver:", a3);
  -[HMDUserSettingsBackingStoreController setSharedUserDataModelUpdateModelID:](self, "setSharedUserDataModelUpdateModelID:", v6);

}

- (void)_invalidate
{
  void *v3;
  HMDUserSettingsBackingStoreController *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Invalidating user zone", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDUserSettingsBackingStoreController workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDUserSettingsBackingStoreController setLocalZone:](v4, "setLocalZone:", 0);
  -[HMDUserSettingsBackingStoreController setCloudZone:](v4, "setCloudZone:", 0);
  -[HMDUserSettingsBackingStoreController _updateRunState:](v4, "_updateRunState:", 0);
  -[HMDUserSettingsBackingStoreController _updateLogEventRunState:](v4, "_updateLogEventRunState:", 4);
}

- (void)destroyZone
{
  NSObject *v3;
  void *v4;
  HMDUserSettingsBackingStoreController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Destroying zone", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDUserSettingsBackingStoreController delegate](v5, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCurrentUser");

  -[HMDUserSettingsBackingStoreController database](v5, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserSettingsBackingStoreController zoneName](v5, "zoneName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v12 = (id)objc_msgSend(v10, "removePrivateZonesWithName:", v11);
  else
    v13 = (id)objc_msgSend(v10, "removeSharedZonesWithName:", v11);

  -[HMDUserSettingsBackingStoreController _invalidate](v5, "_invalidate");
}

- (void)registerObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4 subActivity:(id)a5 subjectDeviceIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDIDSActivityObserverModel *v16;
  HMDIDSActivityRegistrationModel *v17;
  HMDIDSActivityRegistrationModel *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  HMDUserSettingsBackingStoreController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDUserSettingsBackingStoreController *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDUserSettingsBackingStoreController *v37;
  NSObject *v38;
  void *v39;
  HMDIDSActivityRegistrationModel *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  HMDUserSettingsBackingStoreController *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchModelWithModelID:ofType:error:", v10, objc_opt_class(), 0);
  v16 = (HMDIDSActivityObserverModel *)objc_claimAutoreleasedReturnValue();

  v56 = v12;
  if (!v16)
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v35;
      v61 = 2112;
      v62 = v10;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@No IDS Activity observer found for %@, creating", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    v16 = -[HMDIDSActivityObserverModel initWithModelID:]([HMDIDSActivityObserverModel alloc], "initWithModelID:", v10);
    v17 = (HMDIDSActivityRegistrationModel *)objc_msgSend(v14, "addObject:", v16);
    goto LABEL_13;
  }
  -[HMDUserSettingsBackingStoreController _registrationWithParent:subjectDeviceIdentifier:](self, v10, v13);
  v17 = (HMDIDSActivityRegistrationModel *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_13:
    v55 = v11;
    v36 = (void *)MEMORY[0x227676638](v17);
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v39;
      v61 = 2112;
      v62 = v13;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@No IDS Activity registration found for %@, creating", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    -[HMDUserSettingsBackingStoreController _uuidForActivitySubject:observer:]((uint64_t)v37, v13, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = [HMDIDSActivityRegistrationModel alloc];
    -[HMBModel hmbModelID](v16, "hmbModelID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMBModel initWithModelID:parentModelID:](v40, "initWithModelID:parentModelID:", v26, v41);

    -[HMDIDSActivityRegistrationModel setSubjectDeviceIdentifier:](v18, "setSubjectDeviceIdentifier:", v13);
    v65[0] = v56;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDIDSActivityRegistrationModel setSubActivities:](v18, "setSubActivities:", v42);

    goto LABEL_16;
  }
  v18 = v17;
  -[HMDIDSActivityRegistrationModel subActivities](v17, "subActivities");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  v21 = objc_msgSend(v19, "containsObject:", v12);

  if ((v21 & 1) != 0)
    goto LABEL_17;
  v55 = v11;
  v22 = (void *)MEMORY[0x24BDBCEB8];
  -[HMDIDSActivityRegistrationModel subActivities](v18, "subActivities");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = v23;
  else
    v25 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v22, "arrayWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "addObject:", v20);
  v27 = (void *)objc_msgSend(v26, "copy");
  -[HMDIDSActivityRegistrationModel setSubActivities:](v18, "setSubActivities:", v27);

  v28 = (void *)MEMORY[0x227676638]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v54 = v28;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v60 = v31;
    v61 = 2112;
    v62 = v56;
    v63 = 2112;
    v64 = v26;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Added subActivity %@ to existing list %@", buf, 0x20u);

    v28 = v54;
  }

  objc_autoreleasePoolPop(v28);
LABEL_16:
  objc_msgSend(v14, "addObject:", v18);

  v11 = v55;
LABEL_17:
  -[HMDIDSActivityObserverModel pushToken](v16, "pushToken");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v11, "isEqualToData:", v43);

  v45 = v56;
  if ((v44 & 1) == 0)
  {
    -[HMDIDSActivityObserverModel setPushToken:](v16, "setPushToken:", v11);
    objc_msgSend(v14, "addObject:", v16);
  }
  if (objc_msgSend(v14, "count"))
  {
    v46 = (void *)MEMORY[0x227676638]();
    v47 = self;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v49;
      v61 = 2112;
      v62 = v14;
      _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@Updating IDS Activity Registration info: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v46);
    -[HMDUserSettingsBackingStoreController localZone](v47, "localZone");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Updating IDS Activity Registration"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addModels:options:", v14, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __128__HMDUserSettingsBackingStoreController_registerObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke;
    v57[3] = &unk_24E79BCC8;
    v57[4] = v47;
    v58 = v10;
    v53 = (id)objc_msgSend(v52, "addFailureBlock:", v57);

    v45 = v56;
  }

}

- (void)updateObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  HMDUserSettingsBackingStoreController *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  HMDUserSettingsBackingStoreController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchModelWithModelID:ofType:error:", v6, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2112;
      v31 = v6;
      v16 = "%{public}@Unable to update observer pushToken, no IDS Activty Observer model found for %@";
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v12);
    goto LABEL_12;
  }
  objc_msgSend(v9, "pushToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqualToData:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2112;
      v31 = v6;
      v16 = "%{public}@Push token already up to date for %@";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, v16, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v17 = (void *)MEMORY[0x227676638](objc_msgSend(v9, "setPushToken:", v7));
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v20;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Updating IDS Activity observer pushToken: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDUserSettingsBackingStoreController localZone](v18, "localZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Reregistering IDS Activity Observer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addModels:options:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __90__HMDUserSettingsBackingStoreController_updateObserverDeviceIdentifier_observerPushToken___block_invoke;
  v26[3] = &unk_24E79BCC8;
  v26[4] = v18;
  v27 = v6;
  v25 = (id)objc_msgSend(v24, "addFailureBlock:", v26);

LABEL_12:
}

- (void)deregisterObserverDeviceIdentifier:(id)a3 observerPushToken:(id)a4 subActivity:(id)a5 subjectDeviceIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDUserSettingsBackingStoreController *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  HMDUserSettingsBackingStoreController *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  HMDUserSettingsBackingStoreController *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  HMDUserSettingsBackingStoreController *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *context;
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchModelWithModelID:ofType:error:", v10, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDUserSettingsBackingStoreController _registrationWithParent:subjectDeviceIdentifier:](self, v10, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subActivities");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", v12);

      v51 = v13;
      v52 = v11;
      if (v19)
      {
        v20 = (void *)MEMORY[0x24BDBCEB8];
        objc_msgSend(v16, "subActivities");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayWithArray:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "removeObject:", v12);
        v23 = (void *)objc_msgSend(v22, "copy");
        objc_msgSend(v16, "setSubActivities:", v23);

        context = (void *)MEMORY[0x227676638]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = v17;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v56 = v27;
          v57 = 2112;
          v58 = v12;
          v59 = 2112;
          v60 = v22;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Removed subActivity %@ from existing list %@", buf, 0x20u);

          v17 = v26;
        }

        objc_autoreleasePoolPop(context);
        objc_msgSend(v17, "addObject:", v16);

        v11 = v52;
      }
      objc_msgSend(v15, "pushToken");
      v28 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v11, "isEqualToData:", v29);

      v31 = v28;
      if ((v30 & 1) == 0)
      {
        objc_msgSend(v15, "setPushToken:", v11);
        objc_msgSend(v28, "addObject:", v15);
      }
      if (objc_msgSend(v28, "count"))
      {
        v32 = (void *)MEMORY[0x227676638]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v56 = v35;
          v57 = 2112;
          v58 = v12;
          v59 = 2112;
          v60 = v10;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Removing subActivity %@ from IDS Activity Registration for: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
        -[HMDUserSettingsBackingStoreController localZone](v33, "localZone");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v15, v16, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Updating IDS Activity Registration"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addModels:options:", v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x24BDAC760];
        v53[1] = 3221225472;
        v53[2] = __130__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke;
        v53[3] = &unk_24E79BCC8;
        v53[4] = v33;
        v54 = v10;
        v40 = (id)objc_msgSend(v39, "addFailureBlock:", v53);

        v11 = v52;
        v31 = v28;
      }

      v13 = v51;
    }
    else
    {
      v45 = (void *)MEMORY[0x227676638]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = v11;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v49;
        v57 = 2112;
        v58 = v10;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Unable to deregister, no IDS Activty Registration model found for %@", buf, 0x16u);

        v11 = v48;
      }

      objc_autoreleasePoolPop(v45);
    }

  }
  else
  {
    v41 = (void *)MEMORY[0x227676638]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v44;
      v57 = 2112;
      v58 = v10;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Unable to deregister, no IDS Activty Observer model found for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v41);
  }

}

- (void)deregisterObserverDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDUserSettingsBackingStoreController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Removing IDS Activity Observer: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUserSettingsBackingStoreController localZone](v6, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Removing IDS Activity Observer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeModelIDs:options:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier___block_invoke;
  v15[3] = &unk_24E79BCC8;
  v15[4] = v6;
  v16 = v4;
  v13 = v4;
  v14 = (id)objc_msgSend(v12, "addFailureBlock:", v15);

}

- (id)queryPushTokensForDevicesObservingSubjectDevice:(id)a3 subActivity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDUserSettingsBackingStoreController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  HMDUserSettingsBackingStoreController *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29 = CFSTR("subjectDeviceIdentifier");
  v30[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v12;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Querying all models observing %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDUserSettingsBackingStoreController localZone](v10, "localZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDIDSActivityRegistrationModel registeredDevicesQuery](HMDIDSActivityRegistrationModel, "registeredDevicesQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queryModelsUsingQuery:arguments:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __101__HMDUserSettingsBackingStoreController_queryPushTokensForDevicesObservingSubjectDevice_subActivity___block_invoke;
  v21[3] = &unk_24E778098;
  v22 = v7;
  v23 = v10;
  v24 = v16;
  v17 = v16;
  v18 = v7;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);
  v19 = (void *)objc_msgSend(v17, "copy");

  return v19;
}

- (void)clearParticipants
{
  void *v3;
  HMDUserSettingsBackingStoreController *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing participants", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDUserSettingsBackingStoreController participantsManager](v4, "participantsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearParticipants");

}

- (void)updateParticipants
{
  void *v3;
  HMDUserSettingsBackingStoreController *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating participants", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDUserSettingsBackingStoreController participantsManager](v4, "participantsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateShareParticipants");

}

- (void)_startWithOwnedZone
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x24BE4ECF0]);
  objc_msgSend(v4, "setShouldRebuildOnManateeKeyLoss:", 1);
  -[HMDUserSettingsBackingStoreController database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserSettingsBackingStoreController zoneName](self, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "privateZonesWithName:configuration:delegate:error:", v6, v4, 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  -[HMDUserSettingsBackingStoreController _didFetchZonesWithResult:isOwnedZone:error:](self, "_didFetchZonesWithResult:isOwnedZone:error:", v7, 1, v8);
}

- (void)_startWithSharedZone
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDUserSettingsBackingStoreController *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDUserSettingsBackingStoreController *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserSettingsBackingStoreController database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerSharedSubscriptionForExternalRecordType:", 0);

  -[HMDUserSettingsBackingStoreController database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserSettingsBackingStoreController zoneName](self, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingSharedZoneIDWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserSettingsBackingStoreController zoneName](v10, "zoneName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v13;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Got zoneID %@ for user settings zone %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDUserSettingsBackingStoreController database](v10, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x24BE4EC68]);
    v26 = 0;
    objc_msgSend(v15, "sharedZonesWithID:configuration:delegate:error:", v8, v16, 0, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v26;

    -[HMDUserSettingsBackingStoreController _didFetchZonesWithResult:isOwnedZone:error:](v10, "_didFetchZonesWithResult:isOwnedZone:error:", v17, 0, v18);
  }
  else
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserSettingsBackingStoreController zoneName](v10, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@No shared zone exists for user settings with zone name %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDUserSettingsBackingStoreController _updateRunState:](v10, "_updateRunState:", 0);
    -[HMDUserSettingsBackingStoreController _updateLogEventRunState:](v10, "_updateLogEventRunState:", 5);
    -[HMDUserSettingsBackingStoreController delegate](v10, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ownerForUserSettingsBackingStoreController:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x227676638]();
    v23 = v10;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v25;
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Requesting user settings share from user: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDUserSettingsBackingStoreController shareMessenger](v23, "shareMessenger");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestShareInvitationDataFromUser:", v17);
  }

}

- (void)_didFetchZonesWithResult:(id)a3 isOwnedZone:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMDUserSettingsBackingStoreController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  HMDUserSettingsBackingStoreController *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  os_signpost_id_t startupSignPost;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  OS_os_log *v67;
  NSObject *v68;
  os_signpost_id_t v69;
  void *v70;
  HMDUserSettingsBackingStoreController *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  BOOL v77;
  void *v78;
  _QWORD v79[5];
  id v80;
  BOOL v81;
  _QWORD v82[5];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    v77 = a4;
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v88 = v14;
      v89 = 2112;
      v90 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Did fetch zones with local zone %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDUserSettingsBackingStoreController delegate](v12, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserSettingsBackingStoreController setLocalZone:](v12, "setLocalZone:", v17);

    -[HMDUserSettingsBackingStoreController localZone](v12, "localZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserverForAllModels:", v12);

    -[HMDUserSettingsBackingStoreController localZone](v12, "localZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startUp");

    v78 = v16;
    objc_msgSend(v16, "didStartLocalZoneForBackingStoreController:", v12);
    if (v12)
    {
      v75 = v9;
      v76 = v8;
      -[HMDUserSettingsBackingStoreController localZone](v12, "localZone");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fetchModelsOfType:error:", objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v23 = v21;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v84;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v84 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
            objc_msgSend(v28, "subjectDeviceIdentifier");
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "hmbParentModelID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserSettingsBackingStoreController _uuidForActivitySubject:observer:]((uint64_t)v12, (void *)v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v28, "hmbModelID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v29) = objc_msgSend(v32, "isEqual:", v31);

            if ((v29 & 1) == 0)
            {
              objc_msgSend(v28, "hmbModelID");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v33);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
        }
        while (v25);
      }

      if (objc_msgSend(v22, "count"))
      {
        -[HMDUserSettingsBackingStoreController localZone](v12, "localZone");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE4ED10], "optionsWithLabel:", CFSTR("Removing non-derived HMDIDSActivityRegistrationModels"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (id)objc_msgSend(v34, "removeModelIDs:options:", v22, v35);

      }
      v9 = v75;
      v8 = v76;
    }
    objc_msgSend(v8, "cloudZone");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserSettingsBackingStoreController setCloudZone:](v12, "setCloudZone:", v37);

    if (objc_msgSend(v78, "isCurrentUser") && (objc_msgSend(v78, "isRunningOnHomeOwnersDevice") & 1) == 0)
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = v12;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v88 = v41;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Starting participant manager to share with owner", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(v8, "cloudZone");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "backingStoreController:createParticipantManagerForCloudZone:", v39, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserSettingsBackingStoreController setParticipantsManager:](v39, "setParticipantsManager:", v43);

      -[HMDUserSettingsBackingStoreController participantsManager](v39, "participantsManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setDataSource:", v39);

      -[HMDUserSettingsBackingStoreController participantsManager](v39, "participantsManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setDelegate:", v39);

      -[HMDUserSettingsBackingStoreController participantsManager](v39, "participantsManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "configure");

      -[HMDUserSettingsBackingStoreController participantsManager](v39, "participantsManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "updateShareParticipants");

    }
    v48 = v12->_logger;
    v49 = v48;
    startupSignPost = v12->_startupSignPost;
    if (startupSignPost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v49, OS_SIGNPOST_EVENT, startupSignPost, "UserZone.Startup", "Fetched Zones", buf, 2u);
    }

    -[HMDUserSettingsBackingStoreController cloudZone](v12, "cloudZone");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "startUp");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)MEMORY[0x24BE6B628];
    -[HMDUserSettingsBackingStoreController workQueue](v12, "workQueue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "schedulerWithDispatchQueue:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "reschedule:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = MEMORY[0x24BDAC760];
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke;
    v82[3] = &unk_24E79BD80;
    v82[4] = v12;
    v58 = (id)objc_msgSend(v56, "addFailureBlock:", v82);

    -[HMDUserSettingsBackingStoreController cloudZone](v12, "cloudZone");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "startUp");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x24BE6B628];
    -[HMDUserSettingsBackingStoreController workQueue](v12, "workQueue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "schedulerWithDispatchQueue:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "reschedule:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v57;
    v79[1] = 3221225472;
    v79[2] = __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke_108;
    v79[3] = &unk_24E78CA68;
    v81 = v77;
    v79[4] = v12;
    v80 = v78;
    v65 = v78;
    v66 = (id)objc_msgSend(v64, "addSuccessBlock:", v79);

  }
  else
  {
    v67 = self->_logger;
    v68 = v67;
    v69 = self->_startupSignPost;
    if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v67))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v9;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v68, OS_SIGNPOST_INTERVAL_END, v69, "UserZone.Startup", "Error=%{signpost.description:attribute}@ ", buf, 0xCu);
    }

    v70 = (void *)MEMORY[0x227676638]();
    v71 = self;
    HMFGetOSLogHandle();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserSettingsBackingStoreController zoneName](v71, "zoneName");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v88 = v73;
      v89 = 2112;
      v90 = v74;
      v91 = 2112;
      v92 = v9;
      _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_ERROR, "%{public}@Failed to open zones for user settings with zone ID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v70);
    -[HMDUserSettingsBackingStoreController _updateRunState:](v71, "_updateRunState:", 0);
    -[HMDUserSettingsBackingStoreController _updateLogEventRunState:](v71, "_updateLogEventRunState:", 3);
  }

}

- (id)loadUserSettings
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  id v20;

  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserSettingsBackingStoreController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "fetchModelsWithParentModelID:error:", v7, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  objc_msgSend(v8, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v4, "addObjectsFromArray:", v11);
  if (objc_msgSend(v11, "count"))
  {
    do
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmf_removeFirstObject");
      -[HMDUserSettingsBackingStoreController localZone](self, "localZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hmbModelID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v9;
      objc_msgSend(v13, "fetchModelsWithParentModelID:error:", v14, &v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;

      objc_msgSend(v15, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addObjectsFromArray:", v17);
      objc_msgSend(v11, "addObjectsFromArray:", v17);

      v9 = v16;
    }
    while (objc_msgSend(v11, "count"));
  }
  else
  {
    v16 = v9;
  }

  return v4;
}

- (void)_updateRunState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  HMDUserSettingsBackingStoreController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDUserSettingsBackingStoreController runState](self, "runState") != a3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMDUserSettingsBackingStoreControllerRunStateAsString(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating run state to %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDUserSettingsBackingStoreController setRunState:](v7, "setRunState:", a3);
  }
}

- (void)_updateLogEventRunState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  HMDUserSettingsBackingStoreController *v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMDUserSettingsBackingStoreController logEventRunState](self, "logEventRunState") != a3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)a3 >= 6)
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Unknown state %@"), v12);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = off_24E778190[a3];
      }
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating metric run state to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDUserSettingsBackingStoreController setLogEventRunState:](v7, "setLogEventRunState:", a3);
  }
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
  HMDUserSettingsBackingStoreController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeKitVersion *v22;
  void *v23;
  void *v24;
  HMDUserSettingsBackingStoreController *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMDUserSettingsBackingStoreController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD aBlock[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v36 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v36;
  if (v12)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HMDUserSettingsBackingStoreController__sendShareInvitation_toUser_device___block_invoke;
    aBlock[3] = &unk_24E79B328;
    aBlock[4] = self;
    v14 = _Block_copy(aBlock);
    if (!(v9 | v10))
      _HMFPreconditionFailure();
    v15 = v14;
    if (v9)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = v13;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v9, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Sending share invitation for user settings to user: %@", buf, 0x16u);

        v13 = v33;
      }

      objc_autoreleasePoolPop(v16);
      -[HMDUserSettingsBackingStoreController shareMessenger](v17, "shareMessenger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("6.0"));
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendShareInvitationData:toUser:minimumHomeKitVersion:requiredSupportedFeatures:completion:", v12, v9, v22, v23, v15);

    }
    else
    {
      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "shortDescription");
        v34 = v13;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v31;
        v39 = 2112;
        v40 = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Sending share invitation for user settings to device: %@", buf, 0x16u);

        v13 = v34;
      }

      objc_autoreleasePoolPop(v28);
      -[HMDUserSettingsBackingStoreController shareMessenger](v29, "shareMessenger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendShareInvitationData:toDevice:completion:", v12, v10, v15);
    }

    goto LABEL_15;
  }
  v24 = (void *)MEMORY[0x227676638]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v27;
    v39 = 2112;
    v40 = v8;
    v41 = 2112;
    v42 = v13;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize invitation %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v24);
LABEL_16:

}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "isOwner");
  return (char)v6;
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toUser:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDUserSettingsBackingStoreController _sendShareInvitation:toUser:device:](self, "_sendShareInvitation:toUser:device:", v9, v7, 0);
}

- (void)manager:(id)a3 didRequestSendForInvitation:(id)a4 toDevice:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;

  v7 = a5;
  v9 = a4;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDUserSettingsBackingStoreController _sendShareInvitation:toUser:device:](self, "_sendShareInvitation:toUser:device:", v9, 0, v7);
}

- (void)messenger:(id)a3 didReceiveInvitationData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDUserSettingsBackingStoreController *v13;
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
  void *v25;
  id v26;
  void *v27;
  HMDUserSettingsBackingStoreController *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
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
    v35 = v15;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received invitation to share user settings", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  v16 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v16, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v17, v9, &v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v33;

  if (v18)
  {
    -[HMDUserSettingsBackingStoreController database](v13, "database");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "acceptInvitation:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BE6B628];
    -[HMDUserSettingsBackingStoreController workQueue](v13, "workQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "schedulerWithDispatchQueue:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reschedule:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __87__HMDUserSettingsBackingStoreController_messenger_didReceiveInvitationData_completion___block_invoke;
    v31[3] = &unk_24E7780C0;
    v31[4] = v13;
    v32 = v10;
    v26 = (id)objc_msgSend(v25, "addCompletionBlock:", v31);

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v13;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v30;
      v36 = 2112;
      v37 = v9;
      v38 = 2112;
      v39 = v19;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive share invitation from invitation data: %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v19);
  }

}

- (void)messenger:(id)a3 didReceiveInvitationRequestFromUser:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDUserSettingsBackingStoreController *v13;
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
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
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
  -[HMDUserSettingsBackingStoreController participantsManager](v13, "participantsManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inviteUser:usingDevice:", v9, v10);

}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __75__HMDUserSettingsBackingStoreController_localZone_didProcessModelCreation___block_invoke;
  v16[3] = &unk_24E79A910;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDUserSettingsBackingStoreController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v7, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notified of unhandled model deletion: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13 = (void *)MEMORY[0x24BE6B608];
  v14 = objc_alloc_init(MEMORY[0x24BE4EC48]);
  objc_msgSend(v13, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE6B608]);
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__HMDUserSettingsBackingStoreController_localZone_didProcessModelUpdate___block_invoke;
  v16[3] = &unk_24E79A910;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

- (void)_localZone:(id)a3 updatedModel:(id)a4 previousModel:(id)a5 options:(id)a6 result:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  HMDUserSettingsBackingStoreController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  int v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  HMDUserSettingsBackingStoreController *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  int v73;
  int v74;
  int v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v95 = v21;
    v96 = 2112;
    v97 = v13;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Received transaction update for model %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  -[HMDUserSettingsBackingStoreController transactionReceiver](v19, "transactionReceiver");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (!v25)
  {
    v27 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = v27;
    else
      v28 = 0;
    v26 = v28;

    if (v26)
    {
      v90[0] = MEMORY[0x24BDAC760];
      v90[1] = 3221225472;
      v90[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_2;
      v90[3] = &unk_24E7780E8;
      v91 = v16;
      objc_msgSend(v22, "transactionSettingModelUpdated:previousModel:completion:", v27, v14, v90);
      v29 = v91;
LABEL_49:

      goto LABEL_50;
    }
    v79 = v12;
    v30 = v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;
    v32 = v31;

    v78 = v32;
    if (v32)
    {
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_3;
      v88[3] = &unk_24E7780E8;
      v89 = v16;
      objc_msgSend(v22, "transactionSettingConstraintModelUpdated:previousModel:completion:", v30, v14, v88);
      v33 = v89;
      v12 = v79;
LABEL_48:
      v29 = v78;

      goto LABEL_49;
    }
    v77 = v15;
    objc_msgSend(v30, "hmbModelID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserSettingsBackingStoreController assistantAccessControlModelID](v19, "assistantAccessControlModelID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v34, "isEqual:", v35);

    if (v73)
    {
      -[HMDUserSettingsBackingStoreController assistantAccessControlModelUpdateReceiver](v19, "assistantAccessControlModelUpdateReceiver");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = MEMORY[0x24BDAC760];
      v86[1] = 3221225472;
      v86[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_4;
      v86[3] = &unk_24E7780E8;
      v87 = v16;
      objc_msgSend(v36, "assistantAccessControlModelUpdated:previousModel:completion:", v30, v14, v86);

      v33 = v87;
LABEL_22:
      v12 = v79;
      v15 = v77;
      goto LABEL_48;
    }
    objc_msgSend(v30, "hmbModelID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserSettingsBackingStoreController mediaContentProfileAccessControlModelID](v19, "mediaContentProfileAccessControlModelID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v37, "isEqual:", v38);

    if (v74)
    {
      -[HMDUserSettingsBackingStoreController mediaContentProfileAccessControlModelUpdateReceiver](v19, "mediaContentProfileAccessControlModelUpdateReceiver");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_5;
      v84[3] = &unk_24E7780E8;
      v85 = v16;
      objc_msgSend(v39, "mediaContentProfileAccessControlModelUpdated:previousModel:completion:", v30, v14, v84);

      v33 = v85;
      goto LABEL_22;
    }
    objc_msgSend(v30, "hmbModelID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserSettingsBackingStoreController sharedUserDataModelUpdateModelID](v19, "sharedUserDataModelUpdateModelID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v40, "isEqual:", v41);

    if (v75)
    {
      -[HMDUserSettingsBackingStoreController sharedUserDataModelUpdateReceiver](v19, "sharedUserDataModelUpdateReceiver");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x24BDAC760];
      v82[1] = 3221225472;
      v82[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_6;
      v82[3] = &unk_24E7780E8;
      v83 = v16;
      objc_msgSend(v42, "sharedUserDataModelUpdated:previousModel:completion:", v30, v14, v82);

    }
    v43 = v30;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v43;
    else
      v44 = 0;
    v45 = v44;
    v71 = v43;

    v76 = v45;
    objc_msgSend(v45, "hmbModelID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserSettingsBackingStoreController userListeningHistoryUpdateModelID](v19, "userListeningHistoryUpdateModelID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (v48)
    {
      -[HMDUserSettingsBackingStoreController userListeningHistoryUpdateControlModelUpdateReceiver](v19, "userListeningHistoryUpdateControlModelUpdateReceiver");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = MEMORY[0x24BDAC760];
      v80[1] = 3221225472;
      v80[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_7;
      v80[3] = &unk_24E7780E8;
      v81 = v16;
      v33 = v76;
      objc_msgSend(v49, "userListeningHistoryUpdateControlModelUpdated:previousModel:completion:", v76, v14, v80);

      v50 = v81;
      v12 = v79;
      v15 = v77;
LABEL_47:

      goto LABEL_48;
    }
    v51 = v71;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v52 = v51;
    else
      v52 = 0;
    v53 = v52;

    v72 = v53;
    if (v53)
    {
      v54 = v14;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55 = v54;
      else
        v55 = 0;
      v56 = v55;

      v57 = objc_msgSend(v53, "hmbIsDifferentFromModel:differingFields:", v56, 0);
      if (v57)
      {
        v58 = v53;
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "postNotificationName:object:", CFSTR("HMDUserDidUpdateIDSActivityRegistration"), v58);

      }
      v60 = objc_alloc_init(MEMORY[0x24BE4EC48]);
      objc_msgSend(v16, "finishWithResult:", v60);
    }
    else
    {
      v61 = v51;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v62 = v61;
      else
        v62 = 0;
      v60 = v62;

      if (!v60)
      {
        v70 = v61;
        v65 = (void *)MEMORY[0x227676638]();
        v66 = v19;
        HMFGetOSLogHandle();
        v67 = objc_claimAutoreleasedReturnValue();
        v15 = v77;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v69 = v65;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v95 = v68;
          v96 = 2112;
          v97 = v70;
          _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_INFO, "%{public}@No handler for model %@", buf, 0x16u);

          v65 = v69;
        }

        objc_autoreleasePoolPop(v65);
        v60 = 0;
        goto LABEL_46;
      }
      -[HMDUserSettingsBackingStoreController delegate](v19, "delegate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "backingStoreController:didUpdatePhotosPersonManagerSettingsModel:previousPhotosPersonManagerSettingsModel:", v19, v60, v14);

      v64 = objc_alloc_init(MEMORY[0x24BE4EC48]);
      objc_msgSend(v16, "finishWithResult:", v64);

    }
    v15 = v77;
LABEL_46:
    v33 = v76;

    v12 = v79;
    v50 = v72;
    goto LABEL_47;
  }
  v92[0] = MEMORY[0x24BDAC760];
  v92[1] = 3221225472;
  v92[2] = __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke;
  v92[3] = &unk_24E7780E8;
  v93 = v16;
  objc_msgSend(v22, "transactionSettingGroupModelUpdated:previousModel:completion:", v23, v14, v92);
  v26 = v93;
LABEL_50:

}

- (void)registerForSettingsTransactions:(id)a3
{
  id v4;
  void *v5;
  HMDUserSettingsBackingStoreController *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering transaction receiver %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDUserSettingsBackingStoreController setTransactionReceiver:](v6, "setTransactionReceiver:", v4);

}

- (void)runSettingTransaction:(id)a3 completion:(id)a4
{
  -[HMDUserSettingsBackingStoreController runTransaction:waitForCloudPush:completion:](self, "runTransaction:waitForCloudPush:completion:", a3, 0, a4);
}

- (id)settingTransactionWithName:(id)a3
{
  id v3;
  HMDSettingTransaction *v4;

  v3 = a3;
  v4 = -[HMDSettingTransaction initWithTransactionLabel:]([HMDSettingTransaction alloc], "initWithTransactionLabel:", v3);

  return v4;
}

- (void)runTransaction:(id)a3 waitForCloudPush:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  HMDUserSettingsBackingStoreController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDUserSettingsBackingStoreController *v23;
  NSObject *v24;
  void *v25;
  HMDAssertionLogEvent *v26;
  void *v27;
  void *v28;
  HMDUserSettingsBackingStoreController *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  HMDUserSettingsBackingStoreController *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  BOOL v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v6 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v48 = a5;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMDUserSettingsBackingStoreControllerRunStateAsString(-[HMDUserSettingsBackingStoreController runState](v10, "runState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v54 = v12;
    v55 = 2112;
    v56 = v8;
    v57 = 2112;
    v58 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Running transaction %@, runState: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDUserSettingsBackingStoreController localZone](v10, "localZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    v18 = (void *)MEMORY[0x24BE4ED10];
    objc_msgSend(v17, "transactionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "optionsWithLabel:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "initialCreation") & 1) != 0 || v6)
      objc_msgSend(v20, "setShouldRollBackIfMirrorOutputFails:", 1);
    objc_msgSend(v17, "updateModels", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
    {

    }
    else
    {
      objc_msgSend(v17, "removeUUIDs");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (!v34)
      {
        v43 = (void *)MEMORY[0x227676638]();
        v44 = v10;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v54 = v46;
          v55 = 2112;
          v56 = v15;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Skipping Empty transaction: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        v32 = v48;
        (*((void (**)(id, _QWORD))v48 + 2))(v48, 0);
        goto LABEL_19;
      }
    }
    objc_msgSend(v17, "updateModels");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeUUIDs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addModels:andRemoveModelIDs:options:", v35, v36, v20);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x24BE6B628];
    -[HMDUserSettingsBackingStoreController workQueue](v10, "workQueue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "schedulerWithDispatchQueue:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "reschedule:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke;
    v49[3] = &unk_24E778138;
    v49[4] = v10;
    v50 = v15;
    v52 = v6;
    v32 = v48;
    v51 = v48;
    v42 = (id)objc_msgSend(v41, "addCompletionBlock:", v49);

LABEL_19:
    v8 = v47;
    goto LABEL_20;
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = v10;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v25;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to run transaction due to nil localZone", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  v26 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Failed to run transaction due to nil localZone"));
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "submitLogEvent:", v26);

  v28 = (void *)MEMORY[0x227676638]();
  v29 = v23;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v31;
    v55 = 2112;
    v56 = v8;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction: %@ due to nil localZone", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v48;
  (*((void (**)(id, id))v48 + 2))(v48, v17);
LABEL_20:

}

- (void)database:(id)a3 didCreateZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5;
  id v7;
  char v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];

  v5 = a5;
  v7 = a4;
  -[HMDUserSettingsBackingStoreController zoneName](self, "zoneName");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:");

  if ((v8 & 1) != 0)
  {
    -[HMDUserSettingsBackingStoreController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCurrentUser");

    if (v10 == v5)
    {
      -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__HMDUserSettingsBackingStoreController_database_didCreateZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = self;
      dispatch_async(v11, block);

    }
  }
  else
  {

  }
}

- (void)database:(id)a3 didRemoveZoneWithName:(id)a4 isPrivate:(BOOL)a5
{
  int v5;
  id v7;
  char v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];

  v5 = a5;
  v7 = a4;
  -[HMDUserSettingsBackingStoreController zoneName](self, "zoneName");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:");

  if ((v8 & 1) != 0)
  {
    -[HMDUserSettingsBackingStoreController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCurrentUser");

    if (v10 == v5)
    {
      -[HMDUserSettingsBackingStoreController workQueue](self, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__HMDUserSettingsBackingStoreController_database_didRemoveZoneWithName_isPrivate___block_invoke;
      block[3] = &unk_24E79C240;
      block[4] = self;
      dispatch_async(v11, block);

    }
  }
  else
  {

  }
}

- (HMDUserSettingsBackingStoreControllerDelegate)delegate
{
  return (HMDUserSettingsBackingStoreControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDDatabase)database
{
  return (HMDDatabase *)objc_getProperty(self, a2, 56, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCloudShareMessenger)shareMessenger
{
  return (HMDCloudShareMessenger *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCloudShareParticipantsManager)participantsManager
{
  return (HMDCloudShareParticipantsManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setParticipantsManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCloudZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int64_t)runState
{
  return self->_runState;
}

- (void)setRunState:(int64_t)a3
{
  self->_runState = a3;
}

- (int64_t)logEventRunState
{
  return self->_logEventRunState;
}

- (void)setLogEventRunState:(int64_t)a3
{
  self->_logEventRunState = a3;
}

- (HMDSettingTransactionReceiverProtocol)transactionReceiver
{
  return (HMDSettingTransactionReceiverProtocol *)objc_loadWeakRetained((id *)&self->_transactionReceiver);
}

- (void)setTransactionReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_transactionReceiver, a3);
}

- (HMDAssistantAccessControlModelUpdateReceiver)assistantAccessControlModelUpdateReceiver
{
  return (HMDAssistantAccessControlModelUpdateReceiver *)objc_loadWeakRetained((id *)&self->_assistantAccessControlModelUpdateReceiver);
}

- (void)setAssistantAccessControlModelUpdateReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_assistantAccessControlModelUpdateReceiver, a3);
}

- (NSUUID)assistantAccessControlModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAssistantAccessControlModelID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (HMDMediaContentProfileAccessControlModelUpdateReceiver)mediaContentProfileAccessControlModelUpdateReceiver
{
  return (HMDMediaContentProfileAccessControlModelUpdateReceiver *)objc_loadWeakRetained((id *)&self->_mediaContentProfileAccessControlModelUpdateReceiver);
}

- (void)setMediaContentProfileAccessControlModelUpdateReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_mediaContentProfileAccessControlModelUpdateReceiver, a3);
}

- (NSUUID)mediaContentProfileAccessControlModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMediaContentProfileAccessControlModelID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSUUID)userListeningHistoryUpdateModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUserListeningHistoryUpdateModelID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (HMDUserListeningHistoryUpdateControlModelUpdateReceiver)userListeningHistoryUpdateControlModelUpdateReceiver
{
  return (HMDUserListeningHistoryUpdateControlModelUpdateReceiver *)objc_loadWeakRetained((id *)&self->_userListeningHistoryUpdateControlModelUpdateReceiver);
}

- (void)setUserListeningHistoryUpdateControlModelUpdateReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_userListeningHistoryUpdateControlModelUpdateReceiver, a3);
}

- (NSUUID)sharedUserDataModelUpdateModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSharedUserDataModelUpdateModelID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (HMDSharedUserDataModelUpdateReceiver)sharedUserDataModelUpdateReceiver
{
  return (HMDSharedUserDataModelUpdateReceiver *)objc_loadWeakRetained((id *)&self->_sharedUserDataModelUpdateReceiver);
}

- (void)setSharedUserDataModelUpdateReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_sharedUserDataModelUpdateReceiver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sharedUserDataModelUpdateReceiver);
  objc_storeStrong((id *)&self->_sharedUserDataModelUpdateModelID, 0);
  objc_destroyWeak((id *)&self->_userListeningHistoryUpdateControlModelUpdateReceiver);
  objc_storeStrong((id *)&self->_userListeningHistoryUpdateModelID, 0);
  objc_storeStrong((id *)&self->_mediaContentProfileAccessControlModelID, 0);
  objc_destroyWeak((id *)&self->_mediaContentProfileAccessControlModelUpdateReceiver);
  objc_storeStrong((id *)&self->_assistantAccessControlModelID, 0);
  objc_destroyWeak((id *)&self->_assistantAccessControlModelUpdateReceiver);
  objc_destroyWeak((id *)&self->_transactionReceiver);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_participantsManager, 0);
  objc_storeStrong((id *)&self->_shareMessenger, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __82__HMDUserSettingsBackingStoreController_database_didRemoveZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Zone was removed by the database", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didStopBackingStoreController:", *(_QWORD *)(a1 + 32));

}

uint64_t __82__HMDUserSettingsBackingStoreController_database_didCreateZoneWithName_isPrivate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling zone creation by starting", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

void __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v6;
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished running transaction: %@, Error: %@, waitForCloudPush: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if (v6 || !*(_BYTE *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (v5
         && (objc_msgSend(v5, "mirrorOutputResult"),
             v13 = (void *)objc_claimAutoreleasedReturnValue(),
             v13,
             v13))
  {
    objc_msgSend(v5, "mirrorOutputResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BE6B628];
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "schedulerWithDispatchQueue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reschedule:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke_134;
    v27[3] = &unk_24E778110;
    v19 = *(void **)(a1 + 40);
    v27[4] = *(_QWORD *)(a1 + 32);
    v28 = v19;
    v29 = v5;
    v30 = *(id *)(a1 + 48);
    v20 = (id)objc_msgSend(v18, "addCompletionBlock:", v27);

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@No processing result to wait for.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v25 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

  }
}

void __84__HMDUserSettingsBackingStoreController_runTransaction_waitForCloudPush_completion___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = 138544130;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished running mirror protocol for transaction: %@, inResult: %@, inError: %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

uint64_t __94__HMDUserSettingsBackingStoreController__localZone_updatedModel_previousModel_options_result___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __73__HMDUserSettingsBackingStoreController_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "model");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "previousModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_localZone:updatedModel:previousModel:options:result:", v3, v6, v4, v5, *(_QWORD *)(a1 + 56));

}

void __75__HMDUserSettingsBackingStoreController_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "model");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_localZone:updatedModel:previousModel:options:result:", v3, v5, 0, v4, *(_QWORD *)(a1 + 56));

}

void __87__HMDUserSettingsBackingStoreController_messenger_didReceiveInvitationData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  v5 = a2;
  v6 = a3;
  if (v5)
  {
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
      v14 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully accepted invitation and created shared zone with ID %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "start");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __76__HMDUserSettingsBackingStoreController__sendShareInvitation_toUser_device___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  uint64_t v15;
  HMDUserDataZoneControllerShareLogEvent *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)a2)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v10;
    v11 = "%{public}@User settings zone sharing invitation was successfully accepted";
    v12 = v9;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v10;
    v20 = 2112;
    v21 = v5;
    v11 = "%{public}@User settings zone sharing invitation was not accepted: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 22;
  }
  _os_log_impl(&dword_2218F0000, v12, v13, v11, (uint8_t *)&v18, v14);

LABEL_7:
  objc_autoreleasePoolPop(v6);
  if (v5)
    v15 = 2;
  else
    v15 = 1;
  v16 = -[HMDUserDataZoneControllerShareLogEvent initWithResult:didAccept:]([HMDUserDataZoneControllerShareLogEvent alloc], "initWithResult:didAccept:", v15, a2);
  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "submitLogEvent:", v16);

}

void __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Zone failed to startup: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = 138412290;
    v12 = v3;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v9, OS_SIGNPOST_INTERVAL_END, v10, "UserZone.Startup", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateRunState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateLogEventRunState:", 3);

}

void __84__HMDUserSettingsBackingStoreController__didFetchZonesWithResult_isOwnedZone_error___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
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
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Started user data zone.", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v13) = 0;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v9, OS_SIGNPOST_INTERVAL_END, v10, "UserZone.Startup", ", (uint8_t *)&v13, 2u);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "registerSubscriptionForExternalRecordType:", 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateRunState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_updateLogEventRunState:", 2);
  objc_msgSend(*(id *)(a1 + 40), "didStartBackingStoreController:", *(_QWORD *)(a1 + 32));

}

- (id)_uuidForActivitySubject:(void *)a3 observer:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v4 = (void *)MEMORY[0x24BDD1880];
    v5 = a2;
    objc_msgSend(a3, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __101__HMDUserSettingsBackingStoreController_queryPushTokensForDevicesObservingSubjectDevice_subActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "subActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "localZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hmbParentModelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v6, "fetchModelWithModelID:ofType:error:", v7, objc_opt_class(), &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFString *)v18;

    objc_msgSend(v8, "pushToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v8, "pushToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
    else
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("No parent observer model found");
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        if (v9)
          v17 = v9;
        v21 = 2112;
        v22 = v3;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to locate push token for registration %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
}

void __76__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove IDS Activity observer %@: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

- (id)_registrationWithParent:(void *)a3 subjectDeviceIdentifier:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(a1, "localZone", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchModelsWithParentModelID:error:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "subjectDeviceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v6);

          if ((v14 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __130__HMDUserSettingsBackingStoreController_deregisterObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update IDS Activity registration for %@: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __90__HMDUserSettingsBackingStoreController_updateObserverDeviceIdentifier_observerPushToken___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update IDS Activity for observer %@: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __128__HMDUserSettingsBackingStoreController_registerObserverDeviceIdentifier_observerPushToken_subActivity_subjectDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to update IDS Activity registration for observer %@: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t81 != -1)
    dispatch_once(&logCategory__hmf_once_t81, &__block_literal_global_20414);
  return (id)logCategory__hmf_once_v82;
}

void __52__HMDUserSettingsBackingStoreController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v82;
  logCategory__hmf_once_v82 = v0;

}

@end
