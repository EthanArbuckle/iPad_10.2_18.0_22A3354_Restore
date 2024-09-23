@implementation HDDataCollectionManager

- (void)startDataCollectionForType:(id)a3 observer:(id)a4 collectionInterval:(double)a5
{
  id v8;
  id v9;
  id v10;

  if (a3)
  {
    v8 = a4;
    v9 = a3;
    +[HDDataCollectionObserverState dataCollectionObserverStateInBackground:hasRunningWorkout:](HDDataCollectionObserverState, "dataCollectionObserverStateInBackground:hasRunningWorkout:", 0, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HDDataCollectionManager addDataCollectionObserver:type:collectionInterval:state:](self, "addDataCollectionObserver:type:collectionInterval:state:", v8, v9, v10, a5);

  }
}

- (void)addDataCollectionObserver:(id)a3 type:(id)a4 collectionInterval:(double)a5 state:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *queue;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  HDDataCollectionManager *v23;
  id v24;
  id v25;
  double v26;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataCollectionManager.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataCollectionManager.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataCollectionManager.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state != nil"));

LABEL_4:
  if (-[HDDataCollectionManager _typeIsCollectible:]((os_unfair_lock_s *)self, v12))
  {
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("AddObserver"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke;
    block[3] = &unk_1E6D010C8;
    v21 = v11;
    v26 = a5;
    v22 = v13;
    v23 = self;
    v24 = v12;
    v25 = v14;
    v16 = v14;
    dispatch_async(queue, block);

  }
}

void __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke(uint64_t a1)
{
  _HDDataCollectionObserverWrapper *v2;
  void *v3;
  double v4;
  id v5;
  id v6;
  _HDDataCollectionObserverWrapper *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _HDDataCollectionObserverWrapper *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _HDDataCollectionObserverWrapper *v15;
  id v16;
  objc_super v17;

  v2 = [_HDDataCollectionObserverWrapper alloc];
  v3 = *(void **)(a1 + 40);
  v4 = *(double *)(a1 + 72);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  if (v2)
  {
    v17.receiver = v2;
    v17.super_class = (Class)_HDDataCollectionObserverWrapper;
    v7 = (_HDDataCollectionObserverWrapper *)objc_msgSendSuper2(&v17, sel_init);
    v2 = v7;
    if (v7)
    {
      objc_storeWeak(&v7->_observer, v5);
      v2->_collectionInterval = v4;
      objc_storeStrong((id *)&v2->_state, v3);
    }
  }

  -[HDDataCollectionManager _queue_observerMapForType:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke_2;
  v13[3] = &unk_1E6CE7FB8;
  v14 = v8;
  v15 = v2;
  v16 = *(id *)(a1 + 32);
  v11 = v2;
  v12 = v8;
  -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v9, v10, v13);
  objc_msgSend(*(id *)(a1 + 64), "invalidate");

}

- (id)_queue_observerMapForType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = a2;
  if (!a1)
    goto LABEL_9;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_observerMapForType_, a1, CFSTR("HDDataCollectionManager.m"), 577, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

LABEL_9:
    v7 = 0;
    goto LABEL_7;
  }
  v4 = *(void **)(a1 + 128);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = v5;

    v4 = *(void **)(a1 + 128);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 128), "setObject:forKeyedSubscript:", v7, v3);
  }
LABEL_7:

  return v7;
}

- (void)_queue_adjustDataCollectionForType:(void *)a3 block:
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  NSObject *v39;
  void *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void (**v55)(_QWORD);
  void (**v56)(_QWORD);
  int v57;
  int v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE buf[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _Block_copy(*(const void **)(a1 + 96));
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
    if (v7 || v8 || v9)
    {
      v59 = v7;
      v62 = 0u;
      v63 = 0u;
      -[HDDataCollectionManager _queue_collectionStateForType:]((uint64_t)&v62, a1, v5);
      v6[2](v6);
      v60 = 0u;
      v61 = 0u;
      -[HDDataCollectionManager _queue_collectionStateForType:]((uint64_t)&v60, a1, v5);
      v14 = v62;
      v15 = v63;
      v16 = BYTE9(v63);
      v17 = BYTE10(v63);
      v18 = v60;
      v19 = v61;
      v20 = BYTE9(v61);
      v21 = BYTE10(v61);
      v57 = BYTE8(v61);
      v58 = BYTE8(v63);
      if (*(double *)&v62 == *(double *)&v60
        && *((double *)&v62 + 1) == *((double *)&v60 + 1)
        && *(double *)&v63 == *(double *)&v61
        && BYTE8(v63) == BYTE8(v61)
        && BYTE9(v63) == BYTE9(v61)
        && BYTE10(v63) == BYTE10(v61))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _HKInitializeLogging();
          v22 = (void *)*MEMORY[0x1E0CB52A8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
          {
            v55 = v6;
            v23 = (void *)MEMORY[0x1E0CB3940];
            if (v58)
              v24 = CFSTR("ACTIVE");
            else
              v24 = CFSTR("inactive");
            if (v16)
              v25 = CFSTR("FOREGROUND");
            else
              v25 = CFSTR("background");
            if (v17)
              v26 = CFSTR("WORKOUT");
            else
              v26 = &stru_1E6D11BB8;
            v53 = v22;
            objc_msgSend(v23, "stringWithFormat:", CFSTR("(%0.2lfs, latency %0.2lfs, series %0.2lfs, %@, %@, %@)"), v14, v15, v24, v25, v26);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v5;
            v28 = (void *)objc_msgSend(CFSTR("{\n"), "mutableCopy");
            v51 = v27;
            objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = 0u;
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v50 = v29;
            objc_msgSend(v29, "objectEnumerator");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v65;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v65 != v33)
                    objc_enumerationMutation(v30);
                  objc_msgSend(v28, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
              }
              while (v32);
            }

            objc_msgSend(v28, "appendString:", CFSTR("}"));
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2114;
            *(_QWORD *)&buf[24] = v28;
            _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection state not changing %{public}@. Observers: %{public}@", buf, 0x20u);

            v6 = v55;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        v35 = (void *)*MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          v54 = (void *)MEMORY[0x1E0CB3940];
          v56 = v6;
          if (v58)
            v36 = CFSTR("ACTIVE");
          else
            v36 = CFSTR("inactive");
          if (v16)
            v37 = CFSTR("FOREGROUND");
          else
            v37 = CFSTR("background");
          if (v17)
            v38 = CFSTR("WORKOUT");
          else
            v38 = &stru_1E6D11BB8;
          v39 = v35;
          v49 = v36;
          v6 = v56;
          objc_msgSend(v54, "stringWithFormat:", CFSTR("(%0.2lfs, latency %0.2lfs, series %0.2lfs, %@, %@, %@)"), v14, v15, v49, v37, v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = CFSTR("inactive");
          if (v57)
            v41 = CFSTR("ACTIVE");
          v42 = CFSTR("background");
          if (v20)
            v42 = CFSTR("FOREGROUND");
          v43 = &stru_1E6D11BB8;
          if (v21)
            v43 = CFSTR("WORKOUT");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%0.2lfs, latency %0.2lfs, series %0.2lfs, %@, %@, %@)"), v18, v19, v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v40;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v44;
          _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection state %{public}@ -> %{public}@", buf, 0x20u);

        }
      }
      v7 = v59;
      if (v59)
      {
        v45 = v59;
        v46 = v5;
        if (*(double *)&v14 != *(double *)&v18)
          objc_msgSend(v45, "updateCollectionInterval:forType:", v46, *(double *)&v18);
        if (v58)
        {
          if (!v57)
            objc_msgSend(v45, "collectionStoppedForType:", v46);
        }
        else if (v57)
        {
          objc_msgSend(v45, "collectionStartedForType:collectionInterval:", v46, *(double *)&v18);
        }

      }
      if (v8)
      {
        *(_OWORD *)buf = v60;
        *(_OWORD *)&buf[16] = v61;
        -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:]((void *)a1, (uint64_t)buf);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setConfiguration:", v47);

      }
      if (v10)
      {
        *(_OWORD *)buf = v60;
        *(_OWORD *)&buf[16] = v61;
        -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:]((void *)a1, (uint64_t)buf);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, void *))v10)[2](v10, v5, v48);

      }
    }
    else
    {
      v6[2](v6);
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = objc_opt_class();
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        v13 = *(id *)&buf[4];
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: No data collector and aggregrator for type : %{public}@", buf, 0x16u);

      }
    }

  }
}

