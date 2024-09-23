@implementation WCSession

uint64_t __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_startNextDeviceSwitch");
}

+ (WCSession)defaultSession
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__WCSession_defaultSession__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSession_onceToken != -1)
    dispatch_once(&defaultSession_onceToken, block);
  return (WCSession *)(id)defaultSession_session;
}

void __27__WCSession_defaultSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)defaultSession_session;
  defaultSession_session = v1;

}

- (id)_init
{
  WCSession *v2;
  WCSession *v3;
  NSString *pairingID;
  uint64_t v5;
  WCQueueManager *queueManager;
  WCSessionUserInfoTransfer *currentComplicationUserInfoTransfer;
  uint64_t v8;
  NSMutableArray *switchTasksQueue;
  NSMutableArray *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *currentMessages;
  uint64_t v14;
  NSMutableSet *currentMessageIdentifiersAwaitingReply;
  uint64_t v16;
  NSOperationQueue *workOperationQueue;
  uint64_t v18;
  NSOperationQueue *delegateOperationQueue;
  uint64_t v20;
  NSOperationQueue *backgroundWorkOperationQueue;
  void *v22;
  NSObject *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)WCSession;
  v2 = -[WCSession init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_hasCompletedInitialActivation = 0;
    v2->_paired = 0;
    v2->_reachable = 0;
    pairingID = v2->_pairingID;
    v2->_pairingID = 0;

    v3->_activationState = 0;
    *(_WORD *)&v3->_watchAppInstalled = 0;
    v3->_companionAppInstalled = 0;
    *(_WORD *)&v3->_delegateSupportsAsyncActivate = 0;
    v5 = objc_opt_new();
    queueManager = v3->_queueManager;
    v3->_queueManager = (WCQueueManager *)v5;

    currentComplicationUserInfoTransfer = v3->_currentComplicationUserInfoTransfer;
    v3->_currentComplicationUserInfoTransfer = 0;

    v8 = objc_opt_new();
    switchTasksQueue = v3->_switchTasksQueue;
    v3->_switchTasksQueue = (NSMutableArray *)v8;

    v10 = v3->_switchTasksQueue;
    v11 = (void *)objc_opt_new();
    -[NSMutableArray addObject:](v10, "addObject:", v11);

    v12 = objc_opt_new();
    currentMessages = v3->_currentMessages;
    v3->_currentMessages = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    currentMessageIdentifiersAwaitingReply = v3->_currentMessageIdentifiersAwaitingReply;
    v3->_currentMessageIdentifiersAwaitingReply = (NSMutableSet *)v14;

    v16 = objc_opt_new();
    workOperationQueue = v3->_workOperationQueue;
    v3->_workOperationQueue = (NSOperationQueue *)v16;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_workOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v3->_workOperationQueue, "setQualityOfService:", 17);
    v18 = objc_opt_new();
    delegateOperationQueue = v3->_delegateOperationQueue;
    v3->_delegateOperationQueue = (NSOperationQueue *)v18;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_delegateOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v3->_delegateOperationQueue, "setQualityOfService:", 17);
    v20 = objc_opt_new();
    backgroundWorkOperationQueue = v3->_backgroundWorkOperationQueue;
    v3->_backgroundWorkOperationQueue = (NSOperationQueue *)v20;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_backgroundWorkOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v3->_backgroundWorkOperationQueue, "setQualityOfService:", 9);
    +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", v3);

    wc_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v27 = "-[WCSession _init]";
      _os_log_impl(&dword_216F21000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s WCSession initialized", buf, 0xCu);
    }

  }
  return v3;
}

- (void)handleSessionStateChanged:(id)a3
{
  id v4;
  NSOperationQueue *workOperationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WCSession *v9;

  v4 = a3;
  workOperationQueue = self->_workOperationQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__WCSession_handleSessionStateChanged___block_invoke;
  v7[3] = &unk_24D661D28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v7);

}

- (id)errorIfPreconditionsNotSatisfied
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v7;

  if (-[WCSession activationState](self, "activationState"))
  {
    -[WCSession delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (-[WCSession isPaired](self, "isPaired"))
      {
        if (-[WCSession isWatchAppInstalled](self, "isWatchAppInstalled"))
        {
          if (-[WCSession activationState](self, "activationState") == WCSessionActivationStateInactive)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7016);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            wc_log();
            v5 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              -[WCSession errorIfPreconditionsNotSatisfied].cold.3();
          }
          else
          {
            -[WCSession pairingID](self, "pairingID");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            if (v7)
            {
              v4 = 0;
              return v4;
            }
            objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7001);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            wc_log();
            v5 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              -[WCSession errorIfPreconditionsNotSatisfied].cold.4();
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7006);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          wc_log();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            -[WCSession errorIfPreconditionsNotSatisfied].cold.5();
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7005);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        wc_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          -[WCSession errorIfPreconditionsNotSatisfied].cold.6();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7003);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      wc_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[WCSession logAndTestIfUnactivatedOrMissingDelegate].cold.2();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7004);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WCSession logAndTestIfUnactivatedOrMissingDelegate].cold.1();
  }

  return v4;
}

- (void)errorIfPreconditionsNotSatisfied
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "WCSession counterpart app not installed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __28__WCSession_activateSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v27 = "-[WCSession activateSession]_block_invoke";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  if (objc_msgSend((id)objc_opt_class(), "isSupported"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "switchTasksQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = objc_claimAutoreleasedReturnValue();

      if ((-[NSObject clientReadyForSessionState](v5, "clientReadyForSessionState") & 1) != 0
        || objc_msgSend(*(id *)(a1 + 32), "activationState"))
      {
        wc_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __28__WCSession_activateSession__block_invoke_cold_2();
      }
      else
      {
        -[NSObject setTaskState:](v5, "setTaskState:", 3);
        -[NSObject setClientReadyForSessionState:](v5, "setClientReadyForSessionState:", 1);
        wc_log();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          v27 = "-[WCSession activateSession]_block_invoke";
          _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s informing daemon ready for session state", buf, 0xCu);
        }

        +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(*(id *)(a1 + 32), "delegateSupportsActiveDeviceSwitch");
        v10 = MEMORY[0x24BDAC760];
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __28__WCSession_activateSession__block_invoke_17;
        v23[3] = &unk_24D661A90;
        v11 = v5;
        v12 = *(_QWORD *)(a1 + 32);
        v24 = v11;
        v25 = v12;
        objc_msgSend(v8, "sessionReadyForInitialStateForClientPairingID:supportsActiveDeviceSwitch:withErrorHandler:", 0, v9, v23);

        if ((objc_msgSend(*(id *)(a1 + 32), "delegateSupportsAsyncActivate") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegateOperationQueue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setSuspended:", 1);

          v14 = dispatch_semaphore_create(0);
          v15 = (void *)objc_opt_new();
          v21[0] = v10;
          v21[1] = 3221225472;
          v21[2] = __28__WCSession_activateSession__block_invoke_21;
          v21[3] = &unk_24D661AB8;
          v16 = v14;
          v22 = v16;
          objc_msgSend(v15, "addExecutionBlock:", v21);
          objc_msgSend(*(id *)(a1 + 32), "delegateOperationQueue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addOperation:", v15);

          v18 = dispatch_time(0, 7000000000);
          if (dispatch_semaphore_wait(v16, v18))
          {
            wc_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              __28__WCSession_activateSession__block_invoke_cold_3();

            objc_msgSend(*(id *)(a1 + 32), "delegateOperationQueue");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setSuspended:", 0);

          }
        }
        v6 = v24;
      }

    }
    else
    {
      wc_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __28__WCSession_activateSession__block_invoke_cold_1();
    }
  }
  else
  {
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __28__WCSession_activateSession__block_invoke_cold_4();
  }

}

void __39__WCSession_handleSessionStateChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v9 = 136446466;
    v10 = "-[WCSession handleSessionStateChanged:]_block_invoke";
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "switchTasksQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "taskState") == 999)
  {
    wc_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136446210;
      v10 = "-[WCSession handleSessionStateChanged:]_block_invoke";
      _os_log_impl(&dword_216F21000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s dropping session state as client does not support Quick Watch Switch", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v7 = objc_msgSend(v5, "taskState");
    v8 = *(void **)(a1 + 40);
    if (v7 == 4)
    {
      objc_msgSend(v8, "onqueue_handleUpdateSessionState:", *(_QWORD *)(a1 + 32));
      if (objc_msgSend(*(id *)(a1 + 40), "connectionWasInterrupted"))
      {
        objc_msgSend(*(id *)(a1 + 40), "setConnectionWasInterrupted:", 0);
        objc_msgSend(*(id *)(a1 + 40), "xpcConnectionRestoredWithState:", *(_QWORD *)(a1 + 32));
      }
    }
    else
    {
      objc_msgSend(v8, "onqueue_completeSwitchTask:withSessionState:", v5, *(_QWORD *)(a1 + 32));
    }
  }

}

- (BOOL)delegateSupportsActiveDeviceSwitch
{
  return self->_delegateSupportsActiveDeviceSwitch;
}

- (void)onqueue_startNextDeviceSwitch
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  WCSession *v23;
  NSObject *v24;
  id v25;
  id location;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[WCSession switchTasksQueue](self, "switchTasksQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();

  if (-[NSObject taskState](v4, "taskState") != 4)
  {
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136446466;
    v30 = "-[WCSession onqueue_startNextDeviceSwitch]";
    v31 = 2114;
    v32 = v4;
    v17 = "%{public}s current task %{public}@ isn't completed";
LABEL_11:
    _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
    goto LABEL_15;
  }
  -[WCSession switchTasksQueue](self, "switchTasksQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 < 2)
  {
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136446466;
    v30 = "-[WCSession onqueue_startNextDeviceSwitch]";
    v31 = 2114;
    v32 = v4;
    v17 = "%{public}s no tasks queued after %{public}@";
    goto LABEL_11;
  }
  -[WCSession backgroundWorkOperationQueue](self, "backgroundWorkOperationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelAllOperations");

  -[WCSession switchTasksQueue](self, "switchTasksQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);

  -[WCSession switchTasksQueue](self, "switchTasksQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();

  -[NSObject setTaskState:](v10, "setTaskState:", 1);
  -[WCSession setActivationState:](self, "setActivationState:", 1);
  wc_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v30 = "-[WCSession onqueue_startNextDeviceSwitch]";
    v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_216F21000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s starting new switch task: %{public}@", buf, 0x16u);
  }

  if (-[WCSession delegateSupportsActiveDeviceSwitch](self, "delegateSupportsActiveDeviceSwitch"))
  {
    v12 = (void *)objc_opt_new();
    objc_initWeak((id *)buf, v12);
    v13 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke;
    v27[3] = &unk_24D661B30;
    objc_copyWeak(&v28, (id *)buf);
    v27[4] = self;
    objc_msgSend(v12, "addExecutionBlock:", v27);
    objc_msgSend(v12, "setQueuePriority:", 8);
    -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v12);

    v15 = (void *)objc_opt_new();
    objc_initWeak(&location, v15);
    v19 = v13;
    v20 = 3221225472;
    v21 = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_134;
    v22 = &unk_24D661B08;
    objc_copyWeak(&v25, &location);
    v23 = self;
    v10 = v10;
    v24 = v10;
    objc_msgSend(v15, "addExecutionBlock:", &v19);
    -[WCSession delegateOperationQueue](self, "delegateOperationQueue", v19, v20, v21, v22, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v15);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    wc_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v30 = "-[WCSession onqueue_startNextDeviceSwitch]";
      _os_log_impl(&dword_216F21000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s client delegate does not support Quick Watch Switch. Halting session until process exits.", buf, 0xCu);
    }

    -[NSObject setTaskState:](v10, "setTaskState:", 999);
  }
LABEL_15:

}

- (NSMutableArray)switchTasksQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)onqueue_completeSwitchTask:(id)a3 withSessionState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v39 = "-[WCSession onqueue_completeSwitchTask:withSessionState:]";
    v40 = 2114;
    v41 = v6;
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v6, "clientReadyForSessionState"))
  {
    if (objc_msgSend(v7, "isStandaloneApp"))
    {
      objc_msgSend(v6, "setTaskState:", 888);
      -[WCSession setActivationState:](self, "setActivationState:", 1);
      wc_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WCSession onqueue_completeSwitchTask:withSessionState:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

      v17 = (void *)objc_opt_new();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke;
      v37[3] = &unk_24D661AB8;
      v37[4] = self;
      objc_msgSend(v17, "addExecutionBlock:", v37);
      -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addOperation:", v17);

      +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "invalidateConnection");

    }
    else
    {
      objc_msgSend(v6, "setTaskState:", 4);
      -[WCSession onDelegateQueueIfTriggeringKVO_updateSessionState:triggerKVO:](self, "onDelegateQueueIfTriggeringKVO_updateSessionState:triggerKVO:", v7, 0);
      -[WCSession setActivationState:](self, "setActivationState:", 2);
      -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSuspended:", 0);

      -[WCSession onqueue_cancelTransfersIfAppropriate](self, "onqueue_cancelTransfersIfAppropriate");
      v17 = (void *)objc_opt_new();
      objc_initWeak((id *)buf, v17);
      v21 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2;
      v35[3] = &unk_24D661EE0;
      v35[4] = self;
      objc_copyWeak(&v36, (id *)buf);
      objc_msgSend(v17, "addExecutionBlock:", v35);
      v34[0] = v21;
      v34[1] = 3221225472;
      v34[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_125;
      v34[3] = &unk_24D661AB8;
      v34[4] = self;
      objc_msgSend(v17, "setCompletionBlock:", v34);
      -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addOperation:", v17);

      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }

    if (!-[WCSession hasCompletedInitialActivation](self, "hasCompletedInitialActivation"))
    {
      -[WCSession setHasCompletedInitialActivation:](self, "setHasCompletedInitialActivation:", 1);
      objc_msgSend(v7, "pairingID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {

LABEL_13:
        v26 = (void *)objc_opt_new();
        objc_initWeak((id *)buf, v26);
        v28 = MEMORY[0x24BDAC760];
        v29 = 3221225472;
        v30 = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_4;
        v31 = &unk_24D661B30;
        objc_copyWeak(&v33, (id *)buf);
        v32 = v7;
        objc_msgSend(v26, "addExecutionBlock:", &v28);
        -[WCSession backgroundWorkOperationQueue](self, "backgroundWorkOperationQueue", v28, v29, v30, v31);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addOperation:", v26);

        objc_destroyWeak(&v33);
        objc_destroyWeak((id *)buf);

        goto LABEL_14;
      }
      objc_msgSend(v7, "pairedDevicesPairingIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (!v25)
        goto LABEL_13;
    }
  }
LABEL_14:

}

- (NSOperationQueue)delegateOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHasCompletedInitialActivation:(BOOL)a3
{
  self->_hasCompletedInitialActivation = a3;
}

- (void)setActivationState:(int64_t)a3
{
  self->_activationState = a3;
}

- (void)onqueue_handleUpdateSessionState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void **);
  void *v11;
  id v12;
  WCSession *v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_initWeak(&location, v5);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __46__WCSession_onqueue_handleUpdateSessionState___block_invoke;
  v11 = &unk_24D661B08;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v12 = v6;
  v13 = self;
  objc_msgSend(v5, "addExecutionBlock:", &v8);
  -[WCSession delegateOperationQueue](self, "delegateOperationQueue", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (BOOL)hasCompletedInitialActivation
{
  return self->_hasCompletedInitialActivation;
}

- (BOOL)connectionWasInterrupted
{
  return self->_connectionWasInterrupted;
}

+ (BOOL)isSupported
{
  return MGGetBoolAnswer();
}

void __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  id WeakRetained;
  char v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHasContentPending:", v2 != 0);

  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "hasContentPending");
    v5 = "NO";
    if (v4)
      v5 = "YES";
    v9 = 136446466;
    v10 = "-[WCSession onqueue_completeSwitchTask:withSessionState:]_block_invoke_2";
    v11 = 2080;
    v12 = v5;
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s hasContentPending: %s", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v7 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "delegateSupportsAsyncActivate"))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "session:activationDidCompleteWithState:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "activationState"), 0);

    }
  }
}

