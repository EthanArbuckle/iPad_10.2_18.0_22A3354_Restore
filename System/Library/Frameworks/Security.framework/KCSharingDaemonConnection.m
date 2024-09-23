@implementation KCSharingDaemonConnection

void __43__KCSharingDaemonConnection_sharedInstance__block_invoke()
{
  KCSharingDaemonConnection *v0;
  void *v1;

  v0 = -[KCSharingDaemonConnection initWithType:]([KCSharingDaemonConnection alloc], "initWithType:", 0);
  v1 = (void *)sharedInstance_connection;
  sharedInstance_connection = (uint64_t)v0;

}

- (KCSharingDaemonConnection)initWithType:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  KCSharingDaemonConnection *v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, -1);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = dispatch_queue_create("com.apple.KCSharingDaemonConnection.xpcConnection", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.security.kcsharing"), 0);
  v9 = -[KCSharingDaemonConnection initWithConnection:queue:type:](self, "initWithConnection:queue:type:", v8, v7, a3);

  return v9;
}

- (KCSharingDaemonConnection)initWithConnection:(id)a3 queue:(id)a4 type:(int64_t)a5
{
  id v9;
  id v10;
  KCSharingDaemonConnection *v11;
  uint64_t v12;
  NSHashTable *connectionListeners;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)KCSharingDaemonConnection;
  v11 = -[KCSharingDaemonConnection init](&v23, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    connectionListeners = v11->_connectionListeners;
    v11->_connectionListeners = (NSHashTable *)v12;

    objc_storeStrong((id *)&v11->_connection, a3);
    v11->_type = a5;
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    if (a5 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF7FF98);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      KCSharingSetupInvitationNotificationProtocol(v14);
      objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
      {
        v14 = 0;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF7FEF8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      KCSharingSetupServerProtocol(v14);
      objc_claimAutoreleasedReturnValue();
    }

LABEL_8:
    objc_msgSend(v9, "setRemoteObjectInterface:", v14);
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke;
    v20[3] = &unk_1E1FD8518;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v9, "setInterruptionHandler:", v20);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke_2;
    v18[3] = &unk_1E1FD8518;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v9, "setInvalidationHandler:", v18);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF7FC20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedInterface:", v16);

    objc_msgSend(v9, "setExportedObject:", v11);
    objc_msgSend(v9, "_setQueue:", v10);
    objc_msgSend(v9, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }

  return v11;
}

void __51__KCSharingDaemonConnection_addConnectionListener___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connectionListeners");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)connectionListeners
{
  return self->_connectionListeners;
}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/fetchCurrentUserIdentifierWithReply", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__KCSharingDaemonConnection_fetchCurrentUserIdentifierWithReply___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchCurrentUserIdentifierWithReply:", v7);

  os_activity_scope_leave(&state);
}

- (void)provisionWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/provisionWithReply", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__KCSharingDaemonConnection_provisionWithReply___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "provisionWithReply:", v7);

  os_activity_scope_leave(&state);
}

- (void)addConnectionListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[KCSharingDaemonConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__KCSharingDaemonConnection_addConnectionListener___block_invoke;
  v8[3] = &unk_1E1FCDAD8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1374);
  return (id)sharedInstance_connection;
}

- (void)removeConnectionListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[KCSharingDaemonConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__KCSharingDaemonConnection_removeConnectionListener___block_invoke;
  v8[3] = &unk_1E1FCDAD8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)connectionWasInterrupted
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  KCSharingLogObject(CFSTR("KCSharingDaemonConnection"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[KCSharingDaemonConnection connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_INFO, "connection interrupted %@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)connectionWasInvalidated
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  KCSharingLogObject(CFSTR("KCSharingDaemonConnection"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[KCSharingDaemonConnection connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_INFO, "connection invalidated %@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[KCSharingDaemonConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)KCSharingDaemonConnection;
  -[KCSharingDaemonConnection dealloc](&v4, sel_dealloc);
}

- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_18A900000, "ksd/client/setChangeTrackingEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__KCSharingDaemonConnection_setChangeTrackingEnabled_reply___block_invoke;
  v11[3] = &unk_1E1FD6038;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setChangeTrackingEnabled:reply:", v4, v9);

  os_activity_scope_leave(&state);
}

- (void)fetchRemoteChangesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/fetchRemoteChangesWithReply", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__KCSharingDaemonConnection_fetchRemoteChangesWithReply___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRemoteChangesWithReply:", v7);

  os_activity_scope_leave(&state);
}

- (void)saveLocalChangesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/saveLocalChangesWithReply", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__KCSharingDaemonConnection_saveLocalChangesWithReply___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveLocalChangesWithReply:", v7);

  os_activity_scope_leave(&state);
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/getGroupByGroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__KCSharingDaemonConnection_getGroupByGroupID_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getGroupByGroupID:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)getGroupsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/getGroupsWithRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__KCSharingDaemonConnection_getGroupsWithRequest_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getGroupsWithRequest:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)createGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/createGroupWithRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_createGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createGroupWithRequest:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)updateGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/updateGroupWithRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_updateGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateGroupWithRequest:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/leaveGroupWithRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__KCSharingDaemonConnection_leaveGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leaveGroupWithRequest:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/deleteGroupWithRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_deleteGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteGroupWithRequest:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/acceptInviteForGroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__KCSharingDaemonConnection_acceptInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "acceptInviteForGroupID:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/declineInviteForGroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__KCSharingDaemonConnection_declineInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "declineInviteForGroupID:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A900000, "ksd/client/checkAvailabilityForHandles", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__KCSharingDaemonConnection_checkAvailabilityForHandles_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "checkAvailabilityForHandles:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)wipe:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v6 = a4;
  v7 = _os_activity_create(&dword_18A900000, "ksd/client/wipe", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__KCSharingDaemonConnection_wipe_reply___block_invoke;
  v11[3] = &unk_1E1FD6038;
  v9 = v6;
  v12 = v9;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wipe:reply:", v4, v9);

  os_activity_scope_leave(&state);
}

