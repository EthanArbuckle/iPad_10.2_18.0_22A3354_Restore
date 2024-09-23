@implementation HDDataManager

- (void)addObserver:(id)a3 forDataType:(id)a4
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
  block[2] = __41__HDDataManager_addObserver_forDataType___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __41__HDDataManager_addObserver_forDataType___block_invoke(uint64_t a1)
{
  id v2;

  -[HDDataManager _queue_observersForDataType:createIfNil:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));

}

- (id)_queue_observersForDataType:(int)a3 createIfNil:
{
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v6 = a2;
    dispatch_assert_queue_V2(v5);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = objc_msgSend(v6, "code");

    objc_msgSend(v7, "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDataManager _queue_observersForKey:createIfNil:](a1, v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_queue_observersForKey:(int)a3 createIfNil:
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = 1;
    else
      v7 = a3 == 0;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v6, v5);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)deleteDataObjectsOfClass:(Class)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 recursiveDeleteAuthorizationBlock:(id)a9 error:(id *)a10
{
  uint64_t v11;

  LOBYTE(v11) = 0;
  return -[HDDataManager deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:](self, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:", a3, a4, a5, a6, a7, a8, v11, a9, a10);
}

- (void)removeObserver:(id)a3 forDataType:(id)a4
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
  block[2] = __44__HDDataManager_removeObserver_forDataType___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __44__HDDataManager_removeObserver_forDataType___block_invoke(uint64_t a1)
{
  id v2;

  -[HDDataManager _queue_observersForDataType:createIfNil:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 48));

}

- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 error:(id *)a6
{
  return -[HDDataManager insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:](self, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", a3, a4, 0, 1, 0, a6, a5);
}

- (void)_callObserversIfPossible
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;

  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__132;
    v25 = __Block_byref_object_dispose__132;
    v26 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__132;
    v19 = __Block_byref_object_dispose__132;
    v20 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v2 = *(NSObject **)(a1 + 8);
    v3 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__HDDataManager__callObserversIfPossible__block_invoke;
    block[3] = &unk_1E6CFF1B8;
    block[4] = a1;
    block[5] = &v11;
    block[6] = &v15;
    block[7] = &v21;
    dispatch_sync(v2, block);
    if (*((_BYTE *)v12 + 24))
    {
      v4 = (void *)v22[5];
      v5 = (id)v16[5];
      v6 = v4;
      v7 = *(NSObject **)(a1 + 16);
      v27[0] = v3;
      v27[1] = 3221225472;
      v27[2] = __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke;
      v27[3] = &unk_1E6CE7FB8;
      v8 = v5;
      v28 = v8;
      v29 = a1;
      v9 = v6;
      v30 = v9;
      dispatch_async(v7, v27);

    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
  }
}

void __41__HDDataManager__callObserversIfPossible__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!*(_QWORD *)(a1[4] + 56))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v2 = objc_msgSend(*(id *)(a1[4] + 64), "copy");
    v3 = *(_QWORD *)(a1[6] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(a1[4] + 64), "removeAllObjects");
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 72));
    v5 = a1[4];
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = 0;

  }
}

void __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  double Current;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id obj;
  void *v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint8_t v101[128];
  uint8_t buf[4];
  _QWORD *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  void *v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 120));
  objc_msgSend(WeakRetained, "appSubscriptionManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v4;
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v90;
    v63 = a1;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v90 != v65)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 48);
        if (v9)
          objc_msgSend(v64, "setAnchor:forDataCode:type:", v9, objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * v7), "code"), 0);
        -[HDDataManager _observersForDataType:](*(_QWORD **)(a1 + 40), v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v69 = v7;
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 48);
          v13 = objc_msgSend(v11, "count");
          v14 = 96;
          if (!v12)
            v14 = 104;
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + v14) += v13;
          v15 = *(_QWORD *)(a1 + 40);
          v16 = *(void **)(a1 + 48);
          v68 = v10;
          v17 = v10;
          v18 = v11;
          v19 = v8;
          v20 = v16;
          if (v15)
          {
            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v94;
              do
              {
                v24 = 0;
                do
                {
                  if (*(_QWORD *)v94 != v23)
                    objc_enumerationMutation(v17);
                  v25 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v24);
                  if (v20)
                  {
                    objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * v24), "samplesAdded:anchor:", v18, v20);
                  }
                  else if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    objc_msgSend(v25, "samplesJournaled:type:", v18, v19);
                  }
                  ++v24;
                }
                while (v22 != v24);
                v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, buf, 16);
              }
              while (v22);
            }
          }

          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v26 = v17;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
          a1 = v63;
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v86;
            do
            {
              v30 = 0;
              do
              {
                if (*(_QWORD *)v86 != v29)
                  objc_enumerationMutation(v26);
                objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v30++));
              }
              while (v28 != v30);
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v85, v100, 16);
            }
            while (v28);
          }

          v10 = v68;
          v7 = v69;
        }

        ++v7;
      }
      while (v7 != v66);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
    }
    while (v66);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v31 = v5;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v82;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v82 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v35);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v36, "didAddSamplesOfTypes:anchor:", obj, *(_QWORD *)(a1 + 48));
          ++v35;
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v81, v99, 16);
      }
      while (v33);
    }

  }
  -[HDDataManager _observersForAllTypes](*(_QWORD *)(a1 + 40));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v37, "count"))
  {
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = *(void **)(a1 + 32);
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke_2;
    v79[3] = &unk_1E6CFF018;
    v40 = v38;
    v80 = v40;
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v79);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v41 = v37;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v76;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v76 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v45++), "samplesAdded:anchor:", v40, *(_QWORD *)(a1 + 48));
        }
        while (v43 != v45);
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v75, v98, 16);
      }
      while (v43);
    }

    if (*(_QWORD *)(a1 + 48))
    {
      v70 = v37;
      v46 = a1;
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v47 = v41;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v72;
        do
        {
          v51 = 0;
          do
          {
            if (*(_QWORD *)v72 != v50)
              objc_enumerationMutation(v47);
            v52 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v51);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v52, "didAddSamplesOfTypes:anchor:", obj, *(_QWORD *)(v46 + 48));
            ++v51;
          }
          while (v49 != v51);
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v97, 16);
        }
        while (v49);
      }

      a1 = v46;
      v37 = v70;
    }

  }
  Current = CFAbsoluteTimeGetCurrent();
  v54 = *(_QWORD *)(a1 + 40);
  if (Current - *(double *)(v54 + 80) > 300.0 || (v55 = *(_QWORD *)(v54 + 88), v55 == -1))
  {
    _HKInitializeLogging();
    v56 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v57 = *(_QWORD **)(a1 + 40);
      v58 = v57[12];
      v59 = v57[11] & ~((uint64_t)v57[11] >> 63);
      v60 = v57[13];
      v61 = v56;
      HKDiagnosticStringFromDuration();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v103 = v57;
      v104 = 2048;
      v105 = v59;
      v106 = 2048;
      v107 = v58;
      v108 = 2048;
      v109 = v60;
      v110 = 2114;
      v111 = v62;
      _os_log_impl(&dword_1B7802000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: added samples notifications (%ld): %ld added, %ld journaled in past %{public}@", buf, 0x34u);

    }
    *(double *)(*(_QWORD *)(a1 + 40) + 80) = Current;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = 0;
    v54 = *(_QWORD *)(a1 + 40);
    v55 = *(_QWORD *)(v54 + 88);
  }
  *(_QWORD *)(v54 + 88) = v55 + 1;

}

