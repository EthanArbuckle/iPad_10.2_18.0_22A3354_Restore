@implementation HDCloudSyncPipelineStageSharedSummarySynchronizeSharingEntryState

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  HDCloudSyncCompoundOperation *v6;
  void *v7;
  HDCloudSyncCompoundOperation *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HDCloudSyncCreateZonesOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HDCloudSyncCreateZonesOperation *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "profileType");

  if (v5 == 1)
  {
    v6 = [HDCloudSyncCompoundOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v6, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v7, 0, CFSTR("Synchronize Shared Summary State"), 0);

    v9 = objc_alloc(MEMORY[0x1E0C95088]);
    v10 = (void *)MEMORY[0x1E0C95098];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "repository");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncCircleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hd_privateMetadataZoneIDForSyncCircleIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v9, "initWithZoneID:", v14);

    v16 = [HDCloudSyncCreateZonesOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "repository");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "primaryCKContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v16, "initWithConfiguration:cloudState:zones:container:", v17, 0, v18, v21);

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v8, "addOperation:transitionHandler:", v22, 0);
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v8, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v8, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
    -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v8, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
    -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v8);

  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

@end
