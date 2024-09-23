@implementation HMDSiriEndpointEnablementLogEventFactory

- (HMDSiriEndpointEnablementLogEventFactory)initWithDataSource:(id)a3
{
  id v4;
  HMDSiriEndpointEnablementLogEventFactory *v5;
  HMDSiriEndpointEnablementLogEventFactory *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDSiriEndpointEnablementLogEventFactory;
  v5 = -[HMDSiriEndpointEnablementLogEventFactory init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  HMDSiriEndpointEnablementLogEventFactory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDSiriEndpointEnablementLogEvent *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  HMDSiriEndpointEnablementLogEvent *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HMDSiriEndpointEnablementLogEventFactory dataSource](self, "dataSource", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeDataSources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v6);

        if ((v16 & 1) != 0)
        {
          v22 = -[HMDSiriEndpointEnablementLogEvent initWithConfigurationDataSource:]([HMDSiriEndpointEnablementLogEvent alloc], "initWithConfigurationDataSource:", v14);
          v32 = v22;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v11)
        continue;
      break;
    }
  }

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v20;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@No home found with UUID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v21 = 0;
LABEL_13:

  return v21;
}

- (id)serializeLogEvents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HMDSiriEndpointEnablementLogEventFactory *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v7, "serializedMetric");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v4, "count"))
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
        v16 = 2048;
        v17 = objc_msgSend(v4, "count");
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@We are trying to serialize %lu HMDSiriEndpointEnablementLogEvent objects, which is impossible", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    v8 = 0;
  }

  return v8;
}

- (id)logEventsFromDictionary:(id)a3
{
  id v3;
  HMDSiriEndpointEnablementLogEvent *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = -[HMDSiriEndpointEnablementLogEvent initWithDictionary:]([HMDSiriEndpointEnablementLogEvent alloc], "initWithDictionary:", v3);

  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  HMDSiriEndpointEnablementLogEvent *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  HMDSiriEndpointEnablementLogEvent *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v5);
        v13 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        if (v15)
        {
          v16 = objc_msgSend(v15, "numCapableSiriEndpointAccessories");
          if (v10 <= v16)
            v10 = v16;
          v17 = objc_msgSend(v15, "numEnabledSiriEndpointAccessories");
          if (v9 <= v17)
            v9 = v17;
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v18 = -[HMDSiriEndpointEnablementLogEvent initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:]([HMDSiriEndpointEnablementLogEvent alloc], "initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:", v6, v10, v9);
  v25 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (HMDHouseholdMetricsDataSource)dataSource
{
  return (HMDHouseholdMetricsDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_185908 != -1)
    dispatch_once(&logCategory__hmf_once_t6_185908, &__block_literal_global_185909);
  return (id)logCategory__hmf_once_v7_185910;
}

void __55__HMDSiriEndpointEnablementLogEventFactory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_185910;
  logCategory__hmf_once_v7_185910 = v0;

}

@end
