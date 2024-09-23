@implementation HDMedicalIDDataManager

- (HDMedicalIDDataManager)initWithProfile:(id)a3
{
  id v4;
  HDMedicalIDDataManager *v5;
  HDMedicalIDDataManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMedicalIDDataManager;
  v5 = -[HDMedicalIDDataManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, 0);
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSubmissionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HDMedicalIDDataManager;
  -[HDMedicalIDDataManager dealloc](&v6, sel_dealloc);
}

- (id)fetchMedicalIDWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  -[HDMedicalIDDataManager _fetchMedicalIDDataFromDiskWithError:](self, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = v5;
  if (v4 || !v5)
  {
    v7 = v4;
  }
  else if (a3)
  {
    v7 = 0;
    *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    _HKLogDroppedError();
    v7 = 0;
  }

  return v7;
}

- (id)_fetchMedicalIDDataFromDiskWithError:(void *)a1
{
  char v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  os_log_t *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v31 = 0;
    v4 = -[HDMedicalIDDataManager _migrateMedicalIDLocationIfNecessary:](a1, &v31);
    v5 = v31;
    if ((v4 & 1) != 0)
    {
      -[HDMedicalIDDataManager _medicalIDURL](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v30 = 0;
        -[HDMedicalIDDataManager _unarchiveMedicalIDDataWithRawData:error:]((uint64_t)a1, v8, &v30);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v30;
        if (v9)
        {
          v11 = (void *)objc_msgSend(v9, "copy");
          if (+[HDMedicalIDDataMigrator migrateMedicalIDDataIfNeeded:](HDMedicalIDDataMigrator, "migrateMedicalIDDataIfNeeded:", v9))
          {
            _HKInitializeLogging();
            v12 = (os_log_t *)MEMORY[0x1E0CB52B0];
            v13 = (void *)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
            {
              v14 = v13;
              v15 = objc_msgSend(v9, "schemaVersion");
              *(_DWORD *)buf = 134217984;
              v33 = v15;
              _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Migrated Medical ID data to version %li", buf, 0xCu);

            }
            v29 = 0;
            v16 = -[HDMedicalIDDataManager _persistMedicalIDData:originalData:provenance:error:](a1, v9, v11, &unk_1E6DFA8B0, &v29);
            v17 = v29;
            if ((v16 & 1) == 0)
            {
              _HKInitializeLogging();
              v18 = *v12;
              if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v33 = (uint64_t)v17;
                _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to save migrated Medical ID data: %{public}@", buf, 0xCu);
              }
            }

          }
          objc_msgSend(a1, "profile");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0;
          v20 = +[HDMedicalIDSyncEntity touchSyncAnchorIfNecessaryWithProfile:error:](HDMedicalIDSyncEntity, "touchSyncAnchorIfNecessaryWithProfile:error:", v19, &v28);
          v21 = v28;

          if (!v20)
          {
            _HKInitializeLogging();
            v22 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v33 = (uint64_t)v21;
              _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Failed to touch Medical ID sync anchor: %{public}@", buf, 0xCu);
            }
          }

        }
        else
        {
          _HKInitializeLogging();
          v25 = *MEMORY[0x1E0CB52B0];
          v26 = *MEMORY[0x1E0CB52B0];
          if (v10)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v33 = (uint64_t)a1;
              v34 = 2114;
              v35 = v10;
              _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Failed to unarchive Medical ID fetched from disk, error: %{public}@", buf, 0x16u);
            }
            if (a2)
              *a2 = objc_retainAutorelease(v10);
            else
              _HKLogDroppedError();
          }
          else if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v33 = (uint64_t)a1;
            _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_INFO, "%{public}@ Unarchived MedicalID on disk is nil even though raw data was retrieved.", buf, 0xCu);
          }
        }

      }
      else
      {
        v9 = 0;
      }

      goto LABEL_31;
    }
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = (uint64_t)a1;
      v34 = 2114;
      v35 = v5;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Failed to migrate Medical ID before update, error: %{public}@", buf, 0x16u);
    }
    v24 = v5;
    v7 = v24;
    if (v24)
    {
      if (a2)
      {
        v7 = objc_retainAutorelease(v24);
        v9 = 0;
        *a2 = v7;
LABEL_31:

        return v9;
      }
      _HKLogDroppedError();
    }
    v9 = 0;
    goto LABEL_31;
  }
  return 0;
}

