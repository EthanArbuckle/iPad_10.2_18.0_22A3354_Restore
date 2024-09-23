@implementation IDSXPCConnectionTimeoutProxy

- (IDSXPCConnectionTimeoutProxy)initWithTarget:(id)a3 connection:(id)a4 timeoutInSeconds:(double)a5 errorHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  IDSXPCConnectionTimeoutProxy *v16;
  IDSXPCConnectionTimeoutProxy *v17;
  uint64_t v18;
  id errorHandler;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  IDSXPCConnectionTimeoutProxy *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(v12, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2048;
    v27 = self;
    _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCConnectionTimeoutProxy {target: %{public}@, connection: %{public}@, pointer: %p}", buf, 0x20u);
  }

  v21.receiver = self;
  v21.super_class = (Class)IDSXPCConnectionTimeoutProxy;
  v16 = -[IDSXPCConnectionTimeoutProxy init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_target, a3);
    objc_storeStrong((id *)&v17->_connection, a4);
    v17->_timeout = a5;
    v18 = MEMORY[0x19400FE1C](v13);
    errorHandler = v17->_errorHandler;
    v17->_errorHandler = (id)v18;

  }
  return v17;
}

- (void)dealloc
{
  NSObject *v3;
  id target;
  IDSXPCConnection *connection;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  IDSXPCConnection *v10;
  __int16 v11;
  IDSXPCConnectionTimeoutProxy *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    target = self->_target;
    connection = self->_connection;
    *(_DWORD *)buf = 138543874;
    v8 = target;
    v9 = 2114;
    v10 = connection;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCConnectionTimeoutProxy {target: %{public}@, connection: %{public}@, pointer: %p}", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)IDSXPCConnectionTimeoutProxy;
  -[IDSXPCConnectionTimeoutProxy dealloc](&v6, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  dispatch_time_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  NSObject *v38;
  _QWORD handler[4];
  id v40;
  id v41;
  id v42;
  IDSXPCConnectionTimeoutProxy *v43;
  const __CFString *v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IDSXPCConnectionTimeoutProxy connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[IDSXPCConnectionTimeoutProxy _invocationHasBlock:](self, "_invocationHasBlock:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[IDSXPCConnectionTimeoutProxy timeout](self, "timeout");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSXPCConnectionTimeoutProxy connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);

    -[IDSXPCConnectionTimeoutProxy timeout](self, "timeout");
    v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
    v16 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1907A9BA4;
    handler[3] = &unk_1E2C60C50;
    v17 = v8;
    v40 = v17;
    v18 = v7;
    v41 = v18;
    v19 = v10;
    v42 = v19;
    v43 = self;
    dispatch_source_set_event_handler(v13, handler);
    v35[0] = v16;
    v35[1] = 3221225472;
    v35[2] = sub_1907A9D94;
    v35[3] = &unk_1E2C602B8;
    v20 = v17;
    v36 = v20;
    v21 = v18;
    v37 = v21;
    v22 = v13;
    v38 = v22;
    v23 = (void *)MEMORY[0x19400FE1C](v35);
    -[IDSXPCConnectionTimeoutProxy connection](self, "connection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pendingTransactions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, v21);

    dispatch_resume(v22);
    objc_msgSend(MEMORY[0x1E0D34D40], "xpc");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v47 = v20;
      v48 = 2114;
      v49 = v21;
      v50 = 2114;
      v51 = v19;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "Starting timeout for xpc message {selector: %{public}@, uuid: %{public}@, timeout: %{public}@}", buf, 0x20u);
    }

    -[IDSXPCConnectionTimeoutProxy target](self, "target");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = CFSTR("IDSXPCConnectionTransactionUUID");
    v45 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v33[1] = 3221225472;
    v33[2] = sub_1907A9E54;
    v33[3] = &unk_1E2C64168;
    v33[4] = self;
    v34 = v21;
    v29 = v21;
    objc_msgSend(v27, "remoteObjectProxyWithUserInfo:errorHandler:", v28, v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[IDSXPCConnectionTimeoutProxy target](self, "target");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = sub_1907A9EFC;
    v32[3] = &unk_1E2C64380;
    v32[4] = self;
    objc_msgSend(v31, "remoteObjectProxyWithErrorHandler:", v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "invokeWithTarget:", v30);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  char v7;

  -[IDSXPCConnectionTimeoutProxy connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IDSXPCConnectionTimeoutProxy target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  return v7 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  -[IDSXPCConnectionTimeoutProxy connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[IDSXPCConnectionTimeoutProxy target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "methodSignatureForSelector:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_invocationHasBlock:(id)a3
{
  void *v3;
  unint64_t v4;
  id v5;
  int v6;
  BOOL v7;

  objc_msgSend(a3, "methodSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfArguments"))
  {
    v4 = 0;
    do
    {
      v5 = objc_retainAutorelease(v3);
      v6 = strcmp((const char *)objc_msgSend(v5, "getArgumentTypeAtIndex:", v4), "@?");
      v7 = v6 == 0;
      if (!v6)
        break;
      ++v4;
    }
    while (v4 < objc_msgSend(v5, "numberOfArguments"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
