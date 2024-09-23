@implementation HMDXPCClientConnection

+ (id)logCategory
{
  if (logCategory__hmf_once_t36 != -1)
    dispatch_once(&logCategory__hmf_once_t36, &__block_literal_global_36505);
  return (id)logCategory__hmf_once_v37;
}

- (id)_displayName
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDXPCClientConnection name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDXPCClientConnection name](self, "name");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDXPCClientConnection processInfo](self, "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HMDXPCClientConnection processInfo](self, "processInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "applicationInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = CFSTR("unknown");
    }
  }
  return v4;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HMDXPCClientConnection processInfo](self, "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HMDXPCClientConnection clientName](self, "clientName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (HMDProcessInfo)processInfo
{
  os_unfair_lock_s *p_lock;
  HMDProcessInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_processInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDXPCClientConnection *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  uint32_t v27;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqual:", self) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v6;
      v12 = "%{public}@Cannot send message %@: This XPC client connection does not match the message's transport: %@";
      v26 = v9;
      v27 = 32;
LABEL_55:
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v31, v27);
LABEL_56:

      goto LABEL_57;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresSPIEntitlement")
    && !-[HMDXPCClientConnection isEntitledForSPIAccess](self, "isEntitledForSPIAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not SPI entitled and message requires SPI entitlement";
      goto LABEL_54;
    }
LABEL_57:

    objc_autoreleasePoolPop(v7);
    v25 = 0;
    goto LABEL_58;
  }
  if (objc_msgSend(v4, "requiresNoSPIEntitlement")
    && -[HMDXPCClientConnection isEntitledForSPIAccess](self, "isEntitledForSPIAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is SPI entitled and message requires no SPI entitlement";
LABEL_54:
      v26 = v9;
      v27 = 22;
      goto LABEL_55;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "isLocationAuthorized")
    && !-[HMDXPCClientConnection isAuthorizedForLocationAccess](self, "isAuthorizedForLocationAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not location authorized and message requires location authorization";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresHomeLocationEntitlement")
    && !-[HMDXPCClientConnection isEntitledForHomeLocationAccess](self, "isEntitledForHomeLocationAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not entitled for the HomeKit location data. Please make sure the"
            " client has com.apple.private.homekit.home-location & com.apple.private.homekit.location entitlements.";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresCameraClipsEntitlement")
    && !-[HMDXPCClientConnection isEntitledForCameraClipsAccess](self, "isEntitledForCameraClipsAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not camera clips entitled and message requires camera clips entitlement";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresMultiUserSetupEntitlement")
    && !-[HMDXPCClientConnection isEntitledForMultiUserSetupAccess](self, "isEntitledForMultiUserSetupAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not multi user entitled and message requires multi user entitlement";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresSetupPayloadEntitlement")
    && !-[HMDXPCClientConnection isEntitledToProvideAccessorySetupPayload](self, "isEntitledToProvideAccessorySetupPayload"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not setup payload entitled and message requires setup payload entitlement";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresMatterSetupPayloadEntitlement")
    && !-[HMDXPCClientConnection isEntitledToProvideMatterSetupPayload](self, "isEntitledToProvideMatterSetupPayload"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not matter setup payload entitled and message requires matter se"
            "tup payload entitlement";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresPersonManagerEntitlement")
    && !-[HMDXPCClientConnection isEntitledForPersonManagerAccess](self, "isEntitledForPersonManagerAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not person manager entitled and message requires person manager entitlement";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  if (objc_msgSend(v4, "requiresWalletKeyEntitlement")
    && !-[HMDXPCClientConnection isEntitledForWalletKeyAccess](self, "isEntitledForWalletKeyAccess"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Client is not wallet key entitled and message requires wallet key entitlement";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDXPCClientConnection shouldSendResponseForMessageIdentifier:](self, "shouldSendResponseForMessageIdentifier:", v13);

  if (!v14)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v10;
      v33 = 2112;
      v34 = v11;
      v12 = "%{public}@Cannot send message %@: Connection is deactivated and no response is pending";
      goto LABEL_54;
    }
    goto LABEL_57;
  }
  objc_msgSend(v4, "sendPolicy");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[HMDXPCClientConnection sendPolicyParameters](self, "sendPolicyParameters");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(v4, "sendPolicy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDXPCClientConnection sendPolicyParameters](self, "sendPolicyParameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "canSendWithPolicyParameters:", v20);

      if ((v21 & 1) != 0)
        goto LABEL_29;
    }
    else
    {

    }
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_57;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendPolicy");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDXPCClientConnection sendPolicyParameters](v8, "sendPolicyParameters");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138544130;
    v32 = v10;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v29;
    v37 = 2112;
    v38 = v30;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Cannot send message %@: Message send policy %@ does not pass client connection send policy: %@", (uint8_t *)&v31, 0x2Au);

    goto LABEL_56;
  }
LABEL_29:
  -[HMDXPCClientConnection metricsClientName](self, "metricsClientName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[HMDXPCClientConnection messageCountTracker](self, "messageCountTracker");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "incrementCounterOfType:clientName:messageName:", 2, v22, v24);

  }
  v25 = 1;
LABEL_58:

  return v25;
}

- (HMDXPCMessageSendPolicyParameters)sendPolicyParameters
{
  os_unfair_lock_s *p_lock;
  HMDXPCMessageSendPolicyParameters *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_sendPolicyParameters;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)shouldSendResponseForMessageIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[HMDXPCClientConnection isActivated](self, "isActivated"))
  {
    v5 = 1;
  }
  else
  {
    -[HMDXPCClientConnection requestTracker](self, "requestTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "containsObject:", v4);

  }
  return v5;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (HMDXPCMessageCountTracker)messageCountTracker
{
  return (HMDXPCMessageCountTracker *)objc_getProperty(self, a2, 96, 1);
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  dispatch_qos_class_t v8;
  id v9;
  id v10;
  dispatch_block_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "qualityOfService");
  v8 = HMFQOSClassFromQualityOfService();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMDXPCClientConnection_sendMessage_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  -[HMDXPCClientConnection queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v12, v11);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isEntitledForSPIAccess
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 2) & 1;
}

- (unint64_t)entitlements
{
  return self->_entitlements;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
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

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDXPCClientConnection _displayName](self, "_displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDXPCClientConnection clientPid](self, "clientPid", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("PID"), v7);
  v14[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDXPCClientConnection entitlements](self, "entitlements");
  HMXPCClientEntitlementsShortDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Entitlements"), v10);
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (Class)principalClass
{
  void *v2;
  NSString *v3;
  void *v4;

  -[HMDXPCClientConnection userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", *MEMORY[0x1E0CB98B8]);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    NSClassFromString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (Class)v4;
}

void __57__HMDXPCClientConnection__handleMessage_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(v11, "domain");

    objc_msgSend(v11, "code");
    objc_msgSend(WeakRetained, "requestTracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondToRequestWithIdentifier:withPayload:error:", *(_QWORD *)(a1 + 48), v5, v11);

    if (v11)
    {
      objc_msgSend(WeakRetained, "metricsClientName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(WeakRetained, "messageCountTracker");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "incrementCounterOfType:clientName:messageName:", 1, v8, v10);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "end");
  }

}

- (void)_handleMessage:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  HMDXPCClientConnection *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *context;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v53 = a4;
  v49 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = objc_alloc(MEMORY[0x1E0D28540]);
  v8 = (void *)MEMORY[0x1E0D285D0];
  objc_msgSend(v6, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityNameWithMessageName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v7, "initWithName:", v10);

  objc_msgSend(v6, "headers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8260]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v54, "setClientMetricIdentifier:", v14);
  objc_msgSend(v6, "name");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "identifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "shortDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "UUIDString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDXPCClientConnection name](v15, "name");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destination");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "target");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
      v19 = "";
    else
      v19 = " not";
    objc_msgSend(v6, "messagePayload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (getDenylistKeys_onceToken != -1)
      dispatch_once(&getDenylistKeys_onceToken, &__block_literal_global_360_36424);
    v21 = (id)getDenylistKeys_denylistKeys;
    objc_msgSend(v20, "secureDescriptionWithBlacklistKeys:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "qualityOfService");
    HMFQualityOfServiceToString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    v62 = v45;
    v63 = 2114;
    v64 = v47;
    v65 = 2114;
    v66 = v51;
    v67 = 2114;
    v68 = v44;
    v69 = 2114;
    v70 = v46;
    v71 = 2114;
    v72 = v43;
    v73 = 2082;
    v74 = v19;
    v75 = 2114;
    v76 = v22;
    v77 = 2114;
    v78 = v23;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received incoming message %{public}@ (%{public}@) from client '%{public}@' for target %{public}@ that does%{public}s expect a response, payload %{public}@, QoS: %{public}@", buf, 0x5Cu);

  }
  objc_autoreleasePoolPop(context);
  -[HMDXPCClientConnection metricsClientName](v15, "metricsClientName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[HMDXPCClientConnection messageCountTracker](v15, "messageCountTracker");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "incrementCounterOfType:clientName:messageName:", 0, v24, v26);

  }
  -[HMDXPCClientConnection clientName](v15, "clientName");

  v27 = (void *)objc_msgSend(v6, "mutableCopy");
  if (shouldEnableInternalDebugInterfaces__hmf_once_t33 != -1)
    dispatch_once(&shouldEnableInternalDebugInterfaces__hmf_once_t33, &__block_literal_global_682);
  if (!shouldEnableInternalDebugInterfaces__hmf_once_v34
    || (objc_msgSend(v6, "messagePayload"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("kNewObjectUUIDKey")),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v30 = v29 == 0,
        v29,
        v28,
        v30))
  {
    objc_msgSend(v6, "messagePayload");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "UUIDString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("kNewObjectUUIDKey"));

    v35 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v27, "setMessagePayload:", v35);

  }
  objc_msgSend(v27, "setTransport:", v15);
  objc_msgSend(v27, "setActivity:", v54);
  if (v53)
  {
    -[HMDXPCClientConnection requestTracker](v15, "requestTracker");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addRequestWithIdentifier:name:qualityOfService:isTimeoutDisabled:responseHandler:", v37, v38, objc_msgSend(v6, "qualityOfService"), objc_msgSend(v6, "hm_isXPCTimeoutDisabled"), v53);

    -[HMDXPCClientConnection clientName](v15, "clientName");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v15);
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __57__HMDXPCClientConnection__handleMessage_responseHandler___block_invoke;
    v55[3] = &unk_1E89BCD30;
    objc_copyWeak(&v60, (id *)buf);
    v56 = v54;
    v40 = v39;
    v57 = v40;
    v58 = v52;
    v59 = v6;
    objc_msgSend(v27, "setResponseHandler:", v55);

    objc_destroyWeak(&v60);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_msgSend(v54, "end");
  }
  -[HMFMessageTransport delegate](v15, "delegate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v41, "messageTransport:didReceiveMessage:", v15, v42);

  objc_autoreleasePoolPop(v49);
}

- (NSString)clientName
{
  void *v2;
  void *v3;

  -[HMDXPCClientConnection userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_stringForKey:", *MEMORY[0x1E0CB98C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)userInfo
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDXPCRequestTracker)requestTracker
{
  return (HMDXPCRequestTracker *)objc_getProperty(self, a2, 104, 1);
}

+ (unint64_t)entitlementsForConnection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = validateEntitlementForConnection(CFSTR("com.apple.developer.homekit"), v4);
  if (validateEntitlementForConnection(CFSTR("com.apple.developer.homekit.background-mode"), v4))
    v6 = v5 | 2;
  else
    v6 = v5;
  if (!validateEntitlementForConnection(CFSTR("com.apple.private.homekit"), v4))
  {
    if (!validateEntitlementForConnection(CFSTR("com.apple.homekit.private-spi-access"), v4))
      goto LABEL_10;
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = CFSTR("com.apple.private.homekit");
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Client should adopt %@ entitlement: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  v6 |= 4uLL;
LABEL_10:
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.pairing-identity.private"), v4))
  {
    v11 = v6 | 0x18;
  }
  else if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.pairing-identity"), v4))
  {
    v11 = v6 | 8;
  }
  else
  {
    v11 = v6;
  }
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.remote-login.private"), v4))
    v11 |= 0x20uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.developer.homekit.allow-setup-payload"), v4))
    v11 |= 0x40uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.developer.matter.allow-setup-payload"), v4))
    v11 |= 0x200000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.cameraclips"), v4))
    v11 |= 0x80uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.connectivity-info"), v4))
    v11 |= 0x100uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.multi-user.setup"), v4))
    v11 |= 0x200uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.location"), v4))
    v11 |= 0x400uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.home-location"), v4))
    v11 |= 0x80000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.shortcuts-automation-access"), v4))v11 |= 0x800uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.messaging"), v4))
    v11 |= 0x1000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.person-manager"), v4))
    v11 |= 0x2000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.allow-secure-access"), v4))
    v11 |= 0x4000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.diagnostics"), v4))
    v11 |= 0x8000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.state-dump"), v4))
    v11 |= 0x10000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.wallet-key"), v4))
    v11 |= 0x20000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.assistant-identifiers"), v4))
    v11 |= 0x40000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.location-feedback-debug"), v4))
    v11 |= 0x100000uLL;
  if (validateEntitlementForConnection(CFSTR("com.apple.private.homekit.modern-messaging"), v4))
    v11 |= 0x400000uLL;

  return v11;
}

