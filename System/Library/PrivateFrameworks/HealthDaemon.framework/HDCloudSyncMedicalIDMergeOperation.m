@implementation HDCloudSyncMedicalIDMergeOperation

- (BOOL)performWithError:(id *)a3
{
  _HKMedicalIDData *localMedicalIDData;
  _HKMedicalIDData *cloudMedicalIDData;
  _HKMedicalIDData *v6;
  _HKMedicalIDData *mergedMedicalIDData;
  NSObject *v8;
  const char *v9;
  NSObject *v11;
  _HKMedicalIDData *v13;
  _HKMedicalIDData *v14;
  _HKMedicalIDData *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  _HKMedicalIDData *v25;
  const char *v26;
  _BOOL4 v27;
  const char *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  int v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _HKMedicalIDData *v35;
  _HKMedicalIDData *v36;
  int v37;
  HDCloudSyncMedicalIDMergeOperation *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  localMedicalIDData = self->_localMedicalIDData;
  cloudMedicalIDData = self->_cloudMedicalIDData;
  if (localMedicalIDData)
  {
    if (!cloudMedicalIDData)
    {
      objc_storeStrong((id *)&self->_mergedMedicalIDData, localMedicalIDData);
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138543362;
        v38 = self;
        v9 = "%{public}@ Returning the local MedicalID since cloud MedicalID is nil";
        goto LABEL_12;
      }
      return 1;
    }
    if ((-[_HKMedicalIDData hasAnyModificationDate](self->_localMedicalIDData, "hasAnyModificationDate", a3) & 1) != 0
      || (-[_HKMedicalIDData hasAnyModificationDate](self->_cloudMedicalIDData, "hasAnyModificationDate") & 1) != 0)
    {
      -[_HKMedicalIDData merge:](self->_cloudMedicalIDData, "merge:", self->_localMedicalIDData);
      v6 = (_HKMedicalIDData *)objc_claimAutoreleasedReturnValue();
      mergedMedicalIDData = self->_mergedMedicalIDData;
      self->_mergedMedicalIDData = v6;

      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
      {
        v37 = 138543362;
        v38 = self;
        v9 = "%{public}@ Merged MedicalID contains the most recently updated fields from the local and cloud MedicalID";
LABEL_12:
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v37, 0xCu);
        return 1;
      }
      return 1;
    }
    v13 = self->_localMedicalIDData;
    v14 = self->_cloudMedicalIDData;
    v15 = v13;
    -[_HKMedicalIDData dateSaved](self->_cloudMedicalIDData, "dateSaved");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      -[_HKMedicalIDData dateSaved](self->_localMedicalIDData, "dateSaved");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB5300];
        v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT);
        v25 = v14;
        if (v34)
        {
          v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ dateSaved property nil for cloud MedicalID and local MedicalID, returning cloud MedicalID";
          goto LABEL_33;
        }
        goto LABEL_37;
      }
    }
    -[_HKMedicalIDData dateSaved](self->_cloudMedicalIDData, "dateSaved");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[_HKMedicalIDData dateSaved](self->_localMedicalIDData, "dateSaved");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB5300];
        v29 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT);
        v25 = v14;
        if (v29)
        {
          v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ dateSaved property nil for local MedicalID, returning cloud MedicalID";
          goto LABEL_33;
        }
LABEL_37:
        v35 = v25;

        v36 = self->_mergedMedicalIDData;
        self->_mergedMedicalIDData = v35;

        return 1;
      }
      -[_HKMedicalIDData dateSaved](v14, "dateSaved");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData dateSaved](v15, "dateSaved");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqualToDate:", v21);

      if (v22)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB5300];
        v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT);
        v25 = v14;
        if (v24)
        {
          v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ Returning the cloud MedicalID since dateSaved is equal";
LABEL_33:
          _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v37, 0xCu);
          v25 = v14;
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      -[_HKMedicalIDData dateSaved](v14, "dateSaved");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData dateSaved](v15, "dateSaved");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "hk_isAfterDate:", v31);

      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB5300];
      v33 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        v25 = v14;
        if (v33)
        {
          v37 = 138543362;
          v38 = self;
          v26 = "%{public}@ Returning the cloud MedicalID since dateSaved is more recent";
          goto LABEL_33;
        }
        goto LABEL_37;
      }
      v25 = v15;
      if (!v33)
        goto LABEL_37;
      v37 = 138543362;
      v38 = self;
      v28 = "%{public}@ Returning the local MedicalID since dateSaved is more recent";
    }
    else
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB5300];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT);
      v25 = v15;
      if (!v27)
        goto LABEL_37;
      v37 = 138543362;
      v38 = self;
      v28 = "%{public}@ dateSaved property nil for cloud MedicalID, returning local MedicalID";
    }
    _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v37, 0xCu);
    v25 = v15;
    goto LABEL_37;
  }
  if (cloudMedicalIDData)
  {
    objc_storeStrong((id *)&self->_mergedMedicalIDData, cloudMedicalIDData);
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      v37 = 138543362;
      v38 = self;
      v9 = "%{public}@ Returning the cloud MedicalID since local MedicalID is nil";
      goto LABEL_12;
    }
    return 1;
  }
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5300];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
  {
    v37 = 138543362;
    v38 = self;
    _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Reached invalid state. Local and cloud MedicalID should not be nil.", (uint8_t *)&v37, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Local and cloud MedicalID should not be nil."));
  return 0;
}

- (_HKMedicalIDData)localMedicalIDData
{
  return self->_localMedicalIDData;
}

- (void)setLocalMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_localMedicalIDData, a3);
}

- (_HKMedicalIDData)cloudMedicalIDData
{
  return self->_cloudMedicalIDData;
}

- (void)setCloudMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_cloudMedicalIDData, a3);
}

- (_HKMedicalIDData)mergedMedicalIDData
{
  return self->_mergedMedicalIDData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedMedicalIDData, 0);
  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);
  objc_storeStrong((id *)&self->_localMedicalIDData, 0);
}

@end