- (void)_queue_collectionStateForType:(void *)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  id v27;
  unsigned __int8 v28;
  void *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v40 = v5;
  if (a2)
  {
    v6 = v5;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 136));
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    v7 = *(NSObject **)(a2 + 136);
    v8 = v6;
    dispatch_assert_queue_V2(v7);
    objc_msgSend(v8, "code");
    HKDefaultAggregationIntervalForType();
    v10 = v9;
    objc_msgSend(v8, "code");
    HKDefaultCollectionLatencyForType();
    v12 = v11;
    objc_msgSend(v8, "code");

    HKDefaultMaximumSeriesDurationForType();
    v14 = v13;
    *(_QWORD *)(a1 + 24) = 0;
    *(double *)a1 = v10;
    *(double *)(a1 + 8) = v12;
    *(double *)(a1 + 16) = v13;
    objc_msgSend(v8, "code");
    HKDefaultMaximumSeriesDurationForType();
    v16 = v15;
    -[HDDataCollectionManager _queue_observerMapForType:](a2, v8);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v17)
    {
      v18 = v17;
      LODWORD(v19) = 0;
      LODWORD(v20) = 0;
      v21 = *(_QWORD *)v43;
      v22 = *MEMORY[0x1E0CB4B30];
      if (v16 <= 0.0)
        v16 = *MEMORY[0x1E0CB4B30];
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v43 != v21)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v23);
          if (v24)
          {
            v25 = *(double *)(v24 + 24);
            v26 = *(void **)(v24 + 16);
          }
          else
          {
            v26 = 0;
            v25 = 0.0;
          }
          v27 = v26;
          v28 = objc_msgSend(v27, "isInBackground");
          if (v24)
            v29 = *(void **)(v24 + 16);
          else
            v29 = 0;
          v30 = objc_msgSend(v29, "hasRunningWorkout");

          if (v10 > 0.0)
            v31 = v10;
          else
            v31 = v22;
          if (v25 > 0.0)
            v32 = v25;
          else
            v32 = v22;
          if (v31 >= v32)
            v10 = v32;
          else
            v10 = v31;
          if (v12 > 0.0)
            v33 = v12;
          else
            v33 = v22;
          if (v33 >= v32)
            v12 = v32;
          else
            v12 = v33;
          if (v14 > 0.0)
            v34 = v14;
          else
            v34 = v22;
          if (v34 >= v16)
            v14 = v16;
          else
            v14 = v34;
          v35 = 257;
          if ((((_DWORD)v20 == 0) & v28) != 0)
            v35 = 1;
          if ((_DWORD)v19)
            v36 = 1;
          else
            v36 = v30;
          if (v36)
            v37 = 0x10000;
          else
            v37 = 0;
          *(double *)a1 = v10;
          *(double *)(a1 + 8) = v12;
          *(double *)(a1 + 16) = v14;
          *(_QWORD *)(a1 + 24) = v37 | v35;
          ++v23;
          v20 = v35 >> 8;
          v19 = v37 >> 16;
        }
        while (v18 != v23);
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        v18 = v38;
      }
      while (v38);
    }

  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }

}

uint64_t __83__HDDataCollectionManager_addDataCollectionObserver_type_collectionInterval_state___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)stopDataCollectionForType:(id)a3 observer:(id)a4
{
  if (a3)
    -[HDDataCollectionManager removeDataCollectionObserver:type:](self, "removeDataCollectionObserver:type:", a4, a3);
}

- (void)removeDataCollectionObserver:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataCollectionManager.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataCollectionManager.m"), 346, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("RemoveObserver"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke;
  block[3] = &unk_1E6CECCA8;
  block[4] = self;
  v17 = v8;
  v18 = v7;
  v19 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(queue, block);

}

void __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  -[HDDataCollectionManager _queue_observerMapForType:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke_2;
  v9 = &unk_1E6CE8080;
  v10 = v2;
  v11 = *(id *)(a1 + 48);
  v5 = v2;
  -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v3, v4, &v6);
  objc_msgSend(*(id *)(a1 + 56), "invalidate", v6, v7, v8, v9);

}

uint64_t __61__HDDataCollectionManager_removeDataCollectionObserver_type___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)periodicUpdate
{
  NSObject *queue;
  id v4;
  _QWORD block[5];

  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("Periodic"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HDDataCollectionManager_periodicUpdate__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
  objc_msgSend(v4, "invalidate");

}

void __41__HDDataCollectionManager_periodicUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "updateHistoricalData", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)removeDataCollectionObserver:(id)a3
{
  id v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataCollectionManager.m"), 360, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer != nil"));

  }
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("RemoveObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(queue, block);

}

uint64_t __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = *(_QWORD *)(a1 + 32);
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke_2;
          v12[3] = &unk_1E6CE8080;
          v13 = v8;
          v14 = *(id *)(a1 + 40);
          -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v10, v7, v12);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

uint64_t __56__HDDataCollectionManager_removeDataCollectionObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)aggregatorForType:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  if (v5)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__189;
    v17 = __Block_byref_object_dispose__189;
    v18 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HDDataCollectionManager_aggregatorForType___block_invoke;
    block[3] = &unk_1E6CF6BF8;
    v12 = &v13;
    block[4] = self;
    v11 = v5;
    dispatch_sync(queue, block);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataCollectionManager.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectType != nil"));

    v7 = 0;
  }

  return v7;
}

- (void)_queue_addDataCollector:(uint64_t)a1
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    _HKInitializeLogging();
    v4 = (os_log_t *)MEMORY[0x1E0CB52A8];
    v5 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
    {
      LODWORD(v11) = 138412290;
      *(_QWORD *)((char *)&v11 + 4) = v3;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_INFO, "Adding data collector: %@", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend((id)objc_opt_class(), "observedType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      _HKInitializeLogging();
      v8 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v11) = 138543362;
        *(_QWORD *)((char *)&v11 + 4) = v6;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Data collector already exists for type %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = *(void **)(a1 + 72);
      objc_msgSend((id)objc_opt_class(), "observedType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v3, v10);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v11 = 0u;
    v12 = 0u;
    -[HDDataCollectionManager _queue_collectionStateForType:]((uint64_t)&v11, a1, v6);
    if (BYTE8(v12))
      objc_msgSend(v3, "collectionStartedForType:collectionInterval:", v6, *(double *)&v11);

  }
}

void __45__HDDataCollectionManager_aggregatorForType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[HDDataCollectionManager _queue_aggregatorForType:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_aggregatorForType:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_10;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_aggregatorForType_, a1, CFSTR("HDDataCollectionManager.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectType != nil"));

  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  if (!-[HDDataCollectionManager _typeIsCollectible:]((os_unfair_lock_s *)a1, v4))
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    HDCreateDataAggregatorForType((void *)a1, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = (void *)v6;
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v6, v4);
      objc_msgSend(v5, "resume");
      -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](a1, v4, &__block_literal_global_226);
      goto LABEL_11;
    }
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v11 = v4;
      _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "Aggregator couldn't be found for type %{private}@", buf, 0xCu);
    }
LABEL_10:
    v5 = 0;
  }
LABEL_11:

  return v5;
}

- (HDDataCollectionManager)init
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

