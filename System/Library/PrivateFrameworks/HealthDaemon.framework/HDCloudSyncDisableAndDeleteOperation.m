@implementation HDCloudSyncDisableAndDeleteOperation

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HDCloudSyncCompoundOperation *v40;
  void *v41;
  HDCloudSyncDisableAndDeleteOperation *v42;
  HDCloudSyncCompoundOperation *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  __int128 v47;
  id obj;
  uint64_t v49;
  HDCloudSyncCompoundOperation *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  HDCloudSyncDisableAndDeleteOperation *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Disable & Delete"), 0);

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allCKContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v58;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v58 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v11);
        -[HDCloudSyncOperation configuration](self, "configuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "repository");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "profileIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HDDatabaseForContainer(v12, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "databaseScope");
        if (v17 == 2)
        {
          -[HDCloudSyncDisableAndDeleteOperation _createZonesOperationForContainer:](self, "_createZonesOperationForContainer:", v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v51, "addOperation:transitionHandler:", v18, 0);
        }
        else
        {
          if (v17 != 1)
            goto LABEL_11;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncDisableAndDeleteOperation.m"), 68, CFSTR("Public database scope not handled for disable and delete."));
        }

LABEL_11:
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    }
    while (v9);
  }

  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v51, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "repository");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allCKContainers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v21;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
  if (v22)
  {
    v24 = v22;
    v49 = *(_QWORD *)v54;
    *(_QWORD *)&v23 = 138543618;
    v47 = v23;
LABEL_15:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v49)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v25);
      -[HDCloudSyncOperation configuration](self, "configuration", v47);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "repository");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "profileIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      HDDatabaseForContainer(v26, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDCloudSyncOperation configuration](self, "configuration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "cachedCloudState");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "containerIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      objc_msgSend(v32, "zonesForContainerID:error:", v33, &v52);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v52;

      if (!v34 && v35)
      {
        _HKInitializeLogging();
        v44 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v45 = v44;
          objc_msgSend(v26, "containerIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v62 = self;
          v63 = 2114;
          v64 = v46;
          v65 = 2114;
          v66 = v35;
          _os_log_error_impl(&dword_1B7802000, v45, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached zones for container %{public}@, %{public}@", buf, 0x20u);

        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v35);

        v43 = v51;
        goto LABEL_37;
      }
      if (v34)
      {
        v36 = objc_msgSend(v30, "databaseScope");
        switch(v36)
        {
          case 3:
            -[HDCloudSyncDisableAndDeleteOperation _leaveSharesOperationForContainer:](self, "_leaveSharesOperationForContainer:", v26);
            v37 = objc_claimAutoreleasedReturnValue();
            v40 = v51;
LABEL_29:
            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v40, "addOperation:transitionHandler:", v37, 0);
            goto LABEL_30;
          case 2:
            -[HDCloudSyncDisableAndDeleteOperation _deleteZonesOperationForContainer:zones:](self, "_deleteZonesOperationForContainer:zones:", v26, v34);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v51, "addOperation:transitionHandler:", v41, 0);

            -[HDCloudSyncDisableAndDeleteOperation _deleteUnifiedZoneRecordsOperationForContainer:zones:](self, "_deleteUnifiedZoneRecordsOperationForContainer:zones:", v26, v34);
            v37 = objc_claimAutoreleasedReturnValue();
            v40 = v51;
            goto LABEL_29;
          case 1:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v37 = objc_claimAutoreleasedReturnValue();
            -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncDisableAndDeleteOperation.m"), 100, CFSTR("Public database scope not handled for disable and delete."));
LABEL_30:

            break;
        }
      }
      else
      {
        _HKInitializeLogging();
        v38 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
        {
          v37 = v38;
          objc_msgSend(v26, "containerIdentifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v47;
          v62 = self;
          v63 = 2114;
          v64 = v39;
          _os_log_debug_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ No cached zones found for container %{public}@.", buf, 0x16u);

          goto LABEL_30;
        }
      }

      if (v24 == ++v25)
      {
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
        if (v24)
          goto LABEL_15;
        break;
      }
    }
  }

  v42 = self;
  v43 = v51;
  -[HDCloudSyncOperation delegateToOperation:](v42, "delegateToOperation:", v51);
LABEL_37:

}

- (BOOL)_isSecureSecondaryContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.health.sync.secure")))
  {
    objc_msgSend(v4, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryCKContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isEqualToString:", v10) ^ 1;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)_createZonesOperationForContainer:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HDCloudSyncCreateZonesOperation *v18;
  void *v19;
  HDCloudSyncCreateZonesOperation *v20;
  HDCloudSyncCreateZonesOperation *v21;
  HDCloudSyncCreateZonesOperation *v22;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C95088];
  v26 = a3;
  v5 = [v4 alloc];
  v6 = (void *)MEMORY[0x1E0C95098];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "repository");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "syncCircleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hd_masterZoneIDForSyncCircleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithZoneID:", v8);
  v27[0] = v9;
  v10 = objc_alloc(MEMORY[0x1E0C95088]);
  v11 = (void *)MEMORY[0x1E0C95098];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "repository");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "syncCircleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithZoneID:", v15);
  v27[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [HDCloudSyncCreateZonesOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v18, "initWithConfiguration:cloudState:zones:container:", v19, 0, v17, v26);

  LOBYTE(self) = -[HDCloudSyncDisableAndDeleteOperation _isSecureSecondaryContainer:](self, "_isSecureSecondaryContainer:", v26);
  if ((self & 1) != 0)
  {
    -[HDCloudSyncOperation operationIgnoringErrors](v20, "operationIgnoringErrors");
    v21 = (HDCloudSyncCreateZonesOperation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v20;
  }
  v22 = v21;

  return v22;
}

- (id)_deleteZonesOperationForContainer:(id)a3 zones:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncDeleteZonesOperation *v8;
  void *v9;
  HDCloudSyncDeleteZonesOperation *v10;
  void *v11;
  HDCloudSyncDeleteZonesOperation *v12;
  HDCloudSyncDeleteZonesOperation *v13;

  v6 = a4;
  v7 = a3;
  v8 = [HDCloudSyncDeleteZonesOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDCloudSyncDeleteZonesOperation initWithConfiguration:cloudState:](v8, "initWithConfiguration:cloudState:", v9, 0);

  objc_msgSend(v6, "hk_map:", &__block_literal_global_174);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncDeleteZonesOperation setZonesToDelete:](v10, "setZonesToDelete:", v11);
  LOBYTE(self) = -[HDCloudSyncDisableAndDeleteOperation _isSecureSecondaryContainer:](self, "_isSecureSecondaryContainer:", v7);

  if ((self & 1) != 0)
  {
    -[HDCloudSyncOperation operationIgnoringErrors](v10, "operationIgnoringErrors");
    v12 = (HDCloudSyncDeleteZonesOperation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10;
  }
  v13 = v12;

  return v13;
}

