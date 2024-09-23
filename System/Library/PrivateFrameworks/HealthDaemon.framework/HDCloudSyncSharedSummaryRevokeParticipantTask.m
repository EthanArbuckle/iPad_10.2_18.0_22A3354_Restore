@implementation HDCloudSyncSharedSummaryRevokeParticipantTask

- (HDCloudSyncSharedSummaryRevokeParticipantTask)initWithManager:(id)a3 context:(id)a4 codableEntry:(id)a5 accessibilityAssertion:(id)a6 completion:(id)a7
{
  id v13;
  HDCloudSyncSharedSummaryRevokeParticipantTask *v14;
  HDCloudSyncSharedSummaryRevokeParticipantTask *v15;
  objc_super v17;

  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncSharedSummaryRevokeParticipantTask;
  v14 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v17, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a6, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_codableEntry, a5);

  return v15;
}

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
  HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *v17;
  void *v18;
  HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *v19;
  HDCloudSyncPipelineStageSharedSummaryRevokeParticipant *v20;
  HDCodableSummarySharingEntry *codableEntry;
  void *v22;
  HDCloudSyncPipelineStageSharedSummaryRevokeParticipant *v23;

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

  v17 = [HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState alloc];
  objc_msgSend(v10, "operationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v17, "initWithConfiguration:cloudState:", v18, 0);
  objc_msgSend(v10, "addStage:", v19);

  v20 = [HDCloudSyncPipelineStageSharedSummaryRevokeParticipant alloc];
  codableEntry = self->_codableEntry;
  objc_msgSend(v10, "operationConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HDCloudSyncPipelineStageSharedSummaryRevokeParticipant initWithOutgoingSummarySharingEntry:configuration:](v20, "initWithOutgoingSummarySharingEntry:configuration:", codableEntry, v22);

  objc_msgSend(v10, "addStage:", v23);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
