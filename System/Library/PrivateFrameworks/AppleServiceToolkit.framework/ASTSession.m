@implementation ASTSession

+ (id)sessionWithSerialNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSerialNumber:", v4);

  return v5;
}

+ (id)sessionWithIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentity:", v4);

  return v5;
}

+ (id)sessionWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v4);

  return v5;
}

- (ASTSession)initWithSerialNumber:(id)a3
{
  id v4;
  ASTSession *v5;
  ASTRemoteServerSession *v6;
  ASTRemoteServerSession *serverSession;
  ASTRepairSession *v8;
  ASTRepairSession *repairSession;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASTSession;
  v5 = -[ASTSession init](&v11, sel_init);
  if (v5)
  {
    v6 = -[ASTRemoteServerSession initWithSerialNumber:]([ASTRemoteServerSession alloc], "initWithSerialNumber:", v4);
    serverSession = v5->_serverSession;
    v5->_serverSession = v6;

    v8 = objc_alloc_init(ASTRepairSession);
    repairSession = v5->_repairSession;
    v5->_repairSession = v8;

  }
  return v5;
}

- (ASTSession)initWithIdentity:(id)a3
{
  id v4;
  ASTSession *v5;
  ASTRemoteServerSession *v6;
  ASTRemoteServerSession *serverSession;
  ASTRepairSession *v8;
  ASTRepairSession *repairSession;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASTSession;
  v5 = -[ASTSession init](&v11, sel_init);
  if (v5)
  {
    v6 = -[ASTRemoteServerSession initWithIdentity:]([ASTRemoteServerSession alloc], "initWithIdentity:", v4);
    serverSession = v5->_serverSession;
    v5->_serverSession = v6;

    v8 = objc_alloc_init(ASTRepairSession);
    repairSession = v5->_repairSession;
    v5->_repairSession = v8;

  }
  return v5;
}

- (ASTSession)initWithContext:(id)a3
{
  id v4;
  ASTSession *v5;
  ASTRemoteServerSession *v6;
  ASTRemoteServerSession *serverSession;
  ASTRepairSession *v8;
  ASTRepairSession *repairSession;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASTSession;
  v5 = -[ASTSession init](&v11, sel_init);
  if (v5)
  {
    v6 = -[ASTRemoteServerSession initWithContext:]([ASTRemoteServerSession alloc], "initWithContext:", v4);
    serverSession = v5->_serverSession;
    v5->_serverSession = v6;

    v8 = objc_alloc_init(ASTRepairSession);
    repairSession = v5->_repairSession;
    v5->_repairSession = v8;

  }
  return v5;
}

- (void)setActiveSession:(id)a3
{
  ASTSession *v4;
  ASTSession *activeSession;
  ASTSession *v6;
  id v7;

  v4 = (ASTSession *)a3;
  -[ASTSession setDelegate:](self->_activeSession, "setDelegate:", 0);
  activeSession = self->_activeSession;
  self->_activeSession = v4;
  v6 = v4;

  -[ASTSession delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ASTSession setDelegate:](self->_activeSession, "setDelegate:", v7);

}

- (BOOL)shouldShowResults
{
  void *v2;
  char v3;

  -[ASTSession activeSession](self, "activeSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowResults");

  return v3;
}

+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "sessionExistsForSerialNumbers:ticketNumber:timeout:completionHandler:", a3, a4, a5, 15.0);
}

+ (void)sessionExistsForSerialNumbers:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        +[ASTIdentity identityWithSerialNumber:](ASTIdentity, "identityWithSerialNumber:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17), (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  objc_msgSend((id)objc_opt_class(), "sessionExistsForIdentities:ticketNumber:timeout:completionHandler:", v12, v10, v11, a5);
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__ASTSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke;
  v10[3] = &unk_24F969B98;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "sessionStatusForIdentities:ticketNumber:timeout:completionHandler:", a3, a4, v10, 15.0);

}

uint64_t __72__ASTSession_sessionExistsForIdentities_ticketNumber_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completionHandler___block_invoke;
  v12[3] = &unk_24F969B98;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "sessionStatusForIdentities:ticketNumber:timeout:completionHandler:", a3, a4, v12, a5);

}

uint64_t __80__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "sessionExistsForIdentities:ticketNumber:timeout:completion:", a3, a4, a5, 15.0);
}