- (_QWORD)_observersForDataType:(_QWORD *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__132;
    v14 = __Block_byref_object_dispose__132;
    v15 = 0;
    v5 = a1[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__HDDataManager__observersForDataType___block_invoke;
    block[3] = &unk_1E6CF6BF8;
    v9 = &v10;
    block[4] = a1;
    v8 = v3;
    dispatch_sync(v5, block);
    a1 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

void __39__HDDataManager__observersForDataType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[HDDataManager _queue_observersForDataType:createIfNil:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_observersForAllTypes
{
  NSObject *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__132;
  v9 = __Block_byref_object_dispose__132;
  v10 = 0;
  v1 = *(NSObject **)(a1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__HDDataManager__observersForAllTypes__block_invoke;
  v4[3] = &unk_1E6CE8110;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __38__HDDataManager__observersForAllTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDDataManager _queue_observersForKey:createIfNil:](v2, v7, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)insertDataObjects:(id)a3 sourceEntity:(id)a4 deviceEntity:(id)a5 sourceVersion:(id)a6 creationDate:(double)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id WeakRetained;
  void *v20;
  void *v21;
  BOOL v22;
  void *v24;
  void *v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataProvenanceManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localDataProvenanceForSourceEntity:version:deviceEntity:", v16, v18, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provenance != nil"));

  }
  v22 = -[HDDataManager insertDataObjects:withProvenance:creationDate:error:](self, "insertDataObjects:withProvenance:creationDate:error:", v15, v21, a8, a7);

  return v22;
}

- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 skipInsertionFilter:(BOOL)a6 error:(id *)a7
{
  return -[HDDataManager insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:](self, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", a3, a4, a6, 1, 0, a7, a5);
}

- (void)openObserverTransaction
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HDDataManager_openObserverTransaction__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __40__HDDataManager_openObserverTransaction__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (void)closeObserverTransaction
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__HDDataManager_closeObserverTransaction__block_invoke;
  v4[3] = &unk_1E6CE8058;
  v4[4] = self;
  v4[5] = a2;
  dispatch_sync(queue, v4);
  -[HDDataManager _callObserversIfPossible]((uint64_t)self);
}

void __41__HDDataManager_closeObserverTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 56);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HDDataManager.m"), 1259, CFSTR("No open transactions"));

    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(v1 + 56);
  }
  *(_QWORD *)(v1 + 56) = v2 - 1;
}

- (HDDataManager)initWithProfile:(id)a3
{
  id v4;
  HDDataManager *v5;
  uint64_t v6;
  OS_dispatch_queue *queue;
  uint64_t v8;
  OS_dispatch_queue *notificationQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *observersByDataType;
  uint64_t v12;
  NSMutableDictionary *pendingObjectsBySampleType;
  void *v14;
  HDQuantitySeriesManager *v15;
  HDQuantitySeriesManager *quantitySeriesManager;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDDataManager;
  v5 = -[HDDataManager init](&v18, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v5->_notificationQueue;
    v5->_notificationQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_profile, v4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByDataType = v5->_observersByDataType;
    v5->_observersByDataType = v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingObjectsBySampleType = v5->_pendingObjectsBySampleType;
    v5->_pendingObjectsBySampleType = (NSMutableDictionary *)v12;

    v5->_synchronousObserverLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v5);

    v15 = -[HDQuantitySeriesManager initWithProfile:]([HDQuantitySeriesManager alloc], "initWithProfile:", v4);
    quantitySeriesManager = v5->_quantitySeriesManager;
    v5->_quantitySeriesManager = v15;

    v5->_notifyCount = -1;
    v5->_lastNotifyLogTime = CFAbsoluteTimeGetCurrent();
  }

  return v5;
}

- (BOOL)insertDataObjects:(id)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  p_profile = &self->_profile;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "dataProvenanceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultLocalDataProvenance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[HDDataManager insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:](self, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", v7, v10, 0, 1, 0, a4, CFAbsoluteTimeGetCurrent());

  return (char)a4;
}

- (BOOL)insertDataObjects:(id)a3 withProvenance:(id)a4 creationDate:(double)a5 skipInsertionFilter:(BOOL)a6 updateSourceOrder:(BOOL)a7 resolveAssociations:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v10;
  _BOOL8 v12;
  id v16;
  id v17;
  HDDataEntityInsertionContext *v18;
  id WeakRetained;
  HDDataEntityInsertionContext *v20;
  id v21;
  void *v22;
  uint64_t v23;
  HDDataEntityInsertionContext *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  HDDataEntityInsertionContext *v29;
  BOOL v30;
  _QWORD v31[5];
  id v32;
  HDDataEntityInsertionContext *v33;
  BOOL v34;

  v10 = a8;
  v12 = a6;
  v16 = a3;
  v17 = a4;
  v18 = [HDDataEntityInsertionContext alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v20 = -[HDDataEntityInsertionContext initWithProvenance:creationDate:skipInsertionFilter:resolveAssociations:profile:](v18, "initWithProvenance:creationDate:skipInsertionFilter:resolveAssociations:profile:", v17, v12, v10, WeakRetained, a5);

  v21 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v21, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke;
  v31[3] = &unk_1E6CFEF28;
  v31[4] = self;
  v32 = v16;
  v33 = v20;
  v34 = a7;
  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke_2;
  v27[3] = &unk_1E6CFEF50;
  v27[4] = self;
  v28 = v32;
  v29 = v33;
  v30 = a7;
  v24 = v33;
  v25 = v32;
  LOBYTE(a9) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v22, a9, v31, v27);

  return (char)a9;
}

