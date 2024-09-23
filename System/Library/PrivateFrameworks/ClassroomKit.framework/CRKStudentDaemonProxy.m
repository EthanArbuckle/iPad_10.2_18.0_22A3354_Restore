@implementation CRKStudentDaemonProxy

- (CRKStudentDaemonProxy)init
{
  return -[CRKStudentDaemonProxy initWithConnectionBuilder:](self, "initWithConnectionBuilder:", &__block_literal_global_43);
}

uint64_t __29__CRKStudentDaemonProxy_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDD1988], "crk_studentDaemonConnection");
}

- (CRKStudentDaemonProxy)initWithConnectionBuilder:(id)a3
{
  id v4;
  CRKStudentDaemonProxy *v5;
  uint64_t v6;
  CATTaskClient *mTaskClient;
  uint64_t v8;
  CATOperationQueue *mOperationQueue;
  uint64_t v10;
  NSHashTable *mObservers;
  uint64_t v12;
  id connectionBuilder;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRKStudentDaemonProxy;
  v5 = -[CRKStudentDaemonProxy init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    mTaskClient = v5->mTaskClient;
    v5->mTaskClient = (CATTaskClient *)v6;

    -[CATTaskClient setDelegate:](v5->mTaskClient, "setDelegate:", v5);
    v8 = objc_opt_new();
    mOperationQueue = v5->mOperationQueue;
    v5->mOperationQueue = (CATOperationQueue *)v8;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    mObservers = v5->mObservers;
    v5->mObservers = (NSHashTable *)v10;

    v5->_maxConnectionAttempts = 5;
    v12 = MEMORY[0x219A226E8](v4);
    connectionBuilder = v5->_connectionBuilder;
    v5->_connectionBuilder = (id)v12;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[CATTaskClient invalidate](self->mTaskClient, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRKStudentDaemonProxy;
  -[CRKStudentDaemonProxy dealloc](&v3, sel_dealloc);
}

- (void)connect
{
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 60, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[CRKStudentDaemonProxy setUserExpectsReconnect:](self, "setUserExpectsReconnect:", 1);
  if (!self->mConnecting && !-[CRKStudentDaemonProxy isConnected](self, "isConnected"))
  {
    self->mConnecting = 1;
    ++self->mConnectionAttempt;
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_connect, 0);
    -[CRKStudentDaemonProxy connectionBuilder](self, "connectionBuilder");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7B0]), "initWithXPCConnection:", v8);
    -[CATTaskClient connectWithTransport:](self->mTaskClient, "connectWithTransport:", v5);

  }
}

- (void)disconnect
{
  void *v4;
  void *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 77, CFSTR("%@ must be called from the main thread"), v5);

  }
  self->mConnecting = 0;
  -[CRKStudentDaemonProxy setUserExpectsReconnect:](self, "setUserExpectsReconnect:", 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_connect, 0);
  -[CATTaskClient disconnect](self->mTaskClient, "disconnect");
}

- (void)addObserver:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 85, CFSTR("%@ must be called from the main thread"), v6);

  }
  -[NSHashTable addObject:](self->mObservers, "addObject:", v7);

}

- (void)removeObserver:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 90, CFSTR("%@ must be called from the main thread"), v6);

  }
  -[NSHashTable removeObject:](self->mObservers, "removeObject:", v7);

}

- (id)operationForRequest:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 95, CFSTR("%@ must be called from the main thread"), v9);

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  -[CATTaskClient prepareTaskOperationForRequest:](self->mTaskClient, "prepareTaskOperationForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)enqueuedOperationForRequest:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 101, CFSTR("%@ must be called from the main thread"), v9);

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  -[CRKStudentDaemonProxy operationForRequest:](self, "operationForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v6);

  return v6;
}

- (void)enqueueOperation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 111, CFSTR("%@ must be called from the main thread"), v7);

  }
  v5 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKStudentDaemonProxy.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

    v5 = 0;
  }
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v5);

}

- (void)clientDidConnect:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[CRKStudentDaemonProxy setConnected:](self, "setConnected:", 1);
  self->mConnecting = 0;
  self->mConnectionAttempt = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->mObservers, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "daemonProxyDidConnect:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (_CRKLogGeneral_onceToken_10 != -1)
    dispatch_once(&_CRKLogGeneral_onceToken_10, &__block_literal_global_136);
  v7 = (void *)_CRKLogGeneral_logObj_10;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_10, OS_LOG_TYPE_ERROR))
    -[CRKStudentDaemonProxy client:didInterruptWithError:].cold.1(v7, v6);
  objc_msgSend(v5, "disconnect");

}

- (void)clientDidDisconnect:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t mConnectionAttempt;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CRKStudentDaemonProxy setConnected:](self, "setConnected:", 0);
  self->mConnecting = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->mObservers, "allObjects", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "daemonProxyDidDisconnect:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  if (-[CRKStudentDaemonProxy userExpectsReconnect](self, "userExpectsReconnect"))
  {
    mConnectionAttempt = self->mConnectionAttempt;
    if (mConnectionAttempt < -[CRKStudentDaemonProxy maxConnectionAttempts](self, "maxConnectionAttempts"))
      -[CRKStudentDaemonProxy performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_connect, 0, 0.5);
  }
}

- (void)client:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSHashTable allObjects](self->mObservers, "allObjects", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "daemonProxy:didReceiveNotificationWithName:userInfo:", self, v7, v8);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

+ (void)setActiveStudentIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "studentDaemonProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveStudentIdentifier:completion:", v7, v6);

}

+ (void)studentDidAuthenticate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "studentDaemonProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "studentDidAuthenticate:completion:", v7, v6);

}

+ (void)fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "studentDaemonProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchResourceFromURL:completion:", v7, v6);

}

+ (id)studentDaemonProxy
{
  return (id)objc_opt_new();
}

- (int64_t)maxConnectionAttempts
{
  return self->_maxConnectionAttempts;
}

- (void)setMaxConnectionAttempts:(int64_t)a3
{
  self->_maxConnectionAttempts = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)userExpectsReconnect
{
  return self->_userExpectsReconnect;
}

- (void)setUserExpectsReconnect:(BOOL)a3
{
  self->_userExpectsReconnect = a3;
}

- (id)connectionBuilder
{
  return self->_connectionBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionBuilder, 0);
  objc_storeStrong((id *)&self->mObservers, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_storeStrong((id *)&self->mTaskClient, 0);
}

- (void)client:(void *)a1 didInterruptWithError:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);

}

@end
