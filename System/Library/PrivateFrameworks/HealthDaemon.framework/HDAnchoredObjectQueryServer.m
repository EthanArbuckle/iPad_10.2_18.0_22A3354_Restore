@implementation HDAnchoredObjectQueryServer

- (BOOL)_shouldListenForUpdates
{
  return self->_deliversUpdates;
}

- (void)_queue_start
{
  NSObject *v3;
  NSMutableArray *addedSamplesPendingResume;
  NSMutableArray *deletedSamplesPendingResume;
  HKQueryAnchor *v6;
  uint64_t v7;
  id v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  HKQueryAnchor *anchor;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  HKQueryAnchor *startAnchor;
  HKQueryAnchor *v23;
  HKQueryAnchor *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  objc_super v39;
  id v40;
  id v41;
  id *v42;
  uint64_t v43;
  char v44;
  _BYTE buf[24];
  void *v46;
  HDAnchoredObjectQueryServer *v47;
  id *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)HDAnchoredObjectQueryServer;
  -[HDQueryServer _queue_start](&v39, sel__queue_start);
  if (!self->_initialResultsSent)
  {
    _HKInitializeLogging();
    v9 = (os_log_t *)MEMORY[0x1E0CB5348];
    v10 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Running for initial results", buf, 0xCu);
    }
    -[HDQueryServer queryQueue](self, "queryQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v11);

    -[HDQueryServer clientProxy](self, "clientProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    if (self->_objectsDeleted)
    {
      objc_storeStrong((id *)&self->_anchor, self->_startAnchor);
      self->_deliveredResults = 0;
      self->_objectsDeleted = 0;
      *((_BYTE *)v42 + 24) = 1;
    }
    -[HKQueryAnchor _clientToken](self->_startAnchor, "_clientToken");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer queryQueue](self, "queryQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v14);

    if (v13)
    {
      -[HDAnchoredObjectQueryServer _queue_secureClientTokenWithError:](self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = objc_msgSend(v13, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
LABEL_27:
          v24 = self->_anchor;
          -[HDQueryServer profile](self, "profile");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "database");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          +[HDHealthEntity maxRowIDForPredicate:healthDatabase:error:](HDSampleEntity, "maxRowIDForPredicate:healthDatabase:error:", 0, v26, buf);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(id *)buf;

          if (v27)
          {
            v29 = 0;
          }
          else
          {
            v30 = v28;
            v29 = v30;
            if (v30)
              v31 = objc_retainAutorelease(v30);

          }
          v32 = v29;
          if (v27)
          {
            v33 = -[HKQueryAnchor _rowid](v24, "_rowid");
            if (v33 > objc_msgSend(v27, "longLongValue"))
            {
              objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", objc_msgSend(v27, "longLongValue"));
              v34 = objc_claimAutoreleasedReturnValue();

              v24 = (HKQueryAnchor *)v34;
            }
            v40 = v32;
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __60__HDAnchoredObjectQueryServer__queue_startForInitialResults__block_invoke;
            v46 = &unk_1E6CF3ED0;
            v47 = self;
            v48 = &v41;
            v35 = -[HDAnchoredObjectQueryServer _batchObjectsWithAnchor:error:batchHandler:]((uint64_t)self, v24, (uint64_t)&v40, buf);
            v36 = v40;

            -[HDAnchoredObjectQueryServer _queue_handleBatchedQueryResult:error:](self, v35, v36);
            if (v35 == 2)
              -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](self, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], self->_startAnchor, 1, 1, CFSTR("initial results"));
            -[HDQueryServer setDataCount:](self, "setDataCount:", self->_deliveredResults);
            v32 = v36;
            goto LABEL_42;
          }
          _HKInitializeLogging();
          v37 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v32;
            _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@: encountered error calculating max rowid: %{public}@", buf, 0x16u);
            if (v32)
              goto LABEL_41;
          }
          else if (v32)
          {
LABEL_41:
            -[HDQueryServer queryUUID](self, "queryUUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "client_deliverError:forQuery:", v32, v38);

LABEL_42:
            _Block_object_dispose(&v41, 8);

            return;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Failed to find maximum row ID but no error was provided."));
          v32 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
      }
      else
      {
        v18 = objc_msgSend(0, "hk_isDatabaseSchemaRolledBackError");
        _HKInitializeLogging();
        v19 = *v9;
        v20 = *v9;
        if (v18)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = 0;
            _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Unable to synthesize query anchor token for validation: %{public}@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = 0;
          _os_log_fault_impl(&dword_1B7802000, v19, OS_LOG_TYPE_FAULT, "%{public}@: Unable to synthesize query anchor token for validation: %{public}@", buf, 0x16u);
        }

      }
      _HKInitializeLogging();
      v21 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        startAnchor = self->_startAnchor;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = startAnchor;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating stale query anchor %{public}@", buf, 0x16u);
      }
      v23 = self->_startAnchor;
      self->_startAnchor = 0;

      anchor = self->_anchor;
      self->_anchor = 0;
    }
    else
    {
      anchor = 0;
    }

    goto LABEL_27;
  }
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_INFO, "%{public}@: Running for update", buf, 0xCu);
  }
  if (-[NSMutableArray count](self->_addedSamplesPendingResume, "count")
    || -[NSMutableArray count](self->_deletedSamplesPendingResume, "count"))
  {
    -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](self, self->_addedSamplesPendingResume, self->_deletedSamplesPendingResume, self->_anchor, 0, 1, CFSTR("pending updates after resume"));
    addedSamplesPendingResume = self->_addedSamplesPendingResume;
    self->_addedSamplesPendingResume = 0;

    deletedSamplesPendingResume = self->_deletedSamplesPendingResume;
    self->_deletedSamplesPendingResume = 0;

  }
  v6 = self->_anchor;
  v41 = 0;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __52__HDAnchoredObjectQueryServer__queue_startForUpdate__block_invoke;
  v46 = &unk_1E6CF3EF8;
  v47 = self;
  v7 = -[HDAnchoredObjectQueryServer _batchObjectsWithAnchor:error:batchHandler:]((uint64_t)self, v6, (uint64_t)&v41, buf);
  v8 = v41;
  -[HDAnchoredObjectQueryServer _queue_handleBatchedQueryResult:error:](self, v7, v8);

}

