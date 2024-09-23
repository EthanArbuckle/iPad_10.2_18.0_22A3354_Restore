@implementation CATTransport

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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTransport.m"), 49, CFSTR("%@ cannot dealloc while receiver is still valid."), self);

  }
  v8.receiver = self;
  v8.super_class = (Class)CATTransport;
  -[CATTransport dealloc](&v8, sel_dealloc);
}

- (CATTransport)init
{
  CATTransport *v2;
  uint64_t v3;
  CATOperationQueue *mControlQueue;
  void *v5;
  void *v6;
  uint64_t v7;
  CATOperationQueue *mMessageQueue;
  void *v9;
  void *v10;
  CATStateMachine *v11;
  CATStateMachine *mFSM;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CATTransport;
  v2 = -[CATTransport init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mControlQueue = v2->mControlQueue;
    v2->mControlQueue = (CATOperationQueue *)v3;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p.control"), objc_opt_class(), v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setName:](v2->mControlQueue, "setName:", v5);

    CATGetCatalystQueue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setUnderlyingQueue:](v2->mControlQueue, "setUnderlyingQueue:", v6);

    v7 = objc_opt_new();
    mMessageQueue = v2->mMessageQueue;
    v2->mMessageQueue = (CATOperationQueue *)v7;

    -[CATOperationQueue setMaxConcurrentOperationCount:](v2->mMessageQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p.messages"), objc_opt_class(), v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setName:](v2->mMessageQueue, "setName:", v9);

    CATGetCatalystQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATOperationQueue setUnderlyingQueue:](v2->mMessageQueue, "setUnderlyingQueue:", v10);

    -[CATOperationQueue setSuspended:](v2->mMessageQueue, "setSuspended:", 1);
    v11 = -[CATStateMachine initWithTarget:]([CATStateMachine alloc], "initWithTarget:", v2);
    mFSM = v2->mFSM;
    v2->mFSM = v11;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("CATTransportLogLevel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", objc_msgSend(v14, "integerValue"));

    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Not Connected (Suspended)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connecting"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connecting (Suspended)"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connected"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connected (Suspended)"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidating"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidated"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("resume"), sel_sendHelloMessageAndResumeQueue);
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:", v19, CFSTR("invalidate"));
    objc_msgSend(v15, "addTransitionToState:triggeringEvent:action:", 0);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v16, CFSTR("resume"));
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v19, CFSTR("invalidate"), sel_cancelHelloMessageAndResumeQueueOperations);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueSendForMessage_);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", v17, CFSTR("suspend"), sel_suspendQueueAndConnection);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", v19, CFSTR("invalidate"), sel_cancelHelloMessageAndResumeQueueOperations);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueSendForMessage_);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("didReceiveMessage:"), sel_enqueueDelegateDidConnect);
    objc_msgSend(v16, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didInterruptWithError:"), sel_enqueueDelegateCouldNotConnectWithError_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", v22, CFSTR("suspend"), sel_suspendQueueAndConnection);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", v19, CFSTR("invalidate"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueSendForMessage_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didReceiveMessage:"), sel_enqueueDelegateDidReceiveMessage_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("didInterruptWithError:"), sel_enqueueDelegateDidInterruptWithError_);
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("resume"), sel_resumeQueueAndConnection);
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:", v19, CFSTR("invalidate"));
    objc_msgSend(v22, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueSendForMessage_);
    objc_msgSend(v19, "setEnterAction:", sel_cancelAndResumeQueuesAndEnqueueInvalidateConnection);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidate"));
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_invalidSendForMessage_);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:", v21, CFSTR("didInvalidate"));
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:", 0, CFSTR("didReceiveMessage:"));
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:", 0, CFSTR("didInterruptWithError:"));
    objc_msgSend(v21, "setEnterAction:", sel_enqueueDelegateDidInvalidateAndFinalize);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidate"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_invalidSendForMessage_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("didInterruptWithError:"));
    -[CATStateMachine start](v2->mFSM, "start");

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CATTransport name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  if (v3)
  {
    -[CATTransport name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine currentState](self->mFSM, "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p { name = %@, state = %@ }>"), v5, self, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CATStateMachine currentState](self->mFSM, "currentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p { state = %@ }>"), v5, self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[CATTransport description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("\nControl Queue:%@"), self->mControlQueue);
  objc_msgSend(v5, "appendFormat:", CFSTR("\nMessage Queue:%@"), self->mMessageQueue);
  return v5;
}

- (void)resume
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

- (void)suspend
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

- (void)invalidate
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

