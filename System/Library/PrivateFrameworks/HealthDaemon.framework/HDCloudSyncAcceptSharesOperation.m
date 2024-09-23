@implementation HDCloudSyncAcceptSharesOperation

- (HDCloudSyncAcceptSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncAcceptSharesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 shareURLs:(id)a5 invitationTokensByShareURL:(id)a6
{
  id v10;
  id v11;
  HDCloudSyncAcceptSharesOperation *v12;
  uint64_t v13;
  NSArray *shareURLs;
  uint64_t v15;
  NSDictionary *invitationTokensByShareURLs;
  NSArray *acceptedShares;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncAcceptSharesOperation;
  v12 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v19, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    shareURLs = v12->_shareURLs;
    v12->_shareURLs = (NSArray *)v13;

    v15 = objc_msgSend(v11, "copy");
    invitationTokensByShareURLs = v12->_invitationTokensByShareURLs;
    v12->_invitationTokensByShareURLs = (NSDictionary *)v15;

    acceptedShares = v12->_acceptedShares;
    v12->_acceptedShares = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v12;
}

- (void)main
{
  void *v3;
  NSObject *v4;
  NSArray *shareURLs;
  NSDictionary *invitationTokensByShareURLs;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  HDCloudSyncAcceptSharesOperation *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  HDCloudSyncAcceptSharesOperation *v26;
  __int16 v27;
  NSArray *v28;
  __int16 v29;
  NSDictionary *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_shareURLs, "count"))
  {
    -[NSDictionary allKeys](self->_invitationTokensByShareURLs, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      shareURLs = self->_shareURLs;
      invitationTokensByShareURLs = self->_invitationTokensByShareURLs;
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = shareURLs;
      v29 = 2114;
      v30 = invitationTokensByShareURLs;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepting shares (%{public}@) with invitation tokens: %{public}@", buf, 0x20u);
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E30]), "initWithShareURLs:invitationTokensByShareURL:", v3, self->_invitationTokensByShareURLs);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __40__HDCloudSyncAcceptSharesOperation_main__block_invoke;
    v23[3] = &unk_1E6CF64E8;
    v23[4] = self;
    v10 = v8;
    v24 = v10;
    objc_msgSend(v7, "setPerShareMetadataBlock:", v23);
    v17 = v9;
    v18 = 3221225472;
    v19 = __40__HDCloudSyncAcceptSharesOperation_main__block_invoke_188;
    v20 = &unk_1E6CEF7C8;
    v21 = self;
    v22 = v10;
    v11 = v10;
    objc_msgSend(v7, "setFetchShareMetadataCompletionBlock:", &v17);
    -[HDCloudSyncOperation configuration](self, "configuration", v17, v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operationGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGroup:", v13);

    -[HDCloudSyncOperation configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "repository");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "primaryCKContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v7);

  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

void __40__HDCloudSyncAcceptSharesOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5370];
  v11 = *MEMORY[0x1E0CB5370];
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 138543874;
      v15 = v12;
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: Share metadata: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138543874;
    v15 = v13;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@: Error retrieving share metadata: %{public}@", (uint8_t *)&v14, 0x20u);
  }

}

void __40__HDCloudSyncAcceptSharesOperation_main__block_invoke_188(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  os_log_t *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, void *, void *);
  void *v36;
  void *v37;
  id v38;
  _BYTE buf[24];
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "hd_errorSurfacingFatalCloudKitPartialFailure");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v3);
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v4 = objc_alloc(MEMORY[0x1E0C95130]);
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ownerIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "_initWithUserIdentity:", v6);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 128);
    *(_QWORD *)(v8 + 128) = v7;

    _HKInitializeLogging();
    v10 = (os_log_t *)MEMORY[0x1E0CB5370];
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(v12 + 128);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Found owner participant: %@", buf, 0x16u);
    }
    _HKInitializeLogging();
    v14 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning share acceptance with metadata: %{public}@", buf, 0x16u);
    }
    v17 = *(void **)(a1 + 32);
    if (v17)
    {
      v18 = *(void **)(a1 + 40);
      v19 = (objc_class *)MEMORY[0x1E0C94B78];
      v20 = v18;
      v21 = (void *)objc_msgSend([v19 alloc], "initWithShareMetadatas:", v20);

      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = MEMORY[0x1E0C809B0];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke;
      v40 = &unk_1E6CEF7C8;
      v41 = v17;
      v24 = v22;
      v42 = v24;
      objc_msgSend(v21, "setAcceptSharesCompletionBlock:", buf);
      v33 = v23;
      v34 = 3221225472;
      v35 = __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke_195;
      v36 = &unk_1E6CF6510;
      v37 = v17;
      v38 = v24;
      v25 = v24;
      objc_msgSend(v21, "setPerShareCompletionBlock:", &v33);
      objc_msgSend(v17, "configuration", v33, v34, v35, v36, v37);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "operationGroup");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setGroup:", v27);

      objc_msgSend(v17, "configuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "repository");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "primaryCKContainer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addOperation:", v21);

    }
  }
  else
  {
    v31 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 710, CFSTR("Failed to retrieve any share metadata."));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "finishWithSuccess:error:", 0, v32);

  }
}

void __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  v5 = *MEMORY[0x1E0CB5370];
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v13;
      v16 = 2114;
      v17 = v3;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to accept shares: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    v6 = *(void **)(a1 + 32);
    v7 = 0;
    v8 = v3;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully accepted all shares", (uint8_t *)&v14, 0xCu);
    }
    v10 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 120);
    *(_QWORD *)(v11 + 120) = v10;

    v6 = *(void **)(a1 + 32);
    v7 = 1;
    v8 = 0;
  }
  objc_msgSend(v6, "finishWithSuccess:error:", v7, v8);

}

void __67__HDCloudSyncAcceptSharesOperation__acceptSharesWithShareMetadata___block_invoke_195(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5370];
  v11 = *MEMORY[0x1E0CB5370];
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v12;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Accepted share: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = 138543874;
    v15 = v13;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = v9;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to accept share metadata with %{public}@: %{public}@", (uint8_t *)&v14, 0x20u);
  }

}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (NSDictionary)invitationTokensByShareURLs
{
  return self->_invitationTokensByShareURLs;
}

- (NSArray)acceptedShares
{
  return self->_acceptedShares;
}

- (CKShareParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_acceptedShares, 0);
  objc_storeStrong((id *)&self->_invitationTokensByShareURLs, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
}

@end