uint64_t __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v20;
  _QWORD v21[7];
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD block[7];
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  v10 = v6;
  if (v5)
  {
    v20 = 0;
    v11 = -[HDDataManager _insertDataObjects:insertionContext:lastInsertedIDOut:error:](v5, v8, v10, &v20, a3);
    v12 = v20;
    if (v11)
    {
      v13 = v9;
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x3032000000;
      v28[3] = __Block_byref_object_copy__132;
      v28[4] = __Block_byref_object_dispose__132;
      v29 = 0;
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x3032000000;
      v26[3] = __Block_byref_object_copy__132;
      v26[4] = __Block_byref_object_dispose__132;
      v27 = 0;
      v14 = *(NSObject **)(v5 + 8);
      v15 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke;
      block[3] = &unk_1E6CEF868;
      block[4] = v5;
      block[5] = v28;
      block[6] = v26;
      dispatch_sync(v14, block);
      objc_msgSend(v13, "protectedDatabase");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v15;
      v23[1] = 3221225472;
      v23[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_2;
      v23[3] = &unk_1E6CF9188;
      v23[4] = v5;
      v17 = v13;
      v24 = v17;
      objc_msgSend(v16, "beforeCommit:", v23);

      v22[1] = 3221225472;
      v22[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_3;
      v22[3] = &unk_1E6CE80E8;
      v22[4] = v5;
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_4;
      v21[3] = &unk_1E6CFEFC8;
      v21[4] = v5;
      v21[5] = v28;
      v21[6] = v26;
      v22[0] = v15;
      objc_msgSend(v17, "onCommit:orRollback:", v22, v21);

      _Block_object_dispose(v26, 8);
      _Block_object_dispose(v28, 8);

      v18 = -[HDDataManager _updateSourceAndLastAnchorForObjects:insertionContext:lastInsertedID:isDatabaseAccessible:shouldUpdateSourceOrder:error:](v5, v8, v10, v12, 1, v7 != 0, a3);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __127__HDDataManager_insertDataObjects_withProvenance_creationDate_skipInsertionFilter_updateSourceOrder_resolveAssociations_error___block_invoke_2(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v14[5];
  id v15;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v6 = *(unsigned __int8 *)(a1 + 56);
  v7 = *(id *)(a1 + 40);
  v8 = v5;
  if (v4)
  {
    v15 = 0;
    v9 = -[HDDataManager _insertDataObjects:insertionContext:lastInsertedIDOut:error:](v4, v7, v8, &v15, a3);
    v10 = v15;
    if (v9)
    {
      v11 = *(NSObject **)(v4 + 8);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __78__HDDataManager__journalDataObjects_insertionContext_updateSourceOrder_error___block_invoke;
      v14[3] = &unk_1E6CE80E8;
      v14[4] = v4;
      dispatch_sync(v11, v14);
      v12 = -[HDDataManager _updateSourceAndLastAnchorForObjects:insertionContext:lastInsertedID:isDatabaseAccessible:shouldUpdateSourceOrder:error:](v4, v7, v8, v10, 0, v6 != 0, a3);
      if ((_DWORD)v12)
      {
        -[HDDataManager _notifySynchronousObserversIfPossibleInTransaction:](v4, 0);
        -[HDDataManager _callObserversIfPossible](v4);
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_insertDataObjects:(void *)a3 insertionContext:(_QWORD *)a4 lastInsertedIDOut:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id WeakRetained;
  int v12;
  id v13;
  void *v14;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v9 = a2;
  v10 = a3;
  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__132;
  v27 = __Block_byref_object_dispose__132;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__132;
  v21 = __Block_byref_object_dispose__132;
  v22 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__HDDataManager__insertDataObjects_insertionContext_lastInsertedIDOut_error___block_invoke;
  v16[3] = &unk_1E6CFEF78;
  v16[4] = &v23;
  v16[5] = &v29;
  v16[6] = &v17;
  +[HDDataEntity insertDataObjects:insertionContext:profile:completionHandler:](HDDataEntity, "insertDataObjects:insertionContext:profile:completionHandler:", v9, v10, WeakRetained, v16);

  v12 = *((unsigned __int8 *)v30 + 24);
  if (*((_BYTE *)v30 + 24))
  {
    *a4 = objc_retainAutorelease((id)v24[5]);
  }
  else
  {
    v13 = (id)v18[5];
    v14 = v13;
    if (v13)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12 != 0;
}

uint64_t __78__HDDataManager__journalDataObjects_insertionContext_updateSourceOrder_error___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 1;
  return result;
}

- (uint64_t)_updateSourceAndLastAnchorForObjects:(void *)a3 insertionContext:(void *)a4 lastInsertedID:(char)a5 isDatabaseAccessible:(int)a6 shouldUpdateSourceOrder:(_QWORD *)a7 error:
{
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  uint64_t v32;
  char v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  void *v40;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  _QWORD block[4];
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  _BYTE *v55;
  id v56;
  id v57;
  _QWORD v58[3];
  uint8_t v59[4];
  id v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v43 = a2;
  v10 = a3;
  v44 = a4;
  v40 = v10;
  objc_msgSend(v10, "provenance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  objc_msgSend(WeakRetained, "sourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientSourceForPersistentID:error:", v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0CB6C30]);
    objc_msgSend(v11, "sourceVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v11, "operatingSystemVersion");
    else
      memset(v58, 0, sizeof(v58));
    v42 = (void *)objc_msgSend(v16, "initWithSource:version:productType:operatingSystemVersion:", v15, v17, v18, v58);

  }
  else
  {
    v42 = 0;
  }
  objc_msgSend(v11, "deviceID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(v20, "deviceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v21, "deviceForPersistentID:error:", v19, &v57);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v57;

    if (!v45)
    {
      if (v22)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v22;
          _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Failed to look up device %{public}@: %{public}@", buf, 0x16u);
        }
      }
    }

  }
  else
  {
    v45 = 0;
  }
  objc_msgSend(v11, "contributorReference");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_loadWeakRetained((id *)(a1 + 120));
  objc_msgSend(v25, "contributorManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v26, "contributorForReference:error:", v24, &v56);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v56;

  if (v27 || (a5 & 1) != 0 || !v28 || (objc_msgSend(v28, "hk_isDatabaseAccessibilityError") & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy__132;
    v63 = __Block_byref_object_dispose__132;
    v64 = 0;
    v29 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __137__HDDataManager__updateSourceAndLastAnchorForObjects_insertionContext_lastInsertedID_isDatabaseAccessible_shouldUpdateSourceOrder_error___block_invoke;
    block[3] = &unk_1E6CFEFA0;
    v48 = v43;
    v49 = v42;
    v50 = v45;
    v51 = v27;
    v52 = a1;
    v53 = v11;
    v55 = buf;
    v54 = v44;
    dispatch_sync(v29, block);
    if (v15 && a6)
    {
      v30 = objc_loadWeakRetained((id *)(a1 + 120));
      objc_msgSend(v30, "sourceOrderManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      v46 = 0;
      v33 = objc_msgSend(v31, "addOrderedSource:objectTypes:error:", v15, v32, &v46);
      v34 = v46;

      if ((v33 & 1) == 0)
      {
        _HKInitializeLogging();
        v35 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v59 = 138543362;
          v60 = v34;
          _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "Failed to update source order during insert: %{public}@", v59, 0xCu);
        }
      }

    }
    _Block_object_dispose(buf, 8);

    v36 = 1;
  }
  else if (a7)
  {
    v36 = 0;
    *a7 = objc_retainAutorelease(v28);
  }
  else
  {
    _HKLogDroppedError();
    v36 = 0;
  }

  return v36;
}

- (void)_notifySynchronousObserversIfPossibleInTransaction:(uint64_t)a1
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  uint64_t *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 8));
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__132;
    v33 = __Block_byref_object_dispose__132;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__132;
    v27 = __Block_byref_object_dispose__132;
    v28 = 0;
    v3 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke;
    block[3] = &unk_1E6CFF1B8;
    block[4] = a1;
    block[5] = &v35;
    block[6] = &v29;
    block[7] = &v23;
    dispatch_sync(v3, block);
    if (*((_BYTE *)v36 + 24))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v4 = (id)v30[5];
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v39, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v19 != v6)
              objc_enumerationMutation(v4);
            v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend((id)v30[5], "objectForKeyedSubscript:", v8, v13);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v10 = v24[5];
              v11 = *(void **)(a1 + 112);
              if (v10)
                objc_msgSend(v11, "samplesAdded:type:anchor:transaction:", v9, v8, v10, v13);
              else
                objc_msgSend(v11, "samplesJournaled:type:", v9, v8);
            }
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
            if (-[HDDataManager _synchronousObserverLock_hasSynchronousObserverForSampleType:](a1, v8))
            {
              -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:](a1, v8);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
              if (v12)
              {
                v14[0] = MEMORY[0x1E0C809B0];
                v14[1] = 3221225472;
                v14[2] = __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke_2;
                v14[3] = &unk_1E6CFF1E0;
                v17 = &v23;
                v15 = v9;
                v16 = v8;
                objc_msgSend(v12, "notifyObservers:", v14);

              }
            }
            else
            {
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
            }

          }
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v39, 16);
        }
        while (v5);
      }

    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }

}

