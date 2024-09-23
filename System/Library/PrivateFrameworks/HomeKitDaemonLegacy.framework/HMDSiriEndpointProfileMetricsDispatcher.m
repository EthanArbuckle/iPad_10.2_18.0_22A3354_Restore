@implementation HMDSiriEndpointProfileMetricsDispatcher

- (HMDSiriEndpointProfileMetricsDispatcher)initWithAccessoryUUID:(id)a3 homeUUID:(id)a4 logEventSubmitter:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDSiriEndpointProfileMetricsDispatcher *v13;
  HMDSiriEndpointProfileMetricsDispatcher *v14;
  HMDSiriEndpointProfileMetricsDispatcher *result;
  HMDSiriEndpointProfileMetricsDispatcher *v16;
  SEL v17;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_7:
    v16 = (HMDSiriEndpointProfileMetricsDispatcher *)_HMFPreconditionFailure();
    -[HMDSiriEndpointProfileMetricsDispatcher submitRoutineConfigurationEvent](v16, v17);
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDSiriEndpointProfileMetricsDispatcher;
  v13 = -[HMDSiriEndpointProfileMetricsDispatcher init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeUUID, a4);
    objc_storeStrong((id *)&v14->_accessoryUUID, a3);
    objc_storeStrong((id *)&v14->_logEventSubmitter, a5);
  }

  return v14;
}

- (void)submitRoutineConfigurationEvent
{
  void *v3;
  HMDSiriEndpointProfileMetricsDispatcher *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[HMDSiriEndpointProfileMetricsDispatcher dataSourceShouldSubmitRoutineConfigurationEvent](self, "dataSourceShouldSubmitRoutineConfigurationEvent"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting routine configuration event", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDSiriEndpointProfileMetricsDispatcher fetchAccessorySettingFields](v4, "fetchAccessorySettingFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke;
    v12[3] = &unk_1E89C2350;
    v12[4] = v4;
    v9 = (id)objc_msgSend(v7, "addFailureBlock:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke_4;
    v11[3] = &unk_1E89B0D78;
    v11[4] = v4;
    v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v11);

  }
}

- (void)submitRoutineConfigurationEventWithAccessorySettingFields:(id)a3
{
  id v4;
  void *v5;
  HMDSiriEndpointProfileRoutineConfigurationEvent *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDSiriEndpointProfileMetricsDispatcher dataSourceAccessoryCategoryType](self, "dataSourceAccessoryCategoryType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointProfileMetricsDispatcher dataSourceProfileFields](self, "dataSourceProfileFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDSiriEndpointProfileRoutineConfigurationEvent initWithAccessoryCategoryType:profileFields:accessorySettingFields:]([HMDSiriEndpointProfileRoutineConfigurationEvent alloc], "initWithAccessoryCategoryType:profileFields:accessorySettingFields:", v8, v5, v4);

  -[HMDSiriEndpointProfileMetricsDispatcher logEventSubmitter](self, "logEventSubmitter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "submitLogEvent:", v6);

}

- (id)fetchAccessorySettingFields
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  HMDSiriEndpointProfileAccessorySettingFields *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HMDSiriEndpointProfileMetricsDispatcher dataSourceCompositeSettingsControllerManager](self, "dataSourceCompositeSettingsControllerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDSiriEndpointProfileMetricsDispatcher accessoryUUID](self, "accessoryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSiriEndpointProfileMetricsDispatcher homeUUID](self, "homeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDSiriEndpointProfileAccessorySettingFields keyPaths](HMDSiriEndpointProfileAccessorySettingFields, "keyPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__HMDSiriEndpointProfileMetricsDispatcher_fetchAccessorySettingFields__block_invoke;
    v13[3] = &unk_1E89B3180;
    v13[4] = self;
    v8 = v3;
    v14 = v8;
    objc_msgSend(v4, "localFetchSettingsForUUID:homeUUID:withKeyPaths:completion:", v5, v6, v7, v13);

    v9 = v8;
  }
  else
  {
    v10 = objc_alloc_init(HMDSiriEndpointProfileAccessorySettingFields);
    objc_msgSend(v3, "finishWithResult:", v10);
    v11 = v3;

  }
  return v3;
}

- (BOOL)dataSourceShouldSubmitRoutineConfigurationEvent
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDSiriEndpointProfileMetricsDispatcher *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDSiriEndpointProfileMetricsDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "shouldSubmitRoutineConfigurationEventForSiriEndpointProfileMetricsDispatcher:", self);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get should submit routine configuration event due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)dataSourceAccessoryCategoryType
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  HMDSiriEndpointProfileMetricsDispatcher *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDSiriEndpointProfileMetricsDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessoryCategoryTypeForSiriEndpointProfileMetricsDispatcher:", self);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory category type due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = CFSTR("NoDataSource");
  }

  return v5;
}

- (id)dataSourceCompositeSettingsControllerManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDSiriEndpointProfileMetricsDispatcher *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDSiriEndpointProfileMetricsDispatcher *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDSiriEndpointProfileMetricsDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "compositeSettingsControllerManagerForSiriEndpointProfileMetricsDispatcher:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "compositeSettingsControllerManagerForSiriEndpointProfileMetricsDispatcher:", self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v14;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to get composite settings controller manager from data source: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v6 = 0;
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory category type due to no data source", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = 0;
  }

  return v6;
}

