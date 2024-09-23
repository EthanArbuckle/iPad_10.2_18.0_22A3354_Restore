@implementation HDCloudSyncPrepareForSharingOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HDCloudSyncModifyRecordZonesOperation *v28;
  void *v29;
  void *v30;
  HDCloudSyncModifyRecordZonesOperation *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  void *v45;
  uint8_t buf[4];
  HDCloudSyncPrepareForSharingOperation *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryCKContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedCloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v7, "zonesByIdentifierWithError:", &v44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v44;

  if (v8 || !v9)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v8, "allKeys", v9, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v16, "containerIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "containerIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v19)
          {
            _HKInitializeLogging();
            v33 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v34 = v33;
              objc_msgSend(v5, "containerIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v47 = self;
              v48 = 2114;
              v49 = v16;
              v50 = 2114;
              v51 = v35;
              _os_log_impl(&dword_1B7802000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: Found existing zone %{public}@ in primary container %{public}@; ready for sharing.",
                buf,
                0x20u);

            }
            -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
            goto LABEL_20;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v13)
          continue;
        break;
      }
    }

    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v5, "containerIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = self;
      v48 = 2114;
      v49 = v22;
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: No existing zones found in primary contaienr %{public}@; creating master zone.",
        buf,
        0x16u);

    }
    v23 = objc_alloc(MEMORY[0x1E0C95088]);
    v24 = (void *)MEMORY[0x1E0C95098];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "syncContainerPrefix");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hd_masterZoneIDForSyncCircleIdentifier:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v23, "initWithZoneID:", v27);

    v28 = [HDCloudSyncModifyRecordZonesOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:](v28, "initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:", v29, v5, v30, 0);

    v32 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke;
    v39[3] = &unk_1E6CE77A0;
    v39[4] = self;
    -[HDCloudSyncOperation setOnError:](v31, "setOnError:", v39);
    v38[0] = v32;
    v38[1] = 3221225472;
    v38[2] = __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke_187;
    v38[3] = &unk_1E6CE7778;
    v38[4] = self;
    -[HDCloudSyncOperation setOnSuccess:](v31, "setOnSuccess:", v38);
    -[HDCloudSyncOperation start](v31, "start");

LABEL_20:
    v9 = v36;
    v8 = v37;
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v47 = self;
      v48 = 2114;
      v49 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v9);
  }

}

void __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create master zone for sharing preparation: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __45__HDCloudSyncPrepareForSharingOperation_main__block_invoke_187(uint64_t a1)
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
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully created master zone for sharing preparation.", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

@end
