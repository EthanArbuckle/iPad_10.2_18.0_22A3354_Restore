@implementation HMDCameraClipManager

- (HMDCameraClipManager)initWithHome:(id)a3 zoneUUID:(id)a4 messageDispatcher:(id)a5 workQueue:(id)a6 cameraProfileUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HMDDatabaseZoneManager *v18;
  void *v19;
  HMDDatabaseZoneManager *v20;
  HMDCameraSignificantEventFaceClassificationResolver *v21;
  HMDActiveXPCClientConnectionsPeriodicTimer *v22;
  void *v23;
  HMDActiveXPCClientConnectionsPeriodicTimer *v24;
  HMDFeaturesDataSource *v25;
  void *v26;
  HMDFileManager *v27;
  HMDCameraClipManager *v28;
  HMDCameraClipManager *v30;
  SEL v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;

  v12 = a3;
  v13 = a4;
  v41 = a5;
  v14 = a6;
  v15 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v13)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v41)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v13, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("camera-clips-"), "stringByAppendingString:", v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = [HMDDatabaseZoneManager alloc];
    +[HMDDatabase cameraClipsDatabase](HMDDatabase, "cameraClipsDatabase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HMDDatabaseZoneManager initWithDatabase:zoneName:home:messageTargetUUID:workQueue:](v18, "initWithDatabase:zoneName:home:messageTargetUUID:workQueue:", v19, v40, v12, v16, v14);

    v21 = -[HMDCameraSignificantEventFaceClassificationResolver initWithHome:]([HMDCameraSignificantEventFaceClassificationResolver alloc], "initWithHome:", v12);
    v22 = [HMDActiveXPCClientConnectionsPeriodicTimer alloc];
    -[HMDDatabaseZoneManager zoneName](v20, "zoneName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDActiveXPCClientConnectionsPeriodicTimer initWithTimeInterval:logIdentifier:workQueue:](v22, "initWithTimeInterval:logIdentifier:workQueue:", v23, v14, 4.0);

    v25 = objc_alloc_init(HMDFeaturesDataSource);
    +[HMDCameraClipsQuotaManager defaultManager](HMDCameraClipsQuotaManager, "defaultManager");
    v38 = v13;
    v39 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(HMDFileManager);
    v28 = -[HMDCameraClipManager initWithZoneManager:quotaManager:faceClassificationResolver:clientConnectionsTimer:messageDispatcher:workQueue:cameraProfileUUID:fileManager:featuresDataSource:](self, "initWithZoneManager:quotaManager:faceClassificationResolver:clientConnectionsTimer:messageDispatcher:workQueue:cameraProfileUUID:fileManager:featuresDataSource:", v20, v26, v21, v24, v41, v14, v16, v27, v25);

    return v28;
  }
LABEL_11:
  v30 = (HMDCameraClipManager *)_HMFPreconditionFailure();
  return -[HMDCameraClipManager initWithZoneManager:quotaManager:faceClassificationResolver:clientConnectionsTimer:messageDispatcher:workQueue:cameraProfileUUID:fileManager:featuresDataSource:](v30, v31, v32, v33, v34, v35, v36, v37, v42, v43, v44);
}

- (HMDCameraClipManager)initWithZoneManager:(id)a3 quotaManager:(id)a4 faceClassificationResolver:(id)a5 clientConnectionsTimer:(id)a6 messageDispatcher:(id)a7 workQueue:(id)a8 cameraProfileUUID:(id)a9 fileManager:(id)a10 featuresDataSource:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  HMDCameraClipManager *v25;
  HMDCameraClipManager *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *logIdentifier;
  uint64_t v33;
  NSDate *suppressNotificationsBeforeDate;
  id v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  const char *v40;
  dispatch_queue_t v41;
  OS_dispatch_queue *cleanupQueue;
  void *v43;
  id fetchServerFactory;
  HMDCameraClipManager *v46;
  SEL v47;
  id v48;
  id obj;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD aBlock[4];
  id v60;
  objc_super v61;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v50 = a5;
  v19 = a5;
  v20 = a7;
  v58 = v19;
  v57 = a6;
  v56 = a7;
  v51 = a8;
  v21 = a8;
  v22 = a9;
  v55 = a10;
  v23 = a11;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v58)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v57)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v56)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v21)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  if (!v22)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v23)
  {
LABEL_19:
    v46 = (HMDCameraClipManager *)_HMFPreconditionFailure();
    return (HMDCameraClipManager *)-[HMDCameraClipManager significantEventsForClipWithUUID:](v46, v47, v48);
  }
  v52 = v23;
  v53 = v18;
  v61.receiver = self;
  v61.super_class = (Class)HMDCameraClipManager;
  v24 = v17;
  v25 = -[HMDCameraClipManager init](&v61, sel_init);
  v26 = v25;
  v27 = v21;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_zoneManager, a3);
    objc_storeStrong((id *)&v26->_messageDispatcher, v20);
    objc_storeStrong((id *)&v26->_quotaManager, obj);
    objc_storeStrong((id *)&v26->_faceClassificationResolver, v50);
    objc_storeStrong((id *)&v26->_clientConnectionsTimer, a6);
    objc_storeStrong((id *)&v26->_workQueue, v51);
    objc_storeStrong((id *)&v26->_cameraProfileUUID, a9);
    objc_storeStrong((id *)&v26->_fileManager, a10);
    objc_storeStrong((id *)&v26->_featuresDataSource, a11);
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v24, "zoneName");
    v29 = v24;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@"), v22, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v26->_logIdentifier;
    v26->_logIdentifier = (NSString *)v31;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v33 = objc_claimAutoreleasedReturnValue();
    suppressNotificationsBeforeDate = v26->_suppressNotificationsBeforeDate;
    v26->_suppressNotificationsBeforeDate = (NSDate *)v33;

    v26->_fetchBatchLimit = 100;
    HMDispatchQueueNameString();
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v36 = objc_msgSend(v35, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v37 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(9, 0);
    v38 = v22;
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (const char *)v36;
    v24 = v29;
    v41 = dispatch_queue_create_with_target_V2(v40, v37, v39);
    cleanupQueue = v26->_cleanupQueue;
    v26->_cleanupQueue = (OS_dispatch_queue *)v41;

    v22 = v38;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __184__HMDCameraClipManager_initWithZoneManager_quotaManager_faceClassificationResolver_clientConnectionsTimer_messageDispatcher_workQueue_cameraProfileUUID_fileManager_featuresDataSource___block_invoke;
    aBlock[3] = &unk_1E89B7F60;
    v60 = v27;
    v43 = _Block_copy(aBlock);
    fetchServerFactory = v26->_fetchServerFactory;
    v26->_fetchServerFactory = v43;

  }
  return v26;
}

- (id)significantEventsForClipWithUUID:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMDCameraClipManager _significantEventModelsForClipWithUUID:](self, "_significantEventModelsForClipWithUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HMDCameraClipManager_significantEventsForClipWithUUID___block_invoke;
  v7[3] = &unk_1E89B7F88;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)significantEventsWithDateInterval:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HMDCameraClipManager_significantEventsWithDateInterval___block_invoke;
  v10[3] = &unk_1E89B7FB0;
  v11 = v6;
  v7 = v6;
  -[HMDCameraClipManager _fetchSignificantEventsWithDateInterval:isAscending:error:handler:](self, "_fetchSignificantEventsWithDateInterval:isAscending:error:handler:", v5, 1, 0, v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (void)setHasWriteAccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_hasWriteAccess != v3)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating has write access from %@ to %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    self->_hasWriteAccess = v3;
    if (v3)
    {
      -[HMDCameraClipManager zoneManager](v7, "zoneManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateShareParticipants");

    }
  }
}

