@implementation HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation

- (HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation;
  result = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v5, sel_initWithConfiguration_cloudState_, a3, a4);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setUserIdentity:(id)a3
{
  CKUserIdentity *v5;
  CKUserIdentity *userIdentity;
  void *v7;

  v5 = (CKUserIdentity *)a3;
  if (-[HDCloudSyncOperation status](self, "status"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.status == HDCloudSyncOperationStatusPending"));

  }
  os_unfair_lock_lock(&self->_lock);
  userIdentity = self->_userIdentity;
  self->_userIdentity = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (CKUserIdentity)userIdentity
{
  os_unfair_lock_s *p_lock;
  CKUserIdentity *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_userIdentity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)main
{
  NSObject *v4;
  CKUserIdentity *userIdentity;
  CKUserIdentity *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[2];
  uint8_t buf[4];
  HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation *v24;
  __int16 v25;
  CKUserIdentity *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    userIdentity = self->_userIdentity;
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = userIdentity;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Beginning operation with user identity %{public}@", buf, 0x16u);
  }
  v6 = self->_userIdentity;
  if (v6)
  {
    -[CKUserIdentity userRecordID](v6, "userRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HDSummarySharingEntryPredicateForCloudKitIdentifierTypeStatusAndDirection((uint64_t)v8, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKUserIdentity userRecordID](self->_userIdentity, "userRecordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HDSummarySharingEntryPredicateForCloudKitIdentifierTypeStatusAndDirection((uint64_t)v11, 0, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D29840];
    v22[0] = v9;
    v22[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateMatchingAnyPredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "repository");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cloudSyncShimProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "summarySharingEntryShim");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke;
    v21[3] = &unk_1E6CE9750;
    v21[4] = self;
    objc_msgSend(v19, "sharingEntryExistsWithPredicate:configuration:completion:", v15, v20, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForNilArgument:class:selector:", CFSTR("_userIdentity"), objc_opt_class(), a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v9);
  }

}

void __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke(uint64_t a1, int a2, char a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v7 = a4;
  v8 = *(void **)(a1 + 32);
  if ((a3 & 1) != 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 730, CFSTR("You already have a pending or accepted invitation with this participant"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishWithSuccess:error:", 0, v9);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "repository");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "primaryCKContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke_2;
      v13[3] = &unk_1E6CE9728;
      v13[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v12, "fetchUserRecordIDWithCompletionHandler:", v13);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v7);
  }

}

void __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (!v15)
  {
    v12 = *(void **)(a1 + 32);
    v13 = 0;
    v14 = v5;
LABEL_6:
    objc_msgSend(v12, "finishWithSuccess:error:", v13, v14);
    goto LABEL_7;
  }
  objc_msgSend(v15, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "userRecordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  v10 = *(void **)(a1 + 32);
  if (!v9)
  {
    v12 = v10;
    v13 = 1;
    v14 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 732, CFSTR("You are attempting to share with yourself."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishWithSuccess:error:", 0, v11);

LABEL_7:
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
