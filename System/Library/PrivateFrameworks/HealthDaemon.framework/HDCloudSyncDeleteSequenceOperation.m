@implementation HDCloudSyncDeleteSequenceOperation

- (HDCloudSyncDeleteSequenceOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncDeleteSequenceOperation)initWithConfiguration:(id)a3 targetsBySequence:(id)a4
{
  id v7;
  HDCloudSyncDeleteSequenceOperation *v8;
  HDCloudSyncDeleteSequenceOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncDeleteSequenceOperation;
  v8 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v11, sel_initWithConfiguration_cloudState_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_targetsBySequence, a4);

  return v9;
}

- (void)main
{
  void *v3;
  void *v4;
  HDCloudSyncModifyRecordsOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HDCloudSyncModifyRecordsOperation *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  HDCloudSyncDeleteSequenceOperation *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  -[NSDictionary allKeys](self->_targetsBySequence, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_map:", &__block_literal_global_127);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [HDCloudSyncModifyRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary allValues](self->_targetsBySequence, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v5, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v6, v9, 0, v4);

  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_2;
  v20[3] = &unk_1E6CEBAB0;
  v20[4] = self;
  v12 = v4;
  v21 = v12;
  -[HDCloudSyncOperation setOnError:](v10, "setOnError:", v20);
  v14 = v11;
  v15 = 3221225472;
  v16 = __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_188;
  v17 = &unk_1E6CFBD50;
  v18 = self;
  v19 = v12;
  v13 = v12;
  -[HDCloudSyncOperation setOnSuccess:](v10, "setOnSuccess:", &v14);
  -[HDCloudSyncOperation start](v10, "start", v14, v15, v16, v17, v18);

}

uint64_t __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

void __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete recordIDs %{public}@, %{public}@", (uint8_t *)&v8, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

void __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  id obj;
  id v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v36 = v5;
    v37 = 2114;
    v38 = v6;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted recordIDs %{public}@", buf, 0x16u);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v26 = v3;
  objc_msgSend(v3, "deletedRecordIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v31;
    *(_QWORD *)&v8 = 138543362;
    v25 = v8;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allKeys", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_189;
        v29[3] = &unk_1E6CF21B0;
        v29[4] = v12;
        objc_msgSend(v13, "hk_firstObjectPassingTest:", v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          _HKInitializeLogging();
          v21 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v24 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v36 = v24;
            v37 = 2114;
            v38 = v12;
            _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Sequence record surprisingly not found for record ID %{public}@", buf, 0x16u);
          }
          v22 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 725, CFSTR("Sequence record surprisingly not found"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "finishWithSuccess:error:", 0, v23);

          goto LABEL_18;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "store");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v16, "syncStoreForEpoch:", objc_msgSend(v14, "baselineEpoch"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0;
        LOBYTE(v16) = objc_msgSend(v17, "clearAllSyncAnchorsWithError:", &v28);
        v18 = v28;
        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v19 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v36 = v18;
            _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to remove old sync anchors after finalizing new baseline: %{public}@", buf, 0xCu);
          }
        }
        objc_msgSend(v15, "storeRecord");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeSequenceHeaderRecord:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
LABEL_18:

}

uint64_t __42__HDCloudSyncDeleteSequenceOperation_main__block_invoke_189(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsBySequence, 0);
}

@end
