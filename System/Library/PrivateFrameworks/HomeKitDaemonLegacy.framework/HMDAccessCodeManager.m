@implementation HMDAccessCodeManager

uint64_t __70__HMDAccessCodeManager_handleHomeDidEnableCharacteristicNotification___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling home did enable characteristic notification", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setHomeAppForegrounded:", 1);
}

- (void)setHomeAppForegrounded:(BOOL)a3
{
  self->_homeAppForegrounded = a3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessCodeManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleHomeDidEnableCharacteristicNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDAccessCodeManager context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HMDAccessCodeManager_handleHomeDidEnableCharacteristicNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v5, block);

}

- (HMDAccessCodeManagerContext)context
{
  return (HMDAccessCodeManagerContext *)objc_getProperty(self, a2, 24, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t109 != -1)
    dispatch_once(&logCategory__hmf_once_t109, &__block_literal_global_365);
  return (id)logCategory__hmf_once_v110;
}

- (HMDAccessCodeManager)initWithContext:(id)a3
{
  id v4;
  HMDAccessoryAccessCodeReaderWriter *v5;
  HMDAccessCodeDataManager *v6;
  HMDAccessCodeManager *v7;

  v4 = a3;
  v5 = -[HMDAccessoryAccessCodeReaderWriter initWithContext:]([HMDAccessoryAccessCodeReaderWriter alloc], "initWithContext:", v4);
  v6 = -[HMDAccessCodeDataManager initWithContext:delegate:]([HMDAccessCodeDataManager alloc], "initWithContext:delegate:", v4, self);
  v7 = -[HMDAccessCodeManager initWithContext:utilities:accessoryReaderWriter:dataManager:](self, "initWithContext:utilities:accessoryReaderWriter:dataManager:", v4, objc_opt_class(), v5, v6);

  return v7;
}

- (HMDAccessCodeManager)initWithContext:(id)a3 utilities:(Class)a4 accessoryReaderWriter:(id)a5 dataManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDAccessCodeManager *v14;
  HMDAccessCodeManager *v15;
  uint64_t v16;
  NSHashTable *subscribedClientConnections;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDAccessCodeManager;
  v14 = -[HMDAccessCodeManager init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_context, a3);
    objc_storeStrong((id *)&v15->_utilities, a4);
    objc_storeStrong((id *)&v15->_accessoryReaderWriter, a5);
    objc_storeStrong((id *)&v15->_dataManager, a6);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    subscribedClientConnections = v15->_subscribedClientConnections;
    v15->_subscribedClientConnections = (NSHashTable *)v16;

  }
  return v15;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessCodeManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[2];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDAccessCodeManager context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureWithMessageDispatcher:", v4);

  -[HMDAccessCodeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    _HMFPreconditionFailure();
  v65 = v4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeManager context](v11, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v71 = v13;
    v72 = 2112;
    v73 = v15;
    v74 = 2112;
    v75 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Configuring HMDAccessCodeManager with UUID: %@, for home: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v17 = objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v9, 0, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v9, 4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v16;
  v69[1] = v18;
  v64 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v16;
  v68[1] = v17;
  v63 = (void *)v17;
  v68[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager context](v11, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7950], v11, v20, sel_handleSubscribeMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7958], v11, v20, sel_handleUnsubscribeMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "messageDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB78A0], v11, v21, sel_handleFetchAccessCodesMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "messageDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7898], v11, v21, sel_handleFetchAccessCodeConstraintsMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB78B0], v11, v20, sel_handleFetchHomeAccessCodesMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "messageDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB78A8], v11, v20, sel_handleFetchCachedAccessCodesMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "messageDispatcher");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7930], v11, v21, sel_handleResetAccessoryAccessCodesMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "messageDispatcher");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7938], v11, v21, sel_handleSetAccessCodeForUserMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "messageDispatcher");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7948], v11, v21, sel_handleSubmitAccessCodeModificationRequestsMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "messageDispatcher");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "registerForMessage:receiver:policies:selector:", CFSTR("HMAccessCodeManagerConfirmDataHasSyncedToResidentMessage"), v11, v21, sel_handleConfirmDataHasSyncedToResidentMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "messageDispatcher");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "registerForMessage:receiver:policies:selector:", CFSTR("HMDAccessCodeManagerUserAccessCodeDidChangeMessage"), v11, v21, sel_handleUserAccessCodeDidChangeMessage_);

  v67[0] = v16;
  v67[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v16;
  v66[1] = v17;
  v66[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager context](v11, "context");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "administratorHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7940], v11, v44, sel_handleSetUserInformationMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "administratorHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7920], v11, v44, sel_handleRemoveHomeAccessCodeMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "messageDispatcher");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB78B8], v11, v45, sel_handleGenerateNewUserAccessCodeMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "messageDispatcher");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB7928], v11, v45, sel_handleRemoveSimpleLabelAccessCodeMessage_);

  -[HMDAccessCodeManager context](v11, "context");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "notificationCenter");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addObserver:selector:name:object:", v11, sel_handleHomeUserRemovedNotification_, CFSTR("HMDHomeUserRemovedNotification"), v9);

  -[HMDAccessCodeManager context](v11, "context");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "notificationCenter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObserver:selector:name:object:", v11, sel_handleAccessorySupportsAccessCodeDidChangeNotification_, CFSTR("HMDAccessorySupportsAccessCodeDidChangeNotification"), 0);

  -[HMDAccessCodeManager context](v11, "context");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "notificationCenter");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "addObserver:selector:name:object:", v11, sel_handleHomeDidEnableCharacteristicNotification_, CFSTR("HMDHomeDidEnableCharacteristicNotifyEventNotification"), v9);

  -[HMDAccessCodeManager context](v11, "context");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "notificationCenter");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addObserver:selector:name:object:", v11, sel_handleHomeDidDisableCharacteristicNotification_, CFSTR("HMDHomeDidDisableCharacteristicNotifyEventNotification"), v9);

  -[HMDAccessCodeManager dataManager](v11, "dataManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "configure");

}

- (void)unconfigure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDAccessCodeManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "administratorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deregisterReceiver:", self);

  -[HMDAccessCodeManager context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

}

- (void)fetchAccessCodeForIdentifier:(id)a3 accessoryUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessCodeManager *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(id, void *, _QWORD);
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[HMDAccessCodeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDAccessCodeManager dataManager](self, "dataManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cachedAccessCodeForIdentifier:accessoryUUID:", v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v18)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v19;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Found cached access code for identifier: %@, accessory UUID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v14, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v20, 0);

  }
  else
  {
    if (v18)
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v21;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetching access code for identifier: %@, accessory UUID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDAccessCodeManager accessoryReaderWriter](v16, "accessoryReaderWriter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "readAccessCodeWithIdentifier:accessoryUUID:", v8, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __78__HMDAccessCodeManager_fetchAccessCodeForIdentifier_accessoryUUID_completion___block_invoke;
    v25[3] = &unk_1E89A28C0;
    v25[4] = v16;
    v26 = v8;
    v27 = v10;
    v24 = (id)objc_msgSend(v23, "addCompletionBlock:", v25);

  }
}

- (void)handleSubscribeMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessCodeManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAccessCodeManager *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling client subscribe message", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "transport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HMDAccessCodeManager subscribedClientConnections](v8, "subscribedClientConnections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v13);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v8;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding with no payload after adding client to subscribed clients", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v8;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v25);

  }
}

- (void)handleUnsubscribeMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessCodeManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAccessCodeManager *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543362;
    v27 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling client unsubscribe message", (uint8_t *)&v26, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "transport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HMDAccessCodeManager subscribedClientConnections](v8, "subscribedClientConnections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v13);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v8;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Responding with no payload after removing client from subscribed clients", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v8;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v22;
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v25);

  }
}

