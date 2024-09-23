@implementation BSBaseXPCClient

- (BSBaseXPCClient)initWithServiceName:(id)a3 endpoint:(id)a4
{
  BSBaseXPCClient *v6;
  BSBaseXPCClient *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BSBaseXPCClient;
  v6 = -[BSBaseXPCClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_notifyToken = -1;
    v6->_serviceName = (NSString *)objc_msgSend(a3, "copy");
    v7->_queue = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService((const char *)objc_msgSend(a3, "UTF8String"), 0, QOS_CLASS_USER_INITIATED, 0);
    v7->_serverEndpoint = (OS_xpc_object *)a4;
    v7->_clientInvalidated = 0;
  }
  return v7;
}

- (void)queue_invalidateAndFlush:(uint64_t)a1
{
  _xpc_connection_s *v4;
  _QWORD barrier[5];
  _QWORD v6[6];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "signal");
    v4 = *(_xpc_connection_s **)(a1 + 48);
    if (v4)
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3052000000;
      v6[3] = __Block_byref_object_copy__4;
      v6[4] = __Block_byref_object_dispose__4;
      v6[5] = v4;
      *(_QWORD *)(a1 + 48) = 0;
      if (a2)
      {
        barrier[0] = MEMORY[0x1E0C809B0];
        barrier[1] = 3221225472;
        barrier[2] = __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke;
        barrier[3] = &unk_1E1EBF288;
        barrier[4] = v6;
        xpc_connection_send_barrier(v4, barrier);
      }
      else
      {
        xpc_release(v4);
      }
      objc_msgSend((id)a1, "queue_connectionWasDestroyed");
      _Block_object_dispose(v6, 8);
    }
  }
}

void __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2(uint64_t *a1)
{
  uint64_t v2;
  void *v3;

  -[BSBaseXPCClient queue_registerWithServerIfNecessary](a1[4]);
  v2 = a1[6];
  if (*(_QWORD *)(a1[4] + 48))
  {
    v3 = (void *)a1[5];
    if (v2)
      objc_msgSend(v3, "sendToConnection:replyQueue:replyHandler:");
    else
      objc_msgSend(v3, "sendToConnection:");
  }
  else if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(a1[6], 0);
  }
}

- (void)queue_registerWithServerIfNecessary
{
  unsigned int *v2;
  unsigned int v3;
  _xpc_endpoint_s *v4;
  xpc_connection_t mach_service;
  void *v6;
  void *v7;
  uint64_t v8;
  _xpc_connection_s *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD handler[5];
  id v16;
  id location[3];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    BSDispatchQueueAssert(*(void **)(a1 + 8));
    if (!*(_QWORD *)(a1 + 48))
    {
      v2 = (unsigned int *)(a1 + 40);
      while (1)
      {
        v3 = __ldxr(v2);
        if (v3 != 1)
          break;
        if (!__stxr(1u, v2))
          return;
      }
      __clrex();
      *(_BYTE *)(a1 + 56) = 1;
      v4 = *(_xpc_endpoint_s **)(a1 + 24);
      if (v4)
        mach_service = xpc_connection_create_from_endpoint(v4);
      else
        mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(*(id *)(a1 + 32), "UTF8String"), 0, 0);
      *(_QWORD *)(a1 + 48) = mach_service;
      v6 = (void *)objc_msgSend((id)a1, "_connectionInstanceUUID");
      if (v6)
      {
        location[0] = 0;
        location[1] = 0;
        objc_msgSend(v6, "getUUIDBytes:", location);
        xpc_connection_set_oneshot_instance();
      }
      v7 = *(void **)(a1 + 16);
      if (v7)
      {

        *(_QWORD *)(a1 + 16) = 0;
      }
      *(_QWORD *)(a1 + 16) = objc_alloc_init(BSAtomicSignal);
      objc_initWeak(location, (id)a1);
      v8 = *(_QWORD *)(a1 + 16);
      xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 48), *(dispatch_queue_t *)(a1 + 8));
      v9 = *(_xpc_connection_s **)(a1 + 48);
      v10 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke;
      handler[3] = &unk_1E1EBF238;
      handler[4] = v8;
      objc_copyWeak(&v16, location);
      xpc_connection_set_event_handler(v9, handler);
      if (!notify_is_valid_token(*(_DWORD *)(a1 + 44)))
      {
        v11 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.serverNotifyToken"), *(_QWORD *)(a1 + 32)), "UTF8String");
        v12 = *(NSObject **)(a1 + 8);
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke_29;
        v13[3] = &unk_1E1EBF260;
        objc_copyWeak(&v14, location);
        notify_register_dispatch(v11, (int *)(a1 + 44), v12, v13);
        objc_destroyWeak(&v14);
      }
      objc_msgSend((id)a1, "queue_connectionWasCreated");
      -[BSBaseXPCClient queue_resumeConnection](a1);
      objc_destroyWeak(&v16);
      objc_destroyWeak(location);
    }
  }
}

