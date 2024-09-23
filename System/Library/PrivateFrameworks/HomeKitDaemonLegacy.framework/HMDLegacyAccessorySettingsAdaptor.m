@implementation HMDLegacyAccessorySettingsAdaptor

- (HMDLegacyAccessorySettingsAdaptor)initWithQueue:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5 settingsController:(id)a6 subscriptionProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDLegacyAccessorySettingsAdaptor *v18;
  HMDLegacyAccessorySettingsAdaptor *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDLegacyAccessorySettingsAdaptor;
  v18 = -[HMDLegacyAccessorySettingsAdaptor init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v19->_homeUUID, a4);
    objc_storeStrong((id *)&v19->_accessoryUUID, a5);
    objc_storeWeak((id *)&v19->_currentAccessorySettingsController, v16);
    objc_storeStrong((id *)&v19->_subscriptionProvider, a7);
  }

  return v19;
}

- (void)startup
{
  void *v3;
  HMDLegacyAccessorySettingsAdaptor *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDLegacyAccessorySettingsAdaptor *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLegacyAccessorySettingsAdaptor homeUUID](v4, "homeUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLegacyAccessorySettingsAdaptor accessoryUUID](v4, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Subscribing to home: %@, accessory: %@ keyPaths on startup.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CBA2D0], "defaultSettingsAllKeyPaths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke;
  v22[3] = &unk_1E89B09D0;
  v22[4] = v4;
  objc_msgSend(v9, "na_map:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA2D0], "languageKeyPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2;
  v21[3] = &unk_1E89B09D0;
  v21[4] = v4;
  objc_msgSend(v12, "na_map:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && objc_msgSend(v14, "count"))
  {
    -[HMDLegacyAccessorySettingsAdaptor subscriptionProvider](v4, "subscriptionProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_3;
    v20[3] = &unk_1E89C1030;
    v20[4] = v4;
    objc_msgSend(v15, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", v4, v14, MEMORY[0x1E0C9AA60], v20);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = v4;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@No default settings keypaths are found", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)updateSettingWithKeyPath:(id)a3 settingValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  HMDLegacyAccessorySettingsAdaptor *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDLegacyAccessorySettingsAdaptor *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMDLegacyAccessorySettingsAdaptor _settingValueForKeyPath:value:](self, "_settingValueForKeyPath:value:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDLegacyAccessorySettingsAdaptor currentAccessorySettingsController](self, "currentAccessorySettingsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v17;
        v26 = 2114;
        v27 = v8;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending update %{public}@ to controller", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v12, "updateSettingWithKeyPath:settingValue:completion:", v8, v11, v10);
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v22;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@No current settings controller.", (uint8_t *)&v24, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v23);

      v12 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not obtain setting value from given legacy value.", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12);
  }

}

- (id)languageValueList
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_settingValueForKeyPath:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDLegacyAccessorySettingsAdaptor *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMDLegacyAccessorySettingsAdaptor *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDLegacyAccessorySettingsAdaptor *v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  HMDLegacyAccessorySettingsAdaptor *v42;
  NSObject *v43;
  void *v44;
  NSObject *v46;
  void *v47;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(MEMORY[0x1E0CBA2D0], "isKeyPathForBooleanSettingType:", v6))
  {
    if (!objc_msgSend(MEMORY[0x1E0CBA2D0], "isKeyPathForConstrainedNumberSettingType:", v6))
    {
      if (!objc_msgSend(MEMORY[0x1E0CBA2D0], "isKeyPathForTapAssistanceSelectionSettingType:", v6))
      {
        objc_msgSend(MEMORY[0x1E0CBA2D0], "languageKeyPaths");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "containsObject:", v7);

        if (!v38)
        {
          v31 = 0;
          goto LABEL_38;
        }
        v39 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v40 = v39;
        else
          v40 = 0;
        v10 = v40;

        if (!v10)
        {
          v41 = (void *)MEMORY[0x1D17BA0A0]();
          v42 = self;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 138543618;
            v49 = v44;
            v50 = 2112;
            v51 = v39;
            _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Passed value = %@, is not a language setting", (uint8_t *)&v48, 0x16u);

          }
          objc_autoreleasePoolPop(v41);
        }
        -[HMDLegacyAccessorySettingsAdaptor _transformLegacyLanguageSettingValueToImmutableSetting:](self, "_transformLegacyLanguageSettingValueToImmutableSetting:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      v21 = v7;
      if (v21)
      {
        v10 = v21;
        v22 = objc_msgSend(MEMORY[0x1E0CBA2D0], "itemIndexWithTapAssistanceSelectionItem:", v21);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CBA2D0], "scaleUpNumberSettingValue:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "integerValue");

        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 138544130;
          v49 = v29;
          v50 = 2112;
          v51 = v10;
          v52 = 2112;
          v53 = v30;
          v54 = 2114;
          v55 = v6;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Updating legacy selection item index value %@ to %@: %{public}@", (uint8_t *)&v48, 0x2Au);

        }
        objc_autoreleasePoolPop(v26);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA808]), "initWithIntegerValue:", v25);

        goto LABEL_37;
      }
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = self;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543874;
        v49 = v47;
        v50 = 2112;
        v51 = 0;
        v52 = 2114;
        v53 = v6;
        _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Passed in value: %@ is not a selection item for setting: %{public}@", (uint8_t *)&v48, 0x20u);

      }