- (int)clientPid
{
  void *v2;
  int v3;
  int v4;

  -[HMDXPCClientConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");
  if (v3)
    v4 = v3;
  else
    v4 = -1;

  return v4;
}

void __56__HMDXPCClientConnection_sendMessage_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "canSendMessage:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isLocationAuthorized") & 1) != 0
      || objc_msgSend(*(id *)(a1 + 40), "requiresHomeLocationEntitlement"))
    {
      v2 = (void *)MEMORY[0x1D17BA0A0]();
      v3 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "shortDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v5;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Marking location for message: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v2);
      objc_msgSend(*(id *)(a1 + 32), "processInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationAuthorization");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mark");

    }
    v9 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIdentifier:", v10);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHeaderValue:forKey:", v11, *MEMORY[0x1E0CBA148]);

    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__HMDXPCClientConnection_sendMessage_completionHandler___block_invoke_127;
    v20[3] = &unk_1E89C2350;
    v20[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "responseHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(v9, "copy");
    if (v14)
    {
      objc_msgSend(v9, "responseHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleMessage:responseHandler:", v15, v16);

    }
    else
    {
      objc_msgSend(v13, "handleMessage:", v15);
    }

    v18 = *(_QWORD *)(a1 + 48);
    if (v18)
      (*(void (**)(uint64_t, _QWORD))(v18 + 16))(v18, 0);

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 48);
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v17 + 16))(v17);

    }
  }
}