- (void)queue_resumeConnection
{
  _xpc_connection_s *v2;

  if (a1)
  {
    BSDispatchQueueAssert(*(void **)(a1 + 8));
    if (*(_BYTE *)(a1 + 56))
    {
      v2 = *(_xpc_connection_s **)(a1 + 48);
      if (v2)
      {
        xpc_connection_resume(v2);
        *(_BYTE *)(a1 + 56) = 0;
        objc_msgSend((id)a1, "queue_connectionWasResumed");
      }
    }
  }
}

- (id)_connectionInstanceUUID
{
  return 0;
}

- (BSBaseXPCClient)initWithServiceName:(id)a3
{
  return -[BSBaseXPCClient initWithServiceName:endpoint:](self, "initWithServiceName:endpoint:", a3, 0);
}

- (void)_sendMessage:(id)a3
{
  -[BSBaseXPCClient _sendMessage:withReplyHandler:waitForReply:waitDuration:](self, "_sendMessage:withReplyHandler:waitForReply:waitDuration:", a3, 0, 0, 0);
}

id __30__BSBaseXPCClient__connection__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_connection
{
  NSObject *queue;
  id v3;
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__BSBaseXPCClient__connection__block_invoke;
  v5[3] = &unk_1E1EBE9D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_sendMessage:(id)a3 withReplyHandler:(id)a4 waitForReply:(BOOL)a5 waitDuration:(unint64_t)a6
{
  _BOOL4 v10;
  uint64_t v11;
  BSXPCMessage *v12;
  NSObject *queue;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  OS_xpc_object *connection;
  OS_dispatch_queue *v19;
  _QWORD v20[6];
  uint64_t v21;
  _QWORD block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  _QWORD v29[8];
  _QWORD v30[2];
  uint64_t (*v31)(uint64_t, void *, uint64_t);
  void *v32;
  id v33;

  v10 = a6 == -1 && a5;
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v31 = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke;
  v32 = &unk_1E1EBF198;
  v33 = a4;
  v12 = +[BSXPCMessage messageWithPacker:](BSXPCMessage, "messageWithPacker:", a3);
  queue = self->_queue;
  if (a4 && a5)
  {
    BSDispatchQueueAssertNot(queue);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    v28 = 0;
    v14 = self->_queue;
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_23;
    block[3] = &unk_1E1EBF1E8;
    block[4] = self;
    block[5] = &v23;
    dispatch_sync(v14, block);
    if (v24[5])
    {
      if (v10)
      {
        v21 = 0;
        v15 = (void *)MEMORY[0x18D769AE0]();
        v16 = -[BSXPCMessage sendSynchronouslyToConnection:error:](v12, "sendSynchronouslyToConnection:error:", v24[5], &v21);
        v31((uint64_t)v30, (void *)v16, v21);
        objc_autoreleasePoolPop(v15);
      }
      else
      {
        v17 = dispatch_semaphore_create(0);
        connection = self->_connection;
        v19 = self->_queue;
        v20[0] = v11;
        v20[1] = 3221225472;
        v20[2] = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2_24;
        v20[3] = &unk_1E1EBF210;
        v20[4] = v17;
        v20[5] = v30;
        -[BSXPCMessage sendToConnection:replyQueue:replyHandler:](v12, "sendToConnection:replyQueue:replyHandler:", connection, v19, v20);
        dispatch_semaphore_wait(v17, a6);
        dispatch_release(v17);
      }
    }
    else
    {
      (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2;
    v29[3] = &unk_1E1EBF1C0;
    v29[4] = self;
    v29[5] = v12;
    v29[6] = a4;
    v29[7] = v30;
    dispatch_async(queue, v29);
  }
}

void __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == MEMORY[0x1E0C81260])
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _xpc_connection_s *v3;
  _QWORD handler[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_xpc_connection_s **)(*(_QWORD *)(v2 + 8) + 40);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke_2;
  handler[3] = &unk_1E1EBE988;
  handler[4] = v2;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __29__BSBaseXPCClient_invalidate__block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "queue_clientWasInvalidated");
  -[BSBaseXPCClient queue_invalidateAndFlush:](*(_QWORD *)(a1 + 32), 1);
}