void __46__WCSession_onqueue_handleUpdateSessionState___block_invoke(void **a1)
{
  id WeakRetained;
  char v3;
  void **v4;
  void *v5;
  void **v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = a1 + 4;
    objc_msgSend(a1[4], "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[5];
    v6 = a1 + 5;
    objc_msgSend(v7, "pairingID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      wc_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_cold_1();

    }
    v11 = *v6;
    v12 = *v4;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_127;
    v13[3] = &unk_24D661F08;
    v13[4] = v11;
    v14 = v12;
    objc_msgSend(v11, "didSessionStateChange:withChangeHandler:", v14, v13);

  }
}

void __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_cold_1()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_28();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v4, v5, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3();
}

- (NSString)pairingID
{
  return self->_pairingID;
}

- (void)setHasContentPending:(BOOL)a3
{
  self->_hasContentPending = a3;
}

- (BOOL)hasContentPending
{
  return self->_hasContentPending;
}

- (void)didSessionStateChange:(id)a3 withChangeHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _BOOL8, _BOOL8, _QWORD);
  int v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  int v12;
  int v13;
  _BOOL8 v14;
  NSUInteger v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _BOOL8, _BOOL8, _QWORD))a4;
  v8 = objc_msgSend(v6, "isReachable");
  v9 = v8 ^ -[WCSession isReachable](self, "isReachable");
  objc_msgSend(v6, "pairingID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WCSession didPairingIDChange:](self, "didPairingIDChange:", v10);

  LODWORD(v10) = objc_msgSend(v6, "isPaired");
  if ((_DWORD)v10 == -[WCSession isPaired](self, "isPaired")
    && (v12 = objc_msgSend(v6, "isAppInstalled"), v12 == -[WCSession isWatchAppInstalled](self, "isWatchAppInstalled"))
    && (v13 = objc_msgSend(v6, "isComplicationEnabled"),
        v13 == -[WCSession isComplicationEnabled](self, "isComplicationEnabled")))
  {
    objc_msgSend(v6, "watchDirectoryURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WCSession didWatchURLChange:](self, "didWatchURLChange:", v18);

  }
  else
  {
    v14 = 1;
  }
  v15 = -[WCSession remainingComplicationUserInfoTransfers](self, "remainingComplicationUserInfoTransfers");
  v16 = objc_msgSend(v6, "remainingComplicationUserInfoTransfers");
  if (v9 | v14 || v11 || v15 != v16)
  {
    v7[2](v7, v9, v14, v11, 0);
  }
  else
  {
    wc_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136446210;
      v20 = "-[WCSession didSessionStateChange:withChangeHandler:]";
      _os_log_impl(&dword_216F21000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s no change", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (BOOL)isPaired
{
  _BOOL4 v3;

  v3 = -[WCSession logAndTestIfUnactivatedOrMissingDelegate](self, "logAndTestIfUnactivatedOrMissingDelegate");
  if (v3)
    LOBYTE(v3) = self->_paired;
  return v3;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    -[WCSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession setDelegateSupportsAsyncActivate:](self, "setDelegateSupportsAsyncActivate:", objc_opt_respondsToSelector() & 1);

    if (-[WCSession delegateSupportsAsyncActivate](self, "delegateSupportsAsyncActivate"))
    {
      -[WCSession delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[WCSession delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WCSession setDelegateSupportsActiveDeviceSwitch:](self, "setDelegateSupportsActiveDeviceSwitch:", objc_opt_respondsToSelector() & 1);

      }
      else
      {
        -[WCSession setDelegateSupportsActiveDeviceSwitch:](self, "setDelegateSupportsActiveDeviceSwitch:", 0);
      }

    }
    else
    {
      -[WCSession setDelegateSupportsActiveDeviceSwitch:](self, "setDelegateSupportsActiveDeviceSwitch:", 0);
    }
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (-[WCSession delegateSupportsAsyncActivate](self, "delegateSupportsAsyncActivate"))
        v11 = "YES";
      else
        v11 = "NO";
      v13 = 136446722;
      v14 = "-[WCSession setDelegate:]";
      if (-[WCSession delegateSupportsActiveDeviceSwitch](self, "delegateSupportsActiveDeviceSwitch"))
        v12 = "YES";
      else
        v12 = "NO";
      v15 = 2080;
      v16 = v11;
      v17 = 2080;
      v18 = v12;
      _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegateSupportsAsyncActivate: %s, delegateSupportsActiveDeviceSwitch: %s", (uint8_t *)&v13, 0x20u);
    }

  }
}

- (BOOL)logAndTestIfUnactivatedOrMissingDelegate
{
  void *v3;
  NSObject *v5;

  if (-[WCSession activationState](self, "activationState"))
  {
    -[WCSession delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return 1;
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WCSession logAndTestIfUnactivatedOrMissingDelegate].cold.2();
  }
  else
  {
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WCSession logAndTestIfUnactivatedOrMissingDelegate].cold.1();
  }

  return 0;
}

- (WCSessionActivationState)activationState
{
  return self->_activationState;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)delegateSupportsAsyncActivate
{
  return self->_delegateSupportsAsyncActivate;
}

- (void)setDelegateSupportsAsyncActivate:(BOOL)a3
{
  self->_delegateSupportsAsyncActivate = a3;
}

- (void)setDelegateSupportsActiveDeviceSwitch:(BOOL)a3
{
  self->_delegateSupportsActiveDeviceSwitch = a3;
}

- (NSUInteger)remainingComplicationUserInfoTransfers
{
  return self->_remainingComplicationUserInfoTransfers;
}

- (BOOL)isWatchAppInstalled
{
  _BOOL4 v3;

  v3 = -[WCSession logAndTestIfUnactivatedOrMissingDelegate](self, "logAndTestIfUnactivatedOrMissingDelegate");
  if (v3)
    LOBYTE(v3) = self->_watchAppInstalled;
  return v3;
}

- (BOOL)isReachable
{
  _BOOL4 v3;

  v3 = -[WCSession logAndTestIfUnactivatedOrMissingDelegate](self, "logAndTestIfUnactivatedOrMissingDelegate");
  if (v3)
    LOBYTE(v3) = -[WCSession activationState](self, "activationState") == WCSessionActivationStateActivated
              && self->_reachable;
  return v3;
}

- (BOOL)isComplicationEnabled
{
  _BOOL4 v3;

  v3 = -[WCSession logAndTestIfUnactivatedOrMissingDelegate](self, "logAndTestIfUnactivatedOrMissingDelegate");
  if (v3)
    LOBYTE(v3) = self->_complicationEnabled;
  return v3;
}

- (BOOL)didWatchURLChange:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  int v7;

  v5 = a3;
  if (!v5)
  {
    -[WCSession watchDirectoryURL](self, "watchDirectoryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      LOBYTE(v7) = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[WCSession watchDirectoryURL](self, "watchDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6) ^ 1;

  if (!v5)
    goto LABEL_6;
LABEL_7:

  return v7;
}

- (void)onDelegateQueueIfTriggeringKVO_updateSessionState:(id)a3 triggerKVO:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSURL *v12;
  NSURL *v13;
  NSURL *watchDirectoryURL;
  void *v15;
  _BYTE v16[22];
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  wc_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    *(_QWORD *)&v16[4] = "-[WCSession onDelegateQueueIfTriggeringKVO_updateSessionState:triggerKVO:]";
    *(_DWORD *)v16 = 136446722;
    if (v4)
      v8 = "YES";
    *(_WORD *)&v16[12] = 2114;
    *(_QWORD *)&v16[14] = v6;
    v17 = 2080;
    v18 = v8;
    _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, triggerKVO: %s", v16, 0x20u);
  }

  v9 = objc_msgSend(v6, "isReachable");
  if (v4)
    -[WCSession setReachable:](self, "setReachable:", v9);
  else
    self->_reachable = v9;
  +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance", *(_OWORD *)v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "watchDirectoryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createWatchDirectoryIfNeeded:", v11);

  objc_msgSend(v6, "watchDirectoryURL");
  v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v4)
  {
    -[WCSession setWatchDirectoryURL:](self, "setWatchDirectoryURL:", v12);

    -[WCSession setPaired:](self, "setPaired:", objc_msgSend(v6, "isPaired"));
    -[WCSession setWatchAppInstalled:](self, "setWatchAppInstalled:", objc_msgSend(v6, "isAppInstalled"));
    -[WCSession setComplicationEnabled:](self, "setComplicationEnabled:", objc_msgSend(v6, "isComplicationEnabled"));
    -[WCSession setRemainingComplicationUserInfoTransfers:](self, "setRemainingComplicationUserInfoTransfers:", objc_msgSend(v6, "remainingComplicationUserInfoTransfers"));
  }
  else
  {
    watchDirectoryURL = self->_watchDirectoryURL;
    self->_watchDirectoryURL = v12;

    self->_paired = objc_msgSend(v6, "isPaired");
    self->_watchAppInstalled = objc_msgSend(v6, "isAppInstalled");
    self->_complicationEnabled = objc_msgSend(v6, "isComplicationEnabled");
    self->_remainingComplicationUserInfoTransfers = objc_msgSend(v6, "remainingComplicationUserInfoTransfers");
  }
  objc_msgSend(v6, "pairingID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession updatePairingID:](self, "updatePairingID:", v15);

}

- (void)updatePairingID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *pairingID;
  NSObject *v7;
  NSString *v8;
  void *v9;
  NSOperationQueue *workOperationQueue;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->_pairingID) & 1) == 0)
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    pairingID = self->_pairingID;
    self->_pairingID = v5;

    if (self->_pairingID)
    {
      wc_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_pairingID;
        *(_DWORD *)buf = 136446466;
        v13 = "-[WCSession updatePairingID:]";
        v14 = 2114;
        v15 = v8;
        _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
      }

      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPairingID:", self->_pairingID);

      workOperationQueue = self->_workOperationQueue;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __29__WCSession_updatePairingID___block_invoke;
      v11[3] = &unk_24D661AB8;
      v11[4] = self;
      -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v11);
    }
  }

}

- (BOOL)didPairingIDChange:(id)a3
{
  NSString *pairingID;

  pairingID = self->_pairingID;
  if ((unint64_t)a3 | (unint64_t)pairingID)
    return -[NSString isEqual:](pairingID, "isEqual:") ^ 1;
  else
    return 0;
}

- (NSURL)watchDirectoryURL
{
  void *v3;
  NSURL *v4;

  -[WCSession errorIfPreconditionsNotSatisfied](self, "errorIfPreconditionsNotSatisfied");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = 0;
  else
    v4 = self->_watchDirectoryURL;
  return v4;
}

- (void)activateSession
{
  NSObject *v3;
  _QWORD block[5];

  v3 = _os_activity_create(&dword_216F21000, "activateSession", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__WCSession_activateSession__block_invoke;
  block[3] = &unk_24D661AB8;
  block[4] = self;
  os_activity_apply(v3, block);

}

- (WCSession)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("%s: should never be used."), "-[WCSession init]");

  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)WCSession;
  -[WCSession dealloc](&v4, sel_dealloc);
}

void __28__WCSession_activateSession__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  if (v3)
  {
    wc_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __28__WCSession_activateSession__block_invoke_17_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setTaskState:", 888);
    objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuspended:", 0);

  }
}

intptr_t __28__WCSession_activateSession__block_invoke_21(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onqueue_loadPersistedContent
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[WCSession onqueue_loadPersistedContent]";
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s loading persisted content", (uint8_t *)&v4, 0xCu);
  }

  -[WCSession onqueue_loadOutstandingFileTransfers](self, "onqueue_loadOutstandingFileTransfers");
  -[WCSession onqueue_loadOutstandingUserInfoTransfers](self, "onqueue_loadOutstandingUserInfoTransfers");
  -[WCSession onqueue_loadAppContexts](self, "onqueue_loadAppContexts");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = "YES";
  else
    v7 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, hasDelegate: %s, activationState: %d>"), v5, self, v7, -[WCSession activationState](self, "activationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCSession;
  return -[WCSession isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WCSession;
  return -[WCSession hash](&v3, sel_hash);
}

- (void)onqueue_cancelMessagesIfAppropriate
{
  int v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[WCSession isReachable](self, "isReachable") && -[WCSession isWatchAppInstalled](self, "isWatchAppInstalled"))
    v3 = !-[WCSession isPaired](self, "isPaired");
  else
    v3 = 1;
  wc_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "NO";
    if (v3)
      v5 = "YES";
    v7 = 136446466;
    v8 = "-[WCSession onqueue_cancelMessagesIfAppropriate]";
    v9 = 2080;
    v10 = v5;
    _os_log_impl(&dword_216F21000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s shouldCancel: %s", (uint8_t *)&v7, 0x16u);
  }

  if (v3)
  {
    -[WCSession queueManager](self, "queueManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelQueuedMessages");

  }
}

- (BOOL)isCompanionAppInstalled
{
  _BOOL4 v3;

  v3 = -[WCSession logAndTestIfUnactivatedOrMissingDelegate](self, "logAndTestIfUnactivatedOrMissingDelegate");
  if (v3)
    LOBYTE(v3) = self->_companionAppInstalled;
  return v3;
}

uint64_t __29__WCSession_updatePairingID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_loadPersistedContent");
}

- (NSArray)outstandingUserInfoTransfers
{
  void *v3;
  NSOperationQueue *workOperationQueue;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = (id)MEMORY[0x24BDBD1A8];
  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__WCSession_outstandingUserInfoTransfers__block_invoke;
  v8[3] = &unk_24D661AE0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "addExecutionBlock:", v8);
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperations:waitUntilFinished:](workOperationQueue, "addOperations:waitUntilFinished:", v5, 1);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __41__WCSession_outstandingUserInfoTransfers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)onqueue_setCurrentComplicationUserInfoTransfer:(id)a3
{
  WCSessionUserInfoTransfer *v4;
  WCSessionUserInfoTransfer *currentComplicationUserInfoTransfer;

  v4 = (WCSessionUserInfoTransfer *)a3;
  -[WCSessionUserInfoTransfer setCurrentComplicationInfo:](self->_currentComplicationUserInfoTransfer, "setCurrentComplicationInfo:", 0);
  currentComplicationUserInfoTransfer = self->_currentComplicationUserInfoTransfer;
  self->_currentComplicationUserInfoTransfer = v4;

}

- (void)onqueue_loadOutstandingUserInfoTransfers
{
  void *v3;
  void *v4;
  WCSessionUserInfoTransfer *v5;
  WCSessionUserInfoTransfer *currentComplicationUserInfoTransfer;
  id v7;

  +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "loadOutstandingUserInfoTransfersAndComplicationUserInfo:", &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (WCSessionUserInfoTransfer *)v7;
  -[WCSession setInternalOutstandingUserInfoTransfers:](self, "setInternalOutstandingUserInfoTransfers:", v4);

  currentComplicationUserInfoTransfer = self->_currentComplicationUserInfoTransfer;
  self->_currentComplicationUserInfoTransfer = v5;

}

- (id)onqueue_addOutstandingUserInfoTransfer:(id)a3
{
  id v4;
  NSMutableDictionary *internalOutstandingUserInfoTransfers;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[WCSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingUserInfoTransfers"));
    internalOutstandingUserInfoTransfers = self->_internalOutstandingUserInfoTransfers;
    objc_msgSend(v4, "transferIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](internalOutstandingUserInfoTransfers, "setObject:forKeyedSubscript:", v4, v6);

    -[WCSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingUserInfoTransfers"));
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistOutgoingUserInfoTransfer:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)onqueue_removeOutstandingUserInfoTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *internalOutstandingUserInfoTransfers;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    -[WCSession pairingID](self, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WCSession internalOutstandingFileTransfers](self, "internalOutstandingFileTransfers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transferIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[WCSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingUserInfoTransfers"));
        internalOutstandingUserInfoTransfers = self->_internalOutstandingUserInfoTransfers;
        objc_msgSend(v4, "transferIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](internalOutstandingUserInfoTransfers, "removeObjectForKey:", v10);

        -[WCSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingUserInfoTransfers"));
      }
      else
      {
        v12 = self->_internalOutstandingUserInfoTransfers;
        objc_msgSend(v4, "transferIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

      }
      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteOutstandingUserInfoTransfer:](v11, "deleteOutstandingUserInfoTransfer:", v4);
    }
    else
    {
      wc_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[WCSession onqueue_removeOutstandingUserInfoTransfer:].cold.1();
    }

  }
}

