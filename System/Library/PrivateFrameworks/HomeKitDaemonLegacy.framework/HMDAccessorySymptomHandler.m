@implementation HMDAccessorySymptomHandler

- (HMDAccessorySymptomHandler)initWithAccessory:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDActiveXPCClientConnectionsManager *v11;
  void *v12;
  HMDActiveXPCClientConnectionsManager *v13;
  HMDAccessorySymptomHandler *v14;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySymptomHandler uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "symptomManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [HMDActiveXPCClientConnectionsManager alloc];
  objc_msgSend(v5, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDActiveXPCClientConnectionsManager initWithLogIdentifier:workQueue:](v11, "initWithLogIdentifier:workQueue:", v8, v12);

  v14 = -[HMDAccessorySymptomHandler initWithAccessory:logIdentifier:symptomManager:activeClientConnectionsManager:](self, "initWithAccessory:logIdentifier:symptomManager:activeClientConnectionsManager:", v5, v8, v10, v13);
  return v14;
}

- (HMDAccessorySymptomHandler)initWithAccessory:(id)a3 logIdentifier:(id)a4 symptomManager:(id)a5 activeClientConnectionsManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDAccessorySymptomHandler *v14;
  HMDAccessorySymptomHandler *v15;
  uint64_t v16;
  OS_dispatch_queue *workQueue;
  uint64_t v18;
  HMFMessageDispatcher *msgDispatcher;
  uint64_t v20;
  NSUUID *accessoryUUID;
  uint64_t v22;
  NSSet *symptoms;
  uint64_t v24;
  NSUUID *uuid;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDAccessorySymptomHandler;
  v14 = -[HMDAccessorySymptomHandler init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeStrong((id *)&v15->_logIdentifier, a4);
    objc_storeStrong((id *)&v15->_symptomManager, a5);
    objc_storeStrong((id *)&v15->_activeClientConnectionsManager, a6);
    objc_msgSend(v10, "workQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    workQueue = v15->_workQueue;
    v15->_workQueue = (OS_dispatch_queue *)v16;

    objc_msgSend(v10, "msgDispatcher");
    v18 = objc_claimAutoreleasedReturnValue();
    msgDispatcher = v15->_msgDispatcher;
    v15->_msgDispatcher = (HMFMessageDispatcher *)v18;

    objc_msgSend(v10, "uuid");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoryUUID = v15->_accessoryUUID;
    v15->_accessoryUUID = (NSUUID *)v20;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    symptoms = v15->_symptoms;
    v15->_symptoms = (NSSet *)v22;

    objc_msgSend(MEMORY[0x1E0CBA8E8], "symptomsHandlerUUIDFromAccessoryUUID:", v15->_accessoryUUID);
    v24 = objc_claimAutoreleasedReturnValue();
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v24;

  }
  return v15;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  -[HMDAccessorySymptomHandler activeClientConnectionsManager](self, "activeClientConnectionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[HMDAccessorySymptomHandler accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v9 = v5;

  objc_msgSend(v9, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOwnerUser");

  if (v7)
  {
    if (v9)
    {
      -[HMDAccessorySymptomHandler symptomManager](self, "symptomManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerAccessory:delegate:", v9, self);

    }
    -[HMDAccessorySymptomHandler _registerMessages](self, "_registerMessages");
  }

}

- (void)handleAccessoryDeviceUpdated
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[HMDAccessorySymptomHandler accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v8 = v4;

  objc_msgSend(v8, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOwnerUser");

  if (v6)
  {
    -[HMDAccessorySymptomHandler symptomManager](self, "symptomManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerAccessory:delegate:", v8, self);

  }
}

- (void)updateSymptoms:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  HMDAccessorySymptomHandler *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessorySymptomHandler symptoms](self, "symptoms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToSet:", v4);

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v7 & 1) != 0)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySymptomHandler symptoms](v9, "symptoms");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Not updating accessory symptoms from %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySymptomHandler symptoms](v9, "symptoms");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating accessory symptoms from %@ to %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAccessorySymptomHandler setSymptoms:](v9, "setSymptoms:", v4);
    -[HMDAccessorySymptomHandler _notifyAllSubscribedClientConnections](v9, "_notifyAllSubscribedClientConnections");
  }

}

