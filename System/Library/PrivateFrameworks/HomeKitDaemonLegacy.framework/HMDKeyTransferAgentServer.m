@implementation HMDKeyTransferAgentServer

- (HMDKeyTransferAgentServer)initWithHomeManager:(id)a3
{
  id v4;
  HMDKeyTransferAgentServer *v5;
  void *v6;
  HMDKeyTransferAgentServer *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSUUID *currentKeyUUID;
  NSMutableSet *v12;
  NSMutableSet *broadcastNotifiedDevices;
  dispatch_group_t v14;
  OS_dispatch_group *broadcastGroup;
  id v16;
  uint64_t v17;
  HMFExponentialBackoffTimer *broadcastUUIDTimer;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDRemoteAccountMessageFilter *v23;
  void *v24;
  HMDRemoteAccountMessageFilter *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HMDKeyTransferAgentServer;
  v5 = -[HMDKeyTransferAgent initWithHomeManager:](&v32, sel_initWithHomeManager_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Creating KeyTransferAgent", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    currentKeyUUID = v7->_currentKeyUUID;
    v7->_currentKeyUUID = (NSUUID *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    broadcastNotifiedDevices = v7->_broadcastNotifiedDevices;
    v7->_broadcastNotifiedDevices = v12;

    v14 = dispatch_group_create();
    broadcastGroup = v7->_broadcastGroup;
    v7->_broadcastGroup = (OS_dispatch_group *)v14;

    v7->_broadcastFailure = 0;
    v16 = objc_alloc(MEMORY[0x1E0D28578]);
    v17 = objc_msgSend(v16, "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 2, 5, 30.0, *(double *)&keyTransferBroadcastMaximumDelay);
    broadcastUUIDTimer = v7->_broadcastUUIDTimer;
    v7->_broadcastUUIDTimer = (HMFExponentialBackoffTimer *)v17;

    -[HMFExponentialBackoffTimer setDelegate:](v7->_broadcastUUIDTimer, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v7, sel___deviceAddedToAccount_, CFSTR("HMDAccountAddedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, sel___deviceUpdated_, CFSTR("HMDDeviceUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v7, sel___deviceRemovedFromAccount_, CFSTR("HMDAccountRemovedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v7, sel___resetTimer_, CFSTR("HMDHomeManagerKeyTransferResetTimerNotification"), 0);

    v23 = [HMDRemoteAccountMessageFilter alloc];
    -[HMDKeyTransferAgent messageDestination](v7, "messageDestination");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HMDRemoteAccountMessageFilter initWithTarget:](v23, "initWithTarget:", v24);

    objc_msgSend(v4, "msgFilterChain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addMessageFilter:", v25);

    +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRequiresSecureMessage:", 0);
    objc_msgSend(v27, "setRequiresAccountMessage:", 1);
    objc_msgSend(v27, "setTransportRestriction:", -1);
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v4, "messageDispatcher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "registerForMessage:receiver:policies:selector:", CFSTR("kKeyTransferAgentKey"), v7, v30, sel__handleKeyTransferAgentMessage_);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDKeyTransferAgent homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDKeyTransferAgentServer;
  -[HMDKeyTransferAgentServer dealloc](&v6, sel_dealloc);
}

- (void)resetConfig
{
  void *v3;
  HMDKeyTransferAgentServer *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting Configuration (resetting any hosts we've broadcast keys to).", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDKeyTransferAgent workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMDKeyTransferAgentServer_resetConfig__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (BOOL)_startAdvertiseUUIDWithError:(id *)a3
{
  void *v5;
  void *v6;
  HMDKeyTransferAgentServer *v7;
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
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMDKeyTransferAgentServer _httpMessageTransport](self, "_httpMessageTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDKeyTransferAgentServer currentKeyUUID](v7, "currentKeyUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v9;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Beginning UUID Advertisement (%@)", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDKeyTransferAgentServer currentKeyUUID](v7, "currentKeyUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTXTRecordValue:forKey:", v14, CFSTR("uuid"));

  -[HMDKeyTransferAgent homeManager](v7, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startLocalTransport");

  -[HMDKeyTransferAgentServer _httpMessageTransport](v7, "_httpMessageTransport");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setServerEnabled:", 1);

  -[HMDKeyTransferAgentServer broadcastNotifiedDevices](v7, "broadcastNotifiedDevices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllObjects");

  -[HMDKeyTransferAgentServer broadcastUUIDTimer](v7, "broadcastUUIDTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reset");

  -[HMDKeyTransferAgentServer broadcastUUIDTimer](v7, "broadcastUUIDTimer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resume");

  if (a3)
    *a3 = 0;

  return 1;
}

- (BOOL)_endAdvertiseUUIDWithError:(id *)a3
{
  void *v5;
  void *v6;
  HMDKeyTransferAgentServer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDKeyTransferAgentServer _httpMessageTransport](self, "_httpMessageTransport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDKeyTransferAgentServer currentKeyUUID](v7, "currentKeyUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Ending UUID Advertisement (%@)", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "removeTXTRecordValueForKey:", CFSTR("uuid"));
  -[HMDKeyTransferAgentServer broadcastUUIDTimer](v7, "broadcastUUIDTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "suspend");

  -[HMDKeyTransferAgentServer broadcastUUIDTimer](v7, "broadcastUUIDTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reset");

  if (a3)
    *a3 = 0;

  return 1;
}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDKeyTransferAgent workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_device:(id)a3 addedToAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  HMDKeyTransferAgentServer *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || !v7
    || (+[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "account"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v7, "isEqual:", v11),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      objc_autoreleasePoolPop(v14);
      goto LABEL_12;
    }
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v22;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v23;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not added / updated from current account %@.", (uint8_t *)&v24, 0x20u);

LABEL_10:
    goto LABEL_11;
  }
  -[HMDKeyTransferAgent progressState](self, "progressState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (!v17)
      goto LABEL_11;
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v22;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Not actively transferring keys. Ignoring device change message.", (uint8_t *)&v24, 0xCu);
    goto LABEL_10;
  }
  if (v17)
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v18;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was added to the current account (restarting broadcast timer)", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDKeyTransferAgentServer broadcastNotifiedDevices](v15, "broadcastNotifiedDevices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObject:", v6);

  -[HMDKeyTransferAgentServer broadcastUUIDTimer](v15, "broadcastUUIDTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reset");

  -[HMDKeyTransferAgentServer broadcastUUIDTimer](v15, "broadcastUUIDTimer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resume");

LABEL_12:
}

- (void)__deviceAddedToAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMDKeyTransferAgentServer___deviceAddedToAccount___block_invoke;
  block[3] = &unk_1E89BE218;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__deviceUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDKeyTransferAgentServer___deviceUpdated___block_invoke;
  block[3] = &unk_1E89BE218;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_device:(id)a3 removedFromAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMDKeyTransferAgentServer *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDKeyTransferAgentServer *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && v7
    && (+[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "account"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v7, "isEqual:", v11),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Got notification that %@ was removed from the current account", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDKeyTransferAgentServer broadcastNotifiedDevices](v14, "broadcastNotifiedDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v6);

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v21;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Device %@ not removed from current account %@.", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)__deviceRemovedFromAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMDKeyTransferAgentServer___deviceRemovedFromAccount___block_invoke;
  block[3] = &unk_1E89BE218;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)__resetTimer:(id)a3
{
  id v4;
  void *v5;
  HMDKeyTransferAgentServer *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting Key Transfer Agent.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDKeyTransferAgent workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HMDKeyTransferAgentServer___resetTimer___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = v6;
  dispatch_async(v9, block);

}

- (id)_httpMessageTransport
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDKeyTransferAgent homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureRemoteTransport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v4, "transports", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)beginPairingWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_endPairingWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDKeyTransferAgentServer *v9;

  v4 = a3;
  -[HMDKeyTransferAgent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HMDKeyTransferAgentServer__endPairingWithError___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleKeyTransferAgentMessage:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  HMDKeyTransferAgentServer *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  void *v30;
  HMDKeyTransferAgentServer *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  HMDKeyTransferAgentServer *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  HMDKeyTransferAgentServer *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDKeyTransferAgentServer *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  int v71;
  void *v72;
  HMDKeyTransferAgentServer *v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  HMDKeyTransferAgentServer *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  HMDKeyTransferAgentServer *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  char v98;
  id v99;
  void *v100;
  void (**v101)(_QWORD, _QWORD, _QWORD);
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void (**v108)(_QWORD, _QWORD, _QWORD);
  void *v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  int v114;
  void *v115;
  HMDKeyTransferAgentServer *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  HMDKeyTransferAgentServer *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  HMDKeyTransferAgentServer *v124;
  NSObject *v125;
  void *v126;
  void *v127;
  void *v128;
  HMDKeyTransferAgentServer *v129;
  NSObject *v130;
  void *v131;
  void *v132;
  HMDKeyTransferAgentServer *v133;
  NSObject *v134;
  void *v135;
  void *v136;
  char v137;
  void *v138;
  HMDKeyTransferAgentServer *v139;
  NSObject *v140;
  _BOOL4 v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *j;
  void *v151;
  void *v152;
  int v153;
  void *v154;
  HMDKeyTransferAgentServer *v155;
  NSObject *v156;
  void *v157;
  void *v158;
  void *v159;
  HMDRemoteDeviceMessageDestination *v160;
  void *v161;
  HMDRemoteDeviceMessageDestination *v162;
  HMDRemoteMessage *v163;
  void *v164;
  HMDRemoteMessage *v165;
  HMDRemoteDeviceMessageDestination *v166;
  void *v167;
  void *v168;
  void *v169;
  HMDKeyTransferAgentServer *v170;
  NSObject *v171;
  void *v172;
  id v173;
  void (**v174)(_QWORD, _QWORD, _QWORD);
  id v175;
  void *v176;
  void *v177;
  id v178;
  id v179;
  void *v180;
  uint64_t v181;
  void *v182;
  HMDKeyTransferAgentServer *v183;
  id v184;
  id obj;
  id obja;
  id objb;
  id v188;
  _QWORD v189[4];
  HMDRemoteDeviceMessageDestination *v190;
  id v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  const __CFString *v205;
  void *v206;
  _BYTE v207[128];
  _QWORD v208[3];
  _QWORD v209[3];
  _QWORD v210[2];
  _QWORD v211[2];
  _BYTE v212[128];
  const __CFString *v213;
  void *v214;
  uint8_t buf[4];
  void *v216;
  __int16 v217;
  id v218;
  __int16 v219;
  void *v220;
  uint64_t v221;

  v221 = *MEMORY[0x1E0C80C00];
  v184 = a3;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v183 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v216 = v6;
    v217 = 2112;
    v218 = v184;
    v219 = 2112;
    v220 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Got Message: %@ / %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportIncomingLoxyMessage:", v9);

  objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("request_uuid"));

  -[HMDKeyTransferAgent progressState](v183, "progressState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {

    if (v13)
    {
      v213 = CFSTR("uuid");
      -[HMDKeyTransferAgentServer currentKeyUUID](v183, "currentKeyUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v214, &v213, 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (id)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(v184, "responseHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v184, "responseHandler");
      v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v29)[2](v29, 0, v16);

    }
    goto LABEL_99;
  }
  v17 = v12 == 0;

  if (!v17)
  {
    -[HMDKeyTransferAgent homeManager](v183, "homeManager");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ping"));

    if (v19)
    {
      -[HMDKeyTransferAgent progressState](v183, "progressState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

      if ((v22 & 1) == 0)
      {
        v52 = (void *)MEMORY[0x1D17BA0A0]();
        v53 = v183;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v216 = v55;
          _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (A0)", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v52);
        objc_msgSend(v184, "responseHandler");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
          goto LABEL_96;
        goto LABEL_97;
      }
      if ((objc_msgSend(v184, "remoteRestriction") & 2) == 0)
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v183;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v216 = v26;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (A1)", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(v184, "responseHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
LABEL_96:
          objc_msgSend(v184, "responseHandler");
          v188 = (id)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, _QWORD))v188 + 2))(v188, 0, MEMORY[0x1E0C9AA70]);
LABEL_80:
          v16 = 0;
          goto LABEL_81;
        }
LABEL_97:
        v16 = 0;
        goto LABEL_98;
      }
      v203 = 0u;
      v204 = 0u;
      v201 = 0u;
      v202 = 0u;
      objc_msgSend(v182, "homes");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v201, v212, 16);
      if (v57)
      {
        v188 = 0;
        v58 = *(_QWORD *)v202;
        do
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v202 != v58)
              objc_enumerationMutation(obj);
            v60 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * i);
            objc_msgSend(v60, "primaryResident");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "device");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "device");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v62, "isEqual:", v64);

            if (v65)
            {
              objc_msgSend(v60, "primaryResident");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "device");
              v67 = objc_claimAutoreleasedReturnValue();

              v188 = (id)v67;
            }
          }
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v201, v212, 16);
        }
        while (v57);

        v68 = (void *)MEMORY[0x1E0CB37E8];
        if (v188)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_77:
          objc_msgSend(v184, "responseHandler");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (v107)
          {
            objc_msgSend(v184, "responseHandler");
            v108 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v210[0] = CFSTR("phase");
            v210[1] = CFSTR("data");
            v211[0] = CFSTR("ping");
            v211[1] = v69;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v211, v210, 2);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, _QWORD, void *))v108)[2](v108, 0, v109);

          }
          -[HMDKeyTransferAgent setProgressState:](v183, "setProgressState:", CFSTR("send_public"));

          goto LABEL_80;
        }
      }
      else
      {

        v68 = (void *)MEMORY[0x1E0CB37E8];
      }
      objc_msgSend(v182, "homes");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "numberWithBool:", objc_msgSend(v106, "count") == 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v188 = 0;
      goto LABEL_77;
    }
    objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("send_public"));

    if (v36)
    {
      -[HMDKeyTransferAgent progressState](v183, "progressState");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if ((v39 & 1) == 0)
      {
        v78 = (void *)MEMORY[0x1D17BA0A0]();
        v79 = v183;
        HMFGetOSLogHandle();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v216 = v81;
          _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (B0)", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v78);
        objc_msgSend(v184, "responseHandler");
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        if (v82)
          goto LABEL_96;
        goto LABEL_97;
      }
      if ((objc_msgSend(v184, "remoteRestriction") & 1) == 0)
      {
        v40 = (void *)MEMORY[0x1D17BA0A0]();
        v41 = v183;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v216 = v43;
          _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (B1)", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v40);
        objc_msgSend(v184, "responseHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
          goto LABEL_96;
        goto LABEL_97;
      }
      objc_msgSend(v184, "messagePayload");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "hmf_stringForKey:", CFSTR("kControllerPairingNameKey"));
      obja = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v184, "messagePayload");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "hmf_dataForKey:", CFSTR("kControllerKeyPairKey"));
      v180 = (void *)objc_claimAutoreleasedReturnValue();

      v178 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v180);
      v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D165A8]), "initWithIdentifier:publicKey:privateKey:permissions:", obja, v178, 0, 0);
      objc_msgSend(v184, "destination");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v92 = v91;
      else
        v92 = 0;
      v93 = v92;

      if (v90 && v93)
      {
        +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "device");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "account");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "registerIdentity:account:object:", v90, v96, v183);

        objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = 0;
        v200 = 0;
        v198 = 0;
        v98 = objc_msgSend(v97, "getControllerPublicKey:secretKey:username:allowCreation:error:", &v200, 0, &v199, 1, &v198);
        v99 = v200;
        v188 = v199;
        v16 = v198;

        if ((v98 & 1) != 0)
        {
          -[HMDKeyTransferAgent setProgressState:](v183, "setProgressState:", CFSTR("send_private"));
          objc_msgSend(v184, "responseHandler");
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v100)
          {
LABEL_105:

            goto LABEL_81;
          }
          objc_msgSend(v184, "responseHandler");
          v101 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v208[0] = CFSTR("phase");
          v208[1] = CFSTR("kControllerKeyPairKey");
          v209[0] = CFSTR("reply_public");
          v209[1] = v99;
          v208[2] = CFSTR("kControllerPairingNameKey");
          v209[2] = v188;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v209, v208, 3);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v101)[2](v101, 0, v102);

        }
        else
        {
          v128 = (void *)MEMORY[0x1D17BA0A0]();
          v129 = v183;
          HMFGetOSLogHandle();
          v130 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v216 = v131;
            v217 = 2112;
            v218 = v16;
            _os_log_impl(&dword_1CD062000, v130, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate ATV public / private key pair: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v128);
          -[HMDKeyTransferAgentServer _endPairingWithError:](v129, "_endPairingWithError:", v16);
          objc_msgSend(v184, "responseHandler");
          v101 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, _QWORD))v101)[2](v101, v16, 0);
        }
      }
      else
      {
        v119 = (void *)MEMORY[0x1D17BA0A0]();
        v120 = v183;
        HMFGetOSLogHandle();
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v216 = v122;
          _os_log_impl(&dword_1CD062000, v121, OS_LOG_TYPE_ERROR, "%{public}@Did not get valid username / public key from IOs device.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v119);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        -[HMDKeyTransferAgentServer _endPairingWithError:](v120, "_endPairingWithError:", v16);
        objc_msgSend(v184, "responseHandler");
        v101 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, _QWORD))v101)[2](v101, v16, 0);
        v99 = 0;
        v188 = 0;
      }

      goto LABEL_105;
    }
    objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("send_private"));

    if (v46)
    {
      if ((objc_msgSend(v184, "isSecureRemote") & 1) != 0)
      {
        if ((objc_msgSend(v184, "remoteRestriction") & 2) != 0)
        {
          -[HMDKeyTransferAgent progressState](v183, "progressState");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = objc_msgSend(v110, "isEqual:", v111);

          if ((v112 & 1) != 0)
          {
            objc_msgSend(v184, "dataForKey:", CFSTR("kControllerKeyPairKey"));
            v188 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v184, "stringForKey:", CFSTR("kControllerPairingNameKey"));
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            if (v188 && v176)
            {
              objc_msgSend(v184, "respondWithPayload:", 0);
              objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v196 = 0;
              v197 = 0;
              v114 = objc_msgSend(v113, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", 0, 0, 0, &v197, 0, &v196);
              v173 = v197;
              v16 = v196;

              if (v114 && objc_msgSend(v173, "isEqualToString:", v176))
              {
                v115 = (void *)MEMORY[0x1D17BA0A0]();
                v116 = v183;
                HMFGetOSLogHandle();
                v117 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v216 = v118;
                  _os_log_impl(&dword_1CD062000, v117, OS_LOG_TYPE_DEFAULT, "%{public}@Already have key, rejecting message and not processing further.", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v115);
              }
              else
              {
                v137 = objc_msgSend(v182, "_removeAndAddKeyPair:userName:eraseReason:", v188, v176, 1, v173);

                v138 = (void *)MEMORY[0x1D17BA0A0]();
                v139 = v183;
                HMFGetOSLogHandle();
                v140 = objc_claimAutoreleasedReturnValue();
                v141 = os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT);
                if ((v137 & 1) != 0)
                {
                  if (v141)
                  {
                    HMFGetLogIdentifier();
                    v142 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v216 = v142;
                    _os_log_impl(&dword_1CD062000, v140, OS_LOG_TYPE_DEFAULT, "%{public}@Received new key and successfully added it.", buf, 0xCu);

                  }
                  objc_autoreleasePoolPop(v138);
                  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v143, "updateActiveControllerPairingIdentifier:", v176);

                  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v144, "device");
                  v145 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "identifier");
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "UUIDString");
                  v177 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v177)
                  {
                    v194 = 0u;
                    v195 = 0u;
                    v192 = 0u;
                    v193 = 0u;
                    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v147, "account");
                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v148, "devices");
                    v149 = (void *)objc_claimAutoreleasedReturnValue();
                    v179 = (id)objc_msgSend(v149, "copy");

                    objb = (id)objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v192, v207, 16);
                    if (objb)
                    {
                      v181 = *(_QWORD *)v193;
                      do
                      {
                        for (j = 0; j != objb; j = (char *)j + 1)
                        {
                          if (*(_QWORD *)v193 != v181)
                            objc_enumerationMutation(v179);
                          v151 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * (_QWORD)j);
                          if ((objc_msgSend(v151, "isCurrentDevice") & 1) == 0)
                          {
                            objc_msgSend(v151, "capabilities");
                            v152 = (void *)objc_claimAutoreleasedReturnValue();
                            v153 = objc_msgSend(v152, "supportsKeyTransferClient");

                            if (v153)
                            {
                              v154 = (void *)MEMORY[0x1D17BA0A0]();
                              v155 = v139;
                              HMFGetOSLogHandle();
                              v156 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                              {
                                HMFGetLogIdentifier();
                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v151, "identifier");
                                v158 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v158, "UUIDString");
                                v159 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138543618;
                                v216 = v157;
                                v217 = 2112;
                                v218 = v159;
                                _os_log_impl(&dword_1CD062000, v156, OS_LOG_TYPE_DEFAULT, "%{public}@Broadcasting Completion to %@", buf, 0x16u);

                              }
                              objc_autoreleasePoolPop(v154);
                              v160 = [HMDRemoteDeviceMessageDestination alloc];
                              -[HMDKeyTransferAgent uuid](v155, "uuid");
                              v161 = (void *)objc_claimAutoreleasedReturnValue();
                              v162 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v160, "initWithTarget:device:", v161, v151);

                              v163 = [HMDRemoteMessage alloc];
                              v205 = CFSTR("data");
                              v206 = v177;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v206, &v205, 1);
                              v164 = (void *)objc_claimAutoreleasedReturnValue();
                              v165 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v163, "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("kResidentProvisioningStatusChangedNotificationKey"), v162, v164, 0, 0, 1, 0.0);

                              objc_initWeak((id *)buf, v155);
                              v189[0] = MEMORY[0x1E0C809B0];
                              v189[1] = 3221225472;
                              v189[2] = __60__HMDKeyTransferAgentServer__handleKeyTransferAgentMessage___block_invoke;
                              v189[3] = &unk_1E89BF4F0;
                              objc_copyWeak(&v191, (id *)buf);
                              v166 = v162;
                              v190 = v166;
                              -[HMDRemoteMessage setResponseHandler:](v165, "setResponseHandler:", v189);
                              objc_msgSend(v182, "messageDispatcher");
                              v167 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v167, "sendMessage:completionHandler:", v165, 0);

                              objc_destroyWeak(&v191);
                              objc_destroyWeak((id *)buf);

                            }
                          }
                        }
                        objb = (id)objc_msgSend(v179, "countByEnumeratingWithState:objects:count:", &v192, v207, 16);
                      }
                      while (objb);
                    }

                  }
                  else
                  {
                    v169 = (void *)MEMORY[0x1D17BA0A0]();
                    v170 = v139;
                    HMFGetOSLogHandle();
                    v171 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v172 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v216 = v172;
                      _os_log_impl(&dword_1CD062000, v171, OS_LOG_TYPE_DEFAULT, "%{public}@We lost our currentDevice (probably just got logged out unexpectedly).", buf, 0xCu);

                    }
                    objc_autoreleasePoolPop(v169);
                  }
                  -[HMDKeyTransferAgent setProgressState:](v139, "setProgressState:", 0);
                  objc_msgSend(v182, "_updateCloudDataSyncWithAccountState:", 1);

                  v16 = 0;
                }
                else
                {
                  if (v141)
                  {
                    HMFGetLogIdentifier();
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v216 = v168;
                    _os_log_impl(&dword_1CD062000, v140, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to save the key pair to keychain", buf, 0xCu);

                  }
                  objc_autoreleasePoolPop(v138);
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
                  v16 = (id)objc_claimAutoreleasedReturnValue();
                }
              }
              -[HMDKeyTransferAgentServer _endPairingWithError:](v183, "_endPairingWithError:", v16, v173);

            }
            else
            {
              v132 = (void *)MEMORY[0x1D17BA0A0]();
              v133 = v183;
              HMFGetOSLogHandle();
              v134 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v216 = v135;
                _os_log_impl(&dword_1CD062000, v134, OS_LOG_TYPE_ERROR, "%{public}@Key pair (or username) is missing the resident key sync message", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v132);
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
              v16 = (id)objc_claimAutoreleasedReturnValue();
              -[HMDKeyTransferAgentServer _endPairingWithError:](v133, "_endPairingWithError:", v16);
              objc_msgSend(v184, "responseHandler");
              v136 = (void *)objc_claimAutoreleasedReturnValue();

              if (v136)
              {
                objc_msgSend(v184, "responseHandler");
                v174 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, id, _QWORD))v174)[2](v174, v16, 0);

              }
            }

            goto LABEL_81;
          }
          v123 = (void *)MEMORY[0x1D17BA0A0]();
          v124 = v183;
          HMFGetOSLogHandle();
          v125 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v216 = v126;
            _os_log_impl(&dword_1CD062000, v125, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (C0)", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v123);
          objc_msgSend(v184, "responseHandler");
          v127 = (void *)objc_claimAutoreleasedReturnValue();

          if (v127)
            goto LABEL_96;
        }
        else
        {
          v47 = (void *)MEMORY[0x1D17BA0A0]();
          v48 = v183;
          HMFGetOSLogHandle();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v216 = v50;
            _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Out of order (C1)", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v47);
          objc_msgSend(v184, "responseHandler");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v51)
            goto LABEL_96;
        }
        goto LABEL_97;
      }
      v83 = (void *)MEMORY[0x1D17BA0A0]();
      v84 = v183;
      HMFGetOSLogHandle();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v216 = v86;
        _os_log_impl(&dword_1CD062000, v85, OS_LOG_TYPE_ERROR, "%{public}@Private key not receieved via secure remote message. Failing.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v83);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDKeyTransferAgentServer _endPairingWithError:](v84, "_endPairingWithError:", v16);
      objc_msgSend(v184, "responseHandler");
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v87)
        goto LABEL_98;
    }
    else
    {
      objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("broadcast"));

      v72 = (void *)MEMORY[0x1D17BA0A0]();
      v73 = v183;
      HMFGetOSLogHandle();
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = v74;
      if (!v71)
      {
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "stringForKey:", CFSTR("phase"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v216 = v103;
          v217 = 2112;
          v218 = v104;
          _os_log_impl(&dword_1CD062000, v75, OS_LOG_TYPE_ERROR, "%{public}@Unknown message key %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v72);
        objc_msgSend(v184, "responseHandler");
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v105)
          goto LABEL_97;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "responseHandler");
        v188 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, _QWORD))v188 + 2))(v188, v16, 0);