- (id)fetchMedicalIDIfSetUpWithError:(id *)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  int v8;
  HDMedicalIDDataManager *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HDMedicalIDDataManager fetchMedicalIDWithError:](self, "fetchMedicalIDWithError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEmpty"))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = self;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Medical ID on disk is non-nil but empty, returning nil to the client in this case", (uint8_t *)&v8, 0xCu);
    }
    v6 = 0;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)fetchMedicalIDDataIfSetUpOrCreateDefaultWithError:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HDProfile **p_profile;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  -[HDMedicalIDDataManager fetchMedicalIDIfSetUpWithError:](self, "fetchMedicalIDIfSetUpWithError:", &v39);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v39;
  v7 = v6;
  if (v5 || !v6)
  {
    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB6FD8]);
      objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49C8]);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CC0]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AB8]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      p_profile = &self->_profile;
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "userCharacteristicsManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0;
      objc_msgSend(v12, "userCharacteristicForType:error:", v8, &v38);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v38;

      if (v13)
      {
        objc_msgSend(v5, "setGregorianBirthday:", v13);
      }
      else if (v14)
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v14;
          _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "Failed to get date of birth for Medical ID: %{public}@", buf, 0xCu);
        }
      }

      v16 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v16, "userCharacteristicsManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v33 = (void *)v9;
      objc_msgSend(v17, "userCharacteristicForType:error:", v9, &v37);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v37;

      if (v18)
      {
        objc_msgSend(v5, "setBloodType:", objc_msgSend(v18, "integerValue"));
      }
      else if (v19)
      {
        _HKInitializeLogging();
        v20 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v19;
          _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to get blood type for Medical ID: %{public}@", buf, 0xCu);
        }
      }

      v21 = objc_loadWeakRetained((id *)p_profile);
      v36 = 0;
      +[HDSampleEntity mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:](HDQuantitySampleEntity, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v34, v21, 0, 0, 0, &v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v36;

      if (v22)
      {
        objc_msgSend(v22, "quantity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setHeight:", v24);

      }
      else if (v23)
      {
        _HKInitializeLogging();
        v25 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v23;
          _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "Failed to get height for Medical ID: %{public}@", buf, 0xCu);
        }
      }

      v26 = objc_loadWeakRetained((id *)p_profile);
      v35 = 0;
      +[HDSampleEntity mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:](HDQuantitySampleEntity, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v32, v26, 0, 0, 0, &v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v35;

      if (v27)
      {
        objc_msgSend(v27, "quantity");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setWeight:", v29);

      }
      else if (a3)
      {
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v28;
          _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "Failed to get weight for Medical ID: {public}%@", buf, 0xCu);
        }
      }

    }
  }
  else if (a3)
  {
    v5 = 0;
    *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    _HKLogDroppedError();
    v5 = 0;
  }

  return v5;
}

- (int64_t)medicalIDSetupStatusWithError:(id *)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  int64_t v6;
  uint64_t v8;

  v8 = 0;
  -[HDMedicalIDDataManager fetchMedicalIDIfSetUpWithError:](self, "fetchMedicalIDIfSetUpWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = 1;
  else
    v5 = v8 == 0;
  v6 = v5;
  if (v3)
  {
    if (objc_msgSend(v3, "isEmpty"))
      v6 = 1;
    else
      v6 = 2;
  }

  return v6;
}

- (id)medicalIDEmergencyContactsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HDMedicalIDDataManager fetchMedicalIDWithError:](self, "fetchMedicalIDWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emergencyContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)medicalIDClinicalContactsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[HDMedicalIDDataManager fetchMedicalIDWithError:](self, "fetchMedicalIDWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clinicalContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)updateMedicalIDWithSyncedData:(id)a3 provenance:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  const __CFString *v15;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  -[HDMedicalIDDataManager _fetchMedicalIDDataFromDiskWithError:](self, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  v12 = v11;
  if (v10 || !v11)
  {
    if (v8)
    {
      if (objc_msgSend(v8, "isEqualToSyncedData:", v10))
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = CFSTR("Attempt to save Medical ID with no updated fields.");
      }
      else
      {
        if (!self)
          goto LABEL_17;
        if (!v10)
          goto LABEL_17;
        v17 = v10;
        objc_msgSend(v8, "dateSaved");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dateSaved");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v17) = objc_msgSend(v18, "hk_isBeforeDate:", v19);
        if (!(_DWORD)v17)
        {
LABEL_17:
          v13 = -[HDMedicalIDDataManager _persistMedicalIDData:originalData:provenance:error:](self, v8, v10, v9, a5);
          goto LABEL_12;
        }
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = CFSTR("Attempt to save Medical ID created before current Medical ID on disk.");
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("Medical ID must not be nil");
    }
    objc_msgSend(v14, "hk_assignError:code:format:", a5, 3, v15);
    goto LABEL_11;
  }
  if (!a5)
  {
    _HKLogDroppedError();
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 0;
  *a5 = objc_retainAutorelease(v11);
LABEL_12:

  return v13;
}

- (uint64_t)_persistMedicalIDData:(void *)a3 originalData:(void *)a4 provenance:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  CFPropertyListRef *v31;
  uint64_t v32;
  const __CFString *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  int v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  id v66;
  unsigned __int8 v67;
  id v68;
  _BYTE v69[24];
  void *v70;
  void *v71;
  _BYTE buf[32];
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (!a1)
  {
    v57 = 0;
    goto LABEL_54;
  }
  v66 = 0;
  v12 = -[HDMedicalIDDataManager _persistMedicalIDDataFileToDisk:error:](a1, v9, &v66);
  v13 = v66;
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB5300];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    *(_WORD *)&buf[18] = 2114;
    *(_QWORD *)&buf[20] = v13;
    _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Persisted MedicalID changes on device with success (%id), error (%{public}@)", buf, 0x1Cu);
  }
  if (!v12)
  {
    v18 = v13;
    if (v18)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    goto LABEL_52;
  }

  objc_msgSend(a1, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __78__HDMedicalIDDataManager__persistMedicalIDData_originalData_provenance_error___block_invoke;
  v63[3] = &unk_1E6CE7950;
  v63[4] = a1;
  v64 = v11;
  v17 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDUnprotectedKeyValueEntity, "performWriteTransactionWithHealthDatabase:error:block:", v16, &v65, v63);
  v18 = v65;

  if (!v17)
  {
    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@ Error performing write transaction to update medicalID key value parameters %{public}@", buf, 0x16u);
    }
    v18 = v18;
    if (v18)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v67 = 0;
    goto LABEL_53;
  }
  notify_post((const char *)*MEMORY[0x1E0CB7740]);
  objc_msgSend(v9, "emergencyContacts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emergencyContacts");
  v20 = objc_claimAutoreleasedReturnValue();
  v62 = v11;
  if (v19 == (void *)v20)
  {

    goto LABEL_33;
  }
  v21 = (void *)v20;
  objc_msgSend(v10, "emergencyContacts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v10;
  if (v22)
  {
    objc_msgSend(v9, "emergencyContacts");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emergencyContacts");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "isEqual:", v10) & 1) != 0)
    {

      v10 = v61;
      goto LABEL_33;
    }
    v60 = v23;
  }
  objc_msgSend(v9, "emergencyContacts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "count"))
  {

    if (v22)
    {

    }
    v10 = v61;
  }
  else
  {
    objc_msgSend(v61, "emergencyContacts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v26, "count");

    if (v22)
    {

    }
    v10 = v61;
    if (!v59)
      goto LABEL_33;
  }
  notify_post((const char *)*MEMORY[0x1E0CB7748]);
LABEL_33:
  objc_msgSend(a1, "profile", v59);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "profileType");

  v29 = MEMORY[0x1E0C809B0];
  if (v28 == 1)
  {
    v30 = objc_msgSend(v9, "isDisabled");
    v31 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
    if (v30)
      v31 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
    v32 = *MEMORY[0x1E0CB7698];
    v33 = (const __CFString *)*MEMORY[0x1E0CB76B8];
    CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E0CB7698], *v31, (CFStringRef)*MEMORY[0x1E0CB76B8]);
    if (CFPreferencesAppSynchronize(v33))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      HKSynchronizeNanoPreferencesUserDefaults();

    }
    else
    {
      _HKInitializeLogging();
      v35 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "Could not synchronize Medical Id flag for watch", buf, 2u);
      }
    }
  }
  v36 = v9;
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "emergencyContacts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v39)
    {
      objc_msgSend(a1, "profile");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "daemon");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "behavior");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "tinkerModeEnabled");

      v29 = MEMORY[0x1E0C809B0];
      if (v43)
      {
        if ((objc_msgSend(getSOSUtilitiesClass(), "isAllowedToMessageSOSContacts") & 1) == 0)
        {
          _HKInitializeLogging();
          v44 = *MEMORY[0x1E0CB5300];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = a1;
            _os_log_impl(&dword_1B7802000, v44, OS_LOG_TYPE_DEFAULT, "Set allowedToMessageSOSContacts for Medical ID on a Tinker device %{public}@", buf, 0xCu);
          }
          objc_msgSend(getSOSUtilitiesClass(), "setAllowedToMessageSOSContacts:", 1);
        }
      }
    }
  }

  objc_msgSend(a1, "profile");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "nanoSyncManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v29;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E6CE77C8;
  v73 = a1;
  objc_msgSend(v46, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("Medical ID Update"), buf);

  objc_msgSend(a1, "profile");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "cloudSyncManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v49 = v29;
  v50 = objc_msgSend(v48, "canPerformCloudSyncWithError:", &v68);
  v51 = v68;

  if (v50)
  {
    v52 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 18, 0, 23, 0);
    objc_msgSend(a1, "profile");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "cloudSyncManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v69 = v49;
    *(_QWORD *)&v69[8] = 3221225472;
    *(_QWORD *)&v69[16] = __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke_213;
    v70 = &unk_1E6CE77C8;
    v71 = a1;
    v55 = (id)objc_msgSend(v54, "syncMedicalIDDataWithContext:completion:", v52, v69);

    v11 = v62;
  }
  else
  {
    _HKInitializeLogging();
    v56 = *MEMORY[0x1E0CB5300];
    v11 = v62;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v69 = 138543618;
      *(_QWORD *)&v69[4] = a1;
      *(_WORD *)&v69[12] = 2114;
      *(_QWORD *)&v69[14] = v51;
      _os_log_impl(&dword_1B7802000, v56, OS_LOG_TYPE_INFO, "%{public}@: Skipping cloud sync for medical ID update: %{public}@", v69, 0x16u);
    }
  }

