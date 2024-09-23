@implementation MTSKeyValueStore

- (MTSKeyValueStore)init
{
  MTSKeychainStore *v3;
  MTSKeyValueStore *v4;

  v3 = -[MTSKeychainStore initWithScope:]([MTSKeychainStore alloc], "initWithScope:", CFSTR("com.apple.matter.support.key.value"));
  v4 = -[MTSKeyValueStore initWithKeychainStore:](self, "initWithKeychainStore:", v3);

  return v4;
}

- (MTSKeyValueStore)initWithKeychainStore:(id)a3
{
  id v5;
  MTSKeyValueStore *v6;
  MTSKeyValueStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSKeyValueStore;
  v6 = -[MTSKeyValueStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keychainStore, a3);

  return v7;
}

- (NSDictionary)storedValuesByKey
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[MTSKeyValueStore keychainStore](self, "keychainStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDataByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__MTSKeyValueStore_storedValuesByKey__block_invoke;
  v7[3] = &unk_250599CD0;
  v7[4] = self;
  objc_msgSend(v4, "na_dictionaryByMappingValues:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (id)storedValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  MTSKeyValueStore *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTSKeyValueStore keychainStore](self, "keychainStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)OPACKDecodeData();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = (void *)MEMORY[0x23493F978]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v16 = v13;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = 0;
        _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode encoded value %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setStoredValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  MTSKeyValueStore *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  MTSKeyValueStore *v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  id v32;
  int v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x23493F978]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v13;
    v36 = 2112;
    v37 = v9;
    _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting value for key: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v33 = 0;
  v14 = (void *)MEMORY[0x23493F84C](v8, 8, &v33);
  if (!v14)
  {
    if (v33)
    {
      v19 = objc_alloc(MEMORY[0x24BDD1540]);
      v20 = *MEMORY[0x24BDD1100];
      v21 = v33;
      v40 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", DebugGetErrorString());
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      v24 = CFSTR("?");
      if (v22)
        v24 = (const __CFString *)v22;
      v41[0] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, v21, v25);

    }
    else
    {
      v17 = 0;
    }
    v26 = (void *)MEMORY[0x23493F978]();
    v27 = v11;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v29;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v17;
    v30 = "%{public}@Failed to encode value %@: %@";
    goto LABEL_15;
  }
  -[MTSKeyValueStore keychainStore](v11, "keychainStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v16 = objc_msgSend(v15, "setData:forKey:error:", v14, v9, &v32);
  v17 = v32;

  if ((v16 & 1) != 0)
  {
    v18 = 1;
    goto LABEL_19;
  }
  v26 = (void *)MEMORY[0x23493F978]();
  v27 = v11;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v29;
    v36 = 2112;
    v37 = v9;
    v38 = 2112;
    v39 = v17;
    v30 = "%{public}@Failed to set value for key %@: %@";
LABEL_15:
    _os_log_impl(&dword_2344FE000, v28, OS_LOG_TYPE_ERROR, v30, buf, 0x20u);

  }
LABEL_16:

  objc_autoreleasePoolPop(v26);
  if (a5)
  {
    v17 = objc_retainAutorelease(v17);
    v18 = 0;
    *a5 = v17;
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (BOOL)removeStoredValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  MTSKeyValueStore *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  MTSKeyValueStore *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v10;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing value for key: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[MTSKeyValueStore keychainStore](v8, "keychainStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = objc_msgSend(v11, "removeDataForKey:error:", v6, &v19);
  v13 = v19;

  if ((v12 & 1) == 0)
  {
    v14 = (void *)MEMORY[0x23493F978]();
    v15 = v8;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_2344FE000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove value for key %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

  return v12;
}

- (BOOL)removeAllStoredValuesWithError:(id *)a3
{
  void *v5;
  MTSKeyValueStore *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  MTSKeyValueStore *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x23493F978](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_impl(&dword_2344FE000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing all values", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[MTSKeyValueStore keychainStore](v6, "keychainStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_msgSend(v9, "removeAllDataWithError:", &v17);
  v11 = v17;

  if ((v10 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x23493F978]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_2344FE000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all values: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }

  return v10;
}

- (MTSKeychainStore)keychainStore
{
  return (MTSKeychainStore *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainStore, 0);
}

id __37__MTSKeyValueStore_storedValuesByKey__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)OPACKDecodeData();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x23493F978]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = 0;
      _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode encoded value %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);

  }
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13 != -1)
    dispatch_once(&logCategory__hmf_once_t13, &__block_literal_global_441);
  return (id)logCategory__hmf_once_v14;
}

void __31__MTSKeyValueStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14;
  logCategory__hmf_once_v14 = v0;

}

@end
