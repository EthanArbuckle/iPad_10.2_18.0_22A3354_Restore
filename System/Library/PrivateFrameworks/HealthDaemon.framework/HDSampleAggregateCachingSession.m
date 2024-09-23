@implementation HDSampleAggregateCachingSession

- (HDSampleAggregateCachingSession)initWithProfile:(id)a3 cachingIdentifier:(id)a4 sourceEntity:(id)a5 queryDescriptor:(id)a6 cachedClass:(Class)a7 queryInterval:(id)a8 anchorDate:(id)a9 intervalComponents:(id)a10 timeIntervalToBucketIndex:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HDSampleAggregateCachingSession *v23;
  HDSampleAggregateCacheStore *v24;
  HDSampleAggregateCacheStore *cacheStore;
  uint64_t v26;
  NSString *cachingIdentifier;
  uint64_t v28;
  NSDateInterval *queryInterval;
  uint64_t v30;
  NSDate *anchorDate;
  uint64_t v32;
  NSDateComponents *intervalComponents;
  NSError *fatalError;
  _QWORD *next;
  _QWORD *v36;
  unint64_t value;
  uint64_t i;
  void **v39;
  NSError *sampleAggregateCachingSessionQueue_insertError;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  int v46;
  objc_super v47;

  v44 = a3;
  v18 = a4;
  v43 = a5;
  v42 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v47.receiver = self;
  v47.super_class = (Class)HDSampleAggregateCachingSession;
  v23 = -[HDSampleAggregateCachingSession init](&v47, sel_init);
  if (v23)
  {
    v24 = -[HDSampleAggregateCacheStore initWithProfile:queryDescriptor:cachingIdentifier:sourceEntity:anchorDate:intervalComponents:timeIntervalToBucketIndex:]([HDSampleAggregateCacheStore alloc], "initWithProfile:queryDescriptor:cachingIdentifier:sourceEntity:anchorDate:intervalComponents:timeIntervalToBucketIndex:", v44, v42, v18, v43, v20, v21, v22);
    cacheStore = v23->_cacheStore;
    v23->_cacheStore = v24;

    objc_storeStrong((id *)&v23->_profile, a3);
    v23->_cachedClass = a7;
    v26 = objc_msgSend(v18, "copy");
    cachingIdentifier = v23->_cachingIdentifier;
    v23->_cachingIdentifier = (NSString *)v26;

    objc_storeStrong((id *)&v23->_sourceEntity, a5);
    v28 = objc_msgSend(v19, "copy");
    queryInterval = v23->_queryInterval;
    v23->_queryInterval = (NSDateInterval *)v28;

    v30 = objc_msgSend(v20, "copy");
    anchorDate = v23->_anchorDate;
    v23->_anchorDate = (NSDate *)v30;

    v32 = objc_msgSend(v21, "copy");
    intervalComponents = v23->_intervalComponents;
    v23->_intervalComponents = (NSDateComponents *)v32;

    fatalError = v23->_fatalError;
    v23->_fatalError = 0;
    v23->_state = 0;

    v45[2] = 0;
    v45[3] = 0;
    v46 = 1065353216;
    if (v23->_staleIndexes.__table_.__p2_.__value_)
    {
      next = v23->_staleIndexes.__table_.__p1_.__value_.__next_;
      if (next)
      {
        do
        {
          v36 = (_QWORD *)*next;
          operator delete(next);
          next = v36;
        }
        while (v36);
      }
      v23->_staleIndexes.__table_.__p1_.__value_.__next_ = 0;
      value = v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (i = 0; i != value; ++i)
          v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_[i] = 0;
      }
      v23->_staleIndexes.__table_.__p2_.__value_ = 0;
    }
    v45[0] = 0;
    v39 = v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_;
    v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_ = 0;
    if (v39)
      operator delete(v39);
    v23->_staleIndexes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
    v23->_staleIndexes.__table_.__p1_.__value_.__next_ = 0;
    v45[1] = 0;
    v23->_staleIndexes.__table_.__p2_.__value_ = 0;
    v23->_staleIndexes.__table_.__p3_.__value_ = 1.0;
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v45);
    v23->_maxAnchor = 0x7FFFFFFFFFFFFFFFLL;
    v23->_anchorSetOnInsert = 0;
    sampleAggregateCachingSessionQueue_insertError = v23->_sampleAggregateCachingSessionQueue_insertError;
    v23->_sampleAggregateCachingSessionQueue_insertError = 0;

  }
  return v23;
}