LABEL_52:
  v67 = v12;
LABEL_53:

  v57 = v67;
LABEL_54:

  return v57;
}

- (BOOL)updateMedicalIDWithLocalData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  id v14;

  v6 = a3;
  v14 = 0;
  -[HDMedicalIDDataManager _fetchMedicalIDDataFromDiskWithError:](self, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (!v7 && v8)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    else
      _HKLogDroppedError();
    goto LABEL_9;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Medical ID must not be nil"));
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Attempt to save Medical ID with no updated fields."));
LABEL_9:

    goto LABEL_16;
  }
  if ((objc_msgSend(v6, "hasAnyModificationDate") & 1) == 0)
    objc_msgSend(v6, "setModificationDatesForUpdatedFieldsWithMedicalIDData:", 0);
  objc_msgSend(v6, "merge:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEmpty");
  if (v7 || !v11)
  {
    v12 = -[HDMedicalIDDataManager _persistMedicalIDData:originalData:provenance:error:](self, v10, v7, &unk_1E6DFA8B0, a4);

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Attempt to save empty Medical ID for the first time."));

LABEL_16:
  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)deleteMedicalIDDataWithError:(id *)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB6FD8]);
  objc_msgSend(v5, "setIsDisabled:", 1);
  objc_msgSend(v5, "setModificationDatesToCurrentDate");
  LOBYTE(a3) = -[HDMedicalIDDataManager updateMedicalIDWithLocalData:error:](self, "updateMedicalIDWithLocalData:error:", v5, a3);

  return (char)a3;
}

- (uint64_t)_migrateMedicalIDLocationIfNecessary:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medicalIDDirectoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "directoryPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByStandardizingPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", v10) & 1) == 0)
  {
    v26 = 0;
    if ((objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v7, &v26) & 1) != 0)
    {
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 100, CFSTR("%@ is not a directory"), v7);
LABEL_10:
        v11 = 0;
        goto LABEL_23;
      }
    }
    else if ((objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, a2) & 1) == 0)
    {
      goto LABEL_10;
    }
    -[HDMedicalIDDataManager _medicalIDURL](a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v13, 0);

    if ((v14 & 1) != 0)
    {
      v11 = 1;
LABEL_22:

      goto LABEL_23;
    }
    -[HDMedicalIDDataManager _medicalIDURLWithDirectoryPath:](v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v16 = objc_msgSend(v4, "moveItemAtURL:toURL:error:", v15, v12, &v25);
    v17 = v25;
    v18 = v17;
    if (v16)
    {
      _HKInitializeLogging();
      v19 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        objc_msgSend(v15, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        v29 = 2114;
        v30 = v22;
        _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "Migrated Medical ID from %{public}@ to %{public}@", buf, 0x16u);

      }
    }
    else if ((objc_msgSend(v17, "hk_isCocoaNoSuchFileError") & 1) == 0)
    {
      v23 = v18;
      if (v23)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v23);
        else
          _HKLogDroppedError();
      }

      v11 = 0;
      goto LABEL_21;
    }
    v11 = 1;