void __77__HDDataManager__insertDataObjects_insertionContext_lastInsertedIDOut_error___block_invoke(_QWORD *a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a2)
  {
    v12 = (id *)(*(_QWORD *)(a1[4] + 8) + 40);
    v13 = a4;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 124, CFSTR("Failed to insert objects."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
    {
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "Failed to insert data objects: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v12 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
    v13 = v11;
  }
  objc_storeStrong(v12, v13);

}

void __137__HDDataManager__updateSourceAndLastAnchorForObjects_insertionContext_lastInsertedID_isDatabaseAccessible_shouldUpdateSourceOrder_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        if (*(_QWORD *)(a1 + 40))
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v6), "_setSourceRevision:", (_QWORD)v14);
        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(v7, "device");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v8)
            objc_msgSend(v7, "_setDevice:", *(_QWORD *)(a1 + 48));
        }
        if (*(_QWORD *)(a1 + 56))
          objc_msgSend(v7, "_setContributor:");
        if (objc_msgSend(v7, "_shouldNotifyOnInsert", (_QWORD)v14))
        {
          objc_msgSend(v7, "hd_sampleType");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 64), "objectForKeyedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 64), "setObject:forKeyedSubscript:", v10, v9);
            }
            objc_msgSend(v7, "setHealthd_use_only_dataOriginProvenance:", *(_QWORD *)(a1 + 72));
            objc_msgSend(v10, "addObject:", v7);

          }
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 64), "allKeys");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 64) + 72), *(id *)(a1 + 80));
}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1[4] + 64), "mutableCopy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(a1[4] + 48) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 72));
}

uint64_t __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_2(uint64_t a1)
{
  -[HDDataManager _notifySynchronousObserversIfPossibleInTransaction:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  return 1;
}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_3(uint64_t a1)
{
  -[HDDataManager _callObserversIfPossible](*(_QWORD *)(a1 + 32));
}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  __int128 v7;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "Discarding pending samples due to transaction rollback: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_208;
  block[3] = &unk_1E6CF1308;
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  dispatch_sync(v5, block);

}

void __54__HDDataManager__addTransactionInsertionCommitBlocks___block_invoke_208(_QWORD *a1)
{
  objc_storeStrong((id *)(a1[4] + 64), *(id *)(*(_QWORD *)(a1[5] + 8) + 40));
  objc_storeStrong((id *)(a1[4] + 72), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (void)shouldNotifyForDataObjects:(id)a3 provenance:(id)a4 database:(id)a5 anchor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "sourceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v15, "clientSourceForPersistentID:error:", v16, &v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v30;

  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke;
  v24[3] = &unk_1E6CFEFF0;
  v24[4] = self;
  v25 = v13;
  v26 = v17;
  v27 = v18;
  v28 = v11;
  v29 = v10;
  v19 = v10;
  v20 = v11;
  v21 = v18;
  v22 = v17;
  v23 = v13;
  objc_msgSend(v12, "onCommit:orRollback:", v24, 0);

}

void __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke_2;
  v5[3] = &unk_1E6CFEFF0;
  v5[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  dispatch_sync(v4, v5);
  -[HDDataManager _callObserversIfPossible](*(_QWORD *)(a1 + 32));

}

void __71__HDDataManager_shouldNotifyForDataObjects_provenance_database_anchor___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  if (!*(_QWORD *)(a1 + 48))
  {
    if (*(_QWORD *)(a1 + 56))
    {
      _HKInitializeLogging();
      v2 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v19 = *(void **)(a1 + 64);
        v20 = v2;
        objc_msgSend(v19, "sourceID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v31 = v21;
        v32 = 2114;
        v33 = v22;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to lookup source %@ during insert notification: %{public}@", buf, 0x16u);

      }
    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = *(id *)(a1 + 72);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "hd_sampleType", v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v10, v9);
          }
          objc_msgSend(v10, "addObject:", v8);

        }
        objc_msgSend(v8, "sourceRevision");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "source");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = *(void **)(a1 + 48);
          if (v13)
          {
            v12 = v13;
            v14 = objc_alloc(MEMORY[0x1E0CB6C30]);
            objc_msgSend(*(id *)(a1 + 64), "sourceVersion");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "productType");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(void **)(a1 + 64);
            if (v17)
              objc_msgSend(v17, "operatingSystemVersion");
            else
              memset(v24, 0, sizeof(v24));
            v18 = (void *)objc_msgSend(v14, "initWithSource:version:productType:operatingSystemVersion:", v12, v15, v16, v24);
            objc_msgSend(v8, "_setSourceRevision:", v18);

            v6 = v23;
          }
          else
          {
            v12 = 0;
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

}

- (void)shouldNotifyForDeletedSamplesOfTypes:(id)a3 intervals:(id)a4 userRequested:(BOOL)a5 transaction:(id)a6 anchor:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  unint64_t v31;
  id v32;
  HDQuantitySeriesManager *quantitySeriesManager;
  void *v34;
  HDQuantitySeriesManager *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v9 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDCloudSyncStore samplesDeletedInProfile:byUser:intervals:](HDCloudSyncStore, "samplesDeletedInProfile:byUser:intervals:", WeakRetained, v9, v15);

  v17 = v12;
  v18 = v13;
  v47 = v14;
  if (self)
  {
    os_unfair_lock_lock(&self->_synchronousObserverLock);
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v46 = v17;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      v23 = *(_QWORD *)v59;
      v24 = 0x1E0CB6000uLL;
      do
      {
        v25 = 0;
        v48 = v21;
        do
        {
          if (*(_QWORD *)v59 != v23)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v25);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v26;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = v23;
              v29 = v18;
              v30 = v22;
              v31 = v24;
              v32 = v19;
              quantitySeriesManager = self->_quantitySeriesManager;
              v63 = v27;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = quantitySeriesManager;
              v19 = v32;
              v24 = v31;
              v22 = v30;
              v18 = v29;
              v23 = v28;
              v21 = v48;
              -[HDQuantitySeriesManager samplesOfTypesWereRemoved:anchor:transaction:](v35, "samplesOfTypesWereRemoved:anchor:transaction:", v34, v18, v47);

            }
            if (-[HDDataManager _synchronousObserverLock_hasSynchronousObserverForSampleType:]((uint64_t)self, v27))
            {
              if (!v22)
                v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:]((uint64_t)self, v27);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, v27);

            }
          }
          ++v25;
        }
        while (v21 != v25);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }

    os_unfair_lock_unlock(&self->_synchronousObserverLock);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v37 = v22;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v55 != v40)
            objc_enumerationMutation(v37);
          v42 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v37, "objectForKeyedSubscript:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __85__HDDataManager__notifySynchronousObserversForDeletedObjectTypes_anchor_transaction___block_invoke;
          v52[3] = &unk_1E6CFF208;
          v52[4] = v42;
          v53 = v18;
          objc_msgSend(v43, "notifyObservers:", v52);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v39);
    }

    v17 = v46;
  }

  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke;
  v49[3] = &unk_1E6CE7FB8;
  v49[4] = self;
  v50 = v17;
  v51 = v18;
  v44 = v18;
  v45 = v17;
  objc_msgSend(v47, "onCommit:orRollback:", v49, 0);

}

void __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke_2;
  block[3] = &unk_1E6CE7FB8;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __97__HDDataManager_shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_transaction_anchor___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (v1)
  {
    -[HDDataManager _observersForAllTypes]((uint64_t)v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v35;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v35 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v9);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v3;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          -[HDDataManager _observersForDataType:](v1, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "allObjects");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v14);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v23);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v24, "samplesOfTypesWereRemoved:anchor:", v12, v4);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v21);
    }

    v3 = v25;
  }

}

- (void)_shouldNotifyForDeletedSamplesOfTypes:(void *)a3 intervals:(char)a4 userRequested:(void *)a5 anchor:
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __86__HDDataManager__shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_anchor___block_invoke;
    v17[3] = &unk_1E6CFA168;
    v17[4] = a1;
    v18 = v9;
    v19 = v10;
    v21 = a4;
    v20 = v11;
    v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDDataEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, &v22, v17);
    v15 = v22;

    if (!v14)
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Failed to get write transaction for setting up sample deletion commit hook: %{public}@.", buf, 0xCu);
      }
    }

  }
}

