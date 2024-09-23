@implementation HDCloudSyncPreparePushZoneForStoreOperation

+ (id)operationTagDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E6D4D598;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (HDCloudSyncPreparePushZoneForStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncPreparePushZoneForStoreOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 store:(id)a5
{
  id v9;
  HDCloudSyncPreparePushZoneForStoreOperation *v10;
  HDCloudSyncPreparePushZoneForStoreOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPreparePushZoneForStoreOperation;
  v10 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_store, a5);

  return v11;
}

- (void)main
{
  HDCloudSyncPreparePushZoneForStoreOperation *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  HDCloudSyncModifyRecordZonesOperation *v51;
  void *v52;
  void *v53;
  HDCloudSyncModifyRecordZonesOperation *v54;
  void *v55;
  HDCloudSyncModifyRecordZonesOperation *v56;
  uint64_t v57;
  id v58;
  void *v59;
  char v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _QWORD v65[6];
  char v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  uint8_t v73[128];
  _BYTE buf[24];
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];

  v2 = self;
  v81[1] = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "primaryCKContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncStore containerIdentifier](v2->_store, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)v6;
  LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", v6);

  if ((v4 & 1) != 0)
  {
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "repository");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldPushToUnifiedZone");

    v11 = (void *)MEMORY[0x1E0C95098];
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncContainerPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v10;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v13);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HDCloudSyncStore storeIdentifier](v2->_store, "storeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hd_individualSyncZoneIDWithSyncCircleIdentifier:storeIdentifier:", v13, v15);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "computedState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "targets");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    v62 = (uint64_t)v2;
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v69 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v23, "store");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "storeIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncStore storeIdentifier](v2->_store, "storeIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
          {
            objc_msgSend(v23, "zoneIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEquivalentToZone:container:", v63, v64);

            v2 = (HDCloudSyncPreparePushZoneForStoreOperation *)v62;
            if (v28)
            {
              objc_storeStrong((id *)(v62 + 112), v23);
              objc_msgSend((id)v62, "finishWithSuccess:error:", 1, 0);
              v33 = v63;
              goto LABEL_35;
            }
          }
          else
          {

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      }
      while (v20);
    }

    -[HDCloudSyncOperation configuration](v2, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "cachedCloudState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0;
    objc_msgSend(v30, "zonesByIdentifierWithError:", &v67);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v67;

    if (v31 || !v18)
    {
      v33 = v63;
      if (!v31)
      {
        _HKInitializeLogging();
        v34 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v62;
          _os_log_debug_impl(&dword_1B7802000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found.", buf, 0xCu);
        }
      }
      objc_msgSend(v31, "allValues");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __51__HDCloudSyncPreparePushZoneForStoreOperation_main__block_invoke;
      v65[3] = &unk_1E6CEB470;
      v66 = v60;
      v65[4] = v64;
      v65[5] = v63;
      objc_msgSend(v35, "hk_firstObjectPassingTest:", v65);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        -[HDCloudSyncPreparePushZoneForStoreOperation _finishWithZone:](v62, v36);
      }
      else
      {
        v61 = v18;
        v37 = v63;
        objc_msgSend((id)v62, "configuration");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "repository");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "primaryCKContainer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v62, "configuration");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "repository");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "profileIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        HDDatabaseForContainer(v40, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v44, "databaseScope") == 2)
        {
          v59 = v44;
          v45 = v40;
          _HKInitializeLogging();
          v46 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v47 = *(void **)(v62 + 104);
            v48 = v46;
            objc_msgSend(v47, "storeIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v62;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v49;
            *(_WORD *)&buf[22] = 2114;
            v75 = v37;
            _os_log_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@: No zone found for store %{public}@; creating zone %{public}@",
              buf,
              0x20u);

          }
          v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v37);
          v51 = [HDCloudSyncModifyRecordZonesOperation alloc];
          objc_msgSend((id)v62, "configuration");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v81[0] = v50;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v51;
          v55 = v45;
          v56 = -[HDCloudSyncModifyRecordZonesOperation initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:](v54, "initWithConfiguration:container:recordZonesToSave:recordZoneIDsToDelete:", v52, v45, v53, 0);

          v40 = v55;
          v57 = MEMORY[0x1E0C809B0];
          v72[0] = MEMORY[0x1E0C809B0];
          v72[1] = 3221225472;
          v72[2] = __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke;
          v72[3] = &unk_1E6CE77A0;
          v72[4] = v62;
          -[HDCloudSyncOperation setOnError:](v56, "setOnError:", v72);
          *(_QWORD *)buf = v57;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke_196;
          v75 = &unk_1E6CEB498;
          v76 = v62;
          v77 = v50;
          v78 = v37;
          v79 = v40;
          v44 = v59;
          v80 = v59;
          v58 = v50;
          -[HDCloudSyncOperation setOnSuccess:](v56, "setOnSuccess:", buf);
          -[HDCloudSyncOperation start](v56, "start");

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 712, CFSTR("Unable to create zones in a non-private database."));
          v56 = (HDCloudSyncModifyRecordZonesOperation *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v62, "finishWithSuccess:error:", 0, v56);
        }

        v18 = v61;
      }

    }
    else
    {
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E0CB5370];
      v33 = v63;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v18;
        _os_log_error_impl(&dword_1B7802000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zone identifiers, %{public}@", buf, 0x16u);
      }
      objc_msgSend((id)v62, "finishWithSuccess:error:", 0, v18);
    }

