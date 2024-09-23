@implementation HDCloudSyncDetectSyncDisabledOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  os_log_t *v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  os_log_t v29;
  NSObject *v30;
  void *v31;
  os_log_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  id v39;
  os_log_t v40;
  os_log_t v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  HDCloudSyncDetectSyncDisabledOperation *v51;
  os_log_t v52;
  NSObject *v53;
  void *v54;
  __int128 v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  HDCloudSyncDetectSyncDisabledOperation *v60;
  void *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _QWORD v69[4];
  id v70;
  uint8_t buf[4];
  HDCloudSyncDetectSyncDisabledOperation *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerIdentifierManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allCKContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __46__HDCloudSyncDetectSyncDisabledOperation_main__block_invoke;
  v69[3] = &unk_1E6D0C0D0;
  v9 = v7;
  v70 = v9;
  objc_msgSend(v8, "hk_map:", v69);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedCloudState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v11, "zonesByIdentifierWithError:", &v68);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v68;

  if (!v12 && v13)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v72 = self;
      v73 = 2114;
      v74 = v13;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve cached zones, %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v13);
    goto LABEL_44;
  }
  v56 = v13;
  v57 = v12;
  v58 = v9;
  v59 = v4;
  v60 = self;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v12, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
  if (!v16)
    goto LABEL_35;
  v18 = v16;
  v19 = *(_QWORD *)v65;
  v20 = (os_log_t *)MEMORY[0x1E0CB5370];
  *(_QWORD *)&v17 = 138543618;
  v55 = v17;
  while (2)
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v65 != v19)
        objc_enumerationMutation(v15);
      v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
      objc_msgSend(v22, "zoneIdentifier", v55);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "scope");

      if (v24 != 3)
      {
        if (objc_msgSend(v22, "zoneType") == 2)
        {
          v25 = objc_opt_class();
          v63 = 0;
          objc_msgSend(v22, "recordsForClass:error:", v25, &v63);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v63;
          if (v27)
          {
            v28 = v27;
            _HKInitializeLogging();
            v29 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              v30 = v29;
              objc_msgSend(v22, "zoneIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v72 = v60;
              v73 = 2114;
              v74 = v31;
              v75 = 2114;
              v76 = v28;
              _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve registry record from zone %{public}@, %{public}@", buf, 0x20u);

            }
LABEL_32:

            continue;
          }
          if ((unint64_t)objc_msgSend(v26, "count") >= 2)
          {
            _HKInitializeLogging();
            v32 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              v46 = v32;
              objc_msgSend(v22, "zoneIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v55;
              v72 = v60;
              v73 = 2114;
              v74 = v47;
              _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "%{public}@: Retrieved multiple registry records from zone %{public}@, This is unexpected.", buf, 0x16u);

            }
          }
          objc_msgSend(v26, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            objc_msgSend(v33, "disabledOwnerIdentifiers");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "intersectsSet:", v61);

            if (v36)
            {
              _HKInitializeLogging();
              v50 = *v20;
              if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v51 = v60;
                v72 = v60;
                v73 = 2114;
                v74 = v34;
                v75 = 1024;
                LODWORD(v76) = 1;
                _os_log_impl(&dword_1B7802000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: Registry record %{public}@ contains our info (ownerIdentifier:%d); sync is disabled.",
                  buf,
                  0x1Cu);
                goto LABEL_40;
              }
LABEL_42:
              v4 = v59;
              v51 = v60;
              goto LABEL_43;
            }
          }

        }
        if (objc_msgSend(v22, "zoneType"))
          continue;
        v37 = objc_opt_class();
        v62 = 0;
        objc_msgSend(v22, "recordsForClass:error:", v37, &v62);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v62;
        if (v39)
        {
          v28 = v39;
          _HKInitializeLogging();
          v40 = *v20;
          if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
          {
            v44 = v40;
            objc_msgSend(v22, "zoneIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v72 = v60;
            v73 = 2114;
            v74 = v45;
            v75 = 2114;
            v76 = v28;
            _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve master record from zone %{public}@, %{public}@", buf, 0x20u);

          }
          v26 = v38;
        }
        else
        {
          if ((unint64_t)objc_msgSend(v38, "count") >= 2)
          {
            _HKInitializeLogging();
            v41 = *v20;
            if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
            {
              v48 = v41;
              objc_msgSend(v22, "zoneIdentifier");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v55;
              v72 = v60;
              v73 = 2114;
              v74 = v49;
              _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Retrieved multiple master records from zone %{public}@, This is unexpected.", buf, 0x16u);

            }
          }
          objc_msgSend(v38, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "disabledOwnerIdentifiers");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "intersectsSet:", v61);

          if (v43)
          {
            _HKInitializeLogging();
            v52 = *v20;
            if (!os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v26;
              v26 = v38;
              goto LABEL_42;
            }
            v53 = v52;
            objc_msgSend(v38, "firstObject");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v55;
            v51 = v60;
            v72 = v60;
            v73 = 2114;
            v74 = v54;
            _os_log_impl(&dword_1B7802000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: Master record %{public}@ contains one of our owner identifier; sync is disabled.",
              buf,
              0x16u);

            v34 = v26;
            v26 = v38;
LABEL_40:
            v4 = v59;
LABEL_43:
            v12 = v57;
            v9 = v58;
            v13 = v56;
            -[HDCloudSyncDetectSyncDisabledOperation _disableSyncLocally](v51);

            goto LABEL_44;
          }
          v28 = v38;
        }
        goto LABEL_32;
      }
    }
    v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v18)
      continue;
    break;
  }
LABEL_35:

  -[HDCloudSyncOperation finishWithSuccess:error:](v60, "finishWithSuccess:error:", 1, 0);
  v9 = v58;
  v4 = v59;
  v13 = v56;
  v12 = v57;
LABEL_44:

}

id __46__HDCloudSyncDetectSyncDisabledOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "cachedOwnerIdentifierForContainer:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_disableSyncLocally
{
  HDCloudSyncDisableSyncLocallyOperation *v2;
  void *v3;
  void *v4;
  HDCloudSyncDisableSyncLocallyOperation *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (a1)
  {
    v2 = [HDCloudSyncDisableSyncLocallyOperation alloc];
    objc_msgSend(a1, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cloudState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v2, "initWithConfiguration:cloudState:", v3, v4);

    v6 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke;
    v8[3] = &unk_1E6CE77A0;
    v8[4] = a1;
    -[HDCloudSyncOperation setOnError:](v5, "setOnError:", v8);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke_190;
    v7[3] = &unk_1E6CE7778;
    v7[4] = a1;
    -[HDCloudSyncOperation setOnSuccess:](v5, "setOnSuccess:", v7);
    -[HDCloudSyncOperation start](v5, "start");

  }
}

void __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to disable sync locally after detecting sync disablement for this owner identifier: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 701, CFSTR("Cloud sync has been disabled for this device."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithSuccess:error:", 0, v8);

}

void __61__HDCloudSyncDetectSyncDisabledOperation__disableSyncLocally__block_invoke_190(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Disabled sync locally after detecting sync disablement for this owner identifier.", (uint8_t *)&v6, 0xCu);
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 701, CFSTR("Cloud sync has been disabled for this device."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithSuccess:error:", 0, v5);

}

@end