- (HDDataCollectionManager)initWithProfile:(id)a3
{
  id v4;
  HDDataCollectionManager *v5;
  HDDataCollectionManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  OS_dispatch_queue *dataCollectionQueue;
  uint64_t v11;
  OS_dispatch_queue *sharedDelayedAggregationQueue;
  uint64_t v13;
  OS_dispatch_queue *assertionQueue;
  NSMutableDictionary *v15;
  NSMutableDictionary *collectorLock_dataCollectorsByType;
  NSMutableDictionary *v17;
  NSMutableDictionary *dataAggregatorsByType;
  HDDatabaseCoalescedWritePool *v19;
  _QWORD *v20;
  uint64_t v21;
  HDDatabaseCoalescedWritePool *pendingSavePool;
  HDCoalescedTaskPoolQuota *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  HDPeriodicActivity *v31;
  HDPeriodicActivity *periodicUpdateActivity;
  NSObject *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *lastFlushDateByType;
  HDSeriesQuantityEventObserver *v38;
  HDSeriesQuantityEventObserver *seriesQuantityEventObserver;
  NSObject *v40;
  _QWORD v42[4];
  HDDataCollectionManager *v43;
  _QWORD block[4];
  HDDataCollectionManager *v45;
  id v46;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)HDDataCollectionManager;
  v5 = -[HDDataCollectionManager init](&v47, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_collectorLock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    dataCollectionQueue = v6->_dataCollectionQueue;
    v6->_dataCollectionQueue = (OS_dispatch_queue *)v9;

    HKCreateSerialDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    sharedDelayedAggregationQueue = v6->_sharedDelayedAggregationQueue;
    v6->_sharedDelayedAggregationQueue = (OS_dispatch_queue *)v11;

    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    assertionQueue = v6->_assertionQueue;
    v6->_assertionQueue = (OS_dispatch_queue *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    collectorLock_dataCollectorsByType = v6->_collectorLock_dataCollectorsByType;
    v6->_collectorLock_dataCollectorsByType = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dataAggregatorsByType = v6->_dataAggregatorsByType;
    v6->_dataAggregatorsByType = v17;

    _HKInitializeLogging();
    v19 = [HDDatabaseCoalescedWritePool alloc];
    v20 = (_QWORD *)MEMORY[0x1E0CB52A8];
    v21 = -[HDDatabaseCoalescedWritePool initWithProfile:name:loggingCategory:](v19, "initWithProfile:name:loggingCategory:", v4, CFSTR("data-collection-coalescing"), *MEMORY[0x1E0CB52A8]);
    pendingSavePool = v6->_pendingSavePool;
    v6->_pendingSavePool = (HDDatabaseCoalescedWritePool *)v21;

    v23 = -[HDCoalescedTaskPoolQuota initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:]([HDCoalescedTaskPoolQuota alloc], "initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:", 5, 5, 1.0, 0.1, CFAbsoluteTimeGetCurrent());
    -[HDDatabaseCoalescedWritePool setQuota:](v6->_pendingSavePool, "setQuota:", v23);

    v6->unitTest_hasSetPendingSaveCoalescingInterval = 0;
    v6->_privacyPreferencesNotificationToken = -1;
    objc_msgSend(v4, "daemon");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "behavior");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "shouldRegisterPeriodicActivities");

    v27 = MEMORY[0x1E0C809B0];
    if (v26)
    {
      objc_msgSend(v4, "daemon");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "behavior");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isAppleWatch");

      if (v30)
      {
        v31 = -[HDPeriodicActivity initWithProfile:name:interval:delegate:loggingCategory:]([HDPeriodicActivity alloc], "initWithProfile:name:interval:delegate:loggingCategory:", v4, CFSTR("com.apple.healthd.periodic-data-collection"), v6, *v20, 900.0);
        periodicUpdateActivity = v6->_periodicUpdateActivity;
        v6->_periodicUpdateActivity = v31;
      }
      else
      {
        dispatch_get_global_queue(21, 0);
        v33 = objc_claimAutoreleasedReturnValue();
        block[0] = v27;
        block[1] = 3221225472;
        block[2] = __43__HDDataCollectionManager_initWithProfile___block_invoke;
        block[3] = &unk_1E6CE8080;
        v45 = v6;
        v46 = v4;
        dispatch_async(v33, block);

        periodicUpdateActivity = (HDPeriodicActivity *)v45;
      }

    }
    objc_msgSend(v4, "sessionAssertionManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:forAssertionIdentifier:queue:", v6, CFSTR("HDDataCollectionAssertionIdentifier"), v6->_assertionQueue);

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v6);

    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, 0);
    v36 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lastFlushDateByType = v6->_lastFlushDateByType;
    v6->_lastFlushDateByType = v36;

    v38 = -[HDSeriesQuantityEventObserver initWithProfile:]([HDSeriesQuantityEventObserver alloc], "initWithProfile:", v4);
    seriesQuantityEventObserver = v6->_seriesQuantityEventObserver;
    v6->_seriesQuantityEventObserver = v38;

    v40 = v6->_queue;
    v42[0] = v27;
    v42[1] = 3221225472;
    v42[2] = __43__HDDataCollectionManager_initWithProfile___block_invoke_2;
    v42[3] = &unk_1E6CE80E8;
    v43 = v6;
    dispatch_async(v40, v42);

  }
  return v6;
}

void __43__HDDataCollectionManager_initWithProfile___block_invoke(uint64_t a1)
{
  HDPeriodicActivity *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(MEMORY[0x1E0CA5698], "isStepCountingAvailable"))
  {
    v2 = [HDPeriodicActivity alloc];
    v3 = -[HDPeriodicActivity initWithProfile:name:interval:delegate:loggingCategory:](v2, "initWithProfile:name:interval:delegate:loggingCategory:", *(_QWORD *)(a1 + 40), CFSTR("com.apple.healthd.periodic-data-collection"), *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB52A8], 3600.0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

  }
}

void __43__HDDataCollectionManager_initWithProfile___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HDDataCollectionManager _queue_aggregatorForType:](*(_QWORD *)(a1 + 32), v2);

}

- (void)dealloc
{
  int privacyPreferencesNotificationToken;
  id WeakRetained;
  void *v5;
  void *v6;
  objc_super v7;

  privacyPreferencesNotificationToken = self->_privacyPreferencesNotificationToken;
  if (privacyPreferencesNotificationToken != -1)
    notify_cancel(privacyPreferencesNotificationToken);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sessionAssertionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", self);

  v7.receiver = self;
  v7.super_class = (Class)HDDataCollectionManager;
  -[HDDataCollectionManager dealloc](&v7, sel_dealloc);
}

- (os_unfair_lock_s)_typeIsCollectible:(os_unfair_lock_s *)result
{
  os_unfair_lock_s *v2;
  id v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = a2;
    -[HDDataCollectionManager collectibleTypes](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    return (os_unfair_lock_s *)v5;
  }
  return result;
}

- (void)performSaveWithMaximumLatency:(double)a3 block:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  double v10;
  double unitTest_pendingSaveCoalescingInterval;
  NSObject *v12;
  int v13;
  HDDataCollectionManager *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = fmin(a3, 60.0);
  if (v10 >= 0.1)
    unitTest_pendingSaveCoalescingInterval = v10;
  else
    unitTest_pendingSaveCoalescingInterval = 0.1;
  if (self->unitTest_hasSetPendingSaveCoalescingInterval)
    unitTest_pendingSaveCoalescingInterval = self->unitTest_pendingSaveCoalescingInterval;
  _HKInitializeLogging();
  v12 = *MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
  {
    v13 = 138543618;
    v14 = self;
    v15 = 2048;
    v16 = unitTest_pendingSaveCoalescingInterval;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%{public}@: perform delayed write with maximum latency %0.2f", (uint8_t *)&v13, 0x16u);
  }
  -[HDDatabaseCoalescedWritePool performWriteWithMaximumLatency:block:completion:](self->_pendingSavePool, "performWriteWithMaximumLatency:block:completion:", v8, v9, unitTest_pendingSaveCoalescingInterval);

}

uint64_t __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          v11 = *(_QWORD *)(a1 + 32);
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke_2;
          v13[3] = &unk_1E6CE8080;
          v14 = v9;
          v15 = *(id *)(a1 + 48);
          -[HDDataCollectionManager _queue_adjustDataCollectionForType:block:](v11, v7, v13);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 56), "invalidate");
}