- (id)persistentAnchorDateWithError:(id *)a3
{
  NSDate *persistentAnchorDate;
  HDAssertion *accessibilityAssertion;
  _QWORD v7[5];

  persistentAnchorDate = self->_persistentAnchorDate;
  if (!persistentAnchorDate)
  {
    accessibilityAssertion = self->_accessibilityAssertion;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__HDSampleAggregateCachingSession_persistentAnchorDateWithError___block_invoke;
    v7[3] = &unk_1E6CF4278;
    v7[4] = self;
    if (-[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:]((uint64_t)self, accessibilityAssertion, 0, (uint64_t)a3, v7))persistentAnchorDate = self->_persistentAnchorDate;
    else
      persistentAnchorDate = 0;
  }
  return persistentAnchorDate;
}

uint64_t __65__HDSampleAggregateCachingSession_persistentAnchorDateWithError___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v14;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v14 = 0;
  objc_msgSend(v4, "persistentAnchorDateWithError:", &v14);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    v9 = 1;
  else
    v9 = v6 == 0;
  v10 = v9;
  if (!v9)
  {
    v11 = v6;
    v12 = v11;
    if (a2)
      *a2 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();

  }
  return v10;
}

- (uint64_t)_performWithAccessibilityAssertion:(uint64_t)a3 requiresWrite:(uint64_t)a4 error:(void *)a5 block:
{
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v21;
  id v22;
  _QWORD v23[4];
  uint64_t (**v24)(_QWORD, _QWORD);
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a5;
  v11 = (uint64_t (**)(_QWORD, _QWORD))v10;
  if (a1)
  {
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 16), "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v12, "cloneAccessibilityAssertion:ownerIdentifier:error:", v9, v13, &v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;

      if (v14)
      {
        +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setRequiresWrite:", a3);
        objc_msgSend(v16, "setCacheScope:", 1);
        objc_msgSend(v16, "addAccessibilityAssertion:", v14);
        objc_msgSend(*(id *)(a1 + 16), "database");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __96__HDSampleAggregateCachingSession__performWithAccessibilityAssertion_requiresWrite_error_block___block_invoke;
        v23[3] = &unk_1E6D11008;
        v24 = v11;
        v18 = objc_msgSend(v17, "performTransactionWithContext:error:block:inaccessibilityHandler:", v16, a4, v23, 0);

        objc_msgSend(v14, "invalidate");
      }
      else
      {
        _HKInitializeLogging();
        v19 = (id)*MEMORY[0x1E0CB5348];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v21 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v27 = v21;
          v28 = 2114;
          v29 = v15;
          v22 = v21;
          _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to copy accessibility assertion; continuing: %{public}@",
            buf,
            0x16u);

        }
        v18 = v11[2](v11, a4);
      }

    }
    else
    {
      v18 = (*((uint64_t (**)(id, uint64_t))v10 + 2))(v10, a4);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)cachesExistWithError:(id *)a3
{
  HDAssertion *accessibilityAssertion;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  accessibilityAssertion = self->_accessibilityAssertion;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__HDSampleAggregateCachingSession_cachesExistWithError___block_invoke;
  v6[3] = &unk_1E6CF43D0;
  v6[4] = self;
  v6[5] = &v7;
  if (-[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:]((uint64_t)self, accessibilityAssertion, 0, (uint64_t)a3, v6))v4 = v8[3];
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

BOOL __56__HDSampleAggregateCachingSession_cachesExistWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cachesExistWithError:", a2);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
}

