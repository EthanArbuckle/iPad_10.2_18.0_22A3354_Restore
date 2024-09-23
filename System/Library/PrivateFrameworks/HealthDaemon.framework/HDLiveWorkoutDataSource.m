@implementation HDLiveWorkoutDataSource

- (HDLiveWorkoutDataSource)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDLiveWorkoutDataSource *v12;
  void *v13;
  NSLock *v14;
  NSLock *lock;
  id v16;
  uint64_t v17;
  HKDataFlowLink *workoutDataFlowLink;
  HDWorkoutBasicDataSource *v19;
  void *v20;
  uint64_t v21;
  HDWorkoutBasicDataSource *basicDataSource;
  HKDataFlowLink *v23;
  void *v24;
  objc_super v26;

  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)HDLiveWorkoutDataSource;
  v12 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v26, sel_initWithUUID_configuration_client_delegate_, a3, v10, v11, a6);
  if (v12)
  {
    objc_msgSend(v11, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v12->_profile, v13);

    v14 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v12->_lock;
    v12->_lock = v14;

    _HKInitializeLogging();
    v16 = objc_alloc(MEMORY[0x1E0CB6588]);
    v17 = objc_msgSend(v16, "initWithProcessor:sourceProtocol:destinationProtocol:loggingCategory:", v12, &unk_1EF1A1298, &unk_1EF1B99A8, *MEMORY[0x1E0CB5380]);
    workoutDataFlowLink = v12->_workoutDataFlowLink;
    v12->_workoutDataFlowLink = (HKDataFlowLink *)v17;

    v19 = [HDWorkoutBasicDataSource alloc];
    objc_msgSend(v10, "workoutConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HDWorkoutBasicDataSource initWithConfiguration:client:](v19, "initWithConfiguration:client:", v20, v11);
    basicDataSource = v12->_basicDataSource;
    v12->_basicDataSource = (HDWorkoutBasicDataSource *)v21;

    v23 = v12->_workoutDataFlowLink;
    -[HDWorkoutBasicDataSource workoutDataFlowLink](v12->_basicDataSource, "workoutDataFlowLink");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataFlowLink addSource:](v23, "addSource:", v24);

    -[HDLiveWorkoutDataSource _setDataSourceConfiguration:]((uint64_t)v12, v10);
  }

  return v12;
}

- (void)_setDataSourceConfiguration:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 72);
    v7[1] = 3221225472;
    v7[2] = __55__HDLiveWorkoutDataSource__setDataSourceConfiguration___block_invoke;
    v7[3] = &unk_1E6CE8080;
    v6 = v3;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v3;
    v9 = a1;
    objc_msgSend(v4, "hk_withLock:", v7);
    objc_msgSend(*(id *)(a1 + 56), "sampleTypesToCollect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setSampleTypesToCollect:", v5);

    v3 = v6;
  }

}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB7198];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_setDataSourceConfiguration:(id)a3
{
  -[HDLiveWorkoutDataSource _setDataSourceConfiguration:]((uint64_t)self, a3);
}

- (void)remote_synchronizeWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

void __55__HDLiveWorkoutDataSource__setDataSourceConfiguration___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "filtersBySampleType");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "client");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "filtersBySampleType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "filterWithQueryFilter:objectType:", v10, v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  v12 = objc_alloc(MEMORY[0x1E0CB6E38]);
  objc_msgSend(*(id *)(a1 + 32), "workoutConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sampleTypesToCollect");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventTypesToCollect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v12, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", v13, v14, v2, v15, objc_msgSend(*(id *)(a1 + 32), "collectsDefaultTypes"));
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(v17 + 56);
  *(_QWORD *)(v17 + 56) = v16;

}

- (uint64_t)_lock_shouldAddSample:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "sampleType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "sampleTypesToCollect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 56), "filtersBySampleType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        a1 = objc_msgSend(v9, "acceptsDataObject:", v4);
      else
        a1 = 1;

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6810], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6810], "clientInterface");
}

- (void)connectionInvalidated
{
  -[HDWorkoutBasicDataSource stopCollectionOnConnectionInvalidation](self->_basicDataSource, "stopCollectionOnConnectionInvalidation");
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  -[HDWorkoutBasicDataSource workoutDataDestination:requestsDataFrom:to:](self->_basicDataSource, "workoutDataDestination:requestsDataFrom:to:", self, a4, a5);
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
  -[HDWorkoutBasicDataSource workoutDataDestination:requestsFinalDataFrom:to:completion:](self->_basicDataSource, "workoutDataDestination:requestsFinalDataFrom:to:completion:", a3, a4, a5, a6);
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  NSObject *v5;
  int v6;
  HDLiveWorkoutDataSource *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[HDWorkoutBasicDataSource setWorkoutConfiguration:](self->_basicDataSource, "setWorkoutConfiguration:", a4);
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_INFO, "%{public}@:Updated workout configuration", (uint8_t *)&v6, 0xCu);
  }
}

