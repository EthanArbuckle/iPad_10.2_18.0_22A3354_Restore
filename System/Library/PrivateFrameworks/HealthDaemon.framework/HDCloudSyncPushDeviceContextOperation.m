@implementation HDCloudSyncPushDeviceContextOperation

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  void *v42;
  id v43;
  id v44;
  _QWORD v45[5];
  _QWORD v46[4];
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  HDCloudSyncPushDeviceContextOperation *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C95098];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repository");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncCircleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hd_contextSyncZoneIDForSyncCircleIdentifier:", v6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncIdentityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentSyncIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cachedCloudState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "repository");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "primaryCKContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "containerIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v12, "contextSyncZoneForContainerID:error:", v16, &v51);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v51;

  if (v17)
  {
    v50 = 0;
    objc_msgSend(v17, "recordsForClass:error:", objc_opt_class(), &v50);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v50;
    if (v19)
    {
      v21 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke;
      v48[3] = &unk_1E6CE8EB8;
      v48[4] = self;
      v22 = v10;
      v49 = v22;
      objc_msgSend(v19, "hk_filter:", v48);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v23, "count") < 2)
      {
        objc_msgSend(v23, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "repository");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "cloudSyncShimProvider");
        v39 = v10;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "contextSyncShim");
        v37 = v23;
        v35 = v20;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_2;
        v41[3] = &unk_1E6CE8F30;
        v41[4] = self;
        v42 = v31;
        v43 = v40;
        v44 = v19;
        v24 = v31;
        objc_msgSend(v36, "lookupOrCreateLocalDeviceContextWithCompletion:", v41);

        v20 = v35;
        v23 = v37;

        v10 = v39;
        v30 = v42;
      }
      else
      {
        +[HDCloudSyncDeviceContextRecord recordIDWithZoneID:syncIdentity:](HDCloudSyncDeviceContextRecord, "recordIDWithZoneID:syncIdentity:", v40, v22);
        v46[0] = v21;
        v46[1] = 3221225472;
        v46[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_188;
        v46[3] = &unk_1E6CE8EE0;
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v47 = v24;
        objc_msgSend(v23, "hk_map:", v46);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v26 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v53 = self;
          _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Multiple device contexts for same identity", buf, 0xCu);
        }
        if (+[HDCloudSyncTapToRadar isTapToRadarAllowed](HDCloudSyncTapToRadar, "isTapToRadarAllowed"))
        {
          v38 = v24;
          v27 = (void *)MEMORY[0x1E0CB3940];
          -[HDCloudSyncPushDeviceContextOperation _describeRecords:]((uint64_t)self, v19);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringWithFormat:", CFSTR("Found multiple device context records for local sync identity in the cloud sync cache: \n %@"), v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncPushDeviceContextOperation _requestTapToRadarWithDescription:]((uint64_t)self, v29);

          v24 = v38;
        }
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_194;
        v45[3] = &unk_1E6CE8030;
        v45[4] = self;
        -[HDCloudSyncPushDeviceContextOperation _updateRecordsAdd:recordIDsToDelete:completion:](self, 0, v25, v45);

        v30 = v47;
      }

    }
    else
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v20);
    }

  }
  else
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 724, CFSTR("Context zone not present."));
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v18);
  }

}

