@implementation HDCloudSyncPipelineStageAttachments

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  void *v5;
  HDCloudSyncCompoundOperation *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDCloudSyncCreateZonesOperation *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HDCloudSyncCreateZonesOperation *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, v5, CFSTR("Sync Attachments"), 0);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "profileType");

  if (v9 == 1)
  {
    v10 = objc_alloc(MEMORY[0x1E0C95088]);
    v11 = (void *)MEMORY[0x1E0C95098];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "syncCircleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hd_attachmentZoneIDWithSyncCircleIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v10, "initWithZoneID:", v15);

    v17 = [HDCloudSyncCreateZonesOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "repository");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "primaryCKContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v17, "initWithConfiguration:cloudState:zones:container:", v18, 0, v19, v22);

    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v6, "addOperation:transitionHandler:", v23, 0);
  }
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v6, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v6, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v6, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v6, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v6, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v6);

}

@end