- (void)handleSubmitAccessCodeModificationRequestsMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v10;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling SubmitAccessCodeModificationRequestsMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_initWeak((id *)buf, v8);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __74__HMDAccessCodeManager_handleSubmitAccessCodeModificationRequestsMessage___block_invoke;
  v15 = &unk_1E89BF4F0;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v4;
  v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _submitAccessCodeModificationRequestsForMessage:](v8, "_submitAccessCodeModificationRequestsForMessage:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)handleSetAccessCodeForUserMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v10;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling SetAccessCodeForUserMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_initWeak((id *)buf, v8);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __58__HMDAccessCodeManager_handleSetAccessCodeForUserMessage___block_invoke;
  v15 = &unk_1E89BF4F0;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v4;
  v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _setAccessCodeForUserForMessage:](v8, "_setAccessCodeForUserForMessage:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)handleRemoveSimpleLabelAccessCodeMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v10;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling RemoveSimpleLabelAccessCodeMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_initWeak((id *)buf, v8);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __65__HMDAccessCodeManager_handleRemoveSimpleLabelAccessCodeMessage___block_invoke;
  v15 = &unk_1E89BF4F0;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v4;
  v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _removeSimpleLabelAccessCodeMessage:](v8, "_removeSimpleLabelAccessCodeMessage:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)handleSetUserInformationMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMDAccessCodeManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling SetUserInformationMessage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *MEMORY[0x1E0CB7910];
  v33[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0CB78D8];
  v32 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v16)
  {
    -[HMDAccessCodeManager dataManager](v8, "dataManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserInformation:forHomeAccessCodeWithValue:changedByUserUUID:", v13, v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__HMDAccessCodeManager_handleSetUserInformationMessage___block_invoke;
    v25[3] = &unk_1E89BF480;
    v25[4] = v8;
    v26 = v13;
    v27 = v4;
    v19 = (id)objc_msgSend(v18, "addCompletionBlock:", v25);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find data in payload while attempting to set userInfo: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v24);

  }
}

- (void)handleRemoveHomeAccessCodeMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDAccessCodeManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling RemoveHomeAccessCodeMessage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *MEMORY[0x1E0CB78D8];
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDAccessCodeManager dataManager](v8, "dataManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeHomeAccessCodeWithValue:removedByUserUUID:", v13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58__HMDAccessCodeManager_handleRemoveHomeAccessCodeMessage___block_invoke;
    v22[3] = &unk_1E89B8190;
    v22[4] = v8;
    v23 = v4;
    v16 = (id)objc_msgSend(v15, "addCompletionBlock:", v22);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find data in payload while attempting to remove home access code", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);

  }
}

- (void)handleFetchAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v10;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchAccessCodesMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", *MEMORY[0x1E0CB78F8], v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && !objc_msgSend(v12, "hmf_isEmpty"))
  {
    objc_initWeak((id *)buf, v8);
    -[HMDAccessCodeManager _waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:](v8, "_waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke;
    v27[3] = &unk_1E89BB678;
    objc_copyWeak(&v29, (id *)buf);
    v21 = v4;
    v28 = v21;
    objc_msgSend(v19, "addSuccessBlock:", v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_3;
    v24[3] = &unk_1E89C0DA8;
    v24[4] = v8;
    v25 = v12;
    v26 = v21;
    v23 = (id)objc_msgSend(v22, "addFailureBlock:", v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);

  }
}

- (void)handleFetchAccessCodeConstraintsMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[2];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v10;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchAccessCodeConstraintsMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", *MEMORY[0x1E0CB78F8], v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && !objc_msgSend(v12, "hmf_isEmpty"))
  {
    objc_initWeak((id *)buf, v8);
    -[HMDAccessCodeManager _waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:](v8, "_waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke;
    v27[3] = &unk_1E89BB678;
    objc_copyWeak(&v29, (id *)buf);
    v21 = v4;
    v28 = v21;
    objc_msgSend(v19, "addSuccessBlock:", v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_3;
    v24[3] = &unk_1E89C0DA8;
    v24[4] = v8;
    v25 = v12;
    v26 = v21;
    v23 = (id)objc_msgSend(v22, "addFailureBlock:", v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v8;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);

  }
}

- (void)handleFetchHomeAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchHomeAccessCodesMessage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager dataManager](v8, "dataManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homeAccessCodeValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = v8;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Responding with home access codes: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v19 = *MEMORY[0x1E0CB7908];
  encodeRootObjectForIncomingXPCMessage(v12, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v18, v19);

}

- (void)handleFetchCachedAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDAccessCodeManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling FetchCachedAccessCodesMessage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = v8;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeManager dataManager](v12, "dataManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cachedAccessCodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v14;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding with cached access codes: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDAccessCodeManager dataManager](v12, "dataManager", *MEMORY[0x1E0CB78E8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cachedAccessCodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObjectForIncomingXPCMessage(v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v20);

}

- (void)handleResetAccessoryAccessCodesMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v10;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling ResetAccessoryAccessCodesMessage: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_initWeak((id *)buf, v8);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__HMDAccessCodeManager_handleResetAccessoryAccessCodesMessage___block_invoke;
  v15 = &unk_1E89BF4F0;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v4;
  v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _resetAccessoryAccessCodesForMessage:](v8, "_resetAccessoryAccessCodesForMessage:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)handleGenerateNewUserAccessCodeMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling GenerateNewUserAccessCodeMessage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  objc_initWeak((id *)buf, v8);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __63__HMDAccessCodeManager_handleGenerateNewUserAccessCodeMessage___block_invoke;
  v15 = &unk_1E89BF4F0;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v4;
  v16 = v11;
  if (!-[HMDAccessCodeManager _redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:](v8, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v11, &v12))-[HMDAccessCodeManager _generateNewUserAccessCodeForMessage:](v8, "_generateNewUserAccessCodeForMessage:", v11, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)handleConfirmDataHasSyncedToResidentMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDAccessCodeManager *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling ConfirmDataHasSyncedToResidentMessage", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v11 = *MEMORY[0x1E0CB78F8];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__HMDAccessCodeManager_handleConfirmDataHasSyncedToResidentMessage___block_invoke;
  v22[3] = &unk_1E89C2198;
  v22[4] = v8;
  v14 = objc_msgSend(v13, "na_all:", v22);
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = v8;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v18)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v19;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Resident has all accessories for UUIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v4, "respondWithSuccess");
  }
  else
  {
    if (v18)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Resident does not have all accessories for UUIDs: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);

  }
}

- (void)handleUserAccessCodeDidChangeMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("HMDAccessCodeManagerMessageKeyUserAccessCodeChangeType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2048;
    v18 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling UserAccessCodeDidChangeMessage with changeType: %lu", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v6)
  {
    case 2:
      -[HMDAccessCodeManager context](v8, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bulletinBoard");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertAccessCodeRemovedBulletinForHome:", v12);
      goto LABEL_9;
    case 1:
      -[HMDAccessCodeManager context](v8, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bulletinBoard");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertAccessCodeChangedBulletinForHome:", v12);
      goto LABEL_9;
    case 0:
      -[HMDAccessCodeManager context](v8, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bulletinBoard");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertAccessCodeAddedBulletinForHome:", v12);
LABEL_9:

      break;
  }

}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDAccessCodeManager *v10;

  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HMDAccessCodeManager_handleHomeUserRemovedNotification___block_invoke;
  v8[3] = &unk_1E89C2328;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)handleAccessorySupportsAccessCodeDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HMDAccessCodeManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  HMDAccessCodeManager *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
    -[HMDAccessCodeManager context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__HMDAccessCodeManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke;
    block[3] = &unk_1E89C20C8;
    v18 = v9;
    v19 = self;
    v20 = v6;
    dispatch_async(v16, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Not handling access code support change for accessory in other home", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleHomeDidDisableCharacteristicNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDAccessCodeManager context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HMDAccessCodeManager_handleHomeDidDisableCharacteristicNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v5, block);

}

- (BOOL)hasCurrentUserAccessCodeChangedWithChangedAccessCodes:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HMDAccessCodeManager_hasCurrentUserAccessCodeChangedWithChangedAccessCodes_home___block_invoke;
  v12[3] = &unk_1E89B7A88;
  v13 = v6;
  v10 = v6;
  LOBYTE(v6) = objc_msgSend(v7, "na_any:", v12);

  return (char)v6;
}