- (HMDXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (NSString)applicationBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HMDXPCClientConnection processInfo](self, "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[HMDXPCClientConnection clientName](self, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "copy");

  }
  return (NSString *)v6;
}

- (BOOL)isEntitledForAssistantIdentifiers
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 18) & 1;
}

- (void)setProcessInfo:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  if (!v6 || self->_processInfo)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_processInfo, a3);
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel___handleApplicationStateChange_, CFSTR("HMDProcessInfoStateDidChangeNotification"), v6);

  }
}

- (BOOL)isAuthorizedForHomeDataAccess
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDXPCClientConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "auditToken");
  v4 = TCCAccessCheckAuditToken() != 0;

  return v4;
}

- (HMDXPCClientConnection)initWithConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  HMDXPCRequestTracker *v12;
  HMDXPCClientConnection *v13;
  HMDXPCRequestTracker *v15;
  SEL v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), objc_msgSend(v4, "processIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMDispatchQueueNameString();
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create(v8, v9);

    +[HMDXPCMessageCountTracker sharedTracker](HMDXPCMessageCountTracker, "sharedTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDXPCRequestTracker initWithQueue:]([HMDXPCRequestTracker alloc], "initWithQueue:", v10);
    v13 = -[HMDXPCClientConnection initWithConnection:queue:messageCountTracker:requestTracker:](self, "initWithConnection:queue:messageCountTracker:requestTracker:", v5, v10, v11, v12);

    return v13;
  }
  else
  {
    v15 = (HMDXPCRequestTracker *)_HMFPreconditionFailure();
    return (HMDXPCClientConnection *)-[HMDXPCRequestTracker initWithQueue:](v15, v16, v17);
  }
}

