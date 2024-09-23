@implementation HDCloudSyncManagerMedicalIDSyncTask

- (id)pipelineForRepository:(id)a3
{
  id v4;
  HDCloudSyncPipeline *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v11;
  void *v12;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v13;
  HDCloudSyncPipelineStageSynchronize *v14;
  void *v15;
  HDCloudSyncPipelineStageSynchronize *v16;
  HDCloudSyncPipelineStageMedicalID *v17;
  void *v18;
  HDCloudSyncPipelineStageMedicalID *v19;

  v4 = a3;
  v5 = [HDCloudSyncPipeline alloc];
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerPipelineTask accessibilityAssertion](self, "accessibilityAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDCloudSyncPipeline initForContext:repository:accessibilityAssertion:queue:](v5, "initForContext:repository:accessibilityAssertion:queue:", v6, v4, v7, v9);

  v11 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
  objc_msgSend(v10, "operationConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v11, "initWithConfiguration:cloudState:", v12, 0);
  objc_msgSend(v10, "addStage:", v13);

  v14 = [HDCloudSyncPipelineStageSynchronize alloc];
  objc_msgSend(v10, "operationConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v14, "initWithConfiguration:cloudState:", v15, 0);
  objc_msgSend(v10, "addStage:", v16);

  v17 = [HDCloudSyncPipelineStageMedicalID alloc];
  objc_msgSend(v10, "operationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v17, "initWithConfiguration:cloudState:", v18, 0);
  objc_msgSend(v10, "addStage:", v19);

  return v10;
}

- (void)didFinishWithSuccess
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateErrorRequiringUserAction:", 0);

  -[HDCloudSyncManagerPipelineTask callCompletionWithSuccess:error:](self, "callCompletionWithSuccess:error:", 1, 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HDCloudSyncManagerTask mirroringTasks](self, "mirroringTasks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "didFinishWithSuccess");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)didFailWithErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateErrorRequiringUserAction:", v6);

  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerPipelineTask callCompletionWithSuccess:error:](self, "callCompletionWithSuccess:error:", 0, v7);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HDCloudSyncManagerTask mirroringTasks](self, "mirroringTasks", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "didFailWithErrors:", v4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)combineWithTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEquivalent:", v6) & 1) == 0)
  {

    goto LABEL_6;
  }
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  if (!v11)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "mirrorTask:", self);
  v12 = 1;
LABEL_7:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