- (BOOL)activateWithError:(id *)a3 cacheHandler:(id)a4
{
  id v6;
  NSObject *v7;
  int64_t state;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  HDAssertion *accessibilityAssertion;
  char v17;
  NSString *cachingIdentifier;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  HDSampleAggregateCachingSession *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
  {
    cachingIdentifier = self->_cachingIdentifier;
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2112;
    v25 = cachingIdentifier;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ Activating session for %@", buf, 0x16u);
  }
  else if (!self)
  {
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  state = self->_state;
  if ((unint64_t)(state - 1) < 3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = self->_state - 1;
    if (v11 > 3)
      v12 = CFSTR("NotStarted");
    else
      v12 = off_1E6D11028[v11];
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, sel__changeStateForActivateWithError_, CFSTR("Invalid transition for HDSampleAggregateCachingSession from %@ -> Active"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (state)
  {
    if (state != 4)
    {
      v15 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 3, CFSTR("HDSampleAggregateCachingSession experienced a fatal error"), self->_fatalError);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = v13;
    v15 = v14;
    if (v14)
    {
      if (a3)
      {
        v15 = objc_retainAutorelease(v14);
        *a3 = v15;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_17;
  }
  self->_state = 1;
  accessibilityAssertion = self->_accessibilityAssertion;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke;
  v20[3] = &unk_1E6D04578;
  v20[4] = self;
  v21 = v6;
  v17 = -[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:]((uint64_t)self, accessibilityAssertion, 0, (uint64_t)a3, v20);

LABEL_19:
  return v17;
}

uint64_t __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  _QWORD aBlock[5];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  unint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[5];
  v6 = v4[6];
  v7 = v4[2];
  v50 = 0;
  +[HDCachedQueryMetadataEntity generationNumberForQueryIdentifier:sourceEntity:profile:error:](HDCachedQueryMetadataEntity, "generationNumberForQueryIdentifier:sourceEntity:profile:error:", v5, v6, v7, &v50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v50;
  v10 = v9;
  if (v8)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = objc_msgSend(v8, "integerValue");
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke_2;
    aBlock[3] = &unk_1E6D10FB8;
    v12 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v40 = &v42;
    v41 = &v46;
    v39 = v12;
    v13 = _Block_copy(aBlock);
    v36 = 0;
    v37 = 0;
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateForInterval:cachedClass:anchorAfterDatabaseScan:error:cacheHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), &v37, &v36, v13);
    v15 = v36;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(v16 + 88);
    if (v17 >= v37)
      v17 = v37;
    *(_QWORD *)(v16 + 88) = v17;
    v18 = *(_QWORD *)(a1 + 32);
    if ((v14 & 1) != 0)
    {
      objc_msgSend(*(id *)(v18 + 32), "duration");
      v20 = v19;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "hk_approximateDuration");
      v22 = v21;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "daemon");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "analyticsSubmissionCoordinator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = vcvtad_u64_f64(v20 / v22);
      objc_msgSend(v24, "database_reportCachedQueryEvent:cacheHits:cacheMisses:estimatedTotalBuckets:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v47[3], v43[3], v25);
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
      {
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(_QWORD *)(v32 + 40);
        v34 = v47[3];
        v35 = v43[3];
        *(_DWORD *)buf = 138544386;
        v52 = v32;
        v53 = 2112;
        v54 = v33;
        v55 = 2048;
        v56 = v34;
        v57 = 2048;
        v58 = v35;
        v59 = 2048;
        v60 = v25;
        _os_log_debug_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ reporting cache success rate for %@ (hits = %lu, misses = %lu, numBuckets = %lu)", buf, 0x34u);
      }

    }
    else
    {
      -[HDSampleAggregateCachingSession _changeStateForFatalError:](v18, v15);
    }
    v29 = v15;
    v30 = v29;
    if (v29)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v29);
      else
        _HKLogDroppedError();
    }

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
  }
  else
  {
    v27 = v9;
    v28 = v27;
    if (a2)
      *a2 = objc_retainAutorelease(v27);
    else
      _HKLogDroppedError();

    v14 = 0;
  }

  return v14;
}