- (BOOL)hasStartedUpCloudZone
{
  void *v2;
  void *v3;
  char v4;

  -[HMDCameraClipManager cloudZone](self, "cloudZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFinished");

  return v4;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDCameraClipManager *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipManager zoneManager](self, "zoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDCameraClipManager messageDispatcher](self, "messageDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 133);
    v7 = objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 3, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v7;
    v52[1] = v8;
    v40 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8480], self, v10, sel_handleFetchVideoSegmentsAssetContextMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8548], self, v10, sel_handleSubscribeMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8550], self, v10, sel_handleUnsubscribeMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8538], self, v10, sel_handlePerformCloudPullMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8438], self, v10, sel_handleFetchClipMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8440], self, v10, sel_handleFetchClipsMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8430], self, v10, sel_handleFetchClipForSignificantEventMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8448], self, v10, sel_handleFetchCountOfClipsMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8460], self, v10, sel_handleFetchHeroFrameDataRepresentationMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8468], self, v10, sel_handleFetchHeroFrameURLMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8450], self, v10, sel_handleFetchFaceCropDataRepresentationMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8458], self, v10, sel_handleFetchFaceCropURLMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8478], self, v10, sel_handleFetchSignificantEventsMessage_);
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 4);
    v11 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v7;
    v51[0] = v7;
    v51[1] = v9;
    v51[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8418], self, v12, sel_handleDeleteClipMessage_);
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8410], self, v12, sel_handleDeleteAllClipsMessage_);
    v43 = (void *)v12;
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8488], self, v12, sel_handleHandleFaceMisclassificationMessage_);
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v44 = (void *)v11;
    v50[0] = v9;
    v50[1] = v11;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("HMDCCM.m.rhfm"), self);
    if (isInternalBuild())
    {
      +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0CB8490];
      v49[0] = v46;
      v49[1] = v45;
      v49[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", v14, self, v15, sel_handleImportClipsMessage_);

      v16 = *MEMORY[0x1E0CB8470];
      v48[0] = v46;
      v48[1] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", v16, self, v17, sel_handleFetchIsCloudStorageEnabledMessage_);

      v18 = *MEMORY[0x1E0CB8558];
      v47[0] = v46;
      v47[1] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", v18, self, v19, sel_handleUpdateCloudStorageMessage_);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_handleUserPrivilegeDidChangeNotification_, CFSTR("HMDUserPrivilegeDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_handleUserCamerasAccessLevelDidChangeNotification_, CFSTR("HMDUserCamerasAccessLevelDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", self, sel_handleUserRemoteAccessDidChangeNotification_, CFSTR("HMDUserRemoteAccessDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_handleHomePersonManagerSettingsDidChangeNotification_, CFSTR("HMDHomePersonManagerSettingsDidChangeNotification"), v5);

    -[HMDCameraClipManager zoneManager](self, "zoneManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "defaultConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v26, "setZoneOwner:", objc_msgSend(v5, "isOwnerUser"));
    v27 = (void *)MEMORY[0x1E0C99E60];
    +[HMDCameraSignificantEventNotificationModel hmbExternalRecordType](HMDCameraSignificantEventNotificationModel, "hmbExternalRecordType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithObject:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setExternalRecordTypesForSubscriptions:", v29);

    -[HMDCameraClipManager zoneManager](self, "zoneManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDefaultConfiguration:", v26);

    -[HMDCameraClipManager zoneManager](self, "zoneManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDelegate:", self);

    -[HMDCameraClipManager zoneManager](self, "zoneManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDataSource:", self);

    -[HMDCameraClipManager zoneManager](self, "zoneManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "configure");

    -[HMDCameraClipManager zoneManager](self, "zoneManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "start");

    -[HMDCameraClipManager clientConnectionsTimer](self, "clientConnectionsTimer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDelegate:", self);

  }
  else
  {
    v36 = (void *)MEMORY[0x1D17BA0A0]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v39;
      _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Skipping camera clip manager configure because home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v36);
  }

}

- (id)heroFrameURLForSignificantEventWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraClipManager *v12;
  NSObject *v13;
  void *v14;
  id v16;
  __int128 v17;
  _BYTE buf[18];
  __int16 v19;
  __int128 *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraClipManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v6, "fetchModelWithModelID:ofType:error:", v4, objc_opt_class(), &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  if (v7)
  {
    objc_msgSend(v7, "heroFrameAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if (v4)
        objc_msgSend(v4, "getUUIDBytes:", buf);
      else
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      v17 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v19 = 2098;
      v20 = &v17;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant notification model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)fetchHeroFrameURLForSignificantEventWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDCameraClipManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  _BYTE buf[18];
  __int16 v20;
  __int128 *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraClipManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v6, "fetchModelWithModelID:ofType:error:", v4, objc_opt_class(), &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (v7)
  {
    -[HMDCameraClipManager _fetchHeroFrameURLForSignificantEventModel:](self, "_fetchHeroFrameURLForSignificantEventModel:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if (v4)
        objc_msgSend(v4, "getUUIDBytes:", buf);
      else
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      v18 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v20 = 2098;
      v21 = &v18;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant notification model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)remove
{
  NSObject *v3;
  void *v4;
  HMDCameraClipManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Asked to remove clip manager zones", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraClipManager zoneManager](v5, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remove");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)enableCloudStorage
{
  NSObject *v3;
  void *v4;
  HMDCameraClipManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCameraClipManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v22 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Asked to enable cloud storage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraClipManager zoneManager](v5, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isZoneOwner");

  if ((v10 & 1) != 0)
  {
    -[HMDCameraClipManager cloudZone](v5, "cloudZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startUp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__HMDCameraClipManager_enableCloudStorage__block_invoke;
    v20[3] = &unk_1E89BAB68;
    v20[4] = v5;
    objc_msgSend(v12, "flatMap:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v5;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@User is not the zone owner; cannot enable cloud storage",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "futureWithError:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)disableCloudStorage
{
  NSObject *v3;
  void *v4;
  HMDCameraClipManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraClipManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v25 = 138543362;
    v26 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Asked to disable cloud storage", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraClipManager zoneManager](v5, "zoneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isZoneOwner");

  if ((v10 & 1) != 0)
  {
    -[HMDCameraClipManager quotaManager](v5, "quotaManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager zoneManager](v5, "zoneManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "disableCloudStorageForZoneWithName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D519E8];
    -[HMDCameraClipManager workQueue](v5, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "schedulerWithDispatchQueue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reschedule:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v5;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@User is not the zone owner; cannot disable cloud storage",
        (uint8_t *)&v25,
        0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithError:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)cleanUpClips
{
  NSObject *v3;

  -[HMDCameraClipManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipManager _cleanUpClipsForInitialStartup:](self, "_cleanUpClipsForInitialStartup:", 0);
}

- (id)performCloudPull
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__HMDCameraClipManager_performCloudPull__block_invoke;
  v9[3] = &unk_1E89C2328;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_async(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)significantEventsForClipContainingDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDCameraClipManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraClipManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDCameraClipManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  uint8_t v31[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__139225;
    v40 = __Block_byref_object_dispose__139226;
    v41 = 0;
    v6 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v4);

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __63__HMDCameraClipManager_significantEventsForClipContainingDate___block_invoke;
    v30[3] = &unk_1E89B7FD8;
    v30[4] = &buf;
    v9 = -[HMDCameraClipManager _fetchClipsWithDateInterval:quality:isAscending:error:handler:](self, "_fetchClipsWithDateInterval:quality:isAscending:error:handler:", v8, 0, 0, 0, v30);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "duration");
      v13 = (void *)objc_msgSend(v10, "initWithStartDate:duration:", v11, v12 + 30.0);

      if ((objc_msgSend(v13, "containsDate:", v4) & 1) != 0)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "significantEvents");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v31 = 138543874;
          v32 = v27;
          v33 = 2112;
          v34 = v28;
          v35 = 2112;
          v36 = v4;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Clip: %@, does not contain date: %@", v31, 0x20u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)v14;

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0](v9);
      v21 = self;
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v31 = 138543618;
        v32 = v23;
        v33 = 2112;
        v34 = v4;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Did not find any clips before date: %@", v31, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch significant events clip containing date because zones are not ready", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)home
{
  void *v2;
  void *v3;

  -[HMDCameraClipManager zoneManager](self, "zoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_significantEventModelsWithUUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  HMDCameraClipManager *v17;
  HMDCameraClipManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;
  id obj;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE buf[18];
  __int16 v34;
  __int128 *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v29;
    *(_QWORD *)&v6 = 138544130;
    v23 = v6;
    do
    {
      v9 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        -[HMDCameraClipManager localZone](self, "localZone", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_class();
        v27 = 0;
        objc_msgSend(v11, "fetchModelWithModelID:ofType:error:", v10, v12, &v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v27;

        if (v13)
        {
          objc_msgSend(v26, "addObject:", v13);
        }
        else
        {
          v15 = v8;
          v16 = (void *)MEMORY[0x1D17BA0A0]();
          v17 = self;
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            if (v10)
              objc_msgSend(v10, "getUUIDBytes:", buf);
            else
              *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
            v32 = *(_OWORD *)buf;
            *(_DWORD *)buf = v23;
            *(_QWORD *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 1042;
            *(_DWORD *)&buf[14] = 16;
            v34 = 2098;
            v35 = &v32;
            v36 = 2112;
            v37 = v14;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant notification model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

          }
          objc_autoreleasePoolPop(v16);
          v8 = v15;
          self = v17;
          v7 = v24;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v7);
  }

  v21 = (void *)objc_msgSend(v26, "copy");
  return v21;
}

- (id)_significantEventModelsForClipWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  _BYTE buf[18];
  __int16 v18;
  __int128 *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "fetchModelsWithParentModelID:ofType:error:", v4, objc_opt_class(), &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if (v4)
        objc_msgSend(v4, "getUUIDBytes:", buf);
      else
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      v16 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v18 = 2098;
      v19 = &v16;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant events for clip UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v8;

  return v13;
}

- (id)_significantEventFromSignificantEventModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "hmbModelID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager _faceClassificationsForSignificantEventWithUUID:](self, "_faceClassificationsForSignificantEventWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipManager faceClassificationResolver](self, "faceClassificationResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "faceClassificationForSignificantEventFaceClassifications:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipManager cameraProfileUUID](self, "cameraProfileUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createClipSignificantEventWithCameraProfileUUID:faceClassification:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_significantEventsWithUUIDs:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HMDCameraClipManager _significantEventModelsWithUUIDs:](self, "_significantEventModelsWithUUIDs:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDCameraClipManager__significantEventsWithUUIDs___block_invoke;
  v7[3] = &unk_1E89B7F88;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_faceClassificationsForSignificantEventWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  HMDCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  _BYTE buf[18];
  __int16 v18;
  __int128 *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "fetchModelsWithParentModelID:ofType:error:", v4, objc_opt_class(), &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v6)
  {
    objc_msgSend(v6, "na_map:", &__block_literal_global_139219);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if (v4)
        objc_msgSend(v4, "getUUIDBytes:", buf);
      else
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      v16 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v18 = 2098;
      v19 = &v16;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch face classification models for significant event UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v8;

  return v13;
}

- (BOOL)_fetchSignificantEventsWithDateInterval:(id)a3 isAscending:(BOOL)a4 error:(id *)a5 handler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMDCameraClipManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  HMDCameraClipManager *v34;
  id v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v8 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __90__HMDCameraClipManager__fetchSignificantEventsWithDateInterval_isAscending_error_handler___block_invoke;
  v33 = &unk_1E89B8040;
  v34 = self;
  v12 = v11;
  v35 = v12;
  v13 = _Block_copy(&v30);
  v18 = (void *)MEMORY[0x1D17BA0A0](v13, v14, v15, v16, v17);
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v21;
    v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching significant events with date interval: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  +[HMDCameraSignificantEventNotificationModel significantEventsBetweenDatesQueryWithIsAscending:](HMDCameraSignificantEventNotificationModel, "significantEventsBetweenDatesQueryWithIsAscending:", v8, v30, v31, v32, v33, v34);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = CFSTR("dateAfter");
  objc_msgSend(v10, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = CFSTR("dateBefore");
  v37[0] = v23;
  objc_msgSend(v10, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipManager localZone](v19, "localZone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "queryModelsUsingQuery:arguments:", v22, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v13);
  objc_msgSend(v27, "error");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 && v28)
  {
    objc_msgSend(v27, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v28 == 0;
}

- (BOOL)_fetchClipsWithDateInterval:(id)a3 quality:(int64_t)a4 isAscending:(BOOL)a5 error:(id *)a6 handler:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HMDCameraClipManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraClipManager *v29;
  NSObject *v30;
  void *v31;
  BOOL v32;
  _QWORD aBlock[5];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[3];
  _QWORD v42[3];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v9 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HMDCameraClipManager__fetchClipsWithDateInterval_quality_isAscending_error_handler___block_invoke;
  aBlock[3] = &unk_1E89B8068;
  aBlock[4] = self;
  v36 = &v37;
  v14 = v13;
  v35 = v14;
  v15 = _Block_copy(aBlock);
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v19;
    v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetching clips with date interval: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  if (v9)
    +[HMDCameraClipModel clipsWithQualityBetweenDatesAscendingQuery](HMDCameraClipModel, "clipsWithQualityBetweenDatesAscendingQuery");
  else
    +[HMDCameraClipModel clipsWithQualityBetweenDatesDescendingQuery](HMDCameraClipModel, "clipsWithQualityBetweenDatesDescendingQuery");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = CFSTR("dateAfter");
  objc_msgSend(v12, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v21;
  v41[1] = CFSTR("dateBefore");
  objc_msgSend(v12, "endDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v22;
  v41[2] = CFSTR("quality");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCameraClipManager localZone](v17, "localZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "queryModelsUsingQuery:arguments:", v20, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(v26, "error");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    *((_BYTE *)v38 + 24) = 0;
    if (a6)
    {
      objc_msgSend(v26, "error");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = v17;
  HMFGetOSLogHandle();
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v31;
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Finished fetching clips", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v28);
  v32 = *((_BYTE *)v38 + 24) != 0;

  _Block_object_dispose(&v37, 8);
  return v32;
}

- (id)_fetchCanonicalHeroFrameURLForClipModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  HMDCameraClipManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCameraClipManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
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
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v37 = v4;
  objc_msgSend(v4, "hmbModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager significantEventsForClipWithUUID:](self, "significantEventsForClipWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v7;
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_126_139209);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  v38 = v10;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[HMDCameraClipManager localZone](self, "localZone");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_class();
        v39 = 0;
        objc_msgSend(v16, "fetchModelWithModelID:ofType:error:", v17, v18, &v39);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v39;

        if (v19)
        {
          -[HMDCameraClipManager _fetchHeroFrameURLForSignificantEventModel:](self, "_fetchHeroFrameURLForSignificantEventModel:", v19);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v10;
          v34 = v10;
          v33 = v36;
          v28 = v37;
          goto LABEL_15;
        }
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v45 = v24;
          v46 = 2112;
          v47 = v20;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant event notification model: %@", buf, 0x16u);

          v10 = v38;
        }

        objc_autoreleasePoolPop(v21);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v12)
        continue;
      break;
    }
  }

  v25 = (void *)MEMORY[0x1D17BA0A0]();
  v26 = self;
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v37;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v29;
    v46 = 2112;
    v47 = v37;
    _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Could not find hero frame on any significant event for clip model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
  v30 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "futureWithError:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v36;
  v34 = v38;
LABEL_15:

  return v32;
}

- (id)_fetchHeroFrameURLForSignificantEventModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraClipManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  _QWORD v30[5];
  __int128 v31;
  _BYTE buf[18];
  __int16 v33;
  __int128 *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "heroFrameAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[HMDCameraClipManager fileManager](self, "fileManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "fileExistsAtURL:", v6),
        v7,
        v8))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "hmbModelID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v4, "hmbModelID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v31 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v33 = 2098;
      v34 = &v31;
      v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Using existing cached hero frame URL for significant event with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Force fetching significant event model from cloud for hero frame url", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCameraClipManager cloudZone](v16, "cloudZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchCompleteModel:", v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D519E8];
    -[HMDCameraClipManager workQueue](v16, "workQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "schedulerWithDispatchQueue:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reschedule:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke;
    v30[3] = &unk_1E89B80B0;
    v30[4] = v16;
    objc_msgSend(v24, "flatMap:", v30);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    v29[1] = 3221225472;
    v29[2] = __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke_128;
    v29[3] = &unk_1E89C2350;
    v29[4] = v16;
    objc_msgSend(v26, "addFailureBlock:", v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

- (id)_fetchFaceCropURLForSignificantEventModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "faceCropAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[HMDCameraClipManager fileManager](self, "fileManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "fileExistsAtURL:", v6),
        v7,
        v8))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Using existing cached face crop URL: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDCameraClipManager cloudZone](self, "cloudZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchCompleteModel:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D519E8];
    -[HMDCameraClipManager workQueue](self, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "schedulerWithDispatchQueue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reschedule:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke;
    v24[3] = &unk_1E89B80B0;
    v24[4] = self;
    objc_msgSend(v19, "flatMap:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke_130;
    v23[3] = &unk_1E89C2350;
    v23[4] = self;
    objc_msgSend(v21, "addFailureBlock:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_performCloudPull
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraClipManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraClipManager cloudZone](self, "cloudZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Explicit fetch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager cloudZone](self, "cloudZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performCloudPullWithOptions:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D519E8];
    -[HMDCameraClipManager workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "schedulerWithDispatchQueue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reschedule:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__HMDCameraClipManager__performCloudPull__block_invoke;
    v19[3] = &unk_1E89C2350;
    v19[4] = self;
    objc_msgSend(v11, "addFailureBlock:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform cloud pull because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_cleanUpClipsForInitialStartup:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[HMDCameraClipManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraClipManager cleanupQueue](self, "cleanupQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMDCameraClipManager__cleanUpClipsForInitialStartup___block_invoke;
  v7[3] = &unk_1E89C2758;
  v7[4] = self;
  v8 = a3;
  dispatch_async(v6, v7);

}

- (void)_cleanUpIncompleteClipsForInitialStartup:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  HMDCameraClipManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HMDCameraClipManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD aBlock[5];
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager cleanupQueue](self, "cleanupQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraClipManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDCameraClipModel incompleteClipsQuery](HMDCameraClipModel, "incompleteClipsQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryModelsUsingQuery:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMDCameraClipManager__cleanUpIncompleteClipsForInitialStartup___block_invoke;
  aBlock[3] = &unk_1E89B80D8;
  aBlock[4] = self;
  v12 = v9;
  v31 = v12;
  v34 = a3;
  v13 = v10;
  v32 = v13;
  v14 = v11;
  v33 = v14;
  v15 = _Block_copy(aBlock);
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
  v16 = 0x1E0D32000;
  if (objc_msgSend(v13, "count"))
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v20;
      v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Completing incomplete clips: %@", buf, 0x16u);

      v16 = 0x1E0D32000uLL;
    }

    objc_autoreleasePoolPop(v17);
    -[HMDCameraClipManager localZone](v18, "localZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v16 + 3288), "optionsWithLabel:", CFSTR("Complete Incomplete Clips"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v21, "updateModels:options:", v13, v22);

  }
  if (objc_msgSend(v14, "count"))
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Removing incomplete 0-duration clip UUIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(*(id *)(v16 + 3288), "optionsWithLabel:", CFSTR("Remove 0-duration Incomplete Clips"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMDCameraClipManager _removeClipsWithUUIDs:options:](v25, "_removeClipsWithUUIDs:options:", v14, v28);

  }
}

- (void)_cleanUpExpiredClips
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  HMDCameraClipManager *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager cleanupQueue](self, "cleanupQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*MEMORY[0x1E0CB8570]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = CFSTR("dateBefore");
  v27[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[HMDCameraClipManager fetchBatchLimit](self, "fetchBatchLimit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Remove expired clips"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldEnqueueMirrorOutput:", 0);
  +[HMDCameraClipModel clipsBeforeDateQuery](HMDCameraClipModel, "clipsBeforeDateQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager localZone](self, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryModelsUsingQuery:arguments:", v8, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__HMDCameraClipManager__cleanUpExpiredClips__block_invoke;
  v19[3] = &unk_1E89B8100;
  v19[4] = self;
  v11 = v6;
  v20 = v11;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
  if (objc_msgSend(v11, "count"))
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2048;
      v25 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired clips", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = -[HMDCameraClipManager _removeClipsWithUUIDs:options:](v14, "_removeClipsWithUUIDs:options:", v11, v12);
  }

}

- (void)_notifyTransportsOfUpdatedClips:(id)a3 removedClipUUIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDCameraClipManager *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[2];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraClipManager clientConnectionsTimer](self, "clientConnectionsTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientConnections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipManager clientConnectionsTimer](v13, "clientConnectionsTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientConnections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v16;
      v47 = 2048;
      v48 = objc_msgSend(v18, "count");
      v49 = 2048;
      v50 = objc_msgSend(v6, "count");
      v51 = 2048;
      v52 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribed transports of %lu updated clips, %lu removed clips", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    v43[0] = *MEMORY[0x1E0CB8528];
    v36 = v6;
    encodeRootObjectForIncomingXPCMessage(v6, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = *MEMORY[0x1E0CB8500];
    v44[0] = v19;
    v35 = v7;
    v44[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[HMDCameraClipManager clientConnectionsTimer](v13, "clientConnectionsTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clientConnections");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v22;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      v26 = *MEMORY[0x1E0CB8420];
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v27);
          objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", v26, v20);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setTransport:", v28);
          v30 = objc_alloc(MEMORY[0x1E0D285D8]);
          -[HMDCameraClipManager messageTargetUUID](v13, "messageTargetUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v30, "initWithTarget:", v31);
          objc_msgSend(v29, "setDestination:", v32);

          objc_msgSend(v29, "setRequiresCameraClipsEntitlement");
          -[HMDCameraClipManager messageDispatcher](v13, "messageDispatcher");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sendMessage:completionHandler:", v29, 0);

          ++v27;
        }
        while (v24 != v27);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v24);
    }

    v7 = v35;
    v6 = v36;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v34;
      v47 = 2048;
      v48 = objc_msgSend(v6, "count");
      v49 = 2048;
      v50 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify of %lu updated clips, %lu removed clips", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_notifyTransportsOfUpdatedSignificantEvents:(id)a3 removedSignificantEventUUIDs:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HMDCameraClipManager *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[2];
  _QWORD v44[2];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraClipManager clientConnectionsTimer](self, "clientConnectionsTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientConnections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipManager clientConnectionsTimer](v13, "clientConnectionsTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientConnections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v16;
      v47 = 2048;
      v48 = objc_msgSend(v18, "count");
      v49 = 2048;
      v50 = objc_msgSend(v6, "count");
      v51 = 2048;
      v52 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribed transports of %lu updated significant events, %lu removed significant events", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    v43[0] = *MEMORY[0x1E0CB8530];
    v36 = v6;
    encodeRootObjectForIncomingXPCMessage(v6, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = *MEMORY[0x1E0CB8508];
    v44[0] = v19;
    v35 = v7;
    v44[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[HMDCameraClipManager clientConnectionsTimer](v13, "clientConnectionsTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clientConnections");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v22;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      v26 = *MEMORY[0x1E0CB8428];
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v27);
          objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", v26, v20);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setTransport:", v28);
          v30 = objc_alloc(MEMORY[0x1E0D285D8]);
          -[HMDCameraClipManager messageTargetUUID](v13, "messageTargetUUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v30, "initWithTarget:", v31);
          objc_msgSend(v29, "setDestination:", v32);

          objc_msgSend(v29, "setRequiresCameraClipsEntitlement");
          -[HMDCameraClipManager messageDispatcher](v13, "messageDispatcher");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sendMessage:completionHandler:", v29, 0);

          ++v27;
        }
        while (v24 != v27);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v24);
    }

    v7 = v35;
    v6 = v36;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v46 = v34;
      v47 = 2048;
      v48 = objc_msgSend(v6, "count");
      v49 = 2048;
      v50 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify of %lu updated significant events, %lu removed significant events", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_fetchAssetContextForMessage:(id)a3 propertyName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  HMDCameraClipManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDCameraClipManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraClipManager localZone](self, "localZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "uuidForKey:", *MEMORY[0x1E0CB84B0]);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[HMDCameraClipManager cloudZone](self, "cloudZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchCompleteModelWithID:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __66__HMDCameraClipManager__fetchAssetContextForMessage_propertyName___block_invoke;
      v26[3] = &unk_1E89B8128;
      v26[4] = self;
      v14 = v11;
      v27 = v14;
      v28 = v6;
      v29 = v7;
      v15 = (id)objc_msgSend(v13, "addCompletionBlock:", v26);

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "messagePayload");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2112;
        v33 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failing request to fetch asset context because message has no clip UUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v25);

      v14 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v19;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch asset context for message because zones are not ready: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v14);
  }

}