- (void)receivedGroupInvitation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  os_activity_scope_state_s v8;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/receivedGroupInvitation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v8.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &v8);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "receivedGroupInvitation:", v4);

  os_activity_scope_leave(&v8);
}

- (void)groupInvitationWasCancelled
{
  NSObject *v3;
  void *v4;
  void *v5;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_18A900000, "ksd/client/groupInvitationWasCancelled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v6.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &v6);
  -[KCSharingDaemonConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupInvitationWasCancelled");

  os_activity_scope_leave(&v6);
}

- (void)resyncWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/resyncWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__KCSharingDaemonConnection_resyncWithCompletion___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resyncWithCompletion:", v7);

  os_activity_scope_leave(&state);
}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/verifyGroupsInSyncWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__KCSharingDaemonConnection_verifyGroupsInSyncWithCompletion___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "verifyGroupsInSyncWithCompletion:", v7);

  os_activity_scope_leave(&state);
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A900000, "ksd/client/performMaintenanceWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__KCSharingDaemonConnection_performMaintenanceWithCompletion___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performMaintenanceWithCompletion:", v7);

  os_activity_scope_leave(&state);
}

- (void)groupsUpdated
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  os_activity_scope_state_s state;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_18A900000, "ksd/client/groupsUpdated", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[KCSharingDaemonConnection connectionListeners](self, "connectionListeners", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "groupsUpdated");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  os_activity_scope_leave(&state);
}

- (void)accountChanged
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  os_activity_scope_state_s state;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_18A900000, "ksd/client/accountChanged", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[KCSharingDaemonConnection connectionListeners](self, "connectionListeners", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "accountChanged");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

  os_activity_scope_leave(&state);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setConnectionListeners:(id)a3
{
  objc_storeStrong((id *)&self->_connectionListeners, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionListeners, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __62__KCSharingDaemonConnection_performMaintenanceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__KCSharingDaemonConnection_verifyGroupsInSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __50__KCSharingDaemonConnection_resyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __65__KCSharingDaemonConnection_fetchCurrentUserIdentifierWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __40__KCSharingDaemonConnection_wipe_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__KCSharingDaemonConnection_checkAvailabilityForHandles_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __64__KCSharingDaemonConnection_declineInviteForGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __63__KCSharingDaemonConnection_acceptInviteForGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __63__KCSharingDaemonConnection_deleteGroupWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__KCSharingDaemonConnection_leaveGroupWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__KCSharingDaemonConnection_updateGroupWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __63__KCSharingDaemonConnection_createGroupWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __61__KCSharingDaemonConnection_getGroupsWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __58__KCSharingDaemonConnection_getGroupByGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __55__KCSharingDaemonConnection_saveLocalChangesWithReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__KCSharingDaemonConnection_fetchRemoteChangesWithReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __60__KCSharingDaemonConnection_setChangeTrackingEnabled_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __48__KCSharingDaemonConnection_provisionWithReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__KCSharingDaemonConnection_removeConnectionListener___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connectionListeners");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionWasInterrupted");

}

void __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionWasInvalidated");

}

+ (id)sharedInvitationNotifier
{
  if (sharedInvitationNotifier_onceToken != -1)
    dispatch_once(&sharedInvitationNotifier_onceToken, &__block_literal_global_121);
  return (id)sharedInvitationNotifier_connection;
}

void __53__KCSharingDaemonConnection_sharedInvitationNotifier__block_invoke()
{
  KCSharingDaemonConnection *v0;
  void *v1;

  v0 = -[KCSharingDaemonConnection initWithType:]([KCSharingDaemonConnection alloc], "initWithType:", 1);
  v1 = (void *)sharedInvitationNotifier_connection;
  sharedInvitationNotifier_connection = (uint64_t)v0;

}

@end
