@implementation HMPersonSettingsManager

- (HMPersonSettingsManager)initWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMPersonSettingsManager *v7;

  v4 = a3;
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMPersonSettingsManager initWithContext:UUID:](self, "initWithContext:UUID:", v5, v6);
  return v7;
}

- (HMPersonSettingsManager)initWithContext:(id)a3 UUID:(id)a4
{
  id v7;
  id v8;
  HMPersonSettingsManager *v9;
  HMPersonSettingsManager *v10;
  uint64_t v11;
  NSUUID *UUID;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMPersonSettingsManager;
  v9 = -[HMPersonSettingsManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_msgSend((id)objc_opt_class(), "personSettingsManagerUUIDFromHomeUUID:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v11;

  }
  return v10;
}

- (void)fetchClassificationNotificationsEnabledForPersonWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMPersonSettingsManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  const __CFString *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching classification notifications enabled for person with uuid: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v16 = CFSTR("HMPersonSettingsManagerPersonUUIDKey");
  v17 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke;
  v14[3] = &unk_1E3AB59B8;
  v14[4] = v9;
  v15 = v7;
  v13 = v7;
  -[HMPersonSettingsManager _sendMessageWithName:payload:responseHandler:](v9, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMPersonSettingsManagerFetchClassificationNotificationsEnabledMessage"), v12, v14);

}

- (void)updateClassificationNotificationsEnabled:(BOOL)a3 forPersonWithUUID:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMPersonSettingsManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  _BOOL8 v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v13;
    v26 = 2048;
    v27 = v6;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Set classification notifications enabled: %lu, for person with uuid: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v22[0] = CFSTR("HMPersonSettingsManagerPersonUUIDKey");
  v22[1] = CFSTR("HMPersonSettingsManagerClassificationNotificationsEnabledKey");
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__HMPersonSettingsManager_updateClassificationNotificationsEnabled_forPersonWithUUID_completion___block_invoke;
  v18[3] = &unk_1E3AB3E78;
  v21 = v6;
  v18[4] = v11;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  -[HMPersonSettingsManager _sendMessageWithName:payload:responseHandler:](v11, "_sendMessageWithName:payload:responseHandler:", CFSTR("HMPersonSettingsManagerSetClassificationNotificationsEnabledMessage"), v15, v18);

}

- (void)_sendMessageWithName:(id)a3 payload:(id)a4 responseHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (void *)MEMORY[0x1E0D285F8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[HMPersonSettingsManager messageDestination](self, "messageDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageWithName:destination:payload:", v11, v12, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setResponseHandler:", v9);
  -[HMPersonSettingsManager context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendMessage:", v15);

}

- (HMFMessageDestination)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMPersonSettingsManager UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return (HMFMessageDestination *)v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMPersonSettingsManager UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __97__HMPersonSettingsManager_updateClassificationNotificationsEnabled_forPersonWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
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
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to update classification notifications enabled with error: %@", (uint8_t *)&v16, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v16 = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully updated classification notifications enabled to %@ for person with UUID: %@", (uint8_t *)&v16, 0x20u);

    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegateCaller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HMPersonSettingsManagerClassificationNotificationsEnabledKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(*(id *)(a1 + 32), "context");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegateCaller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_2;
      v25[3] = &unk_1E3AB5C58;
      v25[4] = *(_QWORD *)(a1 + 32);
      v12 = v9;
      v26 = v12;
      v27 = *(id *)(a1 + 40);
      objc_msgSend(v11, "invokeBlock:", v25);

    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v22;
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find enabled value on message response payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(*(id *)(a1 + 32), "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "delegateCaller");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_12;
      v28[3] = &unk_1E3AB6078;
      v29 = *(id *)(a1 + 40);
      objc_msgSend(v24, "invokeBlock:", v28);

      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v16;
      v35 = 2112;
      v36 = v5;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch classification notifications enabled with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_10;
    v30[3] = &unk_1E3AB60A0;
    v32 = *(id *)(a1 + 40);
    v31 = v5;
    objc_msgSend(v18, "invokeBlock:", v30);

    v12 = v32;
  }

}

uint64_t __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32));
}

void __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, 1, v2);

}

uint64_t __95__HMPersonSettingsManager_fetchClassificationNotificationsEnabledForPersonWithUUID_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
    v8 = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with enabled: %lu", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), 0);
}

+ (id)personSettingsManagerUUIDFromHomeUUID:(id)a3
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
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("C23FC973-0266-4A09-BC05-8BB8A48F79C9"));
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
  if (logCategory__hmf_once_t7 != -1)
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_23205);
  return (id)logCategory__hmf_once_v8;
}

void __38__HMPersonSettingsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8;
  logCategory__hmf_once_v8 = v0;

}

@end
