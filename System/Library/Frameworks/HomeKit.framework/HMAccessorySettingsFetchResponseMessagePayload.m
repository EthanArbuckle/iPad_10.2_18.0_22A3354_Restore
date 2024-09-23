@implementation HMAccessorySettingsFetchResponseMessagePayload

- (HMAccessorySettingsFetchResponseMessagePayload)initWithSettings:(id)a3 failureInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySettingsFetchResponseMessagePayload *v9;
  uint64_t v10;
  NSArray *settings;
  HMAccessorySettingsFetchResponseMessagePayload *v13;
  SEL v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v13 = (HMAccessorySettingsFetchResponseMessagePayload *)_HMFPreconditionFailure();
    return (HMAccessorySettingsFetchResponseMessagePayload *)-[HMAccessorySettingsFetchResponseMessagePayload fetchResults](v13, v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)HMAccessorySettingsFetchResponseMessagePayload;
  v9 = -[HMAccessorySettingsFetchResponseMessagePayload init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    settings = v9->_settings;
    v9->_settings = (NSArray *)v10;

    objc_storeStrong((id *)&v9->_failureInformation, a4);
  }

  return v9;
}

- (NSArray)fetchResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  -[HMAccessorySettingsFetchResponseMessagePayload settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_1294);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMAccessorySettingsFetchResponseMessagePayload failureInformation](self, "failureInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "failedKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__HMAccessorySettingsFetchResponseMessagePayload_fetchResults__block_invoke_2;
  v11[3] = &unk_1E3AADAB8;
  v12 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_map:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (HMAccessorySettingsFetchResponseMessagePayload)initWithPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  HMImmutableSetting *v13;
  HMImmutableSetting *v14;
  HMAccessorySettingsPartialFetchFailureInformation *v15;
  void *v16;
  HMAccessorySettingsFetchResponseMessagePayload *v17;
  HMAccessorySettingsFetchResponseMessagePayload *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hmf_arrayForKey:", CFSTR("HMImmutableSettingsPayloadKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v32 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v13 = -[HMImmutableSetting initWithPayload:]([HMImmutableSetting alloc], "initWithPayload:", v12);
          if (!v13)
          {
            v19 = (void *)MEMORY[0x1A1AC1AAC]();
            v17 = self;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v39 = v21;
              v40 = 2112;
              v41 = v12;
              _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to setting payload: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v19);
            v18 = 0;
            v4 = v32;
            goto LABEL_26;
          }
          v14 = v13;
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v9)
          continue;
        break;
      }
    }

    v4 = v32;
    objc_msgSend(v32, "hmf_dictionaryForKey:", HMAccessorySettingsPartialFetchFailureInformationPayloadKey);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v15 = -[HMAccessorySettingsPartialFetchFailureInformation initWithPayload:]([HMAccessorySettingsPartialFetchFailureInformation alloc], "initWithPayload:", v7);
      if (v15)
      {
        v16 = (void *)objc_msgSend(v6, "copy");
        v17 = -[HMAccessorySettingsFetchResponseMessagePayload initWithSettings:failureInformation:](self, "initWithSettings:failureInformation:", v16, v15);

        v18 = v17;
      }
      else
      {
        v28 = (void *)MEMORY[0x1A1AC1AAC]();
        v17 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v30;
          v40 = 2112;
          v41 = v7;
          _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to invalid failure information payload: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        v18 = 0;
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v27;
        v40 = 2112;
        v41 = v32;
        _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to no failure information in payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      v18 = 0;
    }
LABEL_26:

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v24;
      v40 = 2112;
      v41 = v4;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch response message due to no settings in payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v18 = 0;
  }

  return v18;
}

- (id)payloadCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[HMAccessorySettingsFetchResponseMessagePayload settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = CFSTR("HMImmutableSettingsPayloadKey");
  v9[1] = HMAccessorySettingsPartialFetchFailureInformationPayloadKey;
  v10[0] = v4;
  -[HMAccessorySettingsFetchResponseMessagePayload failureInformation](self, "failureInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsFetchResponseMessagePayload settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("settings"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMAccessorySettingsFetchResponseMessagePayload failureInformation](self, "failureInformation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("failureInformation"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v9;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessorySettingsFetchResponseMessagePayload *v4;
  HMAccessorySettingsFetchResponseMessagePayload *v5;
  HMAccessorySettingsFetchResponseMessagePayload *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMAccessorySettingsFetchResponseMessagePayload *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[4];
  HMAccessorySettingsFetchResponseMessagePayload *v17;

  v4 = (HMAccessorySettingsFetchResponseMessagePayload *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMAccessorySettingsFetchResponseMessagePayload settings](self, "settings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      -[HMAccessorySettingsFetchResponseMessagePayload settings](v6, "settings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == objc_msgSend(v9, "count"))
      {
        -[HMAccessorySettingsFetchResponseMessagePayload settings](self, "settings");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __58__HMAccessorySettingsFetchResponseMessagePayload_isEqual___block_invoke;
        v16[3] = &unk_1E3AADB40;
        v11 = v6;
        v17 = v11;
        if (objc_msgSend(v10, "na_allObjectsPassTest:", v16))
        {
          -[HMAccessorySettingsFetchResponseMessagePayload failureInformation](self, "failureInformation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMAccessorySettingsFetchResponseMessagePayload failureInformation](v11, "failureInformation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  return 0;
}

- (NSArray)settings
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (HMAccessorySettingsPartialFetchFailureInformation)failureInformation
{
  return (HMAccessorySettingsPartialFetchFailureInformation *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInformation, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

uint64_t __58__HMAccessorySettingsFetchResponseMessagePayload_isEqual___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t __61__HMAccessorySettingsFetchResponseMessagePayload_payloadCopy__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "payloadCopy");
}

HMAccessorySettingFetchResult *__62__HMAccessorySettingsFetchResponseMessagePayload_fetchResults__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  HMAccessorySettingFetchResult *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[HMAccessorySettingFetchResult initWithKeyPath:failureType:]([HMAccessorySettingFetchResult alloc], "initWithKeyPath:failureType:", v3, objc_msgSend(v2, "fetchFailureTypeForKeyPath:", v3));

  return v4;
}

HMAccessorySettingFetchResult *__62__HMAccessorySettingsFetchResponseMessagePayload_fetchResults__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMAccessorySettingFetchResult *v3;

  v2 = a2;
  v3 = -[HMAccessorySettingFetchResult initWithSetting:]([HMAccessorySettingFetchResult alloc], "initWithSetting:", v2);

  return v3;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_1302 != -1)
    dispatch_once(&logCategory__hmf_once_t4_1302, &__block_literal_global_14);
  return (id)logCategory__hmf_once_v5_1303;
}

void __61__HMAccessorySettingsFetchResponseMessagePayload_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_1303;
  logCategory__hmf_once_v5_1303 = v0;

}

@end
