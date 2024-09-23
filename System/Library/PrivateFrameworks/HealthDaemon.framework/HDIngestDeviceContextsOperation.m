@implementation HDIngestDeviceContextsOperation

- (HDIngestDeviceContextsOperation)initWithAccessibilityAssertion:(id)a3 containerIdentifier:(id)a4
{
  id v7;
  id v8;
  HDIngestDeviceContextsOperation *v9;
  HDIngestDeviceContextsOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDIngestDeviceContextsOperation;
  v9 = -[HDIngestDeviceContextsOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assertion, a3);
    objc_storeStrong((id *)&v10->_containerIdentifier, a4);
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  HDCloudSyncCachedCloudState *v22;
  NSString *containerIdentifier;
  void *v24;
  id v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSString *v40;
  id v41;
  void *v42;
  id v43;
  BOOL v44;
  void *v45;
  id v47;
  void *v49;
  id obj;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  HDIngestDeviceContextsOperation *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t v71[128];
  _BYTE v72[12];
  _BYTE buf[24];
  void *v74;
  HDIngestDeviceContextsOperation *v75;
  id *v76;
  uint64_t *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = a4;
  v8 = v7;
  v9 = v8;
  v54 = self;
  v49 = v8;
  if (!self)
  {

LABEL_45:
    v45 = 0;
    v44 = 0;
    goto LABEL_46;
  }
  v65 = 0;
  v66 = (uint64_t)&v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__167;
  v69 = __Block_byref_object_dispose__167;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__167;
  v63 = __Block_byref_object_dispose__167;
  v64 = 0;
  v10 = dispatch_semaphore_create(0);
  objc_msgSend(v9, "cloudSyncManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __60__HDIngestDeviceContextsOperation__fetchRepositories_error___block_invoke;
  v74 = &unk_1E6CEE790;
  v76 = &v59;
  v77 = &v65;
  v12 = v10;
  v75 = (HDIngestDeviceContextsOperation *)v12;
  objc_msgSend(v11, "cloudSyncRepositoriesForClient:completion:", 0, buf);

  v13 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v72 = 138543362;
      *(_QWORD *)&v72[4] = self;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Timed out waiting to complete journable operation", v72, 0xCu);
    }
  }
  v15 = *(void **)(v66 + 40);
  if (v15)
  {
    v16 = v15;
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();

  }
  obj = v60[5];

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  if (!obj)
    goto LABEL_45;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
  if (v53)
  {
    v18 = 0;
    v52 = *(_QWORD *)v56;
    do
    {
      v19 = 0;
      v20 = v18;
      do
      {
        if (*(_QWORD *)v56 != v52)
          objc_enumerationMutation(obj);
        v21 = *(id *)(*((_QWORD *)&v55 + 1) + 8 * v19);
        v22 = -[HDCloudSyncCachedCloudState initWithRepository:accessibilityAssertion:]([HDCloudSyncCachedCloudState alloc], "initWithRepository:accessibilityAssertion:", v21, v54->_assertion);
        containerIdentifier = v54->_containerIdentifier;
        v59 = 0;
        -[HDCloudSyncCachedCloudState contextSyncZoneForContainerID:error:](v22, "contextSyncZoneForContainerID:error:", containerIdentifier, &v59);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v59;
        v26 = v25;
        if (v24)
          v27 = 1;
        else
          v27 = v25 == 0;
        if (v27)
        {
          if (v24)
          {
            v28 = objc_opt_class();
            *(_QWORD *)v72 = v26;
            objc_msgSend(v24, "recordsForClass:error:", v28, v72);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = *(id *)v72;

            v51 = v29 != 0;
            if (v29)
            {
              _HKInitializeLogging();
              v31 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
              {
                v32 = v31;
                v33 = objc_msgSend(v29, "count");
                v34 = v54->_containerIdentifier;
                *(_DWORD *)buf = 134218242;
                *(_QWORD *)&buf[4] = v33;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v34;
                _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "Fetched %lu context records from the cache from %{public}@", buf, 0x16u);

              }
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke;
              v74 = &unk_1E6D0A918;
              v75 = v54;
              objc_msgSend(v29, "hk_map:", buf);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "cloudSyncShimProvider");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "contextSyncShim");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v65 = MEMORY[0x1E0C809B0];
              v66 = 3221225472;
              v67 = (uint64_t)__94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke_186;
              v68 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CE77C8;
              v69 = (void (*)(uint64_t))v54;
              objc_msgSend(v37, "ingestRemoteDeviceContexts:completion:", v35, &v65);

              v38 = v20;
            }
            else
            {
              v41 = v30;
              v42 = v41;
              v38 = v20;
              if (v41)
                v38 = objc_retainAutorelease(v41);

            }
            v26 = v30;
          }
          else
          {
            _HKInitializeLogging();
            v39 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v40 = v54->_containerIdentifier;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v54;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v40;
              _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: Context sync zone not present for container identifier: %{public}@", buf, 0x16u);
            }
            v51 = 1;
            v38 = v20;
          }
        }
        else
        {
          v38 = objc_retainAutorelease(v25);
          v51 = 0;
          v26 = v38;
        }

        v18 = v38;
        ++v19;
        v20 = v18;
      }
      while (v53 != v19);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
    }
    while (v53);
    if (!v51)
    {
      v43 = v18;
      v18 = v43;
      if (v43)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v43);
        else
          _HKLogDroppedError();
      }

      v44 = 0;
      goto LABEL_43;
    }
  }
  else
  {
    v18 = 0;
  }
  v44 = 1;
LABEL_43:

  v45 = obj;
LABEL_46:

  return v44;
}

void __60__HDIngestDeviceContextsOperation__fetchRepositories_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0;
  objc_msgSend(v3, "deviceContextWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v12 = v9;
      v13 = 2114;
      v14 = v3;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context from record %{public}@, error: %{public}@", buf, 0x20u);
    }
  }

  return v4;
}

void __94__HDIngestDeviceContextsOperation__pullDeviceContextsForProfile_repository_transaction_error___block_invoke_186(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to ingest remote device context records, error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (id)transactionContext
{
  void *v3;
  void *v4;

  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextWithAccessibilityAssertion:", self->_assertion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDIngestDeviceContextsOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDIngestDeviceContextsOperation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContainerIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HDIngestDeviceContextsOperation initWithAccessibilityAssertion:containerIdentifier:](self, "initWithAccessibilityAssertion:containerIdentifier:", 0, v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("ContainerIdentifier"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
