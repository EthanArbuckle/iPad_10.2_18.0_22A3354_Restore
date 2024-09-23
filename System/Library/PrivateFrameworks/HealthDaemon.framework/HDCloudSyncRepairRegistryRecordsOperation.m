@implementation HDCloudSyncRepairRegistryRecordsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncRepairRegistryRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncRepairRegistryRecordsOperation *v4;
  HDSynchronousTaskGroup *v5;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncRepairRegistryRecordsOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v8, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v4)
  {
    v5 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v5;

    -[HDSynchronousTaskGroup setDelegate:](v4->_taskGroup, "setDelegate:", v4);
  }
  return v4;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  HDSynchronousTaskGroup *taskGroup;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  HDCloudSyncModifyRecordsOperation *v35;
  void *v36;
  HDCloudSyncModifyRecordsOperation *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  __int128 v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52[5];
  void *v53;
  uint8_t v54[128];
  _BYTE buf[24];
  void *v56;
  HDCloudSyncRepairRegistryRecordsOperation *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCKContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v46 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v48;
    *(_QWORD *)&v6 = 138543618;
    v43 = v6;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v48 != v45)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v7);
        -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask", v43);
        v9 = v8;
        -[HDCloudSyncOperation configuration](self, "configuration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cachedCloudState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "containerIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v52[0] = 0;
        objc_msgSend(v11, "unifiedSyncZoneForContainerID:error:", v12, v52);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v52[0];

        if (v13)
        {
          v15 = objc_opt_class();
          v51 = v14;
          objc_msgSend(v13, "recordsForClass:error:", v15, &v51);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v51;

          if (v16)
          {
            if ((unint64_t)objc_msgSend(v16, "count") >= 2)
            {
              _HKInitializeLogging();
              v18 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
              {
                v39 = v18;
                objc_msgSend(v13, "zoneIdentifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v40;
                *(_WORD *)&buf[22] = 2114;
                v56 = v17;
                _os_log_fault_impl(&dword_1B7802000, v39, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple registry records for %{public}@, %{public}@", buf, 0x20u);

              }
            }
            if (objc_msgSend(v16, "count") == 1)
            {
              objc_msgSend(v16, "firstObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = 0;
LABEL_23:

              goto LABEL_28;
            }
LABEL_21:
            v20 = 0;
          }
          else
          {
            if (!v17)
              goto LABEL_21;
            _HKInitializeLogging();
            v23 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v41 = v23;
              objc_msgSend(v13, "zoneIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v42;
              *(_WORD *)&buf[22] = 2114;
              v56 = v17;
              _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get registry records for %{public}@, %{public}@", buf, 0x20u);

            }
            v20 = objc_retainAutorelease(v17);
          }
          v19 = 0;
          goto LABEL_23;
        }
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E0CB5370];
        v22 = *MEMORY[0x1E0CB5370];
        if (v14)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v43;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v14;
            _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get unified zone %{public}@", buf, 0x16u);
          }
          v20 = objc_retainAutorelease(v14);

        }
        else
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Unified zone does not exist.", buf, 0xCu);
          }
          v20 = 0;
        }
        v19 = 0;
LABEL_28:

        v24 = v20;
        if (!v19)
        {
          taskGroup = self->_taskGroup;
          if (v24)
          {
            -[HDSynchronousTaskGroup failTaskWithError:](taskGroup, "failTaskWithError:", v24);
            goto LABEL_35;
          }
          goto LABEL_33;
        }
        objc_msgSend(v19, "sharedProfileIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "type");

        if (v26 == 3)
        {
          taskGroup = self->_taskGroup;
LABEL_33:
          -[HDSynchronousTaskGroup finishTask](taskGroup, "finishTask");
          goto LABEL_35;
        }
        v28 = (void *)MEMORY[0x1E0CB6A10];
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_profileWithUUID:type:", v29, 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSharedProfileIdentifier:", v30);

        objc_msgSend(v19, "record");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v9;
        v34 = v32;
        v35 = [HDCloudSyncModifyRecordsOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v35, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v36, v33, v34, 0);

        -[HDCloudSyncModifyRecordsOperation setTreatAnyErrorAsFatal:](v37, "setTreatAnyErrorAsFatal:", 1);
        v38 = (void *)MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke;
        v56 = &unk_1E6CE77A0;
        v57 = self;
        -[HDCloudSyncOperation setOnError:](v37, "setOnError:", buf);
        v52[0] = v38;
        v52[1] = (id)3221225472;
        v52[2] = __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke_189;
        v52[3] = &unk_1E6CE7778;
        v52[4] = self;
        -[HDCloudSyncOperation setOnSuccess:](v37, "setOnSuccess:", v52);
        -[HDCloudSyncOperation start](v37, "start");

LABEL_35:
        ++v7;
      }
      while (v46 != v7);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v46);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
}

void __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update registry records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "failTaskWithError:", v4);

}

uint64_t __79__HDCloudSyncRepairRegistryRecordsOperation__modifyRecordsAndFinish_container___block_invoke_189(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated registry records", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "finishTask");
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