+ (void)sessionExistsForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completion___block_invoke;
  v12[3] = &unk_24F969B98;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "sessionStatusForIdentities:ticketNumber:timeout:requestQueuedSuiteInfo:completionHandler:", a3, a4, 0, v12, a5);

}

void __73__ASTSession_sessionExistsForIdentities_ticketNumber_timeout_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a4;
  v7 = a3;
  isASTGuidedSession = objc_msgSend(v7, "isGuided");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v7, "isGuided");

  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9, v10);
}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "sessionStatusForIdentities:ticketNumber:timeout:completionHandler:", a3, a4, a5, 15.0);
}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  objc_msgSend(a1, "sessionStatusForIdentities:ticketNumber:timeout:requestQueuedSuiteInfo:completionHandler:", a3, a4, 0, a6, a5);
}

+ (void)sessionStatusForIdentities:(id)a3 ticketNumber:(id)a4 timeout:(double)a5 requestQueuedSuiteInfo:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = a6;
  v11 = a7;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__ASTSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke;
  v13[3] = &unk_24F969B98;
  v14 = v11;
  v12 = v11;
  +[ASTRemoteServerSession sessionStatusForIdentities:ticketNumber:timeout:requestQueuedSuiteInfo:completionHandler:](ASTRemoteServerSession, "sessionStatusForIdentities:ticketNumber:timeout:requestQueuedSuiteInfo:completionHandler:", a3, a4, v7, v13, a5);

}

void __103__ASTSession_sessionStatusForIdentities_ticketNumber_timeout_requestQueuedSuiteInfo_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  isASTGuidedSession = objc_msgSend(v7, "isGuided");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)start
{
  -[ASTSession startWithMode:](self, "startWithMode:", 0);
}

- (void)startWithMode:(int)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_group_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  NSObject *v33;
  uint8_t *v34;
  _QWORD v35[4];
  NSObject *v36;
  uint8_t *v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[5];
  _QWORD block[5];

  if (a3 == 2 || !isASTGuidedSession)
  {
    if (a3 == 2)
    {
      ASTLogHandleForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "Running ASTSession in repair session only mode..", buf, 2u);
      }

      -[ASTSession setServerSession:](self, "setServerSession:", 0);
    }
    else if (a3 == 1)
    {
      ASTLogHandleForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "Running ASTSession in server session only mode..", buf, 2u);
      }

      -[ASTSession setRepairSession:](self, "setRepairSession:", 0);
    }
    v9 = dispatch_group_create();
    -[ASTSession setSessionStartDispatchGroup:](self, "setSessionStartDispatchGroup:", v9);

    -[ASTSession serverSession](self, "serverSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x24BDAC760];
    if (v10)
    {
      -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v12);

      dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __28__ASTSession_startWithMode___block_invoke;
      block[3] = &unk_24F969AE0;
      block[4] = self;
      dispatch_async(v13, block);

    }
    -[ASTSession repairSession](self, "repairSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v15);

      dispatch_get_global_queue(0, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v44[0] = v11;
      v44[1] = 3221225472;
      v44[2] = __28__ASTSession_startWithMode___block_invoke_2;
      v44[3] = &unk_24F969AE0;
      v44[4] = self;
      dispatch_async(v16, v44);

    }
    -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_time(0, 30000000000);
    dispatch_group_wait(v17, v18);

    -[ASTSession setSessionStartDispatchGroup:](self, "setSessionStartDispatchGroup:", 0);
    v19 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    v39 = buf;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    v42 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    -[ASTSession repairSession](self, "repairSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      dispatch_group_enter(v19);
      -[ASTSession repairSession](self, "repairSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v11;
      v35[1] = 3221225472;
      v35[2] = __28__ASTSession_startWithMode___block_invoke_14;
      v35[3] = &unk_24F969BC0;
      v37 = buf;
      v36 = v19;
      objc_msgSend(v21, "requestSuitesAvailableWithCompletionHandler:", v35);

    }
    -[ASTSession serverSession](self, "serverSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      dispatch_group_enter(v19);
      -[ASTSession serverSession](self, "serverSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v11;
      v32[1] = 3221225472;
      v32[2] = __28__ASTSession_startWithMode___block_invoke_17;
      v32[3] = &unk_24F969BC0;
      v34 = buf;
      v33 = v19;
      objc_msgSend(v23, "requestSuitesAvailableWithCompletionHandler:", v32);

    }
    v24 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v19, v24);

    -[ASTSession delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[ASTSession delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *((_QWORD *)v39 + 5);
      v31[0] = v11;
      v31[1] = 3221225472;
      v31[2] = __28__ASTSession_startWithMode___block_invoke_20;
      v31[3] = &unk_24F969BE8;
      v31[4] = self;
      objc_msgSend(v27, "session:didRequestSuiteRunWithDestinations:confirmation:", self, v28, v31);

    }
    else
    {
      -[ASTSession serverSession](self, "serverSession");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTSession setActiveSession:](self, "setActiveSession:", v29);

      -[ASTSession repairSession](self, "repairSession");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "end");

      -[ASTSession setRepairSession:](self, "setRepairSession:", 0);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    ASTLogHandleForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D91B000, v4, OS_LOG_TYPE_DEFAULT, "Guided session was detected.", buf, 2u);
    }

    -[ASTSession serverSession](self, "serverSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");

    -[ASTSession serverSession](self, "serverSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTSession setActiveSession:](self, "setActiveSession:", v6);

    -[ASTSession setRepairSession:](self, "setRepairSession:", 0);
  }
}

