@implementation KCSharingGroupManager

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_3041);
  return (id)sharedInstance_instance;
}

void __61__KCSharingGroupManager_fetchCurrentUserIdentifierWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  KCSharingLogObject(CFSTR("KCSharingGroupManager"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_18A900000, v8, OS_LOG_TYPE_INFO, "Fetched current user identifier: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = v6;
    _os_log_error_impl(&dword_18A900000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch current user identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCachedCurrentUserIdentifier:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setCachedCurrentUserIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

void __39__KCSharingGroupManager_sharedInstance__block_invoke()
{
  KCSharingGroupManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [KCSharingGroupManager alloc];
  +[KCSharingDaemonConnection sharedInstance](KCSharingDaemonConnection, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[KCSharingGroupManager initWithDaemonConnection:](v0, "initWithDaemonConnection:", v3);
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = v1;

}

- (KCSharingGroupManager)initWithDaemonConnection:(id)a3
{
  id v5;
  KCSharingGroupManager *v6;
  KCSharingGroupManager *v7;
  NSString *cachedCurrentUserIdentifier;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KCSharingGroupManager;
  v6 = -[KCSharingGroupManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemonConnection, a3);
    cachedCurrentUserIdentifier = v7->_cachedCurrentUserIdentifier;
    v7->_cachedCurrentUserIdentifier = 0;

    objc_msgSend(v5, "addConnectionListener:", v7);
  }

  return v7;
}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[KCSharingGroupManager cachedCurrentUserIdentifier](self, "cachedCurrentUserIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[KCSharingGroupManager cachedCurrentUserIdentifier](self, "cachedCurrentUserIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__KCSharingGroupManager_fetchCurrentUserIdentifierWithReply___block_invoke;
    v8[3] = &unk_1E1FCD950;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "fetchCurrentUserIdentifierWithReply:", v8);

  }
}

- (NSString)cachedCurrentUserIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)addSubscriber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConnectionListener:", v4);

}

- (void)provisionWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provisionWithReply:", v4);

}

- (KCSharingDaemonConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getGroupByGroupID:completion:", v7, v6);

}

- (void)getGroupsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getGroupsWithRequest:completion:", v7, v6);

}

- (void)createGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createGroupWithRequest:completion:", v7, v6);

}

- (void)updateGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateGroupWithRequest:completion:", v7, v6);

}

- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leaveGroupWithRequest:completion:", v7, v6);

}

- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteGroupWithRequest:completion:", v7, v6);

}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acceptInviteForGroupID:completion:", v7, v6);

}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "declineInviteForGroupID:completion:", v7, v6);

}

- (void)checkAvailabilityForHandle:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__KCSharingGroupManager_checkAvailabilityForHandle_completion___block_invoke;
  v11[3] = &unk_1E1FCD928;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[KCSharingGroupManager checkAvailabilityForHandles:completion:](self, "checkAvailabilityForHandles:completion:", v8, v11);

}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "checkAvailabilityForHandles:completion:", v7, v6);

}

- (void)removeSubscriber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeConnectionListener:", v4);

}

- (void)resyncWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resyncWithCompletion:", v4);

}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verifyGroupsInSyncWithCompletion:", v4);

}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performMaintenanceWithCompletion:", v4);

}

- (void)accountChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  KCSharingLogObject(CFSTR("KCSharingGroupManager"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[KCSharingGroupManager cachedCurrentUserIdentifier](self, "cachedCurrentUserIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_DEFAULT, "Received accountChanged notification, invalidating cached current user identifier: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  -[KCSharingGroupManager setCachedCurrentUserIdentifier:](self, "setCachedCurrentUserIdentifier:", 0);
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCurrentUserIdentifier, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

void __63__KCSharingGroupManager_checkAvailabilityForHandle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "BOOLValue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
