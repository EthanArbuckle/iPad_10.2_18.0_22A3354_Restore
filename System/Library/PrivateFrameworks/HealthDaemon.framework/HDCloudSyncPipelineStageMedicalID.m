@implementation HDCloudSyncPipelineStageMedicalID

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  _HKMedicalIDData *v6;
  id v7;
  _HKMedicalIDData *localMedicalIDData;
  _HKMedicalIDData *cloudMedicalIDData;
  HDCloudSyncMedicalIDRecord *medicalIDRecord;
  BOOL v11;
  HDCloudSyncCompoundOperation *v12;
  void *v13;
  HDCloudSyncParallelOperation *v14;
  void *v15;
  HDCloudSyncParallelOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  HDCloudSyncMedicalIDFetchOperation *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  HDCloudSyncMedicalIDFetchOperation *v32;
  void *v33;
  HDCloudSyncMedicalIDFetchOperation *v34;
  void *v35;
  id v36;
  uint64_t v37;
  HDCloudSyncCompoundOperation *v38;
  HDCloudSyncMedicalIDMergeOperation *v39;
  HDCloudSyncMedicalIDPersistOperation *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HDCloudSyncCompoundOperation *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  HDCloudSyncCreateZonesOperation *v54;
  void *v55;
  void *v56;
  void *v57;
  HDCloudSyncCreateZonesOperation *v58;
  HDCloudSyncMedicalIDPushOperation *v59;
  HDCloudSyncMedicalIDMergeOperation *v60;
  id v61;
  id v62;
  void *v63;
  NSObject *v64;
  uint64_t v66;
  void *v67;
  HDCloudSyncMedicalIDMergeOperation *v68;
  HDCloudSyncMedicalIDPersistOperation *v69;
  void *v70;
  id v71;
  HDCloudSyncCompoundOperation *v72;
  void *v73;
  id obj;
  _QWORD v75[5];
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  _QWORD v83[4];
  HDCloudSyncMedicalIDMergeOperation *v84;
  _QWORD v85[5];
  uint8_t v86[128];
  _BYTE buf[24];
  void *v88;
  HDCloudSyncPipelineStageMedicalID *v89;
  HDCloudSyncMedicalIDMergeOperation *v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "medicalIDDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0;
  objc_msgSend(v5, "fetchMedicalIDWithError:", &v82);
  v6 = (_HKMedicalIDData *)objc_claimAutoreleasedReturnValue();
  v7 = v82;
  localMedicalIDData = self->_localMedicalIDData;
  self->_localMedicalIDData = v6;

  cloudMedicalIDData = self->_cloudMedicalIDData;
  self->_cloudMedicalIDData = 0;

  medicalIDRecord = self->_medicalIDRecord;
  self->_medicalIDRecord = 0;

  if (self->_localMedicalIDData)
    v11 = 1;
  else
    v11 = v7 == 0;
  if (v11)
  {
    v71 = v7;
    v12 = [HDCloudSyncCompoundOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v12, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v13, 0, CFSTR("Fetch and Process Medical ID"), 0);

    v14 = [HDCloudSyncParallelOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDCloudSyncParallelOperation initWithConfiguration:cloudState:](v14, "initWithConfiguration:cloudState:", v15, 0);

    -[HDCloudSyncOperation configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "repository");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "secondaryCKContainers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = [HDCloudSyncMedicalIDFetchOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "repository");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "primaryCKContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HDCloudSyncMedicalIDFetchOperation initWithConfiguration:cloudState:container:](v20, "initWithConfiguration:cloudState:container:", v21, 0, v24);

    v70 = (void *)v25;
    -[HDCloudSyncParallelOperation addOperation:](v16, "addOperation:", v25);
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v19;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v79 != v29)
            objc_enumerationMutation(obj);
          v31 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
          v32 = [HDCloudSyncMedicalIDFetchOperation alloc];
          -[HDCloudSyncOperation configuration](self, "configuration");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[HDCloudSyncMedicalIDFetchOperation initWithConfiguration:cloudState:container:](v32, "initWithConfiguration:cloudState:container:", v33, 0, v31);

          objc_msgSend(v26, "addObject:", v34);
          -[HDCloudSyncOperation operationIgnoringErrors](v34, "operationIgnoringErrors");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncParallelOperation addOperation:](v16, "addOperation:", v35);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
      }
      while (v28);
    }

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v72, "addOperation:transitionHandler:", v16, 0);
    -[HDCloudSyncOperation configuration](self, "configuration");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = MEMORY[0x1E0C809B0];
    if (self)
    {
      v73 = v36;
      v38 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:]([HDCloudSyncCompoundOperation alloc], "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v36, 0, CFSTR("Process Medical ID"), 0);
      v39 = -[HDCloudSyncOperation initWithConfiguration:cloudState:]([HDCloudSyncMedicalIDMergeOperation alloc], "initWithConfiguration:cloudState:", v73, 0);
      v85[0] = v37;
      v85[1] = 3221225472;
      v85[2] = __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke;
      v85[3] = &unk_1E6CFEDC0;
      v85[4] = self;
      -[HDCloudSyncCompoundOperation setPreparationHandler:](v38, "setPreparationHandler:", v85);
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v38, "addOperation:transitionHandler:", v39, 0);
      v40 = -[HDCloudSyncOperation initWithConfiguration:cloudState:]([HDCloudSyncMedicalIDPersistOperation alloc], "initWithConfiguration:cloudState:", v73, 0);
      v83[0] = v37;
      v83[1] = 3221225472;
      v83[2] = __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_2;
      v83[3] = &unk_1E6CFEDE8;
      v68 = v39;
      v69 = v40;
      v84 = v68;
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v38, "addOperation:transitionHandler:", v40, v83);
      -[HDCloudSyncOperation configuration](self, "configuration");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "repository");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "primaryCKContainer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](self, "configuration");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "repository");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "profileIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      HDDatabaseForContainer(v42, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v46, "databaseScope");

      v47 = v38;
      v36 = v73;

      if (v66 == 2)
      {
        v48 = objc_alloc(MEMORY[0x1E0C95088]);
        v49 = (void *)MEMORY[0x1E0C95098];
        objc_msgSend(v73, "repository");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "syncCircleIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v48, "initWithZoneID:", v52);

        v54 = [HDCloudSyncCreateZonesOperation alloc];
        v91[0] = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "repository");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "primaryCKContainer");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v54, "initWithConfiguration:cloudState:zones:container:", v73, 0, v55, v57);

        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v47, "addOperation:transitionHandler:", v58, 0);
      }
      v59 = -[HDCloudSyncOperation initWithConfiguration:cloudState:]([HDCloudSyncMedicalIDPushOperation alloc], "initWithConfiguration:cloudState:", v73, 0);
      v37 = MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_3;
      v88 = &unk_1E6CE9AA0;
      v89 = self;
      v90 = v68;
      v60 = v68;
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v47, "addOperation:transitionHandler:", v59, buf);

    }
    else
    {
      v47 = 0;
    }

    v75[0] = v37;
    v75[1] = 3221225472;
    v75[2] = __41__HDCloudSyncPipelineStageMedicalID_main__block_invoke;
    v75[3] = &unk_1E6CFED98;
    v75[4] = self;
    v76 = v70;
    v77 = v26;
    v61 = v26;
    v62 = v70;
    -[HDCloudSyncOperation operationWithRunCondition:](v47, "operationWithRunCondition:", v75);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v72, "addOperation:transitionHandler:", v63, 0);
    -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v72);

    v7 = v71;
  }
  else
  {
    _HKInitializeLogging();
    v64 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_error_impl(&dword_1B7802000, v64, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch local Medical ID during cloud sync with error %{public}@", buf, 0x16u);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v7);
  }

}

