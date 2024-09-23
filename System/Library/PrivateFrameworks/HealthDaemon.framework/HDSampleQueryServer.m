@implementation HDSampleQueryServer

- (void)_queue_start
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSArray *sortDescriptors;
  NSArray *v24;
  unint64_t limit;
  int64_t v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  _QWORD v41[6];
  id v42;
  _QWORD v43[3];
  char v44;
  objc_super v45;
  _BYTE buf[24];
  void *v47;
  _QWORD *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)HDSampleQueryServer;
  -[HDQueryServer _queue_start](&v45, sel__queue_start);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  if (self->_suspended)
  {
    v44 = 1;
    self->_suspended = 0;
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_INFO, "%{public}@: Resuming from suspend", buf, 0xCu);
    }
  }
  -[HDQueryServer setDataCount:](self, "setDataCount:", 0);
  v42 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __35__HDSampleQueryServer__queue_start__block_invoke;
  v41[3] = &unk_1E6D10EF0;
  v41[4] = self;
  v41[5] = v43;
  v5 = v41;
  if (-[NSArray count](self->_queryDescriptors, "count") != 1)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB6AF0]);
    sortDescriptors = self->_sortDescriptors;
    v24 = self->_queryDescriptors;
    v6 = (_QWORD *)objc_msgSend(v22, "initWithQueryDescriptors:sortDescriptors:followingAnchor:upToAndIncludingAnchor:distinctByKeyPaths:state:", v24, sortDescriptors, 0, 0, 0, 0);

    limit = self->_limit;
    *(_QWORD *)buf = v4;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __58__HDSampleQueryServer_batchObjectsWithError_batchHandler___block_invoke;
    v47 = &unk_1E6CF3F48;
    v48 = v5;
    v26 = -[HDBatchedQueryServer batchObjectsWithMultitypeQueryCursor:includeDeletedObjects:limit:error:batchHandler:](self, "batchObjectsWithMultitypeQueryCursor:includeDeletedObjects:limit:error:batchHandler:", v6, 0, limit, &v42, buf);
    v27 = v48;
    goto LABEL_28;
  }
  v6 = v5;
  v7 = -[HDQueryServer newDataEntityEnumerator](self, "newDataEntityEnumerator");
  -[HDQueryServer filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilter:", v8);

  -[HDQueryServer sampleAuthorizationFilter](self, "sampleAuthorizationFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAuthorizationFilter:", v9);

  -[HDQueryServer sampleType](self, "sampleType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "requiresPerObjectAuthorization");

  if ((v11 & 1) == 0)
    objc_msgSend(v7, "setLimitCount:", self->_limit);
  objc_msgSend(v7, "setSortDescriptors:", self->_sortDescriptors);
  if (self->_includeContributorInformation)
  {
    -[HDQueryServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasEntitlement:", *MEMORY[0x1E0CB4A88]);

    if (v13)
      objc_msgSend(v7, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IncludeContributorInformation"));
  }
  -[HDQueryServer client](self, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "authorizationOracle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer sampleType](self, "sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  objc_msgSend(v15, "additionalAuthorizationPredicateForObjectType:error:", v16, buf);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(id *)buf;

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel_enumeratorForSingleSampleTypeWithError_, CFSTR("Unable to determine authorization status."));
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
      v42 = objc_retainAutorelease(v28);

    v27 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v7, "setPredicate:", v17);
  if (self->_includeAutomaticTimeZones)
    objc_msgSend(v7, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IncludeAutomaticTimeZone"));
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "performsWorkoutCondensation"))
    {
      -[HDQueryServer objectType](self, "objectType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "code") == 79)
      {
        -[HDQueryServer client](self, "client");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v21, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], 0);

        if (v40)
          objc_msgSend(v7, "setEncodingOption:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IncludeCondenserInfo"));
        goto LABEL_24;
      }

    }
  }
LABEL_24:
  v27 = v7;
LABEL_25:

  if (v27)
    v26 = -[HDBatchedQueryServer batchObjectsWithEnumerator:error:handler:](self, "batchObjectsWithEnumerator:error:handler:", v27, &v42, v6);
  else
    v26 = 1;