- (void)_updateCacheWithModificationResponses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    -[objc_class addedAccessoryAccessCodesFromModificationResponses:](-[HMDAccessCodeManager utilities](self, "utilities"), "addedAccessoryAccessCodesFromModificationResponses:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[HMDAccessCodeManager dataManager](self, "dataManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateCacheWithAddedAccessCodes:", v5);

    }
    -[objc_class updatedAccessoryAccessCodesFromModificationResponses:](-[HMDAccessCodeManager utilities](self, "utilities"), "updatedAccessoryAccessCodesFromModificationResponses:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[HMDAccessCodeManager dataManager](self, "dataManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateCacheWithUpdatedAccessCodes:", v7);

    }
    -[objc_class removedAccessoryAccessCodesFromModificationResponses:](-[HMDAccessCodeManager utilities](self, "utilities"), "removedAccessoryAccessCodesFromModificationResponses:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      -[HMDAccessCodeManager dataManager](self, "dataManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateCacheWithRemovedAccessCodes:", v9);

    }
    v4 = v11;
  }

}

- (BOOL)_redispatchToResidentIfNeccesaryForMessage:(id)a3 withNewResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;
  void *v23;
  HMDAccessCodeManager *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isCurrentDevicePrimaryResident");

  if ((v9 & 1) == 0)
  {
    -[HMDAccessCodeManager context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "primaryResidentSupportsAccessCodes") & 1) != 0)
    {
      -[HMDAccessCodeManager context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "residentCommunicationHandlerPreferredDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x1D17BA0A0]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543362;
          v29 = v16;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Redispatching message to resident.", (uint8_t *)&v28, 0xCu);

        }
        objc_autoreleasePoolPop(v13);
        if (v7)
        {
          v17 = (void *)objc_msgSend(v6, "mutableCopy");
          objc_msgSend(v17, "setResponseHandler:", v7);
          -[HMDAccessCodeManager context](v14, "context");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "remoteMessageForwarder");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "redispatchToResidentMessage:", v17);

        }
        else
        {
          -[HMDAccessCodeManager context](v14, "context");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "remoteMessageForwarder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "redispatchToResidentMessage:", v6);
        }

LABEL_16:
        v22 = 1;
        goto LABEL_17;
      }
    }
    else
    {

    }
    -[HMDAccessCodeManager context](self, "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isCurrentDeviceOwnerUser");

    if ((v21 & 1) == 0)
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v26;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@There is no resident available, so nothing can be done.", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 91);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v17);
      goto LABEL_16;
    }
  }
  v22 = 0;
LABEL_17:

  return v22;
}

- (void)_fetchAccessCodesForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessCodeManager *v18;
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
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching access codes for message.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteMessageForwarder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageForForwardedMessage:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0CB78F8];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unarchivedObjectForKey:ofClasses:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && !objc_msgSend(v16, "hmf_isEmpty"))
  {
    -[HMDAccessCodeManager accessoryReaderWriter](v8, "accessoryReaderWriter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "readAccessCodesFromAccessoriesWithUUIDs:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __52__HMDAccessCodeManager__fetchAccessCodesForMessage___block_invoke;
    v26[3] = &unk_1E89C0D18;
    v26[4] = v8;
    v27 = v13;
    v25 = (id)objc_msgSend(v24, "addCompletionBlock:", v26);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messagePayload");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondWithError:", v22);

  }
}

- (void)_fetchAccessCodeConstraintsForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessCodeManager *v18;
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
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetching access code constraints for message.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteMessageForwarder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageForForwardedMessage:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0CB78F8];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unarchivedObjectForKey:ofClasses:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && !objc_msgSend(v16, "hmf_isEmpty"))
  {
    -[HMDAccessCodeManager accessoryReaderWriter](v8, "accessoryReaderWriter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "readConstraintsFromAccessoriesWithUUIDs:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __62__HMDAccessCodeManager__fetchAccessCodeConstraintsForMessage___block_invoke;
    v26[3] = &unk_1E89C0D18;
    v26[4] = v8;
    v27 = v13;
    v25 = (id)objc_msgSend(v24, "addCompletionBlock:", v26);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messagePayload");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find accessory UUIDs in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondWithError:", v22);

  }
}

- (void)_submitAccessCodeModificationRequestsForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessCodeManager *v18;
  NSObject *v19;
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
  id v31;
  void *v32;
  HMDAccessCodeManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[5];

  v43[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Submitting AccessCodeModificationRequests for message.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteMessageForwarder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageForForwardedMessage:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0CB78C0];
  v43[0] = objc_opt_class();
  v43[1] = objc_opt_class();
  v43[2] = objc_opt_class();
  v43[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unarchivedObjectForKey:ofClasses:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && !objc_msgSend(v16, "hmf_isEmpty"))
  {
    -[HMDAccessCodeManager context](v8, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userForMessage:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeManager context](v8, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeManager _accessCodeForUserWithUUID:inHome:](v8, "_accessCodeForUserWithUUID:inHome:", v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v22, "isAdministrator") & 1) != 0
      || (-[objc_class allModificationRequests:areAddingAccessCode:](-[HMDAccessCodeManager utilities](v8, "utilities"), "allModificationRequests:areAddingAccessCode:", v16, v27) & 1) != 0)
    {
      -[HMDAccessCodeManager _updateModificationRequestsWithUserOrGuestNames:](v8, "_updateModificationRequestsWithUserOrGuestNames:", v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessCodeManager accessoryReaderWriter](v8, "accessoryReaderWriter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "performAccessCodeModificationRequests:withRetries:", v28, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __72__HMDAccessCodeManager__submitAccessCodeModificationRequestsForMessage___block_invoke;
      v37[3] = &unk_1E89C0D18;
      v37[4] = v8;
      v38 = v13;
      v31 = (id)objc_msgSend(v30, "addCompletionBlock:", v37);

    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v8;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v35;
        v41 = 2112;
        v42 = v36;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@Dropping request: The user: %@ is not an admin and attempted to change an access code that does not belong to them", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 53);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "respondWithError:", v28);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messagePayload");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v20;
      v41 = 2112;
      v42 = v21;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find modification requests in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondWithError:", v22);
  }

}

