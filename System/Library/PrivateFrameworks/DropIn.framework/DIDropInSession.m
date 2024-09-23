@implementation DIDropInSession

- (DIDropInSession)init
{
  return -[DIDropInSession initWithNullableRequest:](self, "initWithNullableRequest:", 0);
}

- (DIDropInSession)initWithNullableRequest:(id)a3
{
  id v5;
  DIDropInSession *v6;
  uint64_t v7;
  NSRecursiveLock *lock;
  uint64_t v9;
  NSUUID *identifier;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DIDropInSession;
  v6 = -[DIDropInSession init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    lock = v6->_lock;
    v6->_lock = (NSRecursiveLock *)v7;

    v6->_needsInitialUplinkMuteStatus = 1;
    v6->_state = 2;
    v6->_stateReason = 0;
    v9 = objc_opt_new();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v9;

    objc_storeStrong((id *)&v6->_request, a3);
    objc_msgSend(v5, "connectionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_connectionManager, v11);

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  DILogHandleDropInSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = &stru_250B97E20;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", (uint8_t *)&v6, 0x16u);
  }

}

- (BOOL)isEqual:(id)a3
{
  DIDropInSession *v4;
  DIDropInSession *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (DIDropInSession *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DIDropInSession identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DIDropInSession identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[DIDropInSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DIDropInSession stringForDropInSessionState:](DIDropInSession, "stringForDropInSessionState:", -[DIDropInSession state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DIDropInSession stringForDropInSessionStateReason:](DIDropInSession, "stringForDropInSessionStateReason:", -[DIDropInSession stateReason](self, "stateReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDropInSession request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDropInSession connectionManager](self, "connectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDropInSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Identifier = %@, State = %@, State Reason = %@, Request = %@, Connection Manager = %p, Delegate = %@"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[6];
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  DIDropInSession *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    +[DIDropInSession stringForDropInSessionState:](DIDropInSession, "stringForDropInSessionState:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v23 = &stru_250B97E20;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Updating state to %@ for session %@", buf, 0x20u);

  }
  -[DIDropInSession lock](self, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __28__DIDropInSession_setState___block_invoke;
  v21[3] = &unk_250B962C0;
  v21[4] = self;
  v21[5] = a3;
  objc_msgSend(v7, "di_synchronize:", v21);

  -[DIDropInSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[DIDropInSession connectionManager](self, "connectionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __28__DIDropInSession_setState___block_invoke_2;
    v20[3] = &unk_250B962C0;
    v20[4] = self;
    v20[5] = a3;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v13, v20);

  }
  -[DIDropInSession delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[DIDropInSession connectionManager](self, "connectionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "manager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clientQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __28__DIDropInSession_setState___block_invoke_18;
    v19[3] = &unk_250B962C0;
    v19[4] = self;
    v19[5] = a3;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v18, v19);

  }
}

uint64_t __28__DIDropInSession_setState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = *(_QWORD *)(result + 40);
  return result;
}

void __28__DIDropInSession_setState___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    +[DIDropInSession stringForDropInSessionState:](DIDropInSession, "stringForDropInSessionState:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = &stru_250B97E20;
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_23A742000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Updating state to %@ for session %@", (uint8_t *)&v6, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session:didUpdateState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __28__DIDropInSession_setState___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    +[DIDropInSession stringForDropInSessionState:](DIDropInSession, "stringForDropInSessionState:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v6 = 138413058;
    v7 = &stru_250B97E20;
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    v12 = 2048;
    v13 = objc_msgSend(v4, "stateReason");
    _os_log_impl(&dword_23A742000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Updating state to %@ for session %@ with reason %lu", (uint8_t *)&v6, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session:didUpdateState:reason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "stateReason"));

}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  -[DIDropInSession connectionManager](self, "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DIDropInSession connectionManager](self, "connectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke;
  v18[3] = &unk_250B96310;
  v18[4] = self;
  v12 = v4;
  v19 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDropInSession request](self, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke_2;
  v16[3] = &unk_250B96338;
  v16[4] = self;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v13, "startSessionWithContext:request:completionHandler:", v7, v14, v16);

}

void __46__DIDropInSession_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DILogHandleDropInSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v15 = &stru_250B97E20;
    v16 = 2112;
    v17 = v3;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to start Session Error = %@, Session = %@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke_19;
  v11[3] = &unk_250B962E8;
  v9 = *(id *)(a1 + 40);
  v12 = v3;
  v13 = v9;
  v10 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v8, v11);

}

uint64_t __46__DIDropInSession_startWithCompletionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __46__DIDropInSession_startWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setStateReason:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 6);
    DILogHandleDropInSession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v21 = &stru_250B97E20;
      v22 = 2112;
      v23 = v4;
      v24 = 2112;
      v25 = v6;
      v7 = "%@Failed to start Error = %@, Session = %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 32;
LABEL_6:
      _os_log_impl(&dword_23A742000, v8, v9, v7, buf, v10);
    }
  }
  else
  {
    DILogHandleDropInSession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v21 = &stru_250B97E20;
      v22 = 2112;
      v23 = v11;
      v7 = "%@Started Session %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 22;
      goto LABEL_6;
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__DIDropInSession_startWithCompletionHandler___block_invoke_21;
  v17[3] = &unk_250B962E8;
  v15 = *(id *)(a1 + 40);
  v18 = v4;
  v19 = v15;
  v16 = v4;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v14, v17);

}

