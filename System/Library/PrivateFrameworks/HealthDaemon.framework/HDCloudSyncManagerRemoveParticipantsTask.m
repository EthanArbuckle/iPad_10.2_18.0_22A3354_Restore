@implementation HDCloudSyncManagerRemoveParticipantsTask

- (HDCloudSyncManagerRemoveParticipantsTask)initWithManager:(id)a3 context:(id)a4 removeAllParticipants:(BOOL)a5 participantsToRemove:(id)a6 accessibilityAssertion:(id)a7 completion:(id)a8
{
  id v14;
  HDCloudSyncManagerRemoveParticipantsTask *v15;
  HDCloudSyncManagerRemoveParticipantsTask *v16;
  uint64_t v17;
  NSSet *participantsToRemove;
  objc_super v20;

  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDCloudSyncManagerRemoveParticipantsTask;
  v15 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v20, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a7, a8);
  v16 = v15;
  if (v15)
  {
    v15->_removeAllParticipants = a5;
    v17 = objc_msgSend(v14, "copy");
    participantsToRemove = v16->_participantsToRemove;
    v16->_participantsToRemove = (NSSet *)v17;

  }
  return v16;
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
  HDCloudSyncPipelineStageRemoveSharingParticipants *v17;
  void *v18;
  HDCloudSyncPipelineStageRemoveSharingParticipants *v19;

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

  v17 = [HDCloudSyncPipelineStageRemoveSharingParticipants alloc];
  objc_msgSend(v10, "operationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v17, "initWithConfiguration:cloudState:", v18, 0);

  if (self->_removeAllParticipants)
    -[HDCloudSyncPipelineStageRemoveSharingParticipants setRemoveAllParticipants:](v19, "setRemoveAllParticipants:", 1);
  else
    -[HDCloudSyncPipelineStageRemoveSharingParticipants setParticipantsToRemove:](v19, "setParticipantsToRemove:", self->_participantsToRemove);
  objc_msgSend(v10, "addStage:", v19);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsToRemove, 0);
}

@end
