@implementation HDCloudSyncPipelineStagePrepareForSync

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  HDCloudSyncRepairStoreRecordsOperation *v8;
  void *v9;
  HDCloudSyncRepairStoreRecordsOperation *v10;
  void *v11;
  HDCloudSyncRepairRegistryRecordsOperation *v12;
  void *v13;
  HDCloudSyncRepairRegistryRecordsOperation *v14;
  void *v15;
  id v16;
  HDCloudSyncCompoundOperation *v17;
  void *v18;
  void *v19;
  char v20;
  HDCloudSyncValidatePushTargetOperation *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  HDCloudSyncValidateSubscriptionsOperation *v28;
  void *v29;
  HDCloudSyncCompoundOperation *v30;

  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Target Computation & Validation"), 0);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFastPushOrPull");

  if ((v7 & 1) == 0)
  {
    v8 = [HDCloudSyncRepairStoreRecordsOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v8, "initWithConfiguration:cloudState:", v9, 0);
    -[HDCloudSyncOperation operationIgnoringErrors](v10, "operationIgnoringErrors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v30, "addOperation:transitionHandler:", v11, 0);

  }
  v12 = [HDCloudSyncRepairRegistryRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HDCloudSyncRepairRegistryRecordsOperation initWithConfiguration:cloudState:](v12, "initWithConfiguration:cloudState:", v13, 0);
  -[HDCloudSyncOperation operationIgnoringErrors](v14, "operationIgnoringErrors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v30, "addOperation:transitionHandler:", v15, 0);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v17 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:]([HDCloudSyncCompoundOperation alloc], "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v16, 0, CFSTR("Targets & Validation"), 0);
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v17, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v17, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
    -[HDCloudSyncOperation configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isFastPushOrPull");

    if ((v20 & 1) == 0)
    {
      -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v17, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
      v21 = -[HDCloudSyncValidatePushTargetOperation initWithConfiguration:]([HDCloudSyncValidatePushTargetOperation alloc], "initWithConfiguration:", v16);
      -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v17, "addOperation:transitionHandler:", v21, 0);

    }
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v17, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  }
  else
  {
    v17 = 0;
  }

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v30, "addOperation:transitionHandler:", v17, 0);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isFastPushOrPull");

  if ((v24 & 1) == 0)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (self)
    {
      v27 = v25;
      v28 = -[HDCloudSyncOperation initWithConfiguration:cloudState:]([HDCloudSyncValidateSubscriptionsOperation alloc], "initWithConfiguration:cloudState:", v27, 0);

    }
    else
    {
      v28 = 0;
    }

    -[HDCloudSyncOperation operationIgnoringErrors](v28, "operationIgnoringErrors");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v30, "addOperation:transitionHandler:", v29, 0);

  }
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v30);

}

@end
