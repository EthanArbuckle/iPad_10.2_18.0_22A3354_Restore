@implementation DRSConfigPersistedStore

- (id)configMetadataForUUID:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  DRSConfigPersistedStore *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  v21 = 0;
  -[DRSConfigPersistedStore context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__DRSConfigPersistedStore_configMetadataForUUID_errorOut___block_invoke;
  v11[3] = &unk_1EA3D13B8;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v22;
  objc_msgSend(v7, "performBlockAndWait:", v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __58__DRSConfigPersistedStore_configMetadataForUUID_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  DRSConfigMetadata *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[DRSConfigMetadata _ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:](DRSConfigMetadata, "_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:", v2, v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = v11;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  if (v4)
  {
    v7 = [DRSConfigMetadata alloc];
    -[DRSConfigMetadata _ON_CONTEXT_QUEUE_initWithConfigMetadataMO:](v7, "_ON_CONTEXT_QUEUE_initWithConfigMetadataMO:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (BOOL)addConfigMetdata:(id)a3 errorOut:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  DRSConfigPersistedStore *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[DRSConfigPersistedStore isReadOnly](self, "isReadOnly"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__7;
    v29 = __Block_byref_object_dispose__7;
    v30 = 0;
    -[DRSConfigPersistedStore context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__DRSConfigPersistedStore_addConfigMetdata_errorOut___block_invoke;
    v20[3] = &unk_1EA3D13B8;
    v11 = v6;
    v21 = v11;
    v22 = self;
    v23 = &v25;
    v24 = &v31;
    objc_msgSend(v10, "performBlockAndWait:", v20);

    if (a4)
      *a4 = objc_retainAutorelease((id)v26[5]);
    if (!v26[5])
    {
      if (!*((_BYTE *)v32 + 24))
      {
        v9 = 1;
        goto LABEL_13;
      }
      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "configUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("Attempted to add already existing metadata with config UUID %@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0CB2D50];
        v38 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      DPLogHandle_ConfigPersistedStoreError();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v17))
      {
        objc_msgSend(v11, "configUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v18;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataCollision", "Attempted to add already existing metadata with config UUID %@", buf, 0xCu);

      }
    }
    v9 = 0;
LABEL_13:

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
    goto LABEL_14;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v39 = *MEMORY[0x1E0CB2D50];
  v40[0] = CFSTR("Attempted write operation on read-only ConfigPersistedStore");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v8);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v9 = 0;
LABEL_14:

  return v9;
}

void __53__DRSConfigPersistedStore_addConfigMetdata_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id obj;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_uuidPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v4 = +[DRSConfigMetadata _ON_CONTEXT_QUEUE_countForFilterPredicate:context:errorOut:](DRSConfigMetadata, "_ON_CONTEXT_QUEUE_countForFilterPredicate:context:errorOut:", v2, v3, &v21);
  v5 = v21;
  v6 = v21;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (v4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      v7 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v9 + 40);
      objc_msgSend(v7, "_ON_CONTEXT_QUEUE_moRepresentationInContext:createIfMissing:errorOut:", v8, 1, &obj);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v9 + 40), obj);

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 40), "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v19 = *(id *)(v12 + 40);
        v13 = objc_msgSend(v11, "save:", &v19);
        objc_storeStrong((id *)(v12 + 40), v19);

        if ((v13 & 1) != 0)
        {
          DPLogHandle_ConfigPersistedStore();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v14))
          {
            objc_msgSend(*(id *)(a1 + 32), "configUUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "state");
            DRConfigStringForState();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v23 = v15;
            v24 = 2114;
            v25 = v16;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataSaveSuccess", "Saved %{public}@ with state %{public}@", buf, 0x16u);

          }
        }
        else
        {
          DPLogHandle_ConfigPersistedStoreError();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_signpost_enabled(v14))
          {
            objc_msgSend(*(id *)(a1 + 32), "configUUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
            *(_DWORD *)buf = 138543618;
            v23 = v17;
            v24 = 2114;
            v25 = v18;
            _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigMetadataSaveFailed", "Could not save %{public}@ due to error %{public}@", buf, 0x16u);

          }
        }

      }
    }
  }

}

