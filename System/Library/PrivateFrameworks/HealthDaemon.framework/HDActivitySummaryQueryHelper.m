@implementation HDActivitySummaryQueryHelper

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4 && self->_needsUpdateAfterUnlock)
  {
    self->_needsUpdateAfterUnlock = 0;
    -[HDActivitySummaryQueryHelper _queue_deliverUpdates]((uint64_t)self);
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDActivitySummaryQueryHelper_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __52__HDActivitySummaryQueryHelper_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  NSObject *v1;
  const char *v2;
  NSObject *v3;
  uint32_t v4;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  id obj;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41))
  {
    _HKInitializeLogging();
    v1 = *MEMORY[0x1E0CB5348];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
      return;
    *(_WORD *)buf = 0;
    v2 = "Received samples while _needsUpdateAfterUnlock=YES";
    v3 = v1;
    v4 = 2;
LABEL_18:
    _os_log_debug_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEBUG, v2, buf, v4);
    return;
  }
  v6 = objc_msgSend(*(id *)(a1 + 40), "longLongValue");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6 <= *(_QWORD *)(v7 + 56))
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5348];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
      return;
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    *(_DWORD *)buf = 138412546;
    v80 = v18;
    v81 = 2048;
    v82 = v19;
    v2 = "Anchor %@ <= %ld, skipping";
    v3 = v17;
    v4 = 22;
    goto LABEL_18;
  }
  v8 = *(id *)(a1 + 48);
  v9 = v8;
  if (*(_QWORD *)(v7 + 24))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v76 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
          if (objc_msgSend(MEMORY[0x1E0CB6FA0], "filter:acceptsDataObject:", *(_QWORD *)(v7 + 24), v16))
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = v8;
  }

  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (!v20)
    goto LABEL_29;
  v21 = v20;
  v22 = 0;
  v23 = *(_QWORD *)v62;
  do
  {
    for (j = 0; j != v21; ++j)
    {
      if (*(_QWORD *)v62 != v23)
        objc_enumerationMutation(v10);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "cacheIndex"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      v22 |= v27;
    }
    v21 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  }
  while (v21);
  if ((v22 & 1) != 0)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverUpdates](*(_QWORD *)(a1 + 32));
  }
  else
  {
LABEL_29:
    v29 = *(_QWORD *)(a1 + 32);
    v28 = *(void **)(a1 + 40);
    v30 = v10;
    v31 = v28;
    v32 = v31;
    if (v29)
    {
      v56 = v31;
      v58 = v10;
      v60 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v70 = 0u;
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v57 = v30;
      obj = v30;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v71;
        do
        {
          for (k = 0; k != v34; ++k)
          {
            if (*(_QWORD *)v71 != v35)
              objc_enumerationMutation(obj);
            v37 = *(id *)(*((_QWORD *)&v70 + 1) + 8 * k);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v37, "cacheIndex"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v29 + 48), "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "sourceRevision");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "source");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            *(_QWORD *)&v75 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v75 + 1) = 3221225472;
            *(_QWORD *)&v76 = __71__HDActivitySummaryQueryHelper__queue_addActivityCacheToCachedSamples___block_invoke;
            *((_QWORD *)&v76 + 1) = &unk_1E6D0D2E8;
            *(_QWORD *)&v77 = v41;
            v42 = v41;
            v43 = objc_msgSend(v39, "indexOfObjectWithOptions:passingTest:", 0, &v75);
            if (v43 == 0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v39, "addObject:", v37);
            else
              objc_msgSend(v39, "replaceObjectAtIndex:withObject:", v43, v37);

            objc_msgSend(*(id *)(v29 + 48), "objectForKeyedSubscript:", v38);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setObject:forKeyedSubscript:", v44, v38);

          }
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, buf, 16);
        }
        while (v34);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(v60, "allValues");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, &v75, 16);
      v10 = v58;
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v67;
        do
        {
          for (m = 0; m != v48; ++m)
          {
            if (*(_QWORD *)v67 != v49)
              objc_enumerationMutation(v46);
            objc_msgSend(MEMORY[0x1E0CB6278], "_mostSignificantCacheAmongCaches:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6278]), "_initWithActivityCache:shouldIncludePrivateProperties:", v51, objc_msgSend((id)v29, "shouldIncludePrivateProperties"));
            objc_msgSend(v45, "addObject:", v52);

          }
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, &v75, 16);
        }
        while (v48);
      }

      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __91__HDActivitySummaryQueryHelper__queue_updateActivitySummariesWithNewActivityCaches_anchor___block_invoke;
      v65[3] = &unk_1E6D0D2C0;
      v65[4] = v29;
      objc_msgSend(v45, "sortUsingComparator:", v65);
      if (objc_msgSend(v45, "count"))
        -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesToClient:isFinalBatch:clearPendingBatches:](v29, v45, 1, 0);
      v53 = *(_QWORD *)(v29 + 56);
      v32 = v56;
      v54 = objc_msgSend(v56, "integerValue");
      if (v53 <= v54)
        v55 = v54;
      else
        v55 = v53;
      *(_QWORD *)(v29 + 56) = v55;

      v30 = v57;
    }

  }
}