- (void)_updateSFDeviceIdentifier:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessorySymptomHandler sfDeviceIdentifier](self, "sfDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    -[HMDAccessorySymptomHandler setSfDeviceIdentifier:](self, "setSfDeviceIdentifier:", v7);
    -[HMDAccessorySymptomHandler _notifyAllSubscribedClientConnections](self, "_notifyAllSubscribedClientConnections");
  }

}

- (void)_registerMessages
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySymptomHandler msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB9DE8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  -[HMDAccessorySymptomHandler accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v7, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v4, self, v9, sel__handleInitiateFixMessage_);

  -[HMDAccessorySymptomHandler msgDispatcher](self, "msgDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB9DF8];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:policies:selector:", v11, self, v13, sel__handleSubscribeMessage_);

  -[HMDAccessorySymptomHandler msgDispatcher](self, "msgDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CB9E10];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerForMessage:receiver:policies:selector:", v15, self, v17, sel__handleUnsubscribeMessage_);

}

- (id)_filteredSymptomsForSymptoms:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessorySymptomHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  -[HMDAccessorySymptomHandler accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 11);
    if (objc_msgSend(v6, "containsObject:", v10)
      && -[HMDAccessorySymptomHandler _shouldFilterWiFiMismatchSymptomForAccessory:](self, "_shouldFilterWiFiMismatchSymptomForAccessory:", v9))
    {
      objc_msgSend(v6, "removeObject:", v10);
    }
    objc_msgSend(v9, "capabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "supportsCaptiveNetworks") & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v15;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Remove NeedCaptiveLeaseRenewal symptom as accessory %@ does not support captive networks", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8E0]), "initWithType:", 19);
      objc_msgSend(v6, "removeObject:", v16);

    }
  }
  v17 = (void *)objc_msgSend(v6, "copy");

  return v17;
}

- (BOOL)_shouldFilterWiFiMismatchSymptomForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessorySymptomHandler *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  HMDAccessorySymptomHandler *v16;
  HMDAccessorySymptomHandler *v17;
  BOOL v18;
  HMDAccessorySymptomHandler *v19;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "productClass") != 6)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v13;
        v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because it is not an audio accessory";
LABEL_17:
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, v14, buf, 0xCu);

      }
LABEL_18:

      objc_autoreleasePoolPop(v10);
      v18 = 1;
      goto LABEL_19;
    }
    objc_msgSend(v7, "softwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "operatingSystemVersion");
    *(_OWORD *)buf = *MEMORY[0x1E0D28348];
    v22 = *(_QWORD *)(MEMORY[0x1E0D28348] + 16);
    v15 = HMFOperatingSystemVersionCompare();

    if (v15 == -1)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v13;
        v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because it is a pre-Peace accessory";
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  if (objc_msgSend(v5, "synchronouslyFetchIsConnectedToCarPlayNetwork"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because there is a wireless CarPlay connection";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "hasActiveWACPairing"))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      v14 = "%{public}@Removing WiFi network mismatch symptom for accessory because there is an active WAC pairing";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (void)_notifyAllSubscribedClientConnections
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDAccessorySymptomHandler *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessorySymptomHandler activeClientConnectionsManager](self, "activeClientConnectionsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying all %lu subscribed clients of updated symptom state", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDAccessorySymptomHandler _notifySubscribedClientConnections:](v8, "_notifySubscribedClientConnections:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed clients to notify of updated symptom state", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_notifySubscribedClientConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySymptomHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
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
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying subscribed client of updated symptom state: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySymptomHandler _notifySubscribedClientConnections:](v7, "_notifySubscribedClientConnections:", v10);

}

- (void)_notifySubscribedClientConnections:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySymptomHandler symptoms](self, "symptoms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObjectForIncomingXPCMessage(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB9E08]);

  -[HMDAccessorySymptomHandler sfDeviceIdentifier](self, "sfDeviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB9DF0]);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    v13 = *MEMORY[0x1E0CB9E00];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", v13, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setTransport:", v15);
        v17 = objc_alloc(MEMORY[0x1E0D285D8]);
        -[HMDAccessorySymptomHandler messageTargetUUID](self, "messageTargetUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithTarget:", v18);
        objc_msgSend(v16, "setDestination:", v19);

        -[HMDAccessorySymptomHandler msgDispatcher](self, "msgDispatcher");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sendMessage:", v16);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

}

- (void)_handleInitiateFixMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySymptomHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessorySymptomHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling initiate fix message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessorySymptomHandler accessory](v7, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    -[HMDAccessorySymptomHandler symptomManager](v7, "symptomManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __56__HMDAccessorySymptomHandler__handleInitiateFixMessage___block_invoke;
    v21[3] = &unk_1E89C0DA8;
    v21[4] = v7;
    v22 = v13;
    v23 = v4;
    objc_msgSend(v14, "initiateFixForAccessory:completion:", v22, v21);

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
      -[HMDAccessorySymptomHandler accessory](v16, "accessory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot initiate fix for non-Apple-media accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
}

- (void)_handleSubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySymptomHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessorySymptomHandler *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v9;
    v24 = 2112;
    v25 = (uint64_t)v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
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
    -[HMDAccessorySymptomHandler activeClientConnectionsManager](v7, "activeClientConnectionsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addClientConnection:", v13);

    objc_msgSend(v4, "respondWithSuccess");
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
      v19 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);

  }
}

