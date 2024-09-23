@implementation HDCloudSyncPipelineStageSharedSummaryRevokeParticipant

- (HDCloudSyncPipelineStageSharedSummaryRevokeParticipant)initWithOutgoingSummarySharingEntry:(id)a3 configuration:(id)a4
{
  id v6;
  HDCloudSyncPipelineStageSharedSummaryRevokeParticipant *v7;
  uint64_t v8;
  HDCodableSummarySharingEntry *codableEntry;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncPipelineStageSharedSummaryRevokeParticipant;
  v7 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v11, sel_initWithConfiguration_cloudState_, a4, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    codableEntry = v7->_codableEntry;
    v7->_codableEntry = (HDCodableSummarySharingEntry *)v8;

  }
  return v7;
}

- (void)main
{
  HDCloudSyncSharedSummaryRevokeParticipantOperation *v3;
  void *v4;
  HDCloudSyncSharedSummaryRevokeParticipantOperation *v5;

  v3 = [HDCloudSyncSharedSummaryRevokeParticipantOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncSharedSummaryRevokeParticipantOperation initWithConfiguration:codableEntry:](v3, "initWithConfiguration:codableEntry:", v4, self->_codableEntry);

  -[HDCloudSyncOperation delegateToOperation:](self, "delegateToOperation:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
