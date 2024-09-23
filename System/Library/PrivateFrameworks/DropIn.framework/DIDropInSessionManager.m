@implementation DIDropInSessionManager

- (DIDropInSessionManager)initWithConnectionManager:(id)a3
{
  id v4;
  DIDropInSessionManager *v5;
  DIDropInSessionManager *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIDropInSessionManager;
  v5 = -[DIDropInSessionManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_connectionManager, v4);
    objc_msgSend(v4, "dispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSessionStatusDelegate:", v6);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_connectionManager);
    objc_msgSend(WeakRetained, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCheckInObserver:", v6);

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  DILogHandleDIDropInSessionManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = &stru_250B97E20;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", buf, 0x16u);
  }

  -[DIDropInSessionManager connectionManager](self, "connectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__DIDropInSessionManager_setDelegate___block_invoke_2;
  v10[3] = &unk_250B967B0;
  v10[4] = self;
  objc_msgSend(v9, "getCurrentSessionWithCompletionHandler:", v10);

}

void __38__DIDropInSessionManager_setDelegate___block_invoke(uint64_t a1, void *a2)
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
  DILogHandleDIDropInSessionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = &stru_250B97E20;
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Failed to get proxy with Error %@", (uint8_t *)&v4, 0x16u);
  }

}

void __38__DIDropInSessionManager_setDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v6 = v3;
    v4 = objc_msgSend(v3, "state") == 6;
    v3 = v6;
    if (!v4)
    {
      v4 = objc_msgSend(v6, "state") == 7;
      v3 = v6;
      if (!v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "connectionManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setConnectionManager:", v5);

        objc_msgSend(*(id *)(a1 + 32), "setActiveSession:", v6);
        v3 = v6;
      }
    }
  }

}

- (void)setIncomingPendingSession:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  DILogHandleDIDropInSessionManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = &stru_250B97E20;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_23A742000, v6, OS_LOG_TYPE_DEFAULT, "%@Setting incoming pending session to %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_incomingPendingSession, a3);
  -[DIDropInSessionManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[DIDropInSessionManager connectionManager](self, "connectionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__DIDropInSessionManager_setIncomingPendingSession___block_invoke;
    v12[3] = &unk_250B96438;
    v12[4] = self;
    v13 = v5;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v11, v12);

  }
}

void __52__DIDropInSessionManager_setIncomingPendingSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manager:didReceiveIncomingPendingSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)setActiveSession:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  DIDropInSession *incomingPendingSession;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  DILogHandleDIDropInSessionManager();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = &stru_250B97E20;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_23A742000, v6, OS_LOG_TYPE_DEFAULT, "%@Setting active session to %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_activeSession, a3);
  -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v5);

  if (v8)
  {
    DILogHandleDIDropInSessionManager();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = &stru_250B97E20;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_23A742000, v9, OS_LOG_TYPE_DEFAULT, "%@Session was equal to incoming pending session and now making active %@", buf, 0x16u);
    }

    incomingPendingSession = self->_incomingPendingSession;
    self->_incomingPendingSession = 0;

  }
  -[DIDropInSessionManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[DIDropInSessionManager connectionManager](self, "connectionManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __43__DIDropInSessionManager_setActiveSession___block_invoke;
    v16[3] = &unk_250B96438;
    v16[4] = self;
    v17 = v5;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v15, v16);

  }
}

void __43__DIDropInSessionManager_setActiveSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manager:didUpdateActiveSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didAddSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDIDropInSessionManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = &stru_250B97E20;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Add Session %@", (uint8_t *)&v11, 0x16u);
  }

  -[DIDropInSessionManager connectionManager](self, "connectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConnectionManager:", v6);

  -[DIDropInSessionManager activeSession](self, "activeSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_6:
    -[DIDropInSessionManager setActiveSession:](self, "setActiveSession:", v4);
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "state") == 4)
    goto LABEL_6;
  -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if (v9)
  {
    -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIDropInSessionManager setIncomingPendingSession:](self, "setIncomingPendingSession:", v10);

  }
  else
  {
    -[DIDropInSessionManager setIncomingPendingSession:](self, "setIncomingPendingSession:", v4);
  }
LABEL_7:

}

- (void)didRemoveSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  DIDropInSession *activeSession;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  DIDropInSession *incomingPendingSession;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  DIDropInSessionManager *v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDIDropInSessionManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = &stru_250B97E20;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Remove Session %@", buf, 0x16u);
  }

  -[DIDropInSessionManager activeSession](self, "activeSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    DILogHandleDIDropInSessionManager();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[DIDropInSessionManager activeSession](self, "activeSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = &stru_250B97E20;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_23A742000, v8, OS_LOG_TYPE_DEFAULT, "%@Wiping Active Session %@", buf, 0x16u);

    }
    activeSession = self->_activeSession;
    self->_activeSession = 0;

    -[DIDropInSessionManager delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[DIDropInSessionManager connectionManager](self, "connectionManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "manager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "clientQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __43__DIDropInSessionManager_didRemoveSession___block_invoke;
      v24 = &unk_250B96438;
      v25 = self;
      v26 = v4;
      +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v15, &v21);

    }
  }
  -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession", v21, v22, v23, v24, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", v4);

  if (v17)
  {
    DILogHandleDIDropInSessionManager();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = &stru_250B97E20;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_23A742000, v18, OS_LOG_TYPE_DEFAULT, "%@Wiping incoming pending session %@", buf, 0x16u);

    }
    incomingPendingSession = self->_incomingPendingSession;
    self->_incomingPendingSession = 0;

  }
}

