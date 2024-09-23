@implementation HDIngestDeviceKeyValueEntriesOperation

- (HDIngestDeviceKeyValueEntriesOperation)initWithAccessibilityAssertion:(id)a3 containerIdentifier:(id)a4
{
  id v7;
  id v8;
  HDIngestDeviceKeyValueEntriesOperation *v9;
  HDIngestDeviceKeyValueEntriesOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDIngestDeviceKeyValueEntriesOperation;
  v9 = -[HDIngestDeviceKeyValueEntriesOperation init](&v12, sel_init);
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
  id v22;
  HDCloudSyncCachedCloudState *v23;
  NSString *containerIdentifier;
  id *v25;
  void *v26;
  uint64_t v27;
  id v28;
  objc_class *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  char v34;
  id v35;
  void *v36;
  uint64_t *v37;
  void *v38;
  BOOL v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSString *v46;
  uint64_t v47;
  id v48;
  BOOL v49;
  void *v50;
  id obj;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  HDIngestDeviceKeyValueEntriesOperation *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  id v80;
  uint8_t v81[128];
  _BYTE buf[24];
  void *v83;
  HDIngestDeviceKeyValueEntriesOperation *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint8_t v87[4];
  HDIngestDeviceKeyValueEntriesOperation *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v55 = a4;
  v8 = v7;
  v9 = v8;
  v60 = self;
  v56 = v8;
  if (!self)
  {

LABEL_48:
    v50 = 0;
    v49 = 0;
    goto LABEL_49;
  }
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__36;
  v78 = __Block_byref_object_dispose__36;
  v79 = 0;
  v67 = 0;
  v68 = (uint64_t)&v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__36;
  v71 = __Block_byref_object_dispose__36;
  v72 = 0;
  v10 = dispatch_semaphore_create(0);
  objc_msgSend(v9, "cloudSyncManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __67__HDIngestDeviceKeyValueEntriesOperation__fetchRepositories_error___block_invoke;
  v83 = &unk_1E6CEE790;
  v85 = &v67;
  v86 = &v74;
  v12 = v10;
  v84 = (HDIngestDeviceKeyValueEntriesOperation *)v12;
  objc_msgSend(v11, "cloudSyncRepositoriesForClient:completion:", 0, buf);

  v13 = dispatch_time(0, 15000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v87 = 138543362;
      v88 = self;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Timed out waiting to complete journable operation", v87, 0xCu);
    }
  }
  v15 = (void *)v75[5];
  if (v15)
  {
    v16 = v15;
    v17 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();

  }
  obj = *(id *)(v68 + 40);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v74, 8);

  if (!obj)
    goto LABEL_48;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
  if (v57)
  {
    v18 = 0;
    v54 = *(_QWORD *)v64;
    do
    {
      v19 = 0;
      v61 = v18;
      do
      {
        if (*(_QWORD *)v64 != v54)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v19);
        v62 = v61;
        v58 = v56;
        v21 = v20;
        v59 = v55;
        v74 = 0;
        v75 = &v74;
        v76 = 0x3032000000;
        v77 = __Block_byref_object_copy__36;
        v78 = __Block_byref_object_dispose__36;
        v79 = 0;
        v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v23 = -[HDCloudSyncCachedCloudState initWithRepository:accessibilityAssertion:]([HDCloudSyncCachedCloudState alloc], "initWithRepository:accessibilityAssertion:", v21, v60->_assertion);
        containerIdentifier = v60->_containerIdentifier;
        v25 = (id *)(v75 + 5);
        v73 = (id)v75[5];
        -[HDCloudSyncCachedCloudState contextSyncZoneForContainerID:error:](v23, "contextSyncZoneForContainerID:error:", containerIdentifier, &v73);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v25, v73);
        if (v26)
        {
          v27 = objc_opt_class();
          v67 = MEMORY[0x1E0C809B0];
          v68 = 3221225472;
          v69 = (uint64_t)__108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke;
          v70 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CEE7B8;
          v71 = (void (*)(uint64_t))v60;
          v28 = v22;
          v72 = v28;
          objc_msgSend(v26, "recordsForClass:epoch:error:enumerationHandler:", v27, 0, &v62, &v67);
          if (objc_msgSend(v28, "count"))
          {
            v29 = (objc_class *)MEMORY[0x1E0C99E20];
            v30 = v26;
            v31 = objc_alloc_init(v29);
            v32 = objc_opt_class();
            v80 = 0;
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __81__HDIngestDeviceKeyValueEntriesOperation__fetchRemoteCloudEntriesFromZone_error___block_invoke;
            v83 = &unk_1E6CEE7B8;
            v84 = v60;
            v33 = (uint64_t *)v31;
            v85 = v33;
            v34 = objc_msgSend(v30, "recordsForClass:epoch:error:enumerationHandler:", v32, 0, &v80, buf);

            v35 = v80;
            v36 = v35;
            if ((v34 & 1) != 0)
            {
              v37 = v33;
            }
            else
            {
              v40 = v35;
              v41 = v40;
              if (v40)
                v62 = objc_retainAutorelease(v40);

              _HKInitializeLogging();
              v42 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v87 = 138543618;
                v88 = v60;
                v89 = 2114;
                v90 = v41;
                _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Error enumerating over remote key value entries %{public}@", v87, 0x16u);
              }
              v37 = 0;
            }

            v39 = v37 != 0;
            if (v37)
            {
              objc_msgSend(v21, "cloudSyncShimProvider");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "contextSyncShim");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke_187;
              v83 = &unk_1E6CEE7E0;
              v85 = &v74;
              v84 = v60;
              objc_msgSend(v44, "updateKeyValuePairsForRemoteEntries:deviceContexts:completion:", v37, v28, buf);

            }
          }
          else
          {
            v39 = 1;
          }

        }
        else
        {
          v38 = (void *)v75[5];
          if (v38)
          {
            v62 = objc_retainAutorelease(v38);

            v39 = 0;
          }
          else
          {
            _HKInitializeLogging();
            v45 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
            {
              v46 = v60->_containerIdentifier;
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v60;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v46;
              _os_log_impl(&dword_1B7802000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: Context sync zone not present for container identifier: %{public}@", buf, 0x16u);
            }
            v39 = 1;
          }
        }

        _Block_object_dispose(&v74, 8);
        v18 = v62;

        ++v19;
        v61 = v18;
      }
      while (v57 != v19);
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      v57 = v47;
    }
    while (v47);
    if (!v39)
    {
      v48 = v18;
      v18 = v48;
      if (v48)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v48);
        else
          _HKLogDroppedError();
      }

      v49 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v18 = 0;
  }
  v49 = 1;
