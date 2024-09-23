@implementation HMDSiriEndpointProfilesMessenger

- (HMDSiriEndpointProfilesMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 messageRouter:(id)a5 messageHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDSiriEndpointProfilesMessenger *v16;
  HMDSiriEndpointProfilesMessenger *v17;
  HMDSiriEndpointProfilesMessenger *result;
  HMDSiriEndpointProfilesMessenger *v19;
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
    v19 = (HMDSiriEndpointProfilesMessenger *)_HMFPreconditionFailure();
    -[HMDSiriEndpointProfilesMessenger registerForMessagesWithHome:](v19, v20, v21);
    return result;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDSiriEndpointProfilesMessenger;
  v16 = -[HMDSiriEndpointProfilesMessenger init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v17->_messageDispatcher, a4);
    objc_storeStrong((id *)&v17->_messageRouter, a5);
    objc_storeStrong((id *)&v17->_messageHandler, a6);
  }

  return v17;
}

- (void)registerForMessagesWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDSiriEndpointProfilesMessenger messageDispatcher](self, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB9B98];
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", v9, self, v10, sel_routeSiriEndpointApplyOnboardingSelectionsRequestMessage_);

  -[HMDSiriEndpointProfilesMessenger messageDispatcher](self, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA868], "messageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = v6;
  v14[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerForMessage:receiver:policies:selector:", v12, self, v13, sel_routeSiriEndpointDeleteSiriHistoryMessage_);

}

- (void)routeSiriEndpointApplyOnboardingSelectionsRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointProfilesMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
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
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing siri endpoint apply onboarding selections request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v13 = 0;
  -[HMDSiriEndpointProfilesMessenger intermediateApplyOnboardingSelectionsRequestMessageForMessage:error:](v6, "intermediateApplyOnboardingSelectionsRequestMessageForMessage:error:", v4, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v9)
  {
    -[HMDSiriEndpointProfilesMessenger messageRouter](v6, "messageRouter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__HMDSiriEndpointProfilesMessenger_routeSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke;
    v12[3] = &unk_1E89BFD28;
    v12[4] = v6;
    objc_msgSend(v11, "routeMessage:localHandler:", v9, v12);

  }
  else
  {
    objc_msgSend(v4, "respondWithError:", v10);
  }

}

- (void)routeSiriEndpointDeleteSiriHistoryMessage:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[HMDSiriEndpointProfilesMessenger messageRouter](self, "messageRouter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__HMDSiriEndpointProfilesMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke;
  v6[3] = &unk_1E89BFD28;
  v6[4] = self;
  objc_msgSend(v5, "routeMessage:localHandler:", v4, v6);

}

- (id)intermediateApplyOnboardingSelectionsRequestMessageForMessage:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDSiriEndpointProfilesMessenger *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  HMDSiriEndpointProfilesMessenger *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CBA858]);
  objc_msgSend(v6, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithPayload:", v8);

  if (v9)
  {
    v10 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", v11);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __104__HMDSiriEndpointProfilesMessenger_intermediateApplyOnboardingSelectionsRequestMessageForMessage_error___block_invoke;
    v17[3] = &unk_1E89BB158;
    v18 = v6;
    v19 = self;
    v20 = v9;
    objc_msgSend(v10, "setResponseHandler:", v17);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory UUID for intermediate apply onboarding selections message handler using message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfilesMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (HMDMessageRouter)messageRouter
{
  return (HMDMessageRouter *)objc_getProperty(self, a2, 24, 1);
}

- (HMDSiriEndpointProfileMessageHandler)messageHandler
{
  return (HMDSiriEndpointProfileMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_messageRouter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

void __104__HMDSiriEndpointProfilesMessenger_intermediateApplyOnboardingSelectionsRequestMessageForMessage_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(a1[4], "respondWithPayload:error:", v6, v5);
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA860]), "initWithPayload:", v6);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = CFSTR("accessoryUUID");
      v10 = a1[5];
      objc_msgSend(a1[6], "accessoryUUID", CFSTR("accessoryUUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = CFSTR("HMDSiriEndpointProfileNeedsOnboardingResultCodingKey");
      v23[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "onboardingResult"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("HMDSiriEndpointProfileUpdateNeedsOnboardingNotification"), v10, v13);

    }
    else
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = a1[5];
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v21;
        v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response using apply onboarding intermediate response payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0](v7);
    v15 = a1[5];
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response payload for apply onboarding intermediate response with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

void __78__HMDSiriEndpointProfilesMessenger_routeSiriEndpointDeleteSiriHistoryMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "messageHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleSiriEndpointDeleteSiriHistoryRequestMessage:", v3);

}

void __93__HMDSiriEndpointProfilesMessenger_routeSiriEndpointApplyOnboardingSelectionsRequestMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "messageHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleSiriEndpointApplyOnboardingSelectionsRequestMessage:", v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_22608 != -1)
    dispatch_once(&logCategory__hmf_once_t4_22608, &__block_literal_global_22609);
  return (id)logCategory__hmf_once_v5_22610;
}

void __47__HMDSiriEndpointProfilesMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_22610;
  logCategory__hmf_once_v5_22610 = v0;

}

@end
