@implementation HMDAccessorySettingsLocalMessageHandler

- (HMDAccessorySettingsLocalMessageHandler)initWithHomeUUID:(id)a3 languageValuesDataProvider:(id)a4
{
  id v7;
  id v8;
  HMDAccessorySettingsLocalMessageHandler *v9;
  HMDAccessorySettingsLocalMessageHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessorySettingsLocalMessageHandler;
  v9 = -[HMDAccessorySettingsLocalMessageHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeUUID, a3);
    objc_storeStrong((id *)&v10->_languageValuesDataProvider, a4);
  }

  return v10;
}

- (void)handleAccessorySettingsFetchRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySettingsLocalMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  HMDAccessorySettingsLocalMessageHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDAccessorySettingsLocalMessageHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDAccessorySettingsLocalMessageHandler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDAccessorySettingsLocalMessageHandler *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDAccessorySettingsLocalMessageHandler *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  HMDAccessorySettingsLocalMessageHandler *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
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
    v51 = (uint64_t)v8;
    v52 = 2112;
    v53 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling accessory settings fetch request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2E0]), "initWithPayload:", v9);
    if (!v10)
    {
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = v6;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = (uint64_t)v26;
        v52 = 2112;
        v53 = v9;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create fetch request payload with message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
      goto LABEL_32;
    }
    -[HMDAccessorySettingsLocalMessageHandler callerVersionForMessage:](v6, "callerVersionForMessage:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v49 = 0;
      v12 = -[HMDAccessorySettingsLocalMessageHandler dataSourceCallerPrivilegeWithMessage:error:](v6, "dataSourceCallerPrivilegeWithMessage:error:", v4, &v49);
      v13 = v49;
      if (!v13)
      {
        -[HMDAccessorySettingsLocalMessageHandler delegate](v6, "delegate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          objc_msgSend(v10, "keyPaths");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v31, "mutableCopy");

          if (objc_msgSend(v32, "containsObject:", CFSTR("root.siri.availableLanguages")))
          {
            v33 = (void *)MEMORY[0x1D17BA0A0]();
            v34 = v6;
            HMFGetOSLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v36 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v51 = v36;
              v47 = v33;
              v37 = (void *)v36;
              _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Fetching siri available language setting", buf, 0xCu);

              v33 = v47;
            }

            objc_autoreleasePoolPop(v33);
            -[HMDAccessorySettingsLocalMessageHandler siriAvailableLanguagesSetting](v34, "siriAvailableLanguagesSetting");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v38 = 0;
          }
          -[HMDAccessorySettingsLocalMessageHandler homeUUID](v6, "homeUUID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "accessoryUUID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v12;
          v43 = v48;
          objc_msgSend(v48, "accessorySettingsLocalMessageHandler:didReceiveFetchRequestMessage:withHomeUUID:accessoryUUID:keyPaths:callerVersion:callerPrivilege:siriAvailableLanguagesSetting:", v6, v4, v44, v45, v32, v11, v46, v38);

        }
        else
        {
          v39 = (void *)MEMORY[0x1D17BA0A0]();
          v40 = v6;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v51 = (uint64_t)v42;
            _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch settings due to no delegate", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v39);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v32);
          v43 = 0;
        }

        v14 = 0;
        goto LABEL_31;
      }
      v14 = v13;
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = (uint64_t)v18;
        v52 = 2112;
        v53 = v14;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch settings due caller privilege data sourcing error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v6;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = (uint64_t)v30;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch settings due no caller version", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "respondWithError:", v14);
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = v6;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v51 = (uint64_t)v22;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get payload on fetch request message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v10);
LABEL_33:

}

- (id)siriAvailableLanguagesSetting
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessorySettingsLocalMessageHandler languageValuesDataProvider](self, "languageValuesDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageValueList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA5B0]), "initWithKeyPath:readOnly:languageValues:", CFSTR("root.siri.availableLanguages"), 1, v3);
  return v4;
}

- (void)handleAccessorySettingsUpdateRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySettingsLocalMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessorySettingsLocalMessageHandler *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDAccessorySettingsLocalMessageHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDAccessorySettingsLocalMessageHandler *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDAccessorySettingsLocalMessageHandler *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMDAccessorySettingsLocalMessageHandler *v34;
  NSObject *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
    v38 = v8;
    v39 = 2112;
    v40 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling accessory settings update request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2F8]), "initWithPayload:", v9);
    if (v10)
    {
      -[HMDAccessorySettingsLocalMessageHandler callerVersionForMessage:](v6, "callerVersionForMessage:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v10, "settingValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[HMDAccessorySettingsLocalMessageHandler delegate](v6, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[HMDAccessorySettingsLocalMessageHandler homeUUID](v6, "homeUUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "accessoryUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "keyPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "accessorySettingsLocalMessageHandler:didReceiveUpdateRequestMessage:withHomeUUID:accessoryUUID:keyPath:value:callerVersion:", v6, v4, v14, v15, v16, v12, v11);

          }
          else
          {
            v33 = (void *)MEMORY[0x1D17BA0A0]();
            v34 = v6;
            HMFGetOSLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v38 = v36;
              _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting due to no delegate", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v33);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "respondWithError:", v14);
          }

        }
        else
        {
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = v6;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v38 = v32;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting as unable to determine setting value from payload", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v29);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v13);
        }

      }
      else
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        v26 = v6;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v28;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to update setting due no caller version", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v12);
      }

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v6;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v24;
        v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create update request payload with message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v6;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings due to no payload found on message", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v10);
  }

}

- (unint64_t)dataSourceCallerPrivilegeWithMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMDAccessorySettingsLocalMessageHandler *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDAccessorySettingsLocalMessageHandler dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "accessorySettingsLocalMessageHandler:callerPrivilegeWithMessage:", self, v6);
    if (v9 != 2)
      goto LABEL_11;
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v13;
      v14 = "%{public}@Failed to get caller privilege from data source";
LABEL_7:
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v13;
      v14 = "%{public}@Failed to data source composite settings controller due to no data source";
      goto LABEL_7;
    }
  }

  objc_autoreleasePoolPop(v10);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = 2;
LABEL_11:

  return v9;
}

- (id)callerVersionForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDAccessorySettingsLocalMessageHandler *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isRemote") & 1) != 0)
  {
    objc_msgSend(v4, "remoteSourceDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to get caller version from remote source device: %@", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }

  }
  else
  {
    +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (HMDAccessorySettingsLocalMessageHandlerDataSource)dataSource
{
  return (HMDAccessorySettingsLocalMessageHandlerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDAccessorySettingsLocalMessageHandlerDelegate)delegate
{
  return (HMDAccessorySettingsLocalMessageHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMDLanguageValueListSettingDataProvider)languageValuesDataProvider
{
  return (HMDLanguageValueListSettingDataProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageValuesDataProvider, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_86107 != -1)
    dispatch_once(&logCategory__hmf_once_t16_86107, &__block_literal_global_86108);
  return (id)logCategory__hmf_once_v17_86109;
}

void __54__HMDAccessorySettingsLocalMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_86109;
  logCategory__hmf_once_v17_86109 = v0;

}

@end
