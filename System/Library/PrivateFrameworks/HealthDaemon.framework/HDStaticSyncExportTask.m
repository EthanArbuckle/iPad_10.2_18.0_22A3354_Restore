@implementation HDStaticSyncExportTask

- (HDStaticSyncExportTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5 URL:(id)a6 batchSize:(unint64_t)a7
{
  id v13;
  HDStaticSyncExportTask *v14;
  uint64_t v15;
  OS_dispatch_queue *exportQueue;
  objc_super v18;

  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDStaticSyncExportTask;
  v14 = -[HDStaticSyncTask initWithProfile:options:storeIdentifier:](&v18, sel_initWithProfile_options_storeIdentifier_, a3, a4, a5);
  if (v14)
  {
    HKCreateSerialDispatchQueue();
    v15 = objc_claimAutoreleasedReturnValue();
    exportQueue = v14->_exportQueue;
    v14->_exportQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v14->_exportDirectoryURL, a6);
    v14->_batchSize = a7;
  }

  return v14;
}

- (id)runWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSUUID *v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  HDStaticSyncExportTask *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSUUID *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    if (self)
      v7 = self->super._storeIdentifier;
    else
      v7 = 0;
    v8 = v6;
    HKStaticSyncOptionsToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = self;
    v21 = 2080;
    v22 = "-[HDStaticSyncExportTask runWithCompletion:]";
    v23 = 2114;
    v24 = v7;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "%{public}@: %s: storeIdentifier = %{public}@, options = %{public}@", buf, 0x2Au);

  }
  if (self)
    queue = self->super._queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HDStaticSyncExportTask_runWithCompletion___block_invoke;
  block[3] = &unk_1E6CECC58;
  block[4] = self;
  v18 = v4;
  v11 = v5;
  v17 = v11;
  v12 = v4;
  dispatch_async(queue, block);
  v13 = v17;
  v14 = v11;

  return v14;
}