LABEL_35:
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 712, CFSTR("Unable to create push zones in a non-primary container."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 0, v14);

  }
}

uint64_t __51__HDCloudSyncPreparePushZoneForStoreOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "zoneIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    if (*(_BYTE *)(a1 + 48) && objc_msgSend(v3, "zoneType") == 2)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "zoneIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEquivalentToZone:container:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_finishWithZone:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  HDCloudSyncTarget *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  HDCloudSyncStoreRecord *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[6];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__20;
    v54 = __Block_byref_object_dispose__20;
    v55 = 0;
    v4 = objc_opt_class();
    v49 = 0;
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __63__HDCloudSyncPreparePushZoneForStoreOperation__finishWithZone___block_invoke;
    v48[3] = &unk_1E6CEB4C0;
    v48[4] = a1;
    v48[5] = &v50;
    v5 = objc_msgSend(v3, "recordsForClass:epoch:error:enumerationHandler:", v4, 0, &v49, v48);
    v46 = v49;
    if ((v5 & 1) != 0)
    {
      if (!v51[5])
      {
        objc_msgSend((id)a1, "configuration");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "repository");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "repository");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "primaryCKContainer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cachedOwnerIdentifierForContainer:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)a1, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "repository");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "profile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cloudSyncManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v15, "isChild");

        v40 = [HDCloudSyncStoreRecord alloc];
        objc_msgSend((id)a1, "configuration");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "syncContainerPrefix");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 104), "storeIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "configuration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "repository");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "syncIdentityManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "currentSyncIdentity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "identity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "zoneIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "zoneIdentifier");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = -[HDCloudSyncStoreRecord initInSyncCircle:ownerIdentifier:storeIdentifier:syncIdentity:isChild:zoneID:](v40, "initInSyncCircle:ownerIdentifier:storeIdentifier:syncIdentity:isChild:zoneID:", v43, v45, v42, v20, v41, v22);
        v24 = (void *)v51[5];
        v51[5] = v23;

        v25 = (void *)v51[5];
        v47 = 0;
        LOBYTE(v22) = objc_msgSend(v25, "validateWithError:", &v47);
        v26 = v47;
        if ((v22 & 1) == 0)
        {
          _HKInitializeLogging();
          v27 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v58 = v26;
            _os_log_fault_impl(&dword_1B7802000, v27, OS_LOG_TYPE_FAULT, "Failed to validate store record after creation: %{public}@", buf, 0xCu);
          }
          objc_msgSend((id)a1, "finishWithSuccess:error:", 0, v26);
        }

      }
      v28 = [HDCloudSyncTarget alloc];
      objc_msgSend((id)a1, "configuration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "repository");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "primaryCKContainer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "zoneIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[HDCloudSyncTarget initWithPurpose:container:zoneIdentifier:storeRecord:store:options:](v28, "initWithPurpose:container:zoneIdentifier:storeRecord:store:options:", 0, v31, v32, v51[5], *(_QWORD *)(a1 + 104), 0);
      v34 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v33;

      objc_msgSend((id)a1, "configuration");
      v35 = objc_claimAutoreleasedReturnValue();
      -[NSObject computedState](v35, "computedState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *(_QWORD *)(a1 + 112);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "replaceTargets:", v37);

      v38 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v35 = (id)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "zoneIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = (id)a1;
        v59 = 2114;
        v60 = v39;
        v61 = 2114;
        v62 = v46;
        _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

      }
      v38 = v46;
    }

    objc_msgSend((id)a1, "finishWithSuccess:error:", v5, v38);
    _Block_object_dispose(&v50, 8);

  }
}

void __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
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
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 104);
    v8 = v5;
    objc_msgSend(v7, "storeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v4;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create zone for store: %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

void __73__HDCloudSyncPreparePushZoneForStoreOperation__createZoneWithIdentifier___block_invoke_196(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HDCloudSyncZoneIdentifier *v8;
  uint64_t v9;
  void *v10;
  id v11;
  HDCloudSyncCachedZone *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "zoneID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hd_storeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v4;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully created zone for store: %{public}@", (uint8_t *)&v18, 0x16u);

  }
  v8 = [HDCloudSyncZoneIdentifier alloc];
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDCloudSyncZoneIdentifier initForZone:container:scope:](v8, "initForZone:container:scope:", v9, v10, objc_msgSend(*(id *)(a1 + 64), "databaseScope"));

  v12 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "repository");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessibilityAssertion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v12, "initForZoneIdentifier:repository:accessibilityAssertion:", v11, v14, v16);

  -[HDCloudSyncPreparePushZoneForStoreOperation _finishWithZone:](*(_QWORD *)(a1 + 32), v17);
}

uint64_t __63__HDCloudSyncPreparePushZoneForStoreOperation__finishWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a2;
  objc_msgSend(v4, "storeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "storeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v7 ^ 1u;
}

- (HDCloudSyncTarget)pushTarget
{
  return self->_pushTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTarget, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
