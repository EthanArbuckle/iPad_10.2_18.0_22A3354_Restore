@implementation IDSXPCConnection

+ (id)errorForMissingEntitlement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing entitlement \"%@\"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2938];
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("IDSXPCConnectionErrorDomain"), -2000, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IDSXPCConnection)initWithQueue:(id)a3 remoteObject:(id)a4
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  IDSXPCConnection *v10;
  IDSXPCConnection *v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  IDSXPCConnection *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!*(_WORD *)&self->_syncOntoMain)
    dispatch_assert_queue_V2(v7);
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCConnection {remoteObject: %{public}@, pointer: %p}", buf, 0x16u);
  }

  v13.receiver = self;
  v13.super_class = (Class)IDSXPCConnection;
  v10 = -[IDSXPCConnection init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    objc_storeStrong((id *)&v11->_remoteObject, a4);
  }

  return v11;
}

- (id)initForSyncMessagingWithQueue:(id)a3 takingOverAndResumingConnection:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel__initWithQueue_syncOntoMain_takingOverAndResumingConnection_forSyncMessaging_);
}

- (IDSXPCConnection)initWithQueue:(id)a3 takingOverAndResumingConnection:(id)a4
{
  return (IDSXPCConnection *)MEMORY[0x1E0DE7D20](self, sel__initWithQueue_syncOntoMain_takingOverAndResumingConnection_forSyncMessaging_);
}

- (IDSXPCConnection)initWithQueue:(id)a3 syncOntoMain:(BOOL)a4 takingOverAndResumingConnection:(id)a5
{
  return (IDSXPCConnection *)MEMORY[0x1E0DE7D20](self, sel__initWithQueue_syncOntoMain_takingOverAndResumingConnection_forSyncMessaging_);
}