uint64_t __41__HDCloudSyncPipelineStageMedicalID_main__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  v27 = v3;
  if (v1)
  {
    v5 = v3;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      obj = v4;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v5, "cloudMedicalIDData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            goto LABEL_9;
          objc_msgSend(v5, "cloudMedicalIDData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "dateSaved");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cloudMedicalIDData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dateSaved");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "hk_isBeforeDate:", v15);

          if (v16)
          {
LABEL_9:
            v17 = v10;

            v5 = v17;
          }
        }
        v4 = obj;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v5, "cloudMedicalIDData");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 136);
  *(_QWORD *)(v19 + 136) = v18;

  objc_msgSend(*(id *)(a1 + 40), "medicalIDRecord");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 144);
  *(_QWORD *)(v22 + 144) = v21;

  v24 = *(_QWORD *)(a1 + 32);
  if (*(_OWORD *)(v24 + 128) == 0)
    v25 = 0;
  else
    v25 = objc_msgSend(*(id *)(v24 + 128), "isEqualToSyncedData:") ^ 1;

  return v25;
}

void __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  v4 = a2;
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalMedicalIDData:", v3);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(v4, "operations");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCloudMedicalIDData:", v7);

}

void __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "mergedMedicalIDData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMedicalIDDataToPersist:", v5);

}

void __77__HDCloudSyncPipelineStageMedicalID__compoundSyncOperationWithConfiguration___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
  v6 = a3;
  objc_msgSend(v6, "setCloudMedicalIDData:", v4);
  objc_msgSend(*(id *)(a1 + 40), "mergedMedicalIDData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMedicalIDDataToPush:", v5);

  objc_msgSend(v6, "setMedicalIDRecord:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDRecord, 0);
  objc_storeStrong((id *)&self->_cloudMedicalIDData, 0);
  objc_storeStrong((id *)&self->_localMedicalIDData, 0);
}

@end