- (BOOL)applyWaitingConfigWithUUID:(id)a3 appliedDate:(id)a4 errorOut:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  DRSConfigPersistedStore *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[DRSConfigPersistedStore isReadOnly](self, "isReadOnly"))
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = CFSTR("Attempted write operation on read-only ConfigPersistedStore");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v12 = 0;
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__7;
    v28 = __Block_byref_object_dispose__7;
    v29 = 0;
    -[DRSConfigPersistedStore context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __75__DRSConfigPersistedStore_applyWaitingConfigWithUUID_appliedDate_errorOut___block_invoke;
    v19[3] = &unk_1EA3D2878;
    v14 = v8;
    v20 = v14;
    v21 = self;
    v23 = &v24;
    v22 = v9;
    objc_msgSend(v13, "performBlockAndWait:", v19);

    v15 = v25[5];
    v12 = v15 == 0;
    if (v15)
    {
      DPLogHandle_ConfigPersistedStoreError();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v16))
      {
        v17 = v25[5];
        *(_DWORD *)buf = 138543618;
        v31 = v14;
        v32 = 2114;
        v33 = v17;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ApplyWaitingConfigFailed", "Could not apply waiting config %{public}@ due to error %{public}@", buf, 0x16u);
      }

      *a5 = objc_retainAutorelease((id)v25[5]);
    }

    _Block_object_dispose(&v24, 8);
  }

  return v12;
}

void __75__DRSConfigPersistedStore_applyWaitingConfigWithUUID_appliedDate_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  +[DRSConfigMetadata _ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:](DRSConfigMetadata, "_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:", v2, v3, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;
  v6 = v31;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (v4)
    {
      if (objc_msgSend(v4, "state") == 1)
      {
        v7 = objc_msgSend(v4, "completionType");
        objc_msgSend(v4, "receivedDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v4, "completedDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "completionDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[DRSConfigMetadata _isValidState:completionType:receivedDate:appliedDate:completedDate:completionDescription:](DRSConfigMetadata, "_isValidState:completionType:receivedDate:appliedDate:completedDate:completionDescription:", 2, v7, v8, v9, v10, v11);

        if (v12)
        {
          objc_msgSend(v4, "setState:", 2);
          objc_msgSend(v4, "setAppliedDate:", *(_QWORD *)(a1 + 48));
          objc_msgSend(*(id *)(a1 + 40), "context");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v30 = *(id *)(v14 + 40);
          objc_msgSend(v13, "save:", &v30);
          v15 = v30;
          v16 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v15;
LABEL_10:

          goto LABEL_11;
        }
        v25 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("Failed to apply config %@"), v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0CB2D50];
        v33 = v13;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = &v33;
        v22 = &v32;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Attempted to apply non-waiting config %@"), v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB2D50];
        v35 = v13;
        v20 = (void *)MEMORY[0x1E0C99D80];
        v21 = &v35;
        v22 = &v34;
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Attempting to update missing config %@"), v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = v13;
      v20 = (void *)MEMORY[0x1E0C99D80];
      v21 = (void **)v37;
      v22 = &v36;
    }
    objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v16);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)completeConfigWithUUID:(id)a3 completedDate:(id)a4 completionType:(unint64_t)a5 completionDescription:(id)a6 errorOut:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  DRSConfigPersistedStore *v29;
  id v30;
  id v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  if (-[DRSConfigPersistedStore isReadOnly](self, "isReadOnly"))
  {
    if (a7)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v47[0] = CFSTR("Attempted write operation on read-only ConfigPersistedStore");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v16);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__7;
    v38 = __Block_byref_object_dispose__7;
    v39 = 0;
    -[DRSConfigPersistedStore context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke;
    v27[3] = &unk_1EA3D28C8;
    v19 = v12;
    v28 = v19;
    v29 = self;
    v32 = &v34;
    v30 = v13;
    v33 = a5;
    v20 = v14;
    v31 = v20;
    objc_msgSend(v18, "performBlockAndWait:", v27);

    v21 = v35[5];
    v17 = v21 == 0;
    if (v21)
    {
      DPLogHandle_ConfigPersistedStoreError();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v22))
      {
        v23 = (void *)v35[5];
        *(_DWORD *)buf = 138543618;
        v41 = v19;
        v42 = 2114;
        v43 = v23;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CompleteConfigFailed", "Could not complete active config %{public}@ due to error %{public}@", buf, 0x16u);
      }

      if (a7)
        *a7 = objc_retainAutorelease((id)v35[5]);
    }
    else
    {
      DPLogHandle_ConfigPersistedStore();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v24))
      {
        DRConfigCompletionTypeString(a5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v19;
        v42 = 2114;
        v43 = v25;
        v44 = 2114;
        v45 = v20;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CompleteConfigSuceeded", "Completed config with UUID %{public}@ with type %{public}@, description %{public}@", buf, 0x20u);

      }
    }

    _Block_object_dispose(&v34, 8);
  }

  return v17;
}