LABEL_28:

  v30 = v42;
  v31 = v30;
  if (v26 == 1)
  {
    _HKInitializeLogging();
    v34 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v31;
      _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating results: %{public}@", buf, 0x16u);
    }
    v32 = v31;
    if (!v31)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Sample enumeration failed without reporting an error."));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HDQueryServer clientProxy](self, "clientProxy");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer queryUUID](self, "queryUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "client_deliverError:forQuery:", v32, v36);

  }
  else
  {
    if (v26 == 2)
    {
      _HKInitializeLogging();
      v37 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized.", buf, 0xCu);
      }
      -[HDQueryServer clientProxy](self, "clientProxy");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQueryServer queryUUID](self, "queryUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "client_deliverSamples:clearPendingSamples:isFinalBatch:queryUUID:", MEMORY[0x1E0C9AA60], 1, 1, v39);

      goto LABEL_42;
    }
    v32 = v30;
    if (v26 == 3)
    {
      _HKInitializeLogging();
      v33 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_INFO, "%{public}@: Suspended during enumeration.", buf, 0xCu);
      }
      self->_suspended = 1;
LABEL_42:
      v32 = v31;
    }
  }

  _Block_object_dispose(v43, 8);
}

void __35__HDSampleQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "filteredSamplesForClientWithSamples:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  if (v6 > v7 && v7 != 0)
  {
    objc_msgSend(v5, "subarrayWithRange:", 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(a1 + 32), "sanitizedSampleForQueryClient:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15), (_QWORD)v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v17;
    v20 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 138543618;
    v30 = v18;
    v31 = 2048;
    v32 = v20;
    _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_INFO, "%{public}@ delivering %lu samples to client", buf, 0x16u);

  }
  v21 = *(void **)(a1 + 32);
  if (v21)
  {
    objc_msgSend(v21, "clientProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(a1 + 32);
  }
  else
  {
    v22 = 0;
  }
  v23 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v21, "queryUUID", (_QWORD)v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "client_deliverSamples:clearPendingSamples:isFinalBatch:queryUUID:", v10, v23, a3, v24);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setDataCount:", objc_msgSend(*(id *)(a1 + 32), "dataCount") + objc_msgSend(v10, "count"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

- (HDSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSampleQueryServer *v11;
  uint64_t v12;
  NSArray *sortDescriptors;
  uint64_t v14;
  NSArray *queryDescriptors;
  objc_super v17;

  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDSampleQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v17, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v11->_limit = objc_msgSend(v10, "limit");
    objc_msgSend(v10, "sortDescriptors");
    v12 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

    v11->_includeAutomaticTimeZones = objc_msgSend(v10, "includeAutomaticTimeZones");
    v11->_includeContributorInformation = objc_msgSend(v10, "includeContributorInformation");
    objc_msgSend(v10, "queryDescriptors");
    v14 = objc_claimAutoreleasedReturnValue();
    queryDescriptors = v11->_queryDescriptors;
    v11->_queryDescriptors = (NSArray *)v14;

  }
  return v11;
}

- (id)objectTypes
{
  if (self)
    self = (HDSampleQueryServer *)self->_queryDescriptors;
  return (id)-[HDSampleQueryServer hk_mapToSet:](self, "hk_mapToSet:", &__block_literal_global_245);
}

uint64_t __34__HDSampleQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
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
  void *v8;
  const __CFString *v9;
  id *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HDSampleQueryServer;
  v5 = -[HDQueryServer validateConfiguration:](&v13, sel_validateConfiguration_);
  if (v5)
  {
    if (self->_includeAutomaticTimeZones
      && (-[HDQueryServer client](self, "client"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "hasPrivateMetadataAccess"),
          v6,
          (v7 & 1) == 0))
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Unauthorized use of includeAutomaticTimeZones");
      v10 = a3;
      v11 = 4;
    }
    else
    {
      if (-[NSArray count](self->_queryDescriptors, "count"))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Missing sample type for query");
      v10 = a3;
      v11 = 3;
    }
    objc_msgSend(v8, "hk_assignError:code:description:", v10, v11, v9);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)diagnosticDescription
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  if (self->_limit)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu"), self->_limit);
  else
    v3 = CFSTR("none");
  if (-[NSArray count](self->_sortDescriptors, "count"))
  {
    -[NSArray hk_map:](self->_sortDescriptors, "hk_map:", &__block_literal_global_197_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("none");
  }
  v9.receiver = self;
  v9.super_class = (Class)HDSampleQueryServer;
  -[HDQueryServer diagnosticDescription](&v9, sel_diagnosticDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n\tlimit: %@ - sort: %@"), v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __44__HDSampleQueryServer_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  const __CFString *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "ascending");

  if (v4)
    v5 = CFSTR(" ASC");
  else
    v5 = CFSTR(" DESC");
  objc_msgSend(v3, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __58__HDSampleQueryServer_batchObjectsWithError_batchHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
