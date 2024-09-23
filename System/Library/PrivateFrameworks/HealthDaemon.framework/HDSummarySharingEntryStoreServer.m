@implementation HDSummarySharingEntryStoreServer

- (HDSummarySharingEntryStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSummarySharingEntryStoreServer *v11;
  void *v12;
  uint64_t v13;
  HDSummarySharingEntryIDSManager *summarySharingEntryIDSManager;
  void *v15;
  uint64_t v16;
  HDSummarySharingEntryManager *sharingEntryManager;
  void *v18;
  uint64_t v19;
  HDSharingAuthorizationManager *sharingAuthorizationManager;
  void *v21;
  objc_super v23;

  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDSummarySharingEntryStoreServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v23, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    objc_msgSend(v10, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "summarySharingEntryIDSManager");
    v13 = objc_claimAutoreleasedReturnValue();
    summarySharingEntryIDSManager = v11->_summarySharingEntryIDSManager;
    v11->_summarySharingEntryIDSManager = (HDSummarySharingEntryIDSManager *)v13;

    objc_msgSend(v10, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sharingEntryManager");
    v16 = objc_claimAutoreleasedReturnValue();
    sharingEntryManager = v11->_sharingEntryManager;
    v11->_sharingEntryManager = (HDSummarySharingEntryManager *)v16;

    objc_msgSend(v10, "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sharingAuthorizationManager");
    v19 = objc_claimAutoreleasedReturnValue();
    sharingAuthorizationManager = v11->_sharingAuthorizationManager;
    v11->_sharingAuthorizationManager = (HDSharingAuthorizationManager *)v19;

    -[HDSummarySharingEntryIDSManager addObserver:](v11->_summarySharingEntryIDSManager, "addObserver:", v11);
    -[HDSummarySharingEntryManager addObserver:](v11->_sharingEntryManager, "addObserver:", v11);
    objc_msgSend(v10, "profile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerProfileReadyObserver:queue:", v11, 0);

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[HDSummarySharingEntryManager removeObserver:](self->_sharingEntryManager, "removeObserver:", self);
  -[HDSummarySharingEntryIDSManager removeObserver:](self->_summarySharingEntryIDSManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HDSummarySharingEntryStoreServer;
  -[HDSummarySharingEntryStoreServer dealloc](&v3, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  HDSummarySharingEntryManager *sharingEntryManager;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  HDSummarySharingEntryStoreServer *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  sharingEntryManager = self->_sharingEntryManager;
  v8 = 0;
  v5 = -[HDSummarySharingEntryManager resolveContactsIfNeededWithError:](sharingEntryManager, "resolveContactsIfNeededWithError:", &v8);
  v6 = v8;
  if (!v5)
  {
    _HKInitializeLogging();
    HKLogSharing();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to resolve contacts: %{public}@", buf, 0x16u);
    }

  }
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C98], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C98], "clientInterface");
}

- (void)summarySharingEntryIDSManager:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v7 = a5;
  v8 = a4;
  -[HDStandardTaskServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __100__HDSummarySharingEntryStoreServer_summarySharingEntryIDSManager_didUpdateReachabilityStatus_error___block_invoke;
  v12[3] = &unk_1E6CE8030;
  v12[4] = self;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "clientRemote_reachabilityStatusDidUpdate:error:", v8, v7);
}

void __100__HDSummarySharingEntryStoreServer_summarySharingEntryIDSManager_didUpdateReachabilityStatus_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of reachability status update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sharingEntriesDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  HDSummarySharingEntryManager *sharingEntryManager;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint8_t v33[128];
  uint8_t buf[4];
  HDSummarySharingEntryStoreServer *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    _HKInitializeLogging();
    HKLogSharing();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sharing entries updated: %@", buf, 0x16u);
    }

    -[HDStandardTaskServer client](self, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke;
    v32[3] = &unk_1E6CE8030;
    v32[4] = self;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "UUID", v24);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          HDSummarySharingEntryPredicateForUUID((uint64_t)v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sharingEntryManager = self->_sharingEntryManager;
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke_189;
    v25[3] = &unk_1E6CF4BC8;
    v25[4] = self;
    v19 = v16;
    v26 = v19;
    v20 = -[HDSummarySharingEntryManager enumerateCodableEntriesWithPredicate:error:handler:](sharingEntryManager, "enumerateCodableEntriesWithPredicate:error:handler:", v18, &v27, v25);
    v21 = v27;

    if (v20)
    {
      v22 = v24;
      objc_msgSend(v24, "clientRemote_sharingEntriesDidUpdate:", v19);
    }
    else
    {
      _HKInitializeLogging();
      HKLogSharing();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v35 = self;
        v36 = 2112;
        v37 = v21;
        _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entries updated but failed to fetch new entries. %@", buf, 0x16u);
      }

      v22 = v24;
    }

  }
}

void __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogSharing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of sharing entry update: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