void __44__HDStaticSyncExportTask_runWithCompletion___block_invoke(uint64_t a1)
{
  _HDStaticSyncStore *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;
  id *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  HDSyncAnchorMap *v10;
  id *v11;
  _HDStaticSyncSession *v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  os_log_t *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id *v29;
  os_log_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD block[7];
  id v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[24];
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__49;
  v42 = __Block_byref_object_dispose__49;
  v43 = 0;
  v2 = [_HDStaticSyncStore alloc];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v3 = *(_QWORD *)(v3 + 24);
  }
  else
  {
    WeakRetained = 0;
  }
  v5 = (id)v3;
  v6 = (id *)(v39 + 5);
  obj = (id)v39[5];
  v7 = -[_HDStaticSyncStore initWithProfile:storeIdentifier:error:](v2, "initWithProfile:storeIdentifier:error:", WeakRetained, v5, &obj);
  objc_storeStrong(v6, obj);

  if (!v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_33;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (!v8 || (v9 = *(_QWORD *)(v8 + 16), (v9 & 1) == 0))
  {
    v10 = objc_alloc_init(HDSyncAnchorMap);
    v11 = (id *)(v39 + 5);
    v36 = (id)v39[5];
    v12 = v10;
    v13 = objc_loadWeakRetained(v7 + 2);
    v14 = +[HDSyncAnchorEntity setAcknowledgedAnchorsWithMap:store:resetNext:resetInvalid:profile:error:](HDSyncAnchorEntity, "setAcknowledgedAnchorsWithMap:store:resetNext:resetInvalid:profile:error:", v12, v7, 1, 1, v13, &v36);

    objc_storeStrong(v11, v36);
    if (!v14)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_32:

      goto LABEL_33;
    }

    v8 = *(_QWORD *)(a1 + 32);
    if (!v8)
    {
LABEL_21:
      objc_storeStrong((id *)(v8 + 64), *(id *)(a1 + 40));
      v12 = -[HDSyncSession initWithSyncStore:reason:delegate:]([_HDStaticSyncSession alloc], "initWithSyncStore:reason:delegate:", v7, CFSTR("Static Sync"), *(_QWORD *)(a1 + 32));
      -[HDSyncSession setDatabaseAccessibilityTimeout:](v12, "setDatabaseAccessibilityTimeout:", 300.0);
      _HKInitializeLogging();
      v21 = (os_log_t *)MEMORY[0x1E0CB5370];
      v22 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        v23 = v22;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = *(_QWORD *)(a1 + 32);
          -[HDSyncSession syncStore](v12, "syncStore");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v50 = 138543618;
          *(_QWORD *)&v50[4] = v24;
          *(_WORD *)&v50[12] = 2114;
          *(_QWORD *)&v50[14] = v25;
          _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_INFO, "%{public}@: start performSyncSession: %{public}@", v50, 0x16u);

        }
      }
      v26 = *(_QWORD *)(a1 + 32);
      if (v26)
        v27 = objc_loadWeakRetained((id *)(v26 + 8));
      else
        v27 = 0;
      objc_msgSend(v27, "syncEngine");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (id *)(v39 + 5);
      v34 = (id)v39[5];
      objc_msgSend(v28, "performSyncSession:accessibilityAssertion:error:", v12, 0, &v34);
      objc_storeStrong(v29, v34);

      _HKInitializeLogging();
      v30 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
      {
        v31 = v30;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = *(_QWORD *)(a1 + 32);
          -[HDSyncSession syncStore](v12, "syncStore");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v50 = 138543618;
          *(_QWORD *)&v50[4] = v32;
          *(_WORD *)&v50[12] = 2114;
          *(_QWORD *)&v50[14] = v33;
          _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_INFO, "%{public}@: finshed performSyncSession: %{public}@", v50, 0x16u);

        }
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_32;
    }
    v9 = *(_QWORD *)(v8 + 16);
  }
  if ((v9 & 2) == 0)
    goto LABEL_21;
  *(_QWORD *)v50 = 0;
  *(_QWORD *)&v50[8] = v50;
  *(_QWORD *)&v50[16] = 0x2020000000;
  v51 = 1;
  v15 = *(NSObject **)(v8 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HDStaticSyncExportTask_runWithCompletion___block_invoke_207;
  block[3] = &unk_1E6CF1308;
  block[4] = v8;
  block[5] = &v38;
  block[6] = v50;
  dispatch_sync(v15, block);
  v16 = *(unsigned __int8 *)(*(_QWORD *)&v50[8] + 24);
  if (*(_BYTE *)(*(_QWORD *)&v50[8] + 24))
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(v19 + 112), "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v19;
        v46 = 2114;
        v47 = v7;
        v48 = 2114;
        v49 = v20;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: export static sync data to %{public}@", buf, 0x20u);

      }
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  _Block_object_dispose(v50, 8);
  if (v16)
  {
    v8 = *(_QWORD *)(a1 + 32);
    goto LABEL_21;
  }
LABEL_33:

  _Block_object_dispose(&v38, 8);
}

void __44__HDStaticSyncExportTask_runWithCompletion___block_invoke_207(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id obj;

  *(_BYTE *)(a1[4] + 48) = 1;
  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  v4 = *(void **)(v2 + 112);
  v5 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  obj = v7;
  v8 = v3;
  v9 = v4;
  objc_opt_self();
  v10 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v11 = v9;
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(v10, "temporaryDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("staticSync-%@"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeItemAtURL:error:", v14, 0);
  v15 = 0;
  if (objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &obj))v15 = v14;

  objc_storeStrong(v6, obj);
  v16 = a1[4];
  v17 = *(void **)(v16 + 112);
  *(_QWORD *)(v16 + 112) = v15;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 112) != 0;
}

