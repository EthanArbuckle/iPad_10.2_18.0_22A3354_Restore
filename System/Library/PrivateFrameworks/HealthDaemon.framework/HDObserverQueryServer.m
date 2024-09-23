@implementation HDObserverQueryServer

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _QWORD v4[5];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__HDObserverQueryServer_database_protectedDataDidBecomeAvailable___block_invoke;
    v4[3] = &unk_1E6CE80E8;
    v4[4] = self;
    -[HDQueryServer onQueue:](self, "onQueue:", v4);
  }
}

void __66__HDObserverQueryServer_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 200))
  {
    if (*(_QWORD *)(v2 + 208) || *(_QWORD *)(v2 + 216))
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A90]), "initWithDataAnchor:associationAnchor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend((id)v2, "clientProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[28];
    objc_msgSend(v4, "queryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "client_dataUpdatedInDatabaseForTypes:withAnchor:query:", v5, v7, v6);

  }
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[6];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  objc_super v58;
  _BYTE buf[12];
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v58.receiver = self;
  v58.super_class = (Class)HDObserverQueryServer;
  -[HDQueryServer _queue_start](&v58, sel__queue_start);
  self->_deliverOnUnlock = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__114;
  v52 = __Block_byref_object_dispose__114;
  v53 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[HDObserverQueryServer objectTypes](self, "objectTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v45;
    v35 = *MEMORY[0x1E0D29618];
    obj = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v43 = v5;
        v9 = v8;
        -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v9, &v43);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[HDQueryServer profile](self, "profile");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v9, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "restrictedSourceEntities");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setRestrictedSourceEntities:", v13);

          -[HDQueryServer sampleAuthorizationFilter](self, "sampleAuthorizationFilter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAuthorizationFilter:", v14);

          -[NSDictionary objectForKeyedSubscript:](self->_sampleTypeToFilterMap, "objectForKeyedSubscript:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setFilter:", v15);

          objc_msgSend(v12, "setLimitCount:", 1);
          objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", v35, objc_opt_class(), 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setOrderingTerms:", v17);

        }
        else
        {
          v12 = 0;
        }

        v18 = v43;
        v42 = v18;
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __37__HDObserverQueryServer__queue_start__block_invoke;
        v41[3] = &unk_1E6CF2C40;
        v41[4] = &v48;
        v41[5] = &v54;
        objc_msgSend(v12, "enumerateWithError:handler:", &v42, v41);
        v5 = v42;

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v65, 16);
    }
    while (v4);

    if (v5)
    {
      if (objc_msgSend(v5, "hk_isDatabaseAccessibilityError"))
      {
        _HKInitializeLogging();
        v19 = *MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEBUG, "Can't retrieve observer query anchor while db locked.", buf, 2u);
        }
      }
      else
      {
        _HKInitializeLogging();
        v20 = *MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v5;
          _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Unable to pull latest anchor for observer query: %{public}@", buf, 0xCu);
        }
      }
    }
  }
  else
  {

    v5 = 0;
  }
  -[HDQueryServer profile](self, "profile", obj);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dataManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "quantitySeriesManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer queryQueue](self, "queryQueue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[HDObserverQueryServer objectTypes](self, "objectTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v64, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v24);
        v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && self->_observeUnfrozenSeries)
          objc_msgSend(v36, "addObserver:forType:queue:", self, v28, v23);
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v64, 16);
    }
    while (v25);
  }

  _HKInitializeLogging();
  v29 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
  {
    v30 = v49[5];
    v31 = v55[3];
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    v60 = 2114;
    v61 = v30;
    v62 = 2050;
    v63 = v31;
    _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Queue start for types: %{public}@, anchor: %{public}lli", buf, 0x20u);
  }
  v32 = (void *)v49[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v55[3]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v32, v33);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

- (void)_queue_stop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDObserverQueryServer;
  -[HDQueryServer _queue_stop](&v8, sel__queue_stop);
  self->_deliverOnUnlock = 0;
  -[HDQueryServer quantityType](self, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HDQueryServer profile](self, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quantitySeriesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer quantityType](self, "quantityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:forType:", self, v7);

  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  HDObserverQueryServer *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5348];
  v9 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: samplesAdded: %{public}@, anchor: %{public}@", buf, 0x20u);
  }
  -[HDQueryServer client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authorizationOracle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "filteredObjectsForReadAuthorization:anchor:error:", v6, v7, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (v12)
  {
    -[HDObserverQueryServer _sampleTypesToUpdateWithSamples:]((uint64_t)self, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
      -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v14, v7);

  }
  else
  {
    _HKInitializeLogging();
    v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v13;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", buf, 0x16u);
    }
  }

}

- (HDObserverQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDObserverQueryServer *v12;
  uint64_t v13;
  NSArray *queryDescriptors;
  void *v15;
  uint64_t v16;
  NSDictionary *sampleTypeToFilterMap;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDObserverQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v21, sel_initWithUUID_configuration_client_delegate_, a3, v10, v11, a6);
  if (v12)
  {
    v12->_observeUnfrozenSeries = objc_msgSend(v10, "observeUnfrozenSeries");
    objc_msgSend(v10, "queryDescriptors");
    v13 = objc_claimAutoreleasedReturnValue();
    queryDescriptors = v12->_queryDescriptors;
    v12->_queryDescriptors = (NSArray *)v13;

    objc_msgSend(v10, "queryDescriptors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__HDObserverQueryServer_initWithUUID_configuration_client_delegate___block_invoke;
    v19[3] = &unk_1E6CF3D88;
    v20 = v11;
    objc_msgSend(v15, "hk_mapToDictionary:", v19);
    v16 = objc_claimAutoreleasedReturnValue();
    sampleTypeToFilterMap = v12->_sampleTypeToFilterMap;
    v12->_sampleTypeToFilterMap = (NSDictionary *)v16;

  }
  return v12;
}

