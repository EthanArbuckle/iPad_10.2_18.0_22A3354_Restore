@implementation HDCloudSyncPipelineStageContextSyncPush

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  HDCloudSyncCompoundOperation *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDCloudSyncCreateZonesOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HDCloudSyncCreateZonesOperation *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Push Context Sync"), 0);

  v6 = objc_alloc(MEMORY[0x1E0C95088]);
  v7 = (void *)MEMORY[0x1E0C95098];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncContainerPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hd_contextSyncZoneIDForSyncCircleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithZoneID:", v10);

  v12 = [HDCloudSyncCreateZonesOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "repository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "primaryCKContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v12, "initWithConfiguration:cloudState:zones:container:", v13, 0, v14, v17);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v18, 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke;
  v24[3] = &unk_1E6CE77A0;
  v24[4] = self;
  -[HDCloudSyncOperation setOnError:](v5, "setOnError:", v24);
  v22[0] = v20;
  v22[1] = 3221225472;
  v22[2] = __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke_193;
  v22[3] = &unk_1E6CE98F8;
  v22[4] = self;
  v23 = v19;
  v21 = v19;
  -[HDCloudSyncOperation setOnSuccess:](v5, "setOnSuccess:", v22);
  -[HDCloudSyncCompoundOperation start](v5, "start");

}

void __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform context sync push %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __47__HDCloudSyncPipelineStageContextSyncPush_main__block_invoke_193(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analyticsSubmissionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v7, "contextSync_triggerDuration:");

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analyticsSubmissionCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextSync_operationSucceeded:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

@end
