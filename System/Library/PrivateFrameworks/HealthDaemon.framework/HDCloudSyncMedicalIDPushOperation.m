@implementation HDCloudSyncMedicalIDPushOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HDCloudSyncMedicalIDRecord *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  HDCloudSyncMedicalIDRecord *v38;
  HDCloudSyncModifyRecordsOperation *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HDCloudSyncModifyRecordsOperation *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  HDCloudSyncMedicalIDRecord *v50;
  HDCloudSyncMedicalIDRecord *medicalIDRecord;
  void *v52;
  void *v53;
  void *v54;
  HDCloudSyncMedicalIDRecord *v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[5];
  _BYTE buf[24];
  void *v61;
  __int128 v62;
  id v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryCKContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseForContainer(v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_HKMedicalIDData isEqualToSyncedData:](self->_cloudMedicalIDData, "isEqualToSyncedData:", self->_medicalIDDataToPush))
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cloud MedicalID is the same as the MedicalID to be pushed. Completing push operation successfully", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    goto LABEL_23;
  }
  if (!self->_medicalIDRecord)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cachedCloudState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(v26, "unifiedSyncZoneForContainerID:error:", v27, &v58);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v58;

    if (v28 || !v29)
    {
      if (v28)
      {
        objc_msgSend(v28, "zoneIdentifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "zoneIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = -[HDCloudSyncMedicalIDRecord initInZone:]([HDCloudSyncMedicalIDRecord alloc], "initInZone:", v49);
        medicalIDRecord = self->_medicalIDRecord;
        self->_medicalIDRecord = v50;

        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 715, CFSTR("The unified zone must already exist before pushing MedicalID"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v52);

    }
    else
    {
      _HKInitializeLogging();
      v30 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v29;
        _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get cached unified zone, %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v29);
    }

    goto LABEL_23;
  }
LABEL_6:
  v56 = v5;
  v57 = v9;
  -[_HKMedicalIDData codableRepresentationForSync](self->_medicalIDDataToPush, "codableRepresentationForSync");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncMedicalIDRecord setMedicalIDData:](self->_medicalIDRecord, "setMedicalIDData:", v11);

  v12 = self->_medicalIDRecord;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "repository");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB3940];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "repository");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "profileIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentDeviceProductType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentOSBuild");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentDeviceDisplayName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "repository");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "deviceMode");
  v55 = v12;
  if ((_DWORD)v23 == 1)
  {
    v24 = CFSTR("Basic");
  }
  else if ((_DWORD)v23 == 2)
  {
    v24 = CFSTR("Satellite");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "stringWithFormat:", CFSTR("ProfileIdentifier: %@,ProductType: %@,SystemBuildVersion: %@,DeviceName: %@,DeviceMode: %@,"), v17, v18, v19, v20, v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncMedicalIDRecord addMedicalIDEvent:](v55, "addMedicalIDEvent:", v31);
  v5 = v56;
  v32 = v56;
  v33 = v57;
  _HKInitializeLogging();
  v34 = (void *)*MEMORY[0x1E0CB5300];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_DEFAULT))
  {
    v35 = v34;
    objc_msgSend(v33, "databaseScope");
    CKDatabaseScopeString();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "containerIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self->_medicalIDRecord;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2114;
    v61 = v37;
    LOWORD(v62) = 2114;
    *(_QWORD *)((char *)&v62 + 2) = v38;
    _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning MedicalID record push to cloud for %{public}@ in %{public}@. %{public}@", buf, 0x2Au);

  }
  v39 = [HDCloudSyncModifyRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord record](self->_medicalIDRecord, "record");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  v64[0] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v39, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v40, v32, v43, 0);

  v45 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke;
  v61 = &unk_1E6CFA568;
  *(_QWORD *)&v62 = self;
  v46 = v32;
  *((_QWORD *)&v62 + 1) = v46;
  v47 = v33;
  v63 = v47;
  -[HDCloudSyncOperation setOnError:](v44, "setOnError:", buf);
  v59[0] = v45;
  v59[1] = 3221225472;
  v59[2] = __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke_189;
  v59[3] = &unk_1E6CE7778;
  v59[4] = self;
  -[HDCloudSyncOperation setOnSuccess:](v44, "setOnSuccess:", v59);
  -[HDCloudSyncOperation start](v44, "start");

  v9 = v57;
LABEL_23:

}

void __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5300];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "containerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "databaseScope");
    CKDatabaseScopeString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v7;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v4;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Failed to push MedicalID to database %{public}@ with error %{public}@", (uint8_t *)&v11, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __86__HDCloudSyncMedicalIDPushOperation__pushMedicalIDRecordToCloudForContainer_database___block_invoke_189(uint64_t a1)
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
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully pushed MedicalID.", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

- (_HKMedicalIDData)cloudMedicalIDData
{
  return self->_cloudMedicalIDData;
}

- (void)setCloudMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_cloudMedicalIDData, a3);
}

- (_HKMedicalIDData)medicalIDDataToPush
{
  return self->_medicalIDDataToPush;
}

- (void)setMedicalIDDataToPush:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDDataToPush, a3);
}

- (HDCloudSyncMedicalIDRecord)medicalIDRecord
{
  return self->_medicalIDRecord;
}

- (void)setMedicalIDRecord:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDRecord, 0);
  objc_storeStrong((id *)&self->_medicalIDDataToPush, 0);
  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);
}

@end