- (void)_handleChangedClipModel:(id)a3 wasCreated:(BOOL)a4 mirrorOutputFuture:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  HMDCameraClipManager *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMDCameraClipManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v6 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v33 = v8;
  objc_msgSend(v8, "hmbModelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager _significantEventModelsForClipWithUUID:](self, "_significantEventModelsForClipWithUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v32 = v12;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v21 = v9;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v41 = v22;
            v42 = 2112;
            v43 = v17;
            v44 = 2112;
            v45 = v33;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Found existing significant event model %@ associated with new clip model %@", buf, 0x20u);

            v9 = v21;
          }

          objc_autoreleasePoolPop(v18);
          -[HMDCameraClipManager _notifyForChangedSignificantEventModel:mirrorOutputFuture:](v19, "_notifyForChangedSignificantEventModel:mirrorOutputFuture:", v17, v9);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v14);
    }

    v12 = v32;
  }
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __78__HMDCameraClipManager__handleChangedClipModel_wasCreated_mirrorOutputFuture___block_invoke;
  v35[3] = &unk_1E89B7F88;
  v35[4] = self;
  objc_msgSend(v12, "na_map:", v35);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "createClipWithSignificantEvents:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager _notifyTransportsOfUpdatedClips:removedClipUUIDs:](self, "_notifyTransportsOfUpdatedClips:removedClipUUIDs:", v25, v26);

  }
  else
  {
    v27 = v9;
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v31;
      v42 = 2112;
      v43 = v33;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to create clip from clip model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v9 = v27;
  }

}

- (void)_handleChangedSignificantEventNotificationModel:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraClipManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "associatedClip");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager localZone](self, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "referencedModelFromLocalZone:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDCameraClipManager _handleChangedClipModel:wasCreated:mirrorOutputFuture:](self, "_handleChangedClipModel:wasCreated:mirrorOutputFuture:", v11, 0, 0);
    -[HMDCameraClipManager _notifyForChangedSignificantEventModel:mirrorOutputFuture:](self, "_notifyForChangedSignificantEventModel:mirrorOutputFuture:", v6, v7);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring changed significant event notification model because its associated clip model does not exist: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_handleChangedFaceClassificationModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraClipManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraClipManager localZone](self, "localZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmbParentModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchModelWithModelID:ofType:error:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCameraClipManager _significantEventFromSignificantEventModel:](self, "_significantEventFromSignificantEventModel:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager _notifyTransportsOfUpdatedSignificantEvents:removedSignificantEventUUIDs:](self, "_notifyTransportsOfUpdatedSignificantEvents:removedSignificantEventUUIDs:", v10, v11);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring changed face classification model because its associated significant event does not exist: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_notifyForChangedSignificantEventModel:(id)a3 mirrorOutputFuture:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Waiting for mirror output future to complete: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (void *)MEMORY[0x1E0D519E8];
    -[HMDCameraClipManager workQueue](v10, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "schedulerWithDispatchQueue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reschedule:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "flatMap:", &__block_literal_global_148_139149);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82__HMDCameraClipManager__notifyForChangedSignificantEventModel_mirrorOutputFuture___block_invoke_2;
  v20[3] = &unk_1E89B8190;
  v20[4] = self;
  v21 = v6;
  v18 = v6;
  v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v20);

}