- (NSArray)outstandingFileTransfers
{
  void *v3;
  NSOperationQueue *workOperationQueue;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = (id)MEMORY[0x24BDBD1A8];
  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__WCSession_outstandingFileTransfers__block_invoke;
  v8[3] = &unk_24D661AE0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "addExecutionBlock:", v8);
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperations:waitUntilFinished:](workOperationQueue, "addOperations:waitUntilFinished:", v5, 1);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v6;
}

void __37__WCSession_outstandingFileTransfers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)onqueue_loadOutstandingFileTransfers
{
  void *v3;
  void *v4;

  +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadOutstandingFileTransfers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession setInternalOutstandingFileTransfers:](self, "setInternalOutstandingFileTransfers:", v4);

  -[WCSession onqueue_loadFileTransferProgress](self, "onqueue_loadFileTransferProgress");
}

- (void)onqueue_addOutstandingFileTransfer:(id)a3
{
  id v4;
  NSMutableDictionary *internalOutstandingFileTransfers;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[WCSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingFileTransfers"));
    internalOutstandingFileTransfers = self->_internalOutstandingFileTransfers;
    objc_msgSend(v4, "transferIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](internalOutstandingFileTransfers, "setObject:forKeyedSubscript:", v4, v6);

    -[WCSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingFileTransfers"));
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "persistOutgoingFileTransfer:", v4);

  }
}

- (void)onqueue_removeOutstandingFileTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *internalOutstandingFileTransfers;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    -[WCSession pairingID](self, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WCSession internalOutstandingFileTransfers](self, "internalOutstandingFileTransfers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transferIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[WCSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingFileTransfers"));
        internalOutstandingFileTransfers = self->_internalOutstandingFileTransfers;
        objc_msgSend(v4, "transferIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](internalOutstandingFileTransfers, "removeObjectForKey:", v10);

        -[WCSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingFileTransfers"));
      }
      else
      {
        v12 = self->_internalOutstandingFileTransfers;
        objc_msgSend(v4, "transferIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

      }
      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteOutstandingFileTransfer:](v11, "deleteOutstandingFileTransfer:", v4);
    }
    else
    {
      wc_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[WCSession onqueue_removeOutstandingUserInfoTransfer:].cold.1();
    }

  }
}

- (void)onqueue_loadFileTransferProgress
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WCSession internalOutstandingFileTransfers](self, "internalOutstandingFileTransfers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v17 = "-[WCSession onqueue_loadFileTransferProgress]";
    v18 = 2050;
    v19 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s for number of file transfers %{public}ld", buf, 0x16u);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WCSession internalOutstandingFileTransfers](self, "internalOutstandingFileTransfers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[WCSession onqueue_createProgressForFileTransfer:](self, "onqueue_createProgressForFileTransfer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)onqueue_createProgressForFileTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  WCSession *v16;
  id v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDD1768];
  objc_msgSend(v4, "file");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke;
  v14 = &unk_24D661B80;
  v8 = v4;
  v15 = v8;
  v16 = self;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v5, "_addSubscriberForFileURL:withPublishingHandler:", v7, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProgressToken:", v9, v11, v12, v13, v14);
  wc_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[WCSession onqueue_createProgressForFileTransfer:]";
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s Created progress for %{public}@", buf, 0x16u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

id __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IDSSendResourceProgressIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transferIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_2;
    v20[3] = &unk_24D661B08;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    v21 = *(id *)(a1 + 32);
    v22 = v3;
    objc_msgSend(v9, "addOperationWithBlock:", v20);

    objc_destroyWeak(&v23);
  }
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_3;
  v14[3] = &unk_24D661B58;
  v19 = v7;
  v10 = *(_QWORD *)(a1 + 40);
  v15 = v5;
  v16 = v10;
  v11 = v5;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  v17 = *(id *)(a1 + 32);
  v12 = (void *)MEMORY[0x219A05838](v14);

  objc_destroyWeak(&v18);
  return v12;
}

void __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "onqueue_updateProgressForFileTransfer:progress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    wc_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136446466;
      v9 = "-[WCSession onqueue_createProgressForFileTransfer:]_block_invoke_3";
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s Progress unpublished for transfer %{public}@", buf, 0x16u);
    }

    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_42;
    v5[3] = &unk_24D661B30;
    objc_copyWeak(&v7, (id *)(a1 + 56));
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "addOperationWithBlock:", v5);

    objc_destroyWeak(&v7);
  }
}

void __51__WCSession_onqueue_createProgressForFileTransfer___block_invoke_42(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "onqueue_removeProgressForFileTransfer:", *(_QWORD *)(a1 + 32));

}

- (void)onqueue_updateProgressForFileTransfer:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "transferIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136446466;
    v14 = "-[WCSession onqueue_updateProgressForFileTransfer:progress:]";
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s Updating progress for %{public}@", (uint8_t *)&v13, 0x16u);

  }
  if (v6)
  {
    objc_msgSend(v6, "setInternalProgress:", v7);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("internalProgress.userInfo.NSProgressByteCompletedCountKey"), 1, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("internalProgress.finished"), 1, 0);
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, CFSTR("internalProgress.cancelled"), 1, 0);
    -[WCSession onqueue_updateClientProgressForFileTransfer:](self, "onqueue_updateClientProgressForFileTransfer:", v6);
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "internalProgress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136446466;
      v14 = "-[WCSession onqueue_updateProgressForFileTransfer:progress:]";
      v15 = 2112;
      v16 = v11;
      v12 = "%{public}s Added observer for progress %@";
LABEL_8:
      _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(0, "transferIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136446466;
      v14 = "-[WCSession onqueue_updateProgressForFileTransfer:progress:]";
      v15 = 2114;
      v16 = v11;
      v12 = "%{public}s Missing item for publish callback (identifier: %{public}@)";
      goto LABEL_8;
    }
  }

}

- (void)onqueue_removeProgressForFileTransfer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFinished");

  if (v6)
  {
    objc_msgSend(v4, "progressToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    wc_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        v14 = 136446466;
        v15 = "-[WCSession onqueue_removeProgressForFileTransfer:]";
        v16 = 2114;
        v17 = v4;
        _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s Removing progress for transfer %{public}@", (uint8_t *)&v14, 0x16u);
      }

      objc_msgSend(v4, "internalProgress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        wc_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136446210;
          v15 = "-[WCSession onqueue_removeProgressForFileTransfer:]";
          _os_log_impl(&dword_216F21000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s Removing progress observers", (uint8_t *)&v14, 0xCu);
        }

        objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("internalProgress.userInfo.NSProgressByteCompletedCountKey"));
        objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("internalProgress.finished"));
        objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("internalProgress.cancelled"));
      }
      v12 = (void *)MEMORY[0x24BDD1768];
      objc_msgSend(v4, "progressToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_removeSubscriber:", v13);

      objc_msgSend(v4, "setProgressToken:", 0);
    }
    else
    {
      if (v9)
      {
        v14 = 136446466;
        v15 = "-[WCSession onqueue_removeProgressForFileTransfer:]";
        v16 = 2114;
        v17 = v4;
        _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s Missing item to remove (identifier: %{public}@)", (uint8_t *)&v14, 0x16u);
      }

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  NSOperationQueue *workOperationQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  WCSession *v16;

  v8 = a3;
  v9 = a4;
  workOperationQueue = self->_workOperationQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v13[3] = &unk_24D661BA8;
  v14 = v9;
  v15 = v8;
  v16 = self;
  v11 = v8;
  v12 = v9;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v13);

}

void __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke(id *a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v2 = a1[4]) != 0)
  {
    v3 = v2;
    -[NSObject internalProgress](v2, "internalProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IDSSendResourceProgressIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject transferIdentifier](v3, "transferIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v6, "isEqualToString:", v7);

    if ((_DWORD)v5)
    {
      if (objc_msgSend(a1[5], "isEqual:", CFSTR("internalProgress.userInfo.NSProgressByteCompletedCountKey")))
      {
        objc_msgSend(a1[6], "onqueue_updateClientProgressForFileTransfer:", v3);
      }
      else if (objc_msgSend(a1[5], "isEqual:", CFSTR("internalProgress.finished")))
      {
        objc_msgSend(a1[6], "onqueue_handleProgressFinishedForFileTransfer:", v3);
      }
      else if (objc_msgSend(a1[5], "isEqual:", CFSTR("internalProgress.cancelled")))
      {
        wc_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136446466;
          v17 = "-[WCSession observeValueForKeyPath:ofObject:change:context:]_block_invoke";
          v18 = 2112;
          v19 = v6;
          _os_log_impl(&dword_216F21000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s Progress cancelled for identifier %@", (uint8_t *)&v16, 0x16u);
        }

      }
    }

  }
  else
  {
    wc_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1(v3, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)onqueue_updateClientProgressForFileTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WCSession internalOutstandingFileTransfers](self, "internalOutstandingFileTransfers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "internalProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD1170]);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "internalProgress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "byteCompletedCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    wc_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "internalProgress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "internalProgress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138413058;
      v25 = (const char *)v10;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_216F21000, v13, OS_LOG_TYPE_DEFAULT, "Got totalBytes: %@, completedBytes: %@, userInfo: %@, progress: %@", (uint8_t *)&v24, 0x2Au);

    }
    objc_msgSend(v4, "progress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v19 = v18;
    -[NSObject doubleValue](v10, "doubleValue");
    v21 = (uint64_t)(v19 / v20 * (double)objc_msgSend(v17, "totalUnitCount"));
    if (objc_msgSend(v17, "totalUnitCount") < v21)
      v21 = objc_msgSend(v17, "totalUnitCount");
    objc_msgSend(v17, "setCompletedUnitCount:", v21);
    wc_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "transferIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136446722;
      v25 = "-[WCSession onqueue_updateClientProgressForFileTransfer:]";
      v26 = 2114;
      v27 = v23;
      v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_216F21000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s Updated progress for identifier: %{public}@, to %{public}@", (uint8_t *)&v24, 0x20u);

    }
    goto LABEL_11;
  }
  wc_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "transferIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 136446466;
    v25 = "-[WCSession onqueue_updateClientProgressForFileTransfer:]";
    v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s Received progress for identifier: %{public}@, without outstanding tranfer", (uint8_t *)&v24, 0x16u);
LABEL_11:

  }
}

- (void)onqueue_handleProgressFinishedForFileTransfer:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "transferIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = "-[WCSession onqueue_handleProgressFinishedForFileTransfer:]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s Progress finished for identifier %{public}@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v3, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "isFinished") & 1) == 0 && (objc_msgSend(v6, "isCancelled") & 1) == 0)
  {
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446466;
      v9 = "-[WCSession onqueue_handleProgressFinishedForFileTransfer:]";
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s Forcing progress to finished for %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "totalUnitCount"));
  }

}

- (void)sendMessage:(NSDictionary *)message replyHandler:(void *)replyHandler errorHandler:(void *)errorHandler
{
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSDictionary *v14;
  id v15;
  id v16;
  _QWORD block[5];
  NSDictionary *v18;
  id v19;
  id v20;

  v8 = message;
  v9 = replyHandler;
  v10 = errorHandler;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession sendMessage:replyHandler:errorHandler:]", "message");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v11);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v11);
  }
  v13 = _os_activity_create(&dword_216F21000, "sendMessage:replyHandler:errorHandler:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke;
  block[3] = &unk_24D661BF8;
  v19 = v9;
  v20 = v10;
  block[4] = self;
  v18 = v8;
  v14 = v8;
  v15 = v10;
  v16 = v9;
  os_activity_apply(v13, block);

}

void __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  BOOL v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = "YES";
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 48) == 0;
    v15 = "-[WCSession sendMessage:replyHandler:errorHandler:]_block_invoke";
    if (v5)
      v6 = "NO";
    else
      v6 = "YES";
    *(_DWORD *)buf = 136446722;
    v16 = 2080;
    if (!v4)
      v3 = "NO";
    v17 = v6;
    v18 = 2080;
    v19 = v3;
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s hasReplyHandler: %s, hasErrorHandler: %s", buf, 0x20u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 88);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke_56;
  v10[3] = &unk_24D661BD0;
  v10[4] = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v9, "addOperationWithBlock:", v10);

}

void __51__WCSession_sendMessage_replyHandler_errorHandler___block_invoke_56(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "errorIfPreconditionsNotSatisfied");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2
    || (objc_msgSend(*(id *)(a1 + 32), "errorIfNotReachable"), (v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v2, 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v7 = 0;
    WCSerializePayloadDictionary(v3, &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v7;
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "onqueue_sendMessageData:replyHandler:errorHandler:dictionaryMessage:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7010);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v6, 0, *(_QWORD *)(a1 + 56));

    }
  }

}

- (void)sendMessageData:(NSData *)data replyHandler:(void *)replyHandler errorHandler:(void *)errorHandler
{
  NSData *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSData *v14;
  id v15;
  id v16;
  _QWORD block[5];
  NSData *v18;
  id v19;
  id v20;

  v8 = data;
  v9 = replyHandler;
  v10 = errorHandler;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession sendMessageData:replyHandler:errorHandler:]", "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v11);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v11);
  }
  v13 = _os_activity_create(&dword_216F21000, "sendMessageData:replyHandler:errorHandler:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke;
  block[3] = &unk_24D661BF8;
  v19 = v9;
  v20 = v10;
  block[4] = self;
  v18 = v8;
  v14 = v8;
  v15 = v10;
  v16 = v9;
  os_activity_apply(v13, block);

}

void __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  BOOL v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = "YES";
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 48) == 0;
    v15 = "-[WCSession sendMessageData:replyHandler:errorHandler:]_block_invoke";
    if (v5)
      v6 = "NO";
    else
      v6 = "YES";
    *(_DWORD *)buf = 136446722;
    v16 = 2080;
    if (!v4)
      v3 = "NO";
    v17 = v6;
    v18 = 2080;
    v19 = v3;
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s hasReplyHandler: %s, hasErrorHandler: %s", buf, 0x20u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(v7 + 88);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke_59;
  v10[3] = &unk_24D661BD0;
  v10[4] = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v9, "addOperationWithBlock:", v10);

}

void __55__WCSession_sendMessageData_replyHandler_errorHandler___block_invoke_59(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "errorIfPreconditionsNotSatisfied");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 || (objc_msgSend(*(id *)(a1 + 32), "errorIfNotReachable"), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (id)v2;
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v2, 0, *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_sendMessageData:replyHandler:errorHandler:dictionaryMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
  }
}

- (void)onqueue_sendMessageData:(id)a3 replyHandler:(id)a4 errorHandler:(id)a5 dictionaryMessage:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  __objc2_class **v15;
  void *v16;
  id v17;
  void *v18;
  WCMessageRequest *v19;
  void *v20;
  WCMessageRequest *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  WCSession *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v6 = a6;
  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  if (WCIsDataAcceptableSizeForType(0, v10))
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 | v12)
    {
      v15 = off_24D6615C8;
      if (!v6)
        v15 = off_24D6615C0;
      v16 = (void *)objc_msgSend(objc_alloc(*v15), "initWithIdentifier:responseHandler:errorHandler:", v14, v11, v12);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentMessages, "setObject:forKeyedSubscript:", v16, v14);
      if (v11)
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke;
        v30[3] = &unk_24D661BA8;
        v17 = v16;
        v31 = v17;
        v32 = self;
        v33 = v14;
        -[WCSession createAndStartTimerOnWorkQueueWithHandler:](self, "createAndStartTimerOnWorkQueueWithHandler:", v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimeoutTimer:", v18);

      }
    }
    v19 = [WCMessageRequest alloc];
    -[WCSession pairingID](self, "pairingID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WCMessageRequest initWithPairingID:identifier:data:dictionaryMessage:expectsResponse:](v19, "initWithPairingID:identifier:data:dictionaryMessage:expectsResponse:", v20, v14, v10, v6, v11 != 0);

    wc_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend(v10, "length");
      *(_DWORD *)buf = 136446722;
      v35 = "-[WCSession onqueue_sendMessageData:replyHandler:errorHandler:dictionaryMessage:]";
      v36 = 2048;
      v37 = v23;
      v38 = 2114;
      v39 = v14;
      _os_log_impl(&dword_216F21000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s size: %ld, messageID: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    -[WCSession queueManager](self, "queueManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_64;
    v27[3] = &unk_24D661C20;
    v27[4] = self;
    objc_copyWeak(&v29, (id *)buf);
    v25 = v14;
    v28 = v25;
    objc_msgSend(v24, "sendMessage:completionHandler:", v21, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7009);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession _onqueue_notifyOfMessageError:messageID:withErrorHandler:](self, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v26, 0, v12);

  }
}