void __60__HDAnchoredObjectQueryServer__queue_startForInitialResults__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "filteredSamplesForClientWithSamples:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 32), "sanitizedSampleForQueryClient:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", a4);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 296);
  *(_QWORD *)(v19 + 296) = v18;

  v21 = objc_msgSend(v11, "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) += objc_msgSend(v9, "count") + v21;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 217) = a5;
  -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](*(_QWORD **)(a1 + 32), v11, v9, *(void **)(*(_QWORD *)(a1 + 32) + 296), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a5, CFSTR("initial results"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HDAnchoredObjectQueryServer_samplesAdded_anchor___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[HDQueryServer onQueue:](self, "onQueue:", v7);

}

uint64_t __51__HDAnchoredObjectQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 248);
    *(_QWORD *)(v4 + 248) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
  }
  return objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

- (uint64_t)_queue_shouldAcceptUpdates
{
  uint64_t result;
  uint64_t v3;

  if (!*(_BYTE *)(a1 + 217))
    return 0;
  if (objc_msgSend((id)a1, "queryState") == 2)
    return 1;
  result = objc_msgSend((id)a1, "clientHasActiveWorkout");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 256), "count");
    return (unint64_t)(objc_msgSend(*(id *)(a1 + 264), "count") + v3) < 0xC8;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSourceUUIDString, 0);
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_pendingUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_sampleTypeToFilterMap, 0);
  objc_storeStrong((id *)&self->_deletedSamplesPendingResume, 0);
  objc_storeStrong((id *)&self->_addedSamplesPendingResume, 0);
  objc_storeStrong((id *)&self->_addedSamplesPendingDidAddNotification, 0);
  objc_storeStrong((id *)&self->_secureClientToken, 0);
  objc_storeStrong((id *)&self->_startAnchor, 0);
}