uint64_t __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(a2, "deviceContextWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3)
  {
    objc_msgSend(v3, "syncIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v4;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context record: %{public}@", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

id __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((a1 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_describeRecords:(uint64_t)a1
{
  objc_class *v2;
  id v3;
  id v4;

  if (a1)
  {
    v2 = (objc_class *)MEMORY[0x1E0CB37A0];
    v3 = a2;
    v4 = objc_alloc_init(v2);
    objc_msgSend(v4, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR("\n"), v3, &__block_literal_global_224);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_requestTapToRadarWithDescription:(uint64_t)a1
{
  id v3;
  void *v4;
  char v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0CB7718]);

    if ((v5 & 1) == 0)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __75__HDCloudSyncPushDeviceContextOperation__requestTapToRadarWithDescription___block_invoke;
      v6[3] = &unk_1E6CE80E8;
      v7 = v3;
      +[HDCloudSyncTapToRadar showTapToRadarRequestWithTitle:message:proceed:disable:completion:](HDCloudSyncTapToRadar, "showTapToRadarRequestWithTitle:message:proceed:disable:completion:", CFSTR("Health Cloud Sync Encountered an unexpected error"), CFSTR("Please file a radar."), v6, &__block_literal_global_8, &__block_literal_global_219);

    }
  }

}

void __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_194(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Multiple device contexts for same identity"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithSuccess:error:", 0, v3);

  }
}

- (void)_updateRecordsAdd:(void *)a3 recordIDsToDelete:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  HDCloudSyncModifyRecordsOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HDCloudSyncModifyRecordsOperation *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;

  v7 = a4;
  if (a1)
  {
    v8 = a3;
    v9 = a2;
    v10 = [HDCloudSyncModifyRecordsOperation alloc];
    objc_msgSend(a1, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryCKContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v10, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v11, v14, v9, v8);

    v16 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke;
    v20[3] = &unk_1E6CE8F80;
    v20[4] = a1;
    v17 = v7;
    v21 = v17;
    -[HDCloudSyncOperation setOnError:](v15, "setOnError:", v20);
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke_210;
    v18[3] = &unk_1E6CE8FA8;
    v19 = v17;
    -[HDCloudSyncOperation setOnSuccess:](v15, "setOnSuccess:", v18);
    -[HDCloudSyncOperation start](v15, "start");

  }
}

void __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  _BYTE buf[24];
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8 = *(id *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v9 = v7;
      v10 = v5;
      if (v8)
      {
        v53 = 0;
        objc_msgSend(v9, "deviceContextWithError:", &v53);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v53;
        if (v11)
        {
          objc_msgSend(v9, "record");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "modificationDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -*MEMORY[0x1E0CB4620]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v10)
            && !objc_msgSend(v14, "hk_isBeforeDate:", v15))
          {
            v16 = 0;
          }
          else
          {
            objc_msgSend(v9, "updateDeviceContextWithContext:", v10);
            objc_msgSend(v9, "record");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v24 = v16;

          v8 = 0;
          v20 = v24;
        }
        else
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v8;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v9;
            *(_WORD *)&buf[22] = 2114;
            v56 = v12;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch device context from record: %{public}@, error: %{public}@", buf, 0x20u);
          }
          v23 = v12;
          if (v23)
          {
            v8 = objc_retainAutorelease(v23);
            v20 = 0;
            v24 = v8;
          }
          else
          {
            v8 = 0;
            v24 = 0;
            v20 = 0;
          }
        }

      }
      else
      {
        v20 = 0;
      }

      v25 = v8;
      v21 = *(_QWORD *)(a1 + 32);
      if (v25)
      {
        v26 = v25;
        objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v25);
LABEL_38:

        goto LABEL_39;
      }
    }
    else if (v8)
    {
      v17 = *(id *)(a1 + 48);
      v18 = v5;
      v19 = -[HDCloudSyncDeviceContextRecord initInZone:deviceContext:]([HDCloudSyncDeviceContextRecord alloc], "initInZone:deviceContext:", v17, v18);

      objc_msgSend(v19, "record");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v21 = 0;
      v20 = 0;
    }
    if (v21)
    {
      v27 = (void *)MEMORY[0x1E0C99D68];
      v28 = -*MEMORY[0x1E0CB4618];
      v29 = *(id *)(a1 + 56);
      objc_msgSend(v27, "dateWithTimeIntervalSinceNow:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", *MEMORY[0x1E0CB7728]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isAppleInternalInstall");

      if (v34 && v32)
      {
        v35 = v32;

        v30 = v35;
      }
      v36 = MEMORY[0x1E0C809B0];
      _HKInitializeLogging();
      v37 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        objc_msgSend(v30, "description");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v39;
        _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_DEFAULT, "Attempting to prune device context data based on pruning date: %@", buf, 0xCu);

        v36 = MEMORY[0x1E0C809B0];
      }
      *(_QWORD *)buf = v36;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __90__HDCloudSyncPushDeviceContextOperation__recordIDsToPruneFromCurrentDeviceContextRecords___block_invoke;
      v56 = &unk_1E6CE8F58;
      v57 = v21;
      v58 = v30;
      v40 = v30;
      objc_msgSend(v29, "hk_mapToSet:", buf);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = 0;
      v36 = MEMORY[0x1E0C809B0];
    }
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = objc_msgSend(v26, "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v20 != 0;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v43;
      _os_log_impl(&dword_1B7802000, v42, OS_LOG_TYPE_DEFAULT, "Attempting to save %d context records, delete %lu context records", buf, 0x12u);

    }
    v44 = *(void **)(a1 + 32);
    if (v20)
    {
      v54 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v26, "allObjects");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v36;
    v49[1] = 3221225472;
    v49[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_199;
    v49[3] = &unk_1E6CE8F08;
    v47 = *(void **)(a1 + 40);
    v49[4] = *(_QWORD *)(a1 + 32);
    v50 = v47;
    v48 = v20;
    v51 = v48;
    v52 = *(id *)(a1 + 56);
    -[HDCloudSyncPushDeviceContextOperation _updateRecordsAdd:recordIDsToDelete:completion:](v44, v45, v46, v49);

    if (v20)
    v20 = v48;
    goto LABEL_38;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v6);