void __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  id v60;
  _QWORD v61[5];
  _QWORD v62[5];
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  +[DRSConfigMetadata _ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:](DRSConfigMetadata, "_ON_CONTEXT_QUEUE_existingBackingMOWithConfigUUID:context:errorOut:", v2, v3, &v60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v60;
  v6 = v60;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v5);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (v4)
    {
      if (objc_msgSend(v4, "state") != 3)
      {
        if (objc_msgSend(v4, "state") == 2)
        {
          objc_msgSend(v4, "appliedDate");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = *(id *)(a1 + 48);
        }
        v9 = v20;
        v21 = *(_QWORD *)(a1 + 72);
        objc_msgSend(v4, "receivedDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[DRSConfigMetadata _isValidState:completionType:receivedDate:appliedDate:completedDate:completionDescription:](DRSConfigMetadata, "_isValidState:completionType:receivedDate:appliedDate:completedDate:completionDescription:", 3, v21, v22, v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        if (v23)
        {
          objc_msgSend(v4, "setState:", 3);
          objc_msgSend(v4, "setAppliedDate:", v9);
          objc_msgSend(v4, "setCompletionType:", *(_QWORD *)(a1 + 72));
          objc_msgSend(v4, "setCompletedDate:", *(_QWORD *)(a1 + 48));
          objc_msgSend(v4, "setCompletionDescription:", *(_QWORD *)(a1 + 56));
          objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", v9);
          v25 = v24;
          if (objc_msgSend(v4, "logTelemetry"))
          {
            v61[0] = kUUIDKey;
            objc_msgSend(v4, "configUUID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "UUIDString");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v62[0] = v52;
            v61[1] = kTeamIDKey;
            objc_msgSend(v4, "teamID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v62[1] = v26;
            v61[2] = kConfigCompletedEventKey_CompletionType;
            DRConfigCompletionTypeString(*(_QWORD *)(a1 + 72));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v62[2] = v27;
            v61[3] = kConfigCompletedEventKey_ActiveDuration;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v62[3] = v28;
            v61[4] = kConfigCompletedEventKey_ReceivedToCompletedDuration;
            v29 = (void *)MEMORY[0x1E0CB37E8];
            v30 = *(void **)(a1 + 48);
            objc_msgSend(v4, "receivedDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "timeIntervalSinceDate:", v31);
            objc_msgSend(v29, "numberWithDouble:");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v62[4] = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 5);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            DRSCoreAnalyticsSendEvent(kConfigCompletedEventName, v33);
            if (objc_msgSend(v4, "reportToDecisionServer"))
            {
              objc_msgSend(v4, "configUUID");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "cloudKitHelper");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "teamID");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "configUUID");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "UUIDString");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              DRConfigCompletionTypeString(*(_QWORD *)(a1 + 72));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "completionDescription");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)os_transaction_create();
              v57[0] = MEMORY[0x1E0C809B0];
              v57[1] = 3221225472;
              v57[2] = __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke_2;
              v57[3] = &unk_1EA3D28A0;
              v39 = *(_QWORD *)(a1 + 64);
              v58 = v34;
              v59 = v39;
              v50 = v34;
              objc_msgSend(v51, "reportTaskingConfigCompletion:uuidString:completionType:completionDescription:activeDuration:transaction:completionHandler:", v53, v35, v36, v37, v38, v57, v25);

            }
          }
          objc_msgSend(*(id *)(a1 + 40), "context");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "configMO");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "deleteObject:", v41);

          objc_msgSend(*(id *)(a1 + 40), "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v56 = *(id *)(v42 + 40);
          objc_msgSend(v16, "save:", &v56);
          v43 = v56;
          v19 = *(void **)(v42 + 40);
          *(_QWORD *)(v42 + 40) = v43;
        }
        else
        {
          v44 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "UUIDString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringWithFormat:", CFSTR("Failed to complete config %@"), v45);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = (void *)MEMORY[0x1E0CB35C8];
          v63 = *MEMORY[0x1E0CB2D50];
          v64 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v19);
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v49 = *(void **)(v48 + 40);
          *(_QWORD *)(v48 + 40) = v47;

        }
        goto LABEL_7;
      }
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Attempted to complete already-completed config %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB2D50];
      v66 = v9;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = &v66;
      v13 = &v65;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Attempting to update missing config %@"), v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0CB35C8];
      v67 = *MEMORY[0x1E0CB2D50];
      v68[0] = v9;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = (void **)v68;
      v13 = &v67;
    }
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;
LABEL_7:

  }
}