- (id)dataSourceProfileFields
{
  void *v3;
  void *v4;
  HMDSiriEndpointProfileFields *v5;
  void *v6;
  HMDSiriEndpointProfileMetricsDispatcher *v7;
  NSObject *v8;
  void *v9;
  HMDSiriEndpointProfileFields *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDSiriEndpointProfileMetricsDispatcher dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "profileFieldsForSiriEndpointProfileMetricsDispatcher:", self);
    v5 = (HMDSiriEndpointProfileFields *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get profile fields due to no data source", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = -[HMDSiriEndpointProfileFields initWithNeedsOnboardingField:supportsOnboardingField:siriEnableField:siriListeningField:siriTouchToUseField:siriLightOnUseField:siriSoundOnUseField:]([HMDSiriEndpointProfileFields alloc], "initWithNeedsOnboardingField:supportsOnboardingField:siriEnableField:siriListeningField:siriTouchToUseField:siriLightOnUseField:siriSoundOnUseField:", CFSTR("NoDataSource"), CFSTR("NoDataSource"), CFSTR("NoDataSource"), CFSTR("NoDataSource"), CFSTR("NoDataSource"), CFSTR("NoDataSource"), CFSTR("NoDataSource"));
  }
  v10 = v5;

  return v10;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfileMetricsDispatcher accessoryUUID](self, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDSiriEndpointProfileMetricsDispatcherDataSource)dataSource
{
  return (HMDSiriEndpointProfileMetricsDispatcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __70__HMDSiriEndpointProfileMetricsDispatcher_fetchAccessorySettingFields__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  HMDSiriEndpointProfileAccessorySettingFields *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v42 = a3;
  v41 = a4;
  v48 = objc_alloc_init(HMDSiriEndpointProfileAccessorySettingFields);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = v7;
  v49 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
  if (v49)
  {
    v9 = *(_QWORD *)v51;
    v43 = a1;
    v47 = *(_QWORD *)v51;
    v46 = v8;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v11, "setting", v41, v42);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
            v14 = v12;
          else
            v14 = 0;
          v15 = v14;
          if ((isKindOfClass & 1) != 0)
          {
            v16 = objc_msgSend(v12, "BOOLValue");
            objc_msgSend(v11, "keyPath");
            v17 = (id)objc_claimAutoreleasedReturnValue();
            -[HMDSiriEndpointProfileAccessorySettingFields setBoolValue:forKeyPath:](v48, "setBoolValue:forKeyPath:", v16, v17);
          }
          else
          {
            v24 = v12;
            objc_opt_class();
            v25 = objc_opt_isKindOfClass();
            if ((v25 & 1) != 0)
              v26 = v24;
            else
              v26 = 0;
            v17 = v26;

            if ((v25 & 1) != 0)
            {
              objc_msgSend(v24, "numberValue");
              v27 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "keyPath");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDSiriEndpointProfileAccessorySettingFields setNumberValue:forKeyPath:](v48, "setNumberValue:forKeyPath:", v27, v28);

            }
            else
            {
              v29 = v24;
              objc_opt_class();
              v30 = objc_opt_isKindOfClass();
              if ((v30 & 1) != 0)
                v31 = v29;
              else
                v31 = 0;
              v27 = v31;

              if ((v30 & 1) != 0)
              {
                v45 = objc_alloc(MEMORY[0x1E0CBA810]);
                objc_msgSend(v29, "inputLanguageCode");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "outputVoiceLanguageCode");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "outputVoiceGenderCode");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "voiceName");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (void *)objc_msgSend(v45, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v44, v32, v33, v34);

                a1 = v43;
                objc_msgSend(v11, "keyPath");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDSiriEndpointProfileAccessorySettingFields setLanguageValue:forKeyPath:](v48, "setLanguageValue:forKeyPath:", v35, v36);

              }
              else
              {
                v37 = (void *)MEMORY[0x1D17BA0A0]();
                v38 = *(id *)(a1 + 32);
                HMFGetOSLogHandle();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v55 = v40;
                  v56 = 2112;
                  v57 = v11;
                  _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to set setting from result: %@", buf, 0x16u);

                  a1 = v43;
                }

                objc_autoreleasePoolPop(v37);
              }
              v8 = v46;
            }

            v9 = v47;
          }

        }
        else
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "keyPath");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "error");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v55 = v21;
            v56 = 2112;
            v57 = v22;
            v58 = 2112;
            v59 = v23;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to local fetch setting for key path: %@ error: %@", buf, 0x20u);

            v9 = v47;
          }

          objc_autoreleasePoolPop(v18);
        }

      }
      v49 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    }
    while (v49);
  }

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v48);
}

void __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  HMDSiriEndpointProfileAccessorySettingFields *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Fetch accessory setting fields failed", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v8 = objc_alloc_init(HMDSiriEndpointProfileAccessorySettingFields);
  objc_msgSend(*(id *)(a1 + 32), "submitRoutineConfigurationEventWithAccessorySettingFields:", v8);

}

uint64_t __74__HMDSiriEndpointProfileMetricsDispatcher_submitRoutineConfigurationEvent__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "submitRoutineConfigurationEventWithAccessorySettingFields:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_90984 != -1)
    dispatch_once(&logCategory__hmf_once_t12_90984, &__block_literal_global_90985);
  return (id)logCategory__hmf_once_v13_90986;
}

void __54__HMDSiriEndpointProfileMetricsDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_90986;
  logCategory__hmf_once_v13_90986 = v0;

}

@end