uint64_t __71__HDActivitySummaryQueryHelper__queue_addActivityCacheToCachedSamples___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sourceRevision");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HDActivitySummaryQueryHelper_start__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__HDActivitySummaryQueryHelper_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    objc_msgSend(WeakRetained, "dataManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forDataType:", v1, v4);

    if (*(_BYTE *)(v1 + 40))
      -[HDActivitySummaryQueryHelper _queue_deliverUpdates](v1);
    else
      -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesMatchingPredicate:](v1, *(void **)(v1 + 16));
  }
}

- (void)_queue_deliverActivitySummariesMatchingPredicate:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  if (*(_BYTE *)(a1 + 42))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke;
    v7[3] = &unk_1E6D0D248;
    v7[4] = a1;
    objc_msgSend(v4, "batchedActivitySummariesWithPredicate:maxBatchSize:handler:", v3, 200, v7);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke_2;
    v6[3] = &unk_1E6D0D270;
    v6[4] = a1;
    objc_msgSend(v4, "activitySummariesWithPredicate:handler:", v3, v6);
  }

}

- (void)_queue_deliverUpdates
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 buf;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 56);
    v3 = *(void **)(a1 + 16);
    v18 = 0;
    v4 = v3;
    v5 = (void *)MEMORY[0x1E0D29890];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForRowID((uint64_t)v6, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compoundPredicateWithPredicate:otherPredicate:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23[0] = CFSTR("cache_index");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v20 = __85__HDActivitySummaryQueryHelper__fetchActivityCacheIndicesWithAnchor_predicate_error___block_invoke;
    v21 = &unk_1E6CE9FC0;
    v13 = v9;
    v22 = v13;
    LOBYTE(v4) = +[HDHealthEntity enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:](HDActivityCacheEntity, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v10, v8, v12, &v18, &buf);

    if ((v4 & 1) == 0)
    {

      v13 = 0;
    }

    v14 = v18;
    if (objc_msgSend(v14, "hk_isDatabaseAccessibilityError"))
    {
      *(_BYTE *)(a1 + 41) = 1;
    }
    else if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Error fetching activity cache indices: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      -[HDActivitySummaryQueryHelper _queue_deliverErrorToClient:](a1, v14);
    }
    else if (objc_msgSend(v13, "count"))
    {
      HDActivityCacheEntityPredicateForCacheIndices((uint64_t)v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v16, *(_QWORD *)(a1 + 16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesMatchingPredicate:](a1, v17);

    }
  }
}

uint64_t __85__HDActivitySummaryQueryHelper__fetchActivityCacheIndicesWithAnchor_predicate_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  MEMORY[0x1BCCAB1C8](a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return 1;
}

- (void)_queue_updatePreviousActivityCachesWithNewCaches:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__HDActivitySummaryQueryHelper__queue_updatePreviousActivityCachesWithNewCaches___block_invoke;
    v16[3] = &unk_1E6D0D298;
    v16[4] = a1;
    objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v16);
    objc_msgSend(*(id *)(a1 + 48), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "sortUsingSelector:", sel_compare_);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((unint64_t)objc_msgSend(v4, "count") >= 6)
    {
      do
      {
        objc_msgSend(v4, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v6);

        objc_msgSend(v4, "removeObjectAtIndex:", 0);
      }
      while ((unint64_t)objc_msgSend(v4, "count") > 5);
    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }

  }
}

void __81__HDActivitySummaryQueryHelper__queue_updatePreviousActivityCachesWithNewCaches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v6, v5);

}