- (HMDXPCClientConnection)initWithConnection:(id)a3 queue:(id)a4 messageCountTracker:(id)a5 requestTracker:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDXPCClientConnection *v16;
  uint64_t v17;
  NSString *logIdentifier;
  HMDXPCMessageSendPolicyParameters *v19;
  HMDXPCMessageSendPolicyParameters *sendPolicyParameters;
  HMDXPCClientConnection *result;
  HMDXPCConnection *v22;
  SEL v23;
  id v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v22 = (HMDXPCConnection *)_HMFPreconditionFailure();
    -[HMDXPCConnection setQueue:](v22, v23, v24);
    return result;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDXPCClientConnection;
  v16 = -[HMDXPCClientConnection init](&v25, sel_init);
  if (v16)
  {
    objc_msgSend(v11, "setQueue:", v12);
    objc_storeStrong((id *)&v16->_xpcConnection, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    objc_storeStrong((id *)&v16->_messageCountTracker, a5);
    objc_storeStrong((id *)&v16->_requestTracker, a6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v11, "processIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = (NSString *)v17;

    v16->_entitlements = +[HMDXPCClientConnection entitlementsForConnection:](HMDXPCClientConnection, "entitlementsForConnection:", v11);
    v16->_entitledForAPIAccess = validateEntitlementForConnection(CFSTR("com.apple.developer.homekit"), v11);
    v16->_entitledForBackgroundMode = validateEntitlementForConnection(CFSTR("com.apple.developer.homekit.background-mode"), v11);
    v16->_entitledForCameraClipsAccess = validateEntitlementForConnection(CFSTR("com.apple.private.homekit.cameraclips"), v11);
    v16->_entitledForMultiUserSetupAccess = validateEntitlementForConnection(CFSTR("com.apple.private.homekit.multi-user.setup"), v11);
    v16->_entitledForPersonManagerAccess = validateEntitlementForConnection(CFSTR("com.apple.private.homekit.person-manager"), v11);
    v16->_entitledForWalletKeyAccess = validateEntitlementForConnection(CFSTR("com.apple.private.homekit.wallet-key"), v11);
    v19 = -[HMDXPCMessageSendPolicyParameters initWithEntitlements:]([HMDXPCMessageSendPolicyParameters alloc], "initWithEntitlements:", v16->_entitlements);
    sendPolicyParameters = v16->_sendPolicyParameters;
    v16->_sendPolicyParameters = v19;

  }
  return v16;
}

- (void)setUserInfo:(id)a3
{
  id v4;
  NSDictionary *userInfo;
  NSDictionary *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMDXPCClientConnection *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    userInfo = self->_userInfo;
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    v7 = self->_userInfo;
    self->_userInfo = v6;

    os_unfair_lock_unlock(&self->_lock);
    if (!userInfo)
      -[HMDXPCClientConnection activate](self, "activate");
    -[HMDXPCClientConnection clientName](self, "clientName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[HMDXPCClientConnection requestTracker](self, "requestTracker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setClientName:", v8);

    }
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[HMDXPCClientConnection name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDXPCClientConnection clientPid](self, "clientPid");
    -[HMDXPCClientConnection clientUUID](self, "clientUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%d/%@"), v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDXPCClientConnection setLogIdentifier:](self, "setLogIdentifier:", v14);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v18;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updated user info: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);

  }
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (id)clientUUID
{
  void *v2;
  void *v3;

  -[HMDXPCClientConnection userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_UUIDForKey:", *MEMORY[0x1E0CBA120]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateSendPolicyParameters:(id)a3
{
  id v4;
  void *v5;
  HMDXPCClientConnection *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
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
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting sendPolicyParameters to %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDXPCClientConnection setSendPolicyParameters:](v6, "setSendPolicyParameters:", v4);

}

- (void)setSendPolicyParameters:(id)a3
{
  HMDXPCMessageSendPolicyParameters *v4;
  HMDXPCMessageSendPolicyParameters *sendPolicyParameters;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (HMDXPCMessageSendPolicyParameters *)objc_msgSend(v6, "copy");
  sendPolicyParameters = self->_sendPolicyParameters;
  self->_sendPolicyParameters = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)homeManagerOptions
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if (!-[objc_class isEqual:](-[HMDXPCClientConnection principalClass](self, "principalClass"), "isEqual:", objc_opt_class()))return -1;
  -[HMDXPCClientConnection userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x1E0CB9040]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
    if ((-[HMDXPCClientConnection entitlements](self, "entitlements") & 4) == 0)
    {
      if ((-[HMDXPCClientConnection entitlements](self, "entitlements") & 0x40) == 0
        && !_os_feature_enabled_impl())
      {
        v5 &= ~0x1000uLL;
      }
      if (_os_feature_enabled_impl())
        v6 = -51409;
      else
        v6 = -51665;
      v7 = _os_feature_enabled_impl();
      v8 = -52433;
      if (v7)
        v8 = -51409;
      v5 &= v6 & v8;
    }
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (BOOL)isAdaptive
{
  void *v2;
  char v3;

  -[HMDXPCClientConnection userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmf_BOOLForKey:", *MEMORY[0x1E0CB8E40]);

  return v3;
}

- (NSString)companionAppBundleIdentifier
{
  return 0;
}

- (BOOL)isAuthorizedForLocationAccess
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  if ((-[HMDXPCClientConnection entitlements](self, "entitlements") & 0x400) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "bundleForLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D285B8]), "initWithBundle:", v3);
  }
  else
  {
    -[HMDXPCClientConnection processInfo](self, "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locationAuthorization");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  v6 = objc_msgSend(v5, "isAuthorized");
  return v6;
}

- (void)handleMessage:(id)a3
{
  -[HMDXPCClientConnection _handleMessage:responseHandler:](self, "_handleMessage:responseHandler:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  HMDXPCClientConnection *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HMDXPCClientConnection requestTracker](self, "requestTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllRequests");

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@XPC connection got deallocated.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9.receiver = v6;
  v9.super_class = (Class)HMDXPCClientConnection;
  -[HMDXPCClientConnection dealloc](&v9, sel_dealloc);
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDXPCClientConnection name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDXPCClientConnection clientPid](self, "clientPid");
  -[HMDXPCClientConnection entitlements](self, "entitlements");
  HMXPCClientEntitlementsShortDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@(%d):%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)metricsClientName
{
  os_unfair_lock_s *p_lock;
  id *p_metricsClientName;
  NSString *metricsClientName;
  NSString *v6;
  HMDProcessInfo *processInfo;
  void *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_metricsClientName = (id *)&self->_metricsClientName;
  metricsClientName = self->_metricsClientName;
  if (metricsClientName)
  {
    v6 = metricsClientName;
  }
  else
  {
    processInfo = self->_processInfo;
    if (processInfo)
    {
      -[HMDProcessInfo applicationInfo](processInfo, "applicationInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = HMDShouldRedactBundleId(v9);
        v11 = CFSTR("Third-party app");
        if (!v10)
          v11 = v9;
        v12 = v11;
        v13 = (__CFString *)*p_metricsClientName;
        *p_metricsClientName = v12;
      }
      else
      {
        -[HMFProcessInfo name](self->_processInfo, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          -[NSDictionary hmf_stringForKey:](self->_userInfo, "hmf_stringForKey:", *MEMORY[0x1E0CB98C0]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        v13 = v16;

        if (HMDShouldRedactBundleId(v13))
          v17 = CFSTR("Third-party client name");
        else
          v17 = v13;
        objc_storeStrong(p_metricsClientName, v17);
      }

      v6 = (NSString *)*p_metricsClientName;
    }
    else
    {
      v6 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isAuthorizedForMicrophoneAccess
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDXPCClientConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "auditToken");
  v4 = TCCAccessCheckAuditToken() != 0;

  return v4;
}

- (BOOL)isEntitledForHomeLocationAccess
{
  void *v2;
  char v3;

  -[HMDXPCClientConnection xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = validateEntitlementForConnection(CFSTR("com.apple.private.homekit.home-location"), v2);

  return v3;
}

- (BOOL)isEntitledToProvideAccessorySetupPayload
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 6) & 1;
}

- (BOOL)isEntitledToProvideMatterSetupPayload
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 21) & 1;
}

- (BOOL)isEntitledForShortcutsAutomationAccess
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 11) & 1;
}