uint64_t __82__HDStaticSyncExportTask__estimateSyncEntityClassesWithChangesForSession_profile___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1[4], "syncStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSyncEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v22 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v22)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "syncEntityIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "syncStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = +[HDSyncAnchorEntity syncAnchorOfType:entityIdentifier:store:profile:error:](HDSyncAnchorEntity, "syncAnchorOfType:entityIdentifier:store:profile:error:", 0, v11, v12, a1[5], a3);

        v14 = a1[4];
        v15 = a1[5];
        v16 = v14;
        objc_opt_self();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v17 = objc_msgSend(v10, "nextSyncAnchorWithSession:startSyncAnchor:profile:error:", v16, v13, v15, a3);
        else
          v17 = objc_msgSend(v10, "nextSyncAnchorWithSession:predicate:startSyncAnchor:profile:error:", v16, 0, v13, v15, a3);
        v18 = v17;

        if (v13 < 0 || v18 < 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Invalid anchor(s) (%lld, %lld) for %@"), v13, v18, v10);
          v19 = 0;
          goto LABEL_17;
        }
        if (v18 != v13)
          objc_msgSend(a1[6], "addObject:", v10);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_17:

  return v19;
}

- (void)syncSessionWillBegin:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *exportQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  HDStaticSyncExportTask *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "syncStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2080;
    v15 = "-[HDStaticSyncExportTask syncSessionWillBegin:]";
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@", buf, 0x20u);

  }
  exportQueue = self->_exportQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__HDStaticSyncExportTask_syncSessionWillBegin___block_invoke;
  v10[3] = &unk_1E6CE8080;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(exportQueue, v10);

}

void __47__HDStaticSyncExportTask_syncSessionWillBegin___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    *(_QWORD *)(v2 + 96) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = 0;
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    if (!v2)
    {
      WeakRetained = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v3 = *(void **)(a1 + 40);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
LABEL_6:
  v5 = v3;
  v6 = WeakRetained;
  v7 = objc_opt_self();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__HDStaticSyncExportTask__estimateSyncEntityClassesWithChangesForSession_profile___block_invoke;
  v24[3] = &unk_1E6CE7C58;
  v10 = v5;
  v25 = v10;
  v11 = v6;
  v26 = v11;
  v28 = v7;
  v12 = v8;
  v27 = v12;
  v13 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDDataEntity, "performReadTransactionWithHealthDatabase:error:block:", v9, &v29, v24);
  v14 = v29;

  if (v13)
  {
    v23 = v12;
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v7;
      v32 = 2114;
      v33 = v14;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: error estimating (for progress reporting) sync entity classes with changes to sync: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v10, "syncStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "orderedSyncEntities");
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", objc_msgSend(v23, "count"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "totalUnitCount"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 72);
  *(_QWORD *)(v18 + 72) = v17;

  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 80);
  *(_QWORD *)(v21 + 80) = v20;

}

- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *exportQueue;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  HDStaticSyncExportTask *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend(v8, "syncStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2080;
    v25 = "-[HDStaticSyncExportTask syncSession:sendChanges:completion:]";
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@", buf, 0x20u);

  }
  exportQueue = self->_exportQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__HDStaticSyncExportTask_syncSession_sendChanges_completion___block_invoke;
  v18[3] = &unk_1E6CE7E08;
  v18[4] = self;
  v19 = v9;
  v20 = v8;
  v21 = v10;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  dispatch_async(exportQueue, v18);

}