void __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "timeoutTimer");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v2);

  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7012);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "errorHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v4, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentMessages");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v8);

  }
}

void __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_2;
  v6[3] = &unk_24D661B08;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v5 = v3;
  v7 = v5;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addOperationWithBlock:", v6);

  objc_destroyWeak(&v9);
}

void __81__WCSession_onqueue_sendMessageData_replyHandler_errorHandler_dictionaryMessage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "onqueue_handleMessageCompletionWithError:withMessageID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)updateApplicationContext:(NSDictionary *)applicationContext error:(NSError *)error
{
  NSDictionary *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSDictionary *v10;
  char v11;
  _QWORD block[5];
  NSDictionary *v14;
  uint64_t *v15;
  NSError **v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = applicationContext;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession updateApplicationContext:error:]", "applicationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v7);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v7);
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = _os_activity_create(&dword_216F21000, "updateApplicationContext:error:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WCSession_updateApplicationContext_error___block_invoke;
  block[3] = &unk_24D661C88;
  block[4] = self;
  v14 = v6;
  v15 = &v17;
  v16 = error;
  v10 = v6;
  os_activity_apply(v9, block);
  v11 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __44__WCSession_updateApplicationContext_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  char v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v23 = "-[WCSession updateApplicationContext:error:]_block_invoke";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.facebook.Messenger"));

  objc_msgSend(*(id *)(a1 + 32), "errorIfPreconditionsNotSatisfied");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6 && (v5 & 1) == 0)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "applicationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "isEqual:", v9);

    if ((v8 & 1) == 0)
      goto LABEL_6;
LABEL_12:
    wc_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216F21000, v11, OS_LOG_TYPE_DEFAULT, "no change", buf, 2u);
    }
    goto LABEL_17;
  }
  if (v6)
    goto LABEL_12;
LABEL_6:
  v10 = *(void **)(a1 + 40);
  v21 = v7;
  WCSerializePayloadDictionary(v10, &v21);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v21;

  if (!v11)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = 7010;
LABEL_16:
    objc_msgSend(v17, "wcErrorWithCode:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v12 = v7;
    goto LABEL_18;
  }
  if (!WCIsDataAcceptableSizeForType(1, v11))
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = 7009;
    goto LABEL_16;
  }
  wc_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[NSObject length](v11, "length");
    *(_DWORD *)buf = 136446466;
    v23 = "-[WCSession updateApplicationContext:error:]_block_invoke";
    v24 = 2048;
    v25 = v14;
    _os_log_impl(&dword_216F21000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s size: %ld", buf, 0x16u);
  }

  +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateApplicationContext:clientPairingID:errorHandler:", v11, v16, &__block_literal_global);

  objc_msgSend(*(id *)(a1 + 32), "storeAppContext:withAppContextData:", *(_QWORD *)(a1 + 40), v11);
LABEL_18:

  if (v12)
  {
    wc_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __44__WCSession_updateApplicationContext_error___block_invoke_cold_1();

    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v20;
  if (*(_QWORD *)(a1 + 56))
    **(_QWORD **)(a1 + 56) = objc_retainAutorelease(v12);

}

void __44__WCSession_updateApplicationContext_error___block_invoke_69(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    wc_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__WCSession_updateApplicationContext_error___block_invoke_69_cold_1();

  }
}

- (WCSessionFileTransfer)transferFile:(NSURL *)file metadata:(NSDictionary *)metadata
{
  NSURL *v6;
  NSDictionary *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSDictionary *v11;
  NSURL *v12;
  id v13;
  _QWORD block[5];
  NSURL *v16;
  NSDictionary *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = file;
  v7 = metadata;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession transferFile:metadata:]", "file");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v8);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v8);
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v10 = _os_activity_create(&dword_216F21000, "transferFile:metadata:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__WCSession_transferFile_metadata___block_invoke;
  block[3] = &unk_24D661D00;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v18 = &v19;
  v11 = v7;
  v12 = v6;
  os_activity_apply(v10, block);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return (WCSessionFileTransfer *)v13;
}

void __35__WCSession_transferFile_metadata___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  WCSessionFile *v4;
  WCSessionFileTransfer *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  pid_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v30 = "-[WCSession transferFile:metadata:]_block_invoke";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "errorIfPreconditionsNotSatisfied");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[WCSessionFile initWithFileURL:]([WCSessionFile alloc], "initWithFileURL:", *(_QWORD *)(a1 + 40));
  v5 = -[WCSessionFileTransfer initWithFile:]([WCSessionFileTransfer alloc], "initWithFile:", v4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (v3
    || *(_QWORD *)(a1 + 48)
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "file"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = *(_QWORD *)(a1 + 48),
        v28 = 0,
        objc_msgSend(v10, "updateUserInfo:error:", v11, &v28),
        v3 = v28,
        v10,
        v3))
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  else
  {
    if ((WCIsFileDirectory(*(void **)(a1 + 40)) & 1) != 0)
    {
      v12 = *(void **)(a1 + 32);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = 7008;
    }
    else
    {
      v15 = *(void **)(a1 + 40);
      v16 = getpid();
      WCCheckFileAndCreateExtensionForProcess(v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTransferring:", 1);
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(void **)(a1 + 40);
        v21 = *(void **)(v19 + 88);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __35__WCSession_transferFile_metadata___block_invoke_72;
        v24[3] = &unk_24D661D00;
        v24[4] = v19;
        v22 = v20;
        v23 = *(_QWORD *)(a1 + 56);
        v26 = v18;
        v27 = v23;
        v25 = v22;
        v3 = v18;
        objc_msgSend(v21, "addOperationWithBlock:", v24);

        goto LABEL_6;
      }
      v12 = *(void **)(a1 + 32);
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = 7013;
    }
    objc_msgSend(v13, "wcErrorWithCode:", v14);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v8 = v12;
  }
  objc_msgSend(v8, "notifyOfFileError:withFileTransfer:", v3, v9);
LABEL_6:

}

void __35__WCSession_transferFile_metadata___block_invoke_72(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[6];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "fileSizeFromURL:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 136446722;
    v21 = "-[WCSession transferFile:metadata:]_block_invoke";
    v22 = 2114;
    v23 = v4;
    v24 = 2048;
    v25 = objc_msgSend(v2, "integerValue");
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s fileTransfer: %{public}@ fileSize: %ld", buf, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "file");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileSize:", v2);

  v6 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setTransferDate:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "file");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileHandleForReadingAtPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "file");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFileDescriptor:", v11);

  objc_msgSend(*(id *)(a1 + 32), "onqueue_addOutstandingFileTransfer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __35__WCSession_transferFile_metadata___block_invoke_75;
  v18[3] = &unk_24D661CD8;
  v17 = *(_QWORD *)(a1 + 56);
  v18[4] = *(_QWORD *)(a1 + 32);
  v18[5] = v17;
  objc_copyWeak(&v19, (id *)buf);
  objc_msgSend(v13, "transferFile:sandboxToken:clientPairingID:errorHandler:", v15, v14, v16, v18);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

void __35__WCSession_transferFile_metadata___block_invoke_75(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __35__WCSession_transferFile_metadata___block_invoke_2;
  v8[3] = &unk_24D661CB0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v4 + 88);
  v8[1] = 3221225472;
  v8[4] = v4;
  v10 = v5;
  v7 = v3;
  v9 = v7;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_msgSend(v6, "addOperationWithBlock:", v8);
  objc_destroyWeak(&v11);

}

void __35__WCSession_transferFile_metadata___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "internalOutstandingFileTransfers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "transferIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v6 = WeakRetained;
    if (v4)
      objc_msgSend(WeakRetained, "onqueue_notifyOfFileError:withFileTransfer:", *(_QWORD *)(a1 + 40), v7);
    else
      objc_msgSend(WeakRetained, "onqueue_createProgressForFileTransfer:", v7);

  }
}

- (void)cancelFileTransfer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSOperationQueue *workOperationQueue;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[WCSession cancelFileTransfer:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  -[WCSession errorIfPreconditionsNotSatisfied](self, "errorIfPreconditionsNotSatisfied");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    workOperationQueue = self->_workOperationQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__WCSession_cancelFileTransfer___block_invoke;
    v8[3] = &unk_24D661D28;
    v8[4] = self;
    v9 = v4;
    -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v8);

  }
}

void __32__WCSession_cancelFileTransfer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "internalOutstandingFileTransfers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "onqueue_cancelFileTransfer:", *(_QWORD *)(a1 + 40));
}

- (void)onqueue_cancelFileTransfer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "setTransferring:", 0);
  -[WCSession onqueue_removeOutstandingFileTransfer:](self, "onqueue_removeOutstandingFileTransfer:", v4);
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "transferIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136446466;
    v10 = "-[WCSession onqueue_cancelFileTransfer:]";
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s transferIdentifier: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelSendWithIdentifier:", v8);

}

- (WCSessionUserInfoTransfer)transferUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSDictionary *v8;
  id v9;
  _QWORD block[5];
  NSDictionary *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = userInfo;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession transferUserInfo:]", "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v5);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v5);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v7 = _os_activity_create(&dword_216F21000, "transferUserInfo:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__WCSession_transferUserInfo___block_invoke;
  block[3] = &unk_24D661D78;
  v12 = v4;
  v13 = &v14;
  block[4] = self;
  v8 = v4;
  os_activity_apply(v7, block);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return (WCSessionUserInfoTransfer *)v9;
}

void __30__WCSession_transferUserInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  _QWORD v10[5];
  __int128 v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[WCSession transferUserInfo:]_block_invoke";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  v3 = objc_opt_new();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 88);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __30__WCSession_transferUserInfo___block_invoke_78;
  v10[3] = &unk_24D661D50;
  v10[4] = v6;
  v9 = *(_OWORD *)(a1 + 40);
  v8 = (id)v9;
  v11 = v9;
  objc_msgSend(v7, "addOperationWithBlock:", v10);

}

uint64_t __30__WCSession_transferUserInfo___block_invoke_78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_transferUserInfo:withUserInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
}

- (WCSessionUserInfoTransfer)transferCurrentComplicationUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSDictionary *v8;
  id v9;
  _QWORD block[5];
  NSDictionary *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = userInfo;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession transferCurrentComplicationUserInfo:]", "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v5);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v5);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v7 = _os_activity_create(&dword_216F21000, "sendMessage:replyHandler:errorHandler:", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WCSession_transferCurrentComplicationUserInfo___block_invoke;
  block[3] = &unk_24D661D78;
  v12 = v4;
  v13 = &v14;
  block[4] = self;
  v8 = v4;
  os_activity_apply(v7, block);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return (WCSessionUserInfoTransfer *)v9;
}

void __49__WCSession_transferCurrentComplicationUserInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  WCSessionUserInfoTransfer *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v12;
  _QWORD v13[5];
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[WCSession transferCurrentComplicationUserInfo:]_block_invoke";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  v3 = [WCSessionUserInfoTransfer alloc];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WCSessionUserInfoTransfer initWithComplicationTransferIdentifier:](v3, "initWithComplicationTransferIdentifier:", v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 88);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __49__WCSession_transferCurrentComplicationUserInfo___block_invoke_79;
  v13[3] = &unk_24D661D50;
  v13[4] = v9;
  v12 = *(_OWORD *)(a1 + 40);
  v11 = (id)v12;
  v14 = v12;
  objc_msgSend(v10, "addOperationWithBlock:", v13);

}

uint64_t __49__WCSession_transferCurrentComplicationUserInfo___block_invoke_79(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onqueue_setCurrentComplicationUserInfoTransfer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_transferUserInfo:withUserInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
}

- (void)cancelUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSOperationQueue *workOperationQueue;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[WCSession cancelUserInfo:]";
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  -[WCSession errorIfPreconditionsNotSatisfied](self, "errorIfPreconditionsNotSatisfied");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    workOperationQueue = self->_workOperationQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__WCSession_cancelUserInfo___block_invoke;
    v8[3] = &unk_24D661D28;
    v8[4] = self;
    v9 = v4;
    -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v8);

  }
}

void __28__WCSession_cancelUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "internalOutstandingUserInfoTransfers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "onqueue_cancelUserInfo:", *(_QWORD *)(a1 + 40));
}

- (void)onqueue_cancelUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WCSession onqueue_removeOutstandingUserInfoTransfer:](self, "onqueue_removeOutstandingUserInfoTransfer:", v4);
  if (objc_msgSend(v4, "isCurrentComplicationInfo"))
  {
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "complicationTransferIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136446466;
      v14 = "-[WCSession onqueue_cancelUserInfo:]";
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s complicationTransferIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "complicationTransferIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelSendWithIdentifier:", v8);

  }
  wc_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "transferIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136446466;
    v14 = "-[WCSession onqueue_cancelUserInfo:]";
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_216F21000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s transferIdentifier: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancelSendWithIdentifier:", v12);

}

- (void)onqueue_transferUserInfo:(id)a3 withUserInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v22 = "-[WCSession onqueue_transferUserInfo:withUserInfo:]";
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  -[WCSession errorIfPreconditionsNotSatisfied](self, "errorIfPreconditionsNotSatisfied");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 || (v20 = 0, v10 = objc_msgSend(v6, "updateUserInfo:error:", v7, &v20), v9 = v20, !v10))
  {
    -[WCSession onqueue_notifyOfUserInfoError:withUserInfoTransfer:](self, "onqueue_notifyOfUserInfoError:withUserInfoTransfer:", v9, v6);
  }
  else
  {
    -[WCSession onqueue_addOutstandingUserInfoTransfer:](self, "onqueue_addOutstandingUserInfoTransfer:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[WCSession fileSizeFromURL:](self, "fileSizeFromURL:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      wc_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "integerValue");
        *(_DWORD *)buf = 136446978;
        v22 = "-[WCSession onqueue_transferUserInfo:withUserInfo:]";
        v23 = 2114;
        v24 = v6;
        v25 = 2114;
        v26 = v14;
        v27 = 2048;
        v28 = v15;
        _os_log_impl(&dword_216F21000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s transferUserInfo: %{public}@, withURL: %{public}@ fileSize: %ld", buf, 0x2Au);

      }
      +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCSession pairingID](self, "pairingID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke;
      v18[3] = &unk_24D661A90;
      v18[4] = self;
      v19 = v6;
      objc_msgSend(v16, "transferUserInfo:withURL:clientPairingID:errorHandler:", v19, v11, v17, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7001);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCSession onqueue_notifyOfUserInfoError:withUserInfoTransfer:](self, "onqueue_notifyOfUserInfoError:withUserInfoTransfer:", v12, v6);
    }

  }
}

void __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(v4 + 88);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke_2;
    v7[3] = &unk_24D661BA8;
    v7[4] = v4;
    v8 = v5;
    v9 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __51__WCSession_onqueue_transferUserInfo_withUserInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalOutstandingUserInfoTransfers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "transferIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_notifyOfUserInfoError:withUserInfoTransfer:", *(_QWORD *)(a1 + 48), v5);
    v4 = v5;
  }

}

- (void)onqueue_sendResponseDictionary:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[WCSession onqueue_sendResponseDictionary:identifier:]";
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  v11 = 0;
  WCSerializePayloadDictionary(v7, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WCSession onqueue_sendResponseData:identifier:dictionaryMessage:](self, "onqueue_sendResponseData:identifier:dictionaryMessage:", v9, v6, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7010);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession _onqueue_sendResponseError:identifier:dictionaryMessage:](self, "_onqueue_sendResponseError:identifier:dictionaryMessage:", v10, v6, 1);

  }
}