- (BOOL)isEntitledForSecureAccess
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 14) & 1;
}

- (BOOL)isEntitledForStateDump
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 16) & 1;
}

- (BOOL)isEntitledForModernMessaging
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 22) & 1;
}

- (BOOL)isEntitledForHomeLocationFeedbackAccess
{
  return (-[HMDXPCClientConnection entitlements](self, "entitlements") >> 20) & 1;
}

- (BOOL)isPlatformBinary
{
  void *v3;
  void *v4;

  -[HMDXPCClientConnection xpcConnection](self, "xpcConnection", 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "auditToken");

  -[HMDXPCClientConnection clientPid](self, "clientPid");
  if (csops_audittoken())
    return 0;
  else
    return 0;
}

- (void)__handleApplicationStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  HMDXPCClientConnection *v10;
  SEL v11;
  _QWORD v12[4];
  id v13;
  HMDXPCClientConnection *v14;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDXPCClientConnection queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__HMDXPCClientConnection___handleApplicationStateChange___block_invoke;
    v12[3] = &unk_1E89C2328;
    v13 = v4;
    v14 = self;
    v9 = v4;
    dispatch_async(v8, v12);

  }
  else
  {
    v10 = (HMDXPCClientConnection *)_HMFPreconditionFailure();
    -[HMDXPCClientConnection activeRequests](v10, v11);
  }
}