LABEL_21:

    goto LABEL_22;
  }
  v11 = 1;
LABEL_23:

  return v11;
}

- (id)_medicalIDURL
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "profile");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "medicalIDDirectoryPath");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDMedicalIDDataManager _medicalIDURLWithDirectoryPath:](v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_unarchiveMedicalIDDataWithRawData:(_QWORD *)a3 error:
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a2;
  v15 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v15;
  if (v6)
    goto LABEL_16;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB52B0];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    if (v7)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unknown failure occurred when unarchiving medical ID"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_15:

LABEL_16:
      v13 = v6;
      goto LABEL_17;
    }
LABEL_11:
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();

    if (v7)
      goto LABEL_16;
    goto LABEL_15;
  }
  *(_DWORD *)buf = 138543362;
  v17 = v7;
  _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Failed to decode Medical ID data: %{public}@", buf, 0xCu);
  if (!v7)
    goto LABEL_10;
LABEL_5:
  objc_msgSend(v7, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 != (void *)*MEMORY[0x1E0CB28A8])
  {

LABEL_8:
    v12 = v7;
    goto LABEL_11;
  }
  v11 = objc_msgSend(v7, "code");

  if (v11 != 4865)
    goto LABEL_8;
LABEL_17:

  return v6;
}

- (uint64_t)_persistMedicalIDDataFileToDisk:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v5 = a2;
  -[HDMedicalIDDataManager _medicalIDURL](a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v22;
  if (v8)
  {
    v10 = *MEMORY[0x1E0CB2AE0];
    v11 = *MEMORY[0x1E0CB2AA8];
    v27[0] = *MEMORY[0x1E0CB2AD8];
    v27[1] = v11;
    v28[0] = v10;
    v28[1] = &unk_1E6DFA8C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v21 = v9;
    v13 = objc_msgSend(v8, "writeToFile:options:error:", v7, 1, &v21);
    v14 = v21;

    if ((_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAttributes:ofItemAtPath:error:", v12, v7, 0);
    }
    else
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v7;
        v25 = 2114;
        v26 = v14;
        _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Error writing Medical ID data file at %@, %{public}@", buf, 0x16u);
      }
      v19 = v14;
      v15 = v19;
      if (v19)
      {
        if (a3)
        {
          v15 = objc_retainAutorelease(v19);
          *a3 = v15;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }

  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Server failed to archive Medical ID data: %{public}@", buf, 0xCu);
    }
    v17 = v9;
    v12 = v17;
    if (v17)
    {
      if (a3)
      {
        v12 = objc_retainAutorelease(v17);
        v13 = 0;
        *a3 = v12;
      }
      else
      {
        _HKLogDroppedError();
        v13 = 0;
      }
      v14 = v12;
    }
    else
    {
      v14 = 0;
      v13 = 0;
    }
  }

  return v13;
}

uint64_t __78__HDMedicalIDDataManager__persistMedicalIDData_originalData_provenance_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id WeakRetained;
  BOOL v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v17 = 0;
  v6 = +[HDMedicalIDSyncEntity incrementSyncAnchorWithProfile:error:](HDMedicalIDSyncEntity, "incrementSyncAnchorWithProfile:error:", WeakRetained, &v17);
  v7 = v17;

  if (!v6)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v7;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Error saving sync anchor for medicalID %{public}@", buf, 0x16u);
    }
    v7 = v7;
    if (!v7)
      goto LABEL_15;
    if (!a3)
    {
LABEL_14:
      _HKLogDroppedError();
      goto LABEL_15;
    }
LABEL_9:
    v7 = objc_retainAutorelease(v7);
    *a3 = v7;