void __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke_2(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 16);
}

- (void)requestAggregationThroughDate:(id)a3 types:(id)a4 mode:(int64_t)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject **v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  CFAbsoluteTime Current;
  NSObject *queue;
  id v27;
  os_signpost_id_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id obj;
  uint64_t v45;
  id v48;
  _QWORD v49[2];
  void (*v50)(uint64_t, char, void *);
  void *v51;
  HDDataCollectionManager *v52;
  NSObject *v53;
  _QWORD *v54;
  _QWORD *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[3];
  char v63;
  _QWORD aBlock[4];
  id v65;
  os_signpost_id_t v66;
  uint64_t block;
  uint64_t v68;
  void *v69;
  void *v70;
  HDDataCollectionManager *v71;
  id v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  unint64_t v76;
  CFAbsoluteTime v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  int64_t v99;
  _BYTE v100[24];
  void *v101;
  id v102;
  id v103;
  id v104;
  os_signpost_id_t v105;
  CFAbsoluteTime v106;
  int64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v10 = a4;
  v11 = a7;
  v42 = v10;
  if (objc_msgSend(v10, "count"))
  {
    v48 = v43;
    v41 = v10;
    v39 = v11;
    v12 = v11;
    if (self)
    {
      v13 = (NSObject **)MEMORY[0x1E0CB52A8];
      v14 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      v15 = *v13;
      if (os_signpost_enabled(v15))
      {
        v16 = v15;
        v17 = v16;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          *(_DWORD *)buf = 138543874;
          v95 = v48;
          v96 = 2048;
          v97 = objc_msgSend(v41, "count");
          v98 = 2048;
          v99 = a5;
          _os_signpost_emit_with_name_impl(&dword_1B7802000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v14, "aggregation-request", "date=%{public}@, types=%ld, mode=%ld", buf, 0x20u);
        }

      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke;
      aBlock[3] = &unk_1E6D0E1A0;
      v65 = v12;
      v66 = v14;
      v40 = _Block_copy(aBlock);
      dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x2020000000;
      v63 = 1;
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x3032000000;
      v60[3] = __Block_byref_object_copy__189;
      v60[4] = __Block_byref_object_dispose__189;
      v61 = 0;
      v18 = dispatch_group_create();
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = v41;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
      if (v19)
      {
        v45 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v57 != v45)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            dispatch_group_enter(v18);
            v49[0] = MEMORY[0x1E0C809B0];
            v49[1] = 3221225472;
            v50 = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_243;
            v51 = &unk_1E6D0E1F0;
            v52 = self;
            v54 = v62;
            v55 = v60;
            v53 = v18;
            v22 = v48;
            v23 = v21;
            v24 = v49;
            dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
            Current = CFAbsoluteTimeGetCurrent();
            v88 = 0;
            v89 = &v88;
            v90 = 0x3032000000;
            v91 = __Block_byref_object_copy__189;
            v92 = __Block_byref_object_dispose__189;
            v93 = 0;
            v82 = 0;
            v83 = &v82;
            v84 = 0x3032000000;
            v85 = __Block_byref_object_copy__189;
            v86 = __Block_byref_object_dispose__189;
            v87 = 0;
            v78 = 0;
            v79 = &v78;
            v80 = 0x2020000000;
            v81 = 0;
            queue = self->_queue;
            block = MEMORY[0x1E0C809B0];
            v68 = 3221225472;
            v69 = __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke;
            v70 = &unk_1E6D0E240;
            v71 = self;
            v73 = &v88;
            v27 = v23;
            v72 = v27;
            v74 = &v82;
            v75 = &v78;
            v77 = Current;
            v76 = a6;
            dispatch_sync(queue, &block);
            if (*((_BYTE *)v79 + 24))
            {
              v28 = _HKLogSignpostIDGenerate();
              _HKInitializeLogging();
              v29 = (void *)*MEMORY[0x1E0CB52A8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_INFO))
              {
                v30 = v29;
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  HDDataAggregationRequestModeToString(a5);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v100 = 138543874;
                  *(_QWORD *)&v100[4] = v31;
                  *(_WORD *)&v100[12] = 2114;
                  *(_QWORD *)&v100[14] = v27;
                  *(_WORD *)&v100[22] = 2114;
                  v101 = v48;
                  _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_INFO, "Requesting %{public}@ aggregation of type %{public}@ through %{public}@", v100, 0x20u);

                }
              }
              _HKInitializeLogging();
              v32 = (void *)*MEMORY[0x1E0CB52A8];
              if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52A8]))
              {
                v33 = v32;
                v34 = v33;
                if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
                {
                  *(_DWORD *)v100 = 138543874;
                  *(_QWORD *)&v100[4] = v48;
                  *(_WORD *)&v100[12] = 2114;
                  *(_QWORD *)&v100[14] = v27;
                  *(_WORD *)&v100[22] = 2048;
                  v101 = (void *)a5;
                  _os_signpost_emit_with_name_impl(&dword_1B7802000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v28, "aggregation-request-single", "date=%{public}@, type=%{public}@, mode=%ld", v100, 0x20u);
                }

              }
              *(_QWORD *)v100 = MEMORY[0x1E0C809B0];
              *(_QWORD *)&v100[8] = 3221225472;
              *(_QWORD *)&v100[16] = __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke_244;
              v101 = &unk_1E6D0E268;
              v105 = v28;
              v106 = Current;
              v107 = a5;
              v102 = v27;
              v35 = v22;
              v103 = v35;
              v104 = v24;
              v24 = _Block_copy(v100);
              v36 = (void *)v89[5];
              if (v36)
              {
                objc_msgSend(v36, "updateHistoricalDataForcedUpdate:completion:", 1, v24);
              }
              else
              {
                v37 = (void *)v83[5];
                if (v37)
                  objc_msgSend(v37, "requestAggregationThroughDate:mode:options:completion:", v35, a5, a6, v24);
                else
                  ((void (*)(_QWORD *, uint64_t, _QWORD))v24[2])(v24, 1, 0);
              }

            }
            else
            {
              v50((uint64_t)v24, 1, 0);
            }

            _Block_object_dispose(&v78, 8);
            _Block_object_dispose(&v82, 8);

            _Block_object_dispose(&v88, 8);
          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
        }
        while (v19);
      }

      v38 = self->_queue;
      block = MEMORY[0x1E0C809B0];
      v68 = 3221225472;
      v69 = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_3;
      v70 = &unk_1E6D0E218;
      v73 = v62;
      v71 = self;
      v12 = v40;
      v72 = v12;
      v74 = v60;
      dispatch_group_notify(v18, v38, &block);

      _Block_object_dispose(v60, 8);
      _Block_object_dispose(v62, 8);

    }
    v11 = v39;
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }

}

void __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52A8]))
  {
    v7 = v6;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 40);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v10 = "no";
      if (a2)
        v10 = "YES";
      v11 = 136446210;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v8, OS_SIGNPOST_INTERVAL_END, v9, "aggregation-request", "success=%{public}s", (uint8_t *)&v11, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_243(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_2;
  block[3] = &unk_1E6D0E1C8;
  v14 = a2;
  v9 = *(_OWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v7 = (id)v9;
  v12 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(_BYTE *)(v2 + 24);
  if (v3)
    v3 = *(_BYTE *)(a1 + 64) != 0;
  *(_BYTE *)(v2 + 24) = v3;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (!v7)
    v6 = *(void **)(a1 + 32);
  objc_storeStrong(v5, v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __88__HDDataCollectionManager__requestAggregationThroughDate_types_mode_options_completion___block_invoke_3(_QWORD *a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 32), "flushPendingWriteQueueWithCompletion:", a1[5]);
  else
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], 0, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  if ((v8 & 1) != 0 || v9 - v12 > 5.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 80));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 40));

  }
}

