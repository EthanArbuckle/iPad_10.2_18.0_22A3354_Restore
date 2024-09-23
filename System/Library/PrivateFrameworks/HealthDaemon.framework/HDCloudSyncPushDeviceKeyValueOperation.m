@implementation HDCloudSyncPushDeviceKeyValueOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  HDCloudSyncCachedZone *v13;
  HDCloudSyncCachedZone *contextSyncZone;
  HDCloudSyncCachedZone *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  HDCloudSyncDeviceContextRecord *v29;
  HDCloudSyncDeviceContextRecord *recordWithCurrentIdentity;
  _QWORD *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id *v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  _QWORD *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  _QWORD v61[5];
  id v62;
  uint64_t *v63;
  id v64;
  id obj;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[4];
  id v73;
  HDCloudSyncPushDeviceKeyValueOperation *v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  HDCloudSyncPushDeviceKeyValueOperation *v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  id *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  _BYTE buf[24];
  void *v90;
  HDCloudSyncPushDeviceKeyValueOperation *v91;
  id v92;
  id v93;
  id v94;
  uint64_t *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__59;
  v70 = __Block_byref_object_dispose__59;
  v71 = 0;
  -[HDCloudSyncOperation profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncIdentityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSyncIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedCloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryCKContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "containerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)(v67 + 5);
  obj = (id)v67[5];
  objc_msgSend(v7, "contextSyncZoneForContainerID:error:", v11, &obj);
  v13 = (HDCloudSyncCachedZone *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, obj);
  contextSyncZone = self->_contextSyncZone;
  self->_contextSyncZone = v13;

  v15 = self->_contextSyncZone;
  if (v15)
  {
    v16 = objc_opt_class();
    v17 = (id *)(v67 + 5);
    v64 = (id)v67[5];
    v18 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke;
    v61[3] = &unk_1E6CF2680;
    v63 = &v66;
    v61[4] = self;
    v62 = v59;
    -[HDCloudSyncCachedZone recordsForClass:error:filter:](v15, "recordsForClass:error:filter:", v16, &v64, v61);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v17, v64);
    if (v58)
    {
      if ((unint64_t)objc_msgSend(v58, "count") < 2)
      {
        objc_msgSend(v58, "firstObject");
        v29 = (HDCloudSyncDeviceContextRecord *)objc_claimAutoreleasedReturnValue();
        recordWithCurrentIdentity = self->_recordWithCurrentIdentity;
        self->_recordWithCurrentIdentity = v29;

        v60[0] = v18;
        v60[1] = 3221225472;
        v60[2] = __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke_191;
        v60[3] = &unk_1E6CF26A8;
        v60[4] = self;
        v31 = v60;
        v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v83 = 0;
        v84 = (id *)&v83;
        v85 = 0x3032000000;
        v86 = __Block_byref_object_copy__59;
        v87 = __Block_byref_object_dispose__59;
        v88 = 0;
        v34 = objc_alloc_init(MEMORY[0x1E0D298C8]);
        *(_QWORD *)buf = v18;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke;
        v90 = &unk_1E6CF26D0;
        v91 = self;
        v95 = &v83;
        v56 = v31;
        v94 = v56;
        v35 = v32;
        v92 = v35;
        v36 = v33;
        v93 = v36;
        objc_msgSend(v34, "setDidFinish:", buf);
        +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "accessibilityAssertion");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "contextWithAccessibilityAssertion:", v39);
        v40 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "beginTask");
        -[HDCloudSyncOperation configuration](self, "configuration");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "repository");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "profile");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "database");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v84;
        v82 = v84[5];
        v77[0] = v18;
        v77[1] = 3221225472;
        v77[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_197;
        v77[3] = &unk_1E6CF26F8;
        v45 = v34;
        v78 = v45;
        v79 = self;
        v46 = v35;
        v47 = v18;
        v48 = v46;
        v80 = v46;
        v49 = v36;
        v50 = (void *)v40;
        v51 = v49;
        v81 = v49;
        v72[0] = v47;
        v72[1] = 3221225472;
        v72[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_4;
        v72[3] = &unk_1E6CF2720;
        v52 = v45;
        v73 = v52;
        v74 = self;
        v53 = v48;
        v75 = v53;
        v54 = v51;
        v76 = v54;
        LOBYTE(v48) = objc_msgSend(v43, "performTransactionWithContext:error:block:inaccessibilityHandler:", v50, &v82, v77, v72);
        objc_storeStrong(v44 + 5, v82);

        if ((v48 & 1) != 0)
          objc_msgSend(v52, "finishTask");
        else
          objc_msgSend(v52, "failTaskWithError:", v84[5]);

        _Block_object_dispose(&v83, 8);
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Multiple device contexts for same identity"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v67[5];
      v67[5] = v19;

      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v22 = v67[5];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v22;
        _os_log_fault_impl(&dword_1B7802000, v21, OS_LOG_TYPE_FAULT, "%{public}@: Error fetching context record for local identity %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (!v67[5])
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 11, CFSTR("No context record for local device on the cloud"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v67[5];
        v67[5] = v26;

      }
      _HKInitializeLogging();
      v28 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v55 = v67[5];
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v55;
        _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching context record for local identity %{public}@", buf, 0x16u);
      }
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v67[5]);
LABEL_18:

    goto LABEL_19;
  }
  v23 = v67[5];
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 724, CFSTR("Context zone not present."));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v67[5];
    v67[5] = v24;

    v23 = v67[5];
  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v23);
