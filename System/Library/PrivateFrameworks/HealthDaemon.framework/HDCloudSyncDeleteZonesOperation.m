@implementation HDCloudSyncDeleteZonesOperation

- (HDCloudSyncDeleteZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncDeleteZonesOperation *v4;
  HDCloudSyncDeleteZonesOperation *v5;
  HDSynchronousTaskGroup *v6;
  HDSynchronousTaskGroup *taskGroup;
  NSArray *zonesToDelete;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDCloudSyncDeleteZonesOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v10, sel_initWithConfiguration_cloudState_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v5->_taskGroup;
    v5->_taskGroup = v6;

    -[HDSynchronousTaskGroup setDelegate:](v5->_taskGroup, "setDelegate:", v5);
    zonesToDelete = v5->_zonesToDelete;
    v5->_zonesToDelete = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (NSArray)zonesToDelete
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_zonesToDelete;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setZonesToDelete:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *zonesToDelete;
  void *v8;

  v5 = a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncDeleteZonesOperation.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  zonesToDelete = self->_zonesToDelete;
  self->_zonesToDelete = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  HDCloudSyncModifyRecordZonesOperation *v19;
  void *v20;
  HDCloudSyncModifyRecordZonesOperation *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  id obj;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  uint8_t v37[128];
  _BYTE buf[24];
  void *v39;
  __int128 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncDeleteZonesOperation zonesToDelete](self, "zonesToDelete");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCKContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v6)
  {
    v8 = v6;
    v28 = *(_QWORD *)v32;
    *(_QWORD *)&v7 = 138544130;
    v26 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __39__HDCloudSyncDeleteZonesOperation_main__block_invoke;
        v30[3] = &unk_1E6CEBA48;
        v30[4] = v10;
        objc_msgSend(v29, "hk_filter:", v30, v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v12 = v11;
          v13 = v10;
          -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
          objc_msgSend(v12, "hk_map:", &__block_literal_global_28);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          _HKInitializeLogging();
          v15 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            v17 = objc_msgSend(v12, "count");
            objc_msgSend(v13, "containerIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v26;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v17;
            *(_WORD *)&buf[22] = 2114;
            v39 = v18;
            LOWORD(v40) = 2114;
            *(_QWORD *)((char *)&v40 + 2) = v14;
            _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld zones in %{public}@: %{public}@", buf, 0x2Au);

          }
          v19 = [HDCloudSyncModifyRecordZonesOperation alloc];
          -[HDCloudSyncOperation configuration](self, "configuration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:](v19, "initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:", v20, v13, 0, v14);

          v22 = MEMORY[0x1E0C809B0];
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_193;
          v35[3] = &unk_1E6CEBAB0;
          v35[4] = self;
          v23 = v13;
          v36 = v23;
          -[HDCloudSyncOperation setOnError:](v21, "setOnError:", v35);
          *(_QWORD *)buf = v22;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_195;
          v39 = &unk_1E6CEBAD8;
          *(_QWORD *)&v40 = self;
          *((_QWORD *)&v40 + 1) = v14;
          v24 = v23;
          v41 = v24;
          v25 = v14;
          -[HDCloudSyncOperation setOnSuccess:](v21, "setOnSuccess:", buf);
          -[HDCloudSyncOperation start](v21, "start");

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
}

uint64_t __39__HDCloudSyncDeleteZonesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneIdentifier");
}

void __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_193(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v4;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zones in %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:", v4);

}

uint64_t __58__HDCloudSyncDeleteZonesOperation__deleteZones_container___block_invoke_195(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(*(id *)(a1 + 48), "containerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v4;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleted %ld zones in %{public}@", (uint8_t *)&v9, 0x20u);

  }
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
  objc_storeStrong((id *)&self->_zonesToDelete, 0);
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