void __87__HDDataCollectionManager__requestAggregationThroughDate_type_mode_options_completion___block_invoke_244(uint64_t a1, int a2, void *a3)
{
  id v5;
  void **v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  const char *v11;
  double v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  double v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void **)MEMORY[0x1E0CB52A8];
  v7 = (void *)*MEMORY[0x1E0CB52A8];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB52A8]))
  {
    v8 = v7;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      v11 = "no";
      if (a2)
        v11 = "YES";
      v23 = 136446210;
      v24 = v11;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v9, OS_SIGNPOST_INTERVAL_END, v10, "aggregation-request-single", "success=%{public}s", (uint8_t *)&v23, 0xCu);
    }

  }
  v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
  _HKInitializeLogging();
  v13 = *v6;
  v14 = *v6;
  if (!a2)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v20 = *(_QWORD *)(a1 + 72);
    v16 = v13;
    HDDataAggregationRequestModeToString(v20);
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v23 = 138544386;
    v24 = v17;
    v25 = 2114;
    v26 = v21;
    v27 = 2114;
    v28 = v22;
    v29 = 2048;
    v30 = v12;
    v31 = 2114;
    v32 = v5;
    _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Failed to complete %{public}@ aggregation of type %{public}@ through %{public}@ in %0.2lfs: %{public}@", (uint8_t *)&v23, 0x34u);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(a1 + 72);
    v16 = v13;
    HDDataAggregationRequestModeToString(v15);
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v23 = 138544130;
    v24 = v17;
    v25 = 2114;
    v26 = v18;
    v27 = 2114;
    v28 = v19;
    v29 = 2048;
    v30 = v12;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "Finished %{public}@ aggregation of type %{public}@ through %{public}@ in %0.2lfs", (uint8_t *)&v23, 0x2Au);
LABEL_11:

  }
LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 sampleTypes:(id)a4 observerState:(id)a5 collectionInterval:(double)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  -[HDDataCollectionManager takeCollectionAssertionWithOwnerIdentifier:collectionIntervalsByType:observerState:](self, "takeCollectionAssertionWithOwnerIdentifier:collectionIntervalsByType:observerState:", v9, v12, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 collectionIntervalsByType:(id)a4 observerState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  HDDataCollectionAssertion *v16;
  id v17;
  id v18;
  HDDataCollectionManager *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id WeakRetained;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v42;
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[22];
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDataCollectionManager collectibleTypes]((os_unfair_lock_s *)self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "intersectsSet:", v14);

  if (v15)
  {
    v16 = [HDDataCollectionAssertion alloc];
    v17 = v13;
    v18 = v10;
    v19 = self;
    v45 = v8;
    if (v16)
    {
      *(_QWORD *)v50 = v16;
      *(_QWORD *)&v50[8] = HDDataCollectionAssertion;
      v20 = objc_msgSendSuper2((objc_super *)v50, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDDataCollectionAssertionIdentifier"), v8);
      if (v20)
      {
        v21 = objc_msgSend(v17, "copy");
        v22 = (void *)*((_QWORD *)v20 + 12);
        *((_QWORD *)v20 + 12) = v21;

        v23 = objc_msgSend(v18, "copy");
        v24 = (void *)*((_QWORD *)v20 + 11);
        *((_QWORD *)v20 + 11) = v23;

        objc_storeWeak((id *)v20 + 14, v19);
        *((_DWORD *)v20 + 20) = 0;
      }
    }
    else
    {
      v20 = 0;
    }

    v44 = v17;
    WeakRetained = objc_loadWeakRetained((id *)&v19->_profile);
    objc_msgSend(WeakRetained, "sessionAssertionManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "takeAssertion:", v20);

    if ((v27 & 1) != 0)
    {
      v42 = v10;
      v43 = v9;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v28 = v9;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v47 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v28, "objectForKeyedSubscript:", v33, v42, v43);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "doubleValue");
            -[HDDataCollectionManager addDataCollectionObserver:type:collectionInterval:state:](v19, "addDataCollectionObserver:type:collectionInterval:state:", v20, v33, v18);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
        }
        while (v30);
      }

      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x1E0CB52A8];
      v8 = v45;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        v36 = v35;
        objc_msgSend(v44, "allObjects");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "componentsJoinedByString:", CFSTR(", "));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v50 = 138544130;
        *(_QWORD *)&v50[4] = v19;
        *(_WORD *)&v50[12] = 2114;
        *(_QWORD *)&v50[14] = v45;
        v51 = 2114;
        v52 = v18;
        v53 = 2114;
        v54 = v38;
        _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Taking collection assertion for %{public}@ with state %{public}@ for (%{public}@)", v50, 0x2Au);

      }
      v39 = v20;
      v10 = v42;
      v9 = v43;
    }
    else
    {
      _HKInitializeLogging();
      v40 = *MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v50 = 138543618;
        *(_QWORD *)&v50[4] = v8;
        *(_WORD *)&v50[12] = 2114;
        *(_QWORD *)&v50[14] = v44;
        _os_log_error_impl(&dword_1B7802000, v40, OS_LOG_TYPE_ERROR, "Failed to take collection assertion for %{public}@ for %{public}@", v50, 0x16u);
      }
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

- (id)collectibleTypes
{
  id *v1;
  os_unfair_lock_s *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[4];

  v1 = (id *)a1;
  v18[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1 + 14;
    os_unfair_lock_lock(a1 + 14);
    v3 = v1[13];
    if (!v3)
    {
      WeakRetained = objc_loadWeakRetained(v1 + 15);
      objc_msgSend(WeakRetained, "daemon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "behavior");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isRunningStoreDemoMode");
      HKAllCollectibleTypesWithStoreDemoModeEnabled();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v1[13];
      v1[13] = (id)v7;

      v9 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C60]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5D80], v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v11;
      objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C40]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v9, "initWithArray:", v13);

      objc_msgSend(v1[13], "setByAddingObjectsFromSet:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v1[13];
      v1[13] = (id)v15;

      v3 = v1[13];
    }
    v1 = (id *)v3;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  _QWORD *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  HDDataCollectionManager *v17;
  uint8_t buf[4];
  HDDataCollectionManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_assertionQueue);
  _HKInitializeLogging();
  v6 = (id)*MEMORY[0x1E0CB52A8];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "ownerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v8 = (void *)v5[12];
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = self;
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v11;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating collection assertion for %{public}@ for (%{public}@)", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v13 = v5[12];
  else
    v13 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__HDDataCollectionManager_assertionManager_assertionInvalidated___block_invoke;
  v15[3] = &unk_1E6CEB718;
  v16 = v5;
  v17 = self;
  v14 = v5;
  -[HDDataCollectionManager requestAggregationThroughDate:types:mode:options:completion:](self, "requestAggregationThroughDate:types:mode:options:completion:", v12, v13, 0, 0, v15);

}

void __65__HDDataCollectionManager_assertionManager_assertionInvalidated___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52A8];
  v7 = *MEMORY[0x1E0CB52A8];
  if (a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v8 = *(_QWORD *)(v8 + 96);
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    v9 = v6;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Completed aggregation of types %{public}@ after assertion invalidation.", buf, 0xCu);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v16 = *(_QWORD *)(v16 + 96);
    *(_DWORD *)buf = 138543618;
    v23 = v16;
    v24 = 2114;
    v25 = v5;
    v9 = v6;
    _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Failed to aggregate to current time for types %{public}@ after assertion invalidation: %{public}@", buf, 0x16u);
LABEL_6:

  }
