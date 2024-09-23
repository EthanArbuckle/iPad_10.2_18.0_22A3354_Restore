@implementation CATTaskClient

- (void)dealloc
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  -[CATStateMachine currentState](self->mFSM, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Invalidated"));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskClient.m"), 54, CFSTR("%@ cannot dealloc while receiver is still valid."), self);

  }
  v8.receiver = self;
  v8.super_class = (Class)CATTaskClient;
  -[CATTaskClient dealloc](&v8, sel_dealloc);
}

- (CATTaskClient)init
{
  CATTaskClient *v2;
  uint64_t v3;
  NSMapTable *mRemoteTaskByUUID;
  uint64_t v5;
  NSMutableArray *mEnqueuedMessages;
  uint64_t v7;
  NSMutableArray *mEnqueuedTaskUUIDs;
  dispatch_group_t v9;
  OS_dispatch_group *mSessionDidInvalidateGroup;
  CATStateMachine *v11;
  CATStateMachine *mFSM;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CATTaskClient;
  v2 = -[CATTaskClient init](&v22, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 5);
    v3 = objc_claimAutoreleasedReturnValue();
    mRemoteTaskByUUID = v2->mRemoteTaskByUUID;
    v2->mRemoteTaskByUUID = (NSMapTable *)v3;

    v5 = objc_opt_new();
    mEnqueuedMessages = v2->mEnqueuedMessages;
    v2->mEnqueuedMessages = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    mEnqueuedTaskUUIDs = v2->mEnqueuedTaskUUIDs;
    v2->mEnqueuedTaskUUIDs = (NSMutableArray *)v7;

    v9 = dispatch_group_create();
    mSessionDidInvalidateGroup = v2->mSessionDidInvalidateGroup;
    v2->mSessionDidInvalidateGroup = (OS_dispatch_group *)v9;

    v11 = -[CATStateMachine initWithTarget:]([CATStateMachine alloc], "initWithTarget:", v2);
    mFSM = v2->mFSM;
    v2->mFSM = v11;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("CATTaskLogLevel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", objc_msgSend(v14, "integerValue"));

    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Disconnected"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connecting"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Negotiating"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connected"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidating"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidated"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnterAction:");
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", 0);
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueMessage_);
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransportFromTaskClient:"), sel_resumeCapturedTransportFromTaskClient_);
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("invalidateWithError:"));
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didPrepareTaskOperation:"), sel_enqueueTaskOperation_);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueMessage_);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransportFromTaskClient:"), sel_resumeCapturedTransportFromTaskClient_);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:", v21, CFSTR("transportDidResume:"));
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:", v15, CFSTR("transportDidInvalidate:"));
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("invalidateWithError:"), sel_abandonTransportClearQueuedMessagesAndCancelAllOperationsWithError_);
    objc_msgSend(v21, "setEnterAction:", sel_resumeSession);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didPrepareTaskOperation:"), sel_enqueueTaskOperation_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueMessage_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransportFromTaskClient:"), sel_resumeCapturedTransportFromTaskClient_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", v17, CFSTR("sessionResumedWithTaskUUIDs:"), sel_resumeWithTaskUUIDs_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", v15, CFSTR("transportDidInvalidate:"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("invalidateWithError:"), sel_clearQueuedMessagesAndCancelAllOperationsWithError_);
    objc_msgSend(v17, "setEnterAction:", sel_delegateDidConnect);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didPrepareTaskOperation:"), sel_trackTaskOperation_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_sendMessageThroughTransport_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:", 0, CFSTR("processTaskMessage:"));
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:", 0, CFSTR("processNotificationMessage:"));
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sessionResumedWithTaskUUIDs:"), sel_resumeWithTaskUUIDs_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("connectWithTransportFromTaskClient:"), sel_resumeCapturedTransportFromTaskClient_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:", v15, CFSTR("transportDidInvalidate:"));
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("invalidateWithError:"), sel_clearQueuedMessagesAndCancelAllOperationsWithError_);
    objc_msgSend(v17, "setExitAction:", sel_delegateDidDisconnect);
    objc_msgSend(v18, "setEnterAction:", sel_delegateWillInvalidateAndInvalidateSessionWithError_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didPrepareTaskOperation:"), sel_taskOperationDidFailWithInvalidTaskClient_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", 0, CFSTR("sendMessage:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidateWithError:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", 0, CFSTR("transportDidResume:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", 0, CFSTR("sessionResumedWithTaskUUIDs:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("transportDidInvalidate:"), sel_abandonTransport);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", v20, CFSTR("sessionDidInvalidate"));
    objc_msgSend(v20, "setEnterAction:", sel_delegateDidInvalidateAndFinalize);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didPrepareTaskOperation:"), sel_taskOperationDidFailWithInvalidTaskClient_);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("sendMessage:"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidateWithError:"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("sessionDidInvalidate"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("transportDidInvalidate:"));
    v2->mIsStarting = 1;
    -[CATStateMachine start](v2->mFSM, "start");
    v2->mIsStarting = 0;

  }
  return v2;
}

- (NSString)description
{
  CATTransport *mTransport;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  mTransport = self->mTransport;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[CATStateMachine currentState](self->mFSM, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskClient sessionUUID](self, "sessionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (mTransport)
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p { state = %@, session = %@, transport = %@ }>"), v5, self, v7, v9, self->mTransport);
  else
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p { state = %@, session = %@ }>"), v5, self, v7, v9, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)prepareTaskOperationForRequest:(id)a3
{
  id v4;
  CATRemoteTaskOperation *v5;
  uint64_t v6;
  CATRemoteTaskOperation *v7;
  _QWORD *v8;
  NSObject *v9;
  _QWORD *v10;
  CATRemoteTaskOperation *v11;
  CATRemoteTaskOperation *v12;
  _QWORD v14[5];
  CATRemoteTaskOperation *v15;
  _QWORD block[4];
  id v17;

  v4 = a3;
  v5 = -[CATRemoteTaskOperation initWithRequest:client:]([CATRemoteTaskOperation alloc], "initWithRequest:client:", v4, self);

  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__CATTaskClient_prepareTaskOperationForRequest___block_invoke;
  v14[3] = &unk_24C1C5C00;
  v14[4] = self;
  v7 = v5;
  v15 = v7;
  v8 = v14;
  CATGetCatalystQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v8;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_24C1C5998;
  v17 = v10;
  dispatch_async(v9, block);

  v11 = v15;
  v12 = v7;

  return v12;
}

uint64_t __48__CATTaskClient_prepareTaskOperationForRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didPrepareTaskOperation:", *(_QWORD *)(a1 + 40));
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  CATTaskClient *v19;
  _QWORD block[4];
  id v21;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskClient.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__CATTaskClient_postNotificationWithName_userInfo___block_invoke;
  v16[3] = &unk_24C1C5A10;
  v17 = v7;
  v18 = v8;
  v19 = self;
  v10 = v16;
  v11 = v8;
  v12 = v7;
  CATGetCatalystQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v10;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_24C1C5998;
  v21 = v14;
  dispatch_async(v13, block);

}

void __51__CATTaskClient_postNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  CATNotificationMessage *v2;

  v2 = -[CATNotificationMessage initWithName:userInfo:]([CATNotificationMessage alloc], "initWithName:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "sendMessage:", v2);

}

- (void)connectWithTransport:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  _QWORD block[4];
  id v15;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__CATTaskClient_connectWithTransport___block_invoke;
  v11[3] = &unk_24C1C5DA8;
  v12 = v5;
  v13 = a2;
  v11[4] = self;
  v7 = v11;
  v8 = v5;
  CATGetCatalystQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v7;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_24C1C5998;
  v15 = v10;
  dispatch_async(v9, block);

}

void __38__CATTaskClient_connectWithTransport___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v3);

}