- (void)workoutDataDestination:(id)a3 didAttachDataSourceToSessionIdentifer:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  HDLiveWorkoutDataSource *v14;
  uint8_t buf[4];
  HDLiveWorkoutDataSource *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Registering for session: %{public}@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "workoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__HDLiveWorkoutDataSource_workoutDataDestination_didAttachDataSourceToSessionIdentifer___block_invoke;
  v12[3] = &unk_1E6CE7FE0;
  v13 = v5;
  v14 = self;
  v11 = v5;
  objc_msgSend(v10, "sessionServerFromSessionIdentifier:completion:", v11, v12);

}

void __88__HDLiveWorkoutDataSource_workoutDataDestination_didAttachDataSourceToSessionIdentifer___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setSessionServer:", a2);
  }
  else
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Failed to link data source to session %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (unint64_t)workoutDataDestinationState
{
  return 1;
}

- (void)addQuantities:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  char v12;
  id v13;
  NSLock *lock;
  HKDataFlowLink *workoutDataFlowLink;
  NSObject *v16;
  _QWORD v17[6];
  _QWORD v18[7];
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__83;
  v23[4] = __Block_byref_object_dispose__83;
  v24 = 0;
  -[HDStandardTaskServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationOracle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke;
  v19[3] = &unk_1E6CF6B58;
  v21 = v23;
  v11 = v6;
  v20 = v11;
  v12 = objc_msgSend(v9, "performReadAuthorizationTransactionWithError:handler:", &v22, v19);
  v13 = v22;

  if ((v12 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__83;
    v27 = __Block_byref_object_dispose__83;
    v28 = 0;
    lock = self->_lock;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_297;
    v18[3] = &unk_1E6CF6BA8;
    v18[5] = buf;
    v18[6] = v23;
    v18[4] = self;
    -[NSLock hk_withLock:](lock, "hk_withLock:", v18);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      workoutDataFlowLink = self->_workoutDataFlowLink;
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_3;
      v17[3] = &unk_1E6CF6BD0;
      v17[4] = self;
      v17[5] = buf;
      -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v17);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter objects for read authorization: %{public}@", buf, 0x16u);
    }
  }

  _Block_object_dispose(v23, 8);
}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2;
  v10[3] = &unk_1E6CF6B30;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "hk_filter:", v10);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return 1;
}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "hdw_sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = (*(uint64_t (**)(uint64_t, void *, _QWORD, uint64_t *))(v2 + 16))(v2, v3, 0, &v6);

  return v4;
}

void __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_297(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2_298;
  v6[3] = &unk_1E6CF6B80;
  v6[4] = a1[4];
  objc_msgSend(v2, "hk_filter:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_2_298(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "hdw_sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDLiveWorkoutDataSource _lock_shouldAddSample:](v2, v3);

  return v4;
}

uint64_t __52__HDLiveWorkoutDataSource_addQuantities_dataSource___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addQuantities:dataSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

- (void)addOtherSamples:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSLock *lock;
  uint64_t v13;
  HKDataFlowLink *workoutDataFlowLink;
  NSObject *v15;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  HDLiveWorkoutDataSource *v19;
  _BYTE *v20;
  id v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HDStandardTaskServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationOracle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v9, "filteredObjectsForReadAuthorization:anchor:error:", v7, 0, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v21;
  if (v10)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v23 = __Block_byref_object_copy__83;
    v24 = __Block_byref_object_dispose__83;
    lock = self->_lock;
    v13 = MEMORY[0x1E0C809B0];
    v25 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke;
    v17[3] = &unk_1E6CF6BF8;
    v20 = buf;
    v18 = v10;
    v19 = self;
    -[NSLock hk_withLock:](lock, "hk_withLock:", v17);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      workoutDataFlowLink = self->_workoutDataFlowLink;
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_3;
      v16[3] = &unk_1E6CF6BD0;
      v16[4] = self;
      v16[5] = buf;
      -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v16);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v11;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter objects for read authorization: %{public}@", buf, 0x16u);
    }
  }

}

void __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_2;
  v6[3] = &unk_1E6CEDCE0;
  v2 = (void *)a1[4];
  v6[4] = a1[5];
  objc_msgSend(v2, "hk_filter:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  return -[HDLiveWorkoutDataSource _lock_shouldAddSample:](*(_QWORD *)(a1 + 32), a2);
}

uint64_t __54__HDLiveWorkoutDataSource_addOtherSamples_dataSource___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addOtherSamples:dataSource:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
}

- (void)addWorkoutEvents:(id)a3 dataSource:(id)a4
{
  id v5;
  HKDataFlowLink *workoutDataFlowLink;
  id v7;
  _QWORD v8[4];
  id v9;
  HDLiveWorkoutDataSource *v10;

  v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HDLiveWorkoutDataSource_addWorkoutEvents_dataSource___block_invoke;
  v8[3] = &unk_1E6CE8008;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v8);

}

uint64_t __55__HDLiveWorkoutDataSource_addWorkoutEvents_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addWorkoutEvents:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addMetadata:(id)a3 dataSource:(id)a4
{
  id v5;
  HKDataFlowLink *workoutDataFlowLink;
  id v7;
  _QWORD v8[4];
  id v9;
  HDLiveWorkoutDataSource *v10;

  v5 = a3;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HDLiveWorkoutDataSource_addMetadata_dataSource___block_invoke;
  v8[3] = &unk_1E6CE8008;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v8);

}