uint64_t __86__HDDataManager__shouldNotifyForDeletedSamplesOfTypes_intervals_userRequested_anchor___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:transaction:anchor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), a2, *(_QWORD *)(a1 + 56));
  return 1;
}

uint64_t __73__HDDataManager__notifyObserversWithAddedObjectsBySampleType_lastAnchor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (BOOL)deleteObjectsWithUUIDCollection:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  char v17;
  _QWORD v19[4];
  id v20;
  id v21;
  HDDataManager *v22;
  _QWORD v23[4];
  id v24;
  HDDataManager *v25;
  id v26;
  uint64_t v27;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "entityClass");
  if (!v10)
    v10 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke;
  v23[3] = &unk_1E6CFF068;
  v24 = v9;
  v25 = self;
  v27 = v10;
  v26 = v8;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_5;
  v19[3] = &unk_1E6CF9FB8;
  v20 = v24;
  v21 = v26;
  v22 = self;
  v15 = v26;
  v16 = v24;
  v17 = objc_msgSend(v12, "performTransactionWithContext:error:block:inaccessibilityHandler:", v13, a5, v23, v19);

  return v17;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  __objc2_class **v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  uint64_t v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;

  v53 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "secureDelete"))
  {
    objc_msgSend(v53, "protectedDatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCheckpointRequired:", 1);

  }
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = objc_msgSend(*(id *)(a1 + 56), "preferredEntityType");
  v9 = v7;
  v10 = v9;
  if (!v6)
  {

    goto LABEL_19;
  }
  v11 = objc_alloc(MEMORY[0x1E0CB37A0]);
  +[HDDataEntity disambiguatedSQLForProperty:](HDSampleEntity, "disambiguatedSQLForProperty:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity disambiguatedSQLForProperty:](HDSampleEntity, "disambiguatedSQLForProperty:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("((%@ = ?) AND (%@ = %ld)"), v12, v13, v8);

  v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataEntity, "disambiguatedDatabaseTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("INNER JOIN %@ USING(%@)"), v16, CFSTR("data_id"));

  objc_msgSend(v10, "restrictedSourceBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = a3;
  if (v18)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 120));
    objc_msgSend(WeakRetained, "sourceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "restrictedSourceBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allSourcesForBundleIdentifier:error:", v21, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v30 = 0;
      goto LABEL_13;
    }
    v51 = v10;
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDDataProvenanceEntity, "disambiguatedDatabaseTable");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("provenance"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0D29618];
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDDataProvenanceEntity, "disambiguatedSQLForProperty:", *MEMORY[0x1E0D29618]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendFormat:", CFSTR(" INNER JOIN %@ ON %@=%@"), v23, v24, v26);

    if (objc_msgSend(v22, "count"))
    {
      +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDDataProvenanceEntity, "disambiguatedSQLForProperty:", CFSTR("source_id"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "appendFormat:", CFSTR(" AND (%@ IN ("), v27);

      objc_msgSend(v14, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v22, &__block_literal_global_160);
      v28 = CFSTR("))");
    }
    else
    {
      v28 = CFSTR(" AND (1=0)");
    }
    v29 = off_1E6CE4000;
    objc_msgSend(v14, "appendString:", v28);

  }
  else
  {
    v51 = v10;
    v25 = *MEMORY[0x1E0D29618];
    v29 = off_1E6CE4000;
  }
  objc_msgSend(v14, "appendString:", CFSTR(")"));
  v31 = (void *)MEMORY[0x1E0CB3940];
  -[__objc2_class disambiguatedSQLForProperty:](v29[67], "disambiguatedSQLForProperty:", v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class disambiguatedSQLForProperty:](v29[67], "disambiguatedSQLForProperty:", CFSTR("data_type"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("uuid"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity disambiguatedSQLForProperty:](HDDataEntity, "disambiguatedSQLForProperty:", CFSTR("provenance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class disambiguatedDatabaseTable](v29[67], "disambiguatedDatabaseTable");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ %@ WHERE %@"), v20, v32, v33, v34, v35, v17, v14);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v51;
LABEL_13:

  if (!v30)
  {
LABEL_19:
    v42 = 0;
    v46 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v53, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = -1;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_2;
  v54[3] = &unk_1E6CFF040;
  v40 = *(void **)(a1 + 48);
  v54[4] = *(_QWORD *)(a1 + 40);
  v55 = v53;
  v56 = *(id *)(a1 + 32);
  v41 = v36;
  v57 = v41;
  v42 = v30;
  v58 = v42;
  v43 = v37;
  v59 = v43;
  v44 = v38;
  v60 = v44;
  v62 = &v63;
  v45 = v39;
  v61 = v45;
  v46 = objc_msgSend(v40, "hk_enumerateUUIDsWithError:block:", v52, v54);
  if ((v46 & 1) != 0 && objc_msgSend(*(id *)(a1 + 32), "notifyObservers"))
  {
    v47 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v45, "allObjects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v64[3]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v47, v48, v44, 0, v49);

  }
  _Block_object_dispose(&v63, 8);

LABEL_20:
  return v46;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  HDDataEntityDeletionContext *v7;
  id WeakRetained;
  HDDataEntityDeletionContext *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  HDDataEntityDeletionContext *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  void *v27;
  HDDataEntityDeletionContext *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v6 = a2;
  v7 = [HDDataEntityDeletionContext alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v9 = -[HDDataEntityDeletionContext initWithProfile:transaction:](v7, "initWithProfile:transaction:", WeakRetained, *(_QWORD *)(a1 + 40));

  -[HDDataEntityDeletionContext setInsertDeletedObjects:](v9, "setInsertDeletedObjects:", objc_msgSend(*(id *)(a1 + 48), "generateDeletedObjects"));
  -[HDDataEntityDeletionContext setPreserveExactStartAndEndDates:](v9, "setPreserveExactStartAndEndDates:", objc_msgSend(*(id *)(a1 + 48), "preserveExactStartAndEndDates"));
  objc_msgSend(*(id *)(a1 + 48), "recursiveDeleteAuthorizationBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataEntityDeletionContext setRecursiveDeleteAuthorizationBlock:](v9, "setRecursiveDeleteAuthorizationBlock:", v10);

  v11 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_3;
  v31[3] = &unk_1E6CE9508;
  v14 = v6;
  v32 = v14;
  v24 = v13;
  v25 = 3221225472;
  v26 = __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_4;
  v27 = &unk_1E6CF16E0;
  v15 = v9;
  v28 = v15;
  v29 = *(id *)(a1 + 72);
  v30 = *(id *)(a1 + 80);
  LODWORD(v11) = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", v12, a4, v31, &v24);
  -[HDDataEntityDeletionContext finish](v15, "finish", v24, v25, v26, v27);
  if (!(_DWORD)v11)
    goto LABEL_5;
  if (!-[HDDataEntityDeletionContext deletedObjectCount](v15, "deletedObjectCount")
    && objc_msgSend(*(id *)(a1 + 48), "failIfNotFound"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 3, CFSTR("Failed to find some objects for deletion."));
LABEL_5:
    v16 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "notifyObservers"))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    -[HDDataEntityDeletionContext lastInsertedDeletedObjectPersistentID](v15, "lastInsertedDeletedObjectPersistentID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "longLongValue");

    if (v17 <= v19)
      v20 = v19;
    else
      v20 = v17;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v20;
    v21 = *(void **)(a1 + 88);
    -[HDDataEntityDeletionContext deletedObjectTypeSet](v15, "deletedObjectTypeSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unionSet:", v22);

  }
  v16 = 1;
LABEL_12:

  return v16;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_3()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = HDSQLiteColumnAsInt64();
  v7 = 1;
  objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", HDSQLiteColumnAsInt64());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)objc_msgSend(v8, "dataObjectClass"), "hd_dataEntityClass");
  if (v9)
  {
    v10 = v9;
    MEMORY[0x1BCCAB1E0](a2, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1BCCAB1C8](a2, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 32), "deleteObjectWithPersistentID:objectUUID:entityClass:objectType:provenanceIdentifier:deletionDate:deletedSampleIntervals:error:", v6, v11, v10, v8, v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);

  }
  return v7;
}

uint64_t __69__HDDataManager_deleteObjectsWithUUIDCollection_configuration_error___block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _HDDataManagerDeletionJournalEntry *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;

  v5 = -[_HDDataManagerDeletionJournalEntry initWithConfiguration:objectUUIDs:]([_HDDataManagerDeletionJournalEntry alloc], "initWithConfiguration:objectUUIDs:", a1[4], a1[5]);
  WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 120));
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "addJournalEntry:error:", v5, a3);

  return v8;
}

