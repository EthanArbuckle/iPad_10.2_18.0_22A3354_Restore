@implementation MTSKeychainStore

- (MTSKeychainStore)initWithScope:(id)a3
{
  id v4;
  void *v5;
  MTSKeychainStoreDataSource *v6;
  MTSKeychainStore *v7;
  MTSKeychainStore *v9;
  SEL v10;
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc_init(MTSKeychainStoreDataSource);
    v7 = -[MTSKeychainStore initWithScope:dataSource:](self, "initWithScope:dataSource:", v5, v6);

    return v7;
  }
  else
  {
    v9 = (MTSKeychainStore *)_HMFPreconditionFailure();
    return -[MTSKeychainStore initWithScope:dataSource:](v9, v10, v11, v12);
  }
}

- (MTSKeychainStore)initWithScope:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSKeychainStore *v9;
  uint64_t v10;
  NSString *scope;
  MTSKeychainStore *v13;
  SEL v14;
  id v15;
  objc_super v16;

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
    v13 = (MTSKeychainStore *)_HMFPreconditionFailure();
    return (MTSKeychainStore *)-[MTSKeychainStore dataForKey:](v13, v14, v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)MTSKeychainStore;
  v9 = -[MTSKeychainStore init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    scope = v9->_scope;
    v9->_scope = (NSString *)v10;

    objc_storeStrong((id *)&v9->_dataSource, a4);
  }

  return v9;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  MTSKeychainStore *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MTSKeychainStore *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTSKeychainStore queryDictionaryForKey:isExpectingReturnData:](self, "queryDictionaryForKey:isExpectingReturnData:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSKeychainStore dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v6, "resultMatchingQuery:error:", v5, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v7)
  {
    v9 = v7;
    objc_opt_class();
    v10 = objc_opt_isKindOfClass() & 1;
    if (v10)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if (v10)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDE9550]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (void *)MEMORY[0x23493F978]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138544130;
        v27 = v21;
        v28 = 2112;
        v29 = v4;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v9;
        v23 = v22;
        _os_log_impl(&dword_2344FE000, v20, OS_LOG_TYPE_ERROR, "%{public}@Keychain item query result for key %@ was of unexpected class %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v18);
      v13 = 0;
    }

  }
  else
  {
    if (objc_msgSend(v8, "code") != -25300)
    {
      v14 = (void *)MEMORY[0x23493F978]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v17;
        v28 = 2112;
        v29 = v4;
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_2344FE000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to query keychain item for key %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }
    v13 = 0;
  }

  return v13;
}