- (HDAnchoredObjectQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  HDAnchoredObjectQueryServer *v12;
  uint64_t v13;
  HKQueryAnchor *startAnchor;
  uint64_t v15;
  NSArray *queryDescriptors;
  void *v17;
  uint64_t v18;
  NSDictionary *sampleTypeToFilterMap;
  NSMutableArray *v20;
  NSMutableArray *pendingUpdateBlocks;
  _QWORD v23[4];
  id v24;
  objc_super v25;

  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HDAnchoredObjectQueryServer;
  v12 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v25, sel_initWithUUID_configuration_client_delegate_, a3, v10, v11, a6);
  if (v12)
  {
    objc_msgSend(v10, "anchor");
    v13 = objc_claimAutoreleasedReturnValue();
    startAnchor = v12->_startAnchor;
    v12->_startAnchor = (HKQueryAnchor *)v13;

    objc_storeStrong((id *)&v12->_anchor, v12->_startAnchor);
    v12->_limit = objc_msgSend(v10, "limit");
    v12->_deliversUpdates = objc_msgSend(v10, "shouldDeactivateAfterInitialResults") ^ 1;
    v12->_includeDeletedObjects = objc_msgSend(v10, "includeDeletedObjects");
    v12->_includeAutomaticTimeZones = objc_msgSend(v10, "includeAutomaticTimeZones");
    objc_msgSend(v10, "collectionInterval");
    -[HDQueryServer setCollectionInterval:](v12, "setCollectionInterval:");
    v12->_includeContributorInformation = objc_msgSend(v10, "includeContributorInformation");
    objc_msgSend(v10, "queryDescriptors");
    v15 = objc_claimAutoreleasedReturnValue();
    queryDescriptors = v12->_queryDescriptors;
    v12->_queryDescriptors = (NSArray *)v15;

    objc_msgSend(v10, "queryDescriptors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__HDAnchoredObjectQueryServer_initWithUUID_configuration_client_delegate___block_invoke;
    v23[3] = &unk_1E6CF3D88;
    v24 = v11;
    objc_msgSend(v17, "hk_mapToDictionary:", v23);
    v18 = objc_claimAutoreleasedReturnValue();
    sampleTypeToFilterMap = v12->_sampleTypeToFilterMap;
    v12->_sampleTypeToFilterMap = (NSDictionary *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingUpdateBlocks = v12->_pendingUpdateBlocks;
    v12->_pendingUpdateBlocks = v20;

  }
  return v12;
}

void __74__HDAnchoredObjectQueryServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HDAnchoredObjectQueryServer;
  -[HDQueryServer description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "process");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)objectTypes
{
  if (self)
    self = (HDAnchoredObjectQueryServer *)self->_queryDescriptors;
  return (id)-[HDAnchoredObjectQueryServer hk_mapToSet:](self, "hk_mapToSet:", &__block_literal_global_69);
}

uint64_t __42__HDAnchoredObjectQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
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

