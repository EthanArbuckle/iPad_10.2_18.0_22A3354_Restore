@implementation HMSiriEndpointProfilesMessenger

- (HMSiriEndpointProfilesMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMSiriEndpointProfilesMessenger *v10;
  HMSiriEndpointProfilesMessenger *v11;
  HMSiriEndpointProfilesMessenger *result;
  HMSiriEndpointProfilesMessenger *v13;
  SEL v14;
  id v15;
  id v16;
  id v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v13 = (HMSiriEndpointProfilesMessenger *)_HMFPreconditionFailure();
    -[HMSiriEndpointProfilesMessenger sendApplyOnboardingSelectionsRequestWithAccessoryUUID:onboardingSelections:completionHandler:](v13, v14, v15, v16, v17);
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMSiriEndpointProfilesMessenger;
  v10 = -[HMSiriEndpointProfilesMessenger init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v11->_messageDispatcher, a4);
  }

  return v11;
}

- (void)sendApplyOnboardingSelectionsRequestWithAccessoryUUID:(id)a3 onboardingSelections:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMSiriEndpointProfilesMessenger *v12;
  NSObject *v13;
  void *v14;
  HMSiriEndpointApplyOnboardingSelectionsPayload *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMSiriEndpointProfilesMessenger *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v14;
    v33 = 2112;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending apply onboarding selections request with accessory UUID: %@ onboarding selections: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = -[HMSiriEndpointApplyOnboardingSelectionsPayload initWithAccessoryUUID:onboardingSelections:]([HMSiriEndpointApplyOnboardingSelectionsPayload alloc], "initWithAccessoryUUID:onboardingSelections:", v8, v9);
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMSiriEndpointProfilesMessenger messageTargetUUID](v12, "messageTargetUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  v19 = objc_alloc(MEMORY[0x1E0D285F8]);
  -[HMSiriEndpointApplyOnboardingSelectionsPayload payloadCopy](v15, "payloadCopy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithName:destination:payload:", CFSTR("HMSiriEndpointApplyOnboardingSelectionsRequestMessage"), v18, v20);

  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __128__HMSiriEndpointProfilesMessenger_sendApplyOnboardingSelectionsRequestWithAccessoryUUID_onboardingSelections_completionHandler___block_invoke;
  v28 = &unk_1E3AB59B8;
  v29 = v12;
  v30 = v10;
  v22 = v10;
  objc_msgSend(v21, "setResponseHandler:", &v25);
  -[HMSiriEndpointProfilesMessenger messageDispatcher](v12, "messageDispatcher", v25, v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v23, "sendMessage:", v24);

}

- (void)sendDeleteSiriHistoryRequestWithAccessoryUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMSiriEndpointProfilesMessenger *v9;
  NSObject *v10;
  void *v11;
  HMSiriEndpointDeleteSiriHistoryMessagePayload *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  HMSiriEndpointProfilesMessenger *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending delete siri history request with accessory UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = -[HMSiriEndpointDeleteSiriHistoryMessagePayload initWithAccessoryUUID:]([HMSiriEndpointDeleteSiriHistoryMessagePayload alloc], "initWithAccessoryUUID:", v6);
  v13 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMSiriEndpointProfilesMessenger messageTargetUUID](v9, "messageTargetUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

  v16 = objc_alloc(MEMORY[0x1E0D285F8]);
  +[HMSiriEndpointDeleteSiriHistoryMessagePayload messageName](HMSiriEndpointDeleteSiriHistoryMessagePayload, "messageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSiriEndpointDeleteSiriHistoryMessagePayload payloadCopy](v12, "payloadCopy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithName:destination:payload:", v17, v15, v18);

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __99__HMSiriEndpointProfilesMessenger_sendDeleteSiriHistoryRequestWithAccessoryUUID_completionHandler___block_invoke;
  v25 = &unk_1E3AB59B8;
  v26 = v9;
  v27 = v7;
  v20 = v7;
  objc_msgSend(v19, "setResponseHandler:", &v22);
  -[HMSiriEndpointProfilesMessenger messageDispatcher](v9, "messageDispatcher", v22, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendMessage:", v19);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMSiriEndpointProfilesMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

void __99__HMSiriEndpointProfilesMessenger_sendDeleteSiriHistoryRequestWithAccessoryUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
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
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Delete siri history message responded with error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __128__HMSiriEndpointProfilesMessenger_sendApplyOnboardingSelectionsRequestWithAccessoryUUID_onboardingSelections_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *v12;
  HMSiriEndpointApplyOnboardingSelectionsResponsePayload *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v11;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Send apply onboarding selections request responded with error: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if (!v6)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v17;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get apply onboarding selections response payload", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v12 = -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload initWithPayload:]([HMSiriEndpointApplyOnboardingSelectionsResponsePayload alloc], "initWithPayload:", v6);
  v13 = v12;
  if (v12)
  {
    (*(void (**)(_QWORD, _QWORD, int64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, -[HMSiriEndpointApplyOnboardingSelectionsResponsePayload onboardingResult](v12, "onboardingResult"));
    v5 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v21;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode apply onboarding selections response payload: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_16:
}

+ (id)messageTargetUUIDWithHomeUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("CFD1F2B8-1A6D-447F-B7CC-23AE501D9033"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_50584 != -1)
    dispatch_once(&logCategory__hmf_once_t6_50584, &__block_literal_global_50585);
  return (id)logCategory__hmf_once_v7_50586;
}

void __46__HMSiriEndpointProfilesMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_50586;
  logCategory__hmf_once_v7_50586 = v0;

}

@end
