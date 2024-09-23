@implementation HDCloudSyncPipelineStageSharedSummaryPull

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  HDCloudSyncCompoundOperation *v5;
  HDCloudSyncValidateSubscriptionsOperation *v6;
  void *v7;
  HDCloudSyncValidateSubscriptionsOperation *v8;
  void *v9;
  HDCloudSyncSharedSummaryPullOperation *v10;
  void *v11;
  HDCloudSyncSharedSummaryPullOperation *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Pull Shared Summaries"), 0);

  v6 = [HDCloudSyncValidateSubscriptionsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v6, "initWithConfiguration:cloudState:", v7, 0);

  -[HDCloudSyncOperation operationIgnoringErrors](v8, "operationIgnoringErrors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v9, 0);

  v10 = [HDCloudSyncSharedSummaryPullOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v10, "initWithConfiguration:cloudState:", v11, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v12, 0);
  v13 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__HDCloudSyncPipelineStageSharedSummaryPull_main__block_invoke;
  v15[3] = &unk_1E6CE77A0;
  v15[4] = self;
  -[HDCloudSyncOperation setOnError:](v5, "setOnError:", v15);
  v14[0] = v13;
  v14[1] = 3221225472;
  v14[2] = __49__HDCloudSyncPipelineStageSharedSummaryPull_main__block_invoke_2;
  v14[3] = &unk_1E6CE7778;
  v14[4] = self;
  -[HDCloudSyncOperation setOnSuccess:](v5, "setOnSuccess:", v14);
  -[HDCloudSyncCompoundOperation start](v5, "start");

}

uint64_t __49__HDCloudSyncPipelineStageSharedSummaryPull_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

uint64_t __49__HDCloudSyncPipelineStageSharedSummaryPull_main__block_invoke_2(uint64_t a1)
{
  void *v1;
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
  os_log_t *v15;
  NSObject *v16;
  int v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "syncDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "legacyRepositoryProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    HDCloudSyncKeyValueDomainWithProfile(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "repository");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "primaryCKContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "containerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncLastSuccessfulPullKeyForContainerIdentifier((uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v15 = (os_log_t *)MEMORY[0x1E0CB5370];
    v16 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v1;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Recording successful shared summary pull", buf, 0xCu);
    }
    v23 = 0;
    v17 = objc_msgSend(v9, "setDate:forKey:error:", v4, v14, &v23);
    v18 = v23;
    if (v17)
    {
      objc_msgSend(v8, "cloudSyncManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "didCompleteSuccessfulPullWithDate:", v4);

    }
    else
    {
      _HKInitializeLogging();
      v20 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = v1;
        v26 = 2114;
        v27 = v18;
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to record successful pull: %{public}@.", buf, 0x16u);
      }
    }

    v21 = *(void **)(a1 + 32);
  }
  else
  {
    v21 = 0;
  }
  return objc_msgSend(v21, "finishWithSuccess:error:", 1, 0);
}

@end