LABEL_15:

    v10 = 0;
    goto LABEL_16;
  }
  if (*(_QWORD *)(a1 + 40))
  {

    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    LOBYTE(v8) = +[HDMedicalIDSyncEntity setSyncProvenance:profile:error:](HDMedicalIDSyncEntity, "setSyncProvenance:profile:error:", v8, v9, &v16);
    v7 = v16;

    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v19 = v15;
        v20 = 2114;
        v21 = v7;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to save sync provenance during medicalID update, error: %{public}@", buf, 0x16u);
      }
      v7 = v7;
      if (!v7)
        goto LABEL_15;
      if (!a3)
        goto LABEL_14;
      goto LABEL_9;
    }
  }
  v10 = 1;
LABEL_16:

  return v10;
}

void __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, " %{public}@ Nano-sync triggered for a MedicalID update failed, error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

void __66__HDMedicalIDDataManager__triggerSyncForSuccessfulMedicalIDUpdate__block_invoke_213(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, " %{public}@ Cloudsync triggered for a MedicalID update failed, error: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (BOOL)obliterateMedicalIDDataWithReason:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  BOOL v12;
  id v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Obliterating Medical ID with reason: %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMedicalIDDataManager _medicalIDURL](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v8, "removeItemAtURL:error:", v9, &v15);
  v11 = v15;

  if ((v10 & 1) != 0 || (objc_msgSend(v11, "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v13 = v11;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    v12 = 0;
  }

  return v12;
}

- (id)_medicalIDURLWithDirectoryPath:(void *)a1
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = (objc_class *)MEMORY[0x1E0C99E98];
  v2 = a1;
  v3 = [v1 alloc];
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("MedicalIDData.archive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "initFileURLWithPath:", v4);
  return v5;
}

- (void)runEmergencyContactConsolidationWithCompletion:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  HKDispatchAsyncOnGlobalConcurrentQueue();

}

uint64_t __73__HDMedicalIDDataManager_runEmergencyContactConsolidationWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runEmergencyContactConsolidationWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (id)unitTest_medicalIDData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D50];
  -[HDMedicalIDDataManager _medicalIDURL](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMedicalIDDataManager _unarchiveMedicalIDDataWithRawData:error:]((uint64_t)self, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)unitTest_persistMedicalIDData:(id)a3
{
  id v4;
  char v5;
  id v6;
  char v7;
  NSObject *v8;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  v5 = -[HDMedicalIDDataManager _migrateMedicalIDLocationIfNecessary:](self, &v11);
  v6 = v11;
  if ((v5 & 1) != 0)
  {
    v10 = 0;
    v7 = -[HDMedicalIDDataManager _persistMedicalIDDataFileToDisk:error:](self, v4, &v10);
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Failed to migrate Medical ID before update: %{public}@", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsSubmissionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:queue:", self, 0);

}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  HDProfile **p_profile;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((HKImproveHealthAndActivityAnalyticsAllowed() & 1) != 0)
  {
    v18 = 0;
    -[HDMedicalIDDataManager fetchMedicalIDWithError:](self, "fetchMedicalIDWithError:", &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    v8 = (os_log_t *)MEMORY[0x1E0CB5300];
    if (v7)
    {
      _HKInitializeLogging();
      v9 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v7;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch MedicalID for daily analytics with error %{public}@", buf, 0xCu);
        if (v6)
          goto LABEL_5;
      }
      else if (v6)
      {
        goto LABEL_5;
      }
      if (!v5)
      {
LABEL_15:

        goto LABEL_16;
      }
      v17 = 1;
LABEL_14:
      (*((void (**)(id, _QWORD, uint64_t, _QWORD))v5 + 2))(v5, 0, v17, 0);
      goto LABEL_15;
    }
LABEL_5:
    v10 = objc_msgSend(getSOSUtilitiesClass(), "isAllowedToMessageSOSContacts");
    p_profile = &self->_profile;
    WeakRetained = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(WeakRetained, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "analyticsSubmissionCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v14, "medicalID_dailyReport:sosContactStatus:profileType:", v6, v10, objc_msgSend(v15, "profileType"));

    _HKInitializeLogging();
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "Submitted daily medical id analytic event", buf, 2u);
    }
    if (!v5)
      goto LABEL_15;
    v17 = 0;
    goto LABEL_14;
  }
  if (v5)
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v5 + 2))(v5, 0, 1, 0);
LABEL_16:

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_runEmergencyContactConsolidationWithCompletion:(id)a3
{
  id v4;
  HDSOSManager *v5;

  v4 = a3;
  v5 = objc_alloc_init(HDSOSManager);
  -[HDMedicalIDDataManager _runEmergencyContactConsolidationWithSOSManager:WithCompletion:](self, "_runEmergencyContactConsolidationWithSOSManager:WithCompletion:", v5, v4);

}

