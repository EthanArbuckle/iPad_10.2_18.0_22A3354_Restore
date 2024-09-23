@implementation HDCloudSyncCreateZonesOperation

- (HDCloudSyncCreateZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncCreateZonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 zones:(id)a5 container:(id)a6
{
  id v10;
  id v11;
  HDCloudSyncCreateZonesOperation *v12;
  HDCloudSyncCreateZonesOperation *v13;
  uint64_t v14;
  NSArray *zones;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncCreateZonesOperation;
  v12 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v17, sel_initWithConfiguration_cloudState_, a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_container, a6);
    v14 = objc_msgSend(v10, "copy");
    zones = v13->_zones;
    v13->_zones = (NSArray *)v14;

  }
  return v13;
}

- (void)main
{
  os_log_t *v3;
  void *v4;
  NSArray *zones;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSArray *v15;
  void *v16;
  CKContainer *container;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HDCloudSyncModifyRecordZonesOperation *v26;
  void *v27;
  HDCloudSyncModifyRecordZonesOperation *v28;
  _QWORD v29[4];
  id v30;
  HDCloudSyncCreateZonesOperation *v31;
  id v32;
  uint8_t buf[4];
  HDCloudSyncCreateZonesOperation *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E0CB5370];
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    zones = self->_zones;
    v6 = v4;
    -[NSArray hk_map:](zones, "hk_map:", &__block_literal_global_54);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = self;
    v35 = 2114;
    v36 = v8;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Verifying existence of zones: %{public}@", buf, 0x16u);

  }
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedCloudState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v10, "zonesByIdentifierWithError:", &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;

  if (v11 || !v12)
  {
    if (!v11 || !objc_msgSend(v11, "count"))
    {
      _HKInitializeLogging();
      v14 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = self;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ No cached zones found while verifying existence of zones.", buf, 0xCu);
      }
    }
    v15 = self->_zones;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __39__HDCloudSyncCreateZonesOperation_main__block_invoke_188;
    v29[3] = &unk_1E6CF15B8;
    v30 = v11;
    v31 = self;
    -[NSArray hk_filter:](v15, "hk_filter:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      container = self->_container;
      -[HDCloudSyncOperation configuration](self, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "repository");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "profileIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HDDatabaseForContainer(container, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "databaseScope") == 2)
      {
        _HKInitializeLogging();
        v22 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          v23 = v22;
          objc_msgSend(v16, "hk_map:", &__block_literal_global_193_0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "componentsJoinedByString:", CFSTR(", "));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = self;
          v35 = 2114;
          v36 = v25;
          _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Creating zones: %{public}@", buf, 0x16u);

        }
        v26 = [HDCloudSyncModifyRecordZonesOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:](v26, "initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:", v27, self->_container, v16, 0);

        -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v28);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 712, CFSTR("Unable to create zones in a non-private database."));
        v28 = (HDCloudSyncModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v28);
      }

    }
    else
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    }

  }
  else
  {
    _HKInitializeLogging();
    v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v34 = self;
      v35 = 2114;
      v36 = v12;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers while generating pull targets, %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v12);
  }

}

uint64_t __39__HDCloudSyncCreateZonesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneID");
}

uint64_t __39__HDCloudSyncCreateZonesOperation_main__block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(v3, "zoneID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "containerIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v9, "isEquivalentIgnoringOwnerToZone:container:", v10, v11);

        if ((v9 & 1) != 0)
        {
          v12 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

uint64_t __39__HDCloudSyncCreateZonesOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneID");
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
