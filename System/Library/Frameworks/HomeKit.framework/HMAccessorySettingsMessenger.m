@implementation HMAccessorySettingsMessenger

- (HMAccessorySettingsMessenger)initWithMessageDispatcher:(id)a3 messageTargetUUID:(id)a4 metricsDispatcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMAccessorySettingsMessenger *v13;
  HMAccessorySettingsMessenger *v14;
  HMAccessorySettingsMessenger *result;
  HMAccessorySettingsMessenger *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (HMAccessorySettingsMessenger *)_HMFPreconditionFailure();
    -[HMAccessorySettingsMessenger sendFetchAccessorySettingsRequestWithAccessoryUUID:keyPaths:completionHandler:](v16, v17, v18, v19, v20);
    return result;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMAccessorySettingsMessenger;
  v13 = -[HMAccessorySettingsMessenger init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_messageDispatcher, a3);
    objc_storeStrong((id *)&v14->_messageTargetUUID, a4);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

- (void)sendFetchAccessorySettingsRequestWithAccessoryUUID:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMAccessorySettingsMessenger *v12;
  NSObject *v13;
  void *v14;
  HMAccessorySettingsFetchRequestMessagePayload *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
    v31 = v14;
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending fetch request message with accessory UUID: %@ key paths: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = -[HMAccessorySettingsFetchRequestMessagePayload initWithAccessoryUUID:keyPaths:]([HMAccessorySettingsFetchRequestMessagePayload alloc], "initWithAccessoryUUID:keyPaths:", v8, v9);
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMAccessorySettingsMessenger messageTargetUUID](v12, "messageTargetUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  v19 = objc_alloc(MEMORY[0x1E0D285F8]);
  -[HMAccessorySettingsFetchRequestMessagePayload payloadCopy](v15, "payloadCopy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithName:destination:payload:", CFSTR("HMAccessorySettingsFetchRequestMessage"), v18, v20);

  v22 = (void *)objc_msgSend(v21, "copy");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __110__HMAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke;
  v27[3] = &unk_1E3AB60C8;
  v28 = v22;
  v29 = v10;
  v27[4] = v12;
  v23 = v22;
  v24 = v10;
  objc_msgSend(v21, "setResponseHandler:", v27);
  -[HMAccessorySettingsMessenger metricsDispatcher](v12, "metricsDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "startEventWithMessage:updateKeyPath:", v21, 0);

  -[HMAccessorySettingsMessenger messageDispatcher](v12, "messageDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendMessage:", v21);

}

- (void)sendUpdateAccessorySettingRequestWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMAccessorySettingsMessenger *v15;
  NSObject *v16;
  void *v17;
  HMAccessorySettingsUpdateRequestMessagePayload *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v34 = v17;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v12;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending update request message with accessory UUID: %@ key path: %@ setting value: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  v18 = -[HMAccessorySettingsUpdateRequestMessagePayload initWithAccessoryUUID:keyPath:settingValue:]([HMAccessorySettingsUpdateRequestMessagePayload alloc], "initWithAccessoryUUID:keyPath:settingValue:", v10, v11, v12);
  v19 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMAccessorySettingsMessenger messageTargetUUID](v15, "messageTargetUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

  v22 = objc_alloc(MEMORY[0x1E0D285F8]);
  -[HMAccessorySettingsUpdateRequestMessagePayload payloadCopy](v18, "payloadCopy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithName:destination:payload:", CFSTR("HMAccessorySettingsUpdateRequestMessage"), v21, v23);

  v25 = (void *)objc_msgSend(v24, "copy");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __122__HMAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke;
  v30[3] = &unk_1E3AB60C8;
  v30[4] = v15;
  v31 = v25;
  v32 = v13;
  v26 = v13;
  v27 = v25;
  objc_msgSend(v24, "setResponseHandler:", v30);
  -[HMAccessorySettingsMessenger metricsDispatcher](v15, "metricsDispatcher");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "startEventWithMessage:updateKeyPath:", v24, v11);

  -[HMAccessorySettingsMessenger messageDispatcher](v15, "messageDispatcher");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sendMessage:", v24);

}

- (void)submitMetricEventWithMessage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMAccessorySettingsMessenger *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HMAccessorySettingsMessenger metricsDispatcher](self, "metricsDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitEventWithMessage:error:", v6, v7);

  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to submit fetch event due to message lost before metric submission", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

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
  -[HMAccessorySettingsMessenger messageTargetUUID](self, "messageTargetUUID");
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

  -[HMAccessorySettingsMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessorySettingsMetricsDispatcher)metricsDispatcher
{
  return (HMAccessorySettingsMetricsDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)messageTargetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
}

void __122__HMAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
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
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v5;
      v12 = "%{public}@Update request message responded with error: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, (uint8_t *)&v18, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v11;
    v12 = "%{public}@Update request message responded";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "submitMetricEventWithMessage:error:", *(_QWORD *)(a1 + 40), v5);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v16, v17);

}

void __110__HMAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  HMAccessorySettingsFetchResponseMessagePayload *v5;
  HMAccessorySettingsFetchResponseMessagePayload *v6;
  HMAccessorySettingsFetchResponseMessagePayload *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  HMAccessorySettingsFetchResponseMessagePayload *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = -[HMAccessorySettingsFetchResponseMessagePayload initWithPayload:]([HMAccessorySettingsFetchResponseMessagePayload alloc], "initWithPayload:", v6);
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v12;
        v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetch request message responded with response payload: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMAccessorySettingsFetchResponseMessagePayload failureInformation](v7, "failureInformation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "failedKeyPaths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        -[HMAccessorySettingsFetchResponseMessagePayload failureInformation](v7, "failureInformation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "payloadCopy");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hmfErrorWithCode:userInfo:", 11, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "submitMetricEventWithMessage:error:", *(_QWORD *)(a1 + 40), v19);
      v25 = *(_QWORD *)(a1 + 48);
      -[HMAccessorySettingsFetchResponseMessagePayload settings](v7, "settings");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v25 + 16))(v25, v19, v26);

    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v24;
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode fetch response using payload: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "submitMetricEventWithMessage:error:", *(_QWORD *)(a1 + 40), v19);
    }

  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v5 = (HMAccessorySettingsFetchResponseMessagePayload *)objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v23;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Fetch request message responded with error: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "submitMetricEventWithMessage:error:", *(_QWORD *)(a1 + 40), v5);
  }

}

+ (id)messageTargetUUIDWithHomeUUID:(id)a3
{
  return a3;
}

+ (id)legacyMessageTargetUUIDWithHomeUUID:(id)a3
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
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("257D2091-3412-4683-8586-B0CF9DF75439"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_41664 != -1)
    dispatch_once(&logCategory__hmf_once_t8_41664, &__block_literal_global_41665);
  return (id)logCategory__hmf_once_v9_41666;
}

void __43__HMAccessorySettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_41666;
  logCategory__hmf_once_v9_41666 = v0;

}

@end