- (BOOL)validateConfiguration:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDAnchoredObjectQueryServer;
  v5 = -[HDQueryServer validateConfiguration:](&v9, sel_validateConfiguration_);
  if (v5)
  {
    if (self->_includeAutomaticTimeZones
      && (-[HDQueryServer client](self, "client"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "hasPrivateMetadataAccess"),
          v6,
          (v7 & 1) == 0))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 4, CFSTR("Unauthorized use of includeAutomaticTimeZones"));
      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)prepareToActivateServerWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  const char *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  HDAnchoredObjectQueryServer *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)HDAnchoredObjectQueryServer;
  if (!-[HDQueryServer prepareToActivateServerWithError:](&v26, sel_prepareToActivateServerWithError_))
    return 0;
  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEntitlement:", *MEMORY[0x1E0CB47D8]);

  if ((v7 & 1) != 0)
    return 1;
  -[HDQueryServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v10, "createOrUpdateSourceForClient:error:", v11, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;

  if (objc_msgSend(v13, "hk_isAuthorizationDeniedError"))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Client has no source bundle identifier", buf, 0xCu);
    }
    v8 = 1;
    v15 = v13;
  }
  else if (v12)
  {
    -[HDQueryServer profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    objc_msgSend(v12, "sourceUUIDWithProfile:error:", v16, &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;

    v8 = v17 != 0;
    if (v17)
    {
      objc_msgSend(v17, "UUIDString");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (self)
        objc_setProperty_atomic_copy(self, v18, v19, 320);
    }
    else
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v28 = self;
        v29 = 2114;
        v30 = v15;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve source UUID: %{public}@", buf, 0x16u);
      }
      v22 = v15;
      v19 = v22;
      if (v22)
      {
        if (a3)
        {
          v19 = objc_retainAutorelease(v22);
          *a3 = v19;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v28 = self;
      v29 = 2114;
      v30 = v13;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch/create local client source: %{public}@", buf, 0x16u);
    }
    v15 = v13;
    if (v15)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldObserveOnPause
{
  _BOOL4 v3;
  uint64_t v4;

  if (self->_initialResultsSent)
  {
    v3 = -[HDQueryServer clientHasActiveWorkout](self, "clientHasActiveWorkout");
    if (v3)
    {
      v4 = -[NSMutableArray count](self->_addedSamplesPendingResume, "count");
      LOBYTE(v3) = (unint64_t)(-[NSMutableArray count](self->_deletedSamplesPendingResume, "count") + v4) < 0xC8;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_queue_didDeactivate
{
  NSObject *v3;
  int v4;
  HDAnchoredObjectQueryServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: did deactivate", (uint8_t *)&v4, 0xCu);
  }
  -[NSMutableArray removeAllObjects](self->_pendingUpdateBlocks, "removeAllObjects");
}

- (void)_queue_didChangeStateFromPreviousState:(int64_t)a3 state:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  HDAnchoredObjectQueryServer *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HDAnchoredObjectQueryServer;
  -[HDQueryServer _queue_didChangeStateFromPreviousState:state:](&v11, sel__queue_didChangeStateFromPreviousState_state_);
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    HDStringFromQueryServerState(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDStringFromQueryServerState(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: changed state (%@) -> (%@)", buf, 0x20u);

  }
}

- (void)_queue_runNextUpdateBlock
{
  void (**v2)(_QWORD, _QWORD);
  _QWORD v3[5];

  if (a1 && !*(_BYTE *)(a1 + 288))
  {
    objc_msgSend(*(id *)(a1 + 280), "firstObject");
    v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 280), "removeObjectAtIndex:", 0);
      *(_BYTE *)(a1 + 288) = 1;
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke;
      v3[3] = &unk_1E6CE80E8;
      v3[4] = a1;
      ((void (**)(_QWORD, _QWORD *))v2)[2](v2, v3);
    }

  }
}

uint64_t __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke_2;
  v3[3] = &unk_1E6CE80E8;
  v3[4] = v1;
  return objc_msgSend(v1, "onQueue:", v3);
}

uint64_t __56__HDAnchoredObjectQueryServer__queue_runNextUpdateBlock__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 288) = 0;
  return -[HDAnchoredObjectQueryServer _queue_runNextUpdateBlock](*(_QWORD *)(a1 + 32));
}

void __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke_2;
  v6[3] = &unk_1E6CF3DF0;
  v6[1] = 3221225472;
  v7 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");
  v5 = _Block_copy(v4);
  objc_msgSend(v3, "addObject:", v5);

  -[HDAnchoredObjectQueryServer _queue_runNextUpdateBlock](*(_QWORD *)(a1 + 32));
}

void __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  void (**v4)(void);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  v4[2]();

}

void __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_2;
  v8 = &unk_1E6CF3E40;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v9 = *(id *)(a1 + 40);
  v3 = (void *)objc_msgSend(&v5, "copy");
  v4 = _Block_copy(v3);
  objc_msgSend(v2, "addObject:", v4, v5, v6, v7, v8);

  -[HDAnchoredObjectQueryServer _queue_runNextUpdateBlock](*(_QWORD *)(a1 + 32));
  objc_destroyWeak(&v10);
}

void __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_3;
  v6[3] = &unk_1E6CF3E18;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(WeakRetained, "scheduleDatabaseAccessOnQueueWithBlock:", v6);

}

uint64_t __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_queue_deliverSamples:(void *)a3 deletedObjects:(void *)a4 anchor:(uint64_t)a5 clearPendingSamples:(uint64_t)a6 deliverResults:(void *)a7 description:
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  _QWORD *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v22 = a7;
  if (a1)
  {
    objc_msgSend(a1, "queryQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v16);

    -[HDAnchoredObjectQueryServer _queue_secureClientTokenWithError:](a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v15, "_setClientToken:", v17);
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB6A80], "latestAnchor");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      *(_DWORD *)buf = 138544898;
      v24 = a1;
      v25 = 2114;
      v26 = v22;
      v27 = 2048;
      v28 = objc_msgSend(v13, "count");
      v29 = 2048;
      v30 = objc_msgSend(v14, "count");
      v31 = 2048;
      v32 = objc_msgSend(v15, "_rowid");
      v33 = 1024;
      v34 = a5;
      v35 = 1024;
      v36 = a6;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Delivering %{public}@: %lu samples, %lu deleted objects (anchor:%llu clear-pending:%{BOOL}d deliver:%{BOOL}d)", buf, 0x40u);

    }
    objc_msgSend(a1, "clientProxy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "queryUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "client_deliverSampleObjects:deletedObjects:anchor:clearPendingSamples:deliverResults:query:", v13, v14, v15, a5, a6, v21);

  }
}