uint64_t __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke_189(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "sharingEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileIdentifierForUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "type") == 2)
    objc_msgSend(v3, "_setProfileIdentifier:", v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 1;
}

- (void)remote_fetchSharingEntriesWithCompletionHandler:(id)a3
{
  HDSummarySharingEntryManager *sharingEntryManager;
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  id v7;

  sharingEntryManager = self->_sharingEntryManager;
  v7 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDSummarySharingEntryManager fetchSharingEntriesWithError:](sharingEntryManager, "fetchSharingEntriesWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  v4[2](v4, v5, v6);

}

- (void)remote_beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4
{
  -[HDSummarySharingEntryIDSManager beginObservingReachabilityStatusForIdentifiers:isInitialQuery:](self->_summarySharingEntryIDSManager, "beginObservingReachabilityStatusForIdentifiers:isInitialQuery:", a3, a4);
}

- (void)remote_inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8
{
  id v14;
  HDSummarySharingEntryIDSManager *summarySharingEntryIDSManager;
  id v16;
  _QWORD v17[4];
  id v18;

  v14 = a8;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __146__HDSummarySharingEntryStoreServer_remote_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke;
  v17[3] = &unk_1E6CE77F0;
  v18 = v14;
  v16 = v14;
  -[HDSummarySharingEntryIDSManager inviteSharingDataWithIdentifier:firstName:lastName:sharingAuthorizations:userWheelchairMode:completion:](summarySharingEntryIDSManager, "inviteSharingDataWithIdentifier:firstName:lastName:sharingAuthorizations:userWheelchairMode:completion:", a3, a4, a5, a6, a7, v17);

}

void __146__HDSummarySharingEntryStoreServer_remote_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E0C947D8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_acceptInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDSummarySharingEntryIDSManager *summarySharingEntryIDSManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HDSummarySharingEntryStoreServer_remote_acceptInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E6CE77F0;
  v10 = v6;
  v8 = v6;
  -[HDSummarySharingEntryIDSManager acceptInvitationWithUUID:completion:](summarySharingEntryIDSManager, "acceptInvitationWithUUID:completion:", a3, v9);

}

void __79__HDSummarySharingEntryStoreServer_remote_acceptInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E0C947D8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_declineInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDSummarySharingEntryIDSManager *summarySharingEntryIDSManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__HDSummarySharingEntryStoreServer_remote_declineInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E6CE77F0;
  v10 = v6;
  v8 = v6;
  -[HDSummarySharingEntryIDSManager declineInvitationWithUUID:completion:](summarySharingEntryIDSManager, "declineInvitationWithUUID:completion:", a3, v9);

}

void __80__HDSummarySharingEntryStoreServer_remote_declineInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E0C947D8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_revokeInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDSummarySharingEntryIDSManager *summarySharingEntryIDSManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HDSummarySharingEntryStoreServer_remote_revokeInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E6CE77F0;
  v10 = v6;
  v8 = v6;
  -[HDSummarySharingEntryIDSManager revokeInvitationWithUUID:completion:](summarySharingEntryIDSManager, "revokeInvitationWithUUID:completion:", a3, v9);

}

void __79__HDSummarySharingEntryStoreServer_remote_revokeInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E0C947D8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_leaveInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  HDSummarySharingEntryIDSManager *summarySharingEntryIDSManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__HDSummarySharingEntryStoreServer_remote_leaveInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E6CE77F0;
  v10 = v6;
  v8 = v6;
  -[HDSummarySharingEntryIDSManager leaveInvitationWithUUID:completion:](summarySharingEntryIDSManager, "leaveInvitationWithUUID:completion:", a3, v9);

}

void __78__HDSummarySharingEntryStoreServer_remote_leaveInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E0C947D8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_unpauseInvitationWithUUID:(id)a3 completion:(id)a4
{
  HDSummarySharingEntryManager *sharingEntryManager;
  void (**v6)(id, uint64_t, id);
  uint64_t v7;
  id v8;
  id v9;

  sharingEntryManager = self->_sharingEntryManager;
  v9 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = -[HDSummarySharingEntryManager updateEntryWithUUID:pauseStatus:error:](sharingEntryManager, "updateEntryWithUUID:pauseStatus:error:", a3, 0, &v9);
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (void)remote_updateAuthorizationIdentifiersForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  HDSummarySharingEntryManager *sharingEntryManager;
  void (**v12)(id, uint64_t, id);
  uint64_t v13;
  id v14;
  id v15;

  v7 = a6;
  sharingEntryManager = self->_sharingEntryManager;
  v15 = 0;
  v12 = (void (**)(id, uint64_t, id))a7;
  v13 = -[HDSummarySharingEntryManager updateEntryWithUUID:authorizationsToAdd:authorizationsToDelete:deleteOnCommit:error:](sharingEntryManager, "updateEntryWithUUID:authorizationsToAdd:authorizationsToDelete:deleteOnCommit:error:", a3, a4, a5, v7, &v15);
  v14 = v15;
  v12[2](v12, v13, v14);

}

- (void)remote_updateNotificationStatusWithUUID:(id)a3 notificationStatus:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  HDSummarySharingEntryManager *sharingEntryManager;
  void *v10;
  id v11;
  HDSummarySharingEntryManager *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v8 = (void (**)(id, uint64_t, id))a5;
  sharingEntryManager = self->_sharingEntryManager;
  v19 = 0;
  -[HDSummarySharingEntryManager codableEntryWithUUID:errorOut:](sharingEntryManager, "codableEntryWithUUID:errorOut:", a3, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    v12 = self->_sharingEntryManager;
    v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v10, "invitationUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
    v18 = 0;
    v16 = -[HDSummarySharingEntryManager updateEntryWithInvitationUUID:newNotificationStatus:error:](v12, "updateEntryWithInvitationUUID:newNotificationStatus:error:", v15, a4, &v18);
    v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    v8[2](v8, 0, v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_sharingEntryManager, 0);
  objc_storeStrong((id *)&self->_summarySharingEntryIDSManager, 0);
}

@end