- (void)didReceiveMessage:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  CATTransport *v16;
  id v17;

  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD1478];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __34__CATTransport_didReceiveMessage___block_invoke;
  v15 = &unk_24C1C5C00;
  v16 = self;
  v17 = v8;
  v10 = v8;
  objc_msgSend(v9, "blockOperationWithBlock:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setName:", CFSTR("Receive Message"), v12, v13, v14, v15, v16);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v11);

}

void __34__CATTransport_didReceiveMessage___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD108A4]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "transitionWithTriggeringEvent:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)didInterruptWithError:(id)a3
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

- (void)didInvalidate
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

- (void)sendHelloMessageAndResumeQueue
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x24BDD1478];
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke;
  v13[3] = &unk_24C1C58B0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v4, "blockOperationWithBlock:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", CFSTR("Resume Connection"));
  v7 = (void *)objc_opt_new();
  -[CATTransport operationToSendMessage:](self, "operationToSendMessage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD1478];
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke_2;
  v11[3] = &unk_24C1C58B0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v9, "blockOperationWithBlock:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setName:", CFSTR("Resume Queue"));
  objc_msgSend(v8, "addDependency:", v6);
  objc_msgSend(v10, "addDependency:", v8);
  -[CATOperationQueue addOperation:](self->mControlQueue, "addOperation:", v6);
  -[CATOperationQueue addOperation:](self->mControlQueue, "addOperation:", v8);
  -[CATOperationQueue addOperation:](self->mControlQueue, "addOperation:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "delegateDidResume");

  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "resumeConnection");

  objc_autoreleasePoolPop(v2);
}

void __46__CATTransport_sendHelloMessageAndResumeQueue__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resumeQueue");

  objc_autoreleasePoolPop(v2);
}

- (void)cancelHelloMessageAndResumeQueueOperations
{
  -[CATOperationQueue cancelAllOperations](self->mControlQueue, "cancelAllOperations");
}

- (void)resumeQueueAndConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(id *);
  void *v9;
  id v10;
  id location;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x24BDD1478];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __40__CATTransport_resumeQueueAndConnection__block_invoke;
  v9 = &unk_24C1C58B0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "blockOperationWithBlock:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", CFSTR("Resume Queue and Connection"), v6, v7, v8, v9);
  -[CATOperationQueue addOperation:](self->mControlQueue, "addOperation:", v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __40__CATTransport_resumeQueueAndConnection__block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  id v6;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "delegateDidResume");

  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "resumeConnection");

  v6 = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "resumeQueue");

  objc_autoreleasePoolPop(v2);
}

- (void)suspendQueueAndConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTransport suspendConnection](self, "suspendConnection");
  -[CATTransport suspendQueue](self, "suspendQueue");
}

- (void)resumeQueue
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATOperationQueue setSuspended:](self->mMessageQueue, "setSuspended:", 0);
}

- (void)suspendQueue
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATOperationQueue setSuspended:](self->mMessageQueue, "setSuspended:", 1);
}

- (void)enqueueSendForMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATTransport operationToSendMessage:](self, "operationToSendMessage:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", CFSTR("Send Message"));
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __38__CATTransport_enqueueSendForMessage___block_invoke;
  v13 = &unk_24C1C5E98;
  v7 = v6;
  v14 = v7;
  objc_copyWeak(&v16, &location);
  v8 = v4;
  v15 = v8;
  +[NSBlockOperation blockOperationWithBlock:](_CATTransportDidSendMessageOperation, "blockOperationWithBlock:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", CFSTR("Delegate Did Send Message"), v10, v11, v12, v13);
  objc_msgSend(v9, "setQueuePriority:", 4);
  objc_msgSend(v9, "addDependency:", v7);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v7);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __38__CATTransport_enqueueSendForMessage___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id WeakRetained;
  void *v15;
  char v16;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0)
    {
      v5 = 0;
      goto LABEL_12;
    }
    v11 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v12, "transport:didSendMessage:", v13, *(_QWORD *)(a1 + 40));
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Catalyst.error")))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 != 404)
      goto LABEL_6;
    CATErrorWithCodeAndUserInfo(200, 0);
    v6 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v12, "transport:didFailToSendMessage:error:", v13, *(_QWORD *)(a1 + 40), v5);
LABEL_10:

  }
LABEL_12:

  objc_autoreleasePoolPop(v2);
}

