@implementation HDCloudSyncSharedSummarySetupTask

- (HDCloudSyncSharedSummarySetupTask)initWithManager:(id)a3 context:(id)a4 codableEntry:(id)a5 authorizationIdentifiers:(id)a6 accessibilityAssertion:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  HDCloudSyncSharedSummarySetupTask *v17;
  HDCloudSyncSharedSummarySetupTask *v18;
  objc_super v20;

  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDCloudSyncSharedSummarySetupTask;
  v17 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v20, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a7, a8);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_codableEntry, a5);
    objc_storeStrong((id *)&v18->_authorizationIdentifiers, a6);
  }

  return v18;
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
  HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability *v11;
  void *v12;
  HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability *v13;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v14;
  void *v15;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v16;
  HDCloudSyncPipelineStageSynchronize *v17;
  void *v18;
  HDCloudSyncPipelineStageSynchronize *v19;
  HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *v20;
  void *v21;
  HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState *v22;
  HDCloudSyncPipelineStageSharedSummaryAddParticipant *v23;
  void *v24;
  HDCloudSyncPipelineStageSharedSummaryAddParticipant *v25;
  HDCloudSyncPipelineStageSharedSummaryAddParticipant *addParticipantStage;

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

  v11 = [HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability alloc];
  objc_msgSend(v10, "operationConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncPipelineStageWaitForDeviceToDeviceEncryptionAvailability initWithConfiguration:](v11, "initWithConfiguration:", v12);
  objc_msgSend(v10, "addStage:", v13);

  v14 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
  objc_msgSend(v10, "operationConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v14, "initWithConfiguration:cloudState:", v15, 0);
  objc_msgSend(v10, "addStage:", v16);

  v17 = [HDCloudSyncPipelineStageSynchronize alloc];
  objc_msgSend(v10, "operationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v17, "initWithConfiguration:cloudState:", v18, 0);
  objc_msgSend(v10, "addStage:", v19);

  v20 = [HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState alloc];
  objc_msgSend(v10, "operationConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v20, "initWithConfiguration:cloudState:", v21, 0);
  objc_msgSend(v10, "addStage:", v22);

  v23 = [HDCloudSyncPipelineStageSharedSummaryAddParticipant alloc];
  objc_msgSend(v10, "operationConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HDCloudSyncPipelineStageSharedSummaryAddParticipant initWithConfiguration:cloudState:codableEntry:authorizationIdentifiers:](v23, "initWithConfiguration:cloudState:codableEntry:authorizationIdentifiers:", v24, 0, self->_codableEntry, self->_authorizationIdentifiers);
  addParticipantStage = self->_addParticipantStage;
  self->_addParticipantStage = v25;

  objc_msgSend(v10, "addStage:", self->_addParticipantStage);
  return v10;
}

- (HDCloudSyncShareSetupMetadata)shareSetupMetadata
{
  return -[HDCloudSyncPipelineStageSharedSummaryAddParticipant shareSetupMetadata](self->_addParticipantStage, "shareSetupMetadata");
}

- (CKUserIdentity)participantIdentity
{
  return -[HDCloudSyncPipelineStageSharedSummaryAddParticipant participantIdentity](self->_addParticipantStage, "participantIdentity");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addParticipantStage, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
