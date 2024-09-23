@implementation HDCloudSyncLookupParticipantOperation

- (HDCloudSyncLookupParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncLookupParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5
{
  id v9;
  HDCloudSyncLookupParticipantOperation *v10;
  HDCloudSyncLookupParticipantOperation *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncLookupParticipantOperation;
  v10 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_identityLookupInfo, a5);

  return v11;
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C94E50]);
  v14[0] = self->_identityLookupInfo;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUserIdentityLookupInfos:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__HDCloudSyncLookupParticipantOperation_main__block_invoke;
  v13[3] = &unk_1E6CEECA8;
  v13[4] = self;
  objc_msgSend(v5, "setPerShareParticipantCompletionBlock:", v13);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __45__HDCloudSyncLookupParticipantOperation_main__block_invoke_188;
  v12[3] = &unk_1E6CE8030;
  v12[4] = self;
  objc_msgSend(v5, "setFetchShareParticipantsCompletionBlock:", v12);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operationGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroup:", v8);

  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryCKContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addOperation:", v5);
}

void __45__HDCloudSyncLookupParticipantOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = (id *)(*(_QWORD *)(a1 + 32) + 104);
    if (!*v10)
    {
      objc_storeStrong(v10, a3);
      objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v9;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching participant %{public}@.", (uint8_t *)&v13, 0x16u);
    }
  }

}

void __45__HDCloudSyncLookupParticipantOperation_main__block_invoke_188(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "participant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", v4 == 0);

}

- (void)_unitTest_setParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_participant, a3);
}

- (CKShareParticipant)participant
{
  return (CKShareParticipant *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityLookupInfo, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

@end