uint64_t __84__HDDataManager__deleteDataObjectsByUUIDSQLStringForConfiguration_entityType_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), objc_msgSend(a2, "persistentID"));
}

- (BOOL)deleteDataObjects:(id)a3 restrictedSourceEntities:(id)a4 failIfNotFound:(BOOL)a5 recursiveDeleteAuthorizationBlock:(id)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  id v16;
  id v17;
  void *v18;
  char v19;
  _QWORD v21[4];
  id v22;
  HDDataManager *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__132;
  v30 = __Block_byref_object_dispose__132;
  v31 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __115__HDDataManager_deleteDataObjects_restrictedSourceEntities_failIfNotFound_recursiveDeleteAuthorizationBlock_error___block_invoke;
  v21[3] = &unk_1E6CFF0D0;
  v24 = &v32;
  v25 = &v26;
  v16 = v12;
  v22 = v16;
  v23 = self;
  +[HDDataEntity deleteDataObjects:restrictedSourceEntities:failIfNotFound:profile:recursiveDeleteAuthorizationBlock:completionHandler:](HDDataEntity, "deleteDataObjects:restrictedSourceEntities:failIfNotFound:profile:recursiveDeleteAuthorizationBlock:completionHandler:", v16, v13, v9, WeakRetained, v14, v21);

  v17 = (id)v27[5];
  v18 = v17;
  if (v17)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v17);
    else
      _HKLogDroppedError();
  }

  v19 = *((_BYTE *)v33 + 24);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v19;
}

void __115__HDDataManager_deleteDataObjects_restrictedSourceEntities_failIfNotFound_recursiveDeleteAuthorizationBlock_error___block_invoke(_QWORD *a1, int a2, int a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a4;
  v11 = a5;
  v12 = a6;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a6);
  objc_msgSend(MEMORY[0x1E0CB6AD8], "hd_sampleTypesForObjects:", a1[4]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a2 && a3 && objc_msgSend(v13, "count"))
  {
    v15 = a1[5];
    objc_msgSend(v14, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v15, v16, v11, 0, v17);

  }
}

- (BOOL)deleteDataObjectsOfClass:(Class)a3 predicate:(id)a4 limit:(unint64_t)a5 deletedSampleCount:(unint64_t *)a6 notifyObservers:(BOOL)a7 generateDeletedObjects:(BOOL)a8 userRequested:(BOOL)a9 recursiveDeleteAuthorizationBlock:(id)a10 error:(id *)a11
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  id v22;
  id v23;
  char v24;
  void *v26;
  _QWORD v30[4];
  id v31;
  HDDataManager *v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  Class v37;
  unint64_t v38;
  unint64_t *v39;
  BOOL v40;
  BOOL v41;
  BOOL v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;

  v15 = a4;
  v16 = a10;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 796, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate != nil"));

  }
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__132;
  v47[4] = __Block_byref_object_dispose__132;
  v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__132;
  v45[4] = __Block_byref_object_dispose__132;
  v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__132;
  v43[4] = __Block_byref_object_dispose__132;
  v44 = 0;
  v17 = (void *)MEMORY[0x1E0D29840];
  HDDataEntityPredicateForType(-[objc_class preferredEntityType](a3, "preferredEntityType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "compoundPredicateWithPredicate:otherPredicate:", v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke;
  v30[3] = &unk_1E6CFF120;
  v37 = a3;
  v22 = v19;
  v38 = a5;
  v40 = a8;
  v31 = v22;
  v32 = self;
  v23 = v16;
  v33 = v23;
  v34 = v47;
  v39 = a6;
  v35 = v45;
  v36 = v43;
  v41 = a7;
  v42 = a9;
  v24 = -[objc_class performWriteTransactionWithHealthDatabase:error:block:](a3, "performWriteTransactionWithHealthDatabase:error:block:", v21, a11, v30);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  _Block_object_dispose(v47, 8);
  return v24;
}

BOOL __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _BOOL8 v16;
  _QWORD v18[5];
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v5 = a2;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__132;
  v27 = __Block_byref_object_dispose__132;
  v28 = 0;
  v6 = (void *)objc_msgSend(*(id *)(a1 + 80), "_entityClassForDeletion");
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(unsigned __int8 *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 120));
  v11 = *(_QWORD *)(a1 + 48);
  v18[1] = 3221225472;
  v18[2] = __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke_2;
  v18[3] = &unk_1E6CFF0F8;
  v18[4] = &v29;
  v12 = *(_QWORD *)(a1 + 96);
  v21 = &v23;
  v22 = v12;
  v19 = *(_OWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 72);
  v18[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v6, "deleteSamplesWithPredicate:limit:generateDeletedObjects:transaction:profile:recursiveDeleteAuthorizationBlock:completionHandler:", v9, v7, v8, v5, WeakRetained, v11, v18);

  if (!*((_BYTE *)v30 + 24))
  {
    v15 = (id)v24[5];
    v14 = v15;
    if (v15)
    {
      if (a3)
      {
        v14 = objc_retainAutorelease(v15);
        *a3 = v14;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 105))
  {
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "allObjects");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v13, v14, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_BYTE *)(a1 + 106), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
LABEL_9:

    v16 = *((_BYTE *)v30 + 24) != 0;
    goto LABEL_10;
  }
  v16 = 1;
LABEL_10:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v16;
}