uint64_t __66__HDSampleAggregateCachingSession_activateWithError_cacheHandler___block_invoke_2(_QWORD *a1, void *a2, int a3, unint64_t a4)
{
  unint64_t v4;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *i;
  unint64_t v15;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  int8x8_t prime;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint8x8_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  void *v40;

  v8 = a2;
  if (!a3)
  {
    v12 = a1[7];
    goto LABEL_77;
  }
  v9 = a1[4];
  v10 = *(_QWORD *)(v9 + 120);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = a4;
      if (v10 <= a4)
        v4 = a4 % v10;
    }
    else
    {
      v4 = (v10 - 1) & a4;
    }
    v13 = *(_QWORD **)(*(_QWORD *)(v9 + 112) + 8 * v4);
    if (v13)
    {
      for (i = (_QWORD *)*v13; i; i = (_QWORD *)*i)
      {
        v15 = i[1];
        if (v15 == a4)
        {
          if (i[2] == a4)
            goto LABEL_76;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v4)
            break;
        }
      }
    }
  }
  v16 = operator new(0x18uLL);
  *v16 = 0;
  v16[1] = a4;
  v16[2] = a4;
  v17 = (float)(unint64_t)(*(_QWORD *)(v9 + 136) + 1);
  v18 = *(float *)(v9 + 144);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    v19 = 1;
    if (v10 >= 3)
      v19 = (v10 & (v10 - 1)) != 0;
    v20 = v19 | (2 * v10);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      prime = (int8x8_t)v21;
    else
      prime = (int8x8_t)v20;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v10 = *(_QWORD *)(v9 + 120);
    }
    if (*(_QWORD *)&prime > v10)
      goto LABEL_32;
    if (*(_QWORD *)&prime < v10)
    {
      v29 = vcvtps_u32_f32((float)*(unint64_t *)(v9 + 136) / *(float *)(v9 + 144));
      if (v10 < 3 || (v30 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        v29 = std::__next_prime(v29);
      }
      else
      {
        v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2)
          v29 = v31;
      }
      if (*(_QWORD *)&prime <= v29)
        prime = (int8x8_t)v29;
      if (*(_QWORD *)&prime >= v10)
      {
        v10 = *(_QWORD *)(v9 + 120);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v23 = operator new(8 * *(_QWORD *)&prime);
          v24 = *(void **)(v9 + 112);
          *(_QWORD *)(v9 + 112) = v23;
          if (v24)
            operator delete(v24);
          v25 = 0;
          *(int8x8_t *)(v9 + 120) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v9 + 112) + 8 * v25++) = 0;
          while (*(_QWORD *)&prime != v25);
          v26 = *(_QWORD **)(v9 + 128);
          if (v26)
          {
            v27 = v26[1];
            v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(_QWORD *)&prime)
                v27 %= *(_QWORD *)&prime;
            }
            else
            {
              v27 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v9 + 112) + 8 * v27) = v9 + 128;
            v32 = (_QWORD *)*v26;
            if (*v26)
            {
              do
              {
                v33 = v32[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(_QWORD *)&prime)
                    v33 %= *(_QWORD *)&prime;
                }
                else
                {
                  v33 &= *(_QWORD *)&prime - 1;
                }
                if (v33 != v27)
                {
                  v34 = *(_QWORD *)(v9 + 112);
                  if (!*(_QWORD *)(v34 + 8 * v33))
                  {
                    *(_QWORD *)(v34 + 8 * v33) = v26;
                    goto LABEL_57;
                  }
                  *v26 = *v32;
                  *v32 = **(_QWORD **)(*(_QWORD *)(v9 + 112) + 8 * v33);
                  **(_QWORD **)(*(_QWORD *)(v9 + 112) + 8 * v33) = v32;
                  v32 = v26;
                }
                v33 = v27;
LABEL_57:
                v26 = v32;
                v32 = (_QWORD *)*v32;
                v27 = v33;
              }
              while (v32);
            }
          }
          v10 = (unint64_t)prime;
          goto LABEL_61;
        }
        v40 = *(void **)(v9 + 112);
        *(_QWORD *)(v9 + 112) = 0;
        if (v40)
          operator delete(v40);
        v10 = 0;
        *(_QWORD *)(v9 + 120) = 0;
      }
    }