void __110__DRSConfigPersistedStore_completeConfigWithUUID_completedDate_completionType_completionDescription_errorOut___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DPLogHandle_ConfigPersistedStoreError();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigPersistedStoreConfigCompletionTelemetryError", "Telemetry reporting for %{public}@ failed %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

- (id)configMetadatasForPredicate:(id)a3 sortDescriptors:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  DRSConfigPersistedStore *v22;
  id v23;
  id v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__7;
  v31 = __Block_byref_object_dispose__7;
  v32 = 0;
  -[DRSConfigPersistedStore context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__DRSConfigPersistedStore_configMetadatasForPredicate_sortDescriptors_fetchLimit_errorOut___block_invoke;
  v20[3] = &unk_1EA3D28F0;
  v14 = v10;
  v21 = v14;
  v22 = self;
  v15 = v11;
  v25 = &v27;
  v26 = a5;
  v23 = v15;
  v16 = v12;
  v24 = v16;
  objc_msgSend(v13, "performBlockAndWait:", v20);

  if (a6)
    *a6 = objc_retainAutorelease((id)v28[5]);
  v17 = v24;
  v18 = v16;

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __91__DRSConfigPersistedStore_configMetadatasForPredicate_sortDescriptors_fetchLimit_errorOut___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  DRSConfigMetadata *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint64_t v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 72);
  v31 = 0;
  +[DRSConfigMetadata _ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:](DRSConfigMetadata, "_ON_CONTEXT_QUEUE_configMetadataForFilterPredicate:context:sortDescriptors:fetchLimit:errorOut:", v2, v3, v4, v5, &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v31;

  if (v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = v7;
    v10 = *(id *)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v11)
    {
      v12 = v11;
      v26 = v6;
      v13 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v16 = [DRSConfigMetadata alloc];
          -[DRSConfigMetadata _ON_CONTEXT_QUEUE_initWithConfigMetadataMO:](v16, "_ON_CONTEXT_QUEUE_initWithConfigMetadataMO:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v18 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v15, "configUUID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to create ConfigMetadata from backing MO for %@"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x1E0CB35C8];
            v32 = *MEMORY[0x1E0CB2D50];
            v33 = v20;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("DRSConfigPersistenceError"), 0, v22);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v25 = *(void **)(v24 + 40);
            *(_QWORD *)(v24 + 40) = v23;

            goto LABEL_13;
          }
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        if (v12)
          continue;
        break;
      }
