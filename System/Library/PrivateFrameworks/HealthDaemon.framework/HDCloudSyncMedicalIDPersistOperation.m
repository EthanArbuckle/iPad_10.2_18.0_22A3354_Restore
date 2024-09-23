@implementation HDCloudSyncMedicalIDPersistOperation

- (BOOL)performWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  _HKMedicalIDData *v17;
  os_log_t *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v27;
  id v28;
  uint8_t buf[4];
  HDCloudSyncMedicalIDPersistOperation *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "medicalIDDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v7, "fetchMedicalIDWithError:", &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;

  if (!v8 && v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v9;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch local MedicalID during cloud sync with error %{public}@", buf, 0x16u);
    }
    if (a3)
    {
      v11 = 0;
      *a3 = objc_retainAutorelease(v9);
      goto LABEL_29;
    }
    _HKLogDroppedError();
LABEL_17:
    v11 = 0;
    goto LABEL_29;
  }
  if (v8)
  {
    objc_msgSend(v8, "dateSaved");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDData dateSaved](self->_medicalIDDataToPersist, "dateSaved");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "hk_isAfterDate:", v13);

    if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v30 = self;
        _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Local MedicalID updated during cloud sync. Aborting.", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 716, CFSTR("Local Medical ID updated during cloud sync."));
      goto LABEL_17;
    }
  }
  if (objc_msgSend(v8, "isEqualToSyncedData:", self->_medicalIDDataToPersist))
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Local MedicalID is the same as the MedicalID to be persisted. Completing persist operation successfully.", buf, 0xCu);
    }
    v11 = 1;
  }
  else
  {
    v17 = self->_medicalIDDataToPersist;
    _HKInitializeLogging();
    v18 = (os_log_t *)MEMORY[0x1E0CB5300];
    v19 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating Medical ID on disk.", buf, 0xCu);
    }
    -[HDCloudSyncOperation configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "repository");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "medicalIDDataManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v11 = objc_msgSend(v22, "updateMedicalIDWithSyncedData:provenance:error:", v17, 0, &v28);

    v23 = v28;
    if ((v11 & 1) == 0)
    {
      _HKInitializeLogging();
      v24 = *v18;
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v30 = self;
        v31 = 2114;
        v32 = v23;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Failed to persist MedicalID to disk during cloud sync with error %{public}@", buf, 0x16u);
      }
      v25 = v23;
      if (v25)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v25);
        else
          _HKLogDroppedError();
      }

    }
  }
LABEL_29:

  return v11;
}

- (_HKMedicalIDData)medicalIDDataToPersist
{
  return self->_medicalIDDataToPersist;
}

- (void)setMedicalIDDataToPersist:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDDataToPersist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDDataToPersist, 0);
}

@end