- (void)_handleUnsubscribeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAccessorySymptomHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessorySymptomHandler *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v9;
    v24 = 2112;
    v25 = (uint64_t)v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
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
    -[HMDAccessorySymptomHandler activeClientConnectionsManager](v7, "activeClientConnectionsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeClientConnection:", v13);

    objc_msgSend(v4, "respondWithSuccess");
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
      v19 = objc_opt_class();
      objc_msgSend(v4, "transport");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v21);

  }
}

- (void)symptomManager:(id)a3 didChangeSymptoms:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HMDAccessorySymptomHandler_symptomManager_didChangeSymptoms___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)symptomManager:(id)a3 didChangeSFDeviceIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__HMDAccessorySymptomHandler_symptomManager_didChangeSFDeviceIdentifier___block_invoke;
  v8[3] = &unk_1E89C2328;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)clientConnectionsManager:(id)a3 didHandleActivationForClientConnection:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  -[HMDAccessorySymptomHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessorySymptomHandler _notifySubscribedClientConnection:](self, "_notifySubscribedClientConnection:", v6);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (NSSet)symptoms
{
  return self->_symptoms;
}

- (void)setSymptoms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (HMDSymptomManager)symptomManager
{
  return (HMDSymptomManager *)objc_getProperty(self, a2, 56, 1);
}

- (HMDActiveXPCClientConnectionsManager)activeClientConnectionsManager
{
  return (HMDActiveXPCClientConnectionsManager *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)sfDeviceIdentifier
{
  return self->_sfDeviceIdentifier;
}

- (void)setSfDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sfDeviceIdentifier, a3);
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_sfDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activeClientConnectionsManager, 0);
  objc_storeStrong((id *)&self->_symptomManager, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_symptoms, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

uint64_t __73__HMDAccessorySymptomHandler_symptomManager_didChangeSFDeviceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSFDeviceIdentifier:", *(_QWORD *)(a1 + 40));
}

void __63__HMDAccessorySymptomHandler_symptomManager_didChangeSymptoms___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_filteredSymptomsForSymptoms:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateSymptoms:", v2);

}

void __56__HMDAccessorySymptomHandler__handleInitiateFixMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
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
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to initiate fix for accessory %@: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully initiated fix for accessory: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24[0] != -1)
    dispatch_once(logCategory__hmf_once_t24, &__block_literal_global_14845);
  return (id)logCategory__hmf_once_v25;
}

void __41__HMDAccessorySymptomHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25;
  logCategory__hmf_once_v25 = v0;

}

@end
