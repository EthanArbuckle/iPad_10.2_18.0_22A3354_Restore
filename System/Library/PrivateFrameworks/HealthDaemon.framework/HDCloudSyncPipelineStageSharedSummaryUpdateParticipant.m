@implementation HDCloudSyncPipelineStageSharedSummaryUpdateParticipant

- (HDCloudSyncPipelineStageSharedSummaryUpdateParticipant)initWithSummarySharingEntry:(id)a3 configuration:(id)a4
{
  return -[HDCloudSyncPipelineStageSharedSummaryUpdateParticipant initWithSummarySharingEntry:configuration:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:](self, "initWithSummarySharingEntry:configuration:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:", a3, a4, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (HDCloudSyncPipelineStageSharedSummaryUpdateParticipant)initWithSummarySharingEntry:(id)a3 configuration:(id)a4 authorizationIdentifiersToAdd:(id)a5 authorizationIdentifiersToDelete:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDCloudSyncPipelineStageSharedSummaryUpdateParticipant *v13;
  uint64_t v14;
  HDCodableSummarySharingEntry *codableEntry;
  uint64_t v16;
  NSArray *authorizationIdentifiersToAdd;
  uint64_t v18;
  NSArray *authorizationIdentifiersToDelete;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncPipelineStageSharedSummaryUpdateParticipant;
  v13 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v21, sel_initWithConfiguration_cloudState_, a4, 0);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    codableEntry = v13->_codableEntry;
    v13->_codableEntry = (HDCodableSummarySharingEntry *)v14;

    v16 = objc_msgSend(v11, "copy");
    authorizationIdentifiersToAdd = v13->_authorizationIdentifiersToAdd;
    v13->_authorizationIdentifiersToAdd = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    authorizationIdentifiersToDelete = v13->_authorizationIdentifiersToDelete;
    v13->_authorizationIdentifiersToDelete = (NSArray *)v18;

  }
  return v13;
}

- (void)main
{
  HDCloudSyncCompoundOperation *v3;
  void *v4;
  void *v5;
  HDCloudSyncCompoundOperation *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDCloudSyncCreateZonesOperation *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HDCloudSyncCreateZonesOperation *v21;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v22;
  void *v23;
  HDCloudSyncSharedSummaryUpdateParticipantOperation *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = [HDCloudSyncCompoundOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncCompoundOperation initWithConfiguration:cloudState:name:continueOnSubOperationError:](v3, "initWithConfiguration:cloudState:name:continueOnSubOperationError:", v4, v5, CFSTR("Update Participant"), 0);

  v7 = objc_alloc(MEMORY[0x1E0C95088]);
  v8 = (void *)MEMORY[0x1E0C95098];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncCircleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hd_unifiedSyncZoneIDForSyncCircleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithZoneID:", v12);

  v14 = [HDCloudSyncCreateZonesOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "primaryCKContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HDCloudSyncCreateZonesOperation initWithConfiguration:cloudState:zones:container:](v14, "initWithConfiguration:cloudState:zones:container:", v15, v16, v17, v20);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v6, "addOperation:transitionHandler:", v21, 0);
  v22 = [HDCloudSyncSharedSummaryUpdateParticipantOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HDCloudSyncSharedSummaryUpdateParticipantOperation initWithConfiguration:codableEntry:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:](v22, "initWithConfiguration:codableEntry:authorizationIdentifiersToAdd:authorizationIdentifiersToDelete:", v23, self->_codableEntry, self->_authorizationIdentifiersToAdd, self->_authorizationIdentifiersToDelete);

  -[HDCloudSyncCompoundOperation addOperation:transitionHandler:](v6, "addOperation:transitionHandler:", v24, 0);
  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersToAdd, 0);
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