void __28__ASTSession_startWithMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "serverSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "serverSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

}

void __28__ASTSession_startWithMode___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "repairSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "repairSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");

}

void __28__ASTSession_startWithMode___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  ASTSelfServiceDestination *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "Repaird returned suites to run: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = -[ASTSelfServiceDestination initWithEndpoint:suites:]([ASTSelfServiceDestination alloc], "initWithEndpoint:suites:", 2, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
  }
  else
  {
    ASTLogHandleForCategory(0);
    v8 = (ASTSelfServiceDestination *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9)
        __28__ASTSession_startWithMode___block_invoke_14_cold_2();
    }
    else if (v9)
    {
      __28__ASTSession_startWithMode___block_invoke_14_cold_1();
    }
  }

  v10 = *(NSObject **)(a1 + 32);
  if (v10)
    dispatch_group_leave(v10);

}

void __28__ASTSession_startWithMode___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  ASTSelfServiceDestination *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "AST returned suites to run: %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = -[ASTSelfServiceDestination initWithEndpoint:suites:]([ASTSelfServiceDestination alloc], "initWithEndpoint:suites:", 1, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
  }
  else
  {
    ASTLogHandleForCategory(0);
    v8 = (ASTSelfServiceDestination *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9)
        __28__ASTSession_startWithMode___block_invoke_17_cold_2();
    }
    else if (v9)
    {
      __28__ASTSession_startWithMode___block_invoke_17_cold_1();
    }
  }

  v10 = *(NSObject **)(a1 + 32);
  if (v10)
    dispatch_group_leave(v10);

}

void __28__ASTSession_startWithMode___block_invoke_20(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  if (a2 == 1)
  {
    ASTLogHandleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "Switching to the server session", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "serverSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setActiveSession:", v6);

  }
  else if (a2 == 2)
  {
    ASTLogHandleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "Switching to the repair session", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "repairSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setActiveSession:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setServerSession:", 0);
  }
  else
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating the active session", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setActiveSession:", 0);
  }
}

- (void)idle
{
  id v2;

  -[ASTSession activeSession](self, "activeSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "idle");

}

- (void)end
{
  id v2;

  -[ASTSession activeSession](self, "activeSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "end");

}

- (void)invalidate
{
  id v2;

  -[ASTSession activeSession](self, "activeSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)archive
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[ASTSession serverSession](self, "serverSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    ASTLogHandleForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22D91B000, v4, OS_LOG_TYPE_DEFAULT, "Archiving AST2 session", v6, 2u);
    }

    -[ASTSession serverSession](self, "serverSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archive");

  }
}

- (BOOL)sendAuthInfoResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[ASTSession activeSession](self, "activeSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "sendAuthInfoResult:error:", v6, a4);

  return (char)a4;
}

- (BOOL)sendProfileResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[ASTSession activeSession](self, "activeSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "sendProfileResult:error:", v6, a4);

  return (char)a4;
}

- (BOOL)sendTestResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[ASTSession activeSession](self, "activeSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "sendTestResult:error:", v6, a4);

  return (char)a4;
}

- (void)updateAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASTSession activeSession](self, "activeSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAction:", v4);

}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASTSession activeSession](self, "activeSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestSuitesAvailableWithCompletionHandler:", v4);

}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ASTSession activeSession](self, "activeSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestSuiteStart:completionHandler:", v7, v6);

}