- (void)connectWithTransportFromTaskClient:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  _QWORD block[4];
  id v15;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__CATTaskClient_connectWithTransportFromTaskClient___block_invoke;
  v11[3] = &unk_24C1C5DA8;
  v12 = v5;
  v13 = a2;
  v11[4] = self;
  v7 = v11;
  v8 = v5;
  CATGetCatalystQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v7;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_24C1C5998;
  v15 = v10;
  dispatch_async(v9, block);

}

void __52__CATTaskClient_connectWithTransportFromTaskClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v3);

}

- (void)disconnect
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[4];
  id v7;

  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__CATTaskClient_disconnect__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __27__CATTaskClient_disconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
}

- (void)invalidate
{
  id v3;

  CATErrorWithCodeAndUserInfo(503, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CATTaskClient invalidateWithError:](self, "invalidateWithError:", v3);

}

- (void)invalidateWithError:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  _QWORD block[4];
  id v15;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__CATTaskClient_invalidateWithError___block_invoke;
  v11[3] = &unk_24C1C5DA8;
  v12 = v5;
  v13 = a2;
  v11[4] = self;
  v7 = v11;
  v8 = v5;
  CATGetCatalystQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v7;
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_11;
  block[3] = &unk_24C1C5998;
  v15 = v10;
  dispatch_async(v9, block);

}

