@implementation HMDAppleMediaAccessoryMessenger

- (HMDAppleMediaAccessoryMessenger)initWithIdentifier:(id)a3 messageDispatcher:(id)a4 router:(id)a5 localHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDAppleMediaAccessoryMessenger *v16;
  HMDAppleMediaAccessoryMessenger *v17;
  HMDAppleMediaAccessoryMessenger *result;
  HMDAppleMediaAccessoryMessenger *v19;
  SEL v20;
  id v21;
  objc_super v22;

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
    v19 = (HMDAppleMediaAccessoryMessenger *)_HMFPreconditionFailure();
    -[HMDAppleMediaAccessoryMessenger registerForMessagesWithHome:](v19, v20, v21);
    return result;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDAppleMediaAccessoryMessenger;
  v16 = -[HMDAppleMediaAccessoryMessenger init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_messageDispatcher, a4);
    objc_storeStrong((id *)&v17->_router, a5);
    objc_storeStrong((id *)&v17->_localHandler, a6);
  }

  return v17;
}

- (void)registerForMessagesWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoryMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryMessenger messageDispatcher](v6, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA868], "messageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = v10;
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", v13, v6, v14, sel_routeSiriEndpointDeleteSiriHistoryMessage_);

}

- (void)sendDeleteSiriHistoryRequestForAccessoryWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAppleMediaAccessoryMessenger *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  HMDAppleMediaAccessoryMessenger *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending delete siri history request message for accessory uuid: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA868]), "initWithAccessoryUUID:", v6);
  v13 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAppleMediaAccessoryMessenger messageTargetUUID](v9, "messageTargetUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

  v16 = objc_alloc(MEMORY[0x1E0D285F8]);
  objc_msgSend(MEMORY[0x1E0CBA868], "messageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payloadCopy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithName:destination:payload:", v17, v15, v18);

  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __102__HMDAppleMediaAccessoryMessenger_sendDeleteSiriHistoryRequestForAccessoryWithUUID_completionHandler___block_invoke;
  v24 = &unk_1E89BE018;
  v25 = v9;
  v26 = v7;
  v20 = v7;
  objc_msgSend(v19, "setResponseHandler:", &v21);
  -[HMDAppleMediaAccessoryMessenger routeSiriEndpointDeleteSiriHistoryMessage:](v9, "routeSiriEndpointDeleteSiriHistoryMessage:", v19, v21, v22, v23, v24, v25);

}

- (void)routeSiriEndpointDeleteSiriHistoryMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoryMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing siri endpoint delete siri history message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessoryMessenger router](v6, "router");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__HMDAppleMediaAccessoryMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke;
  v10[3] = &unk_1E89BFD28;
  v10[4] = v6;
  objc_msgSend(v9, "routeMessage:localHandler:", v4, v10);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAppleMediaAccessoryMessenger identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMessageRouter)router
{
  return (HMDMessageRouter *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAppleMediaAccessoryLocalMessageHandler)localHandler
{
  return (HMDAppleMediaAccessoryLocalMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localHandler, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_router, 0);
}

void __77__HMDAppleMediaAccessoryMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleSiriEndpointDeleteSiriHistoryMessage:", v3);

}

void __102__HMDAppleMediaAccessoryMessenger_sendDeleteSiriHistoryRequestForAccessoryWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (v5)
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
      v14 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history message responded with error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_58965 != -1)
    dispatch_once(&logCategory__hmf_once_t4_58965, &__block_literal_global_58966);
  return (id)logCategory__hmf_once_v5_58967;
}

void __46__HMDAppleMediaAccessoryMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_58967;
  logCategory__hmf_once_v5_58967 = v0;

}

@end
