@implementation HMUserActionPredictionDuetDataSource

- (NSArray)predictions
{
  if (self)
    self = (HMUserActionPredictionDuetDataSource *)objc_getProperty(self, a2, 24, 1);
  return (NSArray *)self;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_29911 != -1)
    dispatch_once(&logCategory__hmf_once_t6_29911, &__block_literal_global_29912);
  return (id)logCategory__hmf_once_v7_29913;
}

- (HMUserActionPredictionDuetDataSource)initWithCacheManager:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMUserActionPredictionDuetDataSource *v7;

  v4 = (void *)MEMORY[0x1E0CF6400];
  v5 = a3;
  objc_msgSend(v4, "suggester");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMUserActionPredictionDuetDataSource initWithCacheManager:suggestionProvider:](self, "initWithCacheManager:suggestionProvider:", v5, v6);

  return v7;
}

- (HMUserActionPredictionDuetDataSource)initWithCacheManager:(id)a3 suggestionProvider:(id)a4
{
  id v7;
  id v8;
  HMUserActionPredictionDuetDataSource *v9;
  HMUserActionPredictionDuetDataSource *v10;
  NSArray *lastFetchedPredictions;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMUserActionPredictionDuetDataSource;
  v9 = -[HMUserActionPredictionDuetDataSource init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheManager, a3);
    lastFetchedPredictions = v10->_lastFetchedPredictions;
    v10->_lastFetchedPredictions = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_storeStrong((id *)&v10->_suggestionProvider, a4);
  }

  return v10;
}