uint64_t __62__HDAnchoredObjectQueryServer__queue_didAddSamplesWithAnchor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "sampleType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresPerObjectAuthorization") ^ 1;

  return v3;
}

- (void)didAddSamplesOfTypes:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD v16[5];
  _QWORD *v17;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HDAnchoredObjectQueryServer_didAddSamplesOfTypes_anchor___block_invoke;
  v12[3] = &unk_1E6CED650;
  objc_copyWeak(&v14, &location);
  v9 = v7;
  v13 = v9;
  v10 = v12;
  v11 = v10;
  if (self)
  {
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __51__HDAnchoredObjectQueryServer__enqueueUpdateBlock___block_invoke;
    v16[3] = &unk_1E6CE9C08;
    v16[4] = self;
    v17 = v10;
    -[HDQueryServer onQueue:](self, "onQueue:", v16);

  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __59__HDAnchoredObjectQueryServer_didAddSamplesOfTypes_anchor___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_t *v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id obj;
  id *WeakRetained;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t buf[4];
  id *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  uint8_t v68[4];
  id *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    v3 = WeakRetained[31];
    objc_msgSend(v3, "hk_filter:", &__block_literal_global_209_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = WeakRetained[31];
      WeakRetained[31] = 0;

      v6 = v4;
      v7 = v2;
      if ((-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained) & 1) != 0)
      {
        v8 = objc_msgSend(v7, "longLongValue");
        if (v8 <= objc_msgSend(WeakRetained[37], "_rowid"))
        {
          _HKInitializeLogging();
          v37 = (void *)*MEMORY[0x1E0CB5348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
          {
            v38 = v37;
            v39 = objc_msgSend(v7, "longLongValue");
            v40 = objc_msgSend(WeakRetained[37], "_rowid");
            *(_DWORD *)v68 = 138543874;
            v69 = WeakRetained;
            v70 = 2048;
            v71 = v39;
            v72 = 2048;
            v73 = v40;
            _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: skip samples added update because anchor %lld <= current anchor %lld", v68, 0x20u);

          }
        }
        else
        {
          v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(WeakRetained, "client");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "authorizationOracle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0;
          objc_msgSend(v10, "filteredObjectsForReadAuthorization:anchor:error:", v6, v7, &v61);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v61;

          if (v11)
          {
            v48 = v12;
            v49 = v4;
            v52 = v6;
            v53 = v7;
            v50 = v3;
            v51 = v2;
            objc_msgSend(WeakRetained, "filteredSamplesForClientWithSamples:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            obj = v13;
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v58;
              v17 = (os_log_t *)MEMORY[0x1E0CB5348];
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v58 != v16)
                    objc_enumerationMutation(obj);
                  v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                  v20 = WeakRetained[34];
                  objc_msgSend(v19, "sampleType");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "objectForKeyedSubscript:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();

                  if ((objc_msgSend(MEMORY[0x1E0CB6FA0], "filter:acceptsDataObject:", v22, v19) & 1) != 0)
                  {
                    objc_msgSend(WeakRetained, "sanitizedSampleForQueryClient:", v19);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "addObject:", v23);

                  }
                  else
                  {
                    _HKInitializeLogging();
                    v24 = *v17;
                    if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138543618;
                      v63 = WeakRetained;
                      v64 = 2112;
                      v65 = (uint64_t)v19;
                      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_INFO, "%{public}@: samples added filter does not accept sample %@", buf, 0x16u);
                    }
                  }

                }
                v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
              }
              while (v15);
            }
            v25 = obj;

            v6 = v52;
            v26 = objc_msgSend(v52, "count");
            if (v26 != objc_msgSend(v54, "count"))
            {
              _HKInitializeLogging();
              v27 = (void *)*MEMORY[0x1E0CB5348];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEFAULT))
              {
                v28 = v27;
                v29 = objc_msgSend(v52, "count");
                v30 = objc_msgSend(v54, "count");
                *(_DWORD *)buf = 138543874;
                v63 = WeakRetained;
                v64 = 2048;
                v65 = v29;
                v66 = 2048;
                v67 = v30;
                _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: samples added count %lu != updatedObjects count %lu", buf, 0x20u);

              }
            }
            if (objc_msgSend(v54, "count"))
            {
              objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", objc_msgSend(v7, "longLongValue"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(WeakRetained, "queryState") == 2)
              {
                v32 = objc_msgSend(v54, "count");
                if (v32 < 0xC9)
                {
                  v33 = 0;
                }
                else
                {
                  v33 = 0;
                  v34 = (void *)MEMORY[0x1E0C9AA60];
                  do
                  {
                    objc_msgSend(v54, "subarrayWithRange:", v33, 200);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](WeakRetained, v35, v34, WeakRetained[37], 0, 0, CFSTR("updates after samples added"));
                    v33 += 200;
                    v32 -= 200;

                  }
                  while (v32 > 0xC8);
                }
                objc_msgSend(v54, "subarrayWithRange:", v33, v32);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](WeakRetained, v46, MEMORY[0x1E0C9AA60], v31, 0, 1, CFSTR("updates after samples added"));

                v7 = v53;
                v25 = obj;
              }
              else
              {
                v42 = WeakRetained[32];
                if (!v42)
                {
                  v43 = objc_opt_new();
                  v44 = WeakRetained[32];
                  WeakRetained[32] = (id)v43;

                  v42 = WeakRetained[32];
                }
                objc_msgSend(v42, "addObjectsFromArray:", v54);
                if ((-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained) & 1) == 0)
                {
                  _HKInitializeLogging();
                  v45 = *MEMORY[0x1E0CB5348];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543362;
                    v63 = WeakRetained;
                    _os_log_impl(&dword_1B7802000, v45, OS_LOG_TYPE_INFO, "%{public}@: Pausing after accumulating samples", buf, 0xCu);
                  }
                  objc_msgSend(WeakRetained, "schedulePause");
                }
              }
              v47 = WeakRetained[37];
              WeakRetained[37] = v31;

            }
            v3 = v50;
            v2 = v51;
            v12 = v48;
            v4 = v49;
          }
          else
          {
            _HKInitializeLogging();
            v41 = *MEMORY[0x1E0CB5348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v68 = 138543618;
              v69 = WeakRetained;
              v70 = 2114;
              v71 = (uint64_t)v12;
              _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "%{public}@: Failed to filter samples for authorization: %{public}@", v68, 0x16u);
            }
            v25 = 0;
          }

        }
      }
      else
      {
        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v68 = 138543362;
          v69 = WeakRetained;
          _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_INFO, "%{public}@: Samples added while not accepting updates", v68, 0xCu);
        }
      }

    }
  }

}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  _QWORD v15[5];
  _QWORD *v16;
  id v17;
  id from;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HDAnchoredObjectQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v11[3] = &unk_1E6CED650;
  objc_copyWeak(&v13, &location);
  v9 = v7;
  v12 = v9;
  v10 = v11;
  if (self)
  {
    objc_initWeak(&from, self);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __65__HDAnchoredObjectQueryServer__enqueueDatabaseAccessUpdateBlock___block_invoke;
    v15[3] = &unk_1E6CF3E68;
    v15[4] = self;
    objc_copyWeak(&v17, &from);
    v16 = v10;
    -[HDQueryServer onQueue:](self, "onQueue:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __64__HDAnchoredObjectQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id *WeakRetained;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint8_t v32[4];
  id *v33;
  __int16 v34;
  id v35;
  _BYTE buf[24];
  void *v37;
  id *v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained && (objc_msgSend(WeakRetained, "_shouldStopProcessingQuery") & 1) == 0)
  {
    if ((-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained) & 1) != 0)
    {
      v3 = objc_msgSend(v2, "longLongValue");
      if (v3 > objc_msgSend(WeakRetained[37], "_rowid"))
      {
        objc_msgSend(WeakRetained, "sampleType");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(WeakRetained, "readAuthorizationStatusForType:error:", v4, &v31);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v31;

        if (v5)
        {
          if (objc_msgSend(v5, "canRead"))
          {
            v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v27 = 0;
            v28 = &v27;
            v29 = 0x2020000000;
            v30 = -1;
            v9 = WeakRetained[37];
            v26 = v6;
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __67__HDAnchoredObjectQueryServer__queue_samplesWereRemovedWithAnchor___block_invoke;
            v37 = &unk_1E6CF3F20;
            v38 = WeakRetained;
            v10 = v7;
            v39 = v10;
            v11 = v8;
            v40 = v11;
            v41 = &v27;
            v12 = -[HDAnchoredObjectQueryServer _batchObjectsWithAnchor:error:batchHandler:]((uint64_t)WeakRetained, v9, (uint64_t)&v26, buf);
            v13 = v26;

            if (v12)
            {
              _HKInitializeLogging();
              v14 = *MEMORY[0x1E0CB5348];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v32 = 138543618;
                v33 = WeakRetained;
                v34 = 2114;
                v35 = v13;
                _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while enumerating after object deletion: %{public}@", v32, 0x16u);
              }
            }
            if ((objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
              && objc_msgSend(WeakRetained, "queryState") != 2)
            {
              if (objc_msgSend(v11, "count"))
              {
                v15 = WeakRetained[33];
                if (!v15)
                {
                  v16 = objc_opt_new();
                  v17 = WeakRetained[33];
                  WeakRetained[33] = (id)v16;

                  v15 = WeakRetained[33];
                }
                objc_msgSend(v15, "addObjectsFromArray:", v11);
              }
              if (objc_msgSend(v10, "count"))
              {
                v18 = WeakRetained[32];
                if (!v18)
                {
                  v19 = objc_opt_new();
                  v20 = WeakRetained[32];
                  WeakRetained[32] = (id)v19;

                  v18 = WeakRetained[32];
                }
                objc_msgSend(v18, "addObjectsFromArray:", v10);
              }
              if ((-[HDAnchoredObjectQueryServer _queue_shouldAcceptUpdates]((uint64_t)WeakRetained) & 1) == 0)
                objc_msgSend(WeakRetained, "schedulePause");
              objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", v28[3]);
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = WeakRetained[37];
              WeakRetained[37] = (id)v21;

            }
            _Block_object_dispose(&v27, 8);

            v6 = v13;
          }
        }
        else
        {
          _HKInitializeLogging();
          v24 = *MEMORY[0x1E0CB5348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v6;
            _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve authorization status; ignoring removed samples: %{public}@",
              buf,
              0x16u);
          }
        }

      }
    }
    else
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = WeakRetained;
        _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_INFO, "%{public}@: Samples removed while not accepting updates", buf, 0xCu);
      }
      *((_BYTE *)WeakRetained + 218) = 1;
    }
  }

}