LABEL_61:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v10 <= a4)
        v4 = a4 % v10;
      else
        v4 = a4;
    }
    else
    {
      v4 = (v10 - 1) & a4;
    }
  }
  v35 = *(_QWORD *)(v9 + 112);
  v36 = *(_QWORD **)(v35 + 8 * v4);
  if (v36)
  {
    *v16 = *v36;
  }
  else
  {
    *v16 = *(_QWORD *)(v9 + 128);
    *(_QWORD *)(v9 + 128) = v16;
    *(_QWORD *)(v35 + 8 * v4) = v9 + 128;
    if (!*v16)
      goto LABEL_75;
    v37 = *(_QWORD *)(*v16 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v37 >= v10)
        v37 %= v10;
    }
    else
    {
      v37 &= v10 - 1;
    }
    v36 = (_QWORD *)(*(_QWORD *)(v9 + 112) + 8 * v37);
  }
  *v36 = v16;
LABEL_75:
  ++*(_QWORD *)(v9 + 136);
LABEL_76:
  v12 = a1[6];
LABEL_77:
  ++*(_QWORD *)(*(_QWORD *)(v12 + 8) + 24);
  v38 = (*(uint64_t (**)(void))(a1[5] + 16))();

  return v38;
}

- (void)_changeStateForFatalError:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 104) = 4;
    v6 = v3;
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unknown internal fatal error encountered in HDSampleAggregateCachingSession"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v4;

    v3 = v6;
  }

}

- (void)deleteCachesForIntervals:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t (**v13)(_QWORD, _QWORD);
  void *v14;
  unint64_t v15;
  void *v16;
  int64_t generationNumber;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  void *v23;
  _QWORD v24[5];
  id v25;
  int64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v6 = a4;
  v31 = 0;
  v20 = v6;
  -[HDSampleAggregateCachingSession persistentAnchorDateWithError:](self, "persistentAnchorDateWithError:", &v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v31;
  v19 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v7);
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v21;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16, 0);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
          -[HDSampleAggregateCacheStore timeIntervalToBucketIndex](self->_cacheStore, "timeIntervalToBucketIndex");
          v13 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v15 = ((uint64_t (**)(_QWORD, void *))v13)[2](v13, v23);

          std::__hash_table<long,std::hash<long>,std::equal_to<long>,std::allocator<long>>::__erase_unique<long>(&self->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_, v15);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    generationNumber = self->_generationNumber;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__HDSampleAggregateCachingSession_deleteCachesForIntervals_completion___block_invoke;
    v24[3] = &unk_1E6CFD9F8;
    v24[4] = self;
    v18 = v8;
    v25 = v18;
    v26 = generationNumber;
    -[HDSampleAggregateCachingSession _writeToDatabaseOnCachePersistenceQueueWithBlock:completion:]((uint64_t)self, v24, v20);

  }
}

uint64_t __71__HDSampleAggregateCachingSession_deleteCachesForIntervals_completion___block_invoke(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1[4] + 8), "deleteCachesForIndexes:generationNumber:error:", a1[5], a1[6] + 1, a2);
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = *a2;
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when deleting caches: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v4;
}

