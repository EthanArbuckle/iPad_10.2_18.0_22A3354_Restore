@implementation HDCloudSyncDiscoverUserIdentityOperation

- (HDCloudSyncDiscoverUserIdentityOperation)initWithConfiguration:(id)a3 identityLookupInfo:(id)a4
{
  id v6;
  HDCloudSyncDiscoverUserIdentityOperation *v7;
  uint64_t v8;
  CKUserIdentityLookupInfo *identityLookupInfo;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncDiscoverUserIdentityOperation;
  v7 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v11, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identityLookupInfo = v7->_identityLookupInfo;
    v7->_identityLookupInfo = (CKUserIdentityLookupInfo *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)main
{
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  CKUserIdentityLookupInfo *identityLookupInfo;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _BYTE buf[24];
  void *v18;
  HDCloudSyncDiscoverUserIdentityOperation *v19;
  _QWORD *v20;
  _QWORD v21[2];

  v3 = MEMORY[0x1E0C809B0];
  v21[1] = *MEMORY[0x1E0C80C00];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__HDCloudSyncDiscoverUserIdentityOperation_main__block_invoke;
  v15[3] = &unk_1E6CE77C8;
  v15[4] = self;
  v4 = v15;
  if (self)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      identityLookupInfo = self->_identityLookupInfo;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = identityLookupInfo;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning operation with lookupinfo %{public}@", buf, 0x16u);
    }
    v7 = objc_alloc(MEMORY[0x1E0C94CF0]);
    v21[0] = self->_identityLookupInfo;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUserIdentityLookupInfos:", v8);

    v16[0] = v3;
    v16[1] = 3221225472;
    v16[2] = __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke;
    v16[3] = &unk_1E6CECF18;
    v16[4] = self;
    objc_msgSend(v9, "setUserIdentityDiscoveredBlock:", v16);
    *(_QWORD *)buf = v3;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke_186;
    v18 = &unk_1E6CECF40;
    v19 = self;
    v20 = v4;
    objc_msgSend(v9, "setDiscoverUserIdentitiesCompletionBlock:", buf);
    -[HDCloudSyncOperation configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "operationGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGroup:", v11);

    -[HDCloudSyncOperation configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryCKContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v9);

  }
}

uint64_t __48__HDCloudSyncDiscoverUserIdentityOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", a2, a3);
}

void __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Discovered user identity %{public}@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v6 + 112))
  {
    v7 = objc_msgSend(v3, "copy");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 112);
    *(_QWORD *)(v8 + 112) = v7;

    v6 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));

}

void __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 104));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 112);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "phoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = 727;
    else
      v6 = 733;

    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", v6, CFSTR("User identity operation finished but no identity was returned."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = v9;
    else
      v8 = v7;
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v8);

  }
}

- (void)_unitTest_setUserIdentity:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  CKUserIdentity *v6;
  CKUserIdentity *userIdentity;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (CKUserIdentity *)objc_msgSend(v5, "copy");

  userIdentity = self->_userIdentity;
  self->_userIdentity = v6;

  os_unfair_lock_unlock(p_lock);
}

- (CKUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityLookupInfo, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end