LABEL_13:
      v6 = v26;
    }
  }

}

- (DRSConfigPersistedStore)initWithWorkingDirectory:(id)a3 isReadOnly:(BOOL)a4 cloudKitHelper:(id)a5 errorOut:(id *)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  DRSConfigPersistedStore *v16;
  DRSConfigPersistedStore *v17;
  DRSConfigPersistedStore *v18;
  objc_super v20;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  DRSTaskingPersistentContainer(v11, v8, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_msgSend(v13, "newBackgroundContext");
    v20.receiver = self;
    v20.super_class = (Class)DRSConfigPersistedStore;
    v16 = -[DRSConfigPersistedStore init](&v20, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_workingDirectory, a3);
      v17->_isReadOnly = v8;
      objc_storeStrong((id *)&v17->_container, v14);
      objc_storeStrong((id *)&v17->_context, v15);
      objc_storeStrong((id *)&v17->_cloudKitHelper, a5);
    }
    self = v17;

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)_countForFetchRequest:(id)a3 withPredicate:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  unint64_t v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v11 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  objc_msgSend(v10, "setPredicate:", v11);
  if (a5)
    objc_msgSend(v10, "setFetchLimit:", a5);
  -[DRSConfigPersistedStore context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__DRSConfigPersistedStore__countForFetchRequest_withPredicate_fetchLimit_errorOut___block_invoke;
  v16[3] = &unk_1EA3D0E08;
  v18 = &v26;
  v16[4] = self;
  v13 = v10;
  v17 = v13;
  v19 = &v20;
  objc_msgSend(v12, "performBlockAndWait:", v16);

  if (a6)
    *a6 = objc_retainAutorelease((id)v21[5]);
  if (v21[5])
    v14 = 0;
  else
    v14 = v27[3];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

void __83__DRSConfigPersistedStore__countForFetchRequest_withPredicate_fetchLimit_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v8 = 0;
  v4 = objc_msgSend(v2, "countForFetchRequest:error:", v3, &v8);
  v5 = v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (unint64_t)metadataCountForPredicate:(id)a3 fetchLimit:(unint64_t)a4 withErrorOut:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a3;
  +[DRSConfigMetadataMO fetchRequest](DRSConfigMetadataMO, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DRSConfigPersistedStore _countForFetchRequest:withPredicate:fetchLimit:errorOut:](self, "_countForFetchRequest:withPredicate:fetchLimit:errorOut:", v9, v8, a4, a5);

  return v10;
}

- (unint64_t)configCountForPredicate:(id)a3 fetchLimit:(unint64_t)a4 withErrorOut:(id *)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a3;
  +[DRConfigMO fetchRequest](DRConfigMO, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DRSConfigPersistedStore _countForFetchRequest:withPredicate:fetchLimit:errorOut:](self, "_countForFetchRequest:withPredicate:fetchLimit:errorOut:", v9, v8, a4, a5);

  return v10;
}