void __170__HDDataManager_deleteDataObjectsOfClass_predicate_limit_deletedSampleCount_notifyObservers_generateDeletedObjects_userRequested_recursiveDeleteAuthorizationBlock_error___block_invoke_2(_QWORD *a1, char a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  v17 = (_QWORD *)a1[9];
  if (v17)
    *v17 = a4;
  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v14;
  v20 = v14;

  v21 = *(_QWORD *)(a1[7] + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v15;
  v23 = v15;

  v24 = *(_QWORD *)(a1[8] + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v16;

}

- (BOOL)deleteSamplesWithTypes:(id)a3 sourceBundleIdentifier:(id)a4 userRequested:(BOOL)a5 recursiveDeleteAuthorizationBlock:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;

  v13 = a3;
  v14 = a6;
  v15 = a4;
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 852, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[sampleTypes count] > 0"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allSourcesForBundleIdentifier:error:", v15, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = -[HDDataManager _deleteObjectsWithTypes:sourceEntities:recursiveDeleteAuthorizationBlock:userRequested:error:]((uint64_t)self, v16, v19, v14, a5, a7);
  else
    v20 = 0;

  return v20;
}

- (BOOL)_deleteObjectsWithTypes:(void *)a3 sourceEntities:(void *)a4 recursiveDeleteAuthorizationBlock:(char)a5 userRequested:(_QWORD *)a6 error:
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  id v18;
  id v19;
  void *v20;
  _BOOL8 v21;
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  if (a1)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__132;
    v32 = __Block_byref_object_dispose__132;
    v33 = 0;
    _HKInitializeLogging();
    v14 = (id)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134218242;
      v39 = v15;
      v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Deleting %lu object types for sources: %@", buf, 0x16u);
    }

    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1, CFSTR("DeleteObjectsForSources"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __110__HDDataManager__deleteObjectsWithTypes_sourceEntities_recursiveDeleteAuthorizationBlock_userRequested_error___block_invoke;
    v23[3] = &unk_1E6CFF170;
    v26 = &v28;
    v25 = &v34;
    v23[4] = a1;
    v27 = a5;
    v18 = v16;
    v24 = v18;
    +[HDSampleEntity deleteSamplesWithTypes:sourceEntities:profile:recursiveDeleteAuthorizationBlock:completionHandler:](HDSampleEntity, "deleteSamplesWithTypes:sourceEntities:profile:recursiveDeleteAuthorizationBlock:completionHandler:", v11, v12, WeakRetained, v13, v23);

    v19 = (id)v29[5];
    v20 = v19;
    if (v19)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

    v21 = *((_BYTE *)v35 + 24) != 0;
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)deleteSamplesWithTypes:(id)a3 sourceEntities:(id)a4 recursiveDeleteAuthorizationBlock:(id)a5 error:(id *)a6
{
  return -[HDDataManager _deleteObjectsWithTypes:sourceEntities:recursiveDeleteAuthorizationBlock:userRequested:error:]((uint64_t)self, a3, a4, a5, 0, a6);
}

- (BOOL)deleteSamplesWithSourceEntities:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[HDDataManager _deleteObjectsWithTypes:sourceEntities:recursiveDeleteAuthorizationBlock:userRequested:error:]((uint64_t)self, 0, v6, 0, 0, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Must provide at least one source entity for deletion."));
    v7 = 0;
  }

  return v7;
}

- (BOOL)deleteSamplesWithUUIDs:(id)a3 userRequested:(BOOL)a4 recursiveDeleteAuthorizationBlock:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v17;
  uint64_t v18;

  v11 = a5;
  v12 = a3;
  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 901, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uuids count] > 0"));

  }
  v13 = objc_opt_class();
  HDDataEntityPredicateForDataUUIDs(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v18) = a4;
  v15 = -[HDDataManager deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:](self, "deleteDataObjectsOfClass:predicate:limit:deletedSampleCount:notifyObservers:generateDeletedObjects:userRequested:recursiveDeleteAuthorizationBlock:error:", v13, v14, 0, 0, 1, 1, v18, v11, a6);

  return v15;
}

- (BOOL)deleteSamplesWithUUIDs:(id)a3 generateDeletedObjects:(BOOL)a4 transaction:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  id v15;
  void *v16;
  char v17;
  void *v19;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  if (!objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[uuids count] > 0"));

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__132;
  v25 = __Block_byref_object_dispose__132;
  v26 = 0;
  HDDataEntityPredicateForDataUUIDs(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  v20[1] = 3221225472;
  v20[2] = __81__HDDataManager_deleteSamplesWithUUIDs_generateDeletedObjects_transaction_error___block_invoke;
  v20[3] = &unk_1E6CFF148;
  v20[5] = &v27;
  v20[6] = &v21;
  v20[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  +[HDSampleEntity deleteSamplesWithPredicate:limit:generateDeletedObjects:transaction:profile:recursiveDeleteAuthorizationBlock:completionHandler:](HDSampleEntity, "deleteSamplesWithPredicate:limit:generateDeletedObjects:transaction:profile:recursiveDeleteAuthorizationBlock:completionHandler:", v13, 0, v8, v12, WeakRetained, 0, v20);

  v15 = (id)v22[5];
  v16 = v15;
  if (v15)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();
  }

  v17 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __81__HDDataManager_deleteSamplesWithUUIDs_generateDeletedObjects_transaction_error___block_invoke(_QWORD *a1, int a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a7);
  if (a2)
  {
    v15 = objc_msgSend(v12, "count");
    if (v18)
    {
      if (v15)
      {
        v16 = a1[4];
        objc_msgSend(v12, "allObjects");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v16, v17, v13, 0, v18);

      }
    }
  }

}

void __110__HDDataManager__deleteObjectsWithTypes_sourceEntities_recursiveDeleteAuthorizationBlock_userRequested_error___block_invoke(uint64_t a1, char a2, int a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a7);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v16 = a3 == 0;
  else
    v16 = 1;
  if (!v16 && objc_msgSend(v13, "count"))
  {
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDataManager _shouldNotifyForDeletedSamplesOfTypes:intervals:userRequested:anchor:](v17, v18, v14, *(_BYTE *)(a1 + 64), v19);

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (BOOL)containsDataObject:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__HDDataManager_containsDataObject___block_invoke;
  v9[3] = &unk_1E6CE8D70;
  v7 = v4;
  v10 = v7;
  v11 = &v12;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v6, 0, v9);

  LOBYTE(WeakRetained) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)WeakRetained;
}

uint64_t __36__HDDataManager_containsDataObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDataEntity anyInDatabase:predicate:error:](HDSampleEntity, "anyInDatabase:predicate:error:", v5, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8 != 0;
  return 1;
}

- (int64_t)hasSampleWithBundleIdentifier:(id)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int64_t v13;

  p_profile = &self->_profile;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allSourcesForBundleIdentifier:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "hk_map:", &__block_literal_global_275);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)p_profile);
    +[HDDataProvenanceEntity sourceIDsWithProvenanceFromSourceIDs:profile:error:](HDDataProvenanceEntity, "sourceIDsWithProvenanceFromSourceIDs:profile:error:", v10, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (objc_msgSend(v12, "count"))
        v13 = 1;
      else
        v13 = 2;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __53__HDDataManager_hasSampleWithBundleIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

- (void)addObserverForAllTypes:(id)a3
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
  block[2] = __40__HDDataManager_addObserverForAllTypes___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __40__HDDataManager_addObserverForAllTypes___block_invoke(uint64_t a1)
{
  id v2;

  -[HDDataManager _queue_observersAllTypesCreateIfNil:](*(_QWORD *)(a1 + 32), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (id)_queue_observersAllTypesCreateIfNil:(uint64_t)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDataManager _queue_observersForKey:createIfNil:](a1, v4, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)removeObserverForAllTypes:(id)a3
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
  block[2] = __43__HDDataManager_removeObserverForAllTypes___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __43__HDDataManager_removeObserverForAllTypes___block_invoke(uint64_t a1)
{
  id v2;

  -[HDDataManager _queue_observersAllTypesCreateIfNil:](*(_QWORD *)(a1 + 32), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (id)_synchronousObserverLock_synchronousObserverSetForSampleType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__synchronousObserverLock_synchronousObserverSetForSampleType_, a1, CFSTR("HDDataManager.m"), 1085, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleType"));

    }
    v4 = *(void **)(a1 + 40);
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _HKInitializeLogging();
      v8 = objc_alloc(MEMORY[0x1E0CB6CA8]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("data-observers-synchronous-%@"), v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "initWithName:loggingCategory:", v9, *MEMORY[0x1E0CB52B0]);

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_synchronousObserverLock_hasSynchronousObserverForSampleType:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v7;

  v3 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__synchronousObserverLock_hasSynchronousObserverForSampleType_, a1, CFSTR("HDDataManager.m"), 1104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleType"));

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5 != 0;
}

- (void)addSynchronousObserver:(id)a3 forSampleType:(id)a4
{
  id v7;
  os_unfair_lock_s *p_synchronousObserverLock;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 1111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleType"));

  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  p_synchronousObserverLock = &self->_synchronousObserverLock;
  os_unfair_lock_lock(&self->_synchronousObserverLock);
  -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:]((uint64_t)self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerObserver:", v12);
  os_unfair_lock_unlock(p_synchronousObserverLock);

}

- (void)removeSynchronousObserver:(id)a3 forSampleType:(id)a4
{
  id v7;
  os_unfair_lock_s *p_synchronousObserverLock;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 1122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleType"));

  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataManager.m"), 1123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  p_synchronousObserverLock = &self->_synchronousObserverLock;
  os_unfair_lock_lock(&self->_synchronousObserverLock);
  -[HDDataManager _synchronousObserverLock_synchronousObserverSetForSampleType:]((uint64_t)self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unregisterObserver:", v12);
  os_unfair_lock_unlock(p_synchronousObserverLock);

}

void __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 48);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1[4] + 64);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1[4] + 64), "objectForKeyedSubscript:", v8, (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v9, "copy");
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v2;
    v13 = v2;

    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 72));
    *(_BYTE *)(a1[4] + 48) = 0;

  }
}