id __80__HDCloudSyncDisableAndDeleteOperation__deleteZonesOperationForContainer_zones___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "zoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if ((unint64_t)(v4 - 3) < 5 || v4 == 1)
  {
    objc_msgSend(v2, "zoneIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_deleteUnifiedZoneRecordsOperationForContainer:(id)a3 zones:(id)a4
{
  id v6;
  HDCloudSyncDeleteRecordsOperation *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HDCloudSyncDeleteRecordsOperation *v31;
  void *v32;
  HDCloudSyncDeleteRecordsOperation *v33;
  void *v34;
  HDCloudSyncDeleteRecordsOperation *v35;
  NSObject *v37;
  void *v38;
  __int128 v39;
  HDCloudSyncDeleteRecordsOperation *v40;
  id v41;
  HDCloudSyncDisableAndDeleteOperation *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  HDCloudSyncDisableAndDeleteOperation *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v6 = a4;
  v7 = [HDCloudSyncDeleteRecordsOperation alloc];
  v42 = self;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[HDCloudSyncDeleteRecordsOperation initWithConfiguration:cloudState:](v7, "initWithConfiguration:cloudState:", v8, 0);

  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v49;
    *(_QWORD *)&v11 = 138543874;
    v39 = v11;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v15, "zoneIdentifier", v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "type");

        if (v17 == 2)
        {
          v18 = objc_opt_class();
          v47 = 0;
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __93__HDCloudSyncDisableAndDeleteOperation__deleteUnifiedZoneRecordsOperationForContainer_zones___block_invoke;
          v45[3] = &unk_1E6CFA348;
          v19 = v43;
          v46 = v19;
          LOBYTE(v18) = objc_msgSend(v15, "recordsForClass:epoch:error:enumerationHandler:", v18, 0, &v47, v45);
          v20 = v47;
          if ((v18 & 1) == 0)
          {
            _HKInitializeLogging();
            v34 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v37 = v34;
              objc_msgSend(v15, "zoneIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v39;
              v53 = v42;
              v54 = 2114;
              v55 = v38;
              v56 = 2114;
              v57 = v20;
              _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get store records for %{public}@, %{public}@", buf, 0x20u);

            }
            -[HDCloudSyncOperation finishWithSuccess:error:](v42, "finishWithSuccess:error:", 0, v20);

            v35 = 0;
            v31 = v40;
            v32 = v41;
            goto LABEL_24;
          }
          objc_msgSend(v15, "zoneIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "zoneIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          +[HDCloudSyncMedicalIDRecord recordIDWithZoneID:](HDCloudSyncMedicalIDRecord, "recordIDWithZoneID:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v23);

          v44 = 0;
          objc_msgSend(v15, "zoneShareWithError:", &v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v44;
          v26 = v25;
          if (v24 || !v25)
          {
            if (v24)
            {
              objc_msgSend(v24, "recordID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v30);

            }
          }
          else
          {
            _HKInitializeLogging();
            v27 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v28 = v27;
              objc_msgSend(v15, "zoneIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v39;
              v53 = v42;
              v54 = 2114;
              v55 = v29;
              v56 = 2114;
              v57 = v26;
              _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Failed to retrieve cached CKShare for zone %{public}@, %{public}@", buf, 0x20u);

            }
          }

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (v12)
        continue;
      break;
    }
  }

  v31 = v40;
  -[HDCloudSyncDeleteRecordsOperation setRecordIDsToDelete:](v40, "setRecordIDsToDelete:", v43);
  v32 = v41;
  if (-[HDCloudSyncDisableAndDeleteOperation _isSecureSecondaryContainer:](v42, "_isSecureSecondaryContainer:", v41))
  {
    -[HDCloudSyncOperation operationIgnoringErrors](v40, "operationIgnoringErrors");
    v33 = (HDCloudSyncDeleteRecordsOperation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = v40;
  }
  v35 = v33;
LABEL_24:

  return v35;
}

uint64_t __93__HDCloudSyncDisableAndDeleteOperation__deleteUnifiedZoneRecordsOperationForContainer_zones___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

- (id)_leaveSharesOperationForContainer:(id)a3
{
  HDCloudSyncLeaveAllSharesOperation *v4;
  void *v5;
  HDCloudSyncLeaveAllSharesOperation *v6;

  v4 = [HDCloudSyncLeaveAllSharesOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v4, "initWithConfiguration:cloudState:", v5, 0);

  return v6;
}

@end