- (void)requestSuiteSummary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[ASTSession activeSession](self, "activeSession");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject requestSuiteSummary:completionHandler:](v8, "requestSuiteSummary:completionHandler:", v6, v7);
  }
  else
  {
    ASTLogHandleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "Not requesting suite summary because diagnostic event id is nil", v9, 2u);
    }
  }

}

- (void)session:(id)a3 startTest:(id)a4 parameters:(id)a5 testResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[ASTSession activeSession](self, "activeSession");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v15)
  {
    -[ASTSession delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "session:startTest:parameters:testResult:", v15, v10, v11, v12);

  }
}

- (void)session:(id)a3 cancelTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ASTSession activeSession](self, "activeSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    -[ASTSession delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session:cancelTest:", v9, v6);

  }
}

- (void)session:(id)a3 profile:(id)a4 filteredByComponents:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ASTSession delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "session:profile:filteredByComponents:", v10, v9, v8);

}

- (void)session:(id)a3 didPauseWithError:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[ASTSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session:didPauseWithError:", v10, v6);

  }
}

- (void)sessionDidResume:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ASTSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASTSession delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionDidResume:", v7);

  }
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[ASTSession serverSession](self, "serverSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v12);
    }
    else
    {
      -[ASTSession activeSession](self, "activeSession");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 == v6)
      {
LABEL_14:
        -[ASTSession setServerSession:](self, "setServerSession:", 0);
        goto LABEL_15;
      }
      -[ASTSession delegate](self, "delegate");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject session:didEndWithError:](v12, "session:didEndWithError:", v6, v7);
    }

    goto LABEL_14;
  }
  -[ASTSession repairSession](self, "repairSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_group_leave(v14);

    }
    -[ASTSession setRepairSession:](self, "setRepairSession:", 0);
  }
  else
  {
    ASTLogHandleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ASTSession session:didEndWithError:].cold.1();

  }
LABEL_15:

}

- (void)sessionDidStart:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  -[ASTSession serverSession](self, "serverSession");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

  }
  else
  {
    v6 = (void *)v5;
    -[ASTSession repairSession](self, "repairSession");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      ASTLogHandleForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ASTSession session:didEndWithError:].cold.1();
      goto LABEL_8;
    }
  }
  -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ASTSession sessionStartDispatchGroup](self, "sessionStartDispatchGroup");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_group_leave(v8);
LABEL_8:

  }
}

- (void)session:(id)a3 generateAuthInfoWithNonce:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[ASTSession delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_255DA88B8);

  if (v8)
  {
    v9 = (void *)MEMORY[0x22E31C248]();
    -[ASTSession delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "session:generateAuthInfoWithNonce:", v11, v6);

    objc_autoreleasePoolPop(v9);
  }

}

- (void)session:(id)a3 signPayload:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[ASTSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_255DA88B8);

  if (v11)
  {
    v12 = (void *)MEMORY[0x22E31C248]();
    -[ASTSession delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "session:signPayload:completionHandler:", v14, v8, v9);

    objc_autoreleasePoolPop(v12);
  }

}

- (void)session:(id)a3 signFile:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[ASTSession delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_255DA88B8);

  if (v11)
  {
    v12 = (void *)MEMORY[0x22E31C248]();
    -[ASTSession delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "session:signFile:completionHandler:", v14, v8, v9);

    objc_autoreleasePoolPop(v12);
  }

}

+ (void)requestAsset:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "requestAsset:useEnvironmentAssetsURL:customEndpoint:completionHandler:", a3, 1, 0, a4);
}

+ (void)requestAsset:(id)a3 useEnvironmentAssetsURL:(BOOL)a4 customEndpoint:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  ASTSession *v12;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(ASTSession);
  -[ASTSession requestAsset:useEnvironmentAssetsURL:customEndpoint:completionHandler:](v12, "requestAsset:useEnvironmentAssetsURL:customEndpoint:completionHandler:", v11, v7, v10, v9);

}

- (void)requestAsset:(id)a3 completionHandler:(id)a4
{
  -[ASTSession requestAsset:useEnvironmentAssetsURL:customEndpoint:completionHandler:](self, "requestAsset:useEnvironmentAssetsURL:customEndpoint:completionHandler:", a3, 1, 0, a4);
}

- (void)requestAsset:(id)a3 useEnvironmentAssetsURL:(BOOL)a4 customEndpoint:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[ASTSession activeSession](self, "activeSession");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ASTSession fetchAsset:sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:](self, "fetchAsset:sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:", v12, objc_opt_class(), v7, v11, v10);

}

