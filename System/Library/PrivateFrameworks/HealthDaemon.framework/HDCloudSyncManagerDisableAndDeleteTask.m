@implementation HDCloudSyncManagerDisableAndDeleteTask

- (id)pipelineForRepository:(id)a3
{
  id v4;
  HDCloudSyncPipeline *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v10;
  void *v11;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v12;
  HDCloudSyncPipelineStageSynchronize *v13;
  void *v14;
  HDCloudSyncPipelineStageSynchronize *v15;
  HDCloudSyncCompoundOperation *v16;
  void *v17;
  HDCloudSyncCompoundOperation *v18;
  HDCloudSyncDisableAndDeleteOperation *v19;
  void *v20;
  HDCloudSyncDisableAndDeleteOperation *v21;
  HDCloudSyncSharedSummaryDisableAndDeleteOperation *v22;
  void *v23;
  HDCloudSyncSharedSummaryDisableAndDeleteOperation *v24;
  void *v25;

  v4 = a3;
  v5 = [HDCloudSyncPipeline alloc];
  -[HDCloudSyncManagerRepositoryTask context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManagerRepositoryTask manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HDCloudSyncPipeline initForContext:repository:accessibilityAssertion:queue:](v5, "initForContext:repository:accessibilityAssertion:queue:", v6, v4, 0, v8);

  objc_msgSend(v9, "setContinueWhenSyncDisabled:", 1);
  v10 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
  objc_msgSend(v9, "operationConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v10, "initWithConfiguration:cloudState:", v11, 0);
  objc_msgSend(v9, "addStage:", v12);

  v13 = [HDCloudSyncPipelineStageSynchronize alloc];
  objc_msgSend(v9, "operationConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v13, "initWithConfiguration:cloudState:", v14, 0);
  objc_msgSend(v9, "addStage:", v15);

  v16 = [HDCloudSyncCompoundOperation alloc];
  objc_msgSend(v9, "operationConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v16, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v17, 0, CFSTR("Disable and Delete"), 0);

  v19 = [HDCloudSyncDisableAndDeleteOperation alloc];
  objc_msgSend(v9, "operationConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v19, "initWithConfiguration:cloudState:", v20, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v18, "addOperation:transitionHandler:", v21, 0);
  v22 = [HDCloudSyncSharedSummaryDisableAndDeleteOperation alloc];
  objc_msgSend(v9, "operationConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v22, "initWithConfiguration:cloudState:", v23, 0);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v18, "addOperation:transitionHandler:", v24, 0);
  -[HDCloudSyncOperation asPipelineStage](v18, "asPipelineStage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addStage:", v25);

  return v9;
}

@end