void __37__CATTaskClient_invalidateWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v4, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitionWithTriggeringEvent:", v3);

}

- (void)didPrepareTaskOperation:(id)a3
{
  id v5;
  NSObject *v6;
  CATStateMachine *mFSM;
  void *v8;
  id v9;

  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v9, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v8);
}

- (void)enqueueTaskOperation:(id)a3
{
  NSObject *v4;
  NSMutableArray *mEnqueuedTaskUUIDs;
  void *v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mEnqueuedTaskUUIDs = self->mEnqueuedTaskUUIDs;
  objc_msgSend(v7, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](mEnqueuedTaskUUIDs, "addObject:", v6);

  -[CATTaskClient trackTaskOperation:](self, "trackTaskOperation:", v7);
}

- (void)trackTaskOperation:(id)a3
{
  id v4;
  NSObject *v5;
  NSMapTable *mRemoteTaskByUUID;
  id v7;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  mRemoteTaskByUUID = self->mRemoteTaskByUUID;
  objc_msgSend(v4, "UUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](mRemoteTaskByUUID, "setObject:forKey:", v4, v7);

}

- (void)taskOperationDidFailWithInvalidTaskClient:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;

  v3 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  CATErrorWithCodeAndUserInfo(501, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientFailedWithError:", v5);

}

- (void)resumeCapturedTransportFromTaskClient:(id)a3
{
  NSObject *v5;
  CATTaskClient *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CATTaskClient *v11;

  v11 = (CATTaskClient *)a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  v6 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskClient.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherClient"));

    v6 = 0;
  }
  if (self == v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("CATTaskClient.m"), 247, CFSTR("%@ cannot call %@ when the other client is the receiver"), v11, v10);

    v6 = v11;
  }
  -[CATTaskClient captureTransport](v6, "captureTransport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskClient resumeTransport:](self, "resumeTransport:", v7);

}

- (id)captureTransport
{
  NSObject *v4;
  CATTransport *mTransport;
  CATTransport *v6;
  CATTransport *v7;
  void *v8;
  void *v10;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mTransport = self->mTransport;
  if (!mTransport)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskClient.m"), 258, CFSTR("%@: Can't capture transport when one doesn't exist"), self);

    mTransport = self->mTransport;
  }
  v6 = mTransport;
  -[CATTransport suspend](v6, "suspend");
  -[CATTransport setDelegate:](v6, "setDelegate:", 0);
  v7 = self->mTransport;
  self->mTransport = 0;

  CATErrorWithCodeAndUserInfo(505, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskClient invalidateWithError:](self, "invalidateWithError:", v8);

  dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  return v6;
}

- (void)resumeTransport:(id)a3
{
  NSObject *v6;
  CATTransport *v7;
  void *v8;
  CATTransport *v9;

  v9 = (CATTransport *)a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskClient.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transport"));

  }
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  v7 = v9;
  if (self->mTransport != v9)
  {
    dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
    -[CATTaskClient abandonTransport](self, "abandonTransport");
    objc_storeStrong((id *)&self->mTransport, a3);
    -[CATTransport setDelegate:](self->mTransport, "setDelegate:", self);
    -[CATTransport resume](self->mTransport, "resume");
    v7 = v9;
  }

}

