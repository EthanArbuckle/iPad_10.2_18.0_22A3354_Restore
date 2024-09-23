@implementation HDCloudSyncPipelineStageRegisterSubscriptions

- (HDCloudSyncPipelineStageRegisterSubscriptions)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncPipelineStageRegisterSubscriptions)initWithConfiguration:(id)a3 cloudState:(id)a4 subscriptions:(id)a5
{
  id v8;
  HDCloudSyncPipelineStageRegisterSubscriptions *v9;
  uint64_t v10;
  NSDictionary *subscriptions;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPipelineStageRegisterSubscriptions;
  v9 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSDictionary *)v10;

  }
  return v9;
}

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  void *v5;
  HDCloudSyncCompoundOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[NSDictionary count](self->_subscriptions, "count"))
  {
    v3 = [HDCloudSyncCompoundOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, v5, CFSTR("Register subscriptions."), 0);

    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryCKContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation cloudState](self, "cloudState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncPipelineStageRegisterSubscriptions _operationForContainer:configuration:cloudState:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v6, "addOperation:transitionHandler:", v12, 0);
    if (self->_includeSecondaryContainers)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[HDCloudSyncOperation configuration](self, "configuration", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "repository");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "secondaryCKContainers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v26 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            -[HDCloudSyncOperation configuration](self, "configuration");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncOperation cloudState](self, "cloudState");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncPipelineStageRegisterSubscriptions _operationForContainer:configuration:cloudState:]((HDCloudSyncRegisterSubscriptionsOperation *)self, v20, v21, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "operationIgnoringErrors");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v6, "addOperation:transitionHandler:", v24, 0);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v17);
      }

    }
    -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v6);

  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

- (HDCloudSyncRegisterSubscriptionsOperation)_operationForContainer:(void *)a3 configuration:(void *)a4 cloudState:
{
  HDCloudSyncRegisterSubscriptionsOperation *v4;
  id v7;
  id v8;
  id v9;

  v4 = a1;
  if (a1)
  {
    v7 = a4;
    v8 = a3;
    v9 = a2;
    v4 = -[HDCloudSyncRegisterSubscriptionsOperation initWithConfiguration:cloudState:container:subscriptions:]([HDCloudSyncRegisterSubscriptionsOperation alloc], "initWithConfiguration:cloudState:container:subscriptions:", v8, v7, v9, v4[1].super._onSuccess);

  }
  return v4;
}

- (NSDictionary)subscriptions
{
  return self->_subscriptions;
}

- (BOOL)includeSecondaryContainers
{
  return self->_includeSecondaryContainers;
}

- (void)setIncludeSecondaryContainers:(BOOL)a3
{
  self->_includeSecondaryContainers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end