- (uint64_t)_batchObjectsWithAnchor:(uint64_t)a3 error:(void *)a4 batchHandler:
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 312), "count") == 1)
  {
    v37 = v7;
    v36 = v8;
    objc_msgSend((id)a1, "queryQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    v10 = (void *)objc_msgSend((id)a1, "newDataEntityEnumerator");
    objc_msgSend((id)a1, "filter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilter:", v11);

    objc_msgSend((id)a1, "sampleAuthorizationFilter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAuthorizationFilter:", v12);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB56C8], 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortDescriptors:", v14);

    objc_msgSend((id)a1, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "authorizationOracle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "objectType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v16, "additionalAuthorizationPredicateForObjectType:error:", v17, &v40);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v40;

    if (v18)
    {
      objc_msgSend(v10, "setPredicate:", v18);
      if (*(_BYTE *)(a1 + 289))
        objc_msgSend(v10, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IncludeAutomaticTimeZone"));
      if (*(_BYTE *)(a1 + 290))
      {
        objc_msgSend((id)a1, "client");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "hasEntitlement:", *MEMORY[0x1E0CB4A88]);

        if (v21)
          objc_msgSend(v10, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IncludeContributorInformation"));
      }
      v22 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__queue_configuredEntityEnumerator, CFSTR("Unable to determine authorization status."));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "clientProxy");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "queryUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "client_deliverError:forQuery:", v27, v29);

      v22 = 0;
    }

    if (v22)
    {
      v30 = *(_QWORD *)(a1 + 304);
      if (v30 && !*(_BYTE *)(a1 + 217))
        objc_msgSend(v22, "setLimitCount:", v30 - *(_QWORD *)(a1 + 240));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v37, "_rowid"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAnchor:", v31);

      v32 = *(unsigned __int8 *)(a1 + 219);
      v33 = (void *)a1;
      v34 = v36;
      v26 = objc_msgSend(v33, "batchObjectsWithEnumerator:includeDeletedObjects:error:batchHandler:", v22, v32, a3, v36);
    }
    else
    {
      v26 = 1;
      v34 = v36;
    }

  }
  else
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6AF0]), "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:", *(_QWORD *)(a1 + 312), 0, v7, 0, 0, 0);
    v24 = *(unsigned __int8 *)(a1 + 219);
    v25 = *(_QWORD *)(a1 + 304);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __74__HDAnchoredObjectQueryServer__batchObjectsWithAnchor_error_batchHandler___block_invoke;
    v38[3] = &unk_1E6CF3F48;
    v39 = v8;
    v26 = objc_msgSend((id)a1, "batchObjectsWithMultitypeQueryCursor:includeDeletedObjects:limit:error:batchHandler:", v23, v24, v25, a3, v38);

  }
  return v26;
}