- (id)_updateModificationRequestsWithUserOrGuestNames:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HMDAccessCodeManager__updateModificationRequestsWithUserOrGuestNames___block_invoke;
  v4[3] = &unk_1E89A28E8;
  v4[4] = self;
  objc_msgSend(a3, "na_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_removeSimpleLabelAccessCodeMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDAccessCodeManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing simple label access code for message.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteMessageForwarder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageForForwardedMessage:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringForKey:", *MEMORY[0x1E0CB78D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", v14);
  -[HMDAccessCodeManager dataManager](v8, "dataManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessCodeValuesWithSimpleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v15);

  if ((v18 & 1) != 0)
  {
    -[HMDAccessCodeManager _removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:forUserUUID:](v8, "_removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:forUserUUID:", v15, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke;
    v32[3] = &unk_1E89BA2C0;
    v21 = v13;
    v33 = v21;
    objc_msgSend(v19, "addSuccessBlock:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v20;
    v30[1] = 3221225472;
    v30[2] = __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke_2;
    v30[3] = &unk_1E89C2350;
    v31 = v21;
    v23 = (id)objc_msgSend(v22, "addFailureBlock:", v30);

    v24 = v33;
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v8;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@A home access code with the specified value does not exist, so we have nothing to do.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v34 = *MEMORY[0x1E0CB78C8];
    encodeRootObjectForIncomingXPCMessage(MEMORY[0x1E0C9AA60], 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondWithPayload:", v29);

  }
}

- (id)_removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:(id)a3 forUserUUID:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D519C0];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  -[HMDAccessCodeManager dataManager](self, "dataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "simpleLabelForAccessCode:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessCodeManager accessoryReaderWriter](self, "accessoryReaderWriter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllAccessCodesWithValue:withUserUUID:guestName:", v6, v8, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke;
  v21[3] = &unk_1E89BFCD8;
  v21[4] = self;
  v15 = v9;
  v22 = v15;
  v23 = v6;
  v16 = v6;
  v17 = (id)objc_msgSend(v14, "addCompletionBlock:", v21);

  v18 = v23;
  v19 = v15;

  return v19;
}

- (void)_setAccessCodeForUserForMessage:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  HMDAccessCodeManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HMDAccessCodeSetupLogEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDAccessCodeManager *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  HMDAccessCodeSetupLogEvent *v42;
  void *v43;
  void *v44;
  HMDAccessCodeSetupLogEvent *v45;
  void *v46;
  HMDAccessCodeManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  HMDAccessCodeSetupLogEvent *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  _QWORD v59[5];
  id v60;
  HMDAccessCodeSetupLogEvent *v61;
  _QWORD v62[4];
  id v63;
  HMDAccessCodeManager *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workQueue");
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
    v70 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Setting access code for user for message.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v58, "proxyConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.Home.HomeUIService"));

  if (v12)
    v13 = objc_alloc_init(HMDAccessCodeSetupLogEvent);
  else
    v13 = 0;
  -[HMDAccessCodeManager context](v7, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteMessageForwarder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageForForwardedMessage:", v58);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringForKey:", *MEMORY[0x1E0CB78D0]);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v16, "stringForKey:", *MEMORY[0x1E0CB7918]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithUUIDString:", v19);

  -[HMDAccessCodeManager context](v7, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userForMessage:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessCodeManager context](v7, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager _accessCodeForUserWithUUID:inHome:](v7, "_accessCodeForUserWithUUID:inHome:", v20, v24);
  v25 = objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v22, "isAdministrator") & 1) != 0
    || (objc_msgSend(v22, "uuid"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = HMFEqualObjects(),
        v26,
        (v27 & 1) != 0))
  {
    if (v25 | v17)
    {
      v54 = v13;
      v28 = MEMORY[0x1E0C809B0];
      v29 = &unk_1CDB8E000;
      if (v17)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", v17);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA198]), "initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:", 0, 0, v20, 0);
        -[HMDAccessCodeManager dataManager](v7, "dataManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uuid");
        v33 = (void *)v25;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setUserInformation:forHomeAccessCodeWithValue:changedByUserUUID:", v31, v30, v34);
        v56 = v17;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke;
        v62[3] = &unk_1E89A2910;
        v63 = v33;
        v64 = v7;
        v65 = v20;
        v66 = v30;
        v53 = v30;
        objc_msgSend(v35, "flatMap:", v62);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v56;
        v25 = (uint64_t)v33;
        v29 = (_QWORD *)&unk_1CDB8E000;

        v28 = MEMORY[0x1E0C809B0];
      }
      else
      {
        objc_msgSend(v22, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessCodeManager _removeAccessCode:forUserWithUUID:removedByUserUUID:](v7, "_removeAccessCode:forUserWithUUID:removedByUserUUID:", v25, v20, v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v59[0] = v28;
      v59[1] = v29[202];
      v59[2] = __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_3;
      v59[3] = &unk_1E89BFCD8;
      v59[4] = v7;
      v60 = v16;
      v13 = v54;
      v61 = v54;
      v52 = (id)objc_msgSend(v36, "addCompletionBlock:", v59);

    }
    else
    {
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      v38 = v7;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = v25;
        v41 = v17;
        v42 = v13;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v43;
        _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@A nil access code was passed but the user has no access code, so responding with success", buf, 0xCu);

        v13 = v42;
        v17 = v41;
        v25 = v40;
      }

      objc_autoreleasePoolPop(v37);
      v67 = *MEMORY[0x1E0CB78C8];
      encodeRootObjectForIncomingXPCMessage(MEMORY[0x1E0C9AA60], 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "respondWithPayload:", v44);

    }
  }
  else
  {
    v55 = v25;
    v57 = v17;
    v45 = v13;
    v46 = (void *)MEMORY[0x1D17BA0A0]();
    v47 = v7;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uuid");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v70 = v49;
      v71 = 2112;
      v72 = v50;
      v73 = 2112;
      v74 = v20;
      _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_INFO, "%{public}@Dropping request: The user: %@ does not have permission to change the access code for the user: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v46);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 53);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "respondWithError:", v51);

    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 53);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v45;
    -[HMDAccessCodeSetupLogEvent submitFailureWithReason:error:](v45, "submitFailureWithReason:error:", 2, v36);
    v25 = v55;
    v17 = v57;
  }

}

- (id)_removeAccessCode:(id)a3 forUserWithUUID:(id)a4 removedByUserUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDAccessCodeManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessCodeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDAccessCodeManager context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userWithUUID:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HMDAccessCodeManager _removeAccessCode:forUser:removedByUserUUID:](self, "_removeAccessCode:forUser:removedByUserUUID:", v8, v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDAccessCodeManager dataManager](self, "dataManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "homeAccessCodeWithRemovedUserInfoWithUUID:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "accessCodeValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessCodeManager _removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:forUserUUID:](self, "_removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure:forUserUUID:", v18, v9);
      v19 = objc_claimAutoreleasedReturnValue();
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
        v26 = 138543618;
        v27 = v23;
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Did not find any current or former user with UUID: %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v24 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "futureWithError:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v19;

  }
  return v15;
}

