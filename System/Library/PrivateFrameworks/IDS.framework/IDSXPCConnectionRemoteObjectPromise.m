@implementation IDSXPCConnectionRemoteObjectPromise

- (IDSXPCConnectionRemoteObjectPromise)initWithInterface:(id)a3 queue:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  IDSXPCConnectionRemoteObjectPromise *v10;
  IDSXPCConnectionRemoteObjectPromise *v11;
  objc_super v13;
  uint8_t buf[4];
  IDSXPCConnectionRemoteObjectPromise *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCConnectionRemoteObjectPromise {pointer: %p}", buf, 0xCu);
  }

  dispatch_assert_queue_V2(v8);
  v13.receiver = self;
  v13.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
  v10 = -[IDSXPCConnectionRemoteObjectPromise init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_interface, a3);
    objc_storeStrong((id *)&v11->_queue, a4);
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  id target;
  objc_super v5;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  IDSXPCConnectionRemoteObjectPromise *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    target = self->_target;
    *(_DWORD *)buf = 138543618;
    v7 = target;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCConnectionRemoteObjectPromise {target: %{public}@, pointer: %p}", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
  -[IDSXPCConnectionRemoteObjectPromise dealloc](&v5, sel_dealloc);
}

- (void)fulfillWithRemoteObject:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableArray *pendingInvocations;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[IDSXPCConnectionRemoteObjectPromise queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[IDSXPCConnectionRemoteObjectPromise target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSXPCConnectionRemoteObjectPromise.m"), 59, CFSTR("IDSXPCConnectionRemoteObjectPromise can only be fulfilled once"));

  }
  -[IDSXPCConnectionRemoteObjectPromise setTarget:](self, "setTarget:", v5);
  if (-[NSMutableArray count](self->_pendingInvocations, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_pendingInvocations;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
          -[IDSXPCConnectionRemoteObjectPromise target](self, "target", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invokeWithTarget:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    pendingInvocations = self->_pendingInvocations;
    self->_pendingInvocations = 0;

  }
}

- (void)failWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSMutableArray *pendingInvocations;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_pendingInvocations, "count"))
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_pendingInvocations, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_pendingInvocations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          NSStringFromSelector((SEL)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "selector", (_QWORD)v15));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1907EA274((uint64_t)v5, (uint64_t)v4, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v4;
      _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "Failing xpcRemoteObjectPromise with no pending invocations {error: %{public}@}", buf, 0xCu);
    }
  }

  -[IDSXPCConnectionRemoteObjectPromise queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  pendingInvocations = self->_pendingInvocations;
  self->_pendingInvocations = 0;

}

- (BOOL)respondsToSelector:(SEL)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  -[IDSXPCConnectionRemoteObjectPromise queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IDSXPCConnectionRemoteObjectPromise interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_respondsToRemoteSelector:", a3);

  if (v7 == 2)
    return 0;
  if (v7 != 1)
    return 1;
  v9.receiver = self;
  v9.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
  return -[IDSXPCConnectionRemoteObjectPromise respondsToSelector:](&v9, sel_respondsToSelector_, a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[IDSXPCConnectionRemoteObjectPromise queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IDSXPCConnectionRemoteObjectPromise interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_methodSignatureForRemoteSelector:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)IDSXPCConnectionRemoteObjectPromise;
    -[IDSXPCConnectionRemoteObjectPromise methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)forwardInvocation:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[IDSXPCConnectionRemoteObjectPromise queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[IDSXPCConnectionRemoteObjectPromise _assertVoidReturnValueInInvocation:](self, "_assertVoidReturnValueInInvocation:", v7);
  -[IDSXPCConnectionRemoteObjectPromise target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IDSXPCConnectionRemoteObjectPromise target](self, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invokeWithTarget:", v6);
  }
  else
  {
    objc_msgSend(v7, "retainArguments");
    -[IDSXPCConnectionRemoteObjectPromise pendingInvocations](self, "pendingInvocations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);
  }

}

- (NSMutableArray)pendingInvocations
{
  NSObject *v3;
  NSMutableArray *pendingInvocations;
  NSMutableArray *v5;
  NSMutableArray *v6;

  -[IDSXPCConnectionRemoteObjectPromise queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  pendingInvocations = self->_pendingInvocations;
  if (!pendingInvocations)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = self->_pendingInvocations;
    self->_pendingInvocations = v5;

    pendingInvocations = self->_pendingInvocations;
  }
  return pendingInvocations;
}

- (void)_assertVoidReturnValueInInvocation:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "methodSignature");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (strncmp((const char *)objc_msgSend(v3, "methodReturnType"), "v", objc_msgSend(v3, "methodReturnLength")))
  {
    NSStringFromSelector((SEL)objc_msgSend(v5, "selector"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("XPC methods must have void return values {selector: %@}"), v4);

  }
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void)setPendingInvocations:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInvocations, a3);
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
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
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_pendingInvocations, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