- (HDActivitySummaryQueryHelper)initWithProfile:(id)a3 filter:(id)a4 batchedInitialResultsHandler:(id)a5 batchedUpdateHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDActivitySummaryQueryHelper *v14;
  HDActivitySummaryQueryHelper *v15;
  uint64_t v16;
  HDSQLitePredicate *predicate;
  HDActivitySummaryBuilder *v18;
  HDActivitySummaryBuilder *activitySummaryBuilder;
  NSMutableDictionary *v20;
  NSMutableDictionary *previousActivityCachesByCacheIndex;
  uint64_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  OS_dispatch_queue *clientQueue;
  void *v26;
  id batchedInitialResultsHandler;
  void *v28;
  id batchedUpdateHandler;
  id WeakRetained;
  void *v31;
  objc_super v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HDActivitySummaryQueryHelper;
  v14 = -[HDActivitySummaryQueryHelper init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_profile, v10);
    objc_storeStrong((id *)&v15->_filter, a4);
    -[_HKFilter predicateWithProfile:](v15->_filter, "predicateWithProfile:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    predicate = v15->_predicate;
    v15->_predicate = (HDSQLitePredicate *)v16;

    v18 = -[HDActivitySummaryBuilder initWithProfile:filter:]([HDActivitySummaryBuilder alloc], "initWithProfile:filter:", v10, v11);
    activitySummaryBuilder = v15->_activitySummaryBuilder;
    v15->_activitySummaryBuilder = v18;

    -[HDActivitySummaryBuilder setShouldIncludePrivateProperties:](v15->_activitySummaryBuilder, "setShouldIncludePrivateProperties:", 1);
    -[HDActivitySummaryBuilder setShouldIncludeStatistics:](v15->_activitySummaryBuilder, "setShouldIncludeStatistics:", 0);
    -[HDActivitySummaryBuilder setOrderByDateAscending:](v15->_activitySummaryBuilder, "setOrderByDateAscending:", 1);
    -[HDActivitySummaryBuilder setLimit:](v15->_activitySummaryBuilder, "setLimit:", 0);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    previousActivityCachesByCacheIndex = v15->_previousActivityCachesByCacheIndex;
    v15->_previousActivityCachesByCacheIndex = v20;

    HKCreateSerialDispatchQueue();
    v22 = objc_claimAutoreleasedReturnValue();
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v22;

    HKCreateSerialDispatchQueue();
    v24 = objc_claimAutoreleasedReturnValue();
    clientQueue = v15->_clientQueue;
    v15->_clientQueue = (OS_dispatch_queue *)v24;

    v26 = _Block_copy(v12);
    batchedInitialResultsHandler = v15->_batchedInitialResultsHandler;
    v15->_batchedInitialResultsHandler = v26;

    v28 = _Block_copy(v13);
    batchedUpdateHandler = v15->_batchedUpdateHandler;
    v15->_batchedUpdateHandler = v28;

    v15->_shouldBatchSummaries = 1;
    WeakRetained = objc_loadWeakRetained((id *)&v15->_profile);
    objc_msgSend(WeakRetained, "database");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addProtectedDataObserver:queue:", v15, v15->_queue);

  }
  return v15;
}

- (void)dealloc
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeProtectedDataObserver:", self);

  v6 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v6, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forDataType:", self, v8);

  v9.receiver = self;
  v9.super_class = (Class)HDActivitySummaryQueryHelper;
  -[HDActivitySummaryQueryHelper dealloc](&v9, sel_dealloc);
}

- (void)pause
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__HDActivitySummaryQueryHelper_pause__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __37__HDActivitySummaryQueryHelper_pause__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "dataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forDataType:", v3, v4);

}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HDActivitySummaryQueryHelper_stop__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __36__HDActivitySummaryQueryHelper_stop__block_invoke(uint64_t a1)
{
  -[HDActivitySummaryQueryHelper _queue_stop](*(_QWORD *)(a1 + 32));
}

- (void)_queue_stop
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "dataManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forDataType:", a1, v4);

    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v6 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v7 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

  }
}

- (void)setShouldIncludePrivateProperties:(BOOL)a3
{
  -[HDActivitySummaryBuilder setShouldIncludePrivateProperties:](self->_activitySummaryBuilder, "setShouldIncludePrivateProperties:", a3);
}

- (BOOL)shouldIncludePrivateProperties
{
  return -[HDActivitySummaryBuilder shouldIncludePrivateProperties](self->_activitySummaryBuilder, "shouldIncludePrivateProperties");
}

- (void)setShouldIncludeStatistics:(BOOL)a3
{
  -[HDActivitySummaryBuilder setShouldIncludeStatistics:](self->_activitySummaryBuilder, "setShouldIncludeStatistics:", a3);
}

- (BOOL)shouldIncludeStatistics
{
  return -[HDActivitySummaryBuilder shouldIncludeStatistics](self->_activitySummaryBuilder, "shouldIncludeStatistics");
}

- (void)setOrderByDateAscending:(BOOL)a3
{
  -[HDActivitySummaryBuilder setOrderByDateAscending:](self->_activitySummaryBuilder, "setOrderByDateAscending:", a3);
}

- (BOOL)orderByDateAscending
{
  return -[HDActivitySummaryBuilder orderByDateAscending](self->_activitySummaryBuilder, "orderByDateAscending");
}

- (void)setLimit:(unint64_t)a3
{
  -[HDActivitySummaryBuilder setLimit:](self->_activitySummaryBuilder, "setLimit:", a3);
}