LABEL_36:

      objc_autoreleasePoolPop(v32);
      v10 = 0;
      v31 = 0;
      goto LABEL_37;
    }
    v12 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v10 = v13;

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CBA2D0], "scaleUpNumberSettingValue:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138544130;
        v49 = v19;
        v50 = 2112;
        v51 = v12;
        v52 = 2112;
        v53 = v20;
        v54 = 2114;
        v55 = v6;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating legacy integer value %@ to %@: %{public}@", (uint8_t *)&v48, 0x2Au);

      }
      objc_autoreleasePoolPop(v16);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA808]), "initWithIntegerValue:", v15);
      goto LABEL_31;
    }
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543874;
      v49 = v35;
      v50 = 2112;
      v51 = v12;
      v52 = 2114;
      v53 = v6;
      v36 = "%{public}@Passed in value: %@ is not a number for integer setting: %{public}@";
      goto LABEL_34;
    }
LABEL_35:

    goto LABEL_36;
  }
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543874;
      v49 = v35;
      v50 = 2112;
      v51 = v8;
      v52 = 2114;
      v53 = v6;
      v36 = "%{public}@Passed in value: %@ is not a number for BOOL setting: %{public}@";
LABEL_34:
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v48, 0x20u);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA7F8]), "initWithBoolValue:", objc_msgSend(v10, "BOOLValue"));
LABEL_31:
  v31 = (void *)v11;
LABEL_37:

LABEL_38:
  return v31;
}

- (id)_transformLegacyLanguageSettingValueToImmutableSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDLegacyAccessorySettingsAdaptor *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 2)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if ((unint64_t)objc_msgSend(v5, "count") >= 5)
    {
      objc_msgSend(v5, "objectAtIndex:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA810]), "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v11, v12, v13, v14);

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
      v16 = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get expected language code count from legacy language setting encoding: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = 0;
  }

  return v10;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDLegacyAccessorySettingsAdaptor *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDLegacyAccessorySettingsAdaptor *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDLegacyAccessorySettingsAdaptor delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "parsedBoolSettingEvent:topic:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v13;
        v27 = 2114;
        v28 = v14;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Forwarding decoded setting event for %{public}@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v9, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "legacySettingsAdaptor:didUpdateSettingKeyPath:BOOLValue:", v11, v15, objc_msgSend(v9, "BOOLValue"));
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "parsedIntegerSettingEvent:topic:", v6, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
      if (v15)
      {
        if (v19)
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(0, "keyPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v20;
          v27 = 2114;
          v28 = v21;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Forwarding decoded setting event for %{public}@", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "integerValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "keyPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "legacySettingsAdaptor:didUpdateSettingKeyPath:numberValue:", v17, v23, v22);

      }
      else
      {
        if (v19)
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v24;
          v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Parsed setting for topic%{public}@ is neither BOOL nor integer", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v16);
        v15 = 0;
      }
    }

  }
}