- (id)fetchPredictionsFromCache
{
  const char *v3;
  const char *v4;
  void *v5;
  HMUserActionPredictionDuetPredictionStore *v6;
  void *v7;
  HMUserActionPredictionDuetDataSource *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SEL v17;
  SEL v18;
  id v19;
  void *v21;
  HMUserActionPredictionDuetDataSource *v22;
  NSObject *v23;
  void *v24;
  SEL v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id Property;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMUserActionPredictionDuetDataSource openCacheIfNeeded](self, a2);
  if (!self || !objc_getProperty(self, v3, 32, 1))
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(objc_getProperty(self, v4, 32, 1), "dataForKey:", CFSTR("HMUserActionPredictionDuetDataSourceCacheKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[HMUserActionPredictionDuetPredictionStore initWithData:]([HMUserActionPredictionDuetPredictionStore alloc], "initWithData:", v5);
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[HMUserActionPredictionDuetPredictionStore predictions](v6, "predictions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v11;
        v29 = 2112;
        Property = v14;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Loaded %@ duet predictions from cache", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMUserActionPredictionDuetPredictionStore predictions](v6, "predictions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "copy");
      objc_setProperty_atomic_copy(v8, v17, v16, 24);

      v19 = objc_getProperty(v8, v18, 24, 1);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v26;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to load cached predictions from duet prediction store data.", (uint8_t *)&v27, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      v19 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v24;
      v29 = 2112;
      Property = objc_getProperty(v22, v25, 32, 1);
      v31 = 2112;
      v32 = CFSTR("HMUserActionPredictionDuetDataSourceCacheKey");
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@No duet prediction data found in cache (%@) for key: %@", (uint8_t *)&v27, 0x20u);

    }
    objc_autoreleasePoolPop(v21);
    v19 = (id)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (id)fetchPredictionsFromDuet
{
  HMUserActionPredictionDuetDataSource *v2;
  void *v3;
  void *v4;
  HMUserActionPredictionDuetDataSource *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  SEL v12;
  HMUserActionPredictionDuetPredictionStore *v13;
  void *v14;
  SEL v15;
  id v16;
  void *v17;
  void *v18;
  SEL v19;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (HMUserActionPredictionDuetDataSource *)objc_getProperty(self, a2, 16, 1);
  -[HMUserActionPredictionDuetDataSource suggestionsWithMaxSuggestions:](self, "suggestionsWithMaxSuggestions:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = v2;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Fetched %@ predictions from duet: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__HMUserActionPredictionDuetDataSource_fetchPredictionsFromDuet__block_invoke;
  v21[3] = &unk_1E3AB2698;
  v21[4] = v5;
  objc_msgSend(v3, "na_map:", v21);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v2)
  {
    -[HMUserActionPredictionDuetDataSource openCacheIfNeeded](v5, v10);
    if (objc_getProperty(v5, v12, 32, 1))
    {
      v13 = objc_alloc_init(HMUserActionPredictionDuetPredictionStore);
      v14 = (void *)objc_msgSend(v11, "mutableCopy");
      -[HMUserActionPredictionDuetPredictionStore setPredictions:](v13, "setPredictions:", v14);

      v16 = objc_getProperty(v5, v15, 32, 1);
      -[HMUserActionPredictionDuetPredictionStore data](v13, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setData:forKey:", v17, CFSTR("HMUserActionPredictionDuetDataSourceCacheKey"));

    }
    v18 = (void *)objc_msgSend(v11, "copy");
    objc_setProperty_atomic_copy(v5, v19, v18, 24);
  }
  else
  {

    v18 = (void *)objc_msgSend(v11, "copy");
  }

  return v11;
}

- (void)openCacheIfNeeded
{
  id v3;
  const char *v4;
  const char *v5;
  SEL v6;
  id v7;

  if (a1)
  {
    v3 = objc_getProperty(a1, a2, 32, 1);
    if (!v3)
    {
      if (!objc_getProperty(a1, v4, 8, 1))
        return;
      objc_msgSend(objc_getProperty(a1, v5, 8, 1), "cacheWithName:", CFSTR("HMUserActionPredictionDuetDataSourceCacheName"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic(a1, v6, v7, 32);
      v3 = v7;
    }

  }
}

void __51__HMUserActionPredictionDuetDataSource_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_29913;
  logCategory__hmf_once_v7_29913 = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionCache, 0);
  objc_storeStrong((id *)&self->_lastFetchedPredictions, 0);
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_cacheManager, 0);
}

HMUserActionPredictionDuetPredictionValue *__64__HMUserActionPredictionDuetDataSource_fetchPredictionsFromDuet__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  HMUserActionPredictionDuetPredictionValue *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  HMUserActionPredictionDuetPredictionValue *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "homeUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "targetUUID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = objc_alloc_init(HMUserActionPredictionDuetPredictionValue);
    v8 = (void *)MEMORY[0x1E0D28630];
    objc_msgSend(v3, "homeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_cachedInstanceForString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPredictionDuetPredictionValue setHomeIdentifier:](v7, "setHomeIdentifier:", v10);

    v11 = (void *)MEMORY[0x1E0D28630];
    objc_msgSend(v3, "targetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_cachedInstanceForString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPredictionDuetPredictionValue setTargetIdentifier:](v7, "setTargetIdentifier:", v13);

    v14 = (void *)MEMORY[0x1E0D28630];
    objc_msgSend(v3, "accessoryServiceUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_cachedInstanceForString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPredictionDuetPredictionValue setTargetAccessoryServiceIdentifier:](v7, "setTargetAccessoryServiceIdentifier:", v16);

    objc_msgSend(v3, "score");
    -[HMUserActionPredictionDuetPredictionValue setScore:](v7, "setScore:");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = objc_msgSend(v3, "type");
    v19 = 2 * (v18 == 0);
    if (v18 == 1)
      v19 = 1;
    if (v17)
      v20 = v19;
    else
      v20 = 0;
    -[HMUserActionPredictionDuetPredictionValue setPredictionType:](v7, "setPredictionType:", v20);
    if (-[HMUserActionPredictionDuetPredictionValue predictionType](v7, "predictionType"))
    {
      v21 = v7;
    }
    else
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v31;
        v35 = 2112;
        v36 = v3;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Skipping prediction (%@) of unknown type from duet", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v21 = 0;
    }

  }
  else
  {
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "homeUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "targetUUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v25;
      v35 = 2112;
      v36 = v26;
      v37 = 2112;
      v38 = v27;
      v39 = 2112;
      v40 = v3;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No home identifier (%@) or target identifier (%@) in duet prediction: %@", (uint8_t *)&v33, 0x2Au);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

@end