void __61__HDStaticSyncExportTask_syncSession_sendChanges_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
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
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  HDSyncAnchorRangeMap *v39;
  HDSyncAnchorRangeMap *v40;
  uint64_t v41;
  uint64_t v42;
  char **v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HDSyncAnchorRangeMap *v50;
  id v51;
  void *v52;
  BOOL v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  void (*v83)(void);
  char *v84;
  HDSyncAnchorRangeMap *v85;
  id obj;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t v92[128];
  _BYTE buf[22];
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    v3 = *(void **)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    v5 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 40));
    if (!*(_QWORD *)(v2 + 88))
    {
      *(_QWORD *)(v2 + 96) = 0;
      v6 = *(void **)(v2 + 112);
      v7 = *(_QWORD *)(v2 + 104);
      v8 = v5;
      v9 = v6;
      objc_opt_self();
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "sessionUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "stringWithFormat:", CFSTR("syncarchive-%@-%llu"), v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "URLByAppendingPathComponent:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "URLByAppendingPathExtension:", CFSTR("zip"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F08]), "initWithURL:archiveType:", v14, 0);
      v16 = *(void **)(v2 + 88);
      *(_QWORD *)(v2 + 88) = v15;

      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        objc_msgSend(v8, "syncStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v2 + 88), "archiveURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v19;
        v94 = 2114;
        v95 = v21;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: create archive %{public}@", buf, 0x20u);

      }
    }
    v22 = *(void **)(v2 + 88);
    v23 = v4;
    objc_opt_self();
    +[HDCodableStaticSyncChangeSet changeSetWithChanges:](HDCodableStaticSyncChangeSet, "changeSetWithChanges:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "data");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *(_QWORD *)(v2 + 96);
    objc_opt_self();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("/changeset-%04llu"), v26);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "addDataToArchive:pathInArchive:", v25, v28);
    ++*(_QWORD *)(v2 + 96);
    if (*(_QWORD *)(v2 + 56))
    {
      v29 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      objc_msgSend(*(id *)(v2 + 88), "archiveURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      objc_msgSend(v29, "attributesOfItemAtPath:error:", v31, buf);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(id *)buf;

      if (v32)
      {
        if ((unint64_t)objc_msgSend(v32, "fileSize") <= *(_QWORD *)(v2 + 56))
        {
          v35 = 0;
          v36 = 1;
        }
        else
        {
          objc_msgSend(*(id *)(v2 + 88), "closeArchive");
          v34 = *(void **)(v2 + 88);
          *(_QWORD *)(v2 + 88) = 0;

          v35 = 0;
          ++*(_QWORD *)(v2 + 104);
          v36 = 2;
        }
      }
      else
      {
        v37 = v33;
        v35 = v37;
        if (v37)
          v38 = objc_retainAutorelease(v37);

        v36 = 0;
      }

    }
    else
    {
      v35 = 0;
      v36 = 1;
    }

    v39 = v35;
    v40 = v39;
    if (!v36)
    {
      v83 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_48;
    }

  }
  v40 = objc_alloc_init(HDSyncAnchorRangeMap);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = *(id *)(a1 + 40);
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
  if (!v41)
    goto LABEL_43;
  v42 = v41;
  v43 = &selRef_setCanRepromptOnSameBuild_;
  v87 = *(_QWORD *)v89;
  v85 = v40;
  while (2)
  {
    v44 = 0;
    v84 = v43[419];
    do
    {
      if (*(_QWORD *)v89 != v87)
        objc_enumerationMutation(obj);
      v45 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v44);
      v46 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      objc_msgSend(v45, "syncEntityIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v46) = objc_msgSend(v46, "containsObject:", v47);

      if ((v46 & 1) == 0)
      {
        v48 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
        objc_msgSend(v45, "syncEntityIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addObject:", v49);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"));
      }
      v50 = v40;
      v51 = v45;
      objc_opt_self();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      objc_msgSend(v51, "syncEntityIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[HDSyncAnchorRangeMap getAnchorRange:forSyncEntityIdentifier:](v50, "getAnchorRange:forSyncEntityIdentifier:", buf, v52);

      if (!v53)
      {
        v55 = objc_msgSend(v51, "syncAnchorRange");
        v57 = v56;
        objc_msgSend(v51, "syncEntityIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v50, "setAnchorRange:forSyncEntityIdentifier:", v55, v57, v58);
        v59 = 0;
        v60 = 1;
        goto LABEL_40;
      }
      objc_msgSend(v51, "sequenceNumber");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v54, "integerValue"))
      {

      }
      else
      {
        v61 = objc_msgSend(v51, "syncAnchorRange");
        v62 = *(_QWORD *)&buf[8];

        if (v61 != v62)
        {
          v73 = (void *)MEMORY[0x1E0CB35C8];
          v74 = objc_opt_class();
          v75 = objc_msgSend(v51, "syncAnchorRange");
          v76 = *(_QWORD *)&buf[8];
          objc_msgSend(v51, "sequenceNumber");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v74, v84, CFSTR("startAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"), v75, v76, v58);
LABEL_36:
          v77 = (id)objc_claimAutoreleasedReturnValue();
          v59 = v77;
          if (v77)
            v78 = objc_retainAutorelease(v77);

          v60 = 0;
          goto LABEL_39;
        }
      }
      objc_msgSend(v51, "sequenceNumber");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "integerValue") < 1)
      {

      }
      else
      {
        objc_msgSend(v51, "syncAnchorRange");
        v65 = v64;
        v66 = *(_QWORD *)&buf[8];

        if (v65 != v66)
        {
          v67 = (void *)MEMORY[0x1E0CB35C8];
          v68 = objc_opt_class();
          objc_msgSend(v51, "syncAnchorRange");
          v70 = v69;
          v71 = *(_QWORD *)&buf[8];
          objc_msgSend(v51, "sequenceNumber");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v68, v84, CFSTR("endAnchor (%lld) != previous endAnchor (%lld), sequence (%@)"), v70, v71, v58);
          goto LABEL_36;
        }
      }
      objc_msgSend(v51, "syncAnchorRange");
      *(_QWORD *)&buf[8] = v72;
      objc_msgSend(v51, "syncEntityIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v50, "setAnchorRange:forSyncEntityIdentifier:", *(_QWORD *)buf, *(_QWORD *)&buf[8], v58);
      v59 = 0;
      v60 = 1;
LABEL_39:
      v40 = v85;
LABEL_40:

      v79 = v59;
      v80 = v79;
      if ((v60 & 1) == 0)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        v40 = v50;
        goto LABEL_49;
      }

      ++v44;
    }
    while (v42 != v44);
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
    v43 = &selRef_setCanRepromptOnSameBuild_;
    if (v42)
      continue;
    break;
  }
