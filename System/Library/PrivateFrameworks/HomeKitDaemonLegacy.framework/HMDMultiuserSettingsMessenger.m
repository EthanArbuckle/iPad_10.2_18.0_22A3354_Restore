@implementation HMDMultiuserSettingsMessenger

- (HMDMultiuserSettingsMessenger)initWithHome:(id)a3 messageDispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMultiuserSettingsMessenger *v9;
  HMDMultiuserSettingsMessenger *v10;
  HMDMultiuserSettingsMessenger *result;
  HMDMultiuserSettingsMessenger *v12;
  SEL v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v12 = (HMDMultiuserSettingsMessenger *)_HMFPreconditionFailure();
    -[HMDMultiuserSettingsMessenger registerForMessages](v12, v13);
    return result;
  }
  v14.receiver = self;
  v14.super_class = (Class)HMDMultiuserSettingsMessenger;
  v9 = -[HMDMultiuserSettingsMessenger init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDispatcher, a4);
    objc_storeWeak((id *)&v10->_home, v6);
  }

  return v10;
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMultiuserSettingsMessenger *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMultiuserSettingsMessenger home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Registered for Multiuser Settings Metrics Messages", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDMultiuserSettingsMessenger messageDispatcher](v7, "messageDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB9600];
  v13[0] = v3;
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:policies:selector:", v11, v7, v12, sel_handleFetchMultiuserSettingsRequest_);

}

- (void)handleFetchMultiuserSettingsRequest:(id)a3
{
  id v4;
  void *v5;
  HMDMultiuserSettingsMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMultiuserSettingsMessenger home](v6, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiUserSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling fetch Multiuser Settings Request, %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMultiuserSettingsMessenger home](v6, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "multiUserSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "payloadCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v13);

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDMultiuserSettingsMessenger home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMultiuserSettingsMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_127584 != -1)
    dispatch_once(&logCategory__hmf_once_t2_127584, &__block_literal_global_127585);
  return (id)logCategory__hmf_once_v3_127586;
}

void __44__HMDMultiuserSettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_127586;
  logCategory__hmf_once_v3_127586 = v0;

}

@end