- (void)onqueue_sendResponseData:(id)a3 identifier:(id)a4 dictionaryMessage:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  WCMessageResponse *v10;
  void *v11;
  WCMessageResponse *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  WCMessageResponse *v17;
  void *v18;
  _QWORD v19[4];
  WCMessageResponse *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (WCIsDataAcceptableSizeForType(0, v8))
  {
    v10 = [WCMessageResponse alloc];
    -[WCSession pairingID](self, "pairingID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WCMessage initWithPairingID:identifier:data:dictionaryMessage:](v10, "initWithPairingID:identifier:data:dictionaryMessage:", v11, v9, v8, v5);

    wc_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v8, "length");
      v15 = "NO";
      v22 = "-[WCSession onqueue_sendResponseData:identifier:dictionaryMessage:]";
      v23 = 2048;
      *(_DWORD *)buf = 136446978;
      v24 = v14;
      if (v5)
        v15 = "YES";
      v25 = 2114;
      v26 = v9;
      v27 = 2080;
      v28 = v15;
      _os_log_impl(&dword_216F21000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s responseDataSize: %ld, identifier: %{public}@, isDictionaryMessage: %s", buf, 0x2Au);
    }

    -[WCSession queueManager](self, "queueManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke;
    v19[3] = &unk_24D661DA0;
    v20 = v12;
    v17 = v12;
    objc_msgSend(v16, "sendMessage:completionHandler:", v17, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7009);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession _onqueue_sendResponseError:identifier:dictionaryMessage:](self, "_onqueue_sendResponseError:identifier:dictionaryMessage:", v18, v9, v5);

  }
}

void __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  wc_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136446466;
    v8 = "-[WCSession onqueue_sendResponseData:identifier:dictionaryMessage:]_block_invoke";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s succeeded for response %{public}@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)_onqueue_sendResponseError:(id)a3 identifier:(id)a4 dictionaryMessage:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  WCMessageResponse *v11;
  void *v12;
  WCMessageResponse *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  wc_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[WCSession _onqueue_sendResponseError:identifier:dictionaryMessage:].cold.1();

  v11 = [WCMessageResponse alloc];
  -[WCSession pairingID](self, "pairingID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WCMessage initWithPairingID:identifier:data:dictionaryMessage:](v11, "initWithPairingID:identifier:data:dictionaryMessage:", v12, v9, 0, v5);

  -[WCMessageResponse setError:](v13, "setError:", v8);
  -[WCSession queueManager](self, "queueManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke;
  v16[3] = &unk_24D661DA0;
  v17 = v9;
  v15 = v9;
  objc_msgSend(v14, "sendMessage:completionHandler:", v13, v16);

}

void __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  wc_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 136446466;
    v8 = "-[WCSession _onqueue_sendResponseError:identifier:dictionaryMessage:]_block_invoke";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ suceeded", (uint8_t *)&v7, 0x16u);
  }

}

- (void)storeAppContext:(id)a3 withAppContextData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSOperationQueue *workOperationQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[WCSession storeAppContext:withAppContextData:]";
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__WCSession_storeAppContext_withAppContextData___block_invoke;
  v12[3] = &unk_24D661BA8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v12);

}

void __48__WCSession_storeAppContext_withAppContextData___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setApplicationContext:", *(_QWORD *)(a1 + 40));
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "persistAppContextData:received:", *(_QWORD *)(a1 + 48), 0);

  }
}

- (void)storeReceivedAppContext:(id)a3 withAppContextData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSOperationQueue *workOperationQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[WCSession storeReceivedAppContext:withAppContextData:]";
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__WCSession_storeReceivedAppContext_withAppContextData___block_invoke;
  v12[3] = &unk_24D661BA8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v12);

}

void __56__WCSession_storeReceivedAppContext_withAppContextData___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setReceivedApplicationContext:", *(_QWORD *)(a1 + 40));
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "persistAppContextData:received:", *(_QWORD *)(a1 + 48), 1);

  }
}

- (NSDictionary)applicationContext
{
  void *v3;
  NSOperationQueue *workOperationQueue;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = (id)MEMORY[0x24BDBD1B8];
  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__WCSession_applicationContext__block_invoke;
  v8[3] = &unk_24D661AE0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "addExecutionBlock:", v8);
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperations:waitUntilFinished:](workOperationQueue, "addOperations:waitUntilFinished:", v5, 1);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v6;
}

void __31__WCSession_applicationContext__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (NSDictionary)receivedApplicationContext
{
  void *v3;
  NSOperationQueue *workOperationQueue;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__WCSession_receivedApplicationContext__block_invoke;
  v8[3] = &unk_24D661AE0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v3, "addExecutionBlock:", v8);
  workOperationQueue = self->_workOperationQueue;
  v15[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperations:waitUntilFinished:](workOperationQueue, "addOperations:waitUntilFinished:", v5, 1);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v6;
}

void __39__WCSession_receivedApplicationContext__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)onqueue_loadAppContexts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadAppContextReceived:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession setApplicationContext:](self, "setApplicationContext:", v4);

  +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadAppContextReceived:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession setReceivedApplicationContext:](self, "setReceivedApplicationContext:", v5);

}

- (void)xpcConnectionInterrupted
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "-[WCSession xpcConnectionInterrupted]";
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v5, 0xCu);
  }

  -[WCSession queueManager](self, "queueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allowMessageSending");

  -[WCSession setConnectionWasInterrupted:](self, "setConnectionWasInterrupted:", 1);
}

- (void)handleActiveDeviceSwitchStarted
{
  NSOperationQueue *workOperationQueue;
  _QWORD v3[5];

  workOperationQueue = self->_workOperationQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__WCSession_handleActiveDeviceSwitchStarted__block_invoke;
  v3[3] = &unk_24D661AB8;
  v3[4] = self;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v3);
}

void __44__WCSession_handleActiveDeviceSwitchStarted__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  wc_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[WCSession handleActiveDeviceSwitchStarted]_block_invoke";
    v7 = 2114;
    v8 = v2;
    _os_log_impl(&dword_216F21000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s new switch task: %{public}@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "switchTasksQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v2);

  objc_msgSend(*(id *)(a1 + 32), "onqueue_startNextDeviceSwitch");
}

- (void)xpcConnectionRestoredWithState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  WCSession *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "-[WCSession xpcConnectionRestoredWithState:]";
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, v6);
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__WCSession_xpcConnectionRestoredWithState___block_invoke;
  v11[3] = &unk_24D661B08;
  objc_copyWeak(&v14, (id *)buf);
  v8 = v4;
  v12 = v8;
  v13 = self;
  objc_msgSend(v6, "addExecutionBlock:", v11);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __44__WCSession_xpcConnectionRestoredWithState___block_invoke_81;
  v10[3] = &unk_24D661AB8;
  v10[4] = self;
  objc_msgSend(v6, "setCompletionBlock:", v10);
  -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addOperation:", v6);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __44__WCSession_xpcConnectionRestoredWithState___block_invoke(id *a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  id *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(a1[4], "pairingID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    v5 = a1 + 5;
    objc_msgSend(v6, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      wc_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __44__WCSession_xpcConnectionRestoredWithState___block_invoke_cold_1();

    }
    objc_msgSend(*v5, "pairingID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v5, "setHasContentPending:", v10 != 0);

    wc_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(*v5, "hasContentPending");
      v13 = "NO";
      if (v12)
        v13 = "YES";
      v14 = 136446466;
      v15 = "-[WCSession xpcConnectionRestoredWithState:]_block_invoke";
      v16 = 2080;
      v17 = v13;
      _os_log_impl(&dword_216F21000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s hasContentPending: %s", (uint8_t *)&v14, 0x16u);
    }

  }
}

uint64_t __44__WCSession_xpcConnectionRestoredWithState___block_invoke_81(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 88);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__WCSession_xpcConnectionRestoredWithState___block_invoke_2;
  v4[3] = &unk_24D661AB8;
  v4[4] = v1;
  return objc_msgSend(v2, "addOperationWithBlock:", v4);
}

void __44__WCSession_xpcConnectionRestoredWithState___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "onqueue_dequeueContent");
}

- (void)handleMessageSendingAllowed
{
  id v2;

  -[WCSession queueManager](self, "queueManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allowMessageSending");

}

- (void)handleRequest:(id)a3
{
  id v4;
  NSOperationQueue *workOperationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WCSession *v9;

  v4 = a3;
  workOperationQueue = self->_workOperationQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__WCSession_handleRequest___block_invoke;
  v7[3] = &unk_24D661D28;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v7);

}

void __27__WCSession_handleRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 8), "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isDictionaryMessage");
    v9 = a1 + 32;
    v8 = *(void **)(a1 + 32);
    v7 = *(void **)(v9 + 8);
    objc_msgSend(v8, "pairingID");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v7, "onqueue_handleDictionaryMessageRequest:withPairingID:", v8, v11);
    else
      objc_msgSend(v7, "onqueue_handleDataMessageRequest:withPairingID:", v8, v11);

  }
  else
  {
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __27__WCSession_handleRequest___block_invoke_cold_1();

  }
}

- (void)onqueue_handleDictionaryMessageRequest:(id)a3 withPairingID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  WCSession *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v26 = "-[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:]";
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:]", "pairingID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:].cold.1(v9);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v9);
  }
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  WCDeserializePayloadData(v12, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v24;

  if (v14)
  {
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession _onqueue_sendResponseError:identifier:dictionaryMessage:](self, "_onqueue_sendResponseError:identifier:dictionaryMessage:", v14, v15, 1);
  }
  else
  {
    v15 = (void *)objc_opt_new();
    objc_initWeak((id *)buf, v15);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke;
    v17[3] = &unk_24D661E18;
    objc_copyWeak(&v23, (id *)buf);
    v18 = v7;
    v19 = self;
    v20 = v6;
    v21 = v11;
    v22 = v13;
    objc_msgSend(v15, "addExecutionBlock:", v17);
    -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v15);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  void *v5;
  id *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;

  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v4 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v4 & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "isEqual:", v7);

    if ((v5 & 1) == 0)
    {
      wc_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_2(a1 + 32, a1 + 40);

    }
    if (objc_msgSend(*(id *)(a1 + 48), "expectsResponse")
      && (objc_msgSend(*v6, "delegate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 40), "currentMessageIdentifiersAwaitingReply");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", *(_QWORD *)(a1 + 56));

      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 64);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_85;
      v24[3] = &unk_24D661DF0;
      objc_copyWeak(&v28, v2);
      v15 = *(id *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      v25 = v15;
      v26 = v16;
      v27 = *(id *)(a1 + 56);
      objc_msgSend(v12, "session:didReceiveMessage:replyHandler:", v13, v14, v24);

      objc_destroyWeak(&v28);
    }
    else if ((objc_msgSend(*(id *)(a1 + 48), "expectsResponse") & 1) != 0
           || (objc_msgSend(*v6, "delegate"),
               v17 = (void *)objc_claimAutoreleasedReturnValue(),
               v18 = objc_opt_respondsToSelector(),
               v17,
               (v18 & 1) == 0))
    {
      wc_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_1((id *)(a1 + 40));

      v21 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7014);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_onqueue_sendResponseError:identifier:dictionaryMessage:", v22, v23, 1);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "session:didReceiveMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

    }
  }
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_85(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession onqueue_handleDictionaryMessageRequest:withPairingID:]_block_invoke", "replyMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v4);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v4);
  }
  v6 = (void *)MEMORY[0x24BDD1478];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_87;
  v13[3] = &unk_24D661DC8;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v3;
  v17 = v10;
  objc_msgSend(v6, "blockOperationWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

  objc_destroyWeak(&v18);
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_87(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_87_cold_2(a1 + 32, a1 + 40);

    }
    objc_msgSend(*(id *)(a1 + 40), "currentMessageIdentifiersAwaitingReply");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 48));

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "currentMessageIdentifiersAwaitingReply");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 48));

      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 88);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_88;
      v13[3] = &unk_24D661BA8;
      v13[4] = v10;
      v14 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v11, "addOperationWithBlock:", v13);

    }
    else
    {
      wc_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_87_cold_1();

    }
  }
}

uint64_t __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_sendResponseDictionary:identifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)onqueue_handleDataMessageRequest:(id)a3 withPairingID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  WCSession *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[WCSession onqueue_handleDataMessageRequest:withPairingID:]";
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_216F21000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession onqueue_handleDataMessageRequest:withPairingID:]", "pairingID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[WCSession onqueue_handleDataMessageRequest:withPairingID:].cold.1(v9);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v9);
  }
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_initWeak((id *)buf, v12);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke;
  v17[3] = &unk_24D661DC8;
  objc_copyWeak(&v22, (id *)buf);
  v13 = v7;
  v18 = v13;
  v19 = self;
  v14 = v6;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  objc_msgSend(v12, "addExecutionBlock:", v17);
  -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperation:", v12);

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;
  id *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v2 = a1 + 8;
  WeakRetained = objc_loadWeakRetained(a1 + 8);
  v4 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v4 & 1) == 0)
  {
    v5 = a1[4];
    v6 = a1 + 5;
    objc_msgSend(a1[5], "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "isEqual:", v7);

    if ((v5 & 1) == 0)
    {
      wc_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_2((uint64_t)(a1 + 4), (uint64_t)(a1 + 5));

    }
    if (objc_msgSend(a1[6], "expectsResponse")
      && (objc_msgSend(*v6, "delegate"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      objc_msgSend(a1[5], "currentMessageIdentifiersAwaitingReply");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", a1[7]);

      objc_msgSend(a1[5], "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = a1[5];
      objc_msgSend(a1[6], "data");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_94;
      v26[3] = &unk_24D661E40;
      objc_copyWeak(&v31, v2);
      v15 = a1[4];
      v16 = a1[5];
      v27 = v15;
      v28 = v16;
      v29 = a1[7];
      v30 = a1[6];
      objc_msgSend(v12, "session:didReceiveMessageData:replyHandler:", v13, v14, v26);

      objc_destroyWeak(&v31);
    }
    else if ((objc_msgSend(a1[6], "expectsResponse") & 1) != 0
           || (objc_msgSend(*v6, "delegate"),
               v17 = (void *)objc_claimAutoreleasedReturnValue(),
               v18 = objc_opt_respondsToSelector(),
               v17,
               (v18 & 1) == 0))
    {
      wc_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_1(a1 + 5);

      v23 = a1[5];
      objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7014);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_onqueue_sendResponseError:identifier:dictionaryMessage:", v24, v25, 0);

    }
    else
    {
      objc_msgSend(a1[5], "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = a1[5];
      objc_msgSend(a1[6], "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "session:didReceiveMessageData:", v20, v21);

    }
  }
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession onqueue_handleDataMessageRequest:withPairingID:]_block_invoke", "replyMessageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v4);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v4);
  }
  v6 = (void *)MEMORY[0x24BDD1478];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_96;
  v13[3] = &unk_24D661E18;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v3;
  v17 = v10;
  v18 = *(id *)(a1 + 56);
  objc_msgSend(v6, "blockOperationWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

  objc_destroyWeak(&v19);
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_96(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_96_cold_2(a1 + 32, a1 + 40);

    }
    objc_msgSend(*(id *)(a1 + 40), "currentMessageIdentifiersAwaitingReply");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 48));

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "currentMessageIdentifiersAwaitingReply");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 48));

      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 88);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_97;
      v13[3] = &unk_24D661BA8;
      v13[4] = v10;
      v14 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 64);
      objc_msgSend(v11, "addOperationWithBlock:", v13);

    }
    else
    {
      wc_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_96_cold_1();

    }
  }
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_97(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "onqueue_sendResponseData:identifier:dictionaryMessage:", v2, v3, 0);

}

- (void)handleResponse:(id)a3
{
  id v4;
  NSObject *v5;
  NSOperationQueue *workOperationQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  WCSession *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[WCSession handleResponse:]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  workOperationQueue = self->_workOperationQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __28__WCSession_handleResponse___block_invoke;
  v8[3] = &unk_24D661D28;
  v9 = v4;
  v10 = self;
  v7 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v8);

}

void __28__WCSession_handleResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  int v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 8), "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isDictionaryMessage");
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD **)(a1 + 40);
    v9 = (void *)v7[12];
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pairingID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v7, "onqueue_handleResponseDictionary:record:withPairingID:", v8, v11, v12);
    else
      objc_msgSend(v7, "onqueue_handleResponseData:record:withPairingID:", v8, v11, v12);

    v14 = *(void **)(a1 + 32);
    v15 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
    objc_msgSend(v14, "identifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v16);

  }
  else
  {
    wc_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __28__WCSession_handleResponse___block_invoke_cold_1();

  }
}