LABEL_81:

LABEL_98:
        goto LABEL_99;
      }
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v216 = v76;
        _os_log_impl(&dword_1CD062000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring broadcast key on server.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v72);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 3, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "responseHandler");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v77)
        goto LABEL_98;
    }
    objc_msgSend(v184, "responseHandler");
    v188 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))v188 + 2))(v188, v16, 0);
    goto LABEL_81;
  }
  v30 = (void *)MEMORY[0x1D17BA0A0]();
  v31 = v183;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v216 = v33;
    _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping message. Key transfer not in progress.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v30);
  objc_msgSend(v184, "responseHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v184, "responseHandler");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, MEMORY[0x1E0C9AA70]);
LABEL_99:

  }
}

- (NSUUID)currentKeyUUID
{
  return self->_currentKeyUUID;
}

- (void)setCurrentKeyUUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeyUUID, a3);
}

- (OS_dispatch_group)broadcastGroup
{
  return self->_broadcastGroup;
}

- (void)setBroadcastGroup:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastGroup, a3);
}

- (NSMutableSet)broadcastNotifiedDevices
{
  return self->_broadcastNotifiedDevices;
}

- (void)setBroadcastNotifiedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastNotifiedDevices, a3);
}

- (HMFExponentialBackoffTimer)broadcastUUIDTimer
{
  return self->_broadcastUUIDTimer;
}