- (void)_queue_handleBatchedQueryResult:(void *)a3 error:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a2)
  {
    case 1:
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5348];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        if (v5)
          goto LABEL_5;
        goto LABEL_4;
      }
      v11 = 138543618;
      v12 = a1;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating update results: %{public}@", (uint8_t *)&v11, 0x16u);
      if (!v5)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Sample enumeration failed without reporting an error."));
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_5:
      objc_msgSend(a1, "clientProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "queryUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client_deliverError:forQuery:", v5, v8);

LABEL_13:
      return;
    case 2:
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        v11 = 138543362;
        v12 = a1;
        v10 = "%{public}@: Client no longer authorized";
        goto LABEL_12;
      }
      goto LABEL_13;
    case 3:
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        v11 = 138543362;
        v12 = a1;
        v10 = "%{public}@: Suspended during enumeration";
        goto LABEL_12;
      }
      goto LABEL_13;
    case 4:
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        v11 = 138543362;
        v12 = a1;
        v10 = "%{public}@: Canceled during enumeration";
LABEL_12:
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_13;
    default:
      goto LABEL_13;
  }
}

void __52__HDAnchoredObjectQueryServer__queue_startForUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "filteredSamplesForClientWithSamples:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 296);
  *(_QWORD *)(v9 + 296) = v8;

  if (objc_msgSend(v7, "count") || objc_msgSend(v11, "count"))
    -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](*(_QWORD **)(a1 + 32), v7, v11, *(void **)(*(_QWORD *)(a1 + 32) + 296), 0, 1, CFSTR("updates after resume"));

}

