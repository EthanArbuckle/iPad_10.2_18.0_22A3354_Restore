@implementation HDCloudSyncPipelineStageSynchronize

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  HDCloudSyncCompoundOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HDCloudSyncCreateZonesOperation *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HDCloudSyncCreateZonesOperation *v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, 0, CFSTR("Synchronize"), 0);

  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncCompoundOperation addOperationOfClass:transitionHandler:](v5, "addOperationOfClass:transitionHandler:", objc_opt_class(), 0);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryCKContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profileIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDDatabaseForContainer(v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "databaseScope");

  if (v13 == 2)
  {
    v14 = objc_alloc(MEMORY[0x1E0C95088]);
    v15 = (void *)MEMORY[0x1E0C95098];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "repository");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "syncCircleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v14, "initWithZoneID:", v19);

    v21 = objc_alloc(MEMORY[0x1E0C95088]);
    v22 = (void *)MEMORY[0x1E0C95098];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "repository");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "syncCircleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hd_privateMetadataZoneIDForSyncCircleIdentifier:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v21, "initWithZoneID:", v26);

    v28 = [HDCloudSyncCreateZonesOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v20;
    v36[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "repository");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "primaryCKContainer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v28, "initWithConfiguration:cloudState:zones:container:", v29, 0, v30, v33);

    -[HDCloudSyncOperation operationIgnoringErrors](v34, "operationIgnoringErrors");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v5, "addOperation:transitionHandler:", v35, 0);

  }
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v5);

}

@end