- (id)_removeAccessCode:(id)a3 forUser:(id)a4 removedByUserUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessCodeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", v8);
  -[HMDAccessCodeManager dataManager](self, "dataManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeHomeAccessCodeWithValue:removedByUserUUID:", v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke;
  v21[3] = &unk_1E89A2910;
  v21[4] = self;
  v22 = v13;
  v23 = v9;
  v24 = v8;
  v16 = v8;
  v17 = v9;
  v18 = v13;
  objc_msgSend(v15, "flatMap:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)removeAccessCode:(id)a3 fromHAPAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  HMDAccessCodeManager *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  -[HMDAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__HMDAccessCodeManager_removeAccessCode_fromHAPAccessory___block_invoke;
  v17[3] = &unk_1E89C07B8;
  v18 = v6;
  v19 = self;
  v20 = v7;
  v11 = v8;
  v21 = v11;
  v12 = v7;
  v13 = v6;
  dispatch_async(v10, v17);

  v14 = v21;
  v15 = v11;

  return v15;
}

- (id)_removeAccessCode:(id)a3 forUserBeingRemoved:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", v6);
  -[HMDAccessCodeManager accessoryReaderWriter](self, "accessoryReaderWriter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllAccessCodesWithValue:withUserUUID:guestName:", v10, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__HMDAccessCodeManager__removeAccessCode_forUserBeingRemoved___block_invoke;
  v18[3] = &unk_1E89BFCD8;
  v18[4] = self;
  v19 = v7;
  v20 = v6;
  v14 = v6;
  v15 = v7;
  objc_msgSend(v13, "addCompletionBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_resetAccessoryAccessCodesForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  HMDAccessCodeManager *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Resetting access code for message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteMessageForwarder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageForForwardedMessage:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0CB7900];
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unarchivedObjectForKey:ofClasses:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessCodeManager _resetAccessCodesForHomeAccessCode:](v8, "_resetAccessCodesForHomeAccessCode:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__HMDAccessCodeManager__resetAccessoryAccessCodesForMessage___block_invoke;
  v20[3] = &unk_1E89C0D18;
  v21 = v13;
  v22 = v8;
  v18 = v13;
  v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v20);

}

- (void)_generateNewUserAccessCodeForMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessCodeManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  HMDAccessCodeManager *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Generating new user access code for message.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteMessageForwarder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageForForwardedMessage:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v13, "stringForKey:", *MEMORY[0x1E0CB7918]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

  -[HMDAccessCodeManager context](v8, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager _accessCodeForUserWithUUID:inHome:](v8, "_accessCodeForUserWithUUID:inHome:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@User already has an access code, so doing nothing.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2600);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "respondWithError:", v24);
  }
  else
  {
    -[HMDAccessCodeManager _createNewAccessCodeForUserWithUUID:](v8, "_createNewAccessCodeForUserWithUUID:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __61__HMDAccessCodeManager__generateNewUserAccessCodeForMessage___block_invoke;
    v27[3] = &unk_1E89C0D18;
    v28 = v13;
    v29 = v8;
    v26 = (id)objc_msgSend(v25, "addCompletionBlock:", v27);

    v24 = v28;
  }

}

- (void)_notifySubscribersOfMessageWithName:(id)a3 payload:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  HMDAccessCodeManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v25 = a4;
  -[HMDAccessCodeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeManager subscribedClientConnections](v9, "subscribedClientConnections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v11;
    v34 = 2048;
    v35 = objc_msgSend(v12, "count");
    v36 = 2112;
    v37 = v26;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribers of message with name: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDAccessCodeManager subscribedClientConnections](v9, "subscribedClientConnections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17);
        objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", v26, v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTransport:", v18);
        v20 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMDAccessCodeManager messageTargetUUID](v9, "messageTargetUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);
        objc_msgSend(v19, "setDestination:", v22);

        -[HMDAccessCodeManager context](v9, "context");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "messageDispatcher");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sendMessage:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

}

- (id)_createNewAccessCodeForUserWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMDAccessCodeManager *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  HMDAccessCodeManager *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating new access code for user with UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke;
  v14[3] = &unk_1E89A2938;
  v10 = v9;
  v15 = v10;
  v16 = v4;
  v17 = v6;
  v11 = v4;
  -[HMDAccessCodeManager _generateNewAccessCodeWithCompletion:](v6, "_generateNewAccessCodeWithCompletion:", v14);
  v12 = v10;

  return v12;
}

- (id)_resetAccessCodesForHomeAccessCode:(id)a3
{
  id v4;
  void *v5;
  HMDAccessCodeManager *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  HMDAccessCodeManager *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting access codes for home access code: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke;
  v15[3] = &unk_1E89A2938;
  v10 = v9;
  v16 = v10;
  v17 = v6;
  v18 = v4;
  v11 = v4;
  -[HMDAccessCodeManager _generateNewAccessCodeWithCompletion:](v6, "_generateNewAccessCodeWithCompletion:", v15);
  v12 = v18;
  v13 = v10;

  return v13;
}

- (id)_updateAccessCode:(id)a3 toNewValue:(id)a4 onAccessoriesWithFetchResponses:(id)a5 withRetries:(BOOL)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke;
  v24[3] = &unk_1E89A2960;
  v25 = v9;
  v12 = v9;
  objc_msgSend(a5, "na_map:", v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  v20 = 3221225472;
  v21 = __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_3;
  v22 = &unk_1E89A2988;
  v23 = v10;
  v14 = v10;
  objc_msgSend(v13, "na_map:", &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager accessoryReaderWriter](self, "accessoryReaderWriter", v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performAccessCodeModificationRequests:withRetries:", v15, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)addNewAccessCode:(id)a3 forUserWithUUID:(id)a4 toAccessoriesWithUUIDs:(id)a5 withRetries:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_new();
  -[HMDAccessCodeManager context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __92__HMDAccessCodeManager_addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke;
  v23[3] = &unk_1E89B6E60;
  v23[4] = self;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v28 = a6;
  v16 = v13;
  v27 = v16;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_async(v15, v23);

  v20 = v27;
  v21 = v16;

  return v21;
}

- (id)_addNewAccessCode:(id)a3 forUserWithUUID:(id)a4 toAccessoriesWithUUIDs:(id)a5 withRetries:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDAccessCodeManager *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v16;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Adding new access code to accessories with UUIDs: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __93__HMDAccessCodeManager__addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke;
  v26 = &unk_1E89A29B0;
  v27 = v10;
  v28 = v11;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v12, "na_map:", &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager accessoryReaderWriter](v14, "accessoryReaderWriter", v23, v24, v25, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "performAccessCodeModificationRequests:withRetries:", v19, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)_generateNewAccessCodeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDAccessCodeManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Generating new access code", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessCodeManager accessoryReaderWriter](v6, "accessoryReaderWriter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager context](v6, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDsOfAccessoriesSupportingAccessCodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke;
  v13[3] = &unk_1E89A2AD8;
  v13[4] = v6;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v9, "readConstraintsAndAccessCodesFromAccessoriesWithUUIDs:completion:", v11, v13);

}

- (id)_accessCodeForUserWithUUID:(id)a3 inHome:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  objc_msgSend(a4, "users");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__HMDAccessCodeManager__accessCodeForUserWithUUID_inHome___block_invoke;
  v16[3] = &unk_1E89B7AD8;
  v8 = v6;
  v17 = v8;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    -[HMDAccessCodeManager dataManager](self, "dataManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeAccessCodeWithRemovedUserInfoWithUUID:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessCodeValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)_updateAccessoryAccessCodeCache
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessCodeManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  v6 = (void *)MEMORY[0x1E0D285F8];
  v7 = *MEMORY[0x1E0CB78A0];
  v13 = *MEMORY[0x1E0CB78F8];
  -[HMDAccessCodeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDsOfAccessoriesSupportingAccessCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithName:destination:payload:", v7, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessCodeManager handleFetchAccessCodesMessage:](self, "handleFetchAccessCodesMessage:", v12);
}

- (id)_waitUntilDataHasSyncedToResidentIfNecessaryForAccessoryUUIDs:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[HMDAccessCodeManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCurrentDevicePrimaryResident");

  if (v6)
    goto LABEL_6;
  -[HMDAccessCodeManager context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "primaryResidentSupportsAccessCodes") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[HMDAccessCodeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "residentCommunicationHandlerPreferredDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[HMDAccessCodeManager _waitUntilDataHasSyncedToResidentForAccessoryUUIDs:](self, "_waitUntilDataHasSyncedToResidentForAccessoryUUIDs:", v4);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

- (id)_waitUntilDataHasSyncedToResidentForAccessoryUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  -[HMDAccessCodeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "residentDataSyncVerificationRetries");
  -[HMDAccessCodeManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "residentDataSyncVerificationRetryTimeInterval");
  v10 = v9;
  -[HMDAccessCodeManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke;
  v16[3] = &unk_1E89A2EA0;
  v16[4] = self;
  v17 = v4;
  v13 = v4;
  objc_msgSend(v5, "futureWithRetries:timeInterval:workQueue:block:", v7, v12, v16, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)accessCodeDataManager:(id)a3 didAddHomeAccessCodes:(id)a4 addedByUserUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HMDAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__HMDAccessCodeManager_accessCodeDataManager_didAddHomeAccessCodes_addedByUserUUID___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

- (void)accessCodeDataManager:(id)a3 didUpdateHomeAccessCodes:(id)a4 changedByUserUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HMDAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HMDAccessCodeManager_accessCodeDataManager_didUpdateHomeAccessCodes_changedByUserUUID___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

- (void)accessCodeDataManager:(id)a3 didRemoveHomeAccessCodes:(id)a4 removedByUserUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HMDAccessCodeManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HMDAccessCodeManager_accessCodeDataManager_didRemoveHomeAccessCodes_removedByUserUUID___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

- (void)accessCodeDataManager:(id)a3 didAddAccessoryAccessCodes:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HMDAccessCodeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x1E0CB7868];
  v11 = *MEMORY[0x1E0CB78F0];
  encodeRootObjectForIncomingXPCMessage(v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager _notifySubscribersOfMessageWithName:payload:](self, "_notifySubscribersOfMessageWithName:payload:", v8, v10);

}

- (void)accessCodeDataManager:(id)a3 didUpdateAccessoryAccessCodes:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HMDAccessCodeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x1E0CB7888];
  v11 = *MEMORY[0x1E0CB78F0];
  encodeRootObjectForIncomingXPCMessage(v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager _notifySubscribersOfMessageWithName:payload:](self, "_notifySubscribersOfMessageWithName:payload:", v8, v10);

}