- (void)setBroadcastUUIDTimer:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastUUIDTimer, a3);
}

- (BOOL)broadcastFailure
{
  return self->_broadcastFailure;
}

- (void)setBroadcastFailure:(BOOL)a3
{
  self->_broadcastFailure = a3;
}

- (id)finalCompletionHandler
{
  return self->_finalCompletionHandler;
}

- (void)setFinalCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalCompletionHandler, 0);
  objc_storeStrong((id *)&self->_broadcastUUIDTimer, 0);
  objc_storeStrong((id *)&self->_broadcastNotifiedDevices, 0);
  objc_storeStrong((id *)&self->_broadcastGroup, 0);
  objc_storeStrong((id *)&self->_currentKeyUUID, 0);
}

void __60__HMDKeyTransferAgentServer__handleKeyTransferAgentMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v14 = "%{public}@Unable to notify iOS device %@ that we have completed.";
LABEL_6:
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x16u);

    }
  }
  else if (v11)
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 138543618;
    v17 = v12;
    v18 = 2112;
    v19 = v15;
    v14 = "%{public}@Notified iOS device %@ that we have completed.";
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v8);
}

void __50__HMDKeyTransferAgentServer__endPairingWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v6)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v21 = 138543618;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    v9 = "%{public}@Key transfer ended with error: %@";
    v10 = v5;
    v11 = 22;
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v7;
    v9 = "%{public}@Key transfer ended with no issues.";
    v10 = v5;
    v11 = 12;
  }
  _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v21, v11);