- (id)_handleFaceMisclassificationForFaceCropURL:(id)a3 personUUID:(id)a4 personManagerUUID:(id)a5 significantEventModel:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDCameraClipManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDCameraClipManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[HMDCameraClipManager fileManager](self, "fileManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v15, "dataWithContentsOfURL:options:error:", v10, 0, &v41);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v41;

  if (v16)
  {
    v36 = v17;
    v18 = (void *)MEMORY[0x1D17BA0A0](-[HMDCameraClipManager _notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData:personUUID:personManagerUUID:](self, "_notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData:personUUID:personManagerUUID:", v16, v11, v12));
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v21;
      v44 = 2112;
      v45 = v13;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing all face classifications for significant event model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Remove all face classifications from significant event"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager localZone](v19, "localZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hmbModelID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeModelsWithParentModelID:options:", v24, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke;
    v39[3] = &unk_1E89B81B8;
    v39[4] = v19;
    v40 = v16;
    objc_msgSend(v25, "flatMap:", v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v26;
    v37[1] = 3221225472;
    v37[2] = __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke_156;
    v37[3] = &unk_1E89B81E0;
    v37[4] = v19;
    v38 = v13;
    objc_msgSend(v27, "flatMap:", v37);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "flatMap:", &__block_literal_global_162_139139);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v36;
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v33;
      v44 = 2112;
      v45 = v10;
      v46 = 2112;
      v47 = v17;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not load face crop data at URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    v34 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "futureWithError:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v29;
}

- (void)_notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData:(id)a3 personUUID:(id)a4 personManagerUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDRemoteDeviceMessageDestination *v14;
  void *v15;
  void *v16;
  HMDRemoteDeviceMessageDestination *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDRemoteMessage *v21;
  int v22;
  void *v23;
  HMDCameraClipManager *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  HMDCameraClipManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  HMDRemoteMessage *v39;
  _QWORD v40[3];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDCameraClipManager home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryResident");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDCameraClipManager messageTargetUUID](self, "messageTargetUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v14, "initWithTarget:device:", v15, v16);

    v34 = v8;
    v41[0] = v8;
    v40[0] = CFSTR("HMDCCM.mk.fmfcd");
    v40[1] = CFSTR("HMDCCM.mk.fmpu");
    objc_msgSend(v9, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v18;
    v40[2] = CFSTR("HMDCCM.mk.fmpmu");
    objc_msgSend(v10, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDCCM.m.rhfm"), v17, v20, 0, 1, 0.0);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __117__HMDCameraClipManager__notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData_personUUID_personManagerUUID___block_invoke;
    v35[3] = &unk_1E89C0E20;
    v35[4] = self;
    -[HMDRemoteMessage setResponseHandler:](v21, "setResponseHandler:", v35);
    v22 = objc_msgSend(v13, "isCurrentDevice");
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v22)
    {
      if (v26)
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2112;
        v39 = v21;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Directly handling face misclassification message because we are the primary resident: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      -[HMDCameraClipManager handleRemoteHandleFaceMisclassificationMessage:](v24, "handleRemoteHandleFaceMisclassificationMessage:", v21);
    }
    else
    {
      if (v26)
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v32;
        v38 = 2112;
        v39 = v21;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Sending remote handle face misclassification message to primary resident: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      -[HMDCameraClipManager messageDispatcher](v24, "messageDispatcher");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "sendMessage:", v21);

    }
    v8 = v34;
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v31;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not find primary resident to send face misclassification message to", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
  }

}

- (id)_removeClipsWithUUIDs:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HMDCameraClipManager localZone](self, "localZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeModelsAndDescendantModelsWithIDs:depth:options:", v7, 3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "flatMap:", &__block_literal_global_166_139128);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_removeAllFaceClassificationModels
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Remove all face classification models"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager localZone](self, "localZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "removeAllModelsOfTypes:options:", v6, v4);

}

- (void)handleSubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraClipManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraClipManager *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v27 = 138543362;
    v28 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDCameraClipManager clientConnectionsTimer](v7, "clientConnectionsTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addClientConnection:", v12);

    -[HMDCameraClipManager cloudZone](v7, "cloudZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v7;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v18;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to subscribe to changes when no cloud zone exists; Restarting zone manager",
          (uint8_t *)&v27,
          0xCu);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDCameraClipManager zoneManager](v16, "zoneManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "start");

    }
    objc_msgSend(v4, "respondWithPayload:", 0);
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v25;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v27, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v26);

  }
}

- (void)handleUnsubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  HMDCameraClipManager *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v21 = 138543362;
    v22 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDCameraClipManager clientConnectionsTimer](v7, "clientConnectionsTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeClientConnection:", v12);

    objc_msgSend(v4, "respondWithPayload:", 0);
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v7;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
}

- (void)handlePerformCloudPullMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v21 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager _performCloudPull](v7, "_performCloudPull");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke;
  v18[3] = &unk_1E89C21E8;
  v12 = v4;
  v19 = v12;
  objc_msgSend(v10, "addSuccessBlock:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke_2;
  v16[3] = &unk_1E89C2350;
  v17 = v12;
  v14 = v12;
  v15 = (id)objc_msgSend(v13, "addFailureBlock:", v16);

}

- (void)handleFetchClipMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
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
  HMDCameraClipManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDCameraClipManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDCameraClipManager *v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v9;
    v39 = 2114;
    v40 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch clip message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB84B0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDCameraClipManager localZone](v7, "localZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend(v13, "fetchModelWithModelID:ofType:error:", v12, objc_opt_class(), &v34);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v34;

      if (v14)
      {
        objc_msgSend(v14, "hmbModelID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraClipManager significantEventsForClipWithUUID:](v7, "significantEventsForClipWithUUID:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "createClipWithSignificantEvents:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *MEMORY[0x1E0CB84A0];
        encodeRootObjectForIncomingXPCMessage(v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithPayload:", v20);

      }
      else
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = v7;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v33;
          v39 = 2112;
          v40 = v12;
          v41 = 2112;
          v42 = v15;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip with UUID %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v17);
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v7;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v28;
        v39 = 2112;
        v40 = v29;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip UUID in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v15);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch clip because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchClipsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  HMDCameraClipManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDCameraClipManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMDCameraClipManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDCameraClipManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v9;
    v56 = 2114;
    v57 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch clips message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDCameraClipManager fetchServerFactory](v7, "fetchServerFactory");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "dateForKey:", *MEMORY[0x1E0CB84D0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dateForKey:", *MEMORY[0x1E0CB84D8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB84F0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB8510]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB84F8]);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v14 && v15 && v16 && v17 && v18)
      {
        v44 = v15;
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v15);
        v45 = v17;
        v21 = objc_msgSend(v17, "BOOLValue");
        v22 = objc_msgSend(v19, "integerValue");
        v47 = v16;
        objc_msgSend(v13, "setTotalFetchedObjectsLimit:", objc_msgSend(v16, "unsignedIntegerValue"));
        v53 = 0;
        v23 = MEMORY[0x1E0C809B0];
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke;
        v51[3] = &unk_1E89B8268;
        v24 = v13;
        v52 = v24;
        LOBYTE(v21) = -[HMDCameraClipManager _fetchClipsWithDateInterval:quality:isAscending:error:handler:](v7, "_fetchClipsWithDateInterval:quality:isAscending:error:handler:", v20, v22, v21, &v53, v51);
        v25 = v53;
        if ((v21 & 1) != 0)
        {
          v49[0] = v23;
          v49[1] = 3221225472;
          v49[2] = __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke_171;
          v49[3] = &unk_1E89C2730;
          v50 = v4;
          objc_msgSend(v24, "sendCurrentlyBatchedFetchedObjectsWithCompletion:", v49);

        }
        else
        {
          v40 = (void *)MEMORY[0x1D17BA0A0]();
          v41 = v7;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v43;
            v56 = 2112;
            v57 = v25;
            _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch clip models from local zone: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v40);
          objc_msgSend(v4, "respondWithError:", v25);
        }
        v15 = v44;

        v17 = v45;
        v16 = v47;
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
          v48 = v16;
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v46 = v19;
          v38 = v17;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v37;
          v56 = 2112;
          v57 = v39;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);

          v17 = v38;
          v19 = v46;

          v16 = v48;
        }

        objc_autoreleasePoolPop(v34);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v20);
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = v7;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v33;
        v56 = 2112;
        v57 = v4;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v14);
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x1D17BA0A0]();
    v27 = v7;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v29;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch clips because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)handleFetchClipForSignificantEventMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraClipManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDCameraClipManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDCameraClipManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDCameraClipManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDCameraClipManager *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  HMDCameraClipManager *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDCameraClipManager *v58;
  void *v59;
  void *context;
  void *contexta;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE buf[38];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch clip for significant event message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB8518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = v7;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v34;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event UUID in decoded UUIDs %@ in message payload: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
      goto LABEL_40;
    }
    -[HMDCameraClipManager localZone](v7, "localZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(v14, "fetchModelWithModelID:ofType:error:", v13, objc_opt_class(), &v64);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v64;

    if (!v15)
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = v7;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v13, "getUUIDBytes:", buf);
        v69 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        *(_WORD *)&buf[18] = 2098;
        *(_QWORD *)&buf[20] = &v69;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v16;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);
      goto LABEL_39;
    }
    -[HMDCameraClipManager localZone](v7, "localZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmbParentModelID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v16;
    objc_msgSend(v17, "fetchModelWithModelID:ofType:error:", v18, objc_opt_class(), &v63);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v63;

    if (v19)
    {
      v16 = v20;
LABEL_8:
      objc_msgSend(v19, "hmbModelID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipManager significantEventsForClipWithUUID:](v7, "significantEventsForClipWithUUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "createClipWithSignificantEvents:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = *MEMORY[0x1E0CB84A0];
      encodeRootObjectForIncomingXPCMessage(v23, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v25);

LABEL_38:
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    v39 = (void *)MEMORY[0x1D17BA0A0]();
    v40 = v7;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      context = v39;
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v15, "hmbParentModelID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        objc_msgSend(v15, "hmbParentModelID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v68 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(_QWORD *)&buf[20] = &v68;
      _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Could not find clip model with UUID %{public,uuid_t}.16P. Falling back to using the associated clip", buf, 0x1Cu);

      v39 = context;
    }

    objc_autoreleasePoolPop(v39);
    objc_msgSend(v15, "associatedClip");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    contexta = (void *)MEMORY[0x1D17BA0A0]();
    v45 = v40;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v19)
    {
      v59 = v20;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Fetching clip model using associated clip reference: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(contexta);
      -[HMDCameraClipManager localZone](v45, "localZone");
      v58 = v45;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hmbModelID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v59;
      objc_msgSend(v49, "fetchModelWithModelID:ofType:error:", v50, objc_opt_class(), &v62);
      v51 = objc_claimAutoreleasedReturnValue();
      v16 = v62;

      if (v51)
      {

        v19 = (void *)v51;
        goto LABEL_8;
      }
      v53 = (void *)MEMORY[0x1D17BA0A0]();
      v45 = v58;
      v54 = v58;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
LABEL_37:

        objc_autoreleasePoolPop(v53);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v22);
        goto LABEL_38;
      }
      contexta = v53;
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v19, "hmbModelID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        objc_msgSend(v19, "hmbModelID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v67 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v55;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(_QWORD *)&buf[20] = &v67;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v16;
      _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

    }
    else
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@No associatedClip found for significant event model: %@", buf, 0x16u);

      }
      v16 = v20;
    }
    v53 = contexta;
    goto LABEL_37;
  }
  v26 = (void *)MEMORY[0x1D17BA0A0]();
  v27 = v7;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v29;
    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch clip for significant event because zones are not ready", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v12);
LABEL_41:

}