- (void)abandonTransport
{
  NSObject *v3;
  CATTransport *mTransport;
  CATTransport *v5;
  NSHashTable *mOrphanedTransports;
  NSHashTable *v7;
  NSHashTable *v8;
  CATTransport *v9;

  if (!self->mIsStarting)
  {
    CATGetCatalystQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    CATAssertIsQueue(v3);

    mTransport = self->mTransport;
    if (mTransport)
    {
      v9 = mTransport;
      -[CATTransport setDelegate:](self->mTransport, "setDelegate:", 0);
      v5 = self->mTransport;
      self->mTransport = 0;

      mOrphanedTransports = self->mOrphanedTransports;
      if (!mOrphanedTransports)
      {
        objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->mOrphanedTransports;
        self->mOrphanedTransports = v7;

        mOrphanedTransports = self->mOrphanedTransports;
      }
      -[NSHashTable addObject:](mOrphanedTransports, "addObject:", v9);
      -[CATTransport invalidate](v9, "invalidate");
      dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);

    }
  }
}

- (void)sessionResumedWithTaskUUIDs:(id)a3
{
  id v5;
  NSObject *v6;
  CATStateMachine *mFSM;
  void *v8;
  id v9;

  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v9, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v8);
}

- (void)resumeWithTaskUUIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  v24 = v4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", self->mEnqueuedTaskUUIDs);
  -[NSMutableArray removeAllObjects](self->mEnqueuedTaskUUIDs, "removeAllObjects");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = self->mEnqueuedMessages;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "taskUUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v6, "containsObject:", v13);

          if (!v14)
            continue;
        }
        -[CATTaskClient sendMessageThroughTransport:](self, "sendMessageThroughTransport:", v12);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  -[NSMutableArray removeAllObjects](self->mEnqueuedMessages, "removeAllObjects");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMapTable objectEnumerator](self->mRemoteTaskByUUID, "objectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v20, "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v6, "containsObject:", v21);

        if ((v22 & 1) == 0)
        {
          CATErrorWithCodeAndUserInfo(502, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "clientFailedWithError:", v23);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v17);
  }

}

- (void)delegateWillInvalidateAndInvalidateSessionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  CATSessionMessageInvalidate *v6;
  NSObject *mSessionDidInvalidateGroup;
  NSObject *v8;
  _QWORD block[5];

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATTaskClient delegateWillInvalidate](self, "delegateWillInvalidate");
  objc_storeStrong((id *)&self->mStrongSelf, self);
  if (self->mTransport)
  {
    v6 = -[CATSessionMessageInvalidate initWithError:]([CATSessionMessageInvalidate alloc], "initWithError:", v4);
    -[CATTaskClient sendMessageThroughTransport:](self, "sendMessageThroughTransport:", v6);

  }
  mSessionDidInvalidateGroup = self->mSessionDidInvalidateGroup;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CATTaskClient_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke;
  block[3] = &unk_24C1C5A60;
  block[4] = self;
  dispatch_group_notify(mSessionDidInvalidateGroup, v8, block);

}

uint64_t __69__CATTaskClient_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidInvalidate");
}

- (void)sessionDidInvalidate
{
  NSObject *v4;
  CATStateMachine *mFSM;
  void *v6;
  id v7;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v6);

}

- (void)abandonTransportClearQueuedMessagesAndCancelAllOperationsWithError:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[CATTaskClient abandonTransport](self, "abandonTransport");
  -[CATTaskClient clearQueuedMessagesAndCancelAllOperationsWithError:](self, "clearQueuedMessagesAndCancelAllOperationsWithError:", v5);

}

- (void)clearQueuedMessagesAndCancelAllOperationsWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[NSMutableArray removeAllObjects](self->mEnqueuedTaskUUIDs, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->mEnqueuedMessages, "removeAllObjects");
  -[NSMapTable objectEnumerator](self->mRemoteTaskByUUID, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "makeObjectsPerformSelector:withObject:", sel_clientFailedWithError_, v4);
}

- (void)sendMessage:(id)a3
{
  id v5;
  NSObject *v6;
  CATStateMachine *mFSM;
  void *v8;
  id v9;

  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v9, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v8);
}

- (void)resumeSession
{
  NSObject *v3;
  CATSessionMessageResume *v4;
  void *v5;
  void *v6;
  CATSessionMessageResume *v7;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  v4 = [CATSessionMessageResume alloc];
  -[CATTaskClient sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CATSessionMessageResume initWithSessionUUID:](v4, "initWithSessionUUID:", v5);

  -[CATTaskClient userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATSessionMessageResume setClientUserInfo:](v7, "setClientUserInfo:", v6);

  -[CATTaskClient sendMessageThroughTransport:](self, "sendMessageThroughTransport:", v7);
}