LABEL_39:

}

void __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v15 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]) || objc_msgSend(v15, "code") != 14)
      goto LABEL_11;
    v5 = +[HDCloudSyncTapToRadar isTapToRadarAllowed](HDCloudSyncTapToRadar, "isTapToRadarAllowed");

    v3 = v15;
    if (v5)
    {
      objc_msgSend(v15, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(v4, "domain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C94B20])
          || objc_msgSend(v4, "code") != 2004)
        {
          goto LABEL_10;
        }
        objc_msgSend(v4, "userInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94810]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("record to insert already exists"));

        if (v10)
        {
          v11 = (void *)MEMORY[0x1E0CB3940];
          v12 = *(void **)(a1 + 32);
          -[HDCloudSyncPushDeviceContextOperation _describeRecord:ckRecord:](v12, *(void **)(a1 + 40), *(void **)(a1 + 48));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncPushDeviceContextOperation _describeRecords:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 56));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("Encountered a CloudKit constraint violation. Very likely attempted to create a device context for local sync identity while it already exists. \n Error: %@ \n Conflicting record: %@ \n Existing records: %@"), v15, v7, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncPushDeviceContextOperation _requestTapToRadarWithDescription:]((uint64_t)v12, v14);

LABEL_10:
        }
      }
LABEL_11:

      v3 = v15;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", v3 == 0, v3);

}

- (id)_describeRecord:(void *)a3 ckRecord:
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5)
    {
      objc_msgSend(v5, "printDescription");
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "recordID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordName");
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return a1;
}

id __90__HDCloudSyncPushDeviceContextOperation__recordIDsToPruneFromCurrentDeviceContextRecords___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0;
  objc_msgSend(v3, "deviceContextWithError:", &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;
  if (!v4)
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v5;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context record: %{public}@", buf, 0x16u);
    }
    goto LABEL_8;
  }
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

  if ((v11 & 1) != 0)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "record");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "modificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "hk_isBeforeDate:", *(_QWORD *)(a1 + 40)))
  {

    goto LABEL_8;
  }
  objc_msgSend(v3, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

void __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to modify records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke_210(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__HDCloudSyncPushDeviceContextOperation__requestTapToRadarWithDescription___block_invoke(uint64_t a1)
{
  return +[HDCloudSyncTapToRadar openTapToRadarWithTitle:description:](HDCloudSyncTapToRadar, "openTapToRadarWithTitle:description:", CFSTR("[Cloud Sync] Context Sync: Encountered duplicate device context"), *(_QWORD *)(a1 + 32));
}

void __75__HDCloudSyncPushDeviceContextOperation__requestTapToRadarWithDescription___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBool:forKey:", 1, *MEMORY[0x1E0CB7718]);

}

uint64_t __58__HDCloudSyncPushDeviceContextOperation__describeRecords___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "printDescription");
}

@end
