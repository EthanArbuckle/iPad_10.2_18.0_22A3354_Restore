@implementation HDCacheDeleteCoordinator

- (HDCacheDeleteCoordinator)init
{
  HDCacheDeleteCoordinator *v2;
  id v3;
  void *v4;
  uint64_t v5;
  HKSynchronousObserverSet *providers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDCacheDeleteCoordinator;
  v2 = -[HDCacheDeleteCoordinator init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB6CA8]);
    HKLogInfrastructure();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithName:loggingCategory:", CFSTR("cache-delete-providers"), v4);
    providers = v2->_providers;
    v2->_providers = (HKSynchronousObserverSet *)v5;

  }
  return v2;
}

- (void)activate
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD v8[5];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__HDCacheDeleteCoordinator_activate__block_invoke;
  aBlock[3] = &unk_1E6CFE700;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __36__HDCacheDeleteCoordinator_activate__block_invoke_186;
  v8[3] = &unk_1E6CFE700;
  v8[4] = self;
  v5 = _Block_copy(v8);
  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Registering CacheDelete callbacks", v7, 2u);
  }

  CacheDeleteRegisterInfoCallbacks();
}

uint64_t __36__HDCacheDeleteCoordinator_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint8_t v8[16];

  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Determining CacheDelete purgable", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queryPurgeableSpace:info:", a2, a3);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __36__HDCacheDeleteCoordinator_activate__block_invoke_186(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint8_t v8[16];

  _HKInitializeLogging();
  HKLogInfrastructure();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Determining CacheDelete purged", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "purgeSpace:info:", a2, a3);
  return objc_claimAutoreleasedReturnValue();
}

void __36__HDCacheDeleteCoordinator_activate__block_invoke_187()
{
  NSObject *v0;
  uint8_t v1[16];

  _HKInitializeLogging();
  HKLogInfrastructure();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B7802000, v0, OS_LOG_TYPE_DEFAULT, "CacheDelete Cancel unsupported", v1, 2u);
  }

}

uint64_t __36__HDCacheDeleteCoordinator_activate__block_invoke_189()
{
  NSObject *v0;
  uint8_t v2[16];

  _HKInitializeLogging();
  HKLogInfrastructure();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B7802000, v0, OS_LOG_TYPE_DEFAULT, "CacheDelete Periodic unsupported", v2, 2u);
  }

  return 0;
}

- (void)registerCacheDeleteProvider:(id)a3
{
  -[HKSynchronousObserverSet registerObserver:](self->_providers, "registerObserver:", a3);
}

- (void)unregisterCacheDeleteProvider:(id)a3
{
  -[HKSynchronousObserverSet unregisterObserver:](self->_providers, "unregisterObserver:", a3);
}

- (id)queryPurgeableSpace:(int)a3 info:(id)a4
{
  id v6;
  void *v7;
  HKSynchronousObserverSet *providers;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  providers = self->_providers;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__HDCacheDeleteCoordinator_queryPurgeableSpace_info___block_invoke;
  v15[3] = &unk_1E6CFE788;
  v17 = &v19;
  v18 = a3;
  v9 = v7;
  v16 = v9;
  -[HKSynchronousObserverSet notifyObservers:](providers, "notifyObservers:", v15);
  _HKInitializeLogging();
  HKLogInfrastructure();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v20[3];
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2048;
    v28 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "CacheDelete purgeable amount for volume %{public}@ in bytes %llu ", buf, 0x16u);
  }

  v24[0] = v9;
  v23[0] = CFSTR("CACHE_DELETE_VOLUME");
  v23[1] = CFSTR("CACHE_DELETE_AMOUNT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v19, 8);
  return v13;
}

uint64_t __53__HDCacheDeleteCoordinator_queryPurgeableSpace_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "purgeableSpaceForUrgency:volume:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

- (id)purgeSpace:(int)a3 info:(id)a4
{
  id v6;
  void *v7;
  HKSynchronousObserverSet *providers;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  providers = self->_providers;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__HDCacheDeleteCoordinator_purgeSpace_info___block_invoke;
  v15[3] = &unk_1E6CFE788;
  v17 = &v19;
  v18 = a3;
  v9 = v7;
  v16 = v9;
  -[HKSynchronousObserverSet notifyObservers:](providers, "notifyObservers:", v15);
  _HKInitializeLogging();
  HKLogInfrastructure();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v20[3];
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2048;
    v28 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "CacheDelete purged amount for volume %{public}@ in bytes: %llu", buf, 0x16u);
  }

  v24[0] = v9;
  v23[0] = CFSTR("CACHE_DELETE_VOLUME");
  v23[1] = CFSTR("CACHE_DELETE_AMOUNT");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v19, 8);
  return v13;
}

uint64_t __44__HDCacheDeleteCoordinator_purgeSpace_info___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "purgeSpaceForUrgency:volume:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

+ (id)unitTesting_cacheDeleteUrgencies
{
  return &unk_1E6DF9CB0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
