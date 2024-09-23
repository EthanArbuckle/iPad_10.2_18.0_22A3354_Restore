@implementation HMDClientConnection

- (HMDClientConnection)initWithHomeManager:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDClientConnection *v11;
  HMDClientConnection *v12;
  uint64_t v13;
  NSMutableArray *commandsBeingExecuted;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDClientConnection;
  v11 = -[HMDClientConnection init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_homeManager, v8);
    objc_storeStrong((id *)&v12->_workQueue, a4);
    objc_storeStrong((id *)&v12->_msgDispatcher, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    commandsBeingExecuted = v12->_commandsBeingExecuted;
    v12->_commandsBeingExecuted = (NSMutableArray *)v13;

    -[HMDClientConnection _registerForMessages](v12, "_registerForMessages");
  }

  return v12;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCBackgroundMessagePolicy policyWithEntitlementRequirement:](HMDXPCBackgroundMessagePolicy, "policyWithEntitlementRequirement:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDClientConnection msgDispatcher](self, "msgDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CBACA0], self, v5, sel__handleSiriIntentRequest_);

  v20[0] = v3;
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDClientConnection msgDispatcher](self, "msgDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8B68], self, v7, sel__handleSiriCommand_);

  -[HMDClientConnection msgDispatcher](self, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", *MEMORY[0x1E0CB8B70], self, v7, sel__handleSiriSyncDataRequest_);

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "productClass");

  if (v11 == 6)
  {
    -[HMDClientConnection msgDispatcher](self, "msgDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CB8B60];
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v18 = *MEMORY[0x1E0CB81C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCiCloudSwitchMessagePolicy policyWithBundleIdentifiers:](HMDXPCiCloudSwitchMessagePolicy, "policyWithBundleIdentifiers:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", v13, self, v17, sel__handleIdmsAccountUsernameModified_);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDClientConnection msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDClientConnection;
  -[HMDClientConnection dealloc](&v4, sel_dealloc);
}

- (void)_handleSiriCommand:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDClientConnection *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDClientConnection *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id val;
  void *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id from;
  id location;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D28540]);
  v6 = (void *)MEMORY[0x1E0CB3940];
  MEMORY[0x1D17B8D08](self, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@, %s:%ld"), v7, "/Library/Caches/com.apple.xbs/Sources/HomeKit_executables_legacy/Sources/homed/Messaging/XPC/HMDClientConnection.m", 121);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v5, "initWithName:", v8);

  -[HMDClientConnection homeManager](self, "homeManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "accessoryBrowser");
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "beginActiveAssertionWithReason:", v9);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "messagePayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kSiriCommandKey"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "deserializeObjectWithData:allowedClass:frameworkClasses:", v43, objc_opt_class(), &unk_1E8B32190);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHomeManager:", v45);
  objc_msgSend(v11, "aceId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setClientMetricIdentifier:", v12);

  objc_msgSend(v46, "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "UUIDString");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aceId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serverValidity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hm_shortDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v59 = v16;
    v60 = 2114;
    v61 = v17;
    v62 = 2114;
    v63 = v18;
    v64 = 2114;
    v65 = v19;
    v66 = 2112;
    v67 = v20;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Incoming Siri command(%{public}@) serverValidity %{public}@:\n%@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v13);
  v21 = objc_msgSend(v45, "isDataSyncInProgressWithMessage:", v46);
  if ((v21 & 1) != 0
    || +[HMDDeviceCapabilities supportsDeviceLock](HMDDeviceCapabilities, "supportsDeviceLock")
    && isDeviceLocked()
    && (objc_msgSend(v45, "isAccessAllowedWhenLocked") & 1) == 0)
  {
    -[HMDClientConnection commandsBeingExecuted](v14, "commandsBeingExecuted");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count") == 0;

    if (v23)
      objc_msgSend(val, "endActiveAssertion:", v40);
    v24 = objc_alloc_init(MEMORY[0x1E0D880C0]);
    v25 = v24;
    if (v21)
    {
      objc_msgSend(v24, "setCommandOutcome:", *MEMORY[0x1E0D88920]);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActionResults:", v26);
      v27 = CFSTR("Data sync in progress");
    }
    else
    {
      objc_msgSend(v24, "setCommandOutcome:", *MEMORY[0x1E0D88910]);
      v26 = objc_alloc_init(MEMORY[0x1E0D880B0]);
      objc_msgSend(v26, "setOutcome:", *MEMORY[0x1E0D88770]);
      v57 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActionResults:", v31);

      v27 = CFSTR("HomeKit access not allowed when device is locked");
    }

    objc_msgSend(v25, "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = v14;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "aceId");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hm_headerDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v59 = v36;
      v60 = 2112;
      v61 = v27;
      v62 = 2112;
      v63 = v37;
      v64 = 2112;
      v65 = v38;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@%@ - response for Siri command(%@): %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(v46, "responseHandler");
    v39 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v39)[2](v39, 0, v32);

  }
  else
  {
    -[HMDClientConnection workQueue](v14, "workQueue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDClientConnection msgDispatcher](v14, "msgDispatcher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAssistantCommandExecutor executorWithCommand:workQueue:messageDispatcher:](HMDAssistantCommandExecutor, "executorWithCommand:workQueue:messageDispatcher:", v11, v28, v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDClientConnection commandsBeingExecuted](v14, "commandsBeingExecuted");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v25);

    objc_initWeak((id *)buf, v14);
    objc_initWeak(&location, val);
    objc_initWeak(&from, v25);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __42__HMDClientConnection__handleSiriCommand___block_invoke;
    v47[3] = &unk_1E89B49D8;
    objc_copyWeak(&v52, (id *)buf);
    objc_copyWeak(&v53, &from);
    objc_copyWeak(&v54, &location);
    v48 = v41;
    v49 = v11;
    v50 = v46;
    v51 = v40;
    objc_msgSend(v25, "performWithCompletion:", v47);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_handleSiriSyncDataRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDClientConnection homeManager](self, "homeManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSiriSyncDataRequest:", v4);

}

