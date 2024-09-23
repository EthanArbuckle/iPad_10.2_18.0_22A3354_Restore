@implementation HMAccessorySettingsController

- (HMAccessorySettingsController)initWithContext:(id)a3 messengerFactory:(id)a4 metricsDispatcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMAccessorySettingsController *v13;
  HMAccessorySettingsController *v14;
  HMAccessorySettingsController *result;
  HMAccessorySettingsController *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  objc_super v23;

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
    v16 = (HMAccessorySettingsController *)_HMFPreconditionFailure();
    -[HMAccessorySettingsController updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:completionHandler:](v16, v17, v18, v19, v20, v21, v22);
    return result;
  }
  v23.receiver = self;
  v23.super_class = (Class)HMAccessorySettingsController;
  v13 = -[HMAccessorySettingsController init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeWeak((id *)&v14->_messengerFactory, v10);
    objc_storeStrong((id *)&v14->_metricsDispatcher, a5);
  }

  return v14;
}

- (void)updateAccessorySettingWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPath:(id)a5 settingValue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMAccessorySettingsController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  HMAccessorySettingsController *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  HMAccessorySettingsController *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMAccessorySettingsController *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x1A1AC1AAC]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v60 = v20;
    v61 = 2112;
    v62 = v12;
    v63 = 2112;
    v64 = v13;
    v65 = 2114;
    v66 = v14;
    v67 = 2112;
    v68 = v15;
    _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating accessory setting with home identifier: %@ accessory identifier: %@ key path: %{public}@ value: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v17);
  -[HMAccessorySettingsController dataSourceHomeWithHomeIdentifier:](v18, "dataSourceHomeWithHomeIdentifier:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "accessoryWithUniqueIdentifier:", v13);
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      objc_msgSend(v22, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsController messengerWithHomeUUID:](v18, "messengerWithHomeUUID:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v24, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __133__HMAccessorySettingsController_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke;
        v55[3] = &unk_1E3AB4210;
        v55[4] = v18;
        v56 = v14;
        v28 = v15;
        v53 = v22;
        v29 = v12;
        v30 = v13;
        v31 = v15;
        v32 = v14;
        v33 = v28;
        v57 = v28;
        v58 = v16;
        v34 = v33;
        v14 = v32;
        v15 = v31;
        v13 = v30;
        v12 = v29;
        v22 = v53;
        objc_msgSend(v26, "sendUpdateAccessorySettingRequestWithAccessoryUUID:keyPath:settingValue:completionHandler:", v27, v56, v34, v55);

      }
      else
      {
        v46 = (void *)MEMORY[0x1A1AC1AAC]();
        v47 = v18;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = v46;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v60 = v49;
          _os_log_impl(&dword_19B1B0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory setting due to no messenger", buf, 0xCu);

          v46 = v54;
        }

        objc_autoreleasePoolPop(v46);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessorySettingsController context](v47, "context");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "delegateCaller");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "callCompletion:error:", v16, v50);

        v26 = 0;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x1A1AC1AAC]();
      v41 = v18;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v43;
        v61 = 2112;
        v62 = v13;
        _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory setting due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsController context](v41, "context");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "delegateCaller");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "callCompletion:error:", v16, v26);

      v24 = 0;
    }
  }
  else
  {
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = v18;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v38;
      v61 = 2112;
      v62 = v12;
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory setting due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsController context](v36, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "delegateCaller");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "callCompletion:error:", v16, v24);

  }
}

- (id)messengerWithHomeUUID:(id)a3
{
  id v4;
  void *v5;
  HMAccessorySettingsMessenger *messenger;
  HMAccessorySettingsMessenger *v7;
  HMAccessorySettingsMessenger *v8;
  HMAccessorySettingsMessenger *v9;
  void *v10;
  HMAccessorySettingsController *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessorySettingsController messengerFactory](self, "messengerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  messenger = self->_messenger;
  if (!messenger)
  {
    objc_msgSend(v5, "createAccessorySettingsMessengerWithHomeUUID:", v4);
    v7 = (HMAccessorySettingsMessenger *)objc_claimAutoreleasedReturnValue();
    v8 = self->_messenger;
    self->_messenger = v7;

    messenger = self->_messenger;
  }
  v9 = messenger;
  os_unfair_lock_unlock(&self->_lock);
  if (!v9)
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get accessory settings messenger with factory: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

  return v9;
}

- (id)dataSourceHomeWithHomeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMAccessorySettingsController *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessorySettingsController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accessorySettingsController:homeWithHomeIdentifier:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source accessory UUID due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (HMAccessorySettingsMessengerFactory)messengerFactory
{
  return (HMAccessorySettingsMessengerFactory *)objc_loadWeakRetained((id *)&self->_messengerFactory);
}

- (void)setMessengerFactory:(id)a3
{
  objc_storeWeak((id *)&self->_messengerFactory, a3);
}

- (HMAccessorySettingsMetricsDispatcher)metricsDispatcher
{
  return (HMAccessorySettingsMetricsDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMAccessorySettingsControllerDataSource)dataSource
{
  return (HMAccessorySettingsControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_destroyWeak((id *)&self->_messengerFactory);
  objc_storeStrong((id *)&self->_messenger, 0);
}

void __133__HMAccessorySettingsController_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      v21 = 2112;
      v22 = v3;
      v10 = "%{public}@Update accessory setting completed keyPath: %{public}@, with error: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v11, v12, v10, (uint8_t *)&v17, 0x20u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 48);
    v17 = 138543874;
    v18 = v8;
    v19 = 2114;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v10 = "%{public}@Update accessory setting completed keyPath: %{public}@, value: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "delegateCaller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "callCompletion:error:", *(_QWORD *)(a1 + 56), v3);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9 != -1)
    dispatch_once(&logCategory__hmf_once_t9, &__block_literal_global_3925);
  return (id)logCategory__hmf_once_v10;
}

void __44__HMAccessorySettingsController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10;
  logCategory__hmf_once_v10 = v0;

}

- (void)updateAccessorySettingWithAccessoryIdentifier:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMAccessorySettingsController context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegateCaller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __132__HMAccessorySettingsController_Deprecations__updateAccessorySettingWithAccessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke;
  v20[3] = &unk_1E3AB52E0;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v15, "invokeBlock:", v20);

}

void __132__HMAccessorySettingsController_Deprecations__updateAccessorySettingWithAccessoryIdentifier_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    v10 = 138544130;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Updating accessory setting with accessory identifier: %@ key path: %@ value: %@", (uint8_t *)&v10, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

@end