- (NSSet)activeRequests
{
  void *v2;
  void *v3;

  -[HMDXPCClientConnection requestTracker](self, "requestTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSDictionary)stateDump
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDXPCClientConnection name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDXPCClientConnection clientPid](self, "clientPid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PID"));

  -[HMDXPCClientConnection entitlements](self, "entitlements");
  HMXPCClientEntitlementsShortDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Entitlements"));

  -[HMDXPCClientConnection isActivated](self, "isActivated");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("Activated"));

  -[HMDXPCClientConnection sendPolicyParameters](self, "sendPolicyParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("Send Policy Parameters"));

  -[HMDXPCClientConnection userInfo](self, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("User Info"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v11;
}

- (void)activate
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  HMDXPCClientConnection *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDXPCClientConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HMDXPCClientConnection isActivated](self, "isActivated");
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Not activating already activated XPC connection", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Activating XPC connection", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDXPCClientConnection setActivated:](v6, "setActivated:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("HMDXPCClientConnectionDidActivateNotification"), v6);

  }
}

- (void)deactivate
{
  NSObject *v3;
  BOOL v4;
  void *v5;
  HMDXPCClientConnection *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDXPCClientConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HMDXPCClientConnection isActivated](self, "isActivated");
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Deactivating XPC connection", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDXPCClientConnection setActivated:](v6, "setActivated:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("HMDXPCClientConnectionDidDeactivateNotification"), v6);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Not de-activating already de-activated XPC connection", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)initiateRefresh
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0D285D0];
  v4 = *MEMORY[0x1E0CBA118];
  objc_msgSend(MEMORY[0x1E0D285D8], "allMessageDestinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithName:qualityOfService:destination:payload:", v4, 9, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDXPCClientConnection sendMessage:completionHandler:](self, "sendMessage:completionHandler:", v6, 0);
}