- (void)fetchAsset:(id)a3 sessionClass:(Class)a4 useEnvironmentAssetsURL:(BOOL)a5 customEndpoint:(id)a6 completionHandler:(id)a7
{
  id v11;
  void (**v12)(id, id, id);
  NSObject *v13;
  void *v14;
  void *v15;
  ASTSession *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  void *v23;
  char v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  id v32;
  _QWORD v33[4];
  id v34;
  ASTSession *v35;
  id v36;
  id v37;
  void (**v38)(id, id, id);
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v31 = a5;
  v43 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v32 = a6;
  v12 = (void (**)(id, id, id))a7;
  if (!a4)
    a4 = (Class)objc_opt_class();
  if (a4 == (Class)objc_opt_class() || a4 == (Class)objc_opt_class())
  {
    -[ASTSession destinationURLForAsset:](self, "destinationURLForAsset:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self;
    objc_sync_enter(v16);
    if (-[ASTSession shouldEvictCachedAssetForName:](v16, "shouldEvictCachedAssetForName:", v11)
      && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "fileExistsAtPath:", v15),
          v17,
          v18))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v20 = objc_msgSend(v19, "removeItemAtPath:error:", v15, &v40);
      v21 = v40;

      if (v20)
      {
        ASTLogHandleForCategory(1);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v11;
          _os_log_impl(&dword_22D91B000, v22, OS_LOG_TYPE_DEFAULT, "Eviction of stale asset [%@] from disk was successful", buf, 0xCu);
        }
      }
      else
      {
        ASTLogHandleForCategory(1);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[ASTSession fetchAsset:sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:].cold.2((uint64_t)v11);
      }

    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "fileExistsAtPath:", v15);

    if ((v24 & 1) != 0)
    {
      ASTLogHandleForCategory(1);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v11;
        _os_log_impl(&dword_22D91B000, v25, OS_LOG_TYPE_DEFAULT, "Using cached version of asset [%@] on disk", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v15);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v26, v21);
      v27 = v21;
    }
    else
    {
      v39 = v21;
      +[ASTFileManagement unprotectedFileHandleForFileURL:error:](ASTFileManagement, "unprotectedFileHandleForFileURL:error:", v14, &v39);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v39;

      if (v26)
      {
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __95__ASTSession_fetchAsset_sessionClass_useEnvironmentAssetsURL_customEndpoint_completionHandler___block_invoke;
        v33[3] = &unk_24F969C10;
        v28 = v11;
        v34 = v28;
        v35 = v16;
        v26 = v26;
        v36 = v26;
        v37 = v15;
        v38 = v12;
        v29 = (void *)MEMORY[0x22E31C3E0](v33);
        if (a4 == (Class)objc_opt_class())
        {
          +[ASTRemoteServerSession downloadAsset:useEnvironmentAssetsURL:customEndpoint:fileHandle:completionHandler:](ASTRemoteServerSession, "downloadAsset:useEnvironmentAssetsURL:customEndpoint:fileHandle:completionHandler:", v28, v31, v32, v26, v29);
        }
        else if (a4 == (Class)objc_opt_class())
        {
          +[ASTRepairSession downloadAsset:fileHandle:completionHandler:](ASTRepairSession, "downloadAsset:fileHandle:completionHandler:", v28, v26, v29);
        }

      }
      else
      {
        ASTLogHandleForCategory(1);
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          -[ASTSession fetchAsset:sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:].cold.1((uint64_t)v14);

        v12[2](v12, 0, v27);
      }
    }

    objc_sync_exit(v16);
  }
  else
  {
    ASTLogHandleForCategory(1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ASTSession fetchAsset:sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:].cold.3();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1002, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v14);
  }

}

