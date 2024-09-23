@implementation HDCloudSyncPipelineStageReset

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  void *v5;
  HDCloudSyncCompoundOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, v5, CFSTR("Reset All Containers"), 1);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryCKContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncPipelineStageReset _resetOperationForContainer:primary:](self, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v6, "addOperation:transitionHandler:", v10, 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "repository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secondaryCKContainers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[HDCloudSyncPipelineStageReset _resetOperationForContainer:primary:](self, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v6, "addOperation:transitionHandler:", v18, 0);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v6);
}

- (HDCloudSyncResetOperation)_resetOperationForContainer:(int)a3 primary:
{
  id v5;
  HDCloudSyncResetOperation *v6;
  void *v7;
  void *v8;
  HDCloudSyncResetOperation *v9;
  HDCloudSyncResetOperation *v10;
  HDCloudSyncResetOperation *v11;

  if (a1)
  {
    v5 = a2;
    v6 = [HDCloudSyncResetOperation alloc];
    objc_msgSend(a1, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cloudState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDCloudSyncResetOperation initWithConfiguration:cloudState:container:](v6, "initWithConfiguration:cloudState:container:", v7, v8, v5);

    if (a3)
    {
      v10 = v9;
    }
    else
    {
      -[HDCloudSyncOperation operationIgnoringErrors](v9, "operationIgnoringErrors");
      v10 = (HDCloudSyncResetOperation *)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
