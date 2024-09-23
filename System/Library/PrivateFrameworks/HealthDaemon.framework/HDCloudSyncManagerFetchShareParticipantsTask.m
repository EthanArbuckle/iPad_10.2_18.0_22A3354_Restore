@implementation HDCloudSyncManagerFetchShareParticipantsTask

- (HDCloudSyncManagerFetchShareParticipantsTask)initWithManager:(id)a3 context:(id)a4 fetchAllShares:(BOOL)a5 accessibilityAssertion:(id)a6 completion:(id)a7
{
  HDCloudSyncManagerFetchShareParticipantsTask *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncManagerFetchShareParticipantsTask;
  result = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v9, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a6, a7);
  if (result)
    result->_fetchAllShares = a5;
  return result;
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
  HDCloudSyncPipelineStageFetchShares *v17;
  void *v18;
  HDCloudSyncPipelineStageFetchShares *v19;
  HDCloudSyncPipelineStageFetchShares *fetchSharesStage;

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

  v17 = [HDCloudSyncPipelineStageFetchShares alloc];
  objc_msgSend(v10, "operationConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v17, "initWithConfiguration:cloudState:", v18, 0);
  fetchSharesStage = self->_fetchSharesStage;
  self->_fetchSharesStage = v19;

  -[HDCloudSyncPipelineStageFetchShares setFetchAllShares:](self->_fetchSharesStage, "setFetchAllShares:", self->_fetchAllShares);
  -[HDCloudSyncPipelineStage setCriticalFailureOnError:](self->_fetchSharesStage, "setCriticalFailureOnError:", 1);
  objc_msgSend(v10, "addStage:", self->_fetchSharesStage);
  return v10;
}

- (NSArray)shares
{
  return -[HDCloudSyncPipelineStageFetchShares shares](self->_fetchSharesStage, "shares");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchSharesStage, 0);
}

@end