- (void)handleFetchCountOfClipsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDCameraClipManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  HMDCameraClipManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDCameraClipManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDCameraClipManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[3];
  _QWORD v46[3];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v9;
    v49 = 2114;
    v50 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch count of clips message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "dateForKey:", *MEMORY[0x1E0CB84D0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateForKey:", *MEMORY[0x1E0CB84D8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB84F8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v12 && v13 && v14)
    {
      v16 = objc_msgSend(v14, "integerValue");
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = v7;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v48 = v20;
        v49 = 2112;
        v50 = v12;
        v51 = 2112;
        v52 = v13;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetching count of clips between %@ and %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v45[0] = CFSTR("dateAfter");
      v45[1] = CFSTR("dateBefore");
      v46[0] = v12;
      v46[1] = v13;
      v45[2] = CFSTR("quality");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[2] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDCameraClipManager localZone](v18, "localZone");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCameraClipModel countOfClipsWithQualityBetweenDatesQuery](HMDCameraClipModel, "countOfClipsWithQualityBetweenDatesQuery");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(v23, "countModelsUsingQuery:arguments:error:", v24, v22, &v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v42;

      if (v25)
      {
        v43 = *MEMORY[0x1E0CB84C0];
        v44 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithPayload:", v27);

      }
      else
      {
        v37 = (void *)MEMORY[0x1D17BA0A0]();
        v38 = v18;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = v37;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v40;
          v49 = 2112;
          v50 = v26;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch count of clip models from local zone: %@", buf, 0x16u);

          v37 = v41;
        }

        objc_autoreleasePoolPop(v37);
        objc_msgSend(v4, "respondWithError:", v26);
      }

    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v7;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v35;
        v49 = 2112;
        v50 = v36;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v22);
    }

  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = v7;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v31;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch count of clips because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchVideoSegmentsAssetContextMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  HMDCameraClipManagerRequestLogEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraClipManagerRequestLogEvent *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v15 = 138543362;
    v16 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch video segments asset context message", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager _fetchAssetContextForMessage:propertyName:](v7, "_fetchAssetContextForMessage:propertyName:", v4, CFSTR("videoStreamingAsset"));
  v10 = [HMDCameraClipManagerRequestLogEvent alloc];
  -[HMDCameraClipManager zoneManager](v7, "zoneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDCameraClipManagerRequestLogEvent initWithRequestName:homeUUID:](v10, "initWithRequestName:homeUUID:", CFSTR("HMDCameraClipManagerRequestLogEventFetchVideoSegmentsAssetRequestName"), v13);
  -[HMDCameraClipManager submitLogEvent:error:](v7, "submitLogEvent:error:", v14, 0);

}

- (void)handleFetchHeroFrameDataRepresentationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  HMDCameraClipManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraClipManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDCameraClipManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v9;
    v44 = 2114;
    v45 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch hero frame data representation with message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB84B0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDCameraClipManager localZone](v7, "localZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      objc_msgSend(v13, "fetchModelWithModelID:ofType:error:", v12, objc_opt_class(), &v41);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v41;

      if (v14)
      {
        -[HMDCameraClipManager _fetchCanonicalHeroFrameURLForClipModel:](v7, "_fetchCanonicalHeroFrameURLForClipModel:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = MEMORY[0x1E0C809B0];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke;
        v40[3] = &unk_1E89B8290;
        v40[4] = v7;
        objc_msgSend(v16, "flatMap:", v40);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v17;
        v38[1] = 3221225472;
        v38[2] = __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_176;
        v38[3] = &unk_1E89B82B8;
        v19 = v4;
        v39 = v19;
        objc_msgSend(v18, "addSuccessBlock:", v38);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v17;
        v36[1] = 3221225472;
        v36[2] = __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_2;
        v36[3] = &unk_1E89C2350;
        v37 = v19;
        v21 = (id)objc_msgSend(v20, "addFailureBlock:", v36);

      }
      else
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = v7;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v34;
          v44 = 2112;
          v45 = v12;
          v46 = 2112;
          v47 = v15;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip with UUID %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v31);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v35);

      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = v7;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v29;
        v44 = 2112;
        v45 = v30;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot find clip UUID in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v15);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch hero frame data representation because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchHeroFrameURLMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  HMDCameraClipManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraClipManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDCameraClipManager *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  _BYTE buf[28];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch hero frame URL message with payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB84B0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[HMDCameraClipManager localZone](v7, "localZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v13, "fetchModelWithModelID:ofType:error:", v12, objc_opt_class(), &v38);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v38;

      if (v14)
      {
        -[HMDCameraClipManager _fetchCanonicalHeroFrameURLForClipModel:](v7, "_fetchCanonicalHeroFrameURLForClipModel:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke;
        v36[3] = &unk_1E89B82E0;
        v18 = v4;
        v37 = v18;
        objc_msgSend(v16, "addSuccessBlock:", v36);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v17;
        v34[1] = 3221225472;
        v34[2] = __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke_2;
        v34[3] = &unk_1E89C2350;
        v35 = v18;
        v20 = (id)objc_msgSend(v19, "addFailureBlock:", v34);

        v21 = v37;
      }
      else
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = v7;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v12, "getUUIDBytes:", buf);
          v39 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v33;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2098;
          *(_QWORD *)&buf[20] = &v39;
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed requesting to fetch hero frame url because no clip could be found for UUID %{public,uuid_t}.16P", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v30);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v21);
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = v7;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch hero frame url because clip uuid cannot be found in message payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v15);
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch hero frame url because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchFaceCropDataRepresentationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  HMDCameraClipManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDCameraClipManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDCameraClipManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  __int128 v43;
  _BYTE buf[38];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch face crop data representation with message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB8518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[HMDCameraClipManager localZone](v7, "localZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(v14, "fetchModelWithModelID:ofType:error:", v13, objc_opt_class(), &v42);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v42;

      if (v15)
      {
        -[HMDCameraClipManager _fetchFaceCropURLForSignificantEventModel:](v7, "_fetchFaceCropURLForSignificantEventModel:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C809B0];
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke;
        v41[3] = &unk_1E89B8290;
        v41[4] = v7;
        objc_msgSend(v17, "flatMap:", v41);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v18;
        v39[1] = 3221225472;
        v39[2] = __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_179;
        v39[3] = &unk_1E89B82B8;
        v20 = v4;
        v40 = v20;
        objc_msgSend(v19, "addSuccessBlock:", v39);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v18;
        v37[1] = 3221225472;
        v37[2] = __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_2;
        v37[3] = &unk_1E89C2350;
        v38 = v20;
        v22 = (id)objc_msgSend(v21, "addFailureBlock:", v37);

      }
      else
      {
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        v33 = v7;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v13, "getUUIDBytes:", buf);
          v43 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2098;
          *(_QWORD *)&buf[20] = &v43;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v16;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v36);

      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v7;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v31;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event UUID in decoded UUIDs %@ in message payload: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = v7;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch face crop data representation because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchFaceCropURLMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  HMDCameraClipManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDCameraClipManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDCameraClipManager *v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  __int128 v41;
  _BYTE buf[38];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch face crop for message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB8518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[HMDCameraClipManager localZone](v7, "localZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v14, "fetchModelWithModelID:ofType:error:", v13, objc_opt_class(), &v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v40;

      if (v15)
      {
        -[HMDCameraClipManager _fetchFaceCropURLForSignificantEventModel:](v7, "_fetchFaceCropURLForSignificantEventModel:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C809B0];
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke;
        v38[3] = &unk_1E89B82E0;
        v19 = v4;
        v39 = v19;
        objc_msgSend(v17, "addSuccessBlock:", v38);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = v18;
        v36[1] = 3221225472;
        v36[2] = __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke_2;
        v36[3] = &unk_1E89C2350;
        v37 = v19;
        v21 = (id)objc_msgSend(v20, "addFailureBlock:", v36);

        v22 = v39;
      }
      else
      {
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        v33 = v7;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v13, "getUUIDBytes:", buf);
          v41 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2098;
          *(_QWORD *)&buf[20] = &v41;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v16;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v22);
      }

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v7;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v31;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event UUID in decoded UUIDs %@ in message payload: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = v7;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch face crop url because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchSignificantEventsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraClipManager *v19;
  NSObject *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  HMDCameraClipManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HMDCameraClipManager *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDCameraClipManager *v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v9;
    v58 = 2114;
    v59 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch significant event message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "setForKey:", *MEMORY[0x1E0CB8518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipManager _significantEventsWithUUIDs:](v7, "_significantEventsWithUUIDs:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = *MEMORY[0x1E0CB8520];
      encodeRootObjectForIncomingXPCMessage(v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v17);

    }
    else
    {
      -[HMDCameraClipManager fetchServerFactory](v7, "fetchServerFactory");
      v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v22)[2](v22, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v4, "dateForKey:", *MEMORY[0x1E0CB84D0]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "dateForKey:", *MEMORY[0x1E0CB84D8]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB84F0]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB8510]);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        v48 = v24;
        if (v16 && v23 && v24 && v25)
        {
          v46 = v23;
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v23);
          v28 = objc_msgSend(v26, "BOOLValue");
          objc_msgSend(v15, "setTotalFetchedObjectsLimit:", objc_msgSend(v24, "unsignedIntegerValue"));
          v53 = 0;
          v29 = MEMORY[0x1E0C809B0];
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke;
          v51[3] = &unk_1E89B7FB0;
          v30 = v15;
          v52 = v30;
          LOBYTE(v28) = -[HMDCameraClipManager _fetchSignificantEventsWithDateInterval:isAscending:error:handler:](v7, "_fetchSignificantEventsWithDateInterval:isAscending:error:handler:", v27, v28, &v53, v51);
          v45 = v53;
          if ((v28 & 1) != 0)
          {
            v49[0] = v29;
            v49[1] = 3221225472;
            v49[2] = __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke_180;
            v49[3] = &unk_1E89C2730;
            v50 = v4;
            objc_msgSend(v30, "sendCurrentlyBatchedFetchedObjectsWithCompletion:", v49);

            v31 = v45;
            v23 = v46;
          }
          else
          {
            v41 = (void *)MEMORY[0x1D17BA0A0]();
            v42 = v7;
            HMFGetOSLogHandle();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v57 = v44;
              v58 = 2112;
              v59 = v45;
              _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant event models from local zone: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v41);
            v31 = v45;
            objc_msgSend(v4, "respondWithError:", v45);
            v23 = v46;
          }

        }
        else
        {
          v36 = (void *)MEMORY[0x1D17BA0A0]();
          v37 = v7;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "messagePayload");
            v47 = v23;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v57 = v39;
            v58 = 2112;
            v59 = v40;
            _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);

            v23 = v47;
          }

          objc_autoreleasePoolPop(v36);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v27);
        }

      }
      else
      {
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        v33 = v7;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v35;
          v58 = 2112;
          v59 = v4;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch server from message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v16);
        v15 = 0;
      }
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch significant events because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)handleDeleteClipMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HMDCameraClipManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDCameraClipManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v9;
    v33 = 2114;
    v34 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling delete clip message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "uuidForKey:", *MEMORY[0x1E0CB84B0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D32CD8];
      objc_msgSend(v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "optionsWithLabel:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipManager _removeClipsWithUUIDs:options:](v7, "_removeClipsWithUUIDs:options:", v13, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __48__HMDCameraClipManager_handleDeleteClipMessage___block_invoke;
      v29[3] = &unk_1E89BF608;
      v30 = v4;
      v18 = (id)objc_msgSend(v17, "addCompletionBlock:", v29);

      v19 = v30;
    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v7;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v27;
        v33 = 2112;
        v34 = v28;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not find clip UUID in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Cannot delete clip because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleDeleteAllClipsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMDCameraClipManager *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v27 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling delete all clips message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDCameraClipManager localZone](v7, "localZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D32CD8];
    objc_msgSend(v4, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "optionsWithLabel:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllModelsOfTypes:options:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__HMDCameraClipManager_handleDeleteAllClipsMessage___block_invoke;
    v23[3] = &unk_1E89B8308;
    v24 = v4;
    v17 = (id)objc_msgSend(v16, "addCompletionBlock:", v23);

    v18 = v24;
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v7;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot delete clips because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);
  }

}

- (void)handleHandleFaceMisclassificationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  HMDCameraClipManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDCameraClipManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDCameraClipManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  HMDCameraClipManager *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  HMDCameraClipManager *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  uint8_t buf[40];
  _QWORD v68[5];

  v68[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling handle face misclassification message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *MEMORY[0x1E0CB8520];
    v68[0] = objc_opt_class();
    v68[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "faceClassification");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "person");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[HMDCameraClipManager localZone](v7, "localZone");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 0;
          objc_msgSend(v20, "fetchModelWithModelID:ofType:error:", v21, objc_opt_class(), &v65);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v65;

          if (v22)
          {
            -[HMDCameraClipManager _fetchFaceCropURLForSignificantEventModel:](v7, "_fetchFaceCropURLForSignificantEventModel:", v22);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v61[0] = MEMORY[0x1E0C809B0];
            v24 = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke;
            v61[3] = &unk_1E89B8330;
            v61[4] = v7;
            v62 = v19;
            v63 = v18;
            v64 = v22;
            objc_msgSend(v55, "flatMap:", v61);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = v24;
            v59[1] = 3221225472;
            v59[2] = __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_2;
            v59[3] = &unk_1E89C21E8;
            v26 = v4;
            v60 = v26;
            objc_msgSend(v25, "addSuccessBlock:", v59);
            v27 = v22;
            v28 = v23;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_3;
            v57[3] = &unk_1E89C2350;
            v58 = v26;
            v30 = (id)objc_msgSend(v29, "addFailureBlock:", v57);

            v23 = v28;
            v22 = v27;

          }
          else
          {
            v48 = (void *)MEMORY[0x1D17BA0A0]();
            v49 = v7;
            HMFGetOSLogHandle();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v56 = v48;
              HMFGetLogIdentifier();
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = 0;
              objc_msgSend(v16, "uniqueIdentifier");
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              if (v51)
              {
                objc_msgSend(v16, "uniqueIdentifier");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "getUUIDBytes:", buf);

              }
              else
              {
                *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
              }
              v66 = *(_OWORD *)buf;
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v54;
              *(_WORD *)&buf[12] = 1042;
              *(_DWORD *)&buf[14] = 16;
              *(_WORD *)&buf[18] = 2098;
              *(_QWORD *)&buf[20] = &v66;
              *(_WORD *)&buf[28] = 2112;
              *(_QWORD *)&buf[30] = v23;
              _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event model with UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

              v48 = v56;
            }

            objc_autoreleasePoolPop(v48);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "respondWithError:", v53);

          }
        }
        else
        {
          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v7;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v47;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v18;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle misclassification for face classification without a person: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v44);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v23);
        }

      }
      else
      {
        v40 = (void *)MEMORY[0x1D17BA0A0]();
        v41 = v7;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v43;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Could not find face classification on significant event: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v19);
      }

    }
    else
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = v7;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v39;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event in decoded significant events %@ in message payload: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v18);
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = v7;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle face misclassification because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
  }

}

- (void)handleRemoteHandleFaceMisclassificationMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraClipManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDCameraClipManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDCameraClipManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  __int128 v32;
  _BYTE buf[28];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remote handle face misclassification message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "dataForKey:", CFSTR("HMDCCM.mk.fmfcd"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuidForKey:", CFSTR("HMDCCM.mk.fmpu"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuidForKey:", CFSTR("HMDCCM.mk.fmpmu"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v12 && v14 && v13)
    {
      -[HMDCameraClipManager faceClassificationResolver](v7, "faceClassificationResolver");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "personManagerWithUUID:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "handleFaceMisclassificationForFaceCropData:personUUID:", v12, v13);
        objc_msgSend(v4, "respondWithSuccess");
      }
      else
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = v7;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v15, "getUUIDBytes:", buf);
          v32 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          *(_WORD *)&buf[18] = 2098;
          *(_QWORD *)&buf[20] = &v32;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not find person manager with UUID %{public,uuid_t}.16P to handle misclassified person", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v31);

        v17 = 0;
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = v7;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not find all face misclassification information in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v17);
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle face misclassification because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleImportClipsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  HMDCameraClipImporter *v19;
  void *v20;
  void *v21;
  HMDCameraClipImporter *v22;
  void *v23;
  id v24;
  void *v25;
  HMDCameraClipManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDCameraClipManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDCameraClipManager *v35;
  NSObject *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v9;
    v44 = 2114;
    v45 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling import clips message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "dataForKey:", *MEMORY[0x1E0CB84A8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3710];
      v14 = (void *)MEMORY[0x1E0C99E60];
      v41[0] = objc_opt_class();
      v41[1] = objc_opt_class();
      v41[2] = objc_opt_class();
      v41[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v16, v12, &v40);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v40;

      if (v17)
      {
        v19 = [HMDCameraClipImporter alloc];
        -[HMDCameraClipManager localZone](v7, "localZone");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraClipManager cameraProfileUUID](v7, "cameraProfileUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[HMDCameraClipImporter initWithLocalZone:cameraProfileUUID:](v19, "initWithLocalZone:cameraProfileUUID:", v20, v21);

        -[HMDCameraClipImporter importClipsWithImportData:](v22, "importClipsWithImportData:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __49__HMDCameraClipManager_handleImportClipsMessage___block_invoke;
        v38[3] = &unk_1E89BF608;
        v39 = v4;
        v24 = (id)objc_msgSend(v23, "addCompletionBlock:", v38);

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
          v43 = v37;
          v44 = 2112;
          v45 = v18;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera clips import dictionary from clip data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        objc_msgSend(v4, "respondWithError:", v18);
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = v7;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v32;
        v44 = 2112;
        v45 = v33;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find serialized import data in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v18);
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v7;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot import clips because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v12);
  }

}

- (void)handleFetchIsCloudStorageEnabledMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  HMDCameraClipManager *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMDCameraClipManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v9;
    v41 = 2114;
    v42 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling fetch is cloud storage enabled message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager cloudZone](v7, "cloudZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v7;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch is cloud storage enabled because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v29 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[HMDCameraClipManager zoneManager](v7, "zoneManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isZoneOwner");

  if ((v14 & 1) == 0)
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = v7;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v33;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@User is not the zone owner; cannot fetch is cloud storage enabled",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v34 = (void *)v29;
    objc_msgSend(v4, "respondWithError:", v29);

    goto LABEL_13;
  }
  -[HMDCameraClipManager quotaManager](v7, "quotaManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchNamesForZonesWithEnabledCloudStorage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D519E8];
  -[HMDCameraClipManager workQueue](v7, "workQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "schedulerWithDispatchQueue:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reschedule:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke;
  v37[3] = &unk_1E89B8358;
  v37[4] = v7;
  v22 = v4;
  v38 = v22;
  objc_msgSend(v20, "addSuccessBlock:", v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v21;
  v35[1] = 3221225472;
  v35[2] = __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke_186;
  v35[3] = &unk_1E89C21C0;
  v35[4] = v7;
  v36 = v22;
  v24 = (id)objc_msgSend(v23, "addFailureBlock:", v35);

LABEL_13:
}

- (void)handleUpdateCloudStorageMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDCameraClipManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update cloud storage message: %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager cloudZone](v7, "cloudZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0CB84E8]))
    {
      -[HMDCameraClipManager enableCloudStorage](v7, "enableCloudStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke;
      v23[3] = &unk_1E89BF608;
      v24 = v4;
      v13 = (id)objc_msgSend(v12, "addCompletionBlock:", v23);

      v14 = v24;
    }
    else
    {
      -[HMDCameraClipManager disableCloudStorage](v7, "disableCloudStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke_2;
      v21[3] = &unk_1E89BF608;
      v22 = v4;
      v20 = (id)objc_msgSend(v19, "addCompletionBlock:", v21);

      v14 = v22;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot update cloud storage because zones are not ready", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
  }

}

- (void)handleUserPrivilegeDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraClipManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMDCameraClipManager_handleUserPrivilegeDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraClipManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HMDCameraClipManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraClipManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HMDCameraClipManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraClipManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HMDCameraClipManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDCameraClipManager zoneManager](self, "zoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)cloudZone:(id)a3 didEncounterZoneDisabledError:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  -[HMDCameraClipManager workQueue](self, "workQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HMDCameraClipManager_cloudZone_didEncounterZoneDisabledError___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v5, block);

}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HMDCameraClipManager *v11;

  v5 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCameraClipManager_localZone_didProcessModelCreation___block_invoke;
  v9[3] = &unk_1E89C2328;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HMDCameraClipManager *v11;

  v5 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HMDCameraClipManager_localZone_didProcessModelUpdate___block_invoke;
  v9[3] = &unk_1E89C2328;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HMDCameraClipManager *v11;

  v5 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HMDCameraClipManager_localZone_didProcessModelDeletion___block_invoke;
  v9[3] = &unk_1E89C2328;
  v10 = v5;
  v11 = self;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "hasCameraClipsAccess");
  return (char)v6;
}

- (BOOL)manager:(id)a3 shouldGrantWriteAccessToUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "isAdministrator");
  return (char)v6;
}

- (BOOL)areShareModificationsEnabledForManager:(id)a3
{
  NSObject *v4;

  -[HMDCameraClipManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  return -[HMDCameraClipManager hasWriteAccess](self, "hasWriteAccess");
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = objc_msgSend(v5, "isOwner");
  return (char)v6;
}

- (void)zoneManagerDidStart:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  HMDCameraClipManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  HMDCameraClipFeedbackManager *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDCameraClipFeedbackManager *v38;
  void *v39;
  void *v40;
  void *v41;
  HMDCameraClipManager *v42;
  NSObject *v43;
  void *v44;
  id v45;
  _QWORD v46[5];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v48 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Camera clips zone manager started", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "localZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager setLocalZone:](v7, "setLocalZone:", v10);

  -[HMDCameraClipManager localZone](v7, "localZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserverForAllModels:", v7);

  -[HMDCameraClipManager localZone](v7, "localZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startUp");

  -[HMDCameraClipManager _cleanUpClipsForInitialStartup:](v7, "_cleanUpClipsForInitialStartup:", 1);
  objc_msgSend(v4, "cloudZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager setCloudZone:](v7, "setCloudZone:", v13);

  -[HMDCameraClipManager cloudZone](v7, "cloudZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasPerformedInitialFetch");

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager setSuppressNotificationsBeforeDate:](v7, "setSuppressNotificationsBeforeDate:", v16);

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraClipManager suppressNotificationsBeforeDate](v18, "suppressNotificationsBeforeDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v20;
      v49 = 2112;
      v50 = v21;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Suppressing all clip-related notifications before %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }
  -[HMDCameraClipManager cloudZone](v7, "cloudZone");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startUp");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D519E8];
  -[HMDCameraClipManager workQueue](v7, "workQueue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "schedulerWithDispatchQueue:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reschedule:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __44__HMDCameraClipManager_zoneManagerDidStart___block_invoke;
  v46[3] = &unk_1E89C21E8;
  v46[4] = v7;
  v28 = (id)objc_msgSend(v27, "addSuccessBlock:", v46);

  -[HMDCameraClipManager delegate](v7, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v29, "clipManagerDidStart:", v7);
  objc_msgSend(v4, "home");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = [HMDCameraClipFeedbackManager alloc];
    -[HMDCameraClipManager localZone](v7, "localZone");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager cloudZone](v7, "cloudZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager messageDispatcher](v7, "messageDispatcher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager cameraProfileUUID](v7, "cameraProfileUUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager messageTargetUUID](v7, "messageTargetUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraClipManager workQueue](v7, "workQueue");
    v45 = v4;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HMDCameraClipFeedbackManager initWithLocalZone:cloudZone:home:messageDispatcher:cameraProfileUUID:messageTargetUUID:workQueue:](v31, "initWithLocalZone:cloudZone:home:messageDispatcher:cameraProfileUUID:messageTargetUUID:workQueue:", v32, v33, v30, v34, v35, v36, v37);
    -[HMDCameraClipManager setFeedbackManager:](v7, "setFeedbackManager:", v38);

    -[HMDCameraClipManager feedbackManager](v7, "feedbackManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "configureWithIsCurrentDeviceResidentCapable:", objc_msgSend(v40, "isResidentCapable"));

    v4 = v45;
  }
  else
  {
    v41 = (void *)MEMORY[0x1D17BA0A0]();
    v42 = v7;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = v44;
      _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot create feedback manager because home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
  }

}

