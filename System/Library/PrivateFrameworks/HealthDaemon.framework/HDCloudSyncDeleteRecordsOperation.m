@implementation HDCloudSyncDeleteRecordsOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncDeleteRecordsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncDeleteRecordsOperation *v4;
  HDCloudSyncDeleteRecordsOperation *v5;
  HDSynchronousTaskGroup *v6;
  HDSynchronousTaskGroup *taskGroup;
  NSArray *recordIDsToDelete;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncDeleteRecordsOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v10, sel_initWithConfiguration_cloudState_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v6;

    -[HDSynchronousTaskGroup setDelegate:](v5->_taskGroup, "setDelegate:", v5);
    recordIDsToDelete = v5->_recordIDsToDelete;
    v5->_recordIDsToDelete = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (NSArray)recordIDsToDelete
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_recordIDsToDelete;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRecordIDsToDelete:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *recordIDsToDelete;
  void *v8;

  v5 = a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncDeleteRecordsOperation.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  recordIDsToDelete = self->_recordIDsToDelete;
  self->_recordIDsToDelete = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  HDCloudSyncModifyRecordsOperation *v29;
  void *v30;
  HDCloudSyncModifyRecordsOperation *v31;
  uint64_t v32;
  NSObject *v33;
  __int128 v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[5];
  uint8_t v48[128];
  _BYTE buf[24];
  void *v50;
  _QWORD v51[6];

  v51[3] = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncDeleteRecordsOperation recordIDsToDelete](self, "recordIDsToDelete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allCKContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v38 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v38)
    {
      v37 = *(_QWORD *)v44;
      *(_QWORD *)&v7 = 138543618;
      v34 = v7;
      v35 = v3;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v44 != v37)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
          -[HDCloudSyncOperation configuration](self, "configuration", v34);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cachedCloudState");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "containerIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v11, "zonesForContainerID:error:", v12, &v42);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v42;

          if (v13)
            v15 = 1;
          else
            v15 = v14 == 0;
          if (!v15)
          {
            _HKInitializeLogging();
            v16 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v14;
              _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
            }
            -[HDCloudSyncOperation configuration](self, "configuration");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "repository");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "primaryCKContainer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9 == v19)
            {
              -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v14);

              goto LABEL_25;
            }
          }
          objc_msgSend(v13, "hk_mapToSet:", &__block_literal_global_48);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __41__HDCloudSyncDeleteRecordsOperation_main__block_invoke_2;
          v40[3] = &unk_1E6CEC6C8;
          v21 = v20;
          v41 = v21;
          objc_msgSend(v3, "hk_filter:", v40);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            v39 = v14;
            v23 = v22;
            v24 = v9;
            -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
            _HKInitializeLogging();
            v25 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v26 = v25;
              v27 = objc_msgSend(v23, "count");
              objc_msgSend(v24, "containerIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v27;
              *(_WORD *)&buf[22] = 2114;
              v50 = v28;
              LOWORD(v51[0]) = 2114;
              *(_QWORD *)((char *)v51 + 2) = v23;
              _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld records in %{public}@: %{public}@", buf, 0x2Au);

              v3 = v35;
            }
            v29 = [HDCloudSyncModifyRecordsOperation alloc];
            -[HDCloudSyncOperation configuration](self, "configuration");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v29, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v30, v24, 0, v23);

            v32 = MEMORY[0x1E0C809B0];
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke;
            v50 = &unk_1E6CE77A0;
            v51[0] = self;
            -[HDCloudSyncOperation setOnError:](v31, "setOnError:", buf);
            v47[0] = v32;
            v47[1] = 3221225472;
            v47[2] = __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke_2;
            v47[3] = &unk_1E6CE7778;
            v47[4] = self;
            -[HDCloudSyncOperation setOnSuccess:](v31, "setOnSuccess:", v47);
            -[HDCloudSyncOperation start](v31, "start");

            v14 = v39;
          }

          ++v8;
        }
        while (v38 != v8);
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v38)
          continue;
        break;
      }
    }

    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
  }
  else
  {
    _HKInitializeLogging();
    v33 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_INFO, "%{public}@: Nothing to delete.", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
LABEL_25:

}

id __41__HDCloudSyncDeleteRecordsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "zoneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __41__HDCloudSyncDeleteRecordsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:");
}

uint64_t __62__HDCloudSyncDeleteRecordsOperation__deleteRecords_container___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");
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
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