- (unint64_t)limit
{
  return -[HDActivitySummaryBuilder limit](self->_activitySummaryBuilder, "limit");
}

- (void)_queue_deliverErrorToClient:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = _Block_copy(*(const void **)(a1 + 88));
    if (!*(_BYTE *)(a1 + 40))
    {
      v5 = _Block_copy(*(const void **)(a1 + 80));

      v4 = v5;
    }
    *(_BYTE *)(a1 + 40) = 1;
    -[HDActivitySummaryQueryHelper _queue_stop](a1);
    if (v4)
    {
      v6 = *(NSObject **)(a1 + 72);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __60__HDActivitySummaryQueryHelper__queue_deliverErrorToClient___block_invoke;
      v7[3] = &unk_1E6CE8C48;
      v9 = v4;
      v8 = v3;
      dispatch_async(v6, v7);

    }
  }

}

uint64_t __60__HDActivitySummaryQueryHelper__queue_deliverErrorToClient___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 1, 0, *(_QWORD *)(a1 + 32));
}

- (void)_queue_deliverActivitySummariesToClient:(char)a3 isFinalBatch:(char)a4 clearPendingBatches:
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;
  char v15;

  v7 = a2;
  if (a1)
  {
    v8 = _Block_copy(*(const void **)(a1 + 88));
    if (!*(_BYTE *)(a1 + 40))
    {
      v9 = _Block_copy(*(const void **)(a1 + 80));

      v8 = v9;
    }
    *(_BYTE *)(a1 + 40) = 1;
    if (*(_QWORD *)(a1 + 88))
    {
      if (!v8)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      -[HDActivitySummaryQueryHelper _queue_stop](a1);
      if (!v8)
        goto LABEL_7;
    }
    v10 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesToClient_isFinalBatch_clearPendingBatches___block_invoke;
    block[3] = &unk_1E6D0D220;
    v13 = v8;
    v12 = v7;
    v14 = a3;
    v15 = a4;
    dispatch_async(v10, block);

    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __105__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesToClient_isFinalBatch_clearPendingBatches___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), 0);
}

void __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, char a6, void *a7)
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  v13 = a3;
  v14 = a7;
  v15 = v14;
  if (v19)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesToClient:isFinalBatch:clearPendingBatches:](*(_QWORD *)(a1 + 32), v19, a5, a6);
  }
  else if (objc_msgSend(v14, "hk_isDatabaseAccessibilityError"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  }
  else if (v15)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverErrorToClient:](*(_QWORD *)(a1 + 32), v15);
  }
  if (a5)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(v16 + 56);
    if (v17 <= a4)
      v17 = a4;
    *(_QWORD *)(v16 + 56) = v17;
    if (v13)
      -[HDActivitySummaryQueryHelper _queue_updatePreviousActivityCachesWithNewCaches:](*(_QWORD *)(a1 + 32), v13);
    v18 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v18 + 96) = objc_msgSend(*(id *)(v18 + 32), "enumeratedSummaryCount");
  }

}

void __81__HDActivitySummaryQueryHelper__queue_deliverActivitySummariesMatchingPredicate___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v15)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverActivitySummariesToClient:isFinalBatch:clearPendingBatches:](*(_QWORD *)(a1 + 32), v15, 1, 1);
  }
  else if (objc_msgSend(v10, "hk_isDatabaseAccessibilityError"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 1;
  }
  else if (v11)
  {
    -[HDActivitySummaryQueryHelper _queue_deliverErrorToClient:](*(_QWORD *)(a1 + 32), v11);
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(v12 + 56);
  if (v13 <= a4)
    v13 = a4;
  *(_QWORD *)(v12 + 56) = v13;
  if (v9)
    -[HDActivitySummaryQueryHelper _queue_updatePreviousActivityCachesWithNewCaches:](*(_QWORD *)(a1 + 32), v9);
  v14 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v14 + 96) = objc_msgSend(*(id *)(v14 + 32), "enumeratedSummaryCount");

}

uint64_t __91__HDActivitySummaryQueryHelper__queue_updateActivitySummariesWithNewActivityCaches_anchor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "orderByDateAscending"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "_activitySummaryIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "_activitySummaryIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v5;
  }
  objc_msgSend(v8, "numberWithLongLong:", objc_msgSend(v9, "_activitySummaryIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (id)batchedInitialResultsHandler
{
  return self->_batchedInitialResultsHandler;
}

- (id)batchedUpdateHandler
{
  return self->_batchedUpdateHandler;
}

- (int64_t)enumeratedSummaryCount
{
  return self->_enumeratedSummaryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchedUpdateHandler, 0);
  objc_storeStrong(&self->_batchedInitialResultsHandler, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_previousActivityCachesByCacheIndex, 0);
  objc_storeStrong((id *)&self->_activitySummaryBuilder, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