- (void)invalidate
{
  int *p_clientInvalidated;
  char v5;
  NSObject *queue;
  _QWORD v7[5];
  char v8;

  p_clientInvalidated = &self->_clientInvalidated;
  while (!__ldxr((unsigned int *)p_clientInvalidated))
  {
    v5 = 1;
    if (!__stxr(1u, (unsigned int *)p_clientInvalidated))
      goto LABEL_6;
  }
  v5 = 0;
  __clrex();
LABEL_6:
  -[BSAtomicSignal signal](self->_invalidationSignal, "signal");
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__BSBaseXPCClient_invalidate__block_invoke;
  v7[3] = &unk_1E1EBF170;
  v8 = v5;
  v7[4] = self;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  NSObject *v3;
  OS_xpc_object *serverEndpoint;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  BSBaseXPCClient *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_connection)
  {
    if (!-[BSAtomicSignal hasBeenSignalled](self->_invalidationSignal, "hasBeenSignalled"))
    {
      v3 = BSLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v7 = "-[BSBaseXPCClient dealloc]";
        v8 = 2114;
        v9 = self;
        _os_log_error_impl(&dword_18A184000, v3, OS_LOG_TYPE_ERROR, "%s API violation: %{public}@ released before calling -invalidate", buf, 0x16u);
      }
    }
  }
  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0;
  -[BSBaseXPCClient queue_invalidateAndFlush:]((uint64_t)self, 1);

  self->_invalidationSignal = 0;
  serverEndpoint = self->_serverEndpoint;
  if (serverEndpoint)
  {
    xpc_release(serverEndpoint);
    self->_serverEndpoint = 0;
  }

  if (notify_is_valid_token(self->_notifyToken))
  {
    notify_cancel(self->_notifyToken);
    self->_notifyToken = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)BSBaseXPCClient;
  -[BSBaseXPCClient dealloc](&v5, sel_dealloc);
}

- (BSBaseXPCClient)init
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBaseXPCClient.m"), 33, CFSTR("not supported"));
  return 0;
}

- (BSBaseXPCClient)initWithEndpoint:(id)a3
{
  return -[BSBaseXPCClient initWithServiceName:endpoint:](self, "initWithServiceName:endpoint:", CFSTR("queue"), a3);
}

- (BOOL)isSuspended
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__BSBaseXPCClient_isSuspended__block_invoke;
  v5[3] = &unk_1E1EBE9D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__BSBaseXPCClient_isSuspended__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    LOBYTE(v1) = *(_BYTE *)(v1 + 56) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (void)reconnectIfNecessary
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BSBaseXPCClient_reconnectIfNecessary__block_invoke;
  block[3] = &unk_1E1EBE960;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__BSBaseXPCClient_reconnectIfNecessary__block_invoke(uint64_t a1)
{
  -[BSBaseXPCClient queue_registerWithServerIfNecessary](*(_QWORD *)(a1 + 32));
}

- (void)suspendConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__BSBaseXPCClient_suspendConnection__block_invoke;
  block[3] = &unk_1E1EBE960;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__BSBaseXPCClient_suspendConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _xpc_connection_s *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    BSDispatchQueueAssert(*(void **)(v1 + 8));
    if (!*(_BYTE *)(v1 + 56))
    {
      v2 = *(_xpc_connection_s **)(v1 + 48);
      if (v2)
      {
        xpc_connection_suspend(v2);
        *(_BYTE *)(v1 + 56) = 1;
        objc_msgSend((id)v1, "queue_connectionWasSuspended");
      }
    }
  }
}

