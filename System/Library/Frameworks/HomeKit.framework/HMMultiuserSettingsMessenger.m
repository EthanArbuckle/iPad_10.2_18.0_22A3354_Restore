@implementation HMMultiuserSettingsMessenger

- (HMMultiuserSettingsMessenger)initWithMessageDispatcher:(id)a3 messageTargetUUID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMMultiuserSettingsMessenger *v10;
  HMMultiuserSettingsMessenger *v11;
  HMMultiuserSettingsMessenger *result;
  HMMultiuserSettingsMessenger *v13;
  SEL v14;
  id v15;
  objc_super v16;

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
    v13 = (HMMultiuserSettingsMessenger *)_HMFPreconditionFailure();
    -[HMMultiuserSettingsMessenger sendFetchMultiuserSettingsRequest:](v13, v14, v15);
    return result;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMMultiuserSettingsMessenger;
  v10 = -[HMMultiuserSettingsMessenger init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_messageDispatcher, a3);
    objc_storeStrong((id *)&v11->_messageTargetUUID, a4);
  }

  return v11;
}

- (void)sendFetchMultiuserSettingsRequest:(id)a3
{
  id v4;
  void *v5;
  HMMultiuserSettingsMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  HMMultiuserSettingsMessenger *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMultiuserSettingsMessenger messageTargetUUID](v6, "messageTargetUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending multiuser fetch request message with targetUUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMMultiuserSettingsMessenger messageTargetUUID](v6, "messageTargetUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMMultiuserSettingsFetchRequestMessage"), v12, 0);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __66__HMMultiuserSettingsMessenger_sendFetchMultiuserSettingsRequest___block_invoke;
  v19 = &unk_1E3AB59B8;
  v20 = v6;
  v21 = v4;
  v14 = v4;
  objc_msgSend(v13, "setResponseHandler:", &v16);
  -[HMMultiuserSettingsMessenger messageDispatcher](v6, "messageDispatcher", v16, v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:", v13);

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMultiuserSettingsMessenger messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("messageTargetUUID"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMultiuserSettingsMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

void __66__HMMultiuserSettingsMessenger_sendFetchMultiuserSettingsRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  HMMultiUserSettingsForMetrics *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v10;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling responseHandler in sendFetchMultiuserSettingsRequest with responsePayload %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v11 = -[HMMultiUserSettingsForMetrics initWithPayload:]([HMMultiUserSettingsForMetrics alloc], "initWithPayload:", v6);
    if (v11)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to instantiate HMMultiUserSettingsForMetrics", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v16 + 16))(v16, v17, 0);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_36852 != -1)
    dispatch_once(&logCategory__hmf_once_t3_36852, &__block_literal_global_36853);
  return (id)logCategory__hmf_once_v4_36854;
}

void __43__HMMultiuserSettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_36854;
  logCategory__hmf_once_v4_36854 = v0;

}

@end