void __95__ASTSession_fetchAsset_sessionClass_useEnvironmentAssetsURL_customEndpoint_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  ASTLogHandleForCategory(1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "Download of asset [%@] was successful", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v20 = v5;
    objc_msgSend(v9, "readContentsOfFileHandle:error:", v10, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;

    objc_msgSend(*(id *)(a1 + 48), "closeFile");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __95__ASTSession_fetchAsset_sessionClass_useEnvironmentAssetsURL_customEndpoint_completionHandler___block_invoke_cold_1(a1);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", *(_QWORD *)(a1 + 56));

    if (!v14)
    {
      v11 = 0;
      goto LABEL_13;
    }
    ASTLogHandleForCategory(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_impl(&dword_22D91B000, v15, OS_LOG_TYPE_DEFAULT, "Removing empty asset file [%@]", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "closeFile");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 56);
    v19 = v5;
    objc_msgSend(v17, "removeItemAtPath:error:", v18, &v19);
    v12 = v19;

    v11 = 0;
  }
  v5 = v12;
LABEL_13:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (id)destinationURLForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASTSession destinationAssetDirectory](self, "destinationAssetDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTEncodingUtilities SHA256HashForString:](ASTEncodingUtilities, "SHA256HashForString:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("unknown");
  objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ASTLogHandleForCategory(1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_22D91B000, v9, OS_LOG_TYPE_DEFAULT, "Using [%@] as path for asset [%@]", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (id)destinationAssetDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)MEMORY[0x24BDBCF48];
  v7[0] = v2;
  v7[1] = CFSTR("com.apple.AppleServiceToolkit");
  v7[2] = CFSTR("assets");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)readContentsOfFileHandle:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "seekToFileOffset:", 0);
  objc_msgSend(v4, "readDataToEndOfFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeDownloadedAssets
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ASTSession destinationAssetDirectory](self, "destinationAssetDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v3, 0);

}

- (BOOL)shouldEvictCachedAssetForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;

  v4 = a3;
  -[ASTSession destinationURLForAsset:](self, "destinationURLForAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11 || objc_msgSend(v9, "length"))
  {
    v12 = (void *)shouldEvictCachedAssetForName__evictCacheForAssets;
    if (!shouldEvictCachedAssetForName__evictCacheForAssets)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("strings"), 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)shouldEvictCachedAssetForName__evictCacheForAssets;
      shouldEvictCachedAssetForName__evictCacheForAssets = v13;

      v12 = (void *)shouldEvictCachedAssetForName__evictCacheForAssets;
    }
    v15 = objc_msgSend(v12, "containsObject:", v4);
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[ASTSession removeDownloadedAssets](self, "removeDownloadedAssets");
  v3.receiver = self;
  v3.super_class = (Class)ASTSession;
  -[ASTSession dealloc](&v3, sel_dealloc);
}

- (ASTSessionDelegate)delegate
{
  return (ASTSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)allowCellularSizeThreshold
{
  return self->_allowCellularSizeThreshold;
}

- (void)setAllowCellularSizeThreshold:(unint64_t)a3
{
  self->_allowCellularSizeThreshold = a3;
}

- (ASTContext)context
{
  return self->_context;
}

- (int64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (ASTRemoteServerSession)serverSession
{
  return self->_serverSession;
}

- (void)setServerSession:(id)a3
{
  objc_storeStrong((id *)&self->_serverSession, a3);
}

- (ASTRepairSession)repairSession
{
  return self->_repairSession;
}

- (void)setRepairSession:(id)a3
{
  objc_storeStrong((id *)&self->_repairSession, a3);
}

- (ASTSession)activeSession
{
  return self->_activeSession;
}

- (OS_dispatch_group)sessionStartDispatchGroup
{
  return self->_sessionStartDispatchGroup;
}

- (void)setSessionStartDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartDispatchGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDispatchGroup, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_repairSession, 0);
  objc_storeStrong((id *)&self->_serverSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

void __28__ASTSession_startWithMode___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Repaird has no suites to run", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __28__ASTSession_startWithMode___block_invoke_14_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Error requesting the repair suites available: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __28__ASTSession_startWithMode___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "AST2 has no suites to run", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __28__ASTSession_startWithMode___block_invoke_17_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Error requesting the AST2 suites available: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)session:didEndWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_22D91B000, v0, v1, "Unknown session did end!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)fetchAsset:(uint64_t)a1 sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_22D91B000, v1, v2, "Could not open file handle for [%@]: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)fetchAsset:(uint64_t)a1 sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_22D91B000, v1, v2, "Eviction of stale asset [%@] from disk was NOT successful: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)fetchAsset:sessionClass:useEnvironmentAssetsURL:customEndpoint:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Unknown session class %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __95__ASTSession_fetchAsset_sessionClass_useEnvironmentAssetsURL_customEndpoint_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_22D91B000, v1, v2, "Download of asset [%@] was NOT successful: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)readContentsOfFileHandle:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_22D91B000, v0, v1, "Could not read asset file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