- (void)accessCodeDataManager:(id)a3 didRemoveAccessoryAccessCodes:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[HMDAccessCodeManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = *MEMORY[0x1E0CB7878];
  v11 = *MEMORY[0x1E0CB78F0];
  encodeRootObjectForIncomingXPCMessage(v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeManager _notifySubscribersOfMessageWithName:payload:](self, "_notifySubscribersOfMessageWithName:payload:", v8, v10);

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDAccessCodeManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMDAccessCodeManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMDAccessCodeDataManager)dataManager
{
  return (HMDAccessCodeDataManager *)objc_getProperty(self, a2, 16, 1);
}

- (Class)utilities
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccessoryAccessCodeReaderWriter)accessoryReaderWriter
{
  return (HMDAccessoryAccessCodeReaderWriter *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isHomeAppForegrounded
{
  return self->_homeAppForegrounded;
}

- (NSHashTable)subscribedClientConnections
{
  return (NSHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedClientConnections, 0);
  objc_storeStrong((id *)&self->_accessoryReaderWriter, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
}

void __89__HMDAccessCodeManager_accessCodeDataManager_didRemoveHomeAccessCodes_removedByUserUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB7880];
  v24 = *MEMORY[0x1E0CB7908];
  v3 = *(void **)(a1 + 32);
  encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_notifySubscribersOfMessageWithName:payload:", v2, v5);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && objc_msgSend(*(id *)(a1 + 32), "hasCurrentUserAccessCodeChangedWithChangedAccessCodes:home:", *(_QWORD *)(a1 + 40), v7))
  {
    if (*(_QWORD *)(a1 + 48)
      && (objc_msgSend(v7, "currentUser"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "uuid"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 48)),
          v9,
          v8,
          (v10 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bulletinBoard");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertAccessCodeRemovedBulletinForHome:", v7);

    }
    else
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        v20 = 138543618;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Not creating access code removed bulletin because it was removed by current user: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "walletKeyManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleAccessCodeChanged");

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isHomeAppForegrounded"))
    objc_msgSend(*(id *)(a1 + 32), "_updateAccessoryAccessCodeCache");

}

void __89__HMDAccessCodeManager_accessCodeDataManager_didUpdateHomeAccessCodes_changedByUserUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB7890];
  v24 = *MEMORY[0x1E0CB7908];
  v3 = *(void **)(a1 + 32);
  encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_notifySubscribersOfMessageWithName:payload:", v2, v5);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && objc_msgSend(*(id *)(a1 + 32), "hasCurrentUserAccessCodeChangedWithChangedAccessCodes:home:", *(_QWORD *)(a1 + 40), v7))
  {
    if (*(_QWORD *)(a1 + 48)
      && (objc_msgSend(v7, "currentUser"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "uuid"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 48)),
          v9,
          v8,
          (v10 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bulletinBoard");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertAccessCodeChangedBulletinForHome:", v7);

    }
    else
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        v20 = 138543618;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Not creating access code changed bulletin because it was changed by current user: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "walletKeyManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleAccessCodeChanged");

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isHomeAppForegrounded"))
    objc_msgSend(*(id *)(a1 + 32), "_updateAccessoryAccessCodeCache");

}

void __84__HMDAccessCodeManager_accessCodeDataManager_didAddHomeAccessCodes_addedByUserUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB7870];
  v24 = *MEMORY[0x1E0CB7908];
  v3 = *(void **)(a1 + 32);
  encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_notifySubscribersOfMessageWithName:payload:", v2, v5);

  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && objc_msgSend(*(id *)(a1 + 32), "hasCurrentUserAccessCodeChangedWithChangedAccessCodes:home:", *(_QWORD *)(a1 + 40), v7))
  {
    if (*(_QWORD *)(a1 + 48)
      && (objc_msgSend(v7, "currentUser"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "uuid"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 48)),
          v9,
          v8,
          (v10 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bulletinBoard");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertAccessCodeAddedBulletinForHome:", v7);

    }
    else
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        v20 = 138543618;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Not creating access code added bulletin because it was added by current user: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "walletKeyManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleAccessCodeChanged");

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isHomeAppForegrounded"))
    objc_msgSend(*(id *)(a1 + 32), "_updateAccessoryAccessCodeCache");

}

id __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, void *);
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v3 = objc_alloc(MEMORY[0x1E0D285F8]);
  v4 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(*(id *)(a1 + 32), "messageTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTarget:", v5);
  v30 = *MEMORY[0x1E0CB78F8];
  encodeRootObjectForIncomingXPCMessage(*(void **)(a1 + 40), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithName:qualityOfService:destination:payload:", CFSTR("HMAccessCodeManagerConfirmDataHasSyncedToResidentMessage"), 33, v6, v8);

  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke_2;
  v23 = &unk_1E89BFD00;
  v24 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v25 = v10;
  v11 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v9, "setResponseHandler:", &v20));
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Pinging resident to confirm data has synced for accessories: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(*(id *)(a1 + 32), "context", v20, v21, v22, v23, v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "redispatchToResidentMessage:", v9);

  v17 = v25;
  v18 = v10;

  return v18;
}

void __75__HMDAccessCodeManager__waitUntilDataHasSyncedToResidentForAccessoryUUIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to confirm resident has data with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Resident confirmed that data has synced", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

uint64_t __58__HMDAccessCodeManager__accessCodeForUserWithUUID_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

void __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v5, "na_map:", &__block_literal_global_356);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_flatMap:", &__block_literal_global_358_3000);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "dataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeAccessCodeValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_map:", &__block_literal_global_362);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "generateAccessCodeValueFromConstraints:accessoryAccessCodes:homeAccessCodes:", v8, v9, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = v9;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Successfully generated new access code", buf, 0xCu);

        v9 = v30;
      }

      objc_autoreleasePoolPop(v15);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v31 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v27;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate new access code", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v28 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v28 + 16))(v28, 0, 0, v29);

      v9 = v31;
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDsOfAccessoriesSupportingAccessCodes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v23;
      v34 = 2112;
      v35 = v5;
      v36 = 2112;
      v37 = v7;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to read constraints: %@, and access codes: %@, from accessories with UUIDs: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v26 + 16))(v26, 0, 0, v8);
  }

}