- (void)_writeToDatabaseOnCachePersistenceQueueWithBlock:(void *)a3 completion:
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke;
    block[3] = &unk_1E6CF3F98;
    block[4] = a1;
    if (qword_1ED552578 != -1)
      dispatch_once(&qword_1ED552578, block);
    v8 = _MergedGlobals_228;
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke_2;
    v9[3] = &unk_1E6CF4088;
    v9[4] = a1;
    v10 = v6;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)insertCaches:(id)a3 anchor:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int64_t maxAnchor;
  uint64_t v14;
  int64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  HDSampleAggregateCacheStore *v22;
  int64_t generationNumber;
  void *v24;
  HDSampleAggregateCacheStore *v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  const __CFString *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  HDSampleAggregateCacheStore *v36;
  id v37;
  HDSampleAggregateCachingSession *v38;
  int64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v45 = 0;
  if (self)
  {
    v11 = 0;
    switch(self->_state)
    {
      case 0:
        if (-[HDSampleAggregateCachingSession cachesExistWithError:](self, "cachesExistWithError:", &v45) == 2)
        {
          v11 = v45;
          goto LABEL_3;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__changeStateForInsertingWithError_, CFSTR("Must call activate on HDSampleAggregateCachingSession before inserting"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      case 1:
      case 2:
LABEL_3:
        self->_state = 2;
        v12 = v11;
        if (v9)
        {
          maxAnchor = self->_maxAnchor;
          v14 = objc_msgSend(v9, "longLongValue");
          if (maxAnchor >= v14)
            v15 = v14;
          else
            v15 = maxAnchor;
          self->_maxAnchor = v15;
          self->_anchorSetOnInsert = 1;
        }

        v44 = 0;
        -[HDSampleAggregateCachingSession persistentAnchorDateWithError:](self, "persistentAnchorDateWithError:", &v44);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v44;
        if (v16)
        {
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v34 = v8;
          v18 = v8;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v41;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v41 != v20)
                  objc_enumerationMutation(v18);
                std::__hash_table<long,std::hash<long>,std::equal_to<long>,std::allocator<long>>::__erase_unique<long>(&self->_staleIndexes.__table_.__bucket_list_.__ptr_.__value_, objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v21++), "bucketIndexForIntervalComponents:anchorDate:", self->_intervalComponents, v16));
              }
              while (v19 != v21);
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
            }
            while (v19);
          }

          v8 = v34;
          v22 = self->_cacheStore;
          generationNumber = self->_generationNumber;
          v24 = (void *)objc_msgSend(v18, "copy");
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __66__HDSampleAggregateCachingSession_insertCaches_anchor_completion___block_invoke;
          v35[3] = &unk_1E6D10FE0;
          v25 = v22;
          v36 = v25;
          v37 = v24;
          v38 = self;
          v39 = generationNumber;
          v26 = v24;
          -[HDSampleAggregateCachingSession _writeToDatabaseOnCachePersistenceQueueWithBlock:completion:]((uint64_t)self, v35, v10);

        }
        else
        {
          (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v17);
          -[HDSampleAggregateCachingSession _changeStateForFatalError:]((uint64_t)self, v17);
        }

        goto LABEL_32;
      case 3:
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v28 = objc_opt_class();
        v29 = self->_state - 1;
        if (v29 > 3)
          v30 = CFSTR("NotStarted");
        else
          v30 = off_1E6D11028[v29];
        objc_msgSend(v27, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v28, sel__changeStateForInsertingWithError_, CFSTR("Invalid transition for HDSampleAggregateCachingSession from %@ -> Inserting"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 3, CFSTR("HDSampleAggregateCachingSession experienced a fatal error"), self->_fatalError);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
        v32 = v31;
        if (v32)
        {
          v11 = objc_retainAutorelease(v32);
          v45 = v11;
        }
        else
        {
          v11 = 0;
        }
        break;
      default:
        break;
    }

    v33 = v45;
  }
  else
  {
    v33 = 0;
  }
  v17 = v33;
  (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v17);
LABEL_32:

}

uint64_t __66__HDSampleAggregateCachingSession_insertCaches_anchor_completion___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "saveCaches:generationNumber:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, a2);
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *a2;
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when inserting caches: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v4;
}

