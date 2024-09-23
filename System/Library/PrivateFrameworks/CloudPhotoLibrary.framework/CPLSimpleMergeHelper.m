@implementation CPLSimpleMergeHelper

- (CPLSimpleMergeHelper)initWithEngineStore:(id)a3
{
  id v5;
  CPLSimpleMergeHelper *v6;
  CPLSimpleMergeHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleMergeHelper;
  v6 = -[CPLSimpleMergeHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (BOOL)_changeCanConflict:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "isAssetChange"))
    v4 = objc_msgSend(v3, "changeType") != 2;
  else
    v4 = 1;

  return v4;
}

- (id)mergerForBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  CPLEngineStore *store;
  id v35;
  void *v36;
  id v37;
  CPLSimpleMergeHelper *v38;
  void *v39;
  id v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CPLEngineStore pullQueue](self->_store, "pullQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEmpty") & 1) != 0)
  {
    +[CPLSimpleMergeHelper _mergerWithNoConflictsForStore:](CPLSimpleMergeHelper, "_mergerWithNoConflictsForStore:", self->_store);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  if (!objc_msgSend(v7, "compactChangeBatchesWithError:", a4))
  {
    v8 = 0;
    goto LABEL_44;
  }
  v38 = self;
  v39 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v35 = v6;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (!v12)
    goto LABEL_23;
  v13 = v12;
  v14 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v47 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      objc_msgSend(v16, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v9, "containsObject:", v18) & 1) == 0)
      {
        if ((objc_msgSend(v40, "containsObject:", v18) & 1) == 0)
        {
          v51 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v39, "hasSomeChangeInScopesWithIdentifiers:", v19);

          if ((v20 & 1) == 0)
          {
            v21 = v9;
            goto LABEL_17;
          }
          objc_msgSend(v40, "addObject:", v18);
        }
        if ((objc_msgSend(v10, "containsObject:", v18) & 1) != 0)
          goto LABEL_21;
        if (-[CPLSimpleMergeHelper _changeCanConflict:](v38, "_changeCanConflict:", v16))
        {
          v21 = v10;
LABEL_17:
          objc_msgSend(v21, "addObject:", v18);
          goto LABEL_21;
        }
        objc_msgSend(v16, "allRelatedScopedIdentifiers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "count"))
          objc_msgSend(v37, "unionSet:", v22);

      }
LABEL_21:

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  }
  while (v13);
LABEL_23:

  v7 = v39;
  if (objc_msgSend(v37, "count"))
  {
    v23 = v10;
    -[CPLEngineStore idMapping](v38->_store, "idMapping");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v24 = v37;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v43;
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v29, "scopeIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "containsObject:", v30) & 1) == 0)
          {
            v41 = 0;
            objc_msgSend(v36, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v29, &v41);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v31)
              v31 = (void *)objc_msgSend(v29, "copy");
            if (objc_msgSend(v39, "hasSomeChangeWithScopedIdentifier:", v31))
            {
              objc_msgSend(v23, "addObject:", v30);

              goto LABEL_39;
            }

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_39:

    v10 = v23;
  }
  v32 = objc_msgSend(v10, "count");
  store = v38->_store;
  if (v32)
    +[CPLSimpleMergeHelper _mergerWithConflictsForStore:conflictingScopeIdentifiers:](CPLSimpleMergeHelper, "_mergerWithConflictsForStore:conflictingScopeIdentifiers:", store, v10);
  else
    +[CPLSimpleMergeHelper _mergerWithNoConflictsForStore:](CPLSimpleMergeHelper, "_mergerWithNoConflictsForStore:", store);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v35;

LABEL_44:
  return v8;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

+ (id)_mergerWithNoConflictsForStore:(id)a3
{
  return -[CPLSimpleMerger initWithMergeBlock:]([CPLSimpleMerger alloc], "initWithMergeBlock:", 0);
}

+ (id)_mergerWithConflictsForStore:(id)a3 conflictingScopeIdentifiers:(id)a4
{
  id v5;
  id v6;
  CPLSimpleMerger *v7;
  id v8;
  id v9;
  CPLSimpleMerger *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = [CPLSimpleMerger alloc];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__CPLSimpleMergeHelper__mergerWithConflictsForStore_conflictingScopeIdentifiers___block_invoke;
  v12[3] = &unk_1E60DDA30;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  v10 = -[CPLSimpleMerger initWithMergeBlock:](v7, "initWithMergeBlock:", v12);

  return v10;
}

uint64_t __81__CPLSimpleMergeHelper__mergerWithConflictsForStore_conflictingScopeIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scopes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterForIncludedScopeIdentifiers:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_CPLSilentLogging)
  {
    if (__CPLMergerOSLogDomain_onceToken != -1)
      dispatch_once(&__CPLMergerOSLogDomain_onceToken, &__block_literal_global_9495);
    v6 = (void *)__CPLMergerOSLogDomain_result;
    if (os_log_type_enabled((os_log_t)__CPLMergerOSLogDomain_result, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      objc_msgSend(v7, "pullQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countOfQueuedBatches");
      v11 = objc_msgSend(*(id *)(a1 + 40), "count");
      v19 = 134218240;
      v20 = v10;
      v21 = 2048;
      v22 = v11;
      _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning pull queue (%lu batches) of %lu scopes, transient repository and reset mingled records in the cloud cache", (uint8_t *)&v19, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "pullQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "deleteAllChangesWithScopeFilter:error:", v5, a2);

  if (v13
    && (objc_msgSend(*(id *)(a1 + 32), "transientPullRepository"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "resetMingledRecordsWithScopeFilter:error:", v5, a2),
        v14,
        v15))
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "discardStagedChangesWithScopeFilter:error:", v5, a2);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