- (void)invalidSendForMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__CATTransport_invalidSendForMessage___block_invoke;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v9 = v6;
  +[NSBlockOperation blockOperationWithBlock:](_CATTransportDidSendMessageOperation, "blockOperationWithBlock:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", CFSTR("Invalid Send"));
  objc_msgSend(v7, "setQueuePriority:", 4);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __38__CATTransport_invalidSendForMessage___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    v10 = *(_QWORD *)(a1 + 32);
    CATErrorWithCodeAndUserInfo(200, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transport:didFailToSendMessage:error:", v9, v10, v11);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)cancelAndResumeQueuesAndEnqueueInvalidateConnection
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  objc_storeStrong((id *)&self->mStrongSelf, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__CATTransport_cancelAndResumeQueuesAndEnqueueInvalidateConnection__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", CFSTR("Invalidate Connection"));
  -[CATOperationQueue addOperation:](self->mControlQueue, "addOperation:", v4);

}

void __67__CATTransport_cancelAndResumeQueuesAndEnqueueInvalidateConnection__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD108A4]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancelAllOperations");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setSuspended:", 0);
  objc_msgSend(*(id *)(a1 + 32), "invalidateConnection");
  objc_autoreleasePoolPop(v2);
}

- (void)enqueueDelegateDidInvalidateAndFinalize
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (!self->mStrongSelf)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTransport.m"), 386, CFSTR("%@ cannot call %@ when it has not created a strong reference to self"), self, v11);

  }
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDD1478];
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke;
  v14[3] = &unk_24C1C58B0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v5, "blockOperationWithBlock:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", CFSTR("Delegate Did Invalidate"));
  v8 = (void *)MEMORY[0x24BDD1478];
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke_2;
  v12[3] = &unk_24C1C58B0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "blockOperationWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", CFSTR("Finalize Transport"));
  objc_msgSend(v9, "addDependency:", v7);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v7);
  -[CATOperationQueue addOperation:](self->mControlQueue, "addOperation:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegateDidInvalidate");

  objc_autoreleasePoolPop(v2);
}

void __55__CATTransport_enqueueDelegateDidInvalidateAndFinalize__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 4);
    *((_QWORD *)WeakRetained + 4) = 0;

  }
  objc_autoreleasePoolPop(v2);
}

- (void)resumeConnection
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTransport.m"), 420, CFSTR("%@ must override %@"), self, v4);

}

- (void)suspendConnection
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTransport.m"), 426, CFSTR("%@ must override %@"), self, v4);

}

- (void)invalidateConnection
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTransport.m"), 432, CFSTR("%@ must override %@"), self, v4);

}

- (id)operationToSendMessage:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTransport.m"), 438, CFSTR("%@ must override %@"), self, v6);

  return 0;
}

- (void)delegateDidResume
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTransport delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTransport delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transportDidResume:", self);

  }
}

- (void)enqueueDelegateDidConnect
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x24BDD1478];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __41__CATTransport_enqueueDelegateDidConnect__block_invoke;
  v9 = &unk_24C1C58B0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "blockOperationWithBlock:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", CFSTR("Delegate Did Connect"), v6, v7, v8, v9);
  objc_msgSend(v5, "setQueuePriority:", 4);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__CATTransport_enqueueDelegateDidConnect__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v4);
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained(v4);
    objc_msgSend(v9, "transportDidConnect:", v10);

  }
  objc_autoreleasePoolPop(v2);
}

- (void)enqueueDelegateDidReceiveMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDD1478];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__CATTransport_enqueueDelegateDidReceiveMessage___block_invoke;
  v9[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "blockOperationWithBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", CFSTR("Delegate Did Receive Message"));
  objc_msgSend(v8, "setQueuePriority:", 4);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __49__CATTransport_enqueueDelegateDidReceiveMessage___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "transport:didReceiveMessage:", v9, *(_QWORD *)(a1 + 32));

  }
  objc_autoreleasePoolPop(v2);
}

- (void)enqueueDelegateCouldNotConnectWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  v8 = *MEMORY[0x24BDD1398];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CATErrorWithCodeAndUserInfo(202, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATTransport enqueueDelegateDidInterruptWithError:](self, "enqueueDelegateDidInterruptWithError:", v7);
}

- (void)enqueueDelegateDidInterruptWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDD1478];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__CATTransport_enqueueDelegateDidInterruptWithError___block_invoke;
  v9[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v11, &location);
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "blockOperationWithBlock:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", CFSTR("Delegate Did Interrupt"));
  objc_msgSend(v8, "setQueuePriority:", 4);
  -[CATOperationQueue addOperation:](self->mMessageQueue, "addOperation:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __53__CATTransport_enqueueDelegateDidInterruptWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  char v6;
  id v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x20BD108A4]();
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "transport:didInterruptWithError:", v9, *(_QWORD *)(a1 + 32));

  }
  objc_autoreleasePoolPop(v2);
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

  -[CATTransport delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTransport delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transportDidInvalidate:", self);

  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CATTransportDelegate)delegate
{
  return (CATTransportDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mMessageQueue, 0);
  objc_storeStrong((id *)&self->mControlQueue, 0);
  objc_storeStrong((id *)&self->mFSM, 0);
}

@end
