@implementation HDCloudSyncPipelineStageStateSync

- (void)main
{
  HDCloudSyncPipelineStageStateSync *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char **v11;
  uint64_t i;
  void *v13;
  void *v14;
  HDCloudSyncPipelineStageStateSync *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HDCloudSyncCompoundOperation *v24;
  void *v25;
  HDCloudSyncCompoundOperation *v26;
  HDCloudSyncCreateZonesOperation *v27;
  void *v28;
  void *v29;
  HDCloudSyncPipelineStageStateSync *v30;
  void *v31;
  void *v32;
  HDCloudSyncCreateZonesOperation *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  HDCloudSyncStateSyncOperation *v39;
  void *v40;
  HDCloudSyncStateSyncOperation *v41;
  void *v42;
  void *v43;
  void *v44;
  HDCloudSyncStateSyncOperation *v45;
  void *v46;
  void *v47;
  HDCloudSyncStateSyncOperation *v48;
  uint64_t v49;
  NSObject *v50;
  id obj;
  id obja;
  _QWORD v53[5];
  _QWORD v54[5];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[128];
  uint64_t v60;

  v2 = self;
  v60 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[HDCloudSyncOperation profile](v2, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "daemon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudSyncCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateSyncEntityClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v56;
      v11 = &selRef__loadFeatureEvaluators;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if (objc_msgSend(v13, "conformsToProtocol:", v11[115]))
          {
            v14 = (void *)MEMORY[0x1E0C95098];
            -[HDCloudSyncOperation configuration](v2, "configuration");
            v15 = v2;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "syncContainerPrefix");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stateEntitySchema");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "domain");
            v19 = v10;
            v20 = v3;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "hd_stateSyncZoneIDForSyncCircleIdentifier:domain:", v17, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            v3 = v20;
            v10 = v19;

            v2 = v15;
            v11 = &selRef__loadFeatureEvaluators;
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v22);
            objc_msgSend(v3, "addObject:", v23);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, buf, 16);
      }
      while (v9);
    }

  }
  else
  {
    v3 = 0;
  }
  if (objc_msgSend(v3, "count"))
  {
    v24 = [HDCloudSyncCompoundOperation alloc];
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v24, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v25, 0, CFSTR("State Sync"), 1);

    v27 = [HDCloudSyncCreateZonesOperation alloc];
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](v2, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "repository");
    v30 = v2;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "primaryCKContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    obja = v3;
    v33 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v27, "initWithConfiguration:cloudState:zones:container:", v28, 0, v3, v32);

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v26, "addOperation:transitionHandler:", v33, 0);
    v34 = (void *)MEMORY[0x1E0C99E60];
    -[HDCloudSyncOperation configuration](v30, "configuration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "repository");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "secondaryCKContainers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = [HDCloudSyncStateSyncOperation alloc];
    -[HDCloudSyncOperation configuration](v30, "configuration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[HDCloudSyncStateSyncOperation initWithConfiguration:containers:](v39, "initWithConfiguration:containers:", v40, v38);

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v26, "addOperation:transitionHandler:", v41, 0);
    -[HDCloudSyncOperation configuration](v30, "configuration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "repository");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "primaryCKContainer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = [HDCloudSyncStateSyncOperation alloc];
      -[HDCloudSyncOperation configuration](v30, "configuration");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[HDCloudSyncStateSyncOperation initWithConfiguration:containers:](v45, "initWithConfiguration:containers:", v46, v47);

      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v26, "addOperation:transitionHandler:", v48, 0);
    }
    v49 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __41__HDCloudSyncPipelineStageStateSync_main__block_invoke;
    v54[3] = &unk_1E6CE77A0;
    v54[4] = v30;
    -[HDCloudSyncOperation setOnError:](v26, "setOnError:", v54);
    v53[0] = v49;
    v53[1] = 3221225472;
    v53[2] = __41__HDCloudSyncPipelineStageStateSync_main__block_invoke_191;
    v53[3] = &unk_1E6CE7778;
    v53[4] = v30;
    -[HDCloudSyncOperation setOnSuccess:](v26, "setOnSuccess:", v53);
    -[HDCloudSyncCompoundOperation start](v26, "start");

    v3 = obja;
  }
  else
  {
    _HKInitializeLogging();
    v50 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v50, OS_LOG_TYPE_DEFAULT, "No State Entites found locally", buf, 2u);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](v2, "finishWithSuccess:error:", 1, 0);
  }

}

void __41__HDCloudSyncPipelineStageStateSync_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform state sync push %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __41__HDCloudSyncPipelineStageStateSync_main__block_invoke_191(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

@end
