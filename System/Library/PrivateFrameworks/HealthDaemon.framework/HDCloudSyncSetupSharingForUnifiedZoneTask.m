@implementation HDCloudSyncSetupSharingForUnifiedZoneTask

- (HDCloudSyncSetupSharingForUnifiedZoneTask)initWithManager:(id)a3 context:(id)a4 lookupInfo:(id)a5 requireExistingRelationship:(BOOL)a6 requireZoneDeviceMode:(id)a7 accessibilityAssertion:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  HDCloudSyncSetupSharingForUnifiedZoneTask *v17;
  uint64_t v18;
  CKUserIdentityLookupInfo *lookupInfo;
  uint64_t v20;
  NSNumber *requireZoneDeviceMode;
  objc_super v23;

  v15 = a5;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HDCloudSyncSetupSharingForUnifiedZoneTask;
  v17 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](&v23, sel_initWithManager_context_accessibilityAssertion_completion_, a3, a4, a8, a9);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    lookupInfo = v17->_lookupInfo;
    v17->_lookupInfo = (CKUserIdentityLookupInfo *)v18;

    v17->_requireExistingRelationship = a6;
    v20 = objc_msgSend(v16, "copy");
    requireZoneDeviceMode = v17->_requireZoneDeviceMode;
    v17->_requireZoneDeviceMode = (NSNumber *)v20;

  }
  return v17;
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
  HDCloudSyncPipelineStagePrepareForSync *v20;
  void *v21;
  HDCloudSyncPipelineStagePrepareForSync *v22;
  HDCloudSyncPipelineStagePush *v23;
  void *v24;
  HDCloudSyncPipelineStagePush *v25;
  HDCloudSyncShareToParticipantOperation *v26;
  void *v27;
  HDCloudSyncShareToParticipantOperation *v28;
  HDCloudSyncShareToParticipantOperation *shareOperation;
  void *v30;

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

  v20 = [HDCloudSyncPipelineStagePrepareForSync alloc];
  objc_msgSend(v10, "operationConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v20, "initWithConfiguration:cloudState:", v21, 0);
  objc_msgSend(v10, "addStage:", v22);

  v23 = [HDCloudSyncPipelineStagePush alloc];
  objc_msgSend(v10, "operationConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HDCloudSyncPipelineStagePush initWithConfiguration:cloudState:](v23, "initWithConfiguration:cloudState:", v24, 0);
  objc_msgSend(v10, "addStage:", v25);

  v26 = [HDCloudSyncShareToParticipantOperation alloc];
  objc_msgSend(v10, "operationConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HDCloudSyncShareToParticipantOperation initWithConfiguration:cloudState:identityLookupInfo:requireExistingRelationship:requireZoneDeviceMode:](v26, "initWithConfiguration:cloudState:identityLookupInfo:requireExistingRelationship:requireZoneDeviceMode:", v27, 0, self->_lookupInfo, self->_requireExistingRelationship, self->_requireZoneDeviceMode);
  shareOperation = self->_shareOperation;
  self->_shareOperation = v28;

  -[HDCloudSyncOperation asPipelineStage](self->_shareOperation, "asPipelineStage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addStage:", v30);

  return v10;
}

- (HDCloudSyncShareSetupMetadata)shareSetupMetadata
{
  return -[HDCloudSyncShareToParticipantOperation result](self->_shareOperation, "result");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareOperation, 0);
  objc_storeStrong((id *)&self->_requireZoneDeviceMode, 0);
  objc_storeStrong((id *)&self->_lookupInfo, 0);
}

@end