LABEL_19:

  _Block_object_dispose(&v66, 8);
}

uint64_t __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(a2, "deviceContextWithError:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    objc_msgSend(v4, "syncIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", a1[5]);

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context record: %{public}@", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

void __46__HDCloudSyncPushDeviceKeyValueOperation_main__block_invoke_191(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  HDCloudSyncModifyRecordsOperation *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HDCloudSyncModifyRecordsOperation *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (v7 && v8)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
      v12 = v10;
      v13 = objc_msgSend(v11, "count");
      v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count");
      *(_DWORD *)buf = 134218240;
      v30 = v13;
      v31 = 2048;
      v32 = v14;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to save %lu key-value records, delete %lu key-value records", buf, 0x16u);

    }
    v15 = *(void **)(a1 + 32);
    objc_msgSend(v7, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v9;
    objc_msgSend(v9, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v28 = v17;
      v18 = v17;
      v19 = v16;
      v20 = [HDCloudSyncModifyRecordsOperation alloc];
      objc_msgSend(v15, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "repository");
      v23 = v16;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "primaryCKContainer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v20, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v21, v25, v19, v18);

      v16 = v23;
      objc_msgSend(v15, "delegateToOperation:", v26);

      v17 = v28;
    }

    v9 = v27;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a4);
  }

}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v9 = a1[4];
      v10 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Error in fetching local entries %{public}@", (uint8_t *)&v11, 0x16u);
    }
    v7 = a1[7];
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v7 + 16))(v7, 0, 0, v8);

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

uint64_t __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_197(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "beginTask");
  v2 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_2;
  v10[3] = &unk_1E6CEC8D0;
  v3 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  -[HDCloudSyncPushDeviceKeyValueOperation _fetchLocalKeyValuesForProtectionCategory:completion:](v3, 0, v10);
  objc_msgSend(*(id *)(a1 + 32), "beginTask");
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_3;
  v6[3] = &unk_1E6CEC8D0;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  -[HDCloudSyncPushDeviceKeyValueOperation _fetchLocalKeyValuesForProtectionCategory:completion:](v4, 1, v6);

  return 1;
}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_2(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(a1[4], "failTaskWithError:", a4);
  }
  else
  {
    objc_msgSend(a1[5], "addObjectsFromArray:", a2);
    objc_msgSend(a1[6], "addObjectsFromArray:", v7);
    objc_msgSend(a1[4], "finishTask");
  }

}

- (void)_fetchLocalKeyValuesForProtectionCategory:(void *)a3 completion:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "repository");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudSyncShimProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextSyncShim");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__HDCloudSyncPushDeviceKeyValueOperation__fetchLocalKeyValuesForProtectionCategory_completion___block_invoke;
    v10[3] = &unk_1E6CF2748;
    v10[4] = a1;
    v12 = a2;
    v11 = v5;
    objc_msgSend(v9, "fetchLocalKeyValueForProtectionCategory:completion:", a2, v10);

  }
}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_3(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(a1[4], "failTaskWithError:", a4);
  }
  else
  {
    objc_msgSend(a1[5], "addObjectsFromArray:", a2);
    objc_msgSend(a1[6], "addObjectsFromArray:", v7);
    objc_msgSend(a1[4], "finishTask");
  }

}

uint64_t __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "beginTask");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_5;
  v4[3] = &unk_1E6CEC8D0;
  v2 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  -[HDCloudSyncPushDeviceKeyValueOperation _fetchLocalKeyValuesForProtectionCategory:completion:](v2, 1, v4);

  return 1;
}

void __87__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSaveAndDeleteWithCompletion___block_invoke_5(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;

  v7 = a3;
  if (a4)
  {
    objc_msgSend(a1[4], "failTaskWithError:", a4);
  }
  else
  {
    objc_msgSend(a1[5], "addObjectsFromArray:", a2);
    objc_msgSend(a1[6], "addObjectsFromArray:", v7);
    objc_msgSend(a1[4], "finishTask");
  }

}