LABEL_46:

  v50 = obj;
LABEL_49:

  return v49;
}

void __67__HDIngestDeviceKeyValueEntriesOperation__fetchRepositories_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0;
  objc_msgSend(v3, "deviceContext:", &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v6;
      objc_msgSend(v3, "recordID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v13 = v8;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v5;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error creating device context from record(%{public}@) %{public}@", buf, 0x20u);

    }
  }

  return 1;
}

void __108__HDIngestDeviceKeyValueEntriesOperation__pullDeviceKeyValueEntriesForProfile_repository_transaction_error___block_invoke_187(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = objc_retainAutorelease(v4);
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;

    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update device key value pairs: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

}

uint64_t __81__HDIngestDeviceKeyValueEntriesOperation__fetchRemoteCloudEntriesFromZone_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v16 = 0;
  objc_msgSend(v6, "deviceKeyValueEntry:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {
    v10 = v8;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = v11;
      objc_msgSend(v6, "recordID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v10;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching key value entry for remote record(%{public}@) during deleting local entries %{public}@", buf, 0x20u);

    }
  }

  return 1;
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

- (HDIngestDeviceKeyValueEntriesOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDIngestDeviceKeyValueEntriesOperation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContainerIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HDIngestDeviceKeyValueEntriesOperation initWithAccessibilityAssertion:containerIdentifier:](self, "initWithAccessibilityAssertion:containerIdentifier:", 0, v5);
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