void __68__HDDataManager__notifySynchronousObserversIfPossibleInTransaction___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  void *v6;

  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v3, "samplesAdded:anchor:", a1[4]);
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  v4 = objc_opt_respondsToSelector();
  v5 = v6;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "samplesJournaled:type:", a1[4], a1[5]);
    goto LABEL_5;
  }
LABEL_6:

}

void __85__HDDataManager__notifySynchronousObserversForDeletedObjectTypes_anchor_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "samplesOfTypesWereRemoved:anchor:", v4, *(_QWORD *)(a1 + 40));

  }
}

- (void)synchronouslyCloseObserverTransactionAndNotify
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_notificationQueue);
  -[HDDataManager closeObserverTransaction](self, "closeObserverTransaction");
  dispatch_sync((dispatch_queue_t)self->_notificationQueue, &__block_literal_global_293);
}

- (void)setBackgroundObserverFrequency:(id)a3 forDataType:(id)a4 frequency:(int64_t)a5 appSDKVersionToken:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  void *v16;
  HDProfile **p_profile;
  id WeakRetained;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  id *location;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  _QWORD v47[3];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(_QWORD))a7;
  objc_msgSend(v12, "process");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applicationIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    p_profile = &self->_profile;
    WeakRetained = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(WeakRetained, "daemon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "behavior");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v13, "clampedBackgroundObservationFrequency:isAppleWatch:", a5, objc_msgSend(v20, "isAppleWatch"));

    location = (id *)p_profile;
    switch(v21)
    {
      case 0:
        goto LABEL_9;
      case 1:
        goto LABEL_14;
      case 2:
        v21 = 3600;
        goto LABEL_14;
      case 3:
        v21 = 86400;
        goto LABEL_14;
      case 4:
        v21 = 604800;
LABEL_14:
        v31 = objc_msgSend(v13, "code", a6);
        v32 = kHDEventNameBGDelivery;
        v48[0] = CFSTR("subscribe");
        v47[0] = CFSTR("action");
        v47[1] = CFSTR("frequency");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v33;
        v47[2] = CFSTR("code");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        HDPowerLogForClient(v32, v12, v35);

        _HKInitializeLogging();
        v36 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218498;
          v42 = v31;
          v43 = 2112;
          v44 = v16;
          v45 = 2048;
          v46 = v21;
          _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_INFO, "Requesting to set background delivery frequency of %lu for '%@' to %llu seconds", buf, 0x20u);
        }
        v23 = objc_loadWeakRetained(location);
        objc_msgSend(v23, "appSubscriptionManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "subscribeForBundleID:dataCode:frequencyInSeconds:appSDKVersionToken:", v16, objc_msgSend(v13, "code"), v21, v37);
        break;
      default:
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v42 = v21;
          _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "invalid update frequency %ld", buf, 0xCu);
        }
LABEL_9:
        v26 = objc_msgSend(v13, "code");
        v27 = kHDEventNameBGDelivery;
        v39[0] = CFSTR("action");
        v39[1] = CFSTR("code");
        v40[0] = CFSTR("removeSubscription");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HDPowerLogForClient(v27, v12, v29);

        _HKInitializeLogging();
        v30 = *MEMORY[0x1E0CB5288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          v42 = v26;
          v43 = 2112;
          v44 = v16;
          _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_INFO, "Disabling background delivery of %lu for '%@'", buf, 0x16u);
        }
        v23 = objc_loadWeakRetained(location);
        objc_msgSend(v23, "appSubscriptionManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeSubscriptionForBundleID:dataCode:", v16, v26);
        break;
    }
  }
  else
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E0CB5288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5288], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = (uint64_t)v16;
      _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_INFO, "Disabling all background delivery for '%@'", buf, 0xCu);
    }
    v23 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v23, "appSubscriptionManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeBundleID:", v16);
  }

  if (v14)
    v14[2](v14);

}

- (id)diagnosticDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  uint64_t v38;
  uint64_t v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSMutableDictionary copy](self->_observersByDataType, "copy");
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_msgSend(v2, "count");
  v5 = &stru_1E6D11BB8;
  if (!v4)
    v5 = CFSTR("none");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nObservers: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v2;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v7)
  {
    v8 = v7;
    v38 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v54 != v38)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1BCCACAC4]();
        v12 = objc_msgSend(v10, "integerValue");
        if (v12 == -1)
        {
          v14 = CFSTR("AllTypes");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(obj, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ %ld (%lu):"), v14, v12, objc_msgSend(v15, "count"));
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v50 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v6, "appendFormat:", CFSTR("\n\t\t%@"), *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
          }
          while (v18);
        }

        objc_autoreleasePoolPop(v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_synchronousObserverLock);
  v21 = (void *)-[NSMutableDictionary copy](self->_synchronousObserversBySampleType, "copy");
  os_unfair_lock_unlock(&self->_synchronousObserverLock);
  v22 = objc_msgSend(v21, "count");
  v23 = &stru_1E6D11BB8;
  if (!v22)
    v23 = CFSTR("none");
  objc_msgSend(v6, "appendFormat:", CFSTR("\n\nSynchronous Observers: %@"), v23);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v24 = v21;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v25)
  {
    v26 = v25;
    v39 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v24, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@ %ld (%lu):"), v30, objc_msgSend(v28, "code"), objc_msgSend(v29, "count"));

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v29, "allObservers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v42;
          do
          {
            for (m = 0; m != v33; ++m)
            {
              if (*(_QWORD *)v42 != v34)
                objc_enumerationMutation(v31);
              objc_msgSend(v6, "appendFormat:", CFSTR("\n\t\t%@"), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * m));
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
          }
          while (v33);
        }

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v26);
  }

  return v6;
}

- (HDQuantitySeriesManager)quantitySeriesManager
{
  return self->_quantitySeriesManager;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_quantitySeriesManager, 0);
  objc_storeStrong((id *)&self->_lastAnchor, 0);
  objc_storeStrong((id *)&self->_pendingObjectsBySampleType, 0);
  objc_storeStrong((id *)&self->_synchronousObserversBySampleType, 0);
  objc_storeStrong((id *)&self->_observersByDataType, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