- (id)_initWithQueue:(id)a3 syncOntoMain:(BOOL)a4 takingOverAndResumingConnection:(id)a5 forSyncMessaging:(BOOL)a6
{
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  IDSXPCConnection *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v11 = a3;
  v12 = a5;
  if (!a6)
    dispatch_assert_queue_V2(v11);
  self->_forSyncMessaging = a6;
  objc_storeStrong((id *)&self->_queue, a3);
  self->_syncOntoMain = a4;
  objc_storeStrong((id *)&self->_connection, a5);
  -[NSXPCConnection setDelegate:](self->_connection, "setDelegate:", self);
  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", v11);
  objc_msgSend(v12, "interruptionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_1907A8868;
  v23[3] = &unk_1E2C64668;
  objc_copyWeak(&v25, &location);
  v15 = v13;
  v24 = v15;
  objc_msgSend(v12, "setInterruptionHandler:", v23);
  objc_msgSend(v12, "invalidationHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = sub_1907A8904;
  v20[3] = &unk_1E2C64668;
  objc_copyWeak(&v22, &location);
  v17 = v16;
  v21 = v17;
  objc_msgSend(v12, "setInvalidationHandler:", v20);
  -[NSXPCConnection resume](self->_connection, "resume");
  v18 = -[IDSXPCConnection initWithQueue:remoteObject:](self, "initWithQueue:remoteObject:", self->_queue, self->_connection);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v18;
}

- (IDSXPCConnection)initWithRemoteObject:(id)a3 rootConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  IDSXPCConnection *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[IDSXPCConnection initWithQueue:remoteObject:](self, "initWithQueue:remoteObject:", v8, v7);

  -[IDSXPCConnection setRootConnection:](v9, "setRootConnection:", v6);
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  NSXPCProxyCreating *remoteObject;
  objc_super v5;
  uint8_t buf[4];
  NSXPCProxyCreating *v7;
  __int16 v8;
  IDSXPCConnection *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    remoteObject = self->_remoteObject;
    *(_DWORD *)buf = 138543618;
    v7 = remoteObject;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCConnection {remoteObject: %{public}@, pointer: %p}", buf, 0x16u);
  }

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)IDSXPCConnection;
  -[IDSXPCConnection dealloc](&v5, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    -[IDSXPCConnection queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  -[IDSXPCConnection remoteObject](self, "remoteObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1907A8BC0;
  v10[3] = &unk_1E2C60E28;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    -[IDSXPCConnection queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  -[IDSXPCConnection remoteObject](self, "remoteObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1907A8CC8;
  v10[3] = &unk_1E2C60E28;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)remoteObjectProxyWithTimeoutInSeconds:(double)a3 errorHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  IDSXPCConnectionTimeoutProxy *v10;
  void *v11;
  id v12;
  IDSXPCConnectionTimeoutProxy *v13;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    -[IDSXPCConnection queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

  }
  -[IDSXPCConnection remoteObject](self, "remoteObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [IDSXPCConnectionTimeoutProxy alloc];
  -[IDSXPCConnection rootConnection](self, "rootConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1907A8E24;
  v15[3] = &unk_1E2C60E28;
  v15[4] = self;
  v16 = v6;
  v12 = v6;
  v13 = -[IDSXPCConnectionTimeoutProxy initWithTarget:connection:timeoutInSeconds:errorHandler:](v10, "initWithTarget:connection:timeoutInSeconds:errorHandler:", v9, v11, v15, a3);

  return v13;
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    -[IDSXPCConnection queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  -[IDSXPCConnection rootConnection](self, "rootConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForEntitlement:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    -[IDSXPCConnection queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

  }
  -[IDSXPCConnection valueForEntitlement:](self, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = v6 != 0;

  return v7;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  id v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  _QWORD block[4];
  void (**v25)(_QWORD);
  uint8_t *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[24];
  uint64_t v30;

  v5 = a5;
  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v5 || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    v20 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1907A92A0;
    v27[3] = &unk_1E2C60550;
    v21 = v9;
    v28 = v21;
    v22 = (void (**)(_QWORD))MEMORY[0x19400FE1C](v27);
    if (-[IDSXPCConnection syncOntoMain](self, "syncOntoMain"))
    {
      objc_msgSend(v21, "retainArguments");
      memset(buf, 170, 16);
      pthread_main_thread_np();
      pthread_dependency_init_np();
      im_primary_queue();
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = sub_1907A92A8;
      block[3] = &unk_1E2C62510;
      v25 = v22;
      v26 = buf;
      dispatch_async(v23, block);

      pthread_dependency_wait_np();
    }
    else
    {
      v22[2](v22);
    }

    goto LABEL_17;
  }
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3C78]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IDSXPCConnectionTransactionUUID"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_13;
  }
  v13 = (void *)v12;
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3C70]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSXPCConnection pendingTransactions](self, "pendingTransactions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v13);
  v16 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "transaction finished -- calling invoke {selector: %{public}@, uuid: %{public}@}", buf, 0x16u);
    }

    -[IDSXPCConnection pendingTransactions](self, "pendingTransactions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v13);

    v16[2](v16);
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "TransactionUUID missing from pendingTransactions --  Skipping invoke {selector: %{public}@, uuid: %{public}@}", buf, 0x16u);
    }

  }
  if (v16)
    goto LABEL_13;
LABEL_17:

}

- (IDSXPCConnection)rootConnection
{
  if (self->_rootConnection)
    self = self->_rootConnection;
  return self;
}

- (NSMutableDictionary)pendingTransactions
{
  NSMutableDictionary *pendingTransactions;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  pendingTransactions = self->_pendingTransactions;
  if (!pendingTransactions)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_pendingTransactions;
    self->_pendingTransactions = v4;

    pendingTransactions = self->_pendingTransactions;
  }
  return pendingTransactions;
}

- (void)_cleanupAllPendingTransactions
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  IDSXPCConnection *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSXPCConnection pendingTransactions](self, "pendingTransactions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSXPCConnection remoteObject](self, "remoteObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Dropping all pending transactions {pendingTransaction: %{public}@, remoteObject: %{public}@, pointer: %p}", (uint8_t *)&v8, 0x20u);

  }
  -[IDSXPCConnection pendingTransactions](self, "pendingTransactions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &unk_1E2C5FCF0);

  -[IDSXPCConnection pendingTransactions](self, "pendingTransactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)syncOntoMain
{
  return self->_syncOntoMain;
}

- (void)setSyncOntoMain:(BOOL)a3
{
  self->_syncOntoMain = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setPendingTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTransactions, a3);
}

- (void)setRootConnection:(id)a3
{
  objc_storeStrong((id *)&self->_rootConnection, a3);
}

- (NSXPCProxyCreating)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)forSyncMessaging
{
  return self->_forSyncMessaging;
}

- (void)setForSyncMessaging:(BOOL)a3
{
  self->_forSyncMessaging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_rootConnection, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
