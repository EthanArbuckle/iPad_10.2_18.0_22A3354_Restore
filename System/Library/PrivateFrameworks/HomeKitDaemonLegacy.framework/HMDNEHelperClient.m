@implementation HMDNEHelperClient

- (HMDNEHelperClient)init
{
  HMDNEHelperClient *v2;
  HMDNEHelperClient *v3;
  NSArray *cachedEntries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDNEHelperClient;
  v2 = -[HMDNEHelperClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    cachedEntries = v2->_cachedEntries;
    v2->_cachedEntries = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (void)_addIdentifiers:(id)a3 signingId:(id)a4
{
  id v6;
  id v7;
  NSArray *cachedEntries;
  id v9;
  void *v10;
  HMDNEHelperClient *v11;
  NSObject *v12;
  void *v13;
  _HMDNEHelperClientCacheEntry *v14;
  NSArray *v15;
  NSArray *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  cachedEntries = self->_cachedEntries;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__HMDNEHelperClient__addIdentifiers_signingId___block_invoke;
  v17[3] = &unk_1E89A3E00;
  v9 = v7;
  v18 = v9;
  if (-[NSArray indexOfObjectPassingTest:](cachedEntries, "indexOfObjectPassingTest:", v17) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v13;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Caching process identifiers for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = -[_HMDNEHelperClientCacheEntry initWithSigningId:identifiers:]([_HMDNEHelperClientCacheEntry alloc], "initWithSigningId:identifiers:", v9, v6);
    -[NSArray arrayByAddingObject:](self->_cachedEntries, "arrayByAddingObject:", v14);
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = self->_cachedEntries;
    self->_cachedEntries = v15;

  }
}

- (id)_signingIdentifierWithProcessId:(id)a3
{
  id v4;
  NSArray *cachedEntries;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HMDNEHelperClient *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  cachedEntries = self->_cachedEntries;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__HMDNEHelperClient__signingIdentifierWithProcessId___block_invoke;
  v15[3] = &unk_1E89A3E00;
  v6 = v4;
  v16 = v6;
  v7 = -[NSArray indexOfObjectPassingTest:](cachedEntries, "indexOfObjectPassingTest:", v15);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_cachedEntries, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "signingId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Local cache hit for %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

  return v8;
}

- (id)cacheCopyAppUUIDForSigningIdentifier:(id)a3 executablePath:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD applier[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "UTF8String");
  if (v7)
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  v9 = NEHelperCacheCopyAppUUIDMapping();
  v10 = (void *)v9;
  if (v9 && MEMORY[0x1D17BAB98](v9) == MEMORY[0x1E0C812C8])
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__8987;
    v18 = __Block_byref_object_dispose__8988;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __73__HMDNEHelperClient_cacheCopyAppUUIDForSigningIdentifier_executablePath___block_invoke;
    applier[3] = &unk_1E89A3E28;
    applier[4] = &v14;
    xpc_array_apply(v10, applier);
    if (objc_msgSend((id)v15[5], "count"))
    {
      -[HMDNEHelperClient _addIdentifiers:signingId:](self, "_addIdentifiers:signingId:", v15[5], v8);
      v11 = (id)v15[5];
    }
    else
    {
      v11 = 0;
    }
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)cacheCopySigningIdentifierForProcessIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *string_ptr;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDNEHelperClient _signingIdentifierWithProcessId:](self, "_signingIdentifierWithProcessId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v13[0] = 0;
    v13[1] = 0;
    objc_msgSend(v4, "getUUIDBytes:", v13);
    v8 = NEHelperCacheCopySigningIdentifierMapping();
    v9 = (void *)v8;
    if (v8 && MEMORY[0x1D17BAB98](v8) == MEMORY[0x1E0C81390])
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      string_ptr = xpc_string_get_string_ptr(v9);
      v7 = (id)objc_msgSend(v10, "initWithBytes:length:encoding:", string_ptr, xpc_string_get_length(v9), 4);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)cacheClearUUIDs
{
  void *v3;
  HMDNEHelperClient *v4;
  NSObject *v5;
  void *v6;
  NSArray *cachedEntries;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing cached UUIDs", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  cachedEntries = v4->_cachedEntries;
  v4->_cachedEntries = (NSArray *)MEMORY[0x1E0C9AA60];

  NEHelperCacheClearUUIDs();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedEntries, 0);
}

uint64_t __73__HMDNEHelperClient_cacheCopyAppUUIDForSigningIdentifier_executablePath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1D17BAB98](v4) == MEMORY[0x1E0C813A0])
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v5));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

  }
  return 1;
}

uint64_t __53__HMDNEHelperClient__signingIdentifierWithProcessId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __47__HMDNEHelperClient__addIdentifiers_signingId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "signingId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1)
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_8997);
  return (id)logCategory__hmf_once_v4;
}

void __32__HMDNEHelperClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4;
  logCategory__hmf_once_v4 = v0;

}

@end