- (BOOL)isEntitledForAPIAccess
{
  return self->_entitledForAPIAccess;
}

- (BOOL)isEntitledForBackgroundMode
{
  return self->_entitledForBackgroundMode;
}

- (BOOL)isEntitledForCameraClipsAccess
{
  return self->_entitledForCameraClipsAccess;
}

- (BOOL)isEntitledForMultiUserSetupAccess
{
  return self->_entitledForMultiUserSetupAccess;
}

- (BOOL)isEntitledForPersonManagerAccess
{
  return self->_entitledForPersonManagerAccess;
}

- (BOOL)isEntitledForWalletKeyAccess
{
  return self->_entitledForWalletKeyAccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTracker, 0);
  objc_storeStrong((id *)&self->_messageCountTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsClientName, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sendPolicyParameters, 0);
}

void __56__HMDXPCClientConnection_sendMessage_completionHandler___block_invoke_127(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote object proxy for sending message: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __57__HMDXPCClientConnection___handleApplicationStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    _HMFPreconditionFailure();
  v4 = objc_msgSend(v3, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFFFDLL;
  if (v4 == 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isActivated"))
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Deactivating XPC connection that is now in the background", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 40), "deactivate");
    }
  }
  else if (!v4 && (objc_msgSend(*(id *)(a1 + 40), "isActivated") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Activating XPC connection that is now in the foreground and initiating refresh", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "activate");
    objc_msgSend(*(id *)(a1 + 40), "initiateRefresh");
  }

}

void __37__HMDXPCClientConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v37;
  logCategory__hmf_once_v37 = v0;

}

@end