- (void)_runEmergencyContactConsolidationWithSOSManager:(id)a3 WithCompletion:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void (**v9)(void *, uint64_t, _QWORD);
  int v10;
  os_log_t *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__HDMedicalIDDataManager_EmergencyContactConsolidation___runEmergencyContactConsolidationWithSOSManager_WithCompletion___block_invoke;
  aBlock[3] = &unk_1E6CE77F0;
  v40 = v8;
  v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v10 = objc_msgSend(v7, "isAllowedToMessageSOSContacts");
  v11 = (os_log_t *)MEMORY[0x1E0CB5300];
  if (!v10)
  {
    objc_msgSend(v7, "setIsAllowedToMessageSOSContacts");
    _HKInitializeLogging();
    v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - setting isAllowedToMessageSOSContacts to true.", buf, 2u);
    }
    objc_msgSend(v7, "sosContactManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "legacyContactsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "SOSLegacyContactsExist");

    if ((v16 & 1) == 0)
    {
      _HKInitializeLogging();
      v21 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - no contacts to consolidate.", buf, 2u);
      }
      v9[2](v9, 1, 0);
      goto LABEL_39;
    }
    v38 = 0;
    -[HDMedicalIDDataManager fetchMedicalIDWithError:](self, "fetchMedicalIDWithError:", &v38);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v38;
    if (v18)
    {
      v19 = v18;
      _HKInitializeLogging();
      v20 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      {
        v31 = v20;
        objc_msgSend(v19, "description");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v42 = v32;
        _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion failed to fetch medical id data with error: %@.", buf, 0xCu);

      }
      ((void (**)(void *, uint64_t, void *))v9)[2](v9, 0, v19);
      goto LABEL_38;
    }
    if (!v17)
      v17 = objc_alloc_init(MEMORY[0x1E0CB6FD8]);
    objc_msgSend(v17, "consolidatedSOSContactsWithSOSContactsManager:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emergencyContacts");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v22;
    if (v22 == (void *)v23)
      goto LABEL_21;
    v25 = (void *)v23;
    objc_msgSend(v17, "emergencyContacts");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v17, "emergencyContacts");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "isEqual:", v4))
      {

        v24 = v25;
LABEL_21:

        goto LABEL_22;
      }
      if (objc_msgSend(v22, "count"))
      {

        goto LABEL_29;
      }
    }
    else if (objc_msgSend(v22, "count"))
    {
LABEL_29:

LABEL_33:
      objc_msgSend(v17, "setEmergencyContacts:", v22);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEmergencyContactsModifiedDate:", v28);

      v37 = 0;
      -[HDMedicalIDDataManager updateMedicalIDWithLocalData:error:](self, "updateMedicalIDWithLocalData:error:", v17, &v37);
      v29 = v37;
      if (v29)
      {
        v19 = v29;
        _HKInitializeLogging();
        v30 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
        {
          v33 = v30;
          objc_msgSend(v19, "description");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v42 = v34;
          _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion failed to save medical id data with error: %@.", buf, 0xCu);

        }
        ((void (**)(void *, uint64_t, void *))v9)[2](v9, 0, v19);
        goto LABEL_37;
      }
LABEL_22:
      _HKInitializeLogging();
      v27 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - successfully consolidated contacts", buf, 2u);
      }
      v9[2](v9, 1, 0);
      v19 = 0;
LABEL_37:

LABEL_38:
LABEL_39:

      goto LABEL_40;
    }
    objc_msgSend(v17, "emergencyContacts");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v26)
    {

    }
    if (!v36)
      goto LABEL_22;
    goto LABEL_33;
  }
  _HKInitializeLogging();
  v12 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "HDMedicalIDDataManager._runEmergencyContactConsolidationWithCompletion - isAllowedToMessageSOSContacts - true, no need to consolidate", buf, 2u);
  }
  v9[2](v9, 1, 0);
LABEL_40:

}

uint64_t __120__HDMedicalIDDataManager_EmergencyContactConsolidation___runEmergencyContactConsolidationWithSOSManager_WithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
