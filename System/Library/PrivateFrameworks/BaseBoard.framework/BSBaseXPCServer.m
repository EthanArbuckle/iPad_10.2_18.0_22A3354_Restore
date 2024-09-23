@implementation BSBaseXPCServer

void __42__BSBaseXPCServer_registerServerSuspended__block_invoke(uint64_t a1, xpc_object_t object)
{
  id v4;
  Class Class;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *global_queue;
  uint64_t handler;
  uint64_t v11;
  void *v12;
  void *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;

  xpc_retain(object);
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  Class = object_getClass(object);
  if (Class == (Class)MEMORY[0x1E0C81310])
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("BSXPCServerException"), CFSTR("Unexpected error occured on listener connection for service <%@>: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), object);
  }
  else if (Class == (Class)MEMORY[0x1E0C812E0])
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      if (objc_msgSend((id)v6, "queue_shouldAcceptNewConnection:", object)
        && (v7 = objc_msgSend((id)v6, "queue_newClientForConnection:", object)) != 0)
      {
        v8 = (void *)v7;
        objc_msgSend(*(id *)(v6 + 24), "addObject:", v7);
        xpc_connection_set_target_queue((xpc_connection_t)object, *(dispatch_queue_t *)(v6 + 8));
        handler = MEMORY[0x1E0C809B0];
        v11 = 3221225472;
        v12 = __40__BSBaseXPCServer__addClientConnection___block_invoke;
        v13 = &unk_1E1EBE9B0;
        v14 = (xpc_object_t)v6;
        v15 = object;
        v16 = v8;
        xpc_connection_set_event_handler((xpc_connection_t)object, &handler);
        if (*(_BYTE *)(v6 + 32))
          objc_msgSend(v8, "resume");
        objc_msgSend((id)v6, "queue_clientAdded:", v8);

      }
      else
      {
        global_queue = dispatch_get_global_queue(21, 0);
        xpc_connection_set_target_queue((xpc_connection_t)object, global_queue);
        handler = MEMORY[0x1E0C809B0];
        v11 = 3221225472;
        v12 = __40__BSBaseXPCServer__addClientConnection___block_invoke_2;
        v13 = &unk_1E1EBE938;
        v14 = object;
        xpc_connection_set_event_handler((xpc_connection_t)object, &handler);
        xpc_connection_resume((xpc_connection_t)object);
      }
    }
  }

  xpc_release(object);
}

- (BOOL)queue_shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (id)queue_newClientForConnection:(id)a3
{
  return (id)-[objc_class wrapperWithConnection:](-[BSBaseXPCServer queue_classForNewClientConnection:](self, "queue_classForNewClientConnection:"), "wrapperWithConnection:", a3);
}

- (Class)queue_classForNewClientConnection:(id)a3
{
  return (Class)objc_opt_class();
}

void __40__BSBaseXPCServer__addClientConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  Class Class;
  id *v6;
  id v7;
  void *v8;

  v4 = (void *)MEMORY[0x18D769AE0]();
  Class = object_getClass(a2);
  if (Class == (Class)MEMORY[0x1E0C81310])
  {
    v6 = *(id **)(a1 + 32);
    if (v6)
    {
      v7 = (id)objc_msgSend(*(id *)(a1 + 32), "_queue_clientForConnection:", *(_QWORD *)(a1 + 40));
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, "invalidate");
        objc_msgSend(v6[3], "removeObject:", v8);
        objc_msgSend(v6, "queue_clientRemoved:", v8);
      }
    }
  }
  else if (Class == (Class)MEMORY[0x1E0C812F8])
  {
    objc_msgSend(*(id *)(a1 + 32), "queue_handleMessage:client:", a2, *(_QWORD *)(a1 + 48));
  }
  objc_autoreleasePoolPop(v4);
}