LABEL_7:
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 40), "_endAdvertiseUUIDWithError:", 0);
  objc_msgSend(*(id *)(a1 + 40), "finalCompletionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "finalCompletionHandler");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v16[2](v16, *(_QWORD *)(a1 + 32));

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0](v13, v14, v15);
    v18 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Hit nil completion handler (this should not happen).", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }
}

void __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  _QWORD aBlock[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "progressState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke_32;
    aBlock[3] = &unk_1E89BFC88;
    v9 = *(id *)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v17 = v9;
    v10 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "setProgressState:", CFSTR("ping"));
    v11 = *(void **)(a1 + 32);
    v15 = 0;
    v12 = objc_msgSend(v11, "_startAdvertiseUUIDWithError:", &v15);
    v13 = v15;
    if ((v12 & 1) != 0)
    {
      v14 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(*(id *)(a1 + 32), "setFinalCompletionHandler:", v14);

    }
    else
    {
      (*((void (**)(void *, id))v10 + 2))(v10, v13);
    }

    v8 = v17;
    goto LABEL_10;
  }
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@Unable to submit pairing requests. One is already in progress", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
LABEL_10:

  }
}

uint64_t __63__HMDKeyTransferAgentServer_beginPairingWithCompletionHandler___block_invoke_32(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setProgressState:", 0);
}