LABEL_8:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *(_QWORD **)(a1 + 32);
  if (v10)
    v10 = (_QWORD *)v10[12];
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(a1 + 40), "removeDataCollectionObserver:type:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (id)_dataAggregatorConfigurationForCollectorState:(void *)a1
{
  if (a1)
  {
    +[HDDataAggregatorConfiguration configurationWithLatency:interval:seriesDuration:activeWorkout:foregroundObserver:](HDDataAggregatorConfiguration, "configurationWithLatency:interval:seriesDuration:activeWorkout:foregroundObserver:", *(unsigned __int8 *)(a2 + 26), *(unsigned __int8 *)(a2 + 25), *(double *)(a2 + 8), *(double *)a2, *(double *)(a2 + 16));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_setAggregatorConfigurationChangeHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HDDataCollectionManager__setAggregatorConfigurationChangeHandler___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __68__HDDataCollectionManager__setAggregatorConfigurationChangeHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v14 = 0u;
        v15 = 0u;
        -[HDDataCollectionManager _queue_collectionStateForType:]((uint64_t)&v14, *(_QWORD *)(a1 + 32), v10);
        v11 = *(void **)(a1 + 32);
        v13[0] = v14;
        v13[1] = v15;
        -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:](v11, (uint64_t)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (id)_dataCollectorBlacklist
{
  if (qword_1ED552558 != -1)
    dispatch_once(&qword_1ED552558, &__block_literal_global_273_1);
  return (id)_MergedGlobals_6_0;
}

void __68__HDDataCollectionManager__queue_setupUnprotectedDataDependantState__block_invoke(uint64_t a1)
{
  int v1;
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 17));
    v1 = objc_msgSend(WeakRetained, "hasAccessToFitnessData");
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v3 = CFSTR("NOT ");
      if (v1)
        v3 = &stru_1E6D11BB8;
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "Access to fitness data %@granted.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("HDDataCollectionAccessToFitnessDataDidChangeNotification"), 0);

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 14);
    objc_msgSend(*((id *)WeakRetained + 9), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 14);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, buf, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      v10 = v1 ^ 1u;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "setDisabled:", v10);
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, buf, 16);
      }
      while (v8);
    }

  }
}

void __50__HDDataCollectionManager__dataCollectorBlacklist__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("HDDataCollectionDisableExerciseTime"));

  if (v1)
  {
    _HKInitializeLogging();
    v2 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)MEMORY[0x1E0C99EA0];
      v4 = v2;
      objc_msgSend(v3, "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueForKey:", CFSTR("HDDataCollectionDisableExerciseTime"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = CFSTR("HDDataCollectionDisableExerciseTime");
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Exercise time data collection disabled because defaults key '%{public}@' is %{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", CFSTR("_NLAppleExerciseTimeDataCollector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringArrayForKey:", *MEMORY[0x1E0CB4BD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "hk_filter:", &__block_literal_global_279);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  v12 = (void *)_MergedGlobals_6_0;
  _MergedGlobals_6_0 = (uint64_t)v7;

}

uint64_t __50__HDDataCollectionManager__dataCollectorBlacklist__block_invoke_277(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HDDataCollectionManager__pluginDataCollectors__block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "Dropping blacklisted data collector: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }

  return v4 ^ 1u;
}

- (BOOL)sensorDataArrayReceived:(id)a3 deviceEntity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  uint8_t v24[16];

  v8 = a4;
  if (v8)
  {
    v9 = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "dataProvenanceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultLocalDataProvenanceWithDeviceEntity:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = a3;
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "sensorDataArrayReceived without device.", v24, 2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "dataProvenanceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultLocalDataProvenance");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v12;

  v16 = a3;
  v17 = v15;
  if (self)
  {
    os_unfair_lock_assert_not_owner(&self->_collectorLock);
    os_unfair_lock_lock(&self->_collectorLock);
    -[HDFakeDataCollector configuration](self->_fakeCollector, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_collectorLock);
    v19 = v16;
    if (v18
      && (objc_msgSend(v16, "hk_filter:", &__block_literal_global_332_0),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          !objc_msgSend(v19, "count")))
    {
      v22 = 1;
    }
    else
    {
      v20 = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(v20, "dataManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "insertDataObjects:withProvenance:creationDate:error:", v19, v17, a5, CFAbsoluteTimeGetCurrent());

    }
  }
  else
  {
    v22 = 0;
    v19 = v16;
  }

  return v22;
}

BOOL __69__HDDataCollectionManager__dataReceived_provenance_isDemoData_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HKFakedData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_collectorLock_setupFakeCollector
{
  id *v2;
  HDFakeDataCollector *v3;
  void *v4;
  HDFakeDataCollector *v5;
  NSObject *v6;
  HDFakeDataCollector *v7;
  _QWORD block[4];
  HDFakeDataCollector *v9;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 56));
    v2 = (id *)(a1 + 80);
    if (!*(_QWORD *)(a1 + 80))
    {
      v3 = [HDFakeDataCollector alloc];
      objc_msgSend((id)a1, "profile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[HDFakeDataCollector initWithProfile:](v3, "initWithProfile:", v4);

      objc_storeStrong(v2, v5);
      dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__HDDataCollectionManager__collectorLock_setupFakeCollector__block_invoke;
      block[3] = &unk_1E6CE80E8;
      v9 = v5;
      v7 = v5;
      dispatch_async(v6, block);

    }
  }
}

uint64_t __60__HDDataCollectionManager__collectorLock_setupFakeCollector__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerWithAggregators");
}

- (void)startFakingDataWithActivityType:(int64_t)a3 speed:(id)a4
{
  os_unfair_lock_s *p_collectorLock;
  id v7;
  HDFakeDataCollectorConfiguration *v8;

  p_collectorLock = &self->_collectorLock;
  v7 = a4;
  os_unfair_lock_lock(p_collectorLock);
  -[HDDataCollectionManager _collectorLock_setupFakeCollector]((uint64_t)self);
  v8 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  -[HDFakeDataCollectorConfiguration setActivityType:](v8, "setActivityType:", a3);
  -[HDFakeDataCollectorConfiguration setSpeed:](v8, "setSpeed:", v7);

  -[HDFakeDataCollector setConfiguration:](self->_fakeCollector, "setConfiguration:", v8);
  os_unfair_lock_unlock(p_collectorLock);

}

- (void)startFakingWithHKWorkoutActivityType:(unint64_t)a3
{
  os_unfair_lock_s *p_collectorLock;
  void *v6;

  p_collectorLock = &self->_collectorLock;
  os_unfair_lock_lock(&self->_collectorLock);
  -[HDDataCollectionManager _collectorLock_setupFakeCollector]((uint64_t)self);
  +[HDFakeDataCollectorConfiguration configurationForWorkoutActivityType:](HDFakeDataCollectorConfiguration, "configurationForWorkoutActivityType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFakeDataCollector setConfiguration:](self->_fakeCollector, "setConfiguration:", v6);

  os_unfair_lock_unlock(p_collectorLock);
}

- (void)stopFakingData
{
  os_unfair_lock_s *p_collectorLock;
  HDFakeDataCollector *fakeCollector;

  p_collectorLock = &self->_collectorLock;
  os_unfair_lock_lock(&self->_collectorLock);
  -[HDFakeDataCollector setConfiguration:](self->_fakeCollector, "setConfiguration:", 0);
  fakeCollector = self->_fakeCollector;
  self->_fakeCollector = 0;

  -[HDFakeDataCollector unregisterFromAggregators](self->_fakeCollector, "unregisterFromAggregators");
  os_unfair_lock_unlock(p_collectorLock);
}

- (void)generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  id v8;
  HDFakeDataCollector *v9;
  void *v10;
  HDFakeDataCollector *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  HDFakeDataCollectorConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HDFakeDataCollector *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  HDFakeDataCollector *v30;
  id v31;
  uint8_t buf[4];
  int64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = [HDFakeDataCollector alloc];
  -[HDDataCollectionManager profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDFakeDataCollector initWithProfile:](v9, "initWithProfile:", v10);

  -[HDFakeDataCollector registerWithAggregators](v11, "registerWithAggregators");
  +[HDDataCollectionObserverState dataCollectionObserverStateInBackground:hasRunningWorkout:](HDDataCollectionObserverState, "dataCollectionObserverStateInBackground:hasRunningWorkout:", 0, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDFakeDataCollector collectedTypes](HDFakeDataCollector, "collectedTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataCollectionManager takeCollectionAssertionWithOwnerIdentifier:sampleTypes:observerState:collectionInterval:](self, "takeCollectionAssertionWithOwnerIdentifier:sampleTypes:observerState:collectionInterval:", CFSTR("Faking"), v13, v12, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v15 = *MEMORY[0x1E0CB52C0];
  v16 = a4 * 60.0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v33 = a3;
    v34 = 2048;
    v35 = v16;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_INFO, "generating fake data for activity type %ld with duration: %lf", buf, 0x16u);
  }
  v17 = objc_alloc_init(HDFakeDataCollectorConfiguration);
  -[HDFakeDataCollectorConfiguration setActivityType:](v17, "setActivityType:", a3);
  v18 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "quantityWithUnit:doubleValue:", v19, 5.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFakeDataCollectorConfiguration setSpeed:](v17, "setSpeed:", v20);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateByAddingTimeInterval:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDFakeDataCollector generateForConfiguration:from:to:](v11, "generateForConfiguration:from:to:", v17, v23, v22);

  +[HDFakeDataCollector collectedTypes](HDFakeDataCollector, "collectedTypes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __78__HDDataCollectionManager_generateFakeDataForActivityType_minutes_completion___block_invoke;
  v28[3] = &unk_1E6CF1D98;
  v30 = v11;
  v31 = v8;
  v29 = v14;
  v25 = v11;
  v26 = v8;
  v27 = v14;
  -[HDDataCollectionManager requestAggregationThroughDate:types:mode:options:completion:](self, "requestAggregationThroughDate:types:mode:options:completion:", v22, v24, 0, 2, v28);

}