- (void)zoneManagerDidStop:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraClipManager workQueue](self, "workQueue");
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
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Camera clips zone manager stopped", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraClipManager setLocalZone:](v7, "setLocalZone:", 0);
  -[HMDCameraClipManager setCloudZone:](v7, "setCloudZone:", 0);
  -[HMDCameraClipManager delegate](v7, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "clipManagerDidStop:", v7);

}

- (void)zoneManager:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  HMDCameraClipsQuotaServerNotification *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDCameraClipManager *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  HMDCameraClipsQuotaServerNotification *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraClipManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = -[HMDCameraClipsQuotaServerNotification initWithDictionaryRepresentation:]([HMDCameraClipsQuotaServerNotification alloc], "initWithDictionaryRepresentation:", v7);
  -[HMDCameraClipsQuotaServerNotification containerIdentifier](v9, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraClipManager zoneManager](self, "zoneManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

  if (v13)
  {
    -[HMDCameraClipManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDCameraClipsQuotaServerNotification reason](v9, "reason");
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v15 == 1)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v20;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Received all storage disabled notification", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v14, "clipManagerDidDisableCloudStorage:", v17);
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v21;
        v24 = 2112;
        v25 = v9;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Received unknown notification: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
}

- (void)clientConnectionsTimerDidFire:(id)a3
{
  NSObject *v4;
  id v5;

  -[HMDCameraClipManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = -[HMDCameraClipManager _performCloudPull](self, "_performCloudPull");
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitLogEvent:error:", v6, v5);

}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraClipManagerDelegate)delegate
{
  return (HMDCameraClipManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCloudZone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)hasWriteAccess
{
  return self->_hasWriteAccess;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCameraClipsQuotaManager)quotaManager
{
  return (HMDCameraClipsQuotaManager *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver
{
  return (HMDCameraSignificantEventFaceClassificationResolver *)objc_getProperty(self, a2, 72, 1);
}

- (HMDActiveXPCClientConnectionsPeriodicTimer)clientConnectionsTimer
{
  return (HMDActiveXPCClientConnectionsPeriodicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (HMDFileManager)fileManager
{
  return (HMDFileManager *)objc_getProperty(self, a2, 104, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (HMDCameraClipFeedbackManager)feedbackManager
{
  return (HMDCameraClipFeedbackManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFeedbackManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDate)suppressNotificationsBeforeDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSuppressNotificationsBeforeDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (unint64_t)fetchBatchLimit
{
  return self->_fetchBatchLimit;
}

- (void)setFetchBatchLimit:(unint64_t)a3
{
  self->_fetchBatchLimit = a3;
}

- (OS_dispatch_queue)cleanupQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCleanupQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (id)fetchServerFactory
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setFetchServerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchServerFactory, 0);
  objc_storeStrong((id *)&self->_cleanupQueue, 0);
  objc_storeStrong((id *)&self->_suppressNotificationsBeforeDate, 0);
  objc_storeStrong((id *)&self->_feedbackManager, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_clientConnectionsTimer, 0);
  objc_storeStrong((id *)&self->_faceClassificationResolver, 0);
  objc_storeStrong((id *)&self->_quotaManager, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __44__HMDCameraClipManager_zoneManagerDidStart___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Camera clips cloud zone finished starting up", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "clipManagerDidStartUpCloudZone:", *(_QWORD *)(a1 + 32));

}

void __58__HMDCameraClipManager_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE buf[18];
  __int16 v43;
  __int128 *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v13, "hmbModelID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v13, "hmbModelID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
        }
        v40 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        v43 = 2098;
        v44 = &v40;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Significant event notification deleted with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v14);
      v35 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v13, "hmbModelID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setWithObject:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_notifyTransportsOfUpdatedSignificantEvents:removedSignificantEventUUIDs:", v22, v38);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v22 = v21;

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v22, "hmbModelID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v22, "hmbModelID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
          }
          v39 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          v43 = 2098;
          v44 = &v39;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Significant event face classification deleted with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(*(id *)(a1 + 40), "_handleChangedFaceClassificationModel:", v22);
      }
      v13 = 0;
    }
    goto LABEL_33;
  }
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v4, "hmbModelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "hmbModelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
    }
    v41 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1042;
    *(_DWORD *)&buf[14] = 16;
    v43 = 2098;
    v44 = &v41;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Clip deleted with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v5);
  v29 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "hmbModelID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithObject:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_notifyTransportsOfUpdatedClips:removedClipUUIDs:", v30, v33);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v34 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "hmbModelID");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clipManager:didDeleteClipWithUUID:", v34, v22);
LABEL_33:

  }
}

void __56__HMDCameraClipManager_localZone_didProcessModelUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE buf[18];
  __int16 v35;
  __int128 *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "hmbModelID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "hmbModelID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v33 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v35 = 2098;
      v36 = &v33;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Clip updated with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v5);
    v29 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "mirrorOutputFuture");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_handleChangedClipModel:wasCreated:mirrorOutputFuture:", v4, 0, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v13, "hmbModelID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v13, "hmbModelID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
        }
        v32 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        v35 = 2098;
        v36 = &v32;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Significant event notification updated with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v14);
      v30 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "mirrorOutputFuture");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_handleChangedSignificantEventNotificationModel:mirrorOutputFuture:", v13, v22);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v22 = v21;

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v22, "hmbModelID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v22, "hmbModelID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
          }
          v31 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          v35 = 2098;
          v36 = &v31;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Face classification updated with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(*(id *)(a1 + 40), "_handleChangedFaceClassificationModel:", v22);
      }
    }

  }
}

void __58__HMDCameraClipManager_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE buf[18];
  __int16 v35;
  __int128 *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v4, "hmbModelID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v4, "hmbModelID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getUUIDBytes:", buf);

      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      }
      v33 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      v35 = 2098;
      v36 = &v33;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@New clip received with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

    }
    objc_autoreleasePoolPop(v5);
    v29 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "mirrorOutputFuture");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_handleChangedClipModel:wasCreated:mirrorOutputFuture:", v4, 1, v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v13, "hmbModelID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v13, "hmbModelID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
        }
        v32 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 1042;
        *(_DWORD *)&buf[14] = 16;
        v35 = 2098;
        v36 = &v32;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@New significant event notification received with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

      }
      objc_autoreleasePoolPop(v14);
      v30 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "mirrorOutputFuture");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_handleChangedSignificantEventNotificationModel:mirrorOutputFuture:", v13, v22);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "model");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v22 = v21;

      if (v22)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v22, "hmbModelID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            objc_msgSend(v22, "hmbModelID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
          }
          v31 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 1042;
          *(_DWORD *)&buf[14] = 16;
          v35 = 2098;
          v36 = &v31;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@New face classification received with UUID: %{public,uuid_t}.16P", buf, 0x1Cu);

        }
        objc_autoreleasePoolPop(v23);
      }
    }

  }
}

void __64__HMDCameraClipManager_cloudZone_didEncounterZoneDisabledError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "clipManagerDidEncounterDisabledCloudStorage:", *(_QWORD *)(a1 + 32));

}

void __77__HMDCameraClipManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isZoneOwner");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personManagerSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isFaceClassificationEnabled");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Home person manager face classification is disabled; removing all face classification models",
          (uint8_t *)&v12,
          0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 32), "_removeAllFaceClassificationModels");
    }
  }
}

void __68__HMDCameraClipManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateShareParticipants");

}

void __74__HMDCameraClipManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateShareParticipants");

}

void __65__HMDCameraClipManager_handleUserPrivilegeDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateShareParticipants");

}

uint64_t __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __56__HMDCameraClipManager_handleUpdateCloudStorageMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

void __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMFEnabledStatusToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched is cloud storage enabled: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v12 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6, *MEMORY[0x1E0CB84E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "respondWithPayload:", v14);

}

void __64__HMDCameraClipManager_handleFetchIsCloudStorageEnabledMessage___block_invoke_186(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch is cloud storage enabled: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);

}

uint64_t __49__HMDCameraClipManager_handleImportClipsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

id __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "personManagerUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_handleFaceMisclassificationForFaceCropURL:personUUID:personManagerUUID:significantEventModel:", v5, v6, v7, *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __65__HMDCameraClipManager_handleHandleFaceMisclassificationMessage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __52__HMDCameraClipManager_handleDeleteAllClipsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __48__HMDCameraClipManager_handleDeleteClipMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

uint64_t __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleFetchedObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "canHandleMoreFetchedObjects");
  *a3 = result ^ 1;
  return result;
}

uint64_t __60__HMDCameraClipManager_handleFetchSignificantEventsMessage___block_invoke_180(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

void __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0CB84E0];
  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "respondWithPayload:", v4);

}

uint64_t __54__HMDCameraClipManager_handleFetchFaceCropURLMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

id __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v3, 0, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      v18 = 2112;
      v19 = v3;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data from URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_179(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x1E0CB84C8];
  v7[0] = a2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "respondWithPayload:", v5);

}

uint64_t __69__HMDCameraClipManager_handleFetchFaceCropDataRepresentationMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

void __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0CB84E0];
  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "respondWithPayload:", v4);

}

uint64_t __55__HMDCameraClipManager_handleFetchHeroFrameURLMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

id __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "dataWithContentsOfURL:options:error:", v3, 0, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      v18 = 2112;
      v19 = v3;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get data from URL %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_176(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x1E0CB84C8];
  v7[0] = a2;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a2;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "respondWithPayload:", v5);

}

uint64_t __70__HMDCameraClipManager_handleFetchHeroFrameDataRepresentationMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleFetchedObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "canHandleMoreFetchedObjects");
  *a3 = result ^ 1;
  return result;
}

uint64_t __48__HMDCameraClipManager_handleFetchClipsMessage___block_invoke_171(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __54__HMDCameraClipManager_handlePerformCloudPullMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

uint64_t __54__HMDCameraClipManager__removeClipsWithUUIDs_options___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

void __117__HMDCameraClipManager__notifyPrimaryResidentAboutFaceMisclassificationForFaceCropData_personUUID_personManagerUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
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
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      v12 = "%{public}@Failed to notify primary resident of face misclassification: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v16, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    v12 = "%{public}@Successfully notified primary resident of face misclassification";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

id __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Adding unassociated face crop to home person dataset for misclassified face classification", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addUnassociatedFaceCropWithData:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  HMDCameraSignificantEventFaceClassificationModel *v8;
  void *v9;
  void *v10;
  HMDCameraSignificantEventFaceClassificationModel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v7;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating face classification to use unassociated face crop: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = [HMDCameraSignificantEventFaceClassificationModel alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hmbModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMBModel initWithModelID:parentModelID:](v8, "initWithModelID:parentModelID:", v9, v10);

  objc_msgSend(*(id *)(a1 + 32), "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassificationModel setPersonManagerUUID:](v11, "setPersonManagerUUID:", v14);

  objc_msgSend(v3, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSignificantEventFaceClassificationModel setUnassociatedFaceCropUUID:](v11, "setUnassociatedFaceCropUUID:", v15);

  objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Create face classification with unassociated face crop"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createModels:options:", v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __118__HMDCameraClipManager__handleFaceMisclassificationForFaceCropURL_personUUID_personManagerUUID_significantEventModel___block_invoke_161()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

void __82__HMDCameraClipManager__notifyForChangedSignificantEventModel_mirrorOutputFuture___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  HMDHomePresenceRemote *v20;
  void *v21;
  HMDHomePresenceRemote *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_significantEventFromSignificantEventModel:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(a1 + 40);
      v27 = 138543618;
      v28 = v23;
      v29 = 2112;
      v30 = v24;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create significant event from model: %@", (uint8_t *)&v27, 0x16u);
LABEL_12:

    }
LABEL_13:

    objc_autoreleasePoolPop(v14);
    goto LABEL_14;
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_notifyTransportsOfUpdatedSignificantEvents:removedSignificantEventUUIDs:", v9, v10);

  objc_msgSend(v7, "dateOfOccurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "suppressNotificationsBeforeDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v13 == -1)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateOfOccurrence");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "suppressNotificationsBeforeDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v23;
      v29 = 2112;
      v30 = v25;
      v31 = 2112;
      v32 = v26;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring significant event with date of occurrence %@ because it is before %@", (uint8_t *)&v27, 0x20u);

      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (v17)
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v18;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate about updated significant event: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20 = [HMDHomePresenceRemote alloc];
    objc_msgSend(*(id *)(a1 + 40), "homePresenceByPairingIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMDHomePresenceRemote initWithPresenceByPairingIdentity:](v20, "initWithPresenceByPairingIdentity:", v21);

    objc_msgSend(v19, "clipManager:didUpdateSignificantEvent:withHomePresence:", *(_QWORD *)(a1 + 32), v7, v22);
  }

LABEL_14:
}