id __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accessCodeValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accessoryAccessCodeValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_360);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "accessCodeValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __61__HMDAccessCodeManager__generateNewAccessCodeWithCompletion___block_invoke_354(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "constraints");
}

id __93__HMDAccessCodeManager__addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CBA158];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAccessCodeValue:accessoryUUID:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v5, "setUserUUID:", *(_QWORD *)(a1 + 40));
  return v5;
}

void __92__HMDAccessCodeManager_addNewAccessCode_forUserWithUUID_toAccessoriesWithUUIDs_withRetries___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_addNewAccessCode:forUserWithUUID:toAccessoriesWithUUIDs:withRetries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "completionHandlerAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "addCompletionBlock:", v2);

}

id __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "accessoryAccessCodeValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_2;
  v6[3] = &unk_1E89B7C90;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_firstObjectPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CBA188];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithAccessoryAccessCodeValue:updatedAccessCodeValue:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __97__HMDAccessCodeManager__updateAccessCode_toNewValue_onAccessoriesWithFetchResponses_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessCodeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v7 = a2;
  v8 = a3;
  if (v7)
  {
    objc_msgSend(a1[5], "dataManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "userInformationValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "accessCodeValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateUserInformation:forHomeAccessCodeWithOldValue:newAccessCodeValue:", v10, v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke_2;
    v20 = &unk_1E89A2910;
    v13 = a1[6];
    v21 = a1[5];
    v22 = v13;
    v23 = v7;
    v24 = v8;
    objc_msgSend(v12, "flatMap:", &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "completionHandlerAdapter", v17, v18, v19, v20, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "addCompletionBlock:", v15);

  }
  else
  {
    objc_msgSend(a1[4], "finishWithError:", a4);
  }

}

id __59__HMDAccessCodeManager__resetAccessCodesForHomeAccessCode___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessCodeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateAccessCode:toNewValue:onAccessoriesWithFetchResponses:withRetries:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a2;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA198]), "initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:", 0, 0, a1[5], 0);
    objc_msgSend(a1[6], "dataManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInformation:forHomeAccessCodeWithValue:changedByUserUUID:", v7, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke_2;
    v13[3] = &unk_1E89B7AB0;
    v13[4] = a1[6];
    v14 = v6;
    v15 = a1[5];
    objc_msgSend(v9, "flatMap:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "completionHandlerAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "addCompletionBlock:", v11);

  }
  else
  {
    objc_msgSend(a1[4], "finishWithError:", a4);
  }

}

id __60__HMDAccessCodeManager__createNewAccessCodeForUserWithUUID___block_invoke_2(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  objc_msgSend(v1, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDsOfAccessoriesSupportingAccessCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_addNewAccessCode:forUserWithUUID:toAccessoriesWithUUIDs:withRetries:", v2, v3, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __61__HMDAccessCodeManager__generateNewUserAccessCodeForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 40), "_updateCacheWithModificationResponses:", v5));
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to message with modification responses: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void **)(a1 + 32);
    v14 = *MEMORY[0x1E0CB78C8];
    encodeRootObjectForIncomingXPCMessage(v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "respondWithPayload:", v13, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v6);
  }

}

void __61__HMDAccessCodeManager__resetAccessoryAccessCodesForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 40), "_updateCacheWithModificationResponses:", v5));
    v8 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to message with modification responses: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void **)(a1 + 32);
    v14 = *MEMORY[0x1E0CB78C8];
    encodeRootObjectForIncomingXPCMessage(v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "respondWithPayload:", v13, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v6);
  }

}

void __62__HMDAccessCodeManager__removeAccessCode_forUserBeingRemoved___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5 || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "anyModificationFailed:", v5))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@At least one modification response failed, so saving removedUserAccessCode", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = objc_alloc(MEMORY[0x1E0CBA7B0]);
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "userID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithName:userUUID:userID:dateRemoved:", v12, v13, v14, v15);

    objc_msgSend(*(id *)(a1 + 32), "dataManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "saveRemovedUserAccessCode:withRemovedUserInfo:", *(_QWORD *)(a1 + 48), v16);

  }
}

void __58__HMDAccessCodeManager_removeAccessCode_fromHAPAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "accessoryReaderWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllHAPAccessCodesWithValue:forSpecificAccessory:", v6, *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "addCompletionBlock:", v4);

}

id __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "accessoryReaderWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAccessCodesWithValue:withUserUUID:guestName:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke_2;
  v8[3] = &unk_1E89BFCD8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v5, "addCompletionBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __68__HMDAccessCodeManager__removeAccessCode_forUser_removedByUserUUID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5 || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "anyModificationFailed:", v5))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@At least one modification response failed, so saving removedUserAccessCode", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = objc_alloc(MEMORY[0x1E0CBA7B0]);
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "userID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v11, "initWithName:userUUID:userID:dateRemoved:", v12, v13, v14, v15);

    objc_msgSend(*(id *)(a1 + 32), "dataManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "saveRemovedUserAccessCode:withRemovedUserInfo:", *(_QWORD *)(a1 + 48), v16);

  }
}

id __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "accessoryReaderWriter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA1A0]), "initWithStringValue:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "removeAllAccessCodesWithValue:withUserUUID:guestName:", v4, *(_QWORD *)(a1 + 48), 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_2;
  v12[3] = &unk_1E89B09F8;
  v12[4] = *(_QWORD *)(a1 + 40);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 48);
  v7 = v6;
  v15 = v7;
  v8 = (id)objc_msgSend(v2, "addCompletionBlock:", v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

void __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding to message with modification responses: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = a1[5];
    v21 = *MEMORY[0x1E0CB78C8];
    encodeRootObjectForIncomingXPCMessage(v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "respondWithPayload:", v14, v21);

    objc_msgSend(a1[6], "submitSuccess");
  }
  else
  {
    if (v6)
    {
      v15 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = a1[4];
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Responding to message with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(a1[5], "respondWithError:", v16);
    objc_msgSend(a1[6], "submitFailureWithReason:error:", 1, v7);

  }
}

void __56__HMDAccessCodeManager__setAccessCodeForUserForMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDsOfAccessoriesSupportingAccessCodes");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_addNewAccessCode:forUserWithUUID:toAccessoriesWithUUIDs:withRetries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "addCompletionBlock:", v4);

}

void __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "anyModificationFailed:", v5);
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v12;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@At least one modification failed, so we will not remove the home access code.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
    }
    else
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v17;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory access code removals succeeded, so now removing the home access code.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(*(id *)(a1 + 32), "dataManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeHomeAccessCodeWithValue:removedByUserUUID:", *(_QWORD *)(a1 + 48), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_343;
      v25[3] = &unk_1E89C2210;
      v26 = *(id *)(a1 + 40);
      v27 = v5;
      objc_msgSend(v19, "addSuccessBlock:", v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v20;
      v23[1] = 3221225472;
      v23[2] = __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_2;
      v23[3] = &unk_1E89C2350;
      v24 = *(id *)(a1 + 40);
      v22 = (id)objc_msgSend(v21, "addFailureBlock:", v23);

    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to remove accessory access codes", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }

}

uint64_t __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_343(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __97__HMDAccessCodeManager__removeAccessCodeFromAccessoriesKeepingiCloudDataUponFailure_forUserUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

void __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0CB78C8];
  encodeRootObjectForIncomingXPCMessage(a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "respondWithPayload:", v4);

}

uint64_t __60__HMDAccessCodeManager__removeSimpleLabelAccessCodeMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