void __68__HDObserverQueryServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id, void *);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "sampleType");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "_filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "filterWithQueryFilter:objectType:", v8, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v10, v9);

}

uint64_t __37__HDObserverQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 <= a3)
    v8 = a3;
  *(_QWORD *)(v7 + 24) = v8;
  return 0;
}

- (void)_deliverDataWasUpdatedForTypes:(void *)a3 withAnchor:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__HDObserverQueryServer__deliverDataWasUpdatedForTypes_withAnchor___block_invoke;
    v8[3] = &unk_1E6CE7FB8;
    v8[4] = a1;
    v9 = v6;
    v10 = v5;
    objc_msgSend(a1, "onQueue:", v8);

  }
}

- (id)_sampleTypesToUpdateWithSamples:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = v3;
  if (a1)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "sampleType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v5, "containsObject:", v12);

          if ((v13 & 1) == 0)
          {
            v14 = *(void **)(a1 + 240);
            objc_msgSend(v11, "sampleType");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(MEMORY[0x1E0CB6FA0], "filter:acceptsDataObject:", v16, v11))
            {
              objc_msgSend(v11, "sampleType");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v17);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithArray:", v8);

  -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v9, v7);
}

- (void)associationsUpdatedForObject:(id)a3 subObject:(id)a4 type:(unint64_t)a5 objects:(id)a6 anchor:(id)a7
{
  id v10;
  void *v11;
  os_log_t *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  HDObserverQueryServer *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  objc_msgSend(a6, "arrayByAddingObject:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v12 = (os_log_t *)MEMORY[0x1E0CB5348];
  v13 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 2114;
    v27 = v11;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: associationsUpdated: %{public}@, anchor: %{public}@", buf, 0x20u);
  }
  -[HDQueryServer client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "authorizationOracle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v15, "filteredObjectsForReadAuthorization:anchor:error:", v11, v10, &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;

  if (v16)
  {
    -[HDObserverQueryServer _sampleTypesToUpdateWithSamples:]((uint64_t)self, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __84__HDObserverQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke;
      v20[3] = &unk_1E6CE7FB8;
      v20[4] = self;
      v21 = v10;
      v22 = v18;
      -[HDQueryServer onQueue:](self, "onQueue:", v20);

    }
  }
  else
  {
    _HKInitializeLogging();
    v19 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v17;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", buf, 0x16u);
    }
  }

}

void __84__HDObserverQueryServer_associationsUpdatedForObject_subObject_type_objects_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProtectedDataAvailable");

  if (v4)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A90]), "initWithDataAnchor:associationAnchor:", 0, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "clientProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "client_dataUpdatedInDatabaseForTypes:withAnchor:query:", v6, v12, v7);

    v8 = (void *)v12;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), *(id *)(a1 + 40));
    v9 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = v9;
    v8 = *(void **)(v10 + 224);
    *(_QWORD *)(v10 + 224) = v11;
  }

}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  id v15;
  HDObserverQueryServer *v16;

  if (a4)
  {
    self->_deliverOnUnlock = 1;
    return 0;
  }
  else
  {
    -[HDQueryServer client](self, "client", a3, a4, a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "authorizationOracle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__HDObserverQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
    aBlock[3] = &unk_1E6CFBBB0;
    v14 = v9;
    v15 = v8;
    v16 = self;
    v10 = v8;
    v11 = v9;
    v12 = _Block_copy(aBlock);

    return v12;
  }
}

void __86__HDObserverQueryServer_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
  if (a7)
  {
    v19 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v19, "filteredObjectsForReadAuthorization:anchor:error:", v20, v17, &v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v29;

    if (v21)
    {
      -[HDObserverQueryServer _sampleTypesToUpdateWithSamples:](*(_QWORD *)(a1 + 48), v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "count"))
      {
        v28 = *(void **)(a1 + 48);
        v24 = v22;
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v14, 0);
        -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](v28, v25, 0);

        v22 = v24;
      }

    }
    else
    {
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        v27 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v31 = v27;
        v32 = 2114;
        v33 = v22;
        _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter series for authorization: %{public}@", buf, 0x16u);
      }
    }

  }
  objc_autoreleasePoolPop(v18);

}

- (void)profile:(id)a3 didDiscardSeriesOfType:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;

  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v6, 0);

  -[HDObserverQueryServer _deliverDataWasUpdatedForTypes:withAnchor:](self, v7, 0);
}

- (id)objectTypes
{
  return (id)-[NSArray hk_mapToSet:](self->_queryDescriptors, "hk_mapToSet:", &__block_literal_global_125);
}

uint64_t __36__HDObserverQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sampleType");
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

void __67__HDObserverQueryServer__deliverDataWasUpdatedForTypes_withAnchor___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProtectedDataAvailable");

  if (v4)
  {
    if (*(_QWORD *)(a1 + 40))
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A90]), "initWithDataAnchor:associationAnchor:", *(_QWORD *)(a1 + 40), 0);
    else
      v12 = 0;
    objc_msgSend(*(id *)(a1 + 32), "clientProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "queryUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "client_dataUpdatedInDatabaseForTypes:withAnchor:query:", v10, v12, v11);

    v8 = (void *)v12;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
    v5 = *(void **)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v5;
    v8 = *(void **)(v6 + 224);
    *(_QWORD *)(v6 + 224) = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTypeToFilterMap, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_updatedSampleTypes, 0);
  objc_storeStrong((id *)&self->_subscriptionAnchor, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

@end
