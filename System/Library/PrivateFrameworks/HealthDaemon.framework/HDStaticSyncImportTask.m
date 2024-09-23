@implementation HDStaticSyncImportTask

- (HDStaticSyncImportTask)initWithProfile:(id)a3 options:(unint64_t)a4 storeIdentifier:(id)a5 URL:(id)a6
{
  id v11;
  HDStaticSyncImportTask *v12;
  HDStaticSyncImportTask *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HDStaticSyncImportTask;
  v12 = -[HDStaticSyncTask initWithProfile:options:storeIdentifier:](&v15, sel_initWithProfile_options_storeIdentifier_, a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_importDirectoryURL, a6);

  return v13;
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
  HDStaticSyncImportTask *v20;
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
    v22 = "-[HDStaticSyncImportTask runWithCompletion:]";
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
  block[2] = __44__HDStaticSyncImportTask_runWithCompletion___block_invoke;
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

void __44__HDStaticSyncImportTask_runWithCompletion___block_invoke(_QWORD *a1)
{
  _HDStaticSyncStore *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;
  id *v6;
  id v7;
  uint64_t v8;
  id v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id *v26;
  uint64_t v27;
  os_log_t *v28;
  uint64_t i;
  void *v30;
  os_log_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  char v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(id, _QWORD, void *);
  id v47;
  id v48;
  id *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  id *v54;
  id v55;
  id v56[6];
  id *v57;
  uint64_t v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v2 = [_HDStaticSyncStore alloc];
  v3 = a1[4];
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
    v3 = a1[4];
    if (v3)
      v3 = *(_QWORD *)(v3 + 24);
  }
  else
  {
    WeakRetained = 0;
  }
  v56[0] = 0;
  v5 = (id)v3;
  v6 = -[_HDStaticSyncStore initWithProfile:storeIdentifier:error:](v2, "initWithProfile:storeIdentifier:error:", WeakRetained, v5, v56);
  v7 = v56[0];

  if (v6)
  {
    v8 = a1[4];
    if (!v8 || (*(_BYTE *)(v8 + 16) & 1) == 0)
    {
      v55 = v7;
      v9 = objc_loadWeakRetained(v6 + 2);
      v10 = +[HDSyncAnchorEntity resetSyncAnchorsOfType:store:profile:error:](HDSyncAnchorEntity, "resetSyncAnchorsOfType:store:profile:error:", 3, v6, v9, &v55);

      v11 = v55;
      if (!v10)
      {
        (*(void (**)(void))(a1[6] + 16))();
        v7 = v11;
        goto LABEL_30;
      }
      v8 = a1[4];
      v7 = v11;
    }
    v12 = (void *)a1[5];
    v13 = (void *)a1[6];
    v14 = *(id *)(v8 + 40);
    v54 = v6;
    v15 = v12;
    v16 = v13;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 32));
    v17 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v65 = 0;
    objc_msgSend(v17, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, 0, 4, &v65);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v65;
    v20 = v19;
    if (v18)
    {
      v50 = v19;
      v51 = v17;
      v52 = v7;
      objc_msgSend(v18, "hk_filter:", &__block_literal_global_53);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "count"))
      {
        v46 = v16;
        v48 = v14;
        v49 = v6;
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("path"), 1);
        v73[0] = v45;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sortedArrayUsingDescriptors:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = v15;
        objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", objc_msgSend(v23, "count"), v15, 1000);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v25 = v23;
        v26 = v54;
        v53 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        if (v53)
        {
          v27 = *(_QWORD *)v62;
          v28 = (os_log_t *)MEMORY[0x1E0CB5370];
          while (2)
          {
            for (i = 0; i != v53; ++i)
            {
              if (*(_QWORD *)v62 != v27)
                objc_enumerationMutation(v25);
              v30 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              _HKInitializeLogging();
              v31 = *v28;
              if (os_log_type_enabled(*v28, OS_LOG_TYPE_INFO))
              {
                v32 = v54[3];
                v33 = v27;
                v34 = v24;
                v35 = v25;
                v36 = v32;
                v37 = v31;
                objc_msgSend(v30, "path");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v67 = v8;
                v68 = 2114;
                v69 = v32;
                v26 = v54;
                v70 = 2114;
                v71 = v38;
                _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: extract archive %{public}@", buf, 0x20u);

                v25 = v35;
                v24 = v34;
                v27 = v33;
                v28 = (os_log_t *)MEMORY[0x1E0CB5370];

              }
              v60 = 0;
              v56[1] = (id)MEMORY[0x1E0C809B0];
              v56[2] = (id)3221225472;
              v56[3] = __100__HDStaticSyncImportTask__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion___block_invoke_341;
              v56[4] = &unk_1E6CF1370;
              v56[5] = v30;
              v57 = v26;
              v58 = v8;
              v59 = v24;
              v39 = HKWithAutoreleasePool();
              v40 = v60;
              if ((v39 & 1) == 0)
              {
                v16 = v46;
                v46[2](v46, 0, v40);

                goto LABEL_26;
              }

            }
            v53 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
            if (v53)
              continue;
            break;
          }
        }

        v16 = v46;
        v46[2](v46, 1, 0);
LABEL_26:

        v14 = v48;
        v6 = v49;
        v7 = v52;
        v15 = v47;
      }
      else
      {
        v41 = (void *)MEMORY[0x1E0CB35C8];
        v42 = objc_opt_class();
        objc_msgSend(v14, "path");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v42, sel__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion_, CFSTR("%@ contains no data files that can be imported"), v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 0, v44);

        v7 = v52;
      }
      v20 = v50;
      v17 = v51;
    }
    else
    {
      v16[2](v16, 0, v19);
    }

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
LABEL_30:

}

