@implementation HDCloudSyncManagerSubscriptionTask

- (HDCloudSyncManagerSubscriptionTask)initWithManager:(id)a3 context:(id)a4 subscriptions:(id)a5 accessibilityAssertion:(id)a6 completion:(id)a7
{
  id v12;
  HDCloudSyncManagerSubscriptionTask *v13;
  uint64_t v14;
  NSDictionary *subscriptions;
  objc_super v17;

  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncManagerSubscriptionTask;
  v13 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v17, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a6, a7);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    subscriptions = v13->_subscriptions;
    v13->_subscriptions = (NSDictionary *)v14;

  }
  return v13;
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
  HDCloudSyncPipelineStageRegisterSubscriptions *v11;
  void *v12;
  HDCloudSyncPipelineStageRegisterSubscriptions *v13;

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

  v11 = [HDCloudSyncPipelineStageRegisterSubscriptions alloc];
  objc_msgSend(v10, "operationConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncPipelineStageRegisterSubscriptions initWithConfiguration:cloudState:subscriptions:](v11, "initWithConfiguration:cloudState:subscriptions:", v12, 0, self->_subscriptions);
  objc_msgSend(v10, "addStage:", v13);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end
