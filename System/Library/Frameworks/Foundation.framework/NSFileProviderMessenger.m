@implementation NSFileProviderMessenger

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderMessenger;
  -[NSFileProviderMessenger dealloc](&v3, sel_dealloc);
}

- (NSFileProviderMessenger)initWithInterface:(id)a3 protocol:(id)a4
{
  NSFileProviderMessenger *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSFileProviderMessenger;
  v6 = -[NSFileProviderMessenger init](&v8, sel_init);
  if (v6)
  {
    v6->_interface = (NSFileProviderMessageInterface *)a3;
    v6->_protocol = (Protocol *)a4;
    v6->_lock = (NSLock *)objc_opt_new();
  }
  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  NSObject *v5;
  NSFileProviderMessageInterface *interface;
  dispatch_time_t v7;
  NSXPCConnection *v8;
  NSXPCInterface *v9;
  NSObject *v10;
  uint64_t v11;
  NSXPCConnection *conn;
  id v13;
  NSString *v14;
  id v15;
  NSXPCListener *v16;
  NSXPCConnection *v17;
  _QWORD v19[6];
  _QWORD v20[5];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09820 != -1)
    dispatch_once(&qword_1ECD09820, &__block_literal_global_545);
  if (off_1ECD09818)
  {
    -[NSLock lock](self->_lock, "lock");
    if (!self->_triedConnection)
    {
      self->_triedConnection = 1;
      v22 = 0;
      v23 = &v22;
      v24 = 0x3052000000;
      v25 = __Block_byref_object_copy__3;
      v26 = __Block_byref_object_dispose__3;
      v27 = 0;
      v5 = dispatch_semaphore_create(0);
      interface = self->_interface;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke;
      v21[3] = &unk_1E0F4E150;
      v21[4] = v5;
      v21[5] = &v22;
      off_1ECD09818(interface, v21);
      v7 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v5, v7);
      dispatch_release(v5);
      if (v23[5])
      {
        v8 = [NSXPCConnection alloc];
        self->_conn = -[NSXPCConnection initWithListenerEndpoint:](v8, "initWithListenerEndpoint:", v23[5]);
        v9 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCFFA90);
        -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v9, "setInterface:forSelector:argumentIndex:ofReply:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", self->_protocol), sel_fetchProxyForItemIdentifier_completionHandler_, 0, 1);
        -[NSXPCConnection setRemoteObjectInterface:](self->_conn, "setRemoteObjectInterface:", v9);
        -[NSXPCConnection resume](self->_conn, "resume");

      }
      _Block_object_dispose(&v22, 8);
    }
    -[NSLock unlock](self->_lock, "unlock");
  }
  if (!self->_conn)
    goto LABEL_11;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v10 = dispatch_semaphore_create(0);
  v11 = MEMORY[0x1E0C809B0];
  conn = self->_conn;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_522;
  v20[3] = &unk_1E0F4E178;
  v20[4] = v10;
  v13 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v20);
  v14 = -[NSFileProviderMessageInterface itemIdentifier](self->_interface, "itemIdentifier");
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_523;
  v19[3] = &unk_1E0F4E1A0;
  v19[4] = v10;
  v19[5] = &v22;
  objc_msgSend(v13, "fetchProxyForItemIdentifier:completionHandler:", v14, v19);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  v15 = (id)objc_msgSend((id)v23[5], "remoteObjectProxyWithErrorHandler:", a3);
  _Block_object_dispose(&v22, 8);
  if (!v15)
  {
LABEL_11:
    v16 = +[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener");
    -[NSXPCListener resume](v16, "resume");
    v17 = -[NSXPCConnection initWithListenerEndpoint:]([NSXPCConnection alloc], "initWithListenerEndpoint:", -[NSXPCListener endpoint](v16, "endpoint"));
    -[NSXPCConnection setRemoteObjectInterface:](v17, "setRemoteObjectInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", self->_protocol));
    -[NSXPCConnection resume](v17, "resume");
    v15 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v17, "remoteObjectProxyWithErrorHandler:", a3);
    -[NSXPCListener invalidate](v16, "invalidate");

  }
  return v15;
}

intptr_t __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = 138543362;
    v9 = a4;
    _os_log_error_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "NSFileProviderMessenger failed to get proxy factory: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_522(uint64_t a1, uint64_t a2)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = a2;
    _os_log_error_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "NSFileProviderMessenger's proxy factory encountered a connection failure: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __61__NSFileProviderMessenger_remoteObjectProxyWithErrorHandler___block_invoke_523(uint64_t a1, void *a2, uint64_t a3)
{
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_error_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "NSFileProviderMessenger's proxy factory returned an error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_conn, "invalidate");
}

@end