- (BOOL)clearStoreWithErrorOut:(id *)a3
{
  void *v5;
  BOOL v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  -[DRSConfigPersistedStore context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__DRSConfigPersistedStore_clearStoreWithErrorOut___block_invoke;
  v8[3] = &unk_1EA3D1DD0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__DRSConfigPersistedStore_clearStoreWithErrorOut___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  +[DRSConfigMetadataMO fetchRequest](DRSConfigMetadataMO, "fetchRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v50;
  v6 = v50;

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
    DPLogHandle_ConfigPersistedStoreError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("Unknown");
      if (v8)
        v10 = (const __CFString *)v8;
      *(_DWORD *)buf = 138543362;
      v52 = (uint64_t)v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreError", "Failed to fetch config metadatas due to error: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v11 = objc_msgSend(v4, "count");
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v47;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v47 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v16);
          objc_msgSend(*(id *)(a1 + 32), "context");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "deleteObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v14);
    }

    +[DRConfigMO fetchRequest](DRConfigMO, "fetchRequest");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v19, "executeFetchRequest:error:", v2, &v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v45;
    v6 = v45;

    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v21);
      DPLogHandle_ConfigPersistedStoreError();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v22))
      {
        objc_msgSend(v6, "localizedDescription");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = CFSTR("Unknown");
        if (v23)
          v25 = (const __CFString *)v23;
        *(_DWORD *)buf = 138543362;
        v52 = (uint64_t)v25;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreError", "Failed to fetch configs due to error: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v39 = objc_msgSend(v20, "count");
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v26 = v20;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v42;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v42 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v30);
            objc_msgSend(*(id *)(a1 + 32), "context", v39);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "deleteObject:", v31);

            ++v30;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
        }
        while (v28);
      }

      objc_msgSend(*(id *)(a1 + 32), "context");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v34 = objc_msgSend(v33, "save:", &v40);
      v35 = v40;
      v6 = v40;

      if ((v34 & 1) != 0)
      {
        DPLogHandle_ConfigPersistedStore();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v2))
        {
          *(_DWORD *)buf = 134349312;
          v52 = v11;
          v53 = 2050;
          v54 = v39;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreSuccess", "Deleted %{public}llu config metadatas and %{public}llu configs", buf, 0x16u);
        }
      }
      else
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v35);
        DPLogHandle_ConfigPersistedStoreError();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v2))
        {
          objc_msgSend(v6, "localizedDescription");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)v36;
          v38 = CFSTR("Unknown");
          if (v36)
            v38 = (const __CFString *)v36;
          *(_DWORD *)buf = 138543362;
          v52 = (uint64_t)v38;
          _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearStoreError", "Failed to save deletion of records due to error: %{public}@", buf, 0xCu);

        }
      }
    }
  }

}

- (id)_ON_MOC_cloudChannelConfigMOs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[DRSCloudChannelConfigMO fetchRequest](DRSCloudChannelConfigMO, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSConfigPersistedStore context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v3, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    DPLogHandle_ConfigPersistedStoreError();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      objc_msgSend(v6, "localizedDescription");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("Unknown");
      if (v8)
        v10 = (const __CFString *)v8;
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigError", "Failed to fetch cloud channel config due to error: %{public}@", buf, 0xCu);

    }
    v11 = 0;
  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (void)_ON_MOC_deleteCloudChannelConfigMOs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
          -[DRSConfigPersistedStore context](self, "context");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deleteObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v7);
    }
    -[DRSConfigPersistedStore context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v13 = objc_msgSend(v12, "save:", &v19);
    v14 = v19;

    if ((v13 & 1) == 0)
    {
      DPLogHandle_ConfigPersistedStoreError();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        objc_msgSend(v14, "localizedDescription");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = CFSTR("Unknown");
        if (v16)
          v18 = (const __CFString *)v16;
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CloudChannelConfigDeleteFailed", "Failed to save deletion of cloud channel configs due to error: %{public}@", buf, 0xCu);

      }
    }

  }
}

- (id)cloudChannelConfig
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  -[DRSConfigPersistedStore context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__DRSConfigPersistedStore_cloudChannelConfig__block_invoke;
  v6[3] = &unk_1EA3D1DD0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__DRSConfigPersistedStore_cloudChannelConfig__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  DRSCloudChannelConfig *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_cloudChannelConfigMOs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    if ((unint64_t)objc_msgSend(v2, "count") < 2)
    {
      v5 = [DRSCloudChannelConfig alloc];
      objc_msgSend(v2, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[DRSCloudChannelConfig initWithMO:](v5, "initWithMO:", v6);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
    else
    {
      DPLogHandle_ConfigPersistedStoreError();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v10 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MultipleConfigs", "Multiple configs specified. Reverting to default", v10, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_deleteCloudChannelConfigMOs:", v2);
    }
  }
  else
  {
    DPLogHandle_ConfigPersistedStore();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DefaultConfig", "Not subscribing to any channel by default.", buf, 2u);
    }

  }
}