- (void)_handleSiriIntentRequest:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  HMDAssistantIntent *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  void *v11;
  void *v12;
  HMDClientConnection *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  HMDClientConnection *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDClientConnection *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", *MEMORY[0x1E0CBAC98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v33);
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = v33;
    if (v6)
    {
      v8 = -[HMDAssistantIntent initWithIntent:]([HMDAssistantIntent alloc], "initWithIntent:", v6);
      -[HMDClientConnection homeManager](self, "homeManager");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isDataSyncInProgressWithMessage:", v4);
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CBACA8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unsignedIntegerValue");

      HMStringFromIntentRequestType();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
      if (v10)
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          HMINControlHomeIntentShortDescription();
          v16 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = v30;
          v36 = 2112;
          v37 = v32;
          v38 = 2112;
          v39 = v16;
          v17 = (void *)v16;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Error - Data sync in progress - Unable to %@ intent [ %@ ] ", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 77);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v19)[2](v19, v18, 0);

      }
      else
      {
        if (v15)
        {
          HMFGetLogIdentifier();
          v31 = v12;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          HMINControlHomeIntentShortDescription();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = v28;
          v36 = 2112;
          v37 = v32;
          v38 = 2112;
          v39 = (uint64_t)v29;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Received to %@ intent: [ %@ ]", buf, 0x20u);

          v12 = v31;
        }

        objc_autoreleasePoolPop(v12);
        objc_msgSend(v9, "gatherer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAssistantIntent performWithGather:message:](v8, "performWithGather:message:", v18, v4);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v27;
        v36 = 2112;
        v37 = v7;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Failed to unarchive control home intent from the message payload data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v8 = (HMDAssistantIntent *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, HMDAssistantIntent *, _QWORD))v9)[2](v9, v8, 0);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Error - Did not get the intent", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v6)[2](v6, v7, 0);
  }

}

- (void)_handleIdmsAccountUsernameModified:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "productClass");

  if (v5 == 6)
    logAndPostNotification(CFSTR("HMDHomeManagerIDMSAccountUsernameDidUpdateNotification"), self, 0);
  objc_msgSend(v6, "respondWithPayload:", 0);

}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_msgSend(MEMORY[0x1E0CBA490], "UUID");
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)commandsBeingExecuted
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandsBeingExecuted, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
}

void __42__HMDClientConnection__handleSiriCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = objc_loadWeakRetained((id *)(a1 + 72));
  v46 = objc_loadWeakRetained((id *)(a1 + 80));
  if (v5)
  {
    v41 = v8;
    v44 = v6;
    v45 = v5;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D880C0]), "initWithDictionary:", v5);
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v42 = WeakRetained;
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hm_headerDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v53 = v13;
      v54 = 2114;
      v55 = v14;
      v56 = 2114;
      v57 = v15;
      v58 = 2114;
      v59 = v16;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Outgoing Response for Siri command(%{public}@): %{public}@", buf, 0x2Au);

    }
    v43 = a1;

    objc_autoreleasePoolPop(v10);
    v40 = v9;
    objc_msgSend(v9, "hm_contentDescription");
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1D17BA0A0]();
          v24 = v11;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v53 = v26;
            v54 = 2112;
            v55 = v22;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@%@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v19);
    }

    v6 = v44;
    v5 = v45;
    WeakRetained = v42;
    a1 = v43;
    v8 = v41;
    if (!v44)
      goto LABEL_21;
LABEL_18:
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = WeakRetained;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v53 = v34;
      v54 = 2114;
      v55 = v35;
      v56 = 2114;
      v57 = v6;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Error executing Siri command: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v31);
    goto LABEL_21;
  }
  v27 = (void *)MEMORY[0x1D17BA0A0]();
  v28 = WeakRetained;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v53 = v30;
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Nil response for Siri command", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v27);
  if (v6)
    goto LABEL_18;
LABEL_21:
  objc_msgSend(*(id *)(a1 + 48), "responseHandler");
  v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))v36)[2](v36, v6, v5);

  if (v8)
  {
    objc_msgSend(WeakRetained, "commandsBeingExecuted");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeObject:", v8);

    objc_msgSend(WeakRetained, "commandsBeingExecuted");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (!v39)
      objc_msgSend(v46, "endActiveAssertion:", *(_QWORD *)(a1 + 56));
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_119613 != -1)
    dispatch_once(&logCategory__hmf_once_t10_119613, &__block_literal_global_119614);
  return (id)logCategory__hmf_once_v11_119615;
}

void __34__HMDClientConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_119615;
  logCategory__hmf_once_v11_119615 = v0;

}

@end
