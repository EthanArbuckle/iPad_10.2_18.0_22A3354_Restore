@implementation HDActivitySummaryBuilder

- (HDActivitySummaryBuilder)initWithProfile:(id)a3
{
  return -[HDActivitySummaryBuilder initWithProfile:filter:](self, "initWithProfile:filter:", a3, 0);
}

- (void)activitySummariesWithPredicate:(id)a3 handler:(id)a4
{
  objc_class *v6;
  void (**v7)(id, id, id, uint64_t, _QWORD);
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = (void (**)(id, id, id, uint64_t, _QWORD))a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0;
  v19 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HDActivitySummaryBuilder_activitySummariesWithPredicate_handler___block_invoke;
  v15[3] = &unk_1E6CF6588;
  v11 = v10;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v13 = -[HDActivitySummaryBuilder _enumerateActivitySummariesAndCachesWithPredicate:largestAnchor:error:handler:]((uint64_t)self, v8, &v19, (uint64_t)&v18, v15);

  v14 = v18;
  if (v13)
    v7[2](v7, v11, v12, v19, 0);
  else
    ((void (**)(id, id, id, uint64_t, id))v7)[2](v7, 0, 0, 0, v14);

}

void __67__HDActivitySummaryBuilder_activitySummariesWithPredicate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "addObject:", v7);
  v8 = *(void **)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(v7, "_activitySummaryIndex");

  objc_msgSend(v9, "numberWithLongLong:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseTransactionContext, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (HDActivitySummaryBuilder)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDActivitySummaryBuilder)initWithProfile:(id)a3 filter:(id)a4
{
  id v6;
  id v7;
  HDActivitySummaryBuilder *v8;
  HDActivitySummaryBuilder *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDActivitySummaryBuilder;
  v8 = -[HDActivitySummaryBuilder init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_filter, a4);
    *(_WORD *)&v9->_shouldIncludePrivateProperties = 1;
    v9->_orderByDateAscending = 1;
    v9->_limit = 0;
  }

  return v9;
}

- (BOOL)enumerateActivitySummariesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__HDActivitySummaryBuilder_enumerateActivitySummariesWithPredicate_error_handler___block_invoke;
  v11[3] = &unk_1E6CF6560;
  v12 = v8;
  v9 = v8;
  LOBYTE(a4) = -[HDActivitySummaryBuilder _enumerateActivitySummariesAndCachesWithPredicate:largestAnchor:error:handler:]((uint64_t)self, a3, 0, (uint64_t)a4, v11);

  return (char)a4;
}

uint64_t __82__HDActivitySummaryBuilder_enumerateActivitySummariesWithPredicate_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_enumerateActivitySummariesAndCachesWithPredicate:(_QWORD *)a3 largestAnchor:(uint64_t)a4 error:(void *)a5 handler:
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _BOOL8 v24;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD aBlock[5];
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD v52[4];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v8 = a5;
  if (a1)
  {
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    v52[3] = 0;
    objc_msgSend(*(id *)(a1 + 16), "filterIgnoringActivityCacheIndexFilter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke;
    aBlock[3] = &unk_1E6CF65D8;
    aBlock[4] = a1;
    v51 = v52;
    v11 = v9;
    v49 = v11;
    v50 = v8;
    v12 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", v13, WeakRetained);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setPredicate:", v27);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEncodingOption:forKey:", v16, CFSTR("IncludePrivateActivityCacheProperties"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEncodingOption:forKey:", v17, CFSTR("IncludeActivityCacheStatistics"));

    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("cache_index"), objc_opt_class(), *(unsigned __int8 *)(a1 + 26));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOrderingTerms:", v19);

    objc_msgSend(v15, "setDatabaseTransactionContext:", *(_QWORD *)(a1 + 40));
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 1;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0x8000000000000000;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke_197;
    v28[3] = &unk_1E6CF6600;
    v31 = v39;
    v32 = &v44;
    v21 = v12;
    v30 = v21;
    v22 = v20;
    v29 = v22;
    v33 = &v35;
    v34 = &v40;
    if ((objc_msgSend(v15, "enumerateWithError:handler:", a4, v28) & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      (*((void (**)(id, void *))v21 + 2))(v21, v23);

      *(_QWORD *)(a1 + 48) = v36[3];
      v22 = 0;
      if (a3)
        *a3 = v41[3];
      v24 = 1;
    }
    else
    {
      v24 = *((_BYTE *)v45 + 24) == 0;
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);

    _Block_object_dispose(v52, 8);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)batchedActivitySummariesWithPredicate:(id)a3 maxBatchSize:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v8 = a3;
  v9 = a5;
  v43 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__80;
  v41 = __Block_byref_object_dispose__80;
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__80;
  v35 = __Block_byref_object_dispose__80;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v26 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__HDActivitySummaryBuilder_batchedActivitySummariesWithPredicate_maxBatchSize_handler___block_invoke;
  v18[3] = &unk_1E6CF65B0;
  v24 = a4;
  v21 = &v31;
  v22 = &v27;
  v10 = v9;
  v23 = &v37;
  v25 = 0;
  v19 = 0;
  v20 = v10;
  LODWORD(v9) = -[HDActivitySummaryBuilder _enumerateActivitySummariesAndCachesWithPredicate:largestAnchor:error:handler:]((uint64_t)self, v8, &v43, (uint64_t)&v26, v18);
  v11 = v26;
  v12 = v11;
  if ((_DWORD)v9)
  {
    v13 = 0;
    v14 = v32[5];
    v15 = v38[5];
    v16 = v43;
    v17 = *((_BYTE *)v28 + 24) != 0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v13 = v11;
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, _BOOL8, id))v10 + 2))(v10, v14, v15, v16, 1, v17, v13);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

