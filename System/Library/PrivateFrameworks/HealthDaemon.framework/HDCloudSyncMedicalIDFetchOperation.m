@implementation HDCloudSyncMedicalIDFetchOperation

- (HDCloudSyncMedicalIDFetchOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncMedicalIDFetchOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5
{
  id v9;
  HDCloudSyncMedicalIDFetchOperation *v10;
  HDCloudSyncMedicalIDFetchOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncMedicalIDFetchOperation;
  v10 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_container, a5);

  return v11;
}

- (void)main
{
  CKContainer *container;
  void *v4;
  void *v5;
  void *v6;
  CKContainer *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDCloudSyncMedicalIDRecord *v13;
  BOOL v14;
  NSObject **v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  HDCloudSyncMedicalIDRecord *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HDCloudSyncMedicalIDFetchOperation *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  HDCloudSyncMedicalIDFetchOperation *v30;
  uint64_t v31;
  HDCloudSyncMedicalIDRecord *v32;
  NSObject *v33;
  HDCloudSyncMedicalIDRecord *v34;
  void *v35;
  void *v36;
  HDCloudSyncMedicalIDRecord *v37;
  HDCloudSyncMedicalIDRecord *medicalIDRecord;
  NSObject *v39;
  HDCloudSyncMedicalIDRecord *v40;
  void *v41;
  void *cloudMedicalIDData;
  void *v43;
  NSObject *v44;
  _HKMedicalIDData *v45;
  NSObject *v46;
  NSObject *v47;
  int v48;
  void *v49;
  void *v50;
  HDCloudSyncMedicalIDRecord *v51;
  void *v52;
  id obj;
  NSObject *objc;
  HDCloudSyncMedicalIDRecord *obja;
  HDCloudSyncMedicalIDRecord *objb;
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  HDCloudSyncMedicalIDFetchOperation *v61;
  __int16 v62;
  HDCloudSyncMedicalIDRecord *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  container = self->_container;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseForContainer(container, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = container;
  v8 = v6;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedCloudState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContainer containerIdentifier](v7, "containerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  objc_msgSend(v10, "unifiedSyncZoneForContainerID:error:", v11, &v59);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (HDCloudSyncMedicalIDRecord *)v59;

  _HKInitializeLogging();
  if (v12)
    v14 = 1;
  else
    v14 = v13 == 0;
  if (v14)
  {
    v15 = (NSObject **)MEMORY[0x1E0CB5300];
    v16 = (void *)*MEMORY[0x1E0CB5300];
    v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v17)
      {
        v33 = v16;
        objc_msgSend(v8, "databaseScope");
        CKDatabaseScopeString();
        v34 = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
        -[CKContainer containerIdentifier](v7, "containerIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = self;
        v62 = 2114;
        v63 = v34;
        v64 = 2114;
        v65 = v35;
        _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ No unified zone exists in cache for database %{public}@ in %{public}@", buf, 0x20u);

      }
      v30 = self;
      v31 = 1;
      v32 = 0;
      goto LABEL_20;
    }
    if (v17)
    {
      v18 = v16;
      objc_msgSend(v8, "databaseScope");
      CKDatabaseScopeString();
      v19 = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
      -[CKContainer containerIdentifier](v7, "containerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v61 = self;
      v62 = 2114;
      v63 = v19;
      v64 = 2114;
      v65 = v20;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning Medical ID fetch from cache for %{public}@ in %{public}@", buf, 0x20u);

      v15 = (NSObject **)MEMORY[0x1E0CB5300];
    }
    v58 = 0;
    objc_msgSend(v12, "recordsForClass:error:", objc_opt_class(), &v58);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v58;
    v23 = v22;
    if (v21 || !v22)
    {
      if (v21 && objc_msgSend(v21, "count"))
      {
        if ((unint64_t)objc_msgSend(v21, "count") >= 2)
        {
          _HKInitializeLogging();
          v36 = (void *)*MEMORY[0x1E0CB5300];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_FAULT))
          {
            v47 = v36;
            objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
            objb = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v61 = self;
            v62 = 2114;
            v63 = objb;
            _os_log_fault_impl(&dword_1B7802000, v47, OS_LOG_TYPE_FAULT, "%{public}@ Fetched multiple MedicalID records from the cloud. CKRecordIDs: %{public}@ ", buf, 0x16u);

          }
        }
        objc_msgSend(v21, "firstObject");
        v37 = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
        medicalIDRecord = self->_medicalIDRecord;
        self->_medicalIDRecord = v37;

        _HKInitializeLogging();
        v39 = *MEMORY[0x1E0CB5300];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
        {
          v40 = self->_medicalIDRecord;
          *(_DWORD *)buf = 138543618;
          v61 = self;
          v62 = 2114;
          v63 = v40;
          _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetched MedicalID record from cache %{public}@", buf, 0x16u);
        }
        -[HDCloudSyncMedicalIDRecord medicalIDData](self->_medicalIDRecord, "medicalIDData");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v41;
        v52 = v23;
        if (v41)
        {
          objc_msgSend(MEMORY[0x1E0CB6FD8], "createWithCodable:", v41);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
        }
        obj = v41;
        if (self->_cloudMedicalIDData)
        {
          objc_msgSend(v41, "dateSaved");
          cloudMedicalIDData = (void *)objc_claimAutoreleasedReturnValue();
          if (cloudMedicalIDData)
          {
            -[_HKMedicalIDData dateSaved](self->_cloudMedicalIDData, "dateSaved");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v43, "hk_isBeforeDate:", cloudMedicalIDData);

            v23 = v52;
            if (v48)
              objc_storeStrong((id *)&self->_cloudMedicalIDData, obj);
          }
        }
        else
        {
          v45 = v41;
          cloudMedicalIDData = self->_cloudMedicalIDData;
          self->_cloudMedicalIDData = v45;
        }

        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
        goto LABEL_38;
      }
      _HKInitializeLogging();
      v44 = *v15;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        objc = v44;
        objc_msgSend(v8, "databaseScope");
        CKDatabaseScopeString();
        v51 = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
        -[CKContainer containerIdentifier](v7, "containerIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = self;
        v62 = 2114;
        v63 = v51;
        v64 = 2114;
        v65 = v49;
        _os_log_impl(&dword_1B7802000, objc, OS_LOG_TYPE_DEFAULT, "%{public}@ No MedicalID record exists in the cache for %{public}@ in %{public}@", buf, 0x20u);

      }
      v25 = self;
      v26 = 1;
      v27 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v24 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v46 = v24;
        objc_msgSend(v12, "zoneIdentifier");
        obja = (HDCloudSyncMedicalIDRecord *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v61 = self;
        v62 = 2114;
        v63 = obja;
        v64 = 2114;
        v65 = v23;
        _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get medicalID record for %{public}@, %{public}@", buf, 0x20u);

      }
      v25 = self;
      v26 = 0;
      v27 = v23;
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](v25, "finishWithSuccess:error:", v26, v27);
LABEL_38:

    goto LABEL_39;
  }
  v28 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v61 = self;
    v62 = 2114;
    v63 = v13;
    _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
  }
  v30 = self;
  v31 = 0;
  v32 = v13;
LABEL_20:
  -[HDCloudSyncOperation finishWithSuccess:error:](v30, "finishWithSuccess:error:", v31, v32);
LABEL_39:

}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (_HKMedicalIDData)cloudMedicalIDData
{
  return self->_cloudMedicalIDData;
}

- (HDCloudSyncMedicalIDRecord)medicalIDRecord
{
  return self->_medicalIDRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDRecord, 0);
  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
