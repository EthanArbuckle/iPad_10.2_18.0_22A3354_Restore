@implementation HMDUnifiedLanguageValueListSettingDataProvider

- (id)dataSourceDataProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDUnifiedLanguageValueListSettingDataProvider *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDUnifiedLanguageValueListSettingDataProvider dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "dataProvidersForUnifiedLanguageValueListSettingDataProvider:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get host accessories due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

- (id)languageValueList
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDUnifiedLanguageValueListSettingDataProvider dataSourceDataProviders](self, "dataSourceDataProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "languageValueList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDUnifiedLanguageValueListSettingDataProvider unifyLanguageValues:withValues:](HMDUnifiedLanguageValueListSettingDataProvider, "unifyLanguageValues:withValues:", v8, v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

- (HMDUnifiedLanguageValueListSettingDataProviderDataSource)dataSource
{
  return (HMDUnifiedLanguageValueListSettingDataProviderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)unifyLanguageValues:(id)a3 withValues:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a4;
  objc_msgSend(v5, "setWithArray:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_51558 != -1)
    dispatch_once(&logCategory__hmf_once_t1_51558, &__block_literal_global_51559);
  return (id)logCategory__hmf_once_v2_51560;
}

void __61__HMDUnifiedLanguageValueListSettingDataProvider_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_51560;
  logCategory__hmf_once_v2_51560 = v0;

}

@end