- (void)finishWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  int64_t state;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t (**v19)(_QWORD, _QWORD);
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSString *cachingIdentifier;
  void *v25;
  void *v26;
  void *v27;
  uint64_t (**v28)(_QWORD, _QWORD);
  void *v29;
  HDCachedQueryMetadata *v30;
  NSString *v31;
  int64_t v32;
  int64_t maxAnchor;
  int64_t generationNumber;
  void *v35;
  void *v36;
  HDCachedQueryMetadata *v37;
  HDProfile *v38;
  HDProfile *v39;
  HDCachedQueryMetadata *v40;
  NSString *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  HDCachedQueryMetadata *v49;
  HDProfile *v50;
  HDSampleAggregateCachingSession *v51;
  id v52;
  uint8_t buf[4];
  HDSampleAggregateCachingSession *v54;
  __int16 v55;
  NSString *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, id))a3;
  state = self->_state;
  switch(state)
  {
    case 0:
    case 1:
      goto LABEL_3;
    case 2:
      if (!self->_anchorSetOnInsert)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__validateTransitionToFinishWithError_, CFSTR("Cannot finish HDSampleAggregateCachingSession because a non-nil anchor must be specified for at least one insertion of caches."));
        v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v6 = v11;
        if (!v6)
          goto LABEL_5;
        goto LABEL_13;
      }
LABEL_3:
      self->_state = 3;
      if (self->_staleIndexes.__table_.__p2_.__value_)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__validateTransitionToFinishWithError_, CFSTR("Cannot finish HDSampleAggregateCachingSession due to %ld buckets that still need updating"), self->_staleIndexes.__table_.__p2_.__value_);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
LABEL_5:
          v7 = 0;
LABEL_14:

          v12 = v7;
          _HKInitializeLogging();
          v13 = (void *)*MEMORY[0x1E0CB5348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
          {
            v14 = v13;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              cachingIdentifier = self->_cachingIdentifier;
              objc_msgSend(v12, "localizedDescription");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v54 = self;
              v55 = 2112;
              v56 = cachingIdentifier;
              v57 = 2114;
              v58 = v25;
              _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session %@ with error %{public}@", buf, 0x20u);

            }
          }
          v15 = 0;
LABEL_19:
          v4[2](v4, v15, v12);
          goto LABEL_20;
        }
LABEL_13:
        v7 = objc_retainAutorelease(v6);
        goto LABEL_14;
      }
      if (!state)
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
        {
          v41 = self->_cachingIdentifier;
          *(_DWORD *)buf = 138543618;
          v54 = self;
          v55 = 2112;
          v56 = v41;
          _os_log_debug_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session %@ successfully", buf, 0x16u);
        }
        v12 = 0;
        v15 = 1;
        goto LABEL_19;
      }
      v52 = 0;
      -[HDSampleAggregateCachingSession persistentAnchorDateWithError:](self, "persistentAnchorDateWithError:", &v52);
      v16 = objc_claimAutoreleasedReturnValue();
      v12 = v52;
      v47 = (void *)v16;
      if (v16)
      {
        -[NSDateInterval startDate](self->_queryInterval, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)MEMORY[0x1E0CB37E8];
          -[HDSampleAggregateCacheStore timeIntervalToBucketIndex](self->_cacheStore, "timeIntervalToBucketIndex");
          v19 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[NSDateInterval startDate](self->_queryInterval, "startDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceReferenceDate");
          objc_msgSend(v18, "numberWithInteger:", ((uint64_t (**)(_QWORD, void *))v19)[2](v19, v47));
          v46 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v46 = 0;
        }

        -[NSDateInterval endDate](self->_queryInterval, "endDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)MEMORY[0x1E0CB37E8];
          -[HDSampleAggregateCacheStore timeIntervalToBucketIndex](self->_cacheStore, "timeIntervalToBucketIndex");
          v28 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[NSDateInterval endDate](self->_queryInterval, "endDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timeIntervalSinceReferenceDate");
          objc_msgSend(v27, "numberWithInteger:", ((uint64_t (**)(_QWORD, void *))v28)[2](v28, v47) - 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v45 = 0;
        }

        v30 = [HDCachedQueryMetadata alloc];
        v31 = self->_cachingIdentifier;
        v32 = -[HDSQLiteEntity persistentID](self->_sourceEntity, "persistentID");
        maxAnchor = self->_maxAnchor;
        generationNumber = self->_generationNumber;
        -[HDProfile daemon](self->_profile, "daemon");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "behavior");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "currentOSBuild");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[HDCachedQueryMetadata initWithCachingIdentifier:sourceEntityPersistentID:maxAnchor:queryStartIndex:queryEndIndex:generationNumber:buildVersion:anchorDate:intervalComponents:](v30, "initWithCachingIdentifier:sourceEntityPersistentID:maxAnchor:queryStartIndex:queryEndIndex:generationNumber:buildVersion:anchorDate:intervalComponents:", v31, v32, maxAnchor, v46, v45, generationNumber + 1, v36, self->_anchorDate, self->_intervalComponents);

        v38 = self->_profile;
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __56__HDSampleAggregateCachingSession_finishWithCompletion___block_invoke;
        v48[3] = &unk_1E6CFD690;
        v49 = v37;
        v50 = v38;
        v51 = self;
        v39 = v38;
        v40 = v37;
        -[HDSampleAggregateCachingSession _writeToDatabaseOnCachePersistenceQueueWithBlock:completion:]((uint64_t)self, v48, v4);

      }
      else
      {
        _HKInitializeLogging();
        v22 = (void *)*MEMORY[0x1E0CB5348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
        {
          v23 = v22;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            v42 = self->_cachingIdentifier;
            objc_msgSend(v12, "localizedDescription");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v54 = self;
            v55 = 2112;
            v56 = v42;
            v57 = 2114;
            v58 = v43;
            _os_log_debug_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing caching session %@ with error %{public}@", buf, 0x20u);

          }
        }
        v4[2](v4, 0, v12);
        -[HDSampleAggregateCachingSession _changeStateForFatalError:]((uint64_t)self, v12);
      }

