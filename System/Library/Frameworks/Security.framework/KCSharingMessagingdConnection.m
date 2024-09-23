@implementation KCSharingMessagingdConnection

- (KCSharingMessagingdConnection)init
{
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  KCSharingMessagingdConnection *v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, -1);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = dispatch_queue_create("com.apple.KCSharingMessagingdConnection.xpcConnection", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.keychainsharingmessagingd"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF82260);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  KCSharingSetupMessagingdServerProtocol(v7);
  objc_claimAutoreleasedReturnValue();

  v8 = -[KCSharingMessagingdConnection initWithConnection:interface:queue:](self, "initWithConnection:interface:queue:", v6, v7, v5);
  return v8;
}

- (KCSharingMessagingdConnection)initWithConnection:(id)a3 interface:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  KCSharingMessagingdConnection *v12;
  KCSharingMessagingdConnection *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)KCSharingMessagingdConnection;
  v12 = -[KCSharingMessagingdConnection init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    objc_msgSend(v9, "setRemoteObjectInterface:", v10);
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke;
    v18[3] = &unk_1E1FD8518;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v9, "setInterruptionHandler:", v18);
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke_2;
    v16[3] = &unk_1E1FD8518;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "setInvalidationHandler:", v16);
    objc_msgSend(v9, "_setQueue:", v11);
    objc_msgSend(v9, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)connectionWasInterrupted
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  KCSharingLogObject(CFSTR("KCSharingMessagingdConnection"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[KCSharingMessagingdConnection connection](self, "connection");
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
  KCSharingLogObject(CFSTR("KCSharingMessagingdConnection"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[KCSharingMessagingdConnection connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18A900000, v3, OS_LOG_TYPE_INFO, "connection invalidated %@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)KCSharingMessagingdConnection;
  -[KCSharingMessagingdConnection dealloc](&v3, sel_dealloc);
}

- (void)sendNewInvitesForGroup:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_18A900000, "ksmd/client/sendNewInvitesForGroup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__KCSharingMessagingdConnection_sendNewInvitesForGroup_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendNewInvitesForGroup:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)cancelPendingInvitesForGroup:(id)a3 participantHandles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_18A900000, "ksmd/client/cancelPendingInvitesForGroup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__KCSharingMessagingdConnection_cancelPendingInvitesForGroup_participantHandles_completion___block_invoke;
  v15[3] = &unk_1E1FD6038;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancelPendingInvitesForGroup:participantHandles:completion:", v8, v9, v13);

  os_activity_scope_leave(&state);
}

- (void)didAcceptInviteForGroupID:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_18A900000, "ksmd/client/didAcceptInviteForGroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__KCSharingMessagingdConnection_didAcceptInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didAcceptInviteForGroupID:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)didDeclineInviteForGroupID:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_18A900000, "ksmd/client/didDeclineInviteForGroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__KCSharingMessagingdConnection_didDeclineInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didDeclineInviteForGroupID:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_18A900000, "ksmd/client/fetchReceivedInviteWithGroupID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__KCSharingMessagingdConnection_fetchReceivedInviteWithGroupID_completion___block_invoke;
  v12[3] = &unk_1E1FD6038;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchReceivedInviteWithGroupID:completion:", v6, v10);

  os_activity_scope_leave(&state);
}

- (void)fetchReceivedInvitesWithCompletion:(id)a3
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
  v5 = _os_activity_create(&dword_18A900000, "ksmd/client/fetchReceivedInvitesWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__KCSharingMessagingdConnection_fetchReceivedInvitesWithCompletion___block_invoke;
  v9[3] = &unk_1E1FD6038;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchReceivedInvitesWithCompletion:", v7);

  os_activity_scope_leave(&state);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

uint64_t __68__KCSharingMessagingdConnection_fetchReceivedInvitesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __75__KCSharingMessagingdConnection_fetchReceivedInviteWithGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __71__KCSharingMessagingdConnection_didDeclineInviteForGroupID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__KCSharingMessagingdConnection_didAcceptInviteForGroupID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __92__KCSharingMessagingdConnection_cancelPendingInvitesForGroup_participantHandles_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __67__KCSharingMessagingdConnection_sendNewInvitesForGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionWasInterrupted");

}

void __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionWasInvalidated");

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3290 != -1)
    dispatch_once(&sharedInstance_onceToken_3290, &__block_literal_global_3291);
  return (id)sharedInstance_connection_3292;
}

void __47__KCSharingMessagingdConnection_sharedInstance__block_invoke()
{
  KCSharingMessagingdConnection *v0;
  void *v1;

  v0 = objc_alloc_init(KCSharingMessagingdConnection);
  v1 = (void *)sharedInstance_connection_3292;
  sharedInstance_connection_3292 = (uint64_t)v0;

}

@end