uint64_t __46__DIDropInSession_startWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)endWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  -[DIDropInSession connectionManager](self, "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DIDropInSession connectionManager](self, "connectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke;
  v17[3] = &unk_250B96310;
  v17[4] = self;
  v12 = v4;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke_2;
  v15[3] = &unk_250B96310;
  v15[4] = self;
  v16 = v12;
  v14 = v12;
  objc_msgSend(v13, "endSessionWithContext:session:completionHandler:", v7, self, v15);

}

void __44__DIDropInSession_endWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DILogHandleDropInSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = &stru_250B97E20;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to End Session %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke_23;
  v10[3] = &unk_250B962E8;
  v8 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v7, v10);

}

uint64_t __44__DIDropInSession_endWithCompletionHandler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __44__DIDropInSession_endWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__DIDropInSession_endWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_250B962E8;
  v7 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v6, v9);

}

uint64_t __44__DIDropInSession_endWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)cancelWithCompletionHandler:(id)a3
{
  -[DIDropInSession cancelWithError:completionHandler:](self, "cancelWithError:completionHandler:", 0, a3);
}

- (void)cancelWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v6 = a4;
  v7 = a3;
  -[DIDropInSession connectionManager](self, "connectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DIDropInSession connectionManager](self, "connectionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "manager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke;
  v20[3] = &unk_250B96310;
  v20[4] = self;
  v15 = v6;
  v21 = v15;
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_2;
  v18[3] = &unk_250B96310;
  v18[4] = self;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "cancelSessionWithContext:session:error:completionHandler:", v10, self, v7, v18);

}

void __53__DIDropInSession_cancelWithError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DILogHandleDropInSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = &stru_250B97E20;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to cancel session %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_24;
  v10[3] = &unk_250B962E8;
  v8 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v7, v10);

}

uint64_t __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_3;
  v9[3] = &unk_250B962E8;
  v7 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v6, v9);

}

uint64_t __53__DIDropInSession_cancelWithError_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)isUplinkMuted
{
  NSObject *v3;
  void *v4;
  char v5;
  _QWORD v7[6];
  __int128 buf;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = &stru_250B97E20;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_DEFAULT, "%@Getting uplink muted", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v9 = 0x2020000000;
  v10 = 0;
  -[DIDropInSession lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__DIDropInSession_isUplinkMuted__block_invoke;
  v7[3] = &unk_250B963B0;
  v7[4] = self;
  v7[5] = &buf;
  objc_msgSend(v4, "di_synchronize:", v7);

  v5 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v5;
}

void __32__DIDropInSession_isUplinkMuted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, char, void *);
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id location;

  if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialUplinkMuteStatus") & 1) != 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "connectionManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __32__DIDropInSession_isUplinkMuted__block_invoke_2;
    v13[3] = &unk_250B96360;
    v13[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = 3221225472;
    v9 = __32__DIDropInSession_isUplinkMuted__block_invoke_25;
    v10 = &unk_250B96388;
    objc_copyWeak(&v12, &location);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "getUplinkMutedForCurrentSessionWithCompletionHandler:", &v7);

    if ((objc_msgSend(*(id *)(a1 + 32), "needsInitialUplinkMuteStatus", v7, v8, v9, v10) & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  }
}

void __32__DIDropInSession_isUplinkMuted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  DILogHandleDropInSession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to get uplink muted for current session %@", (uint8_t *)&v5, 0x16u);
  }

}

void __32__DIDropInSession_isUplinkMuted__block_invoke_25(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5)
  {
    DILogHandleDropInSession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412546;
      v10 = &stru_250B97E20;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_23A742000, v8, OS_LOG_TYPE_ERROR, "%@Failed to get uplink muted for current session %@", (uint8_t *)&v9, 0x16u);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    objc_msgSend(WeakRetained, "setNeedsInitialUplinkMuteStatus:", 0);
  }

}

- (void)setUplinkMuted:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  BOOL v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v13 = &stru_250B97E20;
    v14 = 1024;
    v15 = v3;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Setting uplink muted to %d", buf, 0x12u);
  }

  -[DIDropInSession connectionManager](self, "connectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__DIDropInSession_setUplinkMuted___block_invoke_27;
  v10[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v11 = v3;
  objc_msgSend(v9, "setUplinkMutedForCurrentSession:completionHandler:", v3, v10);

}

void __34__DIDropInSession_setUplinkMuted___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  DILogHandleDropInSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = &stru_250B97E20;
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Failed to set uplink muted %@", (uint8_t *)&v4, 0x16u);
  }

}