void __87__HDActivitySummaryBuilder_batchedActivitySummariesWithPredicate_maxBatchSize_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v6 = a3;
  v7 = a2;
  if ((unint64_t)objc_msgSend(v5, "count") >= a1[9])
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    (*(void (**)(void))(a1[5] + 16))();
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = *(_QWORD *)(a1[8] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v7);
  v14 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend(v7, "_activitySummaryIndex");

  objc_msgSend(v15, "numberWithLongLong:", v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v6, v17);

}

BOOL __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(_QWORD *)(a1[4] + 32);
    if (v4 && *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == v4)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6278], "_mostSignificantCacheAmongCaches:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6278]), "_initWithActivityCache:shouldIncludePrivateProperties:", v6, *(unsigned __int8 *)(a1[4] + 24));
      v8 = v7;
      if (*(_BYTE *)(a1[4] + 24))
      {
        objc_msgSend(v7, "_startDate");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9
          || (v10 = (void *)v9,
              objc_msgSend(v8, "_endDate"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              v11,
              v10,
              !v11))
        {
          _HKInitializeLogging();
          v12 = (void *)*MEMORY[0x1E0CB5260];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5260], OS_LOG_TYPE_FAULT))
          {
            v16 = v12;
            v17 = 138413058;
            v18 = v8;
            v19 = 2112;
            v20 = v6;
            v21 = 2048;
            v22 = objc_msgSend(v3, "count");
            v23 = 2112;
            v24 = v3;
            _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "Activity summary without start/end date: %@ from cache: %@ out of %ld caches: %@", (uint8_t *)&v17, 0x2Au);

          }
        }
      }
      v13 = a1[5];
      if (!v13 || objc_msgSend(MEMORY[0x1E0CB6FA0], "filter:acceptsActivitySummary:", v13, v8))
      {
        ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
        LOBYTE(v17) = 0;
        (*(void (**)(_QWORD))(a1[6] + 16))(a1[6]);
      }
      v14 = *(_QWORD *)(a1[4] + 32);
      if (v14)
        v5 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) < v14;
      else
        v5 = 1;

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __106__HDActivitySummaryBuilder__enumerateActivitySummariesAndCachesWithPredicate_largestAnchor_error_handler___block_invoke_197(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = objc_msgSend(v5, "cacheIndex");
  if (v6 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(_QWORD *)(v10 + 24);
  if (v11 <= a3)
    v11 = a3;
  *(_QWORD *)(v10 + 24) = v11;
  v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v12;
}

- (BOOL)shouldIncludePrivateProperties
{
  return self->_shouldIncludePrivateProperties;
}

- (void)setShouldIncludePrivateProperties:(BOOL)a3
{
  self->_shouldIncludePrivateProperties = a3;
}

- (BOOL)shouldIncludeStatistics
{
  return self->_shouldIncludeStatistics;
}

- (void)setShouldIncludeStatistics:(BOOL)a3
{
  self->_shouldIncludeStatistics = a3;
}

- (BOOL)orderByDateAscending
{
  return self->_orderByDateAscending;
}

- (void)setOrderByDateAscending:(BOOL)a3
{
  self->_orderByDateAscending = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (HDDatabaseTransactionContext)databaseTransactionContext
{
  return self->_databaseTransactionContext;
}

- (void)setDatabaseTransactionContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)enumeratedSummaryCount
{
  return self->_enumeratedSummaryCount;
}

@end
