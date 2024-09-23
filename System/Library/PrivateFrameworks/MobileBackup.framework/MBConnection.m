@implementation MBConnection

- (MBConnection)initWithXPCConnection:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  _xpc_connection_s *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  MBConnection *v13;
  MBConnection *v14;
  void *v15;
  uint64_t v16;
  NSString *personaIdentifier;
  objc_super v19;

  v9 = (_xpc_connection_s *)a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
    -[MBConnection initWithXPCConnection:delegate:delegateQueue:].cold.1();
  v12 = v11;
  if (!v11)
    -[MBConnection initWithXPCConnection:delegate:delegateQueue:].cold.2();
  v19.receiver = self;
  v19.super_class = (Class)MBConnection;
  v13 = -[MBConnection init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v14->_queue, a5);
    xpc_connection_set_target_queue(v9, v12);
    -[MBConnection _setEventHandlerForXPCConnection:](v14, "_setEventHandlerForXPCConnection:", v9);
    -[MBConnection _refreshProcessInfoWithXPCConnection:](v14, "_refreshProcessInfoWithXPCConnection:", v9);
    objc_storeStrong((id *)&v14->_xpcConnection, a3);
    objc_msgSend(MEMORY[0x1E0DC5EF0], "currentPersona");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userPersonaUniqueString");
    v16 = objc_claimAutoreleasedReturnValue();
    personaIdentifier = v14->_personaIdentifier;
    v14->_personaIdentifier = (NSString *)v16;

  }
  return v14;
}

- (MBConnection)initWithServiceName:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8;
  id v9;
  dispatch_queue_t v10;
  MBConnection *v11;
  MBConnection *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  objc_class *v19;
  const char *Name;
  NSObject *v21;
  NSObject *v22;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcConnection;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = (dispatch_queue_t)a5;
  v26.receiver = self;
  v26.super_class = (Class)MBConnection;
  v11 = -[MBConnection init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v9);
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (objc_class *)objc_opt_class();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%s.%p"), class_getName(v14), v12);
    v16 = v15;
    if (!v10)
    {
      v17 = (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create(v17, v18);

    }
    objc_storeStrong((id *)&v12->_queue, v10);
    v19 = (objc_class *)objc_opt_class();
    Name = class_getName(v19);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(Name, v21);

    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), v22, 0);
    -[MBConnection _setEventHandlerForXPCConnection:](v12, "_setEventHandlerForXPCConnection:", mach_service);
    atomic_store(0, (unsigned int *)&v12->_pid);
    xpcConnection = v12->_xpcConnection;
    v12->_xpcConnection = mach_service;

  }
  return v12;
}

- (MBConnection)initWithServiceName:(id)a3
{
  return -[MBConnection initWithServiceName:delegate:delegateQueue:](self, "initWithServiceName:delegate:delegateQueue:", a3, 0, 0);
}

- (void)_refreshProcessInfoWithXPCConnection:(id)a3
{
  unsigned int *v3;
  xpc_connection_t v4;
  pid_t pid;
  int v6;
  int v7;
  void *v8;
  void *v9;
  _BYTE buffer[4096];
  uint64_t v11;

  v3 = (unsigned int *)MEMORY[0x1E0C80A78](self, a2, a3);
  v11 = *MEMORY[0x1E0C80C00];
  pid = xpc_connection_get_pid(v4);
  if (pid)
  {
    v6 = pid;
    atomic_store(pid, v3 + 2);
    if (MBIsRunningInDaemon())
    {
      v7 = proc_pidpath(v6, buffer, 0x1000u);
      if (v7 < 1)
      {
        v9 = 0;
      }
      else
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v7, 4);
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v3, "setProcessName:", v9);

    }
  }
}

- (void)_setEventHandlerForXPCConnection:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MBConnection__setEventHandlerForXPCConnection___block_invoke;
  v6[3] = &unk_1E995D848;
  v6[4] = self;
  v7 = v4;
  v5 = (_xpc_connection_s *)v4;
  xpc_connection_set_event_handler(v5, v6);

}

void __49__MBConnection__setEventHandlerForXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MBConnection__setEventHandlerForXPCConnection___block_invoke_2;
  block[3] = &unk_1E995CEC0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

void __49__MBConnection__setEventHandlerForXPCConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 8)))
    objc_msgSend(*(id *)(a1 + 32), "_refreshProcessInfoWithXPCConnection:", *(_QWORD *)(a1 + 40));
  v3 = MEMORY[0x1D8271224](*(_QWORD *)(a1 + 48));
  if (v3 == MEMORY[0x1E0C812F8])
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleXPCEvent:", *(_QWORD *)(a1 + 48));
  }
  else if (v3 == MEMORY[0x1E0C81310])
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleXPCError:", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 48) == MEMORY[0x1E0C81258])
    {
      v14 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(0, v14));
      if (v15)
        objc_msgSend(*(id *)(a1 + 32), "setProcessName:", 0);
    }
  }
  else
  {
    MBGetDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      MBStringWithXPCObject();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1D5213000, v4, OS_LOG_TYPE_ERROR, "%@ Received unexpected XPC message: %@", buf, 0x16u);

      v7 = *(_QWORD *)(a1 + 32);
      MBStringWithXPCObject();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _MBLog(CFSTR("ERROR"), (uint64_t)"%@ Received unexpected XPC message: %@", v8, v9, v10, v11, v12, v13, v7);

    }
  }
}

