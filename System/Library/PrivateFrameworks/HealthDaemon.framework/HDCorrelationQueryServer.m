@implementation HDCorrelationQueryServer

- (HDCorrelationQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDCorrelationQueryServer *v12;
  uint64_t v13;
  NSDictionary *dataFilters;
  void *v15;
  char v16;
  objc_super v18;

  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDCorrelationQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v18, sel_initWithUUID_configuration_client_delegate_, a3, v10, v11, a6);
  if (v12)
  {
    objc_msgSend(v10, "filterDictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    dataFilters = v12->_dataFilters;
    v12->_dataFilters = (NSDictionary *)v13;

    objc_msgSend(v11, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationSDKVersionToken");

    dyld_version_token_get_platform();
    if (dyld_get_base_platform() == 2)
      v16 = dyld_version_token_at_least() ^ 1;
    else
      v16 = 0;
    v12->_permitPartiallyFilteredCorrelations = v16;
    v12->_suspended = 0;
  }

  return v12;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  HDCorrelationQueryServer *v20;
  id v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[3];
  char v25;
  objc_super v26;
  uint8_t buf[4];
  HDCorrelationQueryServer *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)HDCorrelationQueryServer;
  -[HDQueryServer _queue_start](&v26, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  if (self->_suspended)
  {
    v25 = 1;
    self->_suspended = 0;
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_INFO, "%{public}@ Resuming from suspend.", buf, 0xCu);
    }
  }
  v6 = -[HDQueryServer newDataEntityEnumerator](self, "newDataEntityEnumerator");
  -[HDQueryServer filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFilter:", v7);

  -[HDQueryServer sampleAuthorizationFilter](self, "sampleAuthorizationFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthorizationFilter:", v8);

  v23 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __40__HDCorrelationQueryServer__queue_start__block_invoke;
  v19 = &unk_1E6D024C8;
  v20 = self;
  v9 = v4;
  v21 = v9;
  v22 = v24;
  v10 = -[HDBatchedQueryServer batchObjectsWithEnumerator:error:handler:](self, "batchObjectsWithEnumerator:error:handler:", v6, &v23, &v16);
  v11 = v23;
  switch(v10)
  {
    case 1:
      -[HDQueryServer queryUUID](self, "queryUUID", v16, v17, v18, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "client_deliverError:forQuery:", v11, v13);

      break;
    case 2:
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v28 = self;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized.", buf, 0xCu);
      }
      -[HDQueryServer queryUUID](self, "queryUUID", v16, v17, v18, v19, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "client_deliverCorrelations:clearPendingSamples:isFinalBatch:queryUUID:", MEMORY[0x1E0C9AA60], 1, 1, v15);

      break;
    case 3:
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v28 = self;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%{public}@: Suspended during enumeration.", buf, 0xCu);
      }
      self->_suspended = 1;
      break;
  }

  _Block_object_dispose(v24, 8);
}

void __40__HDCorrelationQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v8)
    goto LABEL_14;
  v9 = v8;
  v10 = *(_QWORD *)v19;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
      v13 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v13 + 216))
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "_filterCorrelatedObjectsWithFilterDictionary:", *(_QWORD *)(v13 + 224));
        if ((objc_msgSend(v12, "_containsObjects") & 1) != 0)
          goto LABEL_11;
      }
      else if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "_containsObjects", (_QWORD)v18)
             && objc_msgSend(v12, "_correlatedObjectsMatchFilterDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224)))
      {
LABEL_11:
        objc_msgSend(v6, "addObject:", v12, (_QWORD)v18);
      }
      ++v11;
    }
    while (v9 != v11);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v9);
LABEL_14:

  if (objc_msgSend(v6, "count"))
    v14 = 0;
  else
    v14 = (_DWORD)a3 == 0;
  if (!v14)
  {
    v15 = *(void **)(a1 + 40);
    v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "client_deliverCorrelations:clearPendingSamples:isFinalBatch:queryUUID:", v6, v16, a3, v17);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (NSDictionary)dataFilters
{
  return self->_dataFilters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFilters, 0);
}

@end