- (id)_queue_secureClientTokenWithError:(_QWORD *)a1
{
  NSObject *v2;
  const char *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "queryQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v4 = (void *)a1[29];
  if (v4)
    goto LABEL_4;
  v5 = objc_getProperty(a1, v3, 320, 1);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "hk_SHA512Hash");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)a1[29];
    a1[29] = v7;

    v4 = (void *)a1[29];
LABEL_4:
    v5 = v4;
  }
  return v5;
}

void __67__HDAnchoredObjectQueryServer__queue_samplesWereRemovedWithAnchor___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v9 = objc_msgSend(v7, "queryState");
  objc_msgSend(*(id *)(a1 + 32), "filteredSamplesForClientWithSamples:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB6A80], "_anchorWithRowid:", a4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 296);
    *(_QWORD *)(v12 + 296) = v11;

    if (objc_msgSend(v10, "count") || objc_msgSend(v14, "count"))
      -[HDAnchoredObjectQueryServer _queue_deliverSamples:deletedObjects:anchor:clearPendingSamples:deliverResults:description:](*(_QWORD **)(a1 + 32), v10, v14, *(void **)(*(_QWORD *)(a1 + 32) + 296), 0, 1, CFSTR("updates after resume"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v10);
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v14);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a4;
  }

}

uint64_t __74__HDAnchoredObjectQueryServer__batchObjectsWithAnchor_error_batchHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