LABEL_20:
      return;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__changeStateForFinishWithError_, CFSTR("HDSampleAggregateCachingSession is already finished"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 3, CFSTR("HDSampleAggregateCachingSession experienced a fatal error"), self->_fatalError);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = v8;
      if (!v9)
        goto LABEL_10;
      v10 = objc_retainAutorelease(v9);
      goto LABEL_11;
    default:
LABEL_10:
      v10 = 0;
LABEL_11:

      v11 = v10;
      goto LABEL_12;
  }
}

BOOL __56__HDSampleAggregateCachingSession_finishWithCompletion___block_invoke(_QWORD *a1, uint64_t *a2)
{
  _BOOL8 v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = +[HDCachedQueryMetadataEntity updateCachedQueryMetadata:profile:error:](HDCachedQueryMetadataEntity, "updateCachedQueryMetadata:profile:error:", a1[4], a1[5], a2);
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5348];
  v6 = *MEMORY[0x1E0CB5348];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = a1[6];
      v8 = *(_QWORD *)(v7 + 40);
      v12 = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_debug_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ Finishing query %@ successfully", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = a1[6];
    v11 = *a2;
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when finishing session: %@", (uint8_t *)&v12, 0x16u);
  }
  return v4;
}

void __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("sample-aggregate-caching-session-queue"));
  HKCreateSerialDispatchQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_228;
  _MergedGlobals_228 = v0;

}

void __95__HDSampleAggregateCachingSession__writeToDatabaseOnCachePersistenceQueueWithBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 160))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v3 = *(void **)(v2 + 176);
    v10 = 0;
    v4 = -[HDSampleAggregateCachingSession _performWithAccessibilityAssertion:requiresWrite:error:block:](v2, v3, 1, (uint64_t)&v10, *(void **)(a1 + 48));
    v5 = v10;
    v6 = v10;
    if ((v4 & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v12 = v9;
        v13 = 2112;
        v14 = v6;
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Encountered failure when updating caches: %@", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), v5);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v4, v6);

  }
}

uint64_t __96__HDSampleAggregateCachingSession__performWithAccessibilityAssertion_requiresWrite_error_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSArray)invalidationQueryDescriptors
{
  return self->_invalidationQueryDescriptors;
}

- (void)setInvalidationQueryDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (void)setAccessibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_invalidationQueryDescriptors, 0);
  objc_storeStrong((id *)&self->_sampleAggregateCachingSessionQueue_insertError, 0);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_staleIndexes);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_persistentAnchorDate, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_cachingIdentifier, 0);
  objc_storeStrong((id *)&self->_queryInterval, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_cacheStore, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  return self;
}

@end