- (void)onqueue_handleResponseDictionary:(id)a3 record:(id)a4 withPairingID:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  WCSession *v28;
  id v29;
  id v30;
  id v31;
  id location;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "responseHandler");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v8, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "timeoutTimer");
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v14);

      objc_msgSend(v8, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      WCDeserializePayloadData(v15, &v33);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v33;

      if (v16)
      {
        v18 = (void *)objc_opt_new();
        objc_initWeak(&location, v18);
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke;
        v26[3] = &unk_24D661DC8;
        objc_copyWeak(&v31, &location);
        v27 = v10;
        v28 = self;
        v29 = v9;
        v30 = v16;
        objc_msgSend(v18, "addExecutionBlock:", v26);
        -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addOperation:", v18);

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7010);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WCSession _onqueue_notifyOfMessageError:messageID:withErrorHandler:](self, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v18, v20, v21);

      }
    }
  }
  objc_msgSend(v8, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v8, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession _onqueue_notifyOfMessageError:messageID:withErrorHandler:](self, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v23, v24, v25);

  }
}

void __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke_cold_1(a1 + 32, a1 + 40);

    }
    objc_msgSend(*(id *)(a1 + 48), "responseHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, *(_QWORD *)(a1 + 56));

  }
}

- (void)onqueue_handleResponseData:(id)a3 record:(id)a4 withPairingID:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  WCSession *v26;
  id v27;
  id v28;
  id v29;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "responseHandler");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v8, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "timeoutTimer");
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_source_cancel(v14);

      v15 = (void *)objc_opt_new();
      objc_initWeak(&location, v15);
      v21 = MEMORY[0x24BDAC760];
      v22 = 3221225472;
      v23 = __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke;
      v24 = &unk_24D661DC8;
      objc_copyWeak(&v29, &location);
      v25 = v10;
      v26 = self;
      v27 = v9;
      v28 = v8;
      objc_msgSend(v15, "addExecutionBlock:", &v21);
      -[WCSession delegateOperationQueue](self, "delegateOperationQueue", v21, v22, v23, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addOperation:", v15);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);

    }
  }
  objc_msgSend(v8, "error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "error");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession _onqueue_notifyOfMessageError:messageID:withErrorHandler:](self, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v18, v19, v20);

  }
}

void __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke_cold_1(a1 + 32, a1 + 40);

    }
    objc_msgSend(*(id *)(a1 + 48), "responseHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v8);

  }
}

- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WCSession queueManager](self, "queueManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleSentMessageWithIdentifier:error:", v7, v6);

}

- (void)handleApplicationContextWithPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSOperationQueue *workOperationQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WCSession *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[WCSession handleApplicationContextWithPairingID:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession handleApplicationContextWithPairingID:]", "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v6);
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__WCSession_handleApplicationContextWithPairingID___block_invoke;
  v10[3] = &unk_24D661D28;
  v11 = v4;
  v12 = self;
  v9 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v10);

}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id location;
  id v22;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairingID");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:") & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

    if ((_DWORD)v3)
    {
      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loadAppContextDataFromInbox");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v22 = 0;
        WCDeserializePayloadData(v7, &v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v22;
        if (v8)
        {
          v10 = objc_opt_new();
          objc_initWeak(&location, v10);
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2;
          v15[3] = &unk_24D661DC8;
          objc_copyWeak(&v20, &location);
          v11 = *(id *)(a1 + 32);
          v12 = *(_QWORD *)(a1 + 40);
          v16 = v11;
          v17 = v12;
          v18 = v8;
          v19 = v7;
          -[NSObject addExecutionBlock:](v10, "addExecutionBlock:", v15);
          objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addOperation:", v10);

          objc_destroyWeak(&v20);
          objc_destroyWeak(&location);
        }
        else
        {
          wc_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_2();
        }

      }
      else
      {
        wc_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_1();
      }

    }
  }
  else
  {

  }
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_2(a1 + 32, a1 + 40);

    }
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(v7, "storeReceivedAppContext:withAppContextData:", v8, *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "session:didReceiveApplicationContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteAppContextDataFromInbox](v12, "deleteAppContextDataFromInbox");
    }
    else
    {
      wc_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_1();
    }

  }
}

- (void)handleIncomingFileWithPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSOperationQueue *workOperationQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WCSession *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[WCSession handleIncomingFileWithPairingID:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession handleIncomingFileWithPairingID:]", "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v6);
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__WCSession_handleIncomingFileWithPairingID___block_invoke;
  v10[3] = &unk_24D661D28;
  v11 = v4;
  v12 = self;
  v9 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v10);

}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairingID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:") & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

    if ((_DWORD)v3)
    {
      v6 = (void *)objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2;
      v11[3] = &unk_24D661B08;
      objc_copyWeak(&v14, &location);
      v7 = *(id *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v12 = v7;
      v13 = v8;
      objc_msgSend(v6, "addExecutionBlock:", v11);
      objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addOperation:", v6);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
  }
  else
  {

  }
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 32);
    objc_msgSend(v5[1], "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      wc_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));

    }
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104;
    v13[3] = &unk_24D661E68;
    objc_copyWeak(&v16, v2);
    v11 = *v5;
    v12 = v5[1];
    v14 = v11;
    v15 = v12;
    objc_msgSend(v10, "enumerateIncomingFilesWithBlock:", v13);

    objc_destroyWeak(&v16);
  }
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  char v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v8 & 1) == 0)
  {
    v10 = *(void **)(a1 + 32);
    v9 = a1 + 32;
    v11 = (id *)(v9 + 8);
    objc_msgSend(*(id *)(v9 + 8), "pairingID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      wc_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104_cold_3(v9, v9 + 8);

    }
    if (v5)
    {
      wc_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136446466;
        v22 = "-[WCSession handleIncomingFileWithPairingID:]_block_invoke";
        v23 = 2114;
        v24 = v5;
        _os_log_impl(&dword_216F21000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", (uint8_t *)&v21, 0x16u);
      }

      if (objc_msgSend(*v11, "verifySessionFile:", v5))
      {
        objc_msgSend(*v11, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_opt_respondsToSelector();

        if ((v17 & 1) != 0)
        {
          objc_msgSend(*v11, "delegate");
          v18 = objc_claimAutoreleasedReturnValue();
          -[NSObject session:didReceiveFile:](v18, "session:didReceiveFile:", *v11, v5);
        }
        else
        {
          wc_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104_cold_1();
        }
      }
      else
      {
        wc_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104_cold_2(v5);
      }

      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject cleanupSessionFileFromInbox:](v19, "cleanupSessionFileFromInbox:", v5);
    }
    else
    {
      if (!v6)
      {
LABEL_21:
        +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "acknowledgeFileIndexWithIdentifier:clientPairingID:", v6, *(_QWORD *)v9);

        goto LABEL_22;
      }
      wc_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136446466;
        v22 = "-[WCSession handleIncomingFileWithPairingID:]_block_invoke";
        v23 = 2114;
        v24 = v6;
        _os_log_impl(&dword_216F21000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s Error: failed to load session file with identifier %{public}@", (uint8_t *)&v21, 0x16u);
      }
    }

    goto LABEL_21;
  }
LABEL_22:

}

- (void)handleFileResultWithPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSOperationQueue *workOperationQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WCSession *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[WCSession handleFileResultWithPairingID:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession handleFileResultWithPairingID:]", "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v6);
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke;
  v10[3] = &unk_24D661D28;
  v11 = v4;
  v12 = self;
  v9 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v10);

}

void __43__WCSession_handleFileResultWithPairingID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairingID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:") & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

    if ((_DWORD)v3)
    {
      v6 = (void *)objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_2;
      v11[3] = &unk_24D661B08;
      objc_copyWeak(&v14, &location);
      v7 = *(id *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v12 = v7;
      v13 = v8;
      objc_msgSend(v6, "addExecutionBlock:", v11);
      objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addOperation:", v6);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
  }
  else
  {

  }
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 32);
    objc_msgSend(v5[1], "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      wc_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __43__WCSession_handleFileResultWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));

    }
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_108;
    v13[3] = &unk_24D661E90;
    objc_copyWeak(&v16, v2);
    v11 = *v5;
    v12 = v5[1];
    v14 = v11;
    v15 = v12;
    objc_msgSend(v10, "enumerateFileTransferResultsWithBlock:", v13);

    objc_destroyWeak(&v16);
  }
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id *v7;
  id WeakRetained;
  char v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  char v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  NSObject *v54;
  _QWORD v55[4];
  NSObject *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  _BYTE *v60;
  void *v61;
  uint8_t v62[4];
  const char *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  uint8_t v68[4];
  const char *v69;
  __int16 v70;
  void *v71;
  void *v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v9 & 1) == 0)
  {
    v11 = *(void **)(a1 + 32);
    v10 = a1 + 32;
    v12 = (id *)(v10 + 8);
    objc_msgSend(*(id *)(v10 + 8), "pairingID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      wc_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __43__WCSession_handleFileResultWithPairingID___block_invoke_108_cold_3(v10, v10 + 8);

    }
    wc_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v17)
      {
        -[NSObject transferError](v5, "transferError");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        NSPrintF();
        v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = "-[WCSession handleFileResultWithPairingID:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2114;
        v74 = v18;
        _os_log_impl(&dword_216F21000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ with %{public}@", buf, 0x20u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v74 = __Block_byref_object_copy_;
      v75 = __Block_byref_object_dispose_;
      v76 = 0;
      v19 = (void *)objc_opt_new();
      v58[0] = MEMORY[0x24BDAC760];
      v58[1] = 3221225472;
      v58[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_109;
      v58[3] = &unk_24D661D78;
      v20 = *v12;
      v60 = buf;
      v58[4] = v20;
      v59 = v6;
      objc_msgSend(v19, "addExecutionBlock:", v58);
      v21 = (void *)*((_QWORD *)*v12 + 11);
      v72 = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addOperations:waitUntilFinished:", v22, 1);

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        -[NSObject transferError](v5, "transferError");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[NSObject transferError](v5, "transferError");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTransferError:", v24);

        }
        v25 = v5;
        v5 = *(id *)(*(_QWORD *)&buf[8] + 40);
      }
      else
      {
        wc_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          __43__WCSession_handleFileResultWithPairingID___block_invoke_108_cold_2();
      }

      -[NSObject progress](v5, "progress");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26 && (objc_msgSend(v26, "isFinished") & 1) == 0 && (objc_msgSend(v27, "isCancelled") & 1) == 0)
      {
        wc_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject transferIdentifier](v5, "transferIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v68 = 136446466;
          v69 = "-[WCSession handleFileResultWithPairingID:]_block_invoke";
          v70 = 2114;
          v71 = v29;
          _os_log_impl(&dword_216F21000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s Updating progress to finished for %{public}@", v68, 0x16u);

        }
        objc_msgSend(v27, "setCompletedUnitCount:", objc_msgSend(v27, "totalUnitCount"));
      }
      v30 = objc_loadWeakRetained(v7);
      v31 = objc_msgSend(v30, "isCancelled");

      if ((v31 & 1) != 0)
      {

        _Block_object_dispose(buf, 8);
        goto LABEL_36;
      }
      v32 = *(void **)v10;
      objc_msgSend(*v12, "pairingID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = objc_msgSend(v32, "isEqual:", v33);

      if ((v32 & 1) == 0)
      {
        wc_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = *(_QWORD *)v10;
          objc_msgSend(*v12, "pairingID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          __43__WCSession_handleFileResultWithPairingID___block_invoke_108_cold_1(v35, v36, v68);
        }

      }
      objc_msgSend(*v12, "delegate", v52);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_opt_respondsToSelector();

      if ((v38 & 1) != 0)
      {
        -[NSObject setTransferring:](v5, "setTransferring:", 0);
        objc_msgSend(*v12, "delegate");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = *v12;
        -[NSObject transferError](v5, "transferError");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject session:didFinishFileTransfer:error:](v39, "session:didFinishFileTransfer:error:", v40, v5, v41);

      }
      else
      {
        wc_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v12, "delegate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "description");
          v43 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_session_didFinishFileTransfer_error_);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v62 = 136446722;
          v63 = "-[WCSession handleFileResultWithPairingID:]_block_invoke";
          v64 = 2114;
          v65 = v43;
          v66 = 2114;
          v67 = v44;
          _os_log_impl(&dword_216F21000, v39, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", v62, 0x20u);

        }
      }

      v45 = (void *)objc_opt_new();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_112;
      v55[3] = &unk_24D661D28;
      v46 = v5;
      v47 = *v12;
      v56 = v46;
      v57 = v47;
      objc_msgSend(v45, "addExecutionBlock:", v55);
      v48 = (void *)*((_QWORD *)*v12 + 11);
      v61 = v45;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "addOperations:waitUntilFinished:", v49, 1);

      v50 = (void *)objc_opt_new();
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __43__WCSession_handleFileResultWithPairingID___block_invoke_2_113;
      v53[3] = &unk_24D661D28;
      v53[4] = *v12;
      v5 = v46;
      v54 = v5;
      objc_msgSend(v50, "addExecutionBlock:", v53);
      objc_msgSend(*((id *)*v12 + 11), "addOperation:", v50);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WCSession handleFileResultWithPairingID:]_block_invoke_3";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_216F21000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s ERROR: failed to load session file transfer with identifier %{public}@", buf, 0x16u);
      }

      v5 = 0;
    }
    +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "acknowledgeFileResultIndexWithIdentifier:clientPairingID:", v6, *(_QWORD *)v10);

  }
LABEL_36:

}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_109(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalOutstandingFileTransfers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __43__WCSession_handleFileResultWithPairingID___block_invoke_112(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "progressToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "onqueue_removeProgressForFileTransfer:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "onqueue_removeOutstandingFileTransfer:", *(_QWORD *)(a1 + 32));
}

uint64_t __43__WCSession_handleFileResultWithPairingID___block_invoke_2_113(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportFileTransfer:", *(_QWORD *)(a1 + 40));
}

- (void)handleIncomingUserInfoWithPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSOperationQueue *workOperationQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WCSession *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[WCSession handleIncomingUserInfoWithPairingID:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession handleIncomingUserInfoWithPairingID:]", "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v6);
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke;
  v10[3] = &unk_24D661D28;
  v11 = v4;
  v12 = self;
  v9 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v10);

}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairingID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:") & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

    if ((_DWORD)v3)
    {
      v6 = (void *)objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2;
      v11[3] = &unk_24D661B08;
      objc_copyWeak(&v14, &location);
      v7 = *(id *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v12 = v7;
      v13 = v8;
      objc_msgSend(v6, "addExecutionBlock:", v11);
      objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addOperation:", v6);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
  }
  else
  {

  }
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 32);
    objc_msgSend(v5[1], "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      wc_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));

    }
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_116;
    v13[3] = &unk_24D661EB8;
    objc_copyWeak(&v16, v2);
    v11 = *v5;
    v12 = v5[1];
    v14 = v11;
    v15 = v12;
    objc_msgSend(v10, "enumerateIncomingUserInfosWithBlock:", v13);

    objc_destroyWeak(&v16);
  }
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  char v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v8 & 1) == 0)
  {
    v10 = *(void **)(a1 + 32);
    v9 = a1 + 32;
    v11 = (id *)(v9 + 8);
    objc_msgSend(*(id *)(v9 + 8), "pairingID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isEqual:", v12);

    if ((v13 & 1) == 0)
    {
      wc_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_116_cold_2(v9, v9 + 8);

    }
    wc_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v16)
      {
        objc_msgSend(v5, "transferIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 136446722;
        v25 = "-[WCSession handleIncomingUserInfoWithPairingID:]_block_invoke";
        v26 = 2114;
        v27 = v5;
        v28 = 2114;
        v29 = v17;
        _os_log_impl(&dword_216F21000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, identifier %{public}@", (uint8_t *)&v24, 0x20u);

      }
      if (objc_msgSend(v5, "verifyUserInfo"))
      {
        objc_msgSend(*v11, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_respondsToSelector();

        if ((v19 & 1) != 0)
        {
          objc_msgSend(*v11, "delegate");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *v11;
          objc_msgSend(v5, "userInfo");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject session:didReceiveUserInfo:](v20, "session:didReceiveUserInfo:", v21, v22);

        }
        else
        {
          wc_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_116_cold_1();
        }

      }
      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteUserInfoTransferFromInbox:](v15, "deleteUserInfoTransferFromInbox:", v5);
    }
    else if (v16)
    {
      v24 = 136446466;
      v25 = "-[WCSession handleIncomingUserInfoWithPairingID:]_block_invoke";
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_216F21000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s ERROR: failed to load user info transfer with identifier %{public}@", (uint8_t *)&v24, 0x16u);
    }

    +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "acknowledgeUserInfoIndexWithIdentifier:clientPairingID:", v6, *(_QWORD *)v9);

  }
}