- (HMDLegacyAccessorySettingsAdaptorDelegate)delegate
{
  return (HMDLegacyAccessorySettingsAdaptorDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return self->_subscriptionProvider;
}

- (HMDLegacyAccessorySettingsAdaptorSettingsOperationProvider)currentAccessorySettingsController
{
  return (HMDLegacyAccessorySettingsAdaptorSettingsOperationProvider *)objc_loadWeakRetained((id *)&self->_currentAccessorySettingsController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentAccessorySettingsController);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

id __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D17B8E58](v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D17B8E58](v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2_4;
  block[3] = &unk_1E89C20C8;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@available language fetch returned Error =%@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "keyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "languageValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "legacySettingsAdaptor:didLoadSettingKeyPath:selectedLanguageValue:availableLanguageList:", v12, v14, v15, v5);

  }
}

void __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_2_4(id *a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  void *context;
  void *v27;
  id obj;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = a1[5];
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (!v3)
      goto LABEL_20;
    v5 = v3;
    v6 = *(_QWORD *)v34;
    *(_QWORD *)&v4 = 138543618;
    v25 = v4;
    v27 = v2;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v7);
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v8, v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "parsedBoolSettingEvent:topic:", v9, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = a1[4];
        if (v10)
        {
          objc_msgSend(v10, "keyPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "legacySettingsAdaptor:didLoadSettingKeyPath:BOOLValue:", v12, v13, objc_msgSend(v11, "BOOLValue"));

          goto LABEL_14;
        }
        objc_msgSend((id)objc_opt_class(), "parsedLanguageSetting:topic:", v9, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(a1[4], "currentAccessorySettingsController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __44__HMDLegacyAccessorySettingsAdaptor_startup__block_invoke_3;
          v29[3] = &unk_1E89B09F8;
          v29[4] = a1[4];
          v30 = a1[6];
          v31 = v2;
          v32 = v14;
          v16 = v14;
          objc_msgSend(v15, "languageValueListWithCompletion:", v29);

LABEL_13:
          goto LABEL_14;
        }
        objc_msgSend((id)objc_opt_class(), "parsedIntegerSettingEvent:topic:", v9, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v16 = v17;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "integerValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = a1[4];
          objc_msgSend(v16, "keyPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "legacySettingsAdaptor:didLoadSettingKeyPath:numberValue:", v19, v20, v18);

          v2 = v27;
          goto LABEL_13;
        }
        context = (void *)MEMORY[0x1D17BA0A0]();
        v21 = a1[4];
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v25;
          v38 = v23;
          v39 = 2114;
          v40 = v8;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Parsed setting for topic%{public}@ is not of {Integer, Bool, Language}", buf, 0x16u);

          v2 = v27;
        }

        objc_autoreleasePoolPop(context);
LABEL_14:

        ++v7;
      }
      while (v5 != v7);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      v5 = v24;
      if (!v24)
      {
LABEL_20:

        break;
      }
    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_87835 != -1)
    dispatch_once(&logCategory__hmf_once_t0_87835, &__block_literal_global_87836);
  return (id)logCategory__hmf_once_v1_87837;
}