LABEL_43:

  _HKInitializeLogging();
  v81 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v82 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v82;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v40;
    _os_log_impl(&dword_1B7802000, v81, OS_LOG_TYPE_INFO, "%{public}@: sendChanges for anchor ranges %{public}@", buf, 0x16u);
  }
  v83 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_48:
  v83();
LABEL_49:

}

- (BOOL)syncSession:(id)a3 didEndTransactionWithError:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  HDStaticSyncExportTask *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v5, "syncStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = self;
    v12 = 2080;
    v13 = "-[HDStaticSyncExportTask syncSession:didEndTransactionWithError:]";
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  return 1;
}

- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  NSObject *exportQueue;
  _QWORD block[5];
  uint8_t buf[4];
  HDStaticSyncExportTask *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v8, "syncStore");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("NO");
    *(_DWORD *)buf = 138544386;
    v19 = 2080;
    v20 = "-[HDStaticSyncExportTask syncSession:didFinishSuccessfully:error:]";
    v18 = self;
    v21 = 2114;
    if (v6)
      v14 = CFSTR("YES");
    v22 = v12;
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_INFO, "%{public}@: %s: %{public}@: success: %{public}@, error: %{public}@", buf, 0x34u);

  }
  exportQueue = self->_exportQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HDStaticSyncExportTask_syncSession_didFinishSuccessfully_error___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(exportQueue, block);

}

uint64_t __66__HDStaticSyncExportTask_syncSession_didFinishSuccessfully_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    objc_msgSend(*(id *)(v2 + 88), "closeArchive");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setCompletedUnitCount:", objc_msgSend(*(id *)(v2 + 72), "totalUnitCount"));
}

- (NSURL)exportDirectoryURL
{
  return self->_exportDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportDirectoryURL, 0);
  objc_storeStrong((id *)&self->_archiveCreator, 0);
  objc_storeStrong((id *)&self->_syncEntityIdentifiersWithProcessedChanges, 0);
  objc_storeStrong((id *)&self->_syncSessionProgress, 0);
  objc_storeStrong((id *)&self->_exportProgress, 0);
  objc_storeStrong((id *)&self->_exportQueue, 0);
}

@end