void __78__HDDataCollectionManager_generateFakeDataForActivityType_minutes_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v5 = *(_QWORD *)(a1 + 48);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "datumCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v5 + 16))(*(_QWORD *)(a1 + 48), 0, v7);
  }

}

- (id)takeCollectionAssertionWithOwnerIdentifier:(id)a3 sampleTypes:(id)a4 observer:(id)a5 observerState:(id)a6 collectionInterval:(double)a7
{
  return -[HDDataCollectionManager takeCollectionAssertionWithOwnerIdentifier:sampleTypes:observerState:collectionInterval:](self, "takeCollectionAssertionWithOwnerIdentifier:sampleTypes:observerState:collectionInterval:", a3, a4, a6, a7);
}

- (void)addDataCollector:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HDDataCollectionManager_addDataCollector___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __44__HDDataCollectionManager_addDataCollector___block_invoke(uint64_t a1)
{
  -[HDDataCollectionManager _queue_addDataCollector:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)unitTest_setAggregator:(id)a3 forType:(id)a4
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
  -[HDDataCollectionManager unitTest_addCollectibleType:](self, "unitTest_addCollectibleType:", v7);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HDDataCollectionManager_unitTest_setAggregator_forType___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

uint64_t __58__HDDataCollectionManager_unitTest_setAggregator_forType___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (id)unitTest_dataAggregatorConfigurationForType:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__189;
  v16 = __Block_byref_object_dispose__189;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HDDataCollectionManager_unitTest_dataAggregatorConfigurationForType___block_invoke;
  block[3] = &unk_1E6D0E338;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __71__HDDataCollectionManager_unitTest_dataAggregatorConfigurationForType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  -[HDDataCollectionManager _queue_collectionStateForType:]((uint64_t)&v7, *(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v6[0] = v7;
  v6[1] = v8;
  -[HDDataCollectionManager _dataAggregatorConfigurationForCollectorState:](v2, (uint64_t)v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)unitTest_setPendingSaveCoalescingInterval:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__HDDataCollectionManager_unitTest_setPendingSaveCoalescingInterval___block_invoke;
  v4[3] = &unk_1E6CE8058;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __69__HDDataCollectionManager_unitTest_setPendingSaveCoalescingInterval___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setQuota:", 0);
}

- (void)unitTest_addCollectibleType:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *collectibleTypes;

  v4 = a3;
  -[HDDataCollectionManager collectibleTypes]((os_unfair_lock_s *)self);

  os_unfair_lock_lock(&self->_collectorLock);
  -[NSSet setByAddingObject:](self->_collectibleTypes, "setByAddingObject:", v4);
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();

  collectibleTypes = self->_collectibleTypes;
  self->_collectibleTypes = v5;

  os_unfair_lock_unlock(&self->_collectorLock);
}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char **v9;
  double v10;
  xpc_object_t xdict;

  xdict = a4;
  -[HDDataCollectionManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAppleWatch");

  if (v8)
  {
    xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808F0], 1);
    v9 = (const char **)MEMORY[0x1E0C80888];
    v10 = 120.0;
  }
  else
  {
    v9 = (const char **)MEMORY[0x1E0C80880];
    v10 = 1200.0;
  }
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], *v9);
  xpc_dictionary_set_double(xdict, (const char *)*MEMORY[0x1E0C80790], v10);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80870], 1);

}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5;

  v5 = a4;
  -[HDDataCollectionManager periodicUpdate](self, "periodicUpdate");
  (*((void (**)(id, _QWORD, _QWORD, double))v5 + 2))(v5, 0, 0, 0.0);

}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained;
  void *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HDDataCollectionManager_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E6CE80E8;
  v7[4] = self;
  objc_msgSend(v5, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v7);

}