uint64_t __50__HDLiveWorkoutDataSource_addMetadata_dataSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addMetadata:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)addMetadataToWorkoutActivity:(id)a3 withSampleStartDate:(id)a4 dataSource:(id)a5
{
  id v7;
  id v8;
  HKDataFlowLink *workoutDataFlowLink;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  HDLiveWorkoutDataSource *v15;

  v7 = a3;
  v8 = a4;
  workoutDataFlowLink = self->_workoutDataFlowLink;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__HDLiveWorkoutDataSource_addMetadataToWorkoutActivity_withSampleStartDate_dataSource___block_invoke;
  v12[3] = &unk_1E6CF6C20;
  v13 = v7;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v7;
  -[HKDataFlowLink sendToDestinationProcessors:](workoutDataFlowLink, "sendToDestinationProcessors:", v12);

}

void __87__HDLiveWorkoutDataSource_addMetadataToWorkoutActivity_withSampleStartDate_dataSource___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "addMetadataToWorkoutActivity:withSampleStartDate:dataSource:", a1[4], a1[5], a1[6]);

}

- (void)workoutDataDestination:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  -[HDWorkoutBasicDataSource workoutDataDestination:didChangeFromState:toState:](self->_basicDataSource, "workoutDataDestination:didChangeFromState:toState:", a3, a4, a5);
}

- (HDWorkoutDataAccumulator)workoutDataAccumulator
{
  void *v2;
  void *v3;

  -[HKDataFlowLink destinationProcessorsConformingToProtocol:](self->_workoutDataFlowLink, "destinationProcessorsConformingToProtocol:", &unk_1EF2059F8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDWorkoutDataAccumulator *)v3;
}

- (void)workoutDataDestination:(id)a3 didBeginActivity:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (-[HKWorkoutDataSourceConfiguration collectsDefaultTypes](self->_dataSourceConfiguration, "collectsDefaultTypes"))
  {
    objc_msgSend(v9, "workoutConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDLiveWorkoutDataSource _dataSourceConfigurationWithWorkoutConfiguration:]((uint64_t)self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "sampleTypesToCollect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filtersBySampleType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDLiveWorkoutDataSource _updateSampleTypesToCollect:filtersBySampleType:]((uint64_t)self, v7, v8);

  }
}

- (id)_dataSourceConfigurationWithWorkoutConfiguration:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "userCharacteristicsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "userCharacteristicForType:error:", v4, &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;

    if (v7)
    {
      v9 = objc_msgSend(v7, "integerValue");
    }
    else
    {
      if (v8)
      {
        _HKInitializeLogging();
        v10 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v8;
          _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "Error reading activity mode %{public}@", buf, 0xCu);
        }
      }
      v9 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB6E30], "defaultConfigurationWithWorkoutConfiguration:activityMoveMode:", v3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_updateSampleTypesToCollect:(void *)a3 filtersBySampleType:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 56), "sampleTypesToCollect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToSet:", v7) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "filtersBySampleType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "isEqualToDictionary:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
    v10 = *(void **)(a1 + 72);
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke;
    v17[3] = &unk_1E6CE7FB8;
    v17[4] = a1;
    v12 = v5;
    v18 = v12;
    v19 = v6;
    objc_msgSend(v10, "hk_withLock:", v17);
    objc_msgSend(*(id *)(a1 + 64), "setSampleTypesToCollect:", v12);
    objc_msgSend((id)a1, "client");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke_2;
    v16[3] = &unk_1E6CE8030;
    v16[4] = a1;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "clientRemote_didUpdateDataSourceConfiguration:", *(_QWORD *)(a1 + 56));
  }
LABEL_7:

}

- (void)workoutDataDestination:(id)a3 didEndActivity:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[HKWorkoutDataSourceConfiguration collectsDefaultTypes](self->_dataSourceConfiguration, "collectsDefaultTypes", a3, a4))
  {
    -[HKWorkoutDataSourceConfiguration workoutConfiguration](self->_dataSourceConfiguration, "workoutConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDLiveWorkoutDataSource _dataSourceConfigurationWithWorkoutConfiguration:]((uint64_t)self, v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "sampleTypesToCollect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filtersBySampleType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDLiveWorkoutDataSource _updateSampleTypesToCollect:filtersBySampleType:]((uint64_t)self, v6, v7);

  }
}

void __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = objc_alloc(MEMORY[0x1E0CB6E38]);
  objc_msgSend(*(id *)(a1[4] + 56), "workoutConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = a1[5];
  v3 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 56), "eventTypesToCollect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "initWithWorkoutConfiguration:sampleTypesToCollect:filters:eventTypesToCollect:collectsDefaultTypes:", v9, v4, v3, v5, objc_msgSend(*(id *)(a1[4] + 56), "collectsDefaultTypes"));
  v7 = a1[4];
  v8 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v6;

}

void __75__HDLiveWorkoutDataSource__updateSampleTypesToCollect_filtersBySampleType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Couldn't notify live workout data source client of new collected types with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_basicDataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceConfiguration, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