+ (id)parsedBoolSettingEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char isKindOfClass;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessorySettingTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9
    && (v11 = (void *)MEMORY[0x1E0CBA2D0],
        objc_msgSend(v9, "accessorySettingKeyPath"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v11) = objc_msgSend(v11, "isKeyPathForBooleanSettingType:", v12),
        v12,
        (_DWORD)v11))
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v6, &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30;
    if (v13)
    {
      v15 = v13;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v17 = v15;
      else
        v17 = 0;
      v18 = v17;

      if ((isKindOfClass & 1) != 0)
      {
        v19 = v15;
      }
      else
      {
        v24 = (void *)MEMORY[0x1D17BA0A0]();
        v25 = a1;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = v24;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v27;
          v33 = 2114;
          v34 = v7;
          _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Obtained setting but not of BOOL type. %{public}@", buf, 0x16u);

          v24 = v29;
        }

        objc_autoreleasePoolPop(v24);
        v19 = 0;
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v23;
        v33 = 2114;
        v34 = v7;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Received setting change event but could not decode. %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)parsedIntegerSettingEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessorySettingTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_10;
  v11 = (void *)MEMORY[0x1E0CBA2D0];
  objc_msgSend(v9, "accessorySettingKeyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isKeyPathForConstrainedNumberSettingType:", v12))
  {
    v13 = (void *)MEMORY[0x1E0CBA2D0];
    objc_msgSend(v10, "accessorySettingKeyPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v13, "isKeyPathForTapAssistanceSelectionSettingType:", v14);

    if ((_DWORD)v13)
      goto LABEL_5;
LABEL_10:
    v19 = 0;
    goto LABEL_15;
  }

LABEL_5:
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v6, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (v15)
  {
    v17 = v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Obtained setting but not of bounded integer type. %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

LABEL_15:
  return v19;
}

+ (id)parsedLanguageSetting:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  id v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessorySettingTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "accessorySettingKeyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(CFSTR("root.siri.language"), "isEqual:", v11);

    if (v12)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v6, &v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v26;
      if (v13)
      {
        v15 = v13;
        objc_opt_class();
        v16 = objc_opt_isKindOfClass() & 1;
        if (v16)
          v17 = v15;
        else
          v17 = 0;
        v18 = v17;

        if (v16)
          goto LABEL_15;
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = a1;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v22;
          v29 = 2114;
          v30 = v7;
          v23 = "%{public}@Obtained setting but not of Language type. %{public}@";
LABEL_13:
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);

        }
      }
      else
      {
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = a1;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v22;
          v29 = 2114;
          v30 = v7;
          v23 = "%{public}@Received setting change event but could not decode. %{public}@";
          goto LABEL_13;
        }
      }

      objc_autoreleasePoolPop(v19);
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  v15 = 0;
LABEL_16:

  return v15;
}

+ (id)parsedLanguageListSetting:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  id v28;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessorySettingTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "accessorySettingKeyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(CFSTR("root.siri.availableLanguages"), "isEqual:", v11);

    if (v12)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v6, &v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v30;
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v18;
        v33 = 2112;
        v34 = v6;
        v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@unable to decode event:%@ %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      if (v13)
      {
        v19 = v13;
        objc_opt_class();
        v20 = objc_opt_isKindOfClass() & 1;
        if (v20)
          v21 = v19;
        else
          v21 = 0;
        v22 = v21;

        if (v20)
          goto LABEL_17;
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = v16;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v26;
          v33 = 2114;
          v34 = v7;
          v27 = "%{public}@Obtained setting but not of Language type. %{public}@";
LABEL_15:
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);

        }
      }
      else
      {
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = v16;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v26;
          v33 = 2114;
          v34 = v7;
          v27 = "%{public}@Received setting change event but could not decode. %{public}@";
          goto LABEL_15;
        }
      }

      objc_autoreleasePoolPop(v23);
      v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }
  v19 = 0;
LABEL_18:

  return v19;
}

void __48__HMDLegacyAccessorySettingsAdaptor_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_87837;
  logCategory__hmf_once_v1_87837 = v0;

}

@end