- (void)handleUserInfoResultWithPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSOperationQueue *workOperationQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  WCSession *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  wc_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[WCSession handleUserInfoResultWithPairingID:]";
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_216F21000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
  }

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s cannot be nil."), "-[WCSession handleUserInfoResultWithPairingID:]", "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[WCSession sendMessage:replyHandler:errorHandler:].cold.1(v6);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%@"), v6);
  }
  workOperationQueue = self->_workOperationQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke;
  v10[3] = &unk_24D661D28;
  v11 = v4;
  v12 = self;
  v9 = v4;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v10);

}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id location;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "pairingID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqual:") & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

    if ((_DWORD)v3)
    {
      v6 = (void *)objc_opt_new();
      objc_initWeak(&location, v6);
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2;
      v11[3] = &unk_24D661B08;
      objc_copyWeak(&v14, &location);
      v7 = *(id *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v12 = v7;
      v13 = v8;
      objc_msgSend(v6, "addExecutionBlock:", v11);
      objc_msgSend(*(id *)(a1 + 40), "delegateOperationQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addOperation:", v6);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);

    }
  }
  else
  {

  }
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 32);
    objc_msgSend(v5[1], "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      wc_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)(v5 + 1));

    }
    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120;
    v13[3] = &unk_24D661EB8;
    objc_copyWeak(&v16, v2);
    v11 = *v5;
    v12 = v5[1];
    v14 = v11;
    v15 = v12;
    objc_msgSend(v10, "enumerateUserInfoResultsWithBlock:", v13);

    objc_destroyWeak(&v16);
  }
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id *v7;
  id WeakRetained;
  char v9;
  uint64_t v10;
  void *v11;
  id *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  char v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  id v48;
  NSObject *v49;
  _QWORD v50[5];
  id v51;
  _BYTE *v52;
  void *v53;
  uint8_t v54[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  int v60[10];
  void *v61;
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v9 & 1) == 0)
  {
    v11 = *(void **)(a1 + 32);
    v10 = a1 + 32;
    v12 = (id *)(v10 + 8);
    objc_msgSend(*(id *)(v10 + 8), "pairingID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if ((v14 & 1) == 0)
    {
      wc_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120_cold_3(v10, v10 + 8);

    }
    wc_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WCSession handleUserInfoResultWithPairingID:]_block_invoke";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v5;
        _os_log_impl(&dword_216F21000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@", buf, 0x16u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v63 = __Block_byref_object_copy_;
      v64 = __Block_byref_object_dispose_;
      v65 = 0;
      v18 = (void *)objc_opt_new();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_121;
      v50[3] = &unk_24D661D78;
      v19 = *v12;
      v52 = buf;
      v50[4] = v19;
      v51 = v6;
      objc_msgSend(v18, "addExecutionBlock:", v50);
      v20 = (void *)*((_QWORD *)*v12 + 11);
      v61 = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addOperations:waitUntilFinished:", v21, 1);

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        -[NSObject transferError](v5, "transferError");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[NSObject transferError](v5, "transferError");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setTransferError:", v23);

        }
        v24 = v5;
        v5 = *(id *)(*(_QWORD *)&buf[8] + 40);
      }
      else
      {
        wc_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120_cold_2();
      }

      v25 = objc_loadWeakRetained(v7);
      v26 = objc_msgSend(v25, "isCancelled");

      if ((v26 & 1) != 0)
      {

        _Block_object_dispose(buf, 8);
        goto LABEL_30;
      }
      v27 = *(void **)v10;
      objc_msgSend(*v12, "pairingID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v27) = objc_msgSend(v27, "isEqual:", v28);

      if ((v27 & 1) == 0)
      {
        wc_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)v10;
          objc_msgSend(*v12, "pairingID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120_cold_1(v30, v31, v60);
        }

      }
      objc_msgSend(*v12, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_respondsToSelector();

      if ((v33 & 1) != 0)
      {
        -[NSObject setTransferring:](v5, "setTransferring:", 0);
        objc_msgSend(*v12, "delegate");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = *v12;
        -[NSObject transferError](v5, "transferError");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject session:didFinishUserInfoTransfer:error:](v34, "session:didFinishUserInfoTransfer:error:", v35, v5, v36);

      }
      else
      {
        wc_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v12, "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "description");
          v38 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_session_didFinishUserInfoTransfer_error_);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v54 = 136446722;
          v55 = "-[WCSession handleUserInfoResultWithPairingID:]_block_invoke";
          v56 = 2114;
          v57 = v38;
          v58 = 2114;
          v59 = v39;
          _os_log_impl(&dword_216F21000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", v54, 0x20u);

        }
      }

      v40 = (void *)objc_opt_new();
      v44 = MEMORY[0x24BDAC760];
      v45 = 3221225472;
      v46 = __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_124;
      v47 = &unk_24D661D28;
      v48 = *v12;
      v5 = v5;
      v49 = v5;
      objc_msgSend(v40, "addExecutionBlock:", &v44);
      v41 = (void *)*((_QWORD *)*v12 + 11);
      v53 = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1, v44, v45, v46, v47, v48);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addOperations:waitUntilFinished:", v42, 1);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = "-[WCSession handleUserInfoResultWithPairingID:]_block_invoke_2";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_216F21000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s ERROR: failed to load user info result with identifier %{public}@", buf, 0x16u);
      }

      v5 = 0;
    }
    +[WCXPCManager sharedManager](WCXPCManager, "sharedManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "acknowledgeUserInfoResultIndexWithIdentifier:clientPairingID:", v6, *(_QWORD *)v10);

  }
LABEL_30:

}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_121(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "internalOutstandingUserInfoTransfers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_124(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_removeOutstandingUserInfoTransfer:", *(_QWORD *)(a1 + 40));
}

void __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7019);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:activationDidCompleteWithState:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "activationState"), v3);

}

uint64_t __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_125(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 88);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2_126;
  v4[3] = &unk_24D661AB8;
  v4[4] = v1;
  return objc_msgSend(v2, "addOperationWithBlock:", v4);
}

uint64_t __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_2_126(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "onqueue_dequeueContent");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_3;
  v6[3] = &unk_24D661AB8;
  v6[4] = v3;
  return objc_msgSend(v4, "addOperationWithBlock:", v6);
}

void __57__WCSession_onqueue_completeSwitchTask_withSessionState___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    wc_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v11 = 136446466;
      v12 = "-[WCSession onqueue_completeSwitchTask:withSessionState:]_block_invoke_4";
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_216F21000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s cleaning up directories for state: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appInstallationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cleanUpWatchContentDirectoryWithCurrentAppInstallationID:", v7);

    objc_msgSend(*(id *)(a1 + 32), "pairedDevicesPairingIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[WCFileStorage sharedInstance](WCFileStorage, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "pairedDevicesPairingIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cleanUpOldPairingIDFoldersWithPairedDevicesPairingIDs:", v10);

    }
  }
}

void __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_127(uint64_t a1, char a2, int a3)
{
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  void *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "onDelegateQueueIfTriggeringKVO_updateSessionState:triggerKVO:", *(_QWORD *)(a1 + 40), 1);
  v6 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) == 0)
  {
    if (!v6[8])
      goto LABEL_15;
    goto LABEL_5;
  }
  if (v6[8])
  {
LABEL_5:
    v6[8] = 0;
    wc_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
      _os_log_impl(&dword_216F21000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s resetting forced reachable", buf, 0xCu);
    }

    v6 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v6, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  wc_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136446210;
      v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
      _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session reachability changed", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject sessionReachabilityDidChange:](v10, "sessionReachabilityDidChange:", *(_QWORD *)(a1 + 32));
  }
  else if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_sessionReachabilityDidChange_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446722;
    v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
    v29 = 2114;
    v30 = v13;
    v31 = 2114;
    v32 = v14;
    _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);

  }
LABEL_15:
  v15 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_130;
  v25[3] = &unk_24D661AB8;
  v25[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v15, "addExecutionBlock:", v25);
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v26 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addOperations:waitUntilFinished:", v17, 1);

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    wc_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if ((v19 & 1) != 0)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke_2";
        _os_log_impl(&dword_216F21000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session state changed", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject sessionWatchStateDidChange:](v20, "sessionWatchStateDidChange:", *(_QWORD *)(a1 + 32));
    }
    else if (v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_sessionWatchStateDidChange_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446722;
      v28 = "-[WCSession onqueue_handleUpdateSessionState:]_block_invoke";
      v29 = 2114;
      v30 = v23;
      v31 = 2114;
      v32 = v24;
      _os_log_impl(&dword_216F21000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);

    }
  }

}

uint64_t __46__WCSession_onqueue_handleUpdateSessionState___block_invoke_130(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "onqueue_cancelMessagesIfAppropriate");
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_cancelTransfersIfAppropriate");
}

void __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    wc_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446210;
      v7 = "-[WCSession onqueue_startNextDeviceSwitch]_block_invoke";
      _os_log_impl(&dword_216F21000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session did become inactive", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sessionDidBecomeInactive:", *(_QWORD *)(a1 + 32));

  }
}

void __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_134(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateOperationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelAllOperations");

    v5 = (void *)objc_opt_new();
    v6 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_2;
    v15[3] = &unk_24D661AB8;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "addExecutionBlock:", v15);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v18[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addOperations:waitUntilFinished:", v8, 1);

    wc_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v17 = "-[WCSession onqueue_startNextDeviceSwitch]_block_invoke";
      _os_log_impl(&dword_216F21000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s notifying client session did deactivate", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sessionDidDeactivate:", *(_QWORD *)(a1 + 32));

    v11 = *(void **)(a1 + 40);
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_135;
    v13[3] = &unk_24D661AB8;
    v14 = v11;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

  }
}

uint64_t __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivationState:", 0);
}

uint64_t __42__WCSession_onqueue_startNextDeviceSwitch__block_invoke_135(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTaskState:", 2);
}

- (void)onqueue_dequeueContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSOperationQueue *workOperationQueue;
  _QWORD v9[5];

  -[WCSession pairingID](self, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession handleApplicationContextWithPairingID:](self, "handleApplicationContextWithPairingID:", v3);

  -[WCSession pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession handleFileResultWithPairingID:](self, "handleFileResultWithPairingID:", v4);

  -[WCSession pairingID](self, "pairingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession handleIncomingFileWithPairingID:](self, "handleIncomingFileWithPairingID:", v5);

  -[WCSession pairingID](self, "pairingID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession handleUserInfoResultWithPairingID:](self, "handleUserInfoResultWithPairingID:", v6);

  -[WCSession pairingID](self, "pairingID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSession handleIncomingUserInfoWithPairingID:](self, "handleIncomingUserInfoWithPairingID:", v7);

  workOperationQueue = self->_workOperationQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__WCSession_onqueue_dequeueContent__block_invoke;
  v9[3] = &unk_24D661AB8;
  v9[4] = self;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v9);
}

void __35__WCSession_onqueue_dequeueContent__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "delegateOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__WCSession_onqueue_dequeueContent__block_invoke_2;
  v3[3] = &unk_24D661AB8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "addOperationWithBlock:", v3);

}

void __35__WCSession_onqueue_dequeueContent__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setHasContentPending:", 0);
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "hasContentPending");
    v4 = "NO";
    if (v3)
      v4 = "YES";
    v5 = 136446466;
    v6 = "-[WCSession onqueue_dequeueContent]_block_invoke_2";
    v7 = 2080;
    v8 = v4;
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s hasContentPending: %s", (uint8_t *)&v5, 0x16u);
  }

}

- (void)onqueue_handleMessageCompletionWithError:(id)a3 withMessageID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentMessages, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeoutTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    if (v6)
    {

    }
    else
    {
      v11 = objc_msgSend(v8, "expectsResponse");

      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    objc_msgSend(v8, "timeoutTimer");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v12);

  }
  if (v6)
  {
    wc_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WCSession onqueue_handleMessageCompletionWithError:withMessageID:].cold.1();

    objc_msgSend(v8, "errorHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WCSession _onqueue_notifyOfMessageError:messageID:withErrorHandler:](self, "_onqueue_notifyOfMessageError:messageID:withErrorHandler:", v6, v7, v14);

    goto LABEL_11;
  }
LABEL_10:
  if ((objc_msgSend(v8, "expectsResponse") & 1) == 0)
LABEL_11:
    -[NSMutableDictionary removeObjectForKey:](self->_currentMessages, "removeObjectForKey:", v7);

}

- (void)_onqueue_notifyOfMessageError:(id)a3 messageID:(id)a4 withErrorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  WCSession *v20;
  id v21;
  id v22;
  id v23;
  _BYTE location[12];
  __int16 v25;
  id v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  wc_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (v10)
      v16 = "YES";
    else
      v16 = "NO";
    NSPrintF();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136446978;
    *(_QWORD *)&location[4] = "-[WCSession _onqueue_notifyOfMessageError:messageID:withErrorHandler:]";
    v25 = 2114;
    v26 = v9;
    v27 = 2080;
    v28 = v16;
    v29 = 2114;
    v30 = v17;
    _os_log_error_impl(&dword_216F21000, v11, OS_LOG_TYPE_ERROR, "%{public}s %{public}@ errorHandler: %s with %{public}@", location, 0x2Au);

  }
  if (v10)
  {
    -[WCSession pairingID](self, "pairingID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    objc_initWeak((id *)location, v13);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke;
    v18[3] = &unk_24D661F30;
    objc_copyWeak(&v23, (id *)location);
    v14 = v12;
    v19 = v14;
    v20 = self;
    v22 = v10;
    v21 = v8;
    objc_msgSend(v13, "addExecutionBlock:", v18);
    -[WCSession delegateOperationQueue](self, "delegateOperationQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v13);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);

  }
}

void __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke_cold_1(a1 + 32, a1 + 40);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)notifyOfFileError:(id)a3 withFileTransfer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSOperationQueue *workOperationQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[WCSession notifyOfFileError:withFileTransfer:].cold.1();

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__WCSession_notifyOfFileError_withFileTransfer___block_invoke;
  v12[3] = &unk_24D661BA8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v12);

}

uint64_t __48__WCSession_notifyOfFileError_withFileTransfer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_notifyOfFileError:withFileTransfer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)onqueue_notifyOfFileError:(id)a3 withFileTransfer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  WCSession *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  -[WCSession pairingID](self, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_initWeak(&location, v9);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke;
  v17 = &unk_24D661DC8;
  objc_copyWeak(&v22, &location);
  v10 = v8;
  v18 = v10;
  v19 = self;
  v11 = v7;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  objc_msgSend(v9, "addExecutionBlock:", &v14);
  -[WCSession delegateOperationQueue](self, "delegateOperationQueue", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v9);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  id *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v6);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_cold_1(a1 + 32, a1 + 40);

    }
    objc_msgSend(*v5, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject session:didFinishFileTransfer:error:](v10, "session:didFinishFileTransfer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      wc_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v5, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_session_didFinishFileTransfer_error_);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v20 = "-[WCSession onqueue_notifyOfFileError:withFileTransfer:]_block_invoke";
        v21 = 2114;
        v22 = v12;
        v23 = 2114;
        v24 = v13;
        _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);

      }
    }

    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(a1 + 48);
    v16 = *(void **)(v14 + 88);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_136;
    v17[3] = &unk_24D661D28;
    v17[4] = v14;
    v18 = v15;
    objc_msgSend(v16, "addOperationWithBlock:", v17);

  }
}

uint64_t __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_136(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_removeOutstandingFileTransfer:", *(_QWORD *)(a1 + 40));
}

- (void)notifyOfUserInfoError:(id)a3 withUserInfoTransfer:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSOperationQueue *workOperationQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  wc_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[WCSession notifyOfUserInfoError:withUserInfoTransfer:].cold.1();

  workOperationQueue = self->_workOperationQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__WCSession_notifyOfUserInfoError_withUserInfoTransfer___block_invoke;
  v12[3] = &unk_24D661BA8;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[NSOperationQueue addOperationWithBlock:](workOperationQueue, "addOperationWithBlock:", v12);

}

