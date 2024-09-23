@implementation HDCloudSyncPipelineStageContextSyncPull

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  HDCloudSyncCompoundOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  HDCloudSyncPullDeviceContextOperation *v19;
  void *v20;
  HDCloudSyncPullDeviceContextOperation *v21;
  HDCloudSyncPullDeviceContextOperation *v22;
  void *v23;
  HDCloudSyncPullDeviceContextOperation *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  HDCloudSyncPullDeviceKeyValueOperation *v31;
  void *v32;
  HDCloudSyncPullDeviceKeyValueOperation *v33;
  HDCloudSyncPullDeviceKeyValueOperation *v34;
  void *v35;
  HDCloudSyncPullDeviceKeyValueOperation *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Pull Context Sync"), 0);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryCKContainer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "secondaryCKContainers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        v19 = [HDCloudSyncPullDeviceContextOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[HDCloudSyncPullDeviceContextOperation initWithConfiguration:container:](v19, "initWithConfiguration:container:", v20, v18);

        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v21, 0);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v15);
  }

  if (v38)
  {
    v22 = [HDCloudSyncPullDeviceContextOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HDCloudSyncPullDeviceContextOperation initWithConfiguration:container:](v22, "initWithConfiguration:container:", v23, v38);

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v24, 0);
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v13;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        v31 = [HDCloudSyncPullDeviceKeyValueOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[HDCloudSyncPullDeviceKeyValueOperation initWithConfiguration:container:](v31, "initWithConfiguration:container:", v32, v30);

        -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v33, 0);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v27);
  }

  if (v38)
  {
    v34 = [HDCloudSyncPullDeviceKeyValueOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[HDCloudSyncPullDeviceKeyValueOperation initWithConfiguration:container:](v34, "initWithConfiguration:container:", v35, v38);

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v36, 0);
  }
  v37 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke;
  v40[3] = &unk_1E6CE77A0;
  v40[4] = self;
  -[HDCloudSyncOperation setOnError:](v5, "setOnError:", v40);
  v39[0] = v37;
  v39[1] = 3221225472;
  v39[2] = __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke_2;
  v39[3] = &unk_1E6CE7778;
  v39[4] = self;
  -[HDCloudSyncOperation setOnSuccess:](v5, "setOnSuccess:", v39);
  -[HDCloudSyncCompoundOperation start](v5, "start");

}

uint64_t __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, a3);
}

uint64_t __47__HDCloudSyncPipelineStageContextSyncPull_main__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

@end