- (NSDictionary)allDataByKey
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MTSKeychainStore *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  MTSKeychainStore *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[MTSKeychainStore queryDictionaryForKey:isExpectingReturnData:](self, "queryDictionaryForKey:isExpectingReturnData:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSKeychainStore dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v4, "resultMatchingQuery:error:", v3, &v40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v40;

  if (v5)
  {
    v7 = v5;
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() & 1;
    if (v8)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

    if (v8)
    {
      v34 = v6;
      v35 = v3;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v37;
        v15 = *MEMORY[0x24BDE8FA8];
        v16 = *MEMORY[0x24BDE9550];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v37 != v14)
              objc_enumerationMutation(v10);
            v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v19);

          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v13);
      }

      v21 = (void *)objc_msgSend(v11, "copy");
      v6 = v34;
      v3 = v35;
    }
    else
    {
      v26 = (void *)MEMORY[0x23493F978]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = v6;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v43 = v30;
        v44 = 2112;
        v45 = v31;
        v46 = 2112;
        v47 = v7;
        v32 = v31;
        _os_log_impl(&dword_2344FE000, v28, OS_LOG_TYPE_ERROR, "%{public}@Keychain item query result was of unexpected class %@: %@", buf, 0x20u);

        v6 = v29;
      }

      objc_autoreleasePoolPop(v26);
      v21 = (void *)MEMORY[0x24BDBD1B8];
    }

  }
  else
  {
    if (objc_msgSend(v6, "code") != -25300)
    {
      v22 = (void *)MEMORY[0x23493F978]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v25;
        v44 = 2112;
        v45 = v6;
        _os_log_impl(&dword_2344FE000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to query all keychain items: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
    v21 = (void *)MEMORY[0x24BDBD1B8];
  }

  return (NSDictionary *)v21;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  MTSKeychainStore *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  MTSKeychainStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  MTSKeychainStore *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  MTSKeychainStore *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
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
    v41 = v13;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting data for key: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[MTSKeychainStore attributeDictionaryForAddingData:forKey:](v11, "attributeDictionaryForAddingData:forKey:", v8, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x23493F978]();
  v16 = v11;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v18;
    v42 = 2112;
    v43 = v14;
    _os_log_impl(&dword_2344FE000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Adding keychain item with attributes: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[MTSKeychainStore dataSource](v16, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v20 = objc_msgSend(v19, "addItemWithAttributes:error:", v14, &v39);
  v21 = v39;

  if ((v20 & 1) != 0)
  {
    v22 = 1;
LABEL_19:
    v24 = v14;
    goto LABEL_20;
  }
  if (objc_msgSend(v21, "code") != -25299)
  {
    v28 = (void *)MEMORY[0x23493F978]();
    v29 = v16;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v31;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v21;
      _os_log_impl(&dword_2344FE000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to add keychain item with attributes %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    v22 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v21);
    goto LABEL_19;
  }
  -[MTSKeychainStore queryDictionaryForKey:isExpectingReturnData:](v16, "queryDictionaryForKey:isExpectingReturnData:", v9, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSKeychainStore attributeDictionaryForUpdatingData:](v16, "attributeDictionaryForUpdatingData:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTSKeychainStore dataSource](v16, "dataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v26 = objc_msgSend(v25, "updateItemMatchingQuery:withAttributes:error:", v23, v24, &v38);
  v27 = v38;

  if ((v26 & 1) != 0)
  {

    v22 = 1;
  }
  else
  {
    v32 = (void *)MEMORY[0x23493F978]();
    v33 = v16;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = v32;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v35;
      v42 = 2112;
      v43 = v23;
      v44 = 2112;
      v45 = v24;
      v46 = 2112;
      v47 = v27;
      _os_log_impl(&dword_2344FE000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to update keychain item with query %@ and attributes %@: %@", buf, 0x2Au);

      v32 = v37;
    }

    objc_autoreleasePoolPop(v32);
    if (a5)
      *a5 = objc_retainAutorelease(v27);

    v22 = 0;
  }
LABEL_20:

  return v22;
}

- (BOOL)removeDataForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  MTSKeychainStore *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  MTSKeychainStore *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  BOOL v19;
  void *v21;
  MTSKeychainStore *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
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
    v27 = v10;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing data for key: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[MTSKeychainStore queryDictionaryForKey:isExpectingReturnData:](v8, "queryDictionaryForKey:isExpectingReturnData:", v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x23493F978]();
  v13 = v8;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v15;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_2344FE000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Removing keychain item matching query: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  -[MTSKeychainStore dataSource](v13, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v17 = objc_msgSend(v16, "removeItemsMatchingQuery:error:", v11, &v25);
  v18 = v25;

  if ((v17 & 1) != 0 || objc_msgSend(v18, "code") == -25300)
  {
    v19 = 1;
  }
  else
  {
    v21 = (void *)MEMORY[0x23493F978]();
    v22 = v13;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v24;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v18;
      _os_log_impl(&dword_2344FE000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove keychain item with query %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v19 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v18);
  }

  return v19;
}

- (BOOL)removeAllDataWithError:(id *)a3
{
  void *v5;
  MTSKeychainStore *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  MTSKeychainStore *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  BOOL v17;
  void *v19;
  MTSKeychainStore *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x23493F978](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    _os_log_impl(&dword_2344FE000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing all data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[MTSKeychainStore queryDictionaryForKey:isExpectingReturnData:](v6, "queryDictionaryForKey:isExpectingReturnData:", 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x23493F978]();
  v11 = v6;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Removing all keychain items matching query: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[MTSKeychainStore dataSource](v11, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v15 = objc_msgSend(v14, "removeItemsMatchingQuery:error:", v9, &v23);
  v16 = v23;

  if ((v15 & 1) != 0 || objc_msgSend(v16, "code") == -25300)
  {
    v17 = 1;
  }
  else
  {
    v19 = (void *)MEMORY[0x23493F978]();
    v20 = v11;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v22;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_2344FE000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all keychain items %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v17 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v16);
  }

  return v17;
}

- (id)queryDictionaryForKey:(id)a3 isExpectingReturnData:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDBCED8];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x24BDE9230], *MEMORY[0x24BDE9220]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("com.apple.matter.support"), *MEMORY[0x24BDE8F50]);
  -[MTSKeychainStore scope](self, "scope");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDE9128]);

  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x24BDE9148], *MEMORY[0x24BDE9140]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDE8FA8]);

  if (v4)
  {
    v10 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDE94C8]);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDE94C0]);
    v11 = (_QWORD *)MEMORY[0x24BDE93C0];
    if (!v7)
      v11 = (_QWORD *)MEMORY[0x24BDE93B8];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *v11, *MEMORY[0x24BDE93B0]);
  }
  v12 = (void *)objc_msgSend(v8, "copy");

  return v12;
}

- (id)attributeDictionaryForAddingData:(id)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[8];
  _QWORD v17[9];

  v17[8] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDE9230];
  v7 = *MEMORY[0x24BDE8F50];
  v16[0] = *MEMORY[0x24BDE9220];
  v16[1] = v7;
  v17[0] = v6;
  v17[1] = CFSTR("com.apple.matter.support");
  v16[2] = *MEMORY[0x24BDE9128];
  v8 = a4;
  v9 = a3;
  -[MTSKeychainStore scope](self, "scope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDE9140];
  v17[2] = v10;
  v17[3] = MEMORY[0x24BDBD1C8];
  v12 = *MEMORY[0x24BDE8F60];
  v16[3] = v11;
  v16[4] = v12;
  v17[4] = *MEMORY[0x24BDE8F68];
  v17[5] = MEMORY[0x24BDBD1C8];
  v13 = *MEMORY[0x24BDE8FA8];
  v16[5] = *MEMORY[0x24BDE9008];
  v16[6] = v13;
  v16[7] = *MEMORY[0x24BDE9550];
  v17[6] = v8;
  v17[7] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)attributeDictionaryForUpdatingData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = *MEMORY[0x24BDE9550];
  v8[0] = a3;
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)scope
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (MTSKeychainStoreDataSource)dataSource
{
  return (MTSKeychainStoreDataSource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1)
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global);
  return (id)logCategory__hmf_once_v21;
}

void __31__MTSKeychainStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v21;
  logCategory__hmf_once_v21 = v0;

}

@end