uint64_t __100__HDStaticSyncImportTask__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("zip")))
  {
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("syncarchive-"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __100__HDStaticSyncImportTask__queue_importStaticSyncChangesFromDirectory_syncStore_progress_completion___block_invoke_341(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v5 = (void *)a1[4];
  v4 = (void *)a1[5];
  v6 = a1[6];
  if (v6)
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
  else
    WeakRetained = 0;
  v8 = (void *)a1[7];
  v9 = v5;
  v10 = v4;
  v11 = WeakRetained;
  v12 = v8;
  v13 = objc_opt_self();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7080]), "initWithURL:", v9);
  objc_msgSend(v14, "numberOfEntriesWithError:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", v16, v12, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__49;
  v38 = __Block_byref_object_dispose__49;
  v39 = 0;
  v32 = v13;
  v33 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__HDStaticSyncImportTask__extractChangeArchive_syncStore_profile_progress_error___block_invoke;
  v26[3] = &unk_1E6CF1398;
  v18 = v10;
  v27 = v18;
  v30 = &v40;
  v31 = &v34;
  v19 = v11;
  v28 = v19;
  v20 = v17;
  v29 = v20;
  v21 = objc_msgSend(v14, "enumerateEntriesWithError:block:", &v33, v26);
  v22 = v33;
  *((_BYTE *)v41 + 24) = v21;
  if ((v21 & 1) == 0)
  {
    v23 = (id)v35[5];
    v24 = v23;
    if (v23)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v23);
      else
        _HKLogDroppedError();
    }

  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  return v21;
}

void __81__HDStaticSyncImportTask__extractChangeArchive_syncStore_profile_progress_error___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  id v31;
  void *v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v6 = a1[4];
    if (v6)
      v7 = *(void **)(v6 + 24);
    else
      v7 = 0;
    v8 = a1[9];
    v9 = v7;
    v10 = v5;
    objc_msgSend(v4, "pathname");
    v11 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v35 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: ingest file %{public}@", buf, 0x20u);

  }
  v12 = v4;
  objc_opt_self();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__49;
  v36 = __Block_byref_object_dispose__49;
  v37 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = v12;
  if ((HKWithAutoreleasePool() & 1) != 0)
    v15 = *(id *)(*(_QWORD *)&buf[8] + 40);
  else
    v15 = 0;

  _Block_object_dispose(buf, 8);
  v16 = 0;
  v33 = v16;
  if (v15)
  {
    v17 = (void *)a1[4];
    v18 = (void *)a1[5];
    v19 = (void *)a1[6];
    v20 = v15;
    v21 = v17;
    v22 = v18;
    v23 = v19;
    v24 = objc_opt_self();
    *(_QWORD *)buf = v13;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __73__HDStaticSyncImportTask__applySyncChanges_store_profile_progress_error___block_invoke;
    v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CF13C0;
    v36 = v22;
    v37 = v20;
    v39 = v21;
    v40 = v24;
    v38 = v23;
    v25 = v21;
    v26 = v23;
    v27 = v20;
    v28 = v22;
    LOBYTE(v20) = HKWithAutoreleasePool();

    v29 = 0;
    if ((v20 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
      *a3 = 1;
      objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), 0);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    *a3 = 1;
    v30 = *(_QWORD *)(a1[8] + 8);
    v31 = v16;
    v29 = *(id *)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v31;
  }

}

BOOL __57__HDStaticSyncImportTask__extractChangesFromEntry_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  HDCodableStaticSyncChangeSet *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;

  v4 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v4, "dataWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v6);
    else
      _HKLogDroppedError();
  }
  else
  {
    v7 = -[HDCodableStaticSyncChangeSet initWithData:]([HDCodableStaticSyncChangeSet alloc], "initWithData:", v5);
    -[HDCodableStaticSyncChangeSet changes](v7, "changes");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return v6 == 0;
}

uint64_t __73__HDStaticSyncImportTask__applySyncChanges_store_profile_progress_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  _QWORD *v24;
  id obj;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncEngine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", objc_msgSend(*(id *)(a1 + 40), "count"), *(_QWORD *)(a1 + 48), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = *(id *)(a1 + 40);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v6 = v5;
    v24 = a2;
    v7 = 0;
    v8 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "syncEngine");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allSyncEntitiesByIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "syncEntityIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "objectForKeyedSubscript:", v13);

        if (v14)
        {
          v15 = *(_QWORD *)(a1 + 56);
          v28 = 0;
          v16 = objc_msgSend(v27, "applySyncChange:forStore:error:", v10, v15, &v28);
          v17 = v28;
          if ((v16 & 1) == 0)
          {
            _HKInitializeLogging();
            v20 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v34 = v10;
              v35 = 2114;
              v36 = v17;
              _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "failed to apply request change %{public}@: %{public}@", buf, 0x16u);
            }
            v21 = v17;
            v22 = v21;
            if (v21)
            {
              if (v24)
                *v24 = objc_retainAutorelease(v21);
              else
                _HKLogDroppedError();
            }

            v4 = 0;
            goto LABEL_21;
          }
          objc_msgSend(v26, "setCompletedUnitCount:", v7 + i + 1);

        }
        else
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(void **)(a1 + 64);
            *(_DWORD *)buf = 138543618;
            v34 = v19;
            v35 = 2114;
            v36 = v10;
            _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: cannot apply change %{public}@ because it is for an unknown (possibly future) sync entity.", buf, 0x16u);
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      v7 += i;
      if (v6)
        continue;
      break;
    }
    v4 = 1;
  }
LABEL_21:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importDirectoryURL, 0);
}

@end
