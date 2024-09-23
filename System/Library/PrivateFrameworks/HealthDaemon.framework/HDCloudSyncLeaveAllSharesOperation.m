@implementation HDCloudSyncLeaveAllSharesOperation

- (void)main
{
  HDCloudSyncLeaveAllSharesOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  HDCloudSyncLeaveAllSharesOperation *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HDCloudSyncModifyRecordsOperation *v53;
  void *v54;
  HDCloudSyncModifyRecordsOperation *v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id obj;
  void *v66;
  void *v67;
  void *v68;
  HDCloudSyncLeaveAllSharesOperation *v69;
  _QWORD v70[5];
  _QWORD v71[5];
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  id v78;
  id v79;
  _BYTE v80[12];
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint8_t buf[4];
  HDCloudSyncLeaveAllSharesOperation *v86;
  __int16 v87;
  id v88;
  uint64_t v89;

  v2 = self;
  v89 = *MEMORY[0x1E0C80C00];
  if (!self)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_32;
  }
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedCloudState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v4, "zonesByIdentifierWithError:", &v77);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v77;

  if (v5 || !v6)
  {
    v60 = v6;
    v61 = v5;
    v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v5, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
    if (!v10)
    {
LABEL_26:

      v43 = v62;
      v9 = v62;
      v8 = 0;
      v6 = v60;
      v5 = v61;
LABEL_30:

      goto LABEL_31;
    }
    v11 = v10;
    v12 = *(_QWORD *)v74;
    v63 = *(_QWORD *)v74;
    v69 = v2;
LABEL_9:
    v13 = 0;
    v64 = v11;
    while (1)
    {
      v14 = v11;
      v15 = v12;
      if (*(_QWORD *)v74 != v12)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v13);
      objc_msgSend(v16, "zoneIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "containerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDCloudSyncOperation configuration](v2, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "repository");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "containerForContainerIdentifier:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDCloudSyncOperation configuration](v2, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "repository");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "profileIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HDDatabaseForContainer(v21, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v14;
      v12 = v15;
      if (objc_msgSend(v25, "databaseScope") != 3)
        goto LABEL_24;
      v66 = v25;
      v67 = v21;
      v68 = v18;
      v26 = v16;
      objc_msgSend(v26, "zoneIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "zoneIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0;
      *(_QWORD *)v80 = 0;
      v29 = objc_msgSend(v28, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", v80, &v79);
      v30 = *(id *)v80;
      v31 = v79;

      objc_msgSend(v26, "zoneIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "zoneIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v31;
      v34 = objc_msgSend(v33, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v78);
      v35 = v78;

      -[HDCloudSyncOperation configuration](v69, "configuration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "repository");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "profileType");

      if (v38 == 2)
      {
        if ((v29 & 1) != 0)
          goto LABEL_18;
      }
      else if (v38 == 3 && (v34 & 1) != 0)
      {
LABEL_18:

        v72 = 0;
        objc_msgSend(v26, "zoneShareWithError:", &v72);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v72;
        v41 = v40;
        if (!v39 && v40)
        {
          _HKInitializeLogging();
          v44 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v58 = v44;
            objc_msgSend(v26, "zoneIdentifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v80 = 138543874;
            *(_QWORD *)&v80[4] = v69;
            v81 = 2114;
            v82 = v59;
            v83 = 2114;
            v84 = v41;
            _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch CKShare for cached zone %{public}@, %{public}@", v80, 0x20u);

          }
          v8 = objc_retainAutorelease(v41);

          v9 = 0;
          v6 = v60;
          v5 = v61;
          v43 = v62;
          v2 = v69;
          goto LABEL_30;
        }
        v18 = v68;
        v11 = v64;
        if (v39)
        {
          objc_msgSend(v39, "recordID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "addObject:", v42);

        }
        v12 = v63;
        goto LABEL_23;
      }

      v18 = v68;
      v12 = v63;
      v11 = v64;
LABEL_23:
      v25 = v66;
      v21 = v67;
LABEL_24:

      ++v13;
      v2 = v69;
      if (v11 == v13)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
        if (v11)
          goto LABEL_9;
        goto LABEL_26;
      }
    }
  }
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v86 = v2;
    v87 = 2114;
    v88 = v6;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
  }
  v8 = objc_retainAutorelease(v6);
  v9 = 0;
LABEL_31:

LABEL_32:
  v45 = v8;
  v46 = v45;
  if (!v9 && v45)
  {
    v47 = v2;
    v48 = 0;
    v49 = v46;
LABEL_40:
    -[HDCloudSyncOperation finishWithSuccess:error:](v47, "finishWithSuccess:error:", v48, v49);
    goto LABEL_41;
  }
  if (!objc_msgSend(v9, "count"))
  {
    _HKInitializeLogging();
    v57 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v86 = v2;
      _os_log_impl(&dword_1B7802000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: There do not appear to be any shared zones to remove ourselves from.", buf, 0xCu);
    }
    v47 = v2;
    v48 = 1;
    v49 = 0;
    goto LABEL_40;
  }
  -[HDCloudSyncOperation configuration](v2, "configuration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "repository");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "primaryCKContainer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = [HDCloudSyncModifyRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](v2, "configuration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v53, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v54, v52, 0, v9);

  -[HDCloudSyncModifyRecordsOperation setTreatAnyErrorAsFatal:](v55, "setTreatAnyErrorAsFatal:", 1);
  v56 = MEMORY[0x1E0C809B0];
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke;
  v71[3] = &unk_1E6CE77A0;
  v71[4] = v2;
  -[HDCloudSyncOperation setOnError:](v55, "setOnError:", v71);
  v70[0] = v56;
  v70[1] = 3221225472;
  v70[2] = __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke_184;
  v70[3] = &unk_1E6CE7778;
  v70[4] = v2;
  -[HDCloudSyncOperation setOnSuccess:](v55, "setOnSuccess:", v70);
  -[HDCloudSyncOperation start](v55, "start");

LABEL_41:
}

void __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete shares: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __42__HDCloudSyncLeaveAllSharesOperation_main__block_invoke_184(uint64_t a1)
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
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted share records", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

@end
