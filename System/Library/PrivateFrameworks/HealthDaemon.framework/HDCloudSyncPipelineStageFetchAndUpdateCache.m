@implementation HDCloudSyncPipelineStageFetchAndUpdateCache

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  HDCloudSyncCompoundOperation *v5;
  HDCloudSyncUpdateCachedRecordsOperation *v6;
  void *v7;
  HDCloudSyncUpdateCachedRecordsOperation *v8;
  HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation *v9;
  void *v10;
  HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation *v11;
  HDCloudSyncHandleMissingManateeIdentityOperation *v12;
  void *v13;
  HDCloudSyncHandleMissingManateeIdentityOperation *v14;
  HDCloudSyncDeleteRecordsOperation *v15;
  void *v16;
  HDCloudSyncDeleteRecordsOperation *v17;
  void *v18;
  HDCloudSyncDeleteRecordsOperation *v19;
  HDCloudSyncUpdateCachedRecordsOperation *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  HDCloudSyncDeleteRecordsOperation *v28;
  HDCloudSyncUpdateCachedRecordsOperation *v29;

  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Fetch & Update"), 0);

  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  v6 = [HDCloudSyncUpdateCachedRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDCloudSyncUpdateCachedRecordsOperation initWithConfiguration:cloudState:](v6, "initWithConfiguration:cloudState:", v7, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v8, 0);
  v9 = [HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDCloudSyncUpdateCachedRecordsOperation initWithConfiguration:cloudState:](v9, "initWithConfiguration:cloudState:", v10, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v11, 0);
  v12 = [HDCloudSyncHandleMissingManateeIdentityOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDCloudSyncHandleMissingManateeIdentityOperation initWithConfiguration:cloudState:](v12, "initWithConfiguration:cloudState:", v13, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v14, 0);
  v15 = [HDCloudSyncDeleteRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDCloudSyncDeleteRecordsOperation initWithConfiguration:cloudState:](v15, "initWithConfiguration:cloudState:", v16, 0);

  -[HDCloudSyncOperation operationIgnoringErrors](v17, "operationIgnoringErrors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __51__HDCloudSyncPipelineStageFetchAndUpdateCache_main__block_invoke;
  v27 = &unk_1E6CE9AA0;
  v19 = v17;
  v28 = v19;
  v20 = v8;
  v29 = v20;
  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v18, &v24);

  -[HDCloudSyncOperation configuration](self, "configuration", v24, v25, v26, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "options");

  if ((v23 & 4) == 0)
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v5);

}

void __51__HDCloudSyncPipelineStageFetchAndUpdateCache_main__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "invalidRecordIDs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRecordIDsToDelete:", v2);

}

@end
