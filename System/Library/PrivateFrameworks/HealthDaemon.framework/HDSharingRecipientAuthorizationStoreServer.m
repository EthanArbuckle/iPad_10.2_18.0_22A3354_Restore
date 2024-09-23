@implementation HDSharingRecipientAuthorizationStoreServer

- (HDSharingRecipientAuthorizationStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDSharingRecipientAuthorizationStoreServer *v11;
  uint64_t v12;
  HKSharingRecipientAuthorizationStoreTaskConfiguration *configuration;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSharingRecipientAuthorizationStoreServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    configuration = v11->_configuration;
    v11->_configuration = (HKSharingRecipientAuthorizationStoreTaskConfiguration *)v12;

  }
  return v11;
}

- (void)remote_fetchSharingAuthorizationsWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void (**)(id, void *, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingAuthorizationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSharingRecipientAuthorizationStoreTaskConfiguration recipientIdentifier](self->_configuration, "recipientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "sharingAuthorizationsForRecipientIdentifier:error:", v7, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;

  v4[2](v4, v8, v9);
}

- (void)remote_fetchSharingAuthorizationsMarkedForDeletionWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void (**)(id, void *, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingAuthorizationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSharingRecipientAuthorizationStoreTaskConfiguration recipientIdentifier](self->_configuration, "recipientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:error:", v7, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;

  v4[2](v4, v8, v9);
}

- (void)remote_addSharingAuthorizations:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharingAuthorizationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSharingRecipientAuthorizationStoreTaskConfiguration recipientIdentifier](self->_configuration, "recipientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = objc_msgSend(v9, "addSharingAuthorizations:recipientIdentifier:error:", v7, v10, &v13);

  v12 = v13;
  v6[2](v6, v11, v12);

}

- (void)remote_removeSharingAuthorizations:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharingAuthorizationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSharingRecipientAuthorizationStoreTaskConfiguration recipientIdentifier](self->_configuration, "recipientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v11 = objc_msgSend(v9, "removeSharingAuthorizations:recipientIdentifier:error:", v7, v10, &v13);

  v12 = v13;
  v6[2](v6, v11, v12);

}

- (void)remote_revokeWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingAuthorizationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSharingRecipientAuthorizationStoreTaskConfiguration recipientIdentifier](self->_configuration, "recipientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = objc_msgSend(v6, "revokeRecipientWithIdentifier:error:", v7, &v10);
  v9 = v10;

  v4[2](v4, v8, v9);
}

- (void)remote_registerObservers
{
  void *v3;
  id v4;

  -[HDStandardTaskServer profile](self, "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingAuthorizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

}

- (void)remote_unregisterObservers
{
  void *v3;
  id v4;

  -[HDStandardTaskServer profile](self, "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharingAuthorizationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (void)sharingAuthorizationManager:(id)a3 didAddSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __122__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke;
  v8[3] = &unk_1E6CE8030;
  v8[4] = self;
  v6 = a4;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientRemote_didAddSharingAuthorizations:", v6);

}

void __122__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didAddSharingAuthorizations_recipientIdentifier___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of added authorizations: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sharingAuthorizationManager:(id)a3 didRemoveSharingAuthorizations:(id)a4 recipientIdentifier:(id)a5
{
  id v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __125__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke;
  v8[3] = &unk_1E6CE8030;
  v8[4] = self;
  v6 = a4;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientRemote_didRemoveSharingAuthorizations:", v6);

}

void __125__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRemoveSharingAuthorizations_recipientIdentifier___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of removed authorizations: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sharingAuthorizationManager:(id)a3 didRevokeRecipientWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  HDSharingRecipientAuthorizationStoreServer *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Revoking Recipient with Identifier: %{public}@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRevokeRecipientWithIdentifier___block_invoke;
  v8[3] = &unk_1E6CE8030;
  v8[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientRemote_wasRevoked");

}

void __107__HDSharingRecipientAuthorizationStoreServer_sharingAuthorizationManager_didRevokeRecipientWithIdentifier___block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of revoked authorizations: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB5ED0];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  void *v6;

  objc_msgSend(a3, "recipientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Missing recipient identifier"));
  return v6 != 0;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6BA8], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6BA8], "clientInterface");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