- (void)sendMessageThroughTransport:(id)a3
{
  NSObject *v5;
  CATTransport *mTransport;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  mTransport = self->mTransport;
  if (!mTransport)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskClient.m"), 441, CFSTR("%@ cannot call %@ with %@ when there is no transport"), self, v8, v9);

    mTransport = self->mTransport;
  }
  -[CATTransport sendMessage:](mTransport, "sendMessage:", v9);

}

- (void)enqueueMessage:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[NSMutableArray addObject:](self->mEnqueuedMessages, "addObject:", v5);
}

- (void)delegateDidInvalidateAndFinalize
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD block[4];
  id v11;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTaskClient delegateDidInvalidate](self, "delegateDidInvalidate");
  if (self->mStrongSelf)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x24BDAC760];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__CATTaskClient_delegateDidInvalidateAndFinalize__block_invoke;
    v7[3] = &unk_24C1C58B0;
    objc_copyWeak(&v8, &location);
    v5 = v7;
    CATGetCatalystQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_11;
    block[3] = &unk_24C1C5998;
    v11 = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __49__CATTaskClient_delegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[8];
    WeakRetained[8] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)remoteTaskOperation:(id)a3 preparedMessage:(id)a4
{
  id v6;
  NSObject *v7;
  NSMutableSet *mActiveRemoteTaskOperations;
  NSMutableSet *v9;
  NSMutableSet *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  mActiveRemoteTaskOperations = self->mActiveRemoteTaskOperations;
  if (!mActiveRemoteTaskOperations)
  {
    v9 = (NSMutableSet *)objc_opt_new();
    v10 = self->mActiveRemoteTaskOperations;
    self->mActiveRemoteTaskOperations = v9;

    mActiveRemoteTaskOperations = self->mActiveRemoteTaskOperations;
  }
  if ((-[NSMutableSet containsObject:](mActiveRemoteTaskOperations, "containsObject:", v12) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->mActiveRemoteTaskOperations, "addObject:", v12);
    dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
    CATGetCatalystQueue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:selector:forOperationEvents:delegateQueue:", self, sel_activeOperationDidFinish_, 6, v11);

  }
  -[CATTaskClient sendMessage:](self, "sendMessage:", v6);

}

- (void)activeOperationDidFinish:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[NSMutableSet containsObject:](self->mActiveRemoteTaskOperations, "containsObject:", v5))
  {
    -[NSMutableSet removeObject:](self->mActiveRemoteTaskOperations, "removeObject:", v5);
    dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  }

}

- (void)transportDidResume:(id)a3
{
  NSObject *v5;
  CATStateMachine *mFSM;
  void *v7;
  id v8;

  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v7);

}

- (void)transport:(id)a3 didSendMessage:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a4;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue((dispatch_queue_t)v6);

  objc_opt_class();
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if ((v6 & 1) != 0)
    -[CATTransport invalidate](self->mTransport, "invalidate");
}

- (void)transport:(id)a3 didFailToSendMessage:(id)a4 error:(id)a5
{
  id v6;
  uint64_t v7;

  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue((dispatch_queue_t)v7);

  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
    -[CATTransport invalidate](self->mTransport, "invalidate");
}

- (void)transport:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CATTaskClient processSessionMessage:](self, "processSessionMessage:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CATTaskClient processNotificationMessage:](self, "processNotificationMessage:", v5);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CATTaskClient processTaskMessage:](self, "processTaskMessage:", v5);
      }
      else
      {
        v11 = CFSTR("kCATErrorMessageNameKey");
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        CATErrorWithCodeAndUserInfo(300, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v10);

      }
    }
  }

}

- (void)transport:(id)a3 didInterruptWithError:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v6);
}

- (void)transportDidInvalidate:(id)a3
{
  NSObject *v5;
  CATStateMachine *mFSM;
  void *v7;
  id v8;

  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v7);

}

- (void)processSessionMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = CFSTR("kCATErrorMessageNameKey");
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(300, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v16);