- (id)_queue_clientForConnection:(id)a3
{
  NSMutableSet *clients;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  clients = self->_clients;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(clients);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((id)objc_msgSend(v9, "connection") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clients, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BSBaseXPCServer)initWithServiceName:(id)a3
{
  return -[BSBaseXPCServer initWithServiceName:onQueue:](self, "initWithServiceName:onQueue:", a3, 0);
}

- (BSBaseXPCServer)initWithServiceName:(id)a3 onQueue:(id)a4
{
  BSBaseXPCServer *v6;
  BSBaseXPCServer *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BSBaseXPCServer;
  v6 = -[BSBaseXPCServer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_notifyToken = -1;
    v8 = objc_msgSend(a3, "copy");
    v7->_serviceName = (NSString *)v8;
    if (a4)
    {
      v7->_queue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_queue = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.serverTaskQueue"), v8), "UTF8String"), 0, QOS_CLASS_USER_INITIATED, 0);
    }
    v7->_clients = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  }
  return v7;
}

- (void)dealloc
{
  OS_xpc_object *listenerConnection;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  dispatch_release((dispatch_object_t)self->_queue);
  listenerConnection = self->_listenerConnection;
  if (listenerConnection)
    xpc_release(listenerConnection);

  if (notify_is_valid_token(self->_notifyToken))
  {
    notify_cancel(self->_notifyToken);
    self->_notifyToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)BSBaseXPCServer;
  -[BSBaseXPCServer dealloc](&v4, sel_dealloc);
}

- (id)queue
{
  return self->_queue;
}

- (void)run
{
  -[BSBaseXPCServer registerServerSuspended](self, "registerServerSuspended");
  -[BSBaseXPCServer resumeServer](self, "resumeServer");
}

- (void)registerServerSuspended
{
  OS_xpc_object *mach_service;
  OS_xpc_object *listenerConnection;
  _QWORD handler[5];

  if (!self->_listenerConnection)
  {
    if (self->_usesAnonymousConnection)
      mach_service = xpc_connection_create(0, (dispatch_queue_t)self->_queue);
    else
      mach_service = xpc_connection_create_mach_service(-[NSString UTF8String](self->_serviceName, "UTF8String"), (dispatch_queue_t)self->_queue, 1uLL);
    self->_listenerConnection = mach_service;
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_queue);
    listenerConnection = self->_listenerConnection;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __42__BSBaseXPCServer_registerServerSuspended__block_invoke;
    handler[3] = &unk_1E1EBE938;
    handler[4] = self;
    xpc_connection_set_event_handler(listenerConnection, handler);
    if (objc_msgSend((id)objc_opt_class(), "_registersWithNotifyd"))
    {
      if (!notify_is_valid_token(self->_notifyToken))
        notify_register_check((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.serverNotifyToken"), self->_serviceName), "UTF8String"), &self->_notifyToken);
    }
    xpc_connection_resume(self->_listenerConnection);
  }
}

- (void)resumeServer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__BSBaseXPCServer_resumeServer__block_invoke;
  block[3] = &unk_1E1EBE960;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __31__BSBaseXPCServer_resumeServer__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    v2 = result;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(void **)(v1 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "resume");
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 32) = 1;
    result = notify_is_valid_token(*(_DWORD *)(*(_QWORD *)(v2 + 32) + 48));
    if ((_DWORD)result)
    {
      notify_set_state(*(_DWORD *)(*(_QWORD *)(v2 + 32) + 48), 1uLL);
      v8 = *(_QWORD *)(v2 + 32);
      if (v8)
        v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.serverNotifyToken"), *(_QWORD *)(v8 + 40));
      else
        v9 = 0;
      return notify_post((const char *)objc_msgSend(v9, "UTF8String"));
    }
  }
  return result;
}

- (void)_invalidate
{
  OS_xpc_object *listenerConnection;
  _QWORD handler[5];
  _QWORD v5[6];

  listenerConnection = self->_listenerConnection;
  if (listenerConnection)
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = __Block_byref_object_copy__0;
    v5[4] = __Block_byref_object_dispose__0;
    v5[5] = listenerConnection;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __30__BSBaseXPCServer__invalidate__block_invoke;
    handler[3] = &unk_1E1EBE988;
    handler[4] = v5;
    xpc_connection_set_event_handler(listenerConnection, handler);
    xpc_connection_cancel(self->_listenerConnection);
    self->_listenerConnection = 0;
    _Block_object_dispose(v5, 8);
  }
}

void __30__BSBaseXPCServer__invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == MEMORY[0x1E0C81260])
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

+ (BOOL)_registersWithNotifyd
{
  return 1;
}

void __40__BSBaseXPCServer__addClientConnection___block_invoke_2(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

- (void)_sendMessageReply:(id)a3 messagePacker:(id)a4
{
  _xpc_connection_s *remote_connection;

  if (a4)
  {
    if (!a3)
      return;
    goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBaseXPCServer.m"), 251, CFSTR("Must have a message packer"));
  if (a3)
  {
LABEL_3:
    (*((void (**)(id, id))a4 + 2))(a4, a3);
    remote_connection = xpc_dictionary_get_remote_connection(a3);
    xpc_connection_send_message(remote_connection, a3);
  }
}

- (void)_sendReplyForMessage:(id)a3 messagePacker:(id)a4
{
  xpc_object_t reply;
  void *v7;

  reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    v7 = reply;
    -[BSBaseXPCServer _sendMessageReply:messagePacker:](self, "_sendMessageReply:messagePacker:", reply, a4);
    xpc_release(v7);
  }
}

- (id)_getStringFromMessage:(id)a3 key:(char *)a4
{
  id result;

  result = (id)xpc_dictionary_get_string(a3, a4);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", result);
  return result;
}

- (id)_connection
{
  NSObject *queue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__BSBaseXPCServer__connection__block_invoke;
  v5[3] = &unk_1E1EBE9D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__BSBaseXPCServer__connection__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (id)_clients
{
  NSObject *queue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__BSBaseXPCServer__clients__block_invoke;
  v5[3] = &unk_1E1EBE9D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__BSBaseXPCServer__clients__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_copyEndpoint
{
  id result;

  result = self->_listenerConnection;
  if (result)
    return xpc_endpoint_create((xpc_connection_t)result);
  return result;
}

- (BOOL)usesAnonymousConnection
{
  return self->_usesAnonymousConnection;
}

- (void)setUsesAnonymousConnection:(BOOL)a3
{
  self->_usesAnonymousConnection = a3;
}

@end