void __49__HDDataCollectionManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  char v14;
  HDPedometerDataCollector *v15;
  id v16;
  HDPedometerDataCollector *v17;
  objc_class *v18;
  void *v19;
  char v20;
  HDOdometerDataCollector *v21;
  id v22;
  void *v23;
  HDOdometerDataCollector *v24;
  HDOdometerDataCollector *v25;
  id v26;
  void *v27;
  HDOdometerDataCollector *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  char v32;
  HDSkiingWorkoutDistanceCollector *v33;
  id v34;
  HDSkiingWorkoutDistanceCollector *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t m;
  id v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD handler[4];
  id v82;
  id location;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  void *v91;
  uint8_t v92[16];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 136));
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 56));
    if (*(_QWORD *)(v1 + 64)
      && (objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"),
          v76 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_createBuiltinCollectors, v1, CFSTR("HDDataCollectionManager.m"), 856, CFSTR("%s must only be called once."), "-[HDDataCollectionManager _queue_createBuiltinCollectors]"), v76, *(_QWORD *)(v1 + 64)))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(v1 + 120));
      objc_msgSend(WeakRetained, "daemon");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "behavior");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "collectsData");

      if ((v5 & 1) != 0)
      {
        -[HDDataCollectionManager _dataCollectorBlacklist]();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          _HKInitializeLogging();
          v7 = (void *)*MEMORY[0x1E0CB52A8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
          {
            v8 = v7;
            objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v91 = v9;
            _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Filtering built-in data collector creation through blacklist: %{public}@", buf, 0xCu);

          }
        }
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = *(void **)(v1 + 64);
        *(_QWORD *)(v1 + 64) = v10;

        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v6, "containsObject:", v13);

        if ((v14 & 1) == 0)
        {
          v15 = [HDPedometerDataCollector alloc];
          v16 = objc_loadWeakRetained((id *)(v1 + 120));
          v17 = -[HDPedometerDataCollector initWithProfile:](v15, "initWithProfile:", v16);

          if (v17)
            objc_msgSend(*(id *)(v1 + 64), "addObject:", v17);

        }
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v6, "containsObject:", v19);

        if ((v20 & 1) == 0)
        {
          v21 = [HDOdometerDataCollector alloc];
          v22 = objc_loadWeakRetained((id *)(v1 + 120));
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[HDOdometerDataCollector initWithProfile:collectedDistanceType:](v21, "initWithProfile:collectedDistanceType:", v22, v23);

          if (v24)
            objc_msgSend(*(id *)(v1 + 64), "addObject:", v24);
          v25 = [HDOdometerDataCollector alloc];
          v26 = objc_loadWeakRetained((id *)(v1 + 120));
          objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C70]);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[HDOdometerDataCollector initWithProfile:collectedDistanceType:](v25, "initWithProfile:collectedDistanceType:", v26, v27);

          if (v28)
            objc_msgSend(*(id *)(v1 + 64), "addObject:", v28);

        }
        v29 = (void *)objc_msgSend(*(id *)(v1 + 64), "copy");
        os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v6, "containsObject:", v31);

        if ((v32 & 1) == 0)
        {
          v33 = [HDSkiingWorkoutDistanceCollector alloc];
          v34 = objc_loadWeakRetained((id *)(v1 + 120));
          v35 = -[HDSkiingWorkoutDistanceCollector initWithProfile:](v33, "initWithProfile:", v34);

          if (v35)
            -[HDDataCollectionManager _queue_addDataCollector:](v1, v35);

        }
        v36 = v29;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        v89 = 0u;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
        if (v37)
        {
          v38 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v87 != v38)
                objc_enumerationMutation(v36);
              v40 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v40, "registerWithAggregators");
            }
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
          }
          while (v37);
        }

      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
        _HKInitializeLogging();
        v41 = *MEMORY[0x1E0CB52A8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_DEFAULT, "Data collection disabled; not starting built-in collectors.",
            buf,
            2u);
        }
      }
    }
    objc_initWeak(&location, (id)v1);
    v42 = *(NSObject **)(v1 + 136);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __68__HDDataCollectionManager__queue_setupUnprotectedDataDependantState__block_invoke;
    handler[3] = &unk_1E6CE8390;
    objc_copyWeak(&v82, &location);
    notify_register_dispatch((const char *)*MEMORY[0x1E0CB77E0], (int *)(v1 + 52), v42, handler);
    v43 = HKIsFitnessTrackingEnabled();
    if ((v43 & 1) == 0)
    {
      _HKInitializeLogging();
      v44 = *MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v44, OS_LOG_TYPE_DEFAULT, "Access to fitness data NOT granted.", buf, 2u);
      }
    }
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v46 = objc_loadWeakRetained((id *)(v1 + 120));
    objc_msgSend(v46, "daemon");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "pluginManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "pluginsConformingToProtocol:", &unk_1EF252758);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "allValues");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
    if (v51)
    {
      v52 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v87 != v52)
            objc_enumerationMutation(v50);
          v54 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
          objc_msgSend((id)v1, "profile");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "dataCollectorsForProfile:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
            objc_msgSend(v45, "addObjectsFromArray:", v56);

        }
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, buf, 16);
      }
      while (v51);
    }

    -[HDDataCollectionManager _dataCollectorBlacklist]();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "count"))
    {
      _HKInitializeLogging();
      v58 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        v59 = v58;
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR(", "));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v92 = 138543362;
        *(_QWORD *)&v92[4] = v60;
        _os_log_impl(&dword_1B7802000, v59, OS_LOG_TYPE_DEFAULT, "Filtering plugin data collectors via blacklist: %{public}@", v92, 0xCu);

      }
      *(_QWORD *)v92 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v92[8] = 3221225472;
      *(_QWORD *)&v93 = __48__HDDataCollectionManager__pluginDataCollectors__block_invoke;
      *((_QWORD *)&v93 + 1) = &unk_1E6D0E2D0;
      *(_QWORD *)&v94 = v57;
      objc_msgSend(v45, "hk_filter:", v92);
      v61 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v61 = v45;
    }

    _HKInitializeLogging();
    v62 = (id)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v61, "componentsJoinedByString:", CFSTR(", "));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v91 = v63;
      _os_log_impl(&dword_1B7802000, v62, OS_LOG_TYPE_DEFAULT, "Received data collectors: [%{public}@]", buf, 0xCu);

    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v64 = v61;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, &v86, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v78;
      v67 = v43 ^ 1u;
      do
      {
        for (k = 0; k != v65; ++k)
        {
          if (*(_QWORD *)v78 != v66)
            objc_enumerationMutation(v64);
          v69 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          objc_msgSend(v69, "setDisabled:", v67);
          -[HDDataCollectionManager _queue_addDataCollector:](v1, v69);
        }
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, &v86, 16);
      }
      while (v65);
    }

    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 136));
    v94 = 0u;
    v95 = 0u;
    *(_OWORD *)v92 = 0u;
    v93 = 0u;
    v70 = *(id *)(v1 + 128);
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v92, buf, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v93;
      do
      {
        for (m = 0; m != v71; ++m)
        {
          if (*(_QWORD *)v93 != v72)
            objc_enumerationMutation(v70);
          v74 = *(id *)(*(_QWORD *)&v92[8] + 8 * m);
          os_unfair_lock_assert_not_owner((const os_unfair_lock *)(v1 + 56));
          os_unfair_lock_lock((os_unfair_lock_t)(v1 + 56));
          objc_msgSend(*(id *)(v1 + 72), "objectForKeyedSubscript:", v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
          if (v75)
          {
            v84 = 0u;
            v85 = 0u;
            -[HDDataCollectionManager _queue_collectionStateForType:]((uint64_t)&v84, v1, v74);
            if (BYTE8(v85))
              objc_msgSend(v75, "collectionStartedForType:collectionInterval:", v74, *(double *)&v84);
          }

        }
        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", v92, buf, 16);
      }
      while (v71);
    }

    objc_destroyWeak(&v82);
    objc_destroyWeak(&location);
  }
}

void __48__HDDataCollectionManager__observersDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%@ (%ld)\n"), v5, v7);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v6, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t\t%@: %@\n"), v5, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (id)diagnosticDescription
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  NSMutableDictionary *observersByType;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v27;
  void *v28;
  __CFString *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_lastLaunchUpdate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastLaunchUpdate);
    v5 = v4;

    if (v5 >= 120.0)
    {
      if (v5 >= 5400.0)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f hrs ago"), v5 / 3600.0);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f mins ago"), v5 / 60.0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f secs ago"), *(_QWORD *)&v5);
    }
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = CFSTR("NEVER");
  }
  v28 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Active Observers (%ld type(s)):\n"), -[NSMutableDictionary count](self->_observersByType, "count"));
  observersByType = self->_observersByType;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __48__HDDataCollectionManager__observersDescription__block_invoke;
  v34[3] = &unk_1E6D0E360;
  v8 = v6;
  v35 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observersByType, "enumerateKeysAndObjectsUsingBlock:", v34);

  -[HDFakeDataCollector configuration](self->_fakeCollector, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("Data Collectors:\n"));
  os_unfair_lock_lock(&self->_collectorLock);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary allValues](self->_collectorLock_dataCollectorsByType, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dataCollectorDiagnosticDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendFormat:", CFSTR("\t%@\n"), v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_collectorLock);
  v16 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v16, "appendString:", CFSTR("Data Aggregators:\n"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary allValues](self->_dataAggregatorsByType, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v16, "appendFormat:", CFSTR("\t%@\n"), v22);
        objc_msgSend(v22, "diagnosticDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendFormat:", CFSTR("%@\n"), v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v19);
  }
  if (v27)
    v24 = "\nData faking enabled";
  else
    v24 = "";

  objc_msgSend(v28, "stringWithFormat:", CFSTR("\n%@%s\nLast launch update: %@\n%@\n%@"), v8, v24, v29, v9, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (OS_dispatch_queue)dataCollectionQueue
{
  return self->_dataCollectionQueue;
}

- (OS_dispatch_queue)sharedDelayedAggregationQueue
{
  return self->_sharedDelayedAggregationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDelayedAggregationQueue, 0);
  objc_storeStrong((id *)&self->_dataCollectionQueue, 0);
  objc_storeStrong((id *)&self->_assertionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observersByType, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_seriesQuantityEventObserver, 0);
  objc_storeStrong((id *)&self->_collectibleTypes, 0);
  objc_storeStrong(&self->_unitTest_aggregatorConfigurationChangedHandler, 0);
  objc_storeStrong((id *)&self->_lastFlushDateByType, 0);
  objc_storeStrong((id *)&self->_fakeCollector, 0);
  objc_storeStrong((id *)&self->_collectorLock_dataCollectorsByType, 0);
  objc_storeStrong((id *)&self->_collectorLock_builtinCollectors, 0);
  objc_storeStrong((id *)&self->_pendingSavePool, 0);
  objc_storeStrong((id *)&self->_periodicUpdateActivity, 0);
  objc_storeStrong((id *)&self->_dataAggregatorsByType, 0);
  objc_storeStrong((id *)&self->_lastLaunchUpdate, 0);
}

@end