id __72__HMDAccessCodeManager__updateModificationRequestsWithUserOrGuestNames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v5)
  {
    objc_msgSend(v5, "accessCodeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

    objc_msgSend(*(id *)(a1 + 32), "dataManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "simpleLabelForAccessCode:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGuestName:", v17);

    objc_msgSend(*(id *)(a1 + 32), "dataManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "userUUIDForAccessCode:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserUUID:", v19);

    v20 = v9;
    goto LABEL_18;
  }
  if (v8)
  {
    v14 = v8;
LABEL_16:
    objc_msgSend(v14, "accessoryAccessCodeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessCodeValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (v11)
  {
    v14 = v11;
    goto LABEL_16;
  }
  v22 = (void *)MEMORY[0x1D17BA0A0]();
  v23 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v25;
    _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received modification request of unknown type", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  v26 = v9;
LABEL_18:

  return v9;
}

void __72__HMDAccessCodeManager__submitAccessCodeModificationRequestsForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "_updateCacheWithModificationResponses:", v5));
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to client with modification response values: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(void **)(a1 + 40);
    v18 = *MEMORY[0x1E0CB78C8];
    encodeRootObjectForIncomingXPCMessage(v5, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "respondWithPayload:", v13, v18);

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform modification requests with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }

}

void __62__HMDAccessCodeManager__fetchAccessCodeConstraintsForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Responding with constraints: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = *(void **)(a1 + 40);
    v16 = *MEMORY[0x1E0CB78E0];
    encodeRootObjectForIncomingXPCMessage(v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "respondWithPayload:", v14, v16);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to read access code constraints with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }

}

void __52__HMDAccessCodeManager__fetchAccessCodesForMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userForMessage:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateCacheWithFetchResponses:", v5);

      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "utilities"), "filteredFetchResponses:forUser:", v5, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v14;
        v32 = 2112;
        v33 = v10;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding to message with fetch responses: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v15 = *(void **)(a1 + 40);
      v28 = *MEMORY[0x1E0CB78E8];
      encodeRootObjectForIncomingXPCMessage(v10, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "respondWithPayload:", v17, v28);

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17BA0A0]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v31 = v25;
        v32 = 2112;
        v33 = v26;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine which user sent the message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v27 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "respondWithError:", v10);
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to read access codes with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }

}

uint64_t __83__HMDAccessCodeManager_hasCurrentUserAccessCodeChangedWithChangedAccessCodes_home___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "userInformationValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  return v7;
}

uint64_t __71__HMDAccessCodeManager_handleHomeDidDisableCharacteristicNotification___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling home did disable characteristic notification", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "setHomeAppForegrounded:", 0);
}

void __79__HMDAccessCodeManager_handleAccessorySupportsAccessCodeDidChangeNotification___block_invoke(id *a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  if (objc_msgSend(a1[4], "supportsAccessCode")
    && objc_msgSend(a1[4], "wasUpdatedWithServiceType:", CFSTR("00000260-0000-1000-8000-0026BB765291"))
    && (objc_msgSend(a1[4], "hasPostedBulletinForAccessCodeOnboarding") & 1) == 0)
  {
    objc_msgSend(a1[5], "context");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasHomeOnboardedForAccessCodes") & 1) == 0
      && objc_msgSend(a1[6], "isAdminUser"))
    {
      objc_msgSend(a1[5], "context");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "isCurrentDeviceWatch");

      if ((v3 & 1) != 0)
        return;
      objc_msgSend(a1[4], "setHasPostedBulletinForAccessCodeOnboarding:", 1);
      objc_msgSend(a1[5], "context");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bulletinBoard");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertLockOnboardingBulletinForHome:serviceType:", a1[6], CFSTR("00000260-0000-1000-8000-0026BB765291"));

    }
  }
}

void __58__HMDAccessCodeManager_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
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
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDUserNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v9;
    v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling removed user: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "accessCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v25;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Removed user does not have an access code, so nothing to do.", buf, 0xCu);

    }
    goto LABEL_15;
  }
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v11, "dataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CBA530];
  objc_msgSend(v5, "accessCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "homeAccessCodeValueWithStringValue:userUUID:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessCodeDataManager:didRemoveHomeAccessCodes:removedByUserUUID:", v12, v17, 0);

  objc_msgSend(*(id *)(a1 + 40), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v18, "isCurrentDevicePrimaryResident");

  if ((v11 & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "context");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "isCurrentDevicePrimaryResident");
      HMFBooleanToString();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = v30;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Not removing access codes for removed user since isCurrentDevicePrimaryResident: %@", buf, 0x16u);

    }
LABEL_15:
    objc_autoreleasePoolPop(v22);
    goto LABEL_16;
  }
  v19 = *(void **)(a1 + 40);
  objc_msgSend(v5, "accessCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v19, "_removeAccessCode:forUserBeingRemoved:", v20, v5);

LABEL_16:
}

BOOL __68__HMDAccessCodeManager_handleConfirmDataHasSyncedToResidentMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapAccessoryWithUUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

void __63__HMDAccessCodeManager_handleGenerateNewUserAccessCodeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *MEMORY[0x1E0CB78C8];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateCacheWithModificationResponses:", v11);
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v7);

}

void __63__HMDAccessCodeManager_handleResetAccessoryAccessCodesMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *MEMORY[0x1E0CB78C8];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateCacheWithModificationResponses:", v11);
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v7);

}

void __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_2;
  v4[3] = &unk_1E89C0E20;
  v5 = v3;
  if ((objc_msgSend(WeakRetained, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v5, v4) & 1) == 0)
    objc_msgSend(WeakRetained, "_fetchAccessCodeConstraintsForMessage:", *(_QWORD *)(a1 + 32));

}

void __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Data never synced to the resident for accessories: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "respondWithError:", v10);

}

uint64_t __64__HMDAccessCodeManager_handleFetchAccessCodeConstraintsMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", a3, a2);
}

void __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_2;
  v9 = &unk_1E89BF4F0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10 = *(id *)(a1 + 32);
  if ((objc_msgSend(WeakRetained, "_redispatchToResidentIfNeccesaryForMessage:withNewResponseHandler:", v5, &v6) & 1) == 0)
    objc_msgSend(WeakRetained, "_fetchAccessCodesForMessage:", *(_QWORD *)(a1 + 32), v6, v7, v8, v9);

  objc_destroyWeak(&v11);
}

void __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Data never synced to the resident for accessories: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "respondWithError:", v10);

}

void __54__HMDAccessCodeManager_handleFetchAccessCodesMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *MEMORY[0x1E0CB78E8];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "dataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateCacheWithFetchResponses:", v11);

  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v7);
}

void __58__HMDAccessCodeManager_handleRemoveHomeAccessCodeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
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

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove home access code with error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "respondWithSuccess");
  }

}

void __56__HMDAccessCodeManager_handleSetUserInformationMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to set userInfo: %@, with error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __65__HMDAccessCodeManager_handleRemoveSimpleLabelAccessCodeMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *MEMORY[0x1E0CB78C8];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateCacheWithModificationResponses:", v11);
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v7);

}

void __58__HMDAccessCodeManager_handleSetAccessCodeForUserMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *MEMORY[0x1E0CB78C8];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateCacheWithModificationResponses:", v11);
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v7);

}

void __74__HMDAccessCodeManager_handleSubmitAccessCodeModificationRequestsMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = *MEMORY[0x1E0CB78C8];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_updateCacheWithModificationResponses:", v11);
  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", v6, v7);

}

void __78__HMDAccessCodeManager_fetchAccessCodeForIdentifier_accessoryUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Fetched access code for access code identifier: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

  }
  else
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to fetch access code for access code identifier: %@ with error: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __35__HMDAccessCodeManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v110;
  logCategory__hmf_once_v110 = v0;

}

@end