uint64_t __42__HMDKeyTransferAgentServer___resetTimer___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "broadcastNotifiedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "setProgressState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_endAdvertiseUUIDWithError:", 0);
}

void __56__HMDKeyTransferAgentServer___deviceRemovedFromAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_device:removedFromAccount:", v5, v8);

}

void __45__HMDKeyTransferAgentServer___deviceUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_device:addedToAccount:", v4, v5);

}

void __52__HMDKeyTransferAgentServer___deviceAddedToAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_device:addedToAccount:", v5, v8);

}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDRemoteDeviceMessageDestination *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  HMDRemoteDeviceMessageDestination *v26;
  void *v27;
  HMDRemoteMessage *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDRemoteMessage *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  _QWORD block[5];
  _QWORD v47[6];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setBroadcastFailure:", 0);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  obj = v5;
  v45 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v50 != v44)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "broadcastNotifiedDevices");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", v7);

        if ((v9 & 1) == 0)
        {
          if (objc_msgSend(v7, "isCurrentDevice"))
          {
            v10 = (void *)MEMORY[0x1D17BA0A0]();
            v11 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "UUIDString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v56 = v13;
              v57 = 2112;
              v58 = v15;
              _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@NOT Broadcasting UUID to %@ (don't broadcast to self (won't retry)).", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v10);
            objc_msgSend(*(id *)(a1 + 32), "broadcastNotifiedDevices");
            v16 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
            -[HMDRemoteDeviceMessageDestination addObject:](v16, "addObject:", v7);
          }
          else
          {
            objc_msgSend(v7, "capabilities");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "supportsKeyTransferClient");

            v19 = (void *)MEMORY[0x1D17BA0A0]();
            v20 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            if ((v18 & 1) != 0)
            {
              if (v22)
              {
                HMFGetLogIdentifier();
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "UUIDString");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v56 = v23;
                v57 = 2112;
                v58 = v25;
                _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Broadcasting UUID to %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v19);
              v26 = [HMDRemoteDeviceMessageDestination alloc];
              objc_msgSend(*(id *)(a1 + 32), "uuid");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v26, "initWithTarget:device:", v27, v7);

              v28 = [HMDRemoteMessage alloc];
              v53[0] = CFSTR("phase");
              v53[1] = CFSTR("data");
              v54[0] = CFSTR("broadcast");
              objc_msgSend(*(id *)(a1 + 32), "currentKeyUUID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "UUIDString");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v54[1] = v30;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:restriction:](v28, "initWithName:destination:payload:type:timeout:secure:restriction:", CFSTR("kKeyTransferAgentKey"), v16, v31, 0, 0, 1, 0.0);

              objc_initWeak((id *)buf, *(id *)(a1 + 32));
              v47[0] = MEMORY[0x1E0C809B0];
              v47[1] = 3221225472;
              v47[2] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_24;
              v47[3] = &unk_1E89C1698;
              v47[4] = *(_QWORD *)(a1 + 32);
              objc_copyWeak(&v48, (id *)buf);
              v47[5] = v7;
              -[HMDRemoteMessage setResponseHandler:](v32, "setResponseHandler:", v47);
              objc_msgSend(*(id *)(a1 + 32), "broadcastGroup");
              v33 = objc_claimAutoreleasedReturnValue();
              dispatch_group_enter(v33);

              objc_msgSend(*(id *)(a1 + 32), "homeManager");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "messageDispatcher");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "sendMessage:completionHandler:", v32, 0);

              objc_destroyWeak(&v48);
              objc_destroyWeak((id *)buf);

            }
            else
            {
              if (v22)
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "identifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "UUIDString");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v56 = v36;
                v57 = 2112;
                v58 = v38;
                _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@NOT Broadcasting UUID to %@ (doesn't support key transfer)", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v19);
              objc_msgSend(*(id *)(a1 + 32), "broadcastNotifiedDevices");
              v16 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
              -[HMDRemoteDeviceMessageDestination addObject:](v16, "addObject:", v7);
            }
          }

        }
      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v45);
  }

  v40 = *(void **)(a1 + 32);
  v39 = (id *)(a1 + 32);
  objc_msgSend(v40, "broadcastGroup");
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v39, "workQueue");
  v42 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2_27;
  block[3] = &unk_1E89C2730;
  block[4] = *v39;
  dispatch_group_notify(v41, v42, block);

}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2;
  v6[3] = &unk_1E89BF278;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v9);
}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2_27(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "broadcastFailure") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "broadcastUUIDTimer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reset");

  }
}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v3 = a1[4];
    if (!v3)
    {
      objc_msgSend(a1[5], "workQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_25;
      v21 = &unk_1E89C2328;
      v7 = WeakRetained;
      v8 = a1[6];
      v22 = v7;
      v23 = v8;
      dispatch_async(v6, &v18);

LABEL_12:
      objc_msgSend(WeakRetained, "broadcastGroup", v18, v19, v20, v21);
      v17 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v17);

      goto LABEL_13;
    }
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 == (void *)*MEMORY[0x1E0CB8C70])
    {
      v9 = objc_msgSend(a1[4], "code");

      if (v9 == 3)
      {
        v10 = 0;
LABEL_9:
        v11 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(WeakRetained, "setBroadcastFailure:", v10));
        v12 = a1[5];
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "remoteDestinationString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = a1[4];
          *(_DWORD *)buf = 138543874;
          v25 = v14;
          v26 = 2112;
          v27 = v15;
          v28 = 2112;
          v29 = v16;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Broadcast failed to %@: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v11);
        goto LABEL_12;
      }
    }
    else
    {

    }
    v10 = 1;
    goto LABEL_9;
  }
LABEL_13:

}

void __42__HMDKeyTransferAgentServer_timerDidFire___block_invoke_25(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "broadcastNotifiedDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __40__HMDKeyTransferAgentServer_resetConfig__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "broadcastNotifiedDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "setProgressState:", 0);
}

+ (BOOL)isPeerAvailable
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass");

  if (v3 == 4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "capabilities");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "supportsKeyTransferClient");

          if ((v11 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t45_102583 != -1)
    dispatch_once(&logCategory__hmf_once_t45_102583, &__block_literal_global_102584);
  return (id)logCategory__hmf_once_v46_102585;
}

void __40__HMDKeyTransferAgentServer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v46_102585;
  logCategory__hmf_once_v46_102585 = v0;

}

@end