uint64_t __82__HMDCameraClipManager__notifyForChangedSignificantEventModel_mirrorOutputFuture___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

uint64_t __78__HMDCameraClipManager__handleChangedClipModel_wasCreated_mirrorOutputFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_significantEventFromSignificantEventModel:", a2);
}

void __66__HMDCameraClipManager__fetchAssetContextForMessage_propertyName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _OWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  _OWORD *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  _OWORD *v63;
  void *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  __int128 v68;
  _BYTE buf[28];
  __int16 v70;
  __int128 *v71;
  __int16 v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "hmbPropertyNamed:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "downloadStreamingAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "contentDownloadURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "contentDownloadURLExpirationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v63 = v6;
          v11 = (void *)MEMORY[0x1E0CBA3C0];
          objc_msgSend(v5, "streamingAssetVersion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "requiredHTTPHeadersForStreamingAssetVersion:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA3C8]), "initWithURL:expirationDate:requiredHTTPHeaders:", v9, v10, v13);
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          v64 = v14;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v61 = v15;
            HMFGetLogIdentifier();
            v18 = objc_claimAutoreleasedReturnValue();
            v60 = *(_QWORD *)(a1 + 56);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            objc_msgSend(v5, "hmbModelID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v5, "hmbModelID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
            }
            v68 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544386;
            v48 = (void *)v18;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v60;
            *(_WORD *)&buf[22] = 1042;
            *(_DWORD *)&buf[24] = 16;
            v70 = 2098;
            v71 = &v68;
            v72 = 2112;
            v14 = v64;
            v73 = v64;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched streaming asset with property name %@ for clip UUID %{public,uuid_t}.16P with context %@", buf, 0x30u);

            v15 = v61;
          }

          objc_autoreleasePoolPop(v15);
          v62 = *(void **)(a1 + 48);
          v66[0] = *MEMORY[0x1E0CB8498];
          encodeRootObjectForIncomingXPCMessage(v14, 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v67[0] = v49;
          v66[1] = *MEMORY[0x1E0CB84A0];
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "createClipWithSignificantEvents:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          encodeRootObjectForIncomingXPCMessage(v51, 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v67[1] = v52;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
          v53 = v9;
          v54 = v10;
          v55 = (void *)v13;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "respondWithPayload:", v56);

          v57 = v55;
          v10 = v54;
          v9 = v53;

          v6 = v63;
        }
        else
        {
          v40 = (void *)MEMORY[0x1D17BA0A0]();
          v41 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v65 = v40;
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            objc_msgSend(v5, "hmbModelID");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(v5, "hmbModelID");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "getUUIDBytes:", buf);

            }
            else
            {
              *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
            }
            v74 = *(_OWORD *)buf;
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v8;
            *(_WORD *)&buf[22] = 1042;
            *(_DWORD *)&buf[24] = 16;
            v70 = 2098;
            v71 = &v74;
            _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Could not find content download URL expiration date on streaming asset %@ for clip with UUID: %{public,uuid_t}.16P", buf, 0x26u);

            v40 = v65;
          }

          objc_autoreleasePoolPop(v40);
          v59 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "respondWithError:", v57);
        }

      }
      else
      {
        v34 = (void *)MEMORY[0x1D17BA0A0]();
        v35 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v5, "hmbModelID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(v5, "hmbModelID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "getUUIDBytes:", buf);

          }
          else
          {
            *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
          }
          v75 = *(_OWORD *)buf;
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 1042;
          *(_DWORD *)&buf[24] = 16;
          v70 = 2098;
          v71 = &v75;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find content download URL on streaming asset %@ for clip with UUID: %{public,uuid_t}.16P", buf, 0x26u);

        }
        objc_autoreleasePoolPop(v34);
        v58 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "respondWithError:", v10);
      }

    }
    else
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = v6;
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(a1 + 56);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        objc_msgSend(v5, "hmbModelID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v5, "hmbModelID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "getUUIDBytes:", buf);

        }
        else
        {
          *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
        }
        v76 = *(_OWORD *)buf;
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 1042;
        *(_DWORD *)&buf[24] = 16;
        v70 = 2098;
        v71 = &v76;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find streaming asset on property named %@ for clip with UUID: %{public,uuid_t}.16P", buf, 0x26u);

        v6 = v29;
      }

      objc_autoreleasePoolPop(v26);
      v47 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "respondWithError:", v9);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      v25 = *(void **)(a1 + 40);
      if (v25)
        objc_msgSend(v25, "getUUIDBytes:", buf);
      else
        *(_OWORD *)buf = *MEMORY[0x1E0D286F8];
      v77 = *(_OWORD *)buf;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 1042;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2098;
      *(_QWORD *)&buf[20] = &v77;
      v70 = 2112;
      v71 = v6;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch complete model for clip UUID %{public,uuid_t}.16P: %@", buf, 0x26u);

    }
    objc_autoreleasePoolPop(v21);
    v46 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "respondWithError:", v8);
  }

}

void __44__HMDCameraClipManager__cleanUpExpiredClips__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v7;
    v20 = 2112;
    v21 = (uint64_t)v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Removing expired clip: %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v3, "hmbModelID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (v11 >= objc_msgSend(*(id *)(a1 + 32), "fetchBatchLimit"))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(*(id *)(a1 + 40), "count");
      v18 = 138543618;
      v19 = v15;
      v20 = 2048;
      v21 = v16;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing %lu expired clips", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v17 = (id)objc_msgSend(*(id *)(a1 + 32), "_removeClipsWithUUIDs:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  }

}

void __65__HMDCameraClipManager__cleanUpIncompleteClipsForInitialStartup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  HMDCameraClipModel *v19;
  void *v20;
  void *v21;
  HMDCameraClipModel *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  unint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  unint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 138543618;
    v48 = v7;
    v49 = 2112;
    v50 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cleaning up incomplete clip: %@", (uint8_t *)&v47, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "quality"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "quality"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

  if (!v12)
  {
    objc_msgSend(v3, "recordedLocally");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v24, "BOOLValue") & 1) == 0)
    {

      goto LABEL_19;
    }
    v25 = *(unsigned __int8 *)(a1 + 64);

    if (!v25)
      goto LABEL_19;
  }
  objc_msgSend(v3, "duration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v18 <= 0.0)
  {
    v26 = *(void **)(a1 + 56);
    objc_msgSend(v3, "hmbModelID");
    v22 = (HMDCameraClipModel *)objc_claimAutoreleasedReturnValue();
    v23 = v26;
  }
  else
  {
    v19 = [HMDCameraClipModel alloc];
    objc_msgSend(v3, "hmbModelID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hmbParentModelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HMBModel initWithModelID:parentModelID:](v19, "initWithModelID:parentModelID:", v20, v21);

    -[HMDCameraClipModel setIsComplete:](v22, "setIsComplete:", MEMORY[0x1E0C9AAB0]);
    v23 = *(void **)(a1 + 48);
  }
  objc_msgSend(v23, "addObject:", v22);

  v27 = objc_msgSend(*(id *)(a1 + 48), "count");
  if (v27 >= objc_msgSend(*(id *)(a1 + 32), "fetchBatchLimit"))
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(void **)(a1 + 48);
      v47 = 138543618;
      v48 = v31;
      v49 = 2112;
      v50 = v32;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Completing batch of incomplete clips: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(*(id *)(a1 + 32), "localZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Complete Incomplete Clips"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (id)objc_msgSend(v33, "updateModels:options:", v34, v35);

    objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
  }
  v37 = objc_msgSend(*(id *)(a1 + 56), "count");
  if (v37 >= objc_msgSend(*(id *)(a1 + 32), "fetchBatchLimit"))
  {
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *(void **)(a1 + 56);
      v47 = 138543618;
      v48 = v41;
      v49 = 2112;
      v50 = v42;
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Removing batch of incomplete 0-duration clip UUIDs: %@", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    v43 = *(void **)(a1 + 32);
    v44 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0D32CD8], "optionsWithLabel:", CFSTR("Remove 0-duration Incomplete Clips"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (id)objc_msgSend(v43, "_removeClipsWithUUIDs:options:", v44, v45);

    objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
  }
LABEL_19:

}

uint64_t __55__HMDCameraClipManager__cleanUpClipsForInitialStartup___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanUpIncompleteClipsForInitialStartup:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpExpiredClips");
}

void __41__HMDCameraClipManager__performCloudPull__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull due to cloud zone fetch timer firing: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

id __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "faceCropAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched face crop URL: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "faceCropAsset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not find face crop file URL on fetched asset: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __66__HMDCameraClipManager__fetchFaceCropURLForSignificantEventModel___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch complete significant event notification model: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

id __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "heroFrameAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched hero frame URL: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "heroFrameAsset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not find hero frame file URL on fetched asset: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v14 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithError:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __67__HMDCameraClipManager__fetchHeroFrameURLForSignificantEventModel___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch complete significant event notification model: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

uint64_t __64__HMDCameraClipManager__fetchCanonicalHeroFrameURLForClipModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "reason") == 1 || objc_msgSend(v5, "reason") == 1)
  {
    if (objc_msgSend(v4, "reason") == 1)
      v6 = 1;
    else
      v6 = -1;
  }
  else
  {
    v7 = objc_msgSend(v4, "confidenceLevel");
    if (v7 == objc_msgSend(v5, "confidenceLevel"))
    {
      objc_msgSend(v4, "dateOfOccurrence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateOfOccurrence");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "confidenceLevel"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "confidenceLevel"));
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "compare:", v9);

  }
  return v6;
}

void __86__HMDCameraClipManager__fetchClipsWithDateInterval_quality_isAscending_error_handler___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "hmbModelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "significantEventsForClipWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "createClipWithSignificantEvents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch significant events for clip model %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

void __90__HMDCameraClipManager__fetchSignificantEventsWithDateInterval_isAscending_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_significantEventFromSignificantEventModel:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

uint64_t __72__HMDCameraClipManager__faceClassificationsForSignificantEventWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createFaceClassification");
}

uint64_t __52__HMDCameraClipManager__significantEventsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_significantEventFromSignificantEventModel:", a2);
}

void __63__HMDCameraClipManager_significantEventsForClipContainingDate___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __40__HMDCameraClipManager_performCloudPull__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_performCloudPull");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "completionHandlerAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "addCompletionBlock:", v2);

}

id __42__HMDCameraClipManager_enableCloudStorage__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "quotaManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "zoneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableCloudStorageForZoneWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D519E8];
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedulerWithDispatchQueue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reschedule:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __58__HMDCameraClipManager_significantEventsWithDateInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __57__HMDCameraClipManager_significantEventsForClipWithUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_significantEventFromSignificantEventModel:", a2);
}

id __184__HMDCameraClipManager_initWithZoneManager_quotaManager_faceClassificationResolver_clientConnectionsTimer_messageDispatcher_workQueue_cameraProfileUUID_fileManager_featuresDataSource___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CBA400];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFetchMessage:workQueue:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

+ (double)maximumClipDuration
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("maxClipDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t149 != -1)
    dispatch_once(&logCategory__hmf_once_t149, &__block_literal_global_187_139307);
  return (id)logCategory__hmf_once_v150;
}

void __35__HMDCameraClipManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v150;
  logCategory__hmf_once_v150 = v0;

}

@end