LABEL_14:
      goto LABEL_15;
    }
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      CATErrorWithCodeAndUserInfo(502, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;

    objc_msgSend(v14, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("Catalyst.error")))
    {
      v18 = objc_msgSend(v14, "code");

      if (v18 == 502)
        goto LABEL_13;
    }
    else
    {

    }
    v23 = *MEMORY[0x24BDD1398];
    v24[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(502, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
LABEL_13:
    -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v14);
    goto LABEL_14;
  }
  v6 = v4;
  objc_msgSend(v6, "sessionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskClient setSessionUUID:](self, "setSessionUUID:", v7);

  objc_msgSend(v6, "serverUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskClient setServerUserInfo:](self, "setServerUserInfo:", v8);

  objc_msgSend(v6, "pendingRemoteTaskUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATTaskClient sessionResumedWithTaskUUIDs:](self, "sessionResumedWithTaskUUIDs:", v9);
LABEL_15:

}

- (void)processTaskMessage:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  CATStateMachine *mFSM;
  void *v9;
  void *v10;
  char isKindOfClass;
  NSMapTable *mRemoteTaskByUUID;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  objc_msgSend(v5, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CATErrorWithCodeAndUserInfo(301, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v17);
LABEL_7:

    goto LABEL_10;
  }
  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mFSM) = -[CATStateMachine canTransitionWithTriggeringEvent:](mFSM, "canTransitionWithTriggeringEvent:", v10);

  if ((mFSM & 1) == 0)
  {
    v22 = CFSTR("kCATErrorMessageNameKey");
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(302, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v20);

    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  mRemoteTaskByUUID = self->mRemoteTaskByUUID;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = v5;
    objc_msgSend(v13, "taskUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](mRemoteTaskByUUID, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "taskError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "clientFailedWithError:", v16);
  }
  else
  {
    objc_msgSend(v5, "taskUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](mRemoteTaskByUUID, "objectForKey:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "processMessage:", v5);
  }

LABEL_10:
}

- (void)processNotificationMessage:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  CATStateMachine *mFSM;
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *mRemoteTaskByUUID;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CATErrorWithCodeAndUserInfo(301, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v15);
LABEL_9:

    goto LABEL_10;
  }
  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mFSM) = -[CATStateMachine canTransitionWithTriggeringEvent:](mFSM, "canTransitionWithTriggeringEvent:", v10);

  if ((mFSM & 1) == 0)
  {
    v19 = CFSTR("kCATErrorMessageNameKey");
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(302, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskClient delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v18);

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v5, "taskUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v5, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskClient delegatedidReceiveNotificationWithName:userInfo:](self, "delegatedidReceiveNotificationWithName:userInfo:", v15, v17);
    goto LABEL_8;
  }
  mRemoteTaskByUUID = self->mRemoteTaskByUUID;
  objc_msgSend(v5, "taskUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](mRemoteTaskByUUID, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "processMessage:", v5);
LABEL_10:

}

- (void)delegatedidReceiveNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  -[CATTaskClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CATTaskClient delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "client:didReceiveNotificationWithName:userInfo:", self, v11, v6);

  }
}

- (void)delegateDidConnect
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTaskClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskClient delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientDidConnect:", self);

  }
}

- (void)delegateDidInterruptWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[CATTaskClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATTaskClient delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "client:didInterruptWithError:", self, v8);

  }
}

- (void)delegateDidDisconnect
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTaskClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskClient delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientDidDisconnect:", self);

  }
}

- (void)delegateWillInvalidate
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTaskClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskClient delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientWillInvalidate:", self);

  }
}

- (void)delegateDidInvalidate
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTaskClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskClient delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientDidInvalidate:", self);

  }
}

- (CATTransport)transport
{
  return self->mTransport;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (CATTaskClientDelegate)delegate
{
  return (CATTaskClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)serverUserInfo
{
  return self->_serverUserInfo;
}

- (void)setServerUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverUserInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->mSessionDidInvalidateGroup, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mOrphanedTransports, 0);
  objc_storeStrong((id *)&self->mEnqueuedTaskUUIDs, 0);
  objc_storeStrong((id *)&self->mEnqueuedMessages, 0);
  objc_storeStrong((id *)&self->mRemoteTaskByUUID, 0);
  objc_storeStrong((id *)&self->mActiveRemoteTaskOperations, 0);
  objc_storeStrong((id *)&self->mTransport, 0);
  objc_storeStrong((id *)&self->mFSM, 0);
}

@end