- (void)_handleXPCEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  MBConnection *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MBConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[MBMessage _initWithXPCObject:]([MBMessage alloc], "_initWithXPCObject:", v4);
  if ((MBIsRunningInDaemon() & 1) == 0)
  {
    MBGetDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_INFO, "%{public}@ received %{public}@", buf, 0x16u);
      _MBLog(CFSTR("INFO"), (uint64_t)"%{public}@ received %{public}@", v8, v9, v10, v11, v12, v13, (uint64_t)self);
    }

  }
  -[MBConnection delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connection:didReceiveMessage:", self, v6);

}

- (void)_handleXPCError:(id)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  MBConnection *v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[MBConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MBConnection delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == (id)MEMORY[0x1E0C81260])
  {
    MBGetDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 1024;
      v24 = v6 != 0;
      _os_log_impl(&dword_1D5213000, v14, OS_LOG_TYPE_INFO, "%{public}@ was invalidated (%d)", buf, 0x12u);
      _MBLog(CFSTR("INFO"), (uint64_t)"%{public}@ was invalidated (%d)", v15, v16, v17, v18, v19, v20, (uint64_t)self);
    }

    objc_msgSend(v6, "connectionWasInvalidated:", self);
  }
  else if (a3 == (id)MEMORY[0x1E0C81258])
  {
    MBGetDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 1024;
      v24 = v6 != 0;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_INFO, "%{public}@ was interrupted (%d)", buf, 0x12u);
      _MBLog(CFSTR("INFO"), (uint64_t)"%{public}@ was interrupted (%d)", v8, v9, v10, v11, v12, v13, (uint64_t)self);
    }

    objc_msgSend(v6, "connectionWasInterrupted:", self);
  }

}

- (void)sendMessage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  MBConnection *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MBGetDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ sending %@", buf, 0x16u);
    _MBLog(CFSTR("DEBUG"), (uint64_t)"%{public}@ sending %@", v6, v7, v8, v9, v10, v11, (uint64_t)self);
  }

  objc_msgSend(v4, "_xpcObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(self->_xpcConnection, v12);

}

- (void)sendMessage:(id)a3 barrierBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  MBConnection *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MBGetDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sending (barrier) %@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%{public}@ sending (barrier) %@", v9, v10, v11, v12, v13, v14, (uint64_t)self);
  }

  objc_msgSend(v6, "_xpcObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(self->_xpcConnection, v15);
  xpc_connection_send_barrier(self->_xpcConnection, v7);

}

- (id)sendMessageWithReplyAndSync:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  OS_xpc_object *v17;
  xpc_object_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v26;
  id v27;
  uint8_t buf[4];
  MBConnection *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBConnection.m"), 189, CFSTR("message must have a name"));

  }
  MBGetDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ sending %@", buf, 0x16u);
    v27 = v7;
    _MBLog(CFSTR("DEBUG"), (uint64_t)"%{public}@ sending %@", v10, v11, v12, v13, v14, v15, (uint64_t)self);
  }

  objc_msgSend(v7, "_xpcObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_xpcConnection;
  v18 = xpc_connection_send_message_with_reply_sync(v17, v16);
  if (MEMORY[0x1D8271224]() == MEMORY[0x1E0C812F8])
  {
    v22 = -[MBMessage _initWithXPCObject:]([MBMessage alloc], "_initWithXPCObject:", v18);
    v23 = 0;
  }
  else
  {
    v19 = v18;
    v20 = v19;
    if (v19 == (id)MEMORY[0x1E0C81260])
    {
      MBStringWithXPCObject();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 20, CFSTR("%@"), v21, v27);
    }
    else if (v19 == (id)MEMORY[0x1E0C81258])
    {
      MBStringWithXPCObject();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 19, CFSTR("%@"), v21, v27);
    }
    else
    {
      MBStringWithXPCObject();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 18, CFSTR("%@"), v21, v27);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
  }
  if (!atomic_load((unsigned int *)&self->_pid))
    -[MBConnection _refreshProcessInfoWithXPCConnection:](self, "_refreshProcessInfoWithXPCConnection:", v17);
  if (a4 && v23)
    *a4 = objc_retainAutorelease(v23);

  return v22;
}

- (void)cancel
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  OS_xpc_object *xpcConnection;
  uint8_t buf[4];
  MBConnection *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MBGetDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_INFO, "Canceling %{public}@", buf, 0xCu);
    _MBLog(CFSTR("INFO"), (uint64_t)"Canceling %{public}@", v4, v5, v6, v7, v8, v9, (uint64_t)self);
  }

  -[MBConnection setDelegate:](self, "setDelegate:", 0);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
    xpc_connection_cancel(xpcConnection);
}

- (void)suspend
{
  xpc_connection_suspend(self->_xpcConnection);
}

- (void)resume
{
  xpc_connection_resume(self->_xpcConnection);
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v3 = atomic_load((unsigned int *)&self->_pid);
  if ((_DWORD)v3)
  {
    -[MBConnection processName](self, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_opt_class();
    if (v4)
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; %@(%d)>"), v6, self, v4, v3);
    else
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; %d>"), v6, self, v3, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)personaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersonaIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (MBConnectionDelegate)delegate
{
  return (MBConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithXPCConnection:delegate:delegateQueue:.cold.1()
{
  __assert_rtn("-[MBConnection initWithXPCConnection:delegate:delegateQueue:]", "MBConnection.m", 94, "xpcConnection");
}

- (void)initWithXPCConnection:delegate:delegateQueue:.cold.2()
{
  __assert_rtn("-[MBConnection initWithXPCConnection:delegate:delegateQueue:]", "MBConnection.m", 95, "queue");
}

@end
