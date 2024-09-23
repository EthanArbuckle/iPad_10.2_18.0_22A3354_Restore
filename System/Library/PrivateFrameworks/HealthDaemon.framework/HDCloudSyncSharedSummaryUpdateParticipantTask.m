@implementation HDCloudSyncSharedSummaryUpdateParticipantTask

- (HDCloudSyncSharedSummaryUpdateParticipantTask)initWithManager:(id)a3 context:(id)a4 codableEntry:(id)a5 authorizationIdentifiersToAdd:(id)a6 authorizationIdentifiersToDelete:(id)a7 accessibilityAssertion:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  HDCloudSyncSharedSummaryUpdateParticipantTask *v18;
  HDCloudSyncSharedSummaryUpdateParticipantTask *v19;
  id v21;
  objc_super v22;

  v21 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HDCloudSyncSharedSummaryUpdateParticipantTask;
  v18 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v22, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_codableEntry, a5);
    objc_storeStrong((id *)&v19->_authorizationIdentifiersToAdd, a6);
    objc_storeStrong((id *)&v19->_authorizationIdentifiersToDelete, a7);
  }

  return v19;
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
  HDCloudSyncPipelineStageSharedSummaryUpdateParticipant *v20;
  HDCodableSummarySharingEntry *codableEntry;
  void *v22;
  HDCloudSyncPipelineStageSharedSummaryUpdateParticipant *v23;

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

  v20 = [HDCloudSyncPipelineStageSharedSummaryUpdateParticipant alloc];
  codableEntry = self->_codableEntry;
  objc_msgSend(v10, "operationConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HDCloudSyncPipelineStageSharedSummaryUpdateParticipant initWithSummarySharingEntry:configuration:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:](v20, "initWithSummarySharingEntry:configuration:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:", codableEntry, v22, self->_authorizationIdentifiersToAdd, self->_authorizationIdentifiersToDelete);

  objc_msgSend(v10, "addStage:", v23);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersToAdd, 0);
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