- (void)resumeConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__BSBaseXPCClient_resumeConnection__block_invoke;
  block[3] = &unk_1E1EBE960;
  block[4] = self;
  dispatch_async(queue, block);
}

void __35__BSBaseXPCClient_resumeConnection__block_invoke(uint64_t a1)
{
  -[BSBaseXPCClient queue_resumeConnection](*(_QWORD *)(a1 + 32));
}

- (id)_errorFromMessageIfAny:(id)a3
{
  if (object_getClass(a3) == (Class)MEMORY[0x1E0C81310])
    return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BSErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, *MEMORY[0x1E0CB3388]));
  else
    return 0;
}

- (id)_getStringFromMessage:(id)a3 key:(char *)a4
{
  id result;

  result = (id)xpc_dictionary_get_string(a3, a4);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", result);
  return result;
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
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSBaseXPCClient.m"), 152, CFSTR("Must have a message packer"));
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
    -[BSBaseXPCClient _sendMessageReply:messagePacker:](self, "_sendMessageReply:messagePacker:", reply, a4);
    xpc_release(v7);
  }
}

uint64_t __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 32);
  if (!a2 || a3)
  {
    if (!v3)
      return result;
    v4 = 0;
  }
  else
  {
    if (!v3)
      return result;
    v4 = objc_msgSend(a2, "payload");
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

uint64_t __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_23(uint64_t a1)
{
  -[BSBaseXPCClient queue_registerWithServerIfNecessary](*(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

intptr_t __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2_24(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setEndpoint:(id)a3
{
  OS_xpc_object *serverEndpoint;

  serverEndpoint = self->_serverEndpoint;
  if (serverEndpoint)
    xpc_release(serverEndpoint);
  xpc_retain(a3);
  self->_serverEndpoint = (OS_xpc_object *)a3;
}

void __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  Class Class;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      v6 = (void *)MEMORY[0x18D769AE0]();
      Class = object_getClass(a2);
      if (Class == (Class)MEMORY[0x1E0C81310])
      {
        objc_msgSend(v5, "queue_handleError:", a2);
        if (a2 == (void *)MEMORY[0x1E0C81258])
        {
          objc_msgSend(v5, "queue_connectionWasInterrupted");
          -[BSBaseXPCClient queue_invalidateAndFlush:]((uint64_t)v5, 1);
          -[BSBaseXPCClient queue_registerWithServerIfNecessary](v5);
        }
        else if (a2 == (void *)MEMORY[0x1E0C81260])
        {
          objc_msgSend(v5, "queue_connectionWasInvalidated");
          -[BSBaseXPCClient queue_invalidateAndFlush:]((uint64_t)v5, 0);
        }
        else
        {
          v8 = BSLogCommon();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v9 = 138543362;
            v10 = objc_msgSend(a2, "description");
            _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "Connection closed unexpectedly: %{public}@", (uint8_t *)&v9, 0xCu);
          }
        }
      }
      else if (Class == (Class)MEMORY[0x1E0C812F8])
      {
        objc_msgSend(v5, "queue_handleMessage:", a2);
      }

      objc_autoreleasePoolPop(v6);
    }
  }
}

uint64_t __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke_29(uint64_t a1, int token)
{
  uint64_t result;
  void *v4;
  unsigned int *v5;
  unsigned int v6;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  if (state64)
  {
    result = (uint64_t)objc_loadWeak((id *)(a1 + 32));
    if (result)
    {
      v4 = (void *)result;
      v5 = (unsigned int *)(result + 40);
      while (1)
      {
        v6 = __ldxr(v5);
        if (v6 != 1)
          break;
        if (!__stxr(1u, v5))
          return result;
      }
      __clrex();
      result = objc_msgSend(*(id *)(result + 16), "hasBeenSignalled");
      if ((_DWORD)result)
        return objc_msgSend(v4, "reconnectIfNecessary");
    }
  }
  return result;
}

- (id)queue_connection
{
  return self->_connection;
}

@end