void __95__HDCloudSyncPushDeviceKeyValueOperation__fetchLocalKeyValuesForProtectionCategory_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  int v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  HDCloudSyncDeviceKeyValueRecord *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  char v50;
  id v51;
  void *v52;
  id v53;
  _QWORD *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  _QWORD v70[5];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = (objc_class *)MEMORY[0x1E0C99DE8];
    v8 = a2;
    v9 = objc_alloc_init(v7);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = a1[4];
    v12 = a1[6];
    v59 = v6;
    v13 = v9;
    v14 = v10;
    v15 = v8;
    v55 = v15;
    if (v11)
    {
      v16 = v15;
      v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v18 = MEMORY[0x1E0C809B0];
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke;
      v70[3] = &unk_1E6CF2770;
      v70[4] = v11;
      objc_msgSend(v16, "hk_mapToDictionary:", v70);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(v11 + 104);
      v21 = objc_opt_class();
      v22 = v11;
      v23 = v21;
      v64[0] = v18;
      v64[1] = 3221225472;
      v64[2] = __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke_2;
      v64[3] = &unk_1E6CF2798;
      v57 = v22;
      v64[4] = v22;
      v69 = v12;
      v24 = v19;
      v65 = v24;
      v66 = v14;
      v25 = v17;
      v67 = v25;
      v56 = v13;
      v68 = v56;
      v26 = objc_msgSend(v20, "recordsForClass:epoch:error:enumerationHandler:", v23, 0, &v59, v64);
      v27 = v26;
      if (v26)
      {
        v50 = v26;
        v51 = v14;
        v52 = v6;
        v53 = v13;
        v54 = a1;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v49 = v24;
        v28 = v24;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v61;
          do
          {
            v32 = 0;
            v58 = v30;
            do
            {
              if (*(_QWORD *)v61 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v32);
              if ((objc_msgSend(v25, "containsObject:", v33) & 1) == 0)
              {
                v34 = v31;
                v35 = [HDCloudSyncDeviceKeyValueRecord alloc];
                objc_msgSend(*(id *)(v57 + 104), "zoneIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "zoneIdentifier");
                v37 = v25;
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "objectForKeyedSubscript:", v33);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = *(_QWORD *)(v57 + 128);
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v41 = v28;
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = -[HDCloudSyncDeviceKeyValueRecord initInZone:deviceKeyValueEntry:deviceContextRecord:UUID:](v35, "initInZone:deviceKeyValueEntry:deviceContextRecord:UUID:", v38, v39, v40, v42);
                objc_msgSend(v43, "record");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "addObject:", v44);

                v31 = v34;
                v30 = v58;

                v28 = v41;
                v25 = v37;

              }
              ++v32;
            }
            while (v30 != v32);
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
          }
          while (v30);
        }

        v13 = v53;
        a1 = v54;
        v14 = v51;
        v6 = v52;
        v27 = v50;
        v24 = v49;
      }

    }
    else
    {
      v27 = 0;
    }

    v45 = v59;
    if ((v27 & 1) != 0)
    {
      v46 = v13;
      v47 = v14;
      v48 = 0;
    }
    else
    {
      v46 = 0;
      v47 = 0;
      v48 = v45;
    }
    (*(void (**)(_QWORD, id, id, id))(a1[5] + 16))(a1[5], v46, v47, v48);

  }
  else
  {
    v45 = v5;
  }

}

- (id)_computeEntryHash:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    v3 = a2;
    objc_msgSend(v3, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hash") ^ v5;
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = objc_msgSend(v3, "protectionCategory");

    objc_msgSend(v8, "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "numberWithUnsignedInteger:", v7 ^ objc_msgSend(v10, "hash"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

void __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  -[HDCloudSyncPushDeviceKeyValueOperation _computeEntryHash:](v5, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a3)[2](v6, v8, v7);

}

uint64_t __120__HDCloudSyncPushDeviceKeyValueOperation__computeRecordsToSave_recordIDsToDelete_localEntries_protectionCategory_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0;
  objc_msgSend(v3, "deviceKeyValueEntry:", &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  if (v4)
  {
    objc_msgSend(v4, "syncIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncIdentityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentSyncIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqual:", v10);

    if (v11 && objc_msgSend(v4, "protectionCategory") == *(_QWORD *)(a1 + 72))
    {
      -[HDCloudSyncPushDeviceKeyValueOperation _computeEntryHash:](*(_QWORD *)(a1 + 32), v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
        objc_msgSend(v14, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if ((v17 & 1) == 0)
        {
          objc_msgSend(v3, "updateDeviceKeyValueEntry:", v14);
          v18 = *(void **)(a1 + 64);
          objc_msgSend(v3, "record");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v19);

        }
      }
      else
      {
        v22 = *(void **)(a1 + 48);
        objc_msgSend(v3, "recordID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v14);
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2114;
      v28 = v5;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching key value entry for remote record during computing updated records %{public}@", buf, 0x16u);
    }
  }

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordWithCurrentIdentity, 0);
  objc_storeStrong((id *)&self->_recordsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_contextSyncZone, 0);
}

@end