void __34__DIDropInSession_setUplinkMuted___block_invoke_27(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(unsigned __int8 *)(a1 + 32);
      v11 = 138412546;
      v12 = &stru_250B97E20;
      v13 = 1024;
      v14 = v6;
      v7 = "%@Failed to set uplink muted to %d";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23A742000, v8, v9, v7, (uint8_t *)&v11, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(unsigned __int8 *)(a1 + 32);
    v11 = 138412546;
    v12 = &stru_250B97E20;
    v13 = 1024;
    v14 = v10;
    v7 = "%@Uplink muted set to %d";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

}

+ (id)stringForDropInSessionState:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 - 1 > 6)
    v3 = CFSTR("Unknown");
  else
    v3 = off_250B964C0[a3 - 1];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%lu) %@"), a3, v3);
}

+ (id)stringForDropInSessionStateReason:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 > 6)
    v3 = CFSTR("Unknown");
  else
    v3 = off_250B964F8[a3];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%lu) %@"), a3, v3);
}

- (void)updateWithSession:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[DIDropInSession setStateReason:](self, "setStateReason:", objc_msgSend(v4, "stateReason"));
  v5 = objc_msgSend(v4, "state");

  -[DIDropInSession setState:](self, "setState:", v5);
}

- (void)failWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  DIDropInSession *v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  DIDropInSession *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDropInSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v15 = &stru_250B97E20;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_ERROR, "%@Session failed with error %@. Session = %@", buf, 0x20u);
  }

  -[DIDropInSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[DIDropInSession connectionManager](self, "connectionManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __33__DIDropInSession_failWithError___block_invoke;
    v11[3] = &unk_250B96438;
    v12 = v4;
    v13 = self;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v10, v11);

  }
}

void __33__DIDropInSession_failWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412802;
    v7 = &stru_250B97E20;
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_23A742000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Session failed with error %@. Session = %@", (uint8_t *)&v6, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)updateUplinkMuteStatus:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  DIDropInSession *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = &stru_250B97E20;
    v19 = 1024;
    v20 = v3;
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Update uplink mute status %d. Session = %@", buf, 0x1Cu);
  }

  -[DIDropInSession lock](self, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__DIDropInSession_updateUplinkMuteStatus___block_invoke;
  v15[3] = &unk_250B96460;
  v15[4] = self;
  v16 = v3;
  objc_msgSend(v6, "di_synchronize:", v15);

  -[DIDropInSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[DIDropInSession connectionManager](self, "connectionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __42__DIDropInSession_updateUplinkMuteStatus___block_invoke_2;
    v13[3] = &unk_250B96460;
    v14 = v3;
    v13[4] = self;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v12, v13);

  }
}

uint64_t __42__DIDropInSession_updateUplinkMuteStatus___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsInitialUplinkMuteStatus:", 0);
}

void __42__DIDropInSession_updateUplinkMuteStatus___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412802;
    v7 = &stru_250B97E20;
    v8 = 1024;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_23A742000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Update uplink mute status %d. Session = %@", (uint8_t *)&v6, 0x1Cu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session:didUpdateUplinkMuteStatus:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DIDropInSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("Identifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[DIDropInSession state](self, "state"), CFSTR("State"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[DIDropInSession stateReason](self, "stateReason"), CFSTR("StateReason"));

}

- (DIDropInSession)initWithCoder:(id)a3
{
  id v4;
  DIDropInSession *v5;
  void *v6;
  DIDropInSession *v7;

  v4 = a3;
  v5 = -[DIDropInSession init](self, "init");
  if (!v5)
    goto LABEL_4;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("Identifier"));
  v7 = (DIDropInSession *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DIDropInSession setIdentifier:](v5, "setIdentifier:", v7);
    -[DIDropInSession setState:](v5, "setState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State")));
    -[DIDropInSession setStateReason:](v5, "setStateReason:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("StateReason")));

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (DIDropInSessionDelegate)delegate
{
  return (DIDropInSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (DIDropInRequest)request
{
  return self->_request;
}

- (DIXPCConnectionManager)connectionManager
{
  return (DIXPCConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (void)setConnectionManager:(id)a3
{
  objc_storeWeak((id *)&self->_connectionManager, a3);
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_stateReason = a3;
}

- (BOOL)needsInitialUplinkMuteStatus
{
  return self->_needsInitialUplinkMuteStatus;
}

- (void)setNeedsInitialUplinkMuteStatus:(BOOL)a3
{
  self->_needsInitialUplinkMuteStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
