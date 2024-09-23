@implementation HDCloudSyncManagerAcceptSharesTask

- (HDCloudSyncManagerAcceptSharesTask)initWithManager:(id)a3 context:(id)a4 shareSetupMetadata:(id)a5 accessibilityAssertion:(id)a6 completion:(id)a7
{
  id v13;
  HDCloudSyncManagerAcceptSharesTask *v14;
  HDCloudSyncManagerAcceptSharesTask *v15;
  objc_super v17;

  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncManagerAcceptSharesTask;
  v14 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v17, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a6, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_shareSetupMetadata, a5);

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
  void *v11;
  void *v12;
  HDCloudSyncAcceptSharesOperation *v13;
  void *v14;
  void *v15;
  void *v16;
  HDCloudSyncAcceptSharesOperation *v17;
  HDCloudSyncAcceptSharesOperation *acceptSharesOperation;
  void *v19;

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

  objc_msgSend(v10, "operationGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setQualityOfService:", 17);

  v13 = [HDCloudSyncAcceptSharesOperation alloc];
  objc_msgSend(v10, "operationConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata shareURLs](self->_shareSetupMetadata, "shareURLs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata invitationTokensByShareURL](self->_shareSetupMetadata, "invitationTokensByShareURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDCloudSyncAcceptSharesOperation initWithConfiguration:cloudState:shareURLs:invitationTokensByShareURL:](v13, "initWithConfiguration:cloudState:shareURLs:invitationTokensByShareURL:", v14, 0, v15, v16);
  acceptSharesOperation = self->_acceptSharesOperation;
  self->_acceptSharesOperation = v17;

  -[HDCloudSyncOperation asPipelineStage](self->_acceptSharesOperation, "asPipelineStage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addStage:", v19);

  return v10;
}

- (BOOL)requiresExistingShareOwnerParticipant
{
  return 0;
}

- (NSArray)acceptedShares
{
  return -[HDCloudSyncAcceptSharesOperation acceptedShares](self->_acceptSharesOperation, "acceptedShares");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptSharesOperation, 0);
  objc_storeStrong((id *)&self->_shareSetupMetadata, 0);
}

@end