- (BOOL)updateCloudChannelConfig:(id)a3 errorOut:(id *)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = (unint64_t)a3;
  *a4 = 0;
  -[DRSConfigPersistedStore cloudChannelConfig](self, "cloudChannelConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!(v6 | v7) || v7 && (objc_msgSend((id)v7, "isEqual:", v6) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__7;
    v20 = __Block_byref_object_dispose__7;
    v21 = 0;
    -[DRSConfigPersistedStore context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__DRSConfigPersistedStore_updateCloudChannelConfig_errorOut___block_invoke;
    v12[3] = &unk_1EA3D13B8;
    v12[4] = self;
    v13 = (id)v6;
    v14 = &v22;
    v15 = &v16;
    objc_msgSend(v10, "performBlockAndWait:", v12);

    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = *((_BYTE *)v23 + 24) != 0;

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

  return v9;
}

void __61__DRSConfigPersistedStore_updateCloudChannelConfig_errorOut___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  DRSCloudChannelConfigMO *v5;
  DRSCloudChannelConfigMO *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_cloudChannelConfigMOs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 40))
  {
    if ((unint64_t)objc_msgSend(v2, "count") >= 2)
    {
      DPLogHandle_ConfigPersistedStoreError();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MultipleConfigsWhenUpdating", "Multiple configs specified. Deleting all", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_deleteCloudChannelConfigMOs:", v3);
      v3 = (void *)MEMORY[0x1E0C9AA60];
    }
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v5 = (DRSCloudChannelConfigMO *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = [DRSCloudChannelConfigMO alloc];
      objc_msgSend(*(id *)(a1 + 32), "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[DRSCloudChannelConfigMO initWithContext:](v6, "initWithContext:", v7);

    }
    -[DRSCloudChannelConfigMO setEnvironment:](v5, "setEnvironment:", objc_msgSend(*(id *)(a1 + 40), "environment"));
    -[DRSCloudChannelConfigMO setChannelType:](v5, "setChannelType:", objc_msgSend(*(id *)(a1 + 40), "type"));
    -[DRSCloudChannelConfigMO setPlatform:](v5, "setPlatform:", objc_msgSend(*(id *)(a1 + 40), "platform"));
    objc_msgSend(*(id *)(a1 + 40), "populationSliceNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DRSCloudChannelConfigMO setPopulationSliceNumber:](v5, "setPopulationSliceNumber:", v8);

    -[DRSCloudChannelConfigMO setOverridesDeviceDefault:](v5, "setOverridesDeviceDefault:", objc_msgSend(*(id *)(a1 + 40), "overridesDeviceDefault"));
    objc_msgSend(*(id *)(a1 + 32), "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v10 = objc_msgSend(v9, "save:", &v19);
    v11 = v19;
    v12 = v19;

    DPLogHandle_ConfigPersistedStoreError();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_enabled(v13);
    if ((v10 & 1) != 0)
    {
      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "debugDescription");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistedCloudChannelConfigUpdated", "Updated persisted config to:\n%{public}@", buf, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (v14)
      {
        objc_msgSend(v12, "localizedDescription");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        v18 = CFSTR("Unknown");
        if (v16)
          v18 = (const __CFString *)v16;
        *(_DWORD *)buf = 138543362;
        v21 = v18;
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistedCloudChannelConfigUpdateFailed", "Failed to save cloud channel config due to error: %{public}@", buf, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_ON_MOC_deleteCloudChannelConfigMOs:", v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (DRSTaskingCloudKitHelper)cloudKitHelper
{
  return self->_cloudKitHelper;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_cloudKitHelper, 0);
  objc_storeStrong((id *)&self->_workingDirectory, 0);
}

@end
