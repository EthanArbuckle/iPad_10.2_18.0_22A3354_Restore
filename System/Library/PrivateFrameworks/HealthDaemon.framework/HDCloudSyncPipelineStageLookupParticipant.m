@implementation HDCloudSyncPipelineStageLookupParticipant

- (HDCloudSyncPipelineStageLookupParticipant)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncPipelineStageLookupParticipant)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5
{
  id v9;
  HDCloudSyncPipelineStageLookupParticipant *v10;
  HDCloudSyncPipelineStageLookupParticipant *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncPipelineStageLookupParticipant;
  v10 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_identityLookupInfo, a5);

  return v11;
}

- (void)main
{
  HDCloudSyncLookupParticipantOperation *v3;
  void *v4;
  void *v5;
  HDCloudSyncLookupParticipantOperation *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = [HDCloudSyncLookupParticipantOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation cloudState](self, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCloudSyncLookupParticipantOperation initWithConfiguration:cloudState:identityLookupInfo:](v3, "initWithConfiguration:cloudState:identityLookupInfo:", v4, v5, self->_identityLookupInfo);

  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke;
  v12[3] = &unk_1E6D0E058;
  v12[4] = self;
  -[HDCloudSyncOperation setOnSuccess:](v6, "setOnSuccess:", v12);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke_2;
  v11[3] = &unk_1E6CE77A0;
  v11[4] = self;
  -[HDCloudSyncOperation setOnError:](v6, "setOnError:", v11);
  -[HDCloudSyncOperation progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation progress](v6, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation progress](self, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addChild:withPendingUnitCount:", v9, objc_msgSend(v10, "totalUnitCount"));

  -[HDCloudSyncOperation start](v6, "start");
}

uint64_t __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "participant");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v4;

  objc_msgSend(v3, "cloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v7);
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

void __49__HDCloudSyncPipelineStageLookupParticipant_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "cloudState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCloudState:", v5);

  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v6);
}

- (CKShareParticipant)participant
{
  return (CKShareParticipant *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityLookupInfo, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

@end
