@implementation HDCloudSyncRequestDataUploadOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HDCloudSyncModifyRecordsOperation *v21;
  void *v22;
  void *v23;
  void *v24;
  HDCloudSyncModifyRecordsOperation *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  HDCloudSyncRequestDataUploadOperation *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryCKContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedCloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v7, "unifiedSyncZoneForContainerID:error:", v8, &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;

  if (v9 || !v10)
  {
    if (v9)
    {
      v31 = 0;
      objc_msgSend(v9, "recordsForClass:error:", objc_opt_class(), &v31);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v31;
      v14 = v13;
      if (v12 || !v13)
      {
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
          {
            v28 = v17;
            objc_msgSend(v9, "zoneIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v35 = self;
            v36 = 2114;
            v37 = v29;
            _os_log_fault_impl(&dword_1B7802000, v28, OS_LOG_TYPE_FAULT, "%{public}@ Retrieved multiple data upload request records for %{public}@. This is unexpected.", buf, 0x16u);

          }
        }
        objc_msgSend(v12, "firstObject", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          objc_msgSend(v9, "zoneIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "zoneIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDCloudSyncDataUploadRequestRecord recordForZoneID:](HDCloudSyncDataUploadRequestRecord, "recordForZoneID:", v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v21 = [HDCloudSyncModifyRecordsOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "record");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v21, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v22, v5, v24, 0);

        -[HDCloudSyncModifyRecordsOperation setSavePolicy:](v25, "setSavePolicy:", 2);
        -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v25);

        v14 = v30;
      }
      else
      {
        _HKInitializeLogging();
        v15 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v26 = v15;
          objc_msgSend(v9, "zoneIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = self;
          v36 = 2114;
          v37 = v27;
          v38 = 2114;
          v39 = v14;
          _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get data upload request records for %{public}@, %{public}@", buf, 0x20u);

        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v14);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 715, CFSTR("The unified zone must already exist before requesting data upload."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v16);

    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2114;
      v37 = v10;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v10);
  }

}

@end