uint64_t __56__WCSession_notifyOfUserInfoError_withUserInfoTransfer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_notifyOfUserInfoError:withUserInfoTransfer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)onqueue_notifyOfUserInfoError:(id)a3 withUserInfoTransfer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  WCSession *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  -[WCSession pairingID](self, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_initWeak(&location, v9);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke;
  v17 = &unk_24D661DC8;
  objc_copyWeak(&v22, &location);
  v10 = v8;
  v18 = v10;
  v19 = self;
  v11 = v7;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  objc_msgSend(v9, "addExecutionBlock:", &v14);
  -[WCSession delegateOperationQueue](self, "delegateOperationQueue", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v9);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  id *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) == 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v6);

    if ((v4 & 1) == 0)
    {
      wc_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_cold_1(a1 + 32, a1 + 40);

    }
    objc_msgSend(*v5, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject session:didFinishUserInfoTransfer:error:](v10, "session:didFinishUserInfoTransfer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    }
    else
    {
      wc_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*v5, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "description");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_session_didFinishUserInfoTransfer_error_);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446722;
        v22 = "-[WCSession onqueue_notifyOfUserInfoError:withUserInfoTransfer:]_block_invoke";
        v23 = 2114;
        v24 = v12;
        v25 = 2114;
        v26 = v13;
        _os_log_impl(&dword_216F21000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s delegate %{public}@ does not implement %{public}@", buf, 0x20u);

      }
    }

    v14 = (void *)objc_opt_new();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_137;
    v18[3] = &unk_24D661D28;
    v15 = *(void **)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = v15;
    objc_msgSend(v14, "addExecutionBlock:", v18);
    v16 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    v20 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperations:waitUntilFinished:", v17, 1);

  }
}

uint64_t __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_137(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_removeOutstandingUserInfoTransfer:", *(_QWORD *)(a1 + 40));
}

- (id)createAndStartTimerOnWorkQueueWithHandler:(id)a3
{
  NSOperationQueue *workOperationQueue;
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;

  workOperationQueue = self->_workOperationQueue;
  v4 = a3;
  -[NSOperationQueue underlyingQueue](workOperationQueue, "underlyingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v5);

  v7 = dispatch_time(0, 300000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v6, v4);

  dispatch_resume(v6);
  return v6;
}

- (id)errorIfNotReachable
{
  void *v2;
  NSObject *v3;

  if (-[WCSession isReachable](self, "isReachable"))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wcErrorWithCode:", 7007);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    wc_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[WCSession errorIfNotReachable].cold.1();

  }
  return v2;
}

- (BOOL)verifySessionFile:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "fileURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v4, "checkResourceIsReachableAndReturnError:", 0);

  LOBYTE(v4) = objc_msgSend(v3, "verifyMetadata");
  return v5 & v4;
}

- (id)fileSizeFromURL:(id)a3
{
  id v4;

  v4 = 0;
  objc_msgSend(a3, "getResourceValue:forKey:error:", &v4, *MEMORY[0x24BDBCC48], 0);
  return v4;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("outstandingFileTransfers")) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", CFSTR("outstandingFileTransfers")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WCSession;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setInternalOutstandingFileTransfers:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[WCSession internalOutstandingFileTransfers](self, "internalOutstandingFileTransfers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    -[WCSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingFileTransfers"));
    objc_storeStrong((id *)&self->_internalOutstandingFileTransfers, a3);
    -[WCSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingFileTransfers"));
  }

}

- (void)setInternalOutstandingUserInfoTransfers:(id)a3
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[WCSession internalOutstandingUserInfoTransfers](self, "internalOutstandingUserInfoTransfers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v7);

  if ((v6 & 1) == 0)
  {
    -[WCSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outstandingUserInfoTransfers"));
    objc_storeStrong((id *)&self->_internalOutstandingUserInfoTransfers, a3);
    -[WCSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outstandingUserInfoTransfers"));
  }

}

- (void)reportFileTransfer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  NSObject *v42;
  const char *v43;
  int v44;
  const char *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "transferDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transferDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = (uint64_t)v9;

    if (v10 >= 31)
      v11 = 30 * (v10 / 0x1EuLL);
    else
      v11 = v10;
  }
  else
  {
    v11 = -1;
  }
  objc_msgSend(v4, "file");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "file");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileSize");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WCSession roundValue:toSignificantFigures:](self, "roundValue:toSignificantFigures:", objc_msgSend(v15, "integerValue"), 2);

  }
  else
  {
    v16 = -1;
  }

  objc_msgSend(v4, "file");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userInfoData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    objc_msgSend(v4, "file");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userInfoData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[WCSession roundValue:toSignificantFigures:](self, "roundValue:toSignificantFigures:", objc_msgSend(v20, "length"), 2);

  }
  else
  {
    v21 = -1;
  }

  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("durationSec"));

  objc_msgSend(v4, "transferError");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "code"))
  {
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "transferError");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "code"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("errorCode"));

  }
  else
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_24D668CA0, CFSTR("errorCode"));
  }

  objc_msgSend(v4, "transferError");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "domain");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v29)
    v31 = (const __CFString *)v29;
  else
    v31 = &stru_24D662AF0;
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, CFSTR("errorDomain"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("fileSizeBytes"));

  objc_msgSend(v4, "file");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "userInfoData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x24BDBD1C8];
  v36 = MEMORY[0x24BDBD1C0];
  if (v34)
    v37 = MEMORY[0x24BDBD1C8];
  else
    v37 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v37, CFSTR("hasMetadata"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v38, CFSTR("metadataSizeBytes"));

  objc_msgSend(v4, "transferError");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    v40 = v36;
  else
    v40 = v35;
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v40, CFSTR("success"));

  v41 = (double)arc4random() / 4294967300.0;
  if (v41 < 0.1)
    CUMetricsLog();
  wc_log();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = "no";
    v44 = 136446722;
    v45 = "-[WCSession reportFileTransfer:]";
    if (v41 < 0.1)
      v43 = "yes";
    v46 = 2112;
    v47 = v22;
    v48 = 2080;
    v49 = v43;
    _os_log_impl(&dword_216F21000, v42, OS_LOG_TYPE_INFO, "%{public}s %@ submited %s", (uint8_t *)&v44, 0x20u);
  }

}

- (unint64_t)roundValue:(unint64_t)a3 toSignificantFigures:(int)a4
{
  double v5;
  double v6;
  double v7;
  unint64_t result;
  int v9;

  if (!a3)
    return 0;
  v5 = (double)a3;
  v6 = log10((double)a3);
  v7 = __exp10((double)(int)(a4 - vcvtpd_s64_f64(v6)));
  result = (unint64_t)(round(v7 * v5) / v7);
  v9 = result % 0xA;
  if (v9 == 9)
  {
    ++result;
  }
  else if (v9 == 1)
  {
    --result;
  }
  return result;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (void)setWatchAppInstalled:(BOOL)a3
{
  self->_watchAppInstalled = a3;
}

- (void)setComplicationEnabled:(BOOL)a3
{
  self->_complicationEnabled = a3;
}

- (void)setRemainingComplicationUserInfoTransfers:(unint64_t)a3
{
  self->_remainingComplicationUserInfoTransfers = a3;
}

- (void)setWatchDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_watchDirectoryURL, a3);
}

- (void)setCompanionAppInstalled:(BOOL)a3
{
  self->_companionAppInstalled = a3;
}

- (void)setReachable:(BOOL)a3
{
  self->_reachable = a3;
}

- (BOOL)iOSDeviceNeedsUnlockAfterRebootForReachability
{
  return self->_iOSDeviceNeedsUnlockAfterRebootForReachability;
}

- (void)setIOSDeviceNeedsUnlockAfterRebootForReachability:(BOOL)a3
{
  self->_iOSDeviceNeedsUnlockAfterRebootForReachability = a3;
}

- (void)setApplicationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setReceivedApplicationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSOperationQueue)backgroundWorkOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 80, 1);
}

- (NSOperationQueue)workOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableDictionary)currentMessages
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableSet)currentMessageIdentifiersAwaitingReply
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCurrentMessageIdentifiersAwaitingReply:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)internalOutstandingUserInfoTransfers
{
  return self->_internalOutstandingUserInfoTransfers;
}

- (NSMutableDictionary)internalOutstandingFileTransfers
{
  return self->_internalOutstandingFileTransfers;
}

- (WCSessionUserInfoTransfer)currentComplicationUserInfoTransfer
{
  return (WCSessionUserInfoTransfer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCurrentComplicationUserInfoTransfer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (WCQueueManager)queueManager
{
  return (WCQueueManager *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQueueManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setPairingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setConnectionWasInterrupted:(BOOL)a3
{
  self->_connectionWasInterrupted = a3;
}

- (void)setSwitchTasksQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchTasksQueue, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_queueManager, 0);
  objc_storeStrong((id *)&self->_currentComplicationUserInfoTransfer, 0);
  objc_storeStrong((id *)&self->_internalOutstandingFileTransfers, 0);
  objc_storeStrong((id *)&self->_internalOutstandingUserInfoTransfers, 0);
  objc_storeStrong((id *)&self->_currentMessageIdentifiersAwaitingReply, 0);
  objc_storeStrong((id *)&self->_currentMessages, 0);
  objc_storeStrong((id *)&self->_workOperationQueue, 0);
  objc_storeStrong((id *)&self->_backgroundWorkOperationQueue, 0);
  objc_storeStrong((id *)&self->_delegateOperationQueue, 0);
  objc_storeStrong((id *)&self->_receivedApplicationContext, 0);
  objc_storeStrong((id *)&self->_applicationContext, 0);
  objc_storeStrong((id *)&self->_watchDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __28__WCSession_activateSession__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "denying activation due to missing delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __28__WCSession_activateSession__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "already in progress or activated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __28__WCSession_activateSession__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "activate session semaphore timed out", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __28__WCSession_activateSession__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "denying activation as it is not supported on this device type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __28__WCSession_activateSession__block_invoke_17_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s sessionReadyForInitialStateWithCompletionHandler failed due to %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

- (void)onqueue_removeOutstandingUserInfoTransfer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "no pairingID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __60__WCSession_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_27(&dword_216F21000, a1, a3, "%{public}s Observered item isn't of class WCSessionFileTransfer", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_22();
}

- (void)sendMessage:(void *)a1 replyHandler:errorHandler:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(OUTLINED_FUNCTION_16(a1), "UTF8String");
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(&dword_216F21000, v1, v2, "EXCEPTION: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_9();
}

void __44__WCSession_updateApplicationContext_error___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s failed due to %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

void __44__WCSession_updateApplicationContext_error___block_invoke_69_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s xpc failed due to %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

void __67__WCSession_onqueue_sendResponseData_identifier_dictionaryMessage___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s failed due to %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

- (void)_onqueue_sendResponseError:identifier:dictionaryMessage:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[10];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446722;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2(&dword_216F21000, v1, v2, "%{public}s identifier: %{public}@ with %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_21();
}

void __69__WCSession__onqueue_sendResponseError_identifier_dictionaryMessage___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s failed due to %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

void __44__WCSession_xpcConnectionRestoredWithState___block_invoke_cold_1()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_28();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v1), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "pairingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v4, v5, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3();
}

void __27__WCSession_handleRequest___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_30(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_8(&dword_216F21000, v1, v2, "dropping incoming request %{public}@ as it was not intended for the currently active session.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_22();
}

- (void)onqueue_handleDictionaryMessageRequest:(void *)a1 withPairingID:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(&dword_216F21000, v1, v2, "EXCEPTION: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_9();
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446466;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10(&dword_216F21000, v3, v4, "%{public}s delegate %{public}@ does not implement delegate method", (uint8_t *)v5);

  OUTLINED_FUNCTION_20();
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_87_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_30(*MEMORY[0x24BDAC8D0]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_11(&dword_216F21000, v0, v1, "%{public}s attempting to respond to requestIdentifier %{public}@ multiple times", (uint8_t *)v2);
  OUTLINED_FUNCTION_22();
}

void __66__WCSession_onqueue_handleDictionaryMessageRequest_withPairingID___block_invoke_87_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)onqueue_handleDataMessageRequest:(void *)a1 withPairingID:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4(&dword_216F21000, v1, v2, "EXCEPTION: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_9();
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446466;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10(&dword_216F21000, v3, v4, "%{public}s delegate %{public}@ does not implement delegate method", (uint8_t *)v5);

  OUTLINED_FUNCTION_20();
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_96_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_30(*MEMORY[0x24BDAC8D0]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_11(&dword_216F21000, v0, v1, "%{public}s attempting to respond to requestIdentifier %{public}@ multiple times", (uint8_t *)v2);
  OUTLINED_FUNCTION_22();
}

void __60__WCSession_onqueue_handleDataMessageRequest_withPairingID___block_invoke_96_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __28__WCSession_handleResponse___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_30(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_8(&dword_216F21000, v1, v2, "dropping incoming response %{public}@ as it was not intended for the currently active session.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_22();
}

void __67__WCSession_onqueue_handleResponseDictionary_record_withPairingID___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __61__WCSession_onqueue_handleResponseData_record_withPairingID___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "Application context data is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "failed to deserialize payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_1()
{
  const char *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_28();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v2), "delegate");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_31(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_216F21000, v5, v6, "%{public}s delegate %{public}@ does not implement %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

void __51__WCSession_handleApplicationContextWithPairingID___block_invoke_2_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104_cold_1()
{
  const char *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_28();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v2), "delegate");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_31(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_216F21000, v5, v6, "%{public}s delegate %{public}@ does not implement %{public}@, discarding incoming content", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104_cold_2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fileURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136446466;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10(&dword_216F21000, v3, v4, "%{public}s file doesn't exist for record %{public}@", (uint8_t *)v5);

  OUTLINED_FUNCTION_20();
}

void __45__WCSession_handleIncomingFileWithPairingID___block_invoke_104_cold_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_108_cold_1(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *a3 = 136446722;
  OUTLINED_FUNCTION_25(a1, (uint64_t)a2, (uint64_t)a3);
  OUTLINED_FUNCTION_5(&dword_216F21000, v6, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5);

}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_108_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "could not find session file transfer in internal outstanding list. Proceeding with one returned from the index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __43__WCSession_handleFileResultWithPairingID___block_invoke_108_cold_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_116_cold_1()
{
  const char *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_28();
  objc_msgSend((id)OUTLINED_FUNCTION_26(v2), "delegate");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_31(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_216F21000, v5, v6, "%{public}s delegate %{public}@ does not implement %{public}@, discarding incoming content", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

void __49__WCSession_handleIncomingUserInfoWithPairingID___block_invoke_116_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120_cold_1(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  *a3 = 136446722;
  OUTLINED_FUNCTION_25(a1, (uint64_t)a2, (uint64_t)a3);
  OUTLINED_FUNCTION_5(&dword_216F21000, v6, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5);

}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "could not find user info result in internal outstanding list. Proceeding with one returned from the index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __47__WCSession_handleUserInfoResultWithPairingID___block_invoke_120_cold_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)onqueue_completeSwitchTask:(uint64_t)a3 withSessionState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_27(&dword_216F21000, a1, a3, "%{public}s activateSession failed, companion iphone app not installed ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_22();
}

- (void)onqueue_handleMessageCompletionWithError:withMessageID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[10];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446722;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2(&dword_216F21000, v1, v2, "%{public}s %{public}@ due to %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_21();
}

void __70__WCSession__onqueue_notifyOfMessageError_messageID_withErrorHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)notifyOfFileError:withFileTransfer:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[10];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446722;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2(&dword_216F21000, v1, v2, "%{public}s %{public}@ with %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_21();
}

void __56__WCSession_onqueue_notifyOfFileError_withFileTransfer___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)notifyOfUserInfoError:withUserInfoTransfer:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_24(*MEMORY[0x24BDAC8D0]);
  NSPrintF();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136446466;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_216F21000, v1, v2, "%{public}s error: %{public}@", (uint8_t *)v3);

  OUTLINED_FUNCTION_17();
}

void __64__WCSession_onqueue_notifyOfUserInfoError_withUserInfoTransfer___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "pairingID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_216F21000, v3, v4, "%{public}s dropping as pairingIDs no longer match. pairingID %{public}@, client pairingID: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)logAndTestIfUnactivatedOrMissingDelegate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "WCSession is missing its delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)errorIfNotReachable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_216F21000, v0, v1, "WCSession is not reachable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