void __43__DIDropInSessionManager_didRemoveSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "manager:didUpdateActiveSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdateSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDIDropInSessionManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412546;
    v22 = &stru_250B97E20;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Did Update Session %@", (uint8_t *)&v21, 0x16u);
  }

  -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    DILogHandleDIDropInSessionManager();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = &stru_250B97E20;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_23A742000, v8, OS_LOG_TYPE_DEFAULT, "%@Updating Incoming Pending Session %@", (uint8_t *)&v21, 0x16u);

    }
    -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithSession:", v4);

    if (objc_msgSend(v4, "state") == 4)
    {
      DILogHandleDIDropInSessionManager();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = &stru_250B97E20;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_23A742000, v11, OS_LOG_TYPE_DEFAULT, "%@Making Incoming Pending Session Active %@", (uint8_t *)&v21, 0x16u);

      }
      -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DIDropInSessionManager setActiveSession:](self, "setActiveSession:", v13);

    }
  }
  else
  {
    -[DIDropInSessionManager activeSession](self, "activeSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v4);

    if (v15)
    {
      DILogHandleDIDropInSessionManager();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[DIDropInSessionManager activeSession](self, "activeSession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412546;
        v22 = &stru_250B97E20;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_23A742000, v16, OS_LOG_TYPE_DEFAULT, "%@Updating Active Session %@", (uint8_t *)&v21, 0x16u);

      }
      -[DIDropInSessionManager activeSession](self, "activeSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateWithSession:", v4);

      if (objc_msgSend(v4, "state") == 6)
      {
        DILogHandleDIDropInSessionManager();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          -[DIDropInSessionManager activeSession](self, "activeSession");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412546;
          v22 = &stru_250B97E20;
          v23 = 2112;
          v24 = v20;
          _os_log_impl(&dword_23A742000, v19, OS_LOG_TYPE_DEFAULT, "%@Removing Active Session %@", (uint8_t *)&v21, 0x16u);

        }
        -[DIDropInSessionManager didRemoveSession:](self, "didRemoveSession:", v4);
      }
    }
  }

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  DILogHandleDIDropInSessionManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v19 = 138412802;
    v20 = &stru_250B97E20;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_23A742000, v8, OS_LOG_TYPE_ERROR, "%@Did Fail with Error %@, %@", (uint8_t *)&v19, 0x20u);
  }

  -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v6);

  if (v10)
  {
    DILogHandleDIDropInSessionManager();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = &stru_250B97E20;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_23A742000, v11, OS_LOG_TYPE_ERROR, "%@Incoming Pending Session Failed %@", (uint8_t *)&v19, 0x16u);

    }
    -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "failWithError:", v7);

  }
  -[DIDropInSessionManager activeSession](self, "activeSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v6);

  if (v15)
  {
    DILogHandleDIDropInSessionManager();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[DIDropInSessionManager activeSession](self, "activeSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = &stru_250B97E20;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_23A742000, v16, OS_LOG_TYPE_ERROR, "%@Active Session Failed %@", (uint8_t *)&v19, 0x16u);

    }
    -[DIDropInSessionManager activeSession](self, "activeSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "failWithError:", v7);

  }
}

- (void)session:(id)a3 didUpdateUplinkMuteStatus:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  DILogHandleDIDropInSessionManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412802;
    v15 = &stru_250B97E20;
    v16 = 1024;
    v17 = v4;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_23A742000, v7, OS_LOG_TYPE_DEFAULT, "%@Did Update Uplink Muted to %d for Session %@", (uint8_t *)&v14, 0x1Cu);
  }

  -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if (v9)
  {
    -[DIDropInSessionManager incomingPendingSession](self, "incomingPendingSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = v10;
    objc_msgSend(v10, "updateUplinkMuteStatus:", v4);

    goto LABEL_8;
  }
  -[DIDropInSessionManager activeSession](self, "activeSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v6);

  if (v12)
  {
    -[DIDropInSessionManager activeSession](self, "activeSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:

}

- (void)xpcManagerDidPerformDaemonCheckIn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[DIDropInSessionManager connectionManager](self, "connectionManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__DIDropInSessionManager_xpcManagerDidPerformDaemonCheckIn___block_invoke_10;
  v8[3] = &unk_250B967B0;
  v8[4] = self;
  objc_msgSend(v7, "getCurrentSessionWithCompletionHandler:", v8);

}

void __60__DIDropInSessionManager_xpcManagerDidPerformDaemonCheckIn___block_invoke(uint64_t a1, void *a2)
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
  DILogHandleDIDropInSessionManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = &stru_250B97E20;
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_ERROR, "%@Failed to get proxy with Error %@", (uint8_t *)&v4, 0x16u);
  }

}

uint64_t __60__DIDropInSessionManager_xpcManagerDidPerformDaemonCheckIn___block_invoke_10(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "didUpdateSession:", a2);
  return result;
}

- (DIDropInSessionManagerDelegate)delegate
{
  return (DIDropInSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (DIDropInSession)incomingPendingSession
{
  return self->_incomingPendingSession;
}

- (DIDropInSession)activeSession
{
  return self->_activeSession;
}

- (DIXPCConnectionManager)connectionManager
{
  return (DIXPCConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_incomingPendingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
