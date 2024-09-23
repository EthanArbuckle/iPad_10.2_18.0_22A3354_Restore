@implementation HDCloudSyncResetOperation

- (HDCloudSyncResetOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5
{
  id v9;
  HDCloudSyncResetOperation *v10;
  HDCloudSyncResetOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncResetOperation;
  v10 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_container, a5);

  return v11;
}

- (void)main
{
  void *v3;
  CKContainer *container;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _BYTE buf[24];
  void *v24;
  HDCloudSyncResetOperation *v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    container = self->_container;
    v5 = v3;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = container;
    *(_WORD *)&buf[22] = 2114;
    v24 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning reset for container (%{public}@) with configuration %{public}@", buf, 0x20u);

  }
  else if (!self)
  {
    return;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DB0]), "initWithPreviousServerChangeToken:", 0);
  objc_msgSend(v7, "setFetchAllChanges:", 1);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke;
  v21[3] = &unk_1E6D013D0;
  v10 = v8;
  v22 = v10;
  objc_msgSend(v7, "setRecordZoneWithIDChangedBlock:", v21);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_2;
  v19[3] = &unk_1E6D013D0;
  v11 = v10;
  v20 = v11;
  objc_msgSend(v7, "setRecordZoneWithIDWasPurgedBlock:", v19);
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_3;
  v17[3] = &unk_1E6D013D0;
  v12 = v11;
  v18 = v12;
  objc_msgSend(v7, "setRecordZoneWithIDWasDeletedBlock:", v17);
  *(_QWORD *)buf = v9;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_4;
  v24 = &unk_1E6D013F8;
  v25 = self;
  v26 = v12;
  v13 = v12;
  objc_msgSend(v7, "setFetchDatabaseChangesCompletionBlock:", buf);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "operationGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGroup:", v15);

  -[CKContainer privateCloudDatabase](self->_container, "privateCloudDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v7);

}

void __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete zones: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

void __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke_184(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "recordZoneIDsToDelete");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted zones %{public}@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);

}

uint64_t __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

uint64_t __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

void __50__HDCloudSyncResetOperation__fetchDatabaseChanges__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  id v17;
  HDCloudSyncModifyRecordZonesOperation *v18;
  void *v19;
  void *v20;
  void *v21;
  HDCloudSyncModifyRecordZonesOperation *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  _BYTE buf[24];
  void *v30;
  _QWORD *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  v8 = *MEMORY[0x1E0CB5370];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(_QWORD *)(v26 + 104);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      v30 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch record zones in %{public}@ with error: %{public}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v5);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched record zones %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C95088], "defaultRecordZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v13);

    if (objc_msgSend(v11, "count"))
    {
      v14 = *(_QWORD **)(a1 + 32);
      objc_msgSend(v11, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        v17 = v15;
        v18 = [HDCloudSyncModifyRecordZonesOperation alloc];
        objc_msgSend(v14, "configuration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)v14[13];
        objc_msgSend(v20, "privateCloudDatabase");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:](v18, "initWithConfiguration:container:scope:recordZonesToSave:recordZoneIDsToDelete:", v19, v20, objc_msgSend(v21, "databaseScope"), 0, v17);

        v23 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke;
        v30 = &unk_1E6D01380;
        v31 = v14;
        -[HDCloudSyncOperation setOnError:](v22, "setOnError:", buf);
        v28[0] = v23;
        v28[1] = 3221225472;
        v28[2] = __53__HDCloudSyncResetOperation__deleteZonesWithZoneIDs___block_invoke_184;
        v28[3] = &unk_1E6D013A8;
        v28[4] = v14;
        -[HDCloudSyncOperation setOnSuccess:](v22, "setOnSuccess:", v28);
        -[HDCloudSyncOperation start](v22, "start");

      }
    }
    else
    {
      _HKInitializeLogging();
      v24 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: No record zones available to delete", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
