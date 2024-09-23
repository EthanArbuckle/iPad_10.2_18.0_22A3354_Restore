@implementation CATTaskSession

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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 65, CFSTR("%@ cannot dealloc while receiver is still valid."), self);

  }
  v8.receiver = self;
  v8.super_class = (Class)CATTaskSession;
  -[CATTaskSession dealloc](&v8, sel_dealloc);
}

- (CATTaskSession)init
{
  CATTaskSession *v2;
  uint64_t v3;
  NSMutableSet *mOperations;
  uint64_t v5;
  NSMutableDictionary *mOperationByRemoteUUID;
  uint64_t v7;
  NSMutableArray *mEnqueuedMessages;
  dispatch_group_t v9;
  OS_dispatch_group *mSessionDidInvalidateGroup;
  uint64_t v11;
  NSMapTable *mRemoteUUIDsByFinishedOperationProgressUpdates;
  CATStateMachine *v13;
  CATStateMachine *mFSM;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CATTaskSession;
  v2 = -[CATTaskSession init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mOperations = v2->mOperations;
    v2->mOperations = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    mOperationByRemoteUUID = v2->mOperationByRemoteUUID;
    v2->mOperationByRemoteUUID = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    mEnqueuedMessages = v2->mEnqueuedMessages;
    v2->mEnqueuedMessages = (NSMutableArray *)v7;

    v9 = dispatch_group_create();
    mSessionDidInvalidateGroup = v2->mSessionDidInvalidateGroup;
    v2->mSessionDidInvalidateGroup = (OS_dispatch_group *)v9;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    mRemoteUUIDsByFinishedOperationProgressUpdates = v2->mRemoteUUIDsByFinishedOperationProgressUpdates;
    v2->mRemoteUUIDsByFinishedOperationProgressUpdates = (NSMapTable *)v11;

    v13 = -[CATStateMachine initWithTarget:]([CATStateMachine alloc], "initWithTarget:", v2);
    mFSM = v2->mFSM;
    v2->mFSM = v13;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("CATTaskLogLevel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", objc_msgSend(v16, "integerValue"));

    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Disconnected"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connecting"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Negotiating"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Connected"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidating"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidated"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnterAction:");
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueMessage_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("connectWithTransportFromTaskSession:"), sel_resumeCapturedTransportFromTaskSession_);
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", v21, CFSTR("invalidateWithError:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueMessage_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("connectWithTransportFromTaskSession:"), sel_resumeCapturedTransportFromTaskSession_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", v19, CFSTR("clientDidResumeWithMessage:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", v17, CFSTR("transportDidInvalidate:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:action:", v21, CFSTR("invalidateWithError:"), sel_clearQueuedMessagesAndCancelAllOperationsWithError_);
    objc_msgSend(v19, "setEnterAction:", sel_evaluateConnectionWithResumeMessage_);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_enqueueMessage_);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("connectWithTransportFromTaskSession:"), sel_resumeCapturedTransportFromTaskSession_);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:", v19, CFSTR("clientDidResumeWithMessage:"));
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("acceptConnection"), sel_sendResumedMessage);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("rejectConnection"), sel_enqueueDelegateDidInterruptWithError_);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:", v17, CFSTR("transportDidInvalidate:"));
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:action:", v21, CFSTR("invalidateWithError:"), sel_clearQueuedMessagesAndCancelAllOperationsWithError_);
    objc_msgSend(v20, "setEnterAction:", sel_delegateDidConnect);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_sendMessageThroughTransport_);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("processTaskMessage:"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", 0, CFSTR("processNotificationMessage:"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:action:", v18, CFSTR("connectWithTransport:"), sel_resumeTransport_);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:action:", v20, CFSTR("connectWithTransportFromTaskSession:"), sel_resumeCapturedTransportFromTaskSession_);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", v19, CFSTR("clientDidResumeWithMessage:"));
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:", v17);
    objc_msgSend(v20, "addTransitionToState:triggeringEvent:action:", v21, CFSTR("invalidateWithError:"), sel_clearQueuedMessagesAndCancelAllOperationsWithError_);
    objc_msgSend(v20, "setExitAction:", sel_delegateDidDisconnect);
    objc_msgSend(v21, "setEnterAction:", sel_delegateWillInvalidateAndInvalidateSessionWithError_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_didCompleteSendForMessage_);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidateWithError:"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("clientDidResumeWithMessage:"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", 0, CFSTR("rejectConnection"));
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("transportDidInvalidate:"), sel_abandonTransport);
    objc_msgSend(v21, "addTransitionToState:triggeringEvent:", v23, CFSTR("sessionDidInvalidate"));
    objc_msgSend(v23, "setEnterAction:", sel_delegateDidInvalidateAndFinalize);
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("sendMessage:"), sel_didCompleteSendForMessage_);
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidateWithError:"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", 0, CFSTR("clientDidResumeWithMessage:"));
    objc_msgSend(v23, "addTransitionToState:triggeringEvent:", 0, CFSTR("transportDidInvalidate:"));
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
  -[CATTaskSession sessionUUID](self, "sessionUUID");
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

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  CATNotificationMessage *v11;

  v7 = a4;
  v8 = a3;
  CATGetCatalystQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v9);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v11 = -[CATNotificationMessage initWithName:userInfo:]([CATNotificationMessage alloc], "initWithName:userInfo:", v8, v7);

  -[CATTaskSession sendMessage:](self, "sendMessage:", v11);
}

- (void)enqueueOperation:(id)a3
{
  NSObject *v5;
  void *v6;
  CATOperationQueue *v7;
  CATOperationQueue *mDelegationQueue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

  }
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[NSMutableSet addObject:](self->mOperations, "addObject:", v13);
  dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CATGetCatalystQueue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addTarget:selector:forOperationEvents:delegateQueue:", self, sel_localOperationDidFinish_, 6, v6);
  }
  else
  {
    if (!self->mDelegationQueue)
    {
      v7 = (CATOperationQueue *)objc_opt_new();
      mDelegationQueue = self->mDelegationQueue;
      self->mDelegationQueue = v7;

      CATGetCatalystQueue();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperationQueue setUnderlyingQueue:](self->mDelegationQueue, "setUnderlyingQueue:", v9);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p.delegation"), objc_opt_class(), self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperationQueue setName:](self->mDelegationQueue, "setName:", v10);

    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E8]), "initWithTarget:selector:object:", self, sel_localOperationDidFinish_, v13);
    objc_msgSend(v6, "invocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "retainArguments");

    objc_msgSend(v6, "addDependency:", v13);
    -[CATOperationQueue addOperation:](self->mDelegationQueue, "addOperation:", v6);
  }

  -[CATTaskSession delegateEnqueueOperation:](self, "delegateEnqueueOperation:", v13);
}

- (void)localOperationDidFinish:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[NSMutableSet containsObject:](self->mOperations, "containsObject:", v5))
  {
    -[NSMutableSet removeObject:](self->mOperations, "removeObject:", v5);
    dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  }

}

- (void)connectWithTransport:(id)a3
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

- (void)connectWithTransportFromTaskSession:(id)a3
{
  id v5;
  NSObject *v6;
  CATStateMachine *mFSM;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherSession"));

  }
  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v10, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v8);
}

- (void)disconnect
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTransport invalidate](self->mTransport, "invalidate");
}

- (void)invalidate
{
  id v3;

  CATErrorWithCodeAndUserInfo(503, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CATTaskSession invalidateWithError:](self, "invalidateWithError:", v3);

}

- (void)invalidateWithError:(id)a3
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

- (void)clientDidResumeWithMessage:(id)a3
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

- (void)evaluateConnectionWithResumeMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATTaskSession savePreviousSessionInfo](self, "savePreviousSessionInfo");
  objc_msgSend(v4, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskSession setSessionUUID:](self, "setSessionUUID:", v6);

  objc_msgSend(v4, "clientUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATTaskSession setClientUserInfo:](self, "setClientUserInfo:", v7);
  if (-[CATTaskSession delegateShouldAcceptConnection](self, "delegateShouldAcceptConnection"))
  {
    -[CATTaskSession sessionUUID](self, "sessionUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATTaskSession setSessionUUID:](self, "setSessionUUID:", v9);

    }
    -[CATTaskSession discardPreviousSessionInfo](self, "discardPreviousSessionInfo");
    -[CATTaskSession acceptConnection](self, "acceptConnection");
  }
  else if (self->mTransport)
  {
    -[CATTaskSession restorePreviousSessionInfo](self, "restorePreviousSessionInfo");
    -[CATTaskSession rejectConnection](self, "rejectConnection");
  }
}

- (void)acceptConnection
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

- (void)rejectConnection
{
  NSObject *v4;
  CATStateMachine *mFSM;
  void *v6;
  void *v7;
  id v8;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  CATErrorWithCodeAndUserInfo(504, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATStateMachine transitionWithTriggeringEvent:](mFSM, "transitionWithTriggeringEvent:", v7);

}

- (void)resumeCapturedTransportFromTaskSession:(id)a3
{
  NSObject *v5;
  CATTaskSession *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CATTaskSession *v12;

  v12 = (CATTaskSession *)a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  v6 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherSession"));

    v6 = 0;
  }
  if (self == v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("CATTaskSession.m"), 294, CFSTR("%@ cannot call %@ when the other session is the receiver"), v12, v11);

    v6 = v12;
  }
  -[CATTaskSession clientUserInfo](v6, "clientUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskSession setClientUserInfo:](self, "setClientUserInfo:", v7);

  -[CATTaskSession captureTransport](v12, "captureTransport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskSession resumeTransport:](self, "resumeTransport:", v8);
  -[CATTaskSession sendResumedMessage](self, "sendResumedMessage");

}

- (id)captureTransport
{
  NSObject *v4;
  CATTransport *mTransport;
  CATTransport *v6;
  CATTransport *v7;
  void *v8;
  void *v10;
  void *v11;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mTransport = self->mTransport;
  if (!mTransport)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 308, CFSTR("%@ cannot call %@ when there is no transport"), self, v11);

    mTransport = self->mTransport;
  }
  v6 = mTransport;
  -[CATTransport suspend](v6, "suspend");
  -[CATTransport setDelegate:](v6, "setDelegate:", 0);
  v7 = self->mTransport;
  self->mTransport = 0;

  -[CATTaskSession restorePreviousSessionInfo](self, "restorePreviousSessionInfo");
  CATErrorWithCodeAndUserInfo(505, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskSession invalidateWithError:](self, "invalidateWithError:", v8);

  dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  return v6;
}

- (void)savePreviousSessionInfo
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *mPreviousSessionInfo;
  void *v9;
  void *v10;
  id v11;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (self->mPreviousSessionInfo)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 335, CFSTR("%@ cannot call %@ when previous session has not been popped"), self, v10);

  }
  v11 = (id)objc_opt_new();
  -[CATTaskSession sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("_CATTaskSessionUUID"));

  -[CATTaskSession clientUserInfo](self, "clientUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("_CATTaskSessionClientUserInfo"));

  v7 = (NSDictionary *)objc_msgSend(v11, "copy");
  mPreviousSessionInfo = self->mPreviousSessionInfo;
  self->mPreviousSessionInfo = v7;

}

- (void)restorePreviousSessionInfo
{
  NSObject *v3;
  NSDictionary *mPreviousSessionInfo;
  void *v5;
  id v6;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  mPreviousSessionInfo = self->mPreviousSessionInfo;
  if (mPreviousSessionInfo)
  {
    -[NSDictionary objectForKeyedSubscript:](mPreviousSessionInfo, "objectForKeyedSubscript:", CFSTR("_CATTaskSessionUUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskSession setSessionUUID:](self, "setSessionUUID:", v5);

    -[NSDictionary objectForKeyedSubscript:](self->mPreviousSessionInfo, "objectForKeyedSubscript:", CFSTR("_CATTaskSessionClientUserInfo"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CATTaskSession setClientUserInfo:](self, "setClientUserInfo:", v6);

  }
}

- (void)discardPreviousSessionInfo
{
  NSObject *v3;
  NSDictionary *mPreviousSessionInfo;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  mPreviousSessionInfo = self->mPreviousSessionInfo;
  self->mPreviousSessionInfo = 0;

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transport"));

  }
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  v7 = v9;
  if (self->mTransport != v9)
  {
    dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
    -[CATTaskSession abandonTransport](self, "abandonTransport");
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

- (void)delegateWillInvalidateAndInvalidateSessionWithError:(id)a3
{
  id v4;
  NSObject *v5;
  CATSessionMessageDidInvalidate *v6;
  NSObject *mSessionDidInvalidateGroup;
  NSObject *v8;
  _QWORD block[5];

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATTaskSession delegateWillInvalidate](self, "delegateWillInvalidate");
  objc_storeStrong((id *)&self->mStrongSelf, self);
  if (self->mTransport)
  {
    v6 = -[CATSessionMessageDidInvalidate initWithError:]([CATSessionMessageDidInvalidate alloc], "initWithError:", v4);
    -[CATTaskSession sendMessageThroughTransport:](self, "sendMessageThroughTransport:", v6);

  }
  mSessionDidInvalidateGroup = self->mSessionDidInvalidateGroup;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__CATTaskSession_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke;
  block[3] = &unk_24C1C5A60;
  block[4] = self;
  dispatch_group_notify(mSessionDidInvalidateGroup, v8, block);

}

uint64_t __70__CATTaskSession_delegateWillInvalidateAndInvalidateSessionWithError___block_invoke(uint64_t a1)
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

- (void)clearQueuedMessagesAndCancelAllOperationsWithError:(id)a3
{
  NSObject *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[NSMutableDictionary allValues](self->mOperationByRemoteUUID, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeObjectsPerformSelector:", sel_cancel);

  -[NSMutableSet makeObjectsPerformSelector:](self->mOperations, "makeObjectsPerformSelector:", sel_cancel);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->mEnqueuedMessages;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->mRemoteUUIDsByFinishedOperationProgressUpdates, "objectForKey:", v11, (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable removeObjectForKey:](self->mRemoteUUIDsByFinishedOperationProgressUpdates, "removeObjectForKey:", v11);
        if (v12)
        {
          -[NSMutableDictionary removeObjectForKey:](self->mOperationByRemoteUUID, "removeObjectForKey:", v12);
          dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[NSMutableArray removeAllObjects](self->mEnqueuedMessages, "removeAllObjects");
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

- (void)sendResumedMessage
{
  NSObject *v3;
  CATSessionMessageResumed *v4;
  void *v5;
  CATSessionMessageResumed *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  v4 = [CATSessionMessageResumed alloc];
  -[CATTaskSession sessionUUID](self, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CATSessionMessageResumed initWithSessionUUID:](v4, "initWithSessionUUID:", v5);

  -[NSMutableDictionary allKeys](self->mOperationByRemoteUUID, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATSessionMessageResumed setPendingRemoteTaskUUIDs:](v6, "setPendingRemoteTaskUUIDs:", v7);

  -[CATTaskSession userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATSessionMessageResumed setServerUserInfo:](v6, "setServerUserInfo:", v8);

  -[CATTaskSession sendMessageThroughTransport:](self, "sendMessageThroughTransport:", v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->mEnqueuedMessages;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CATTaskSession sendMessageThroughTransport:](self, "sendMessageThroughTransport:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->mEnqueuedMessages, "removeAllObjects");
}

- (void)sendMessageThroughTransport:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!self->mTransport)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskSession.m"), 489, CFSTR("%@ cannot call %@ with %@ when there is no transport"), self, v7, v8);

  }
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATTransport sendMessage:](self->mTransport, "sendMessage:", v8);
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

- (void)didCompleteSendForMessage:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[CATTransport invalidate](self->mTransport, "invalidate");
  -[NSMapTable objectForKey:](self->mRemoteUUIDsByFinishedOperationProgressUpdates, "objectForKey:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable removeObjectForKey:](self->mRemoteUUIDsByFinishedOperationProgressUpdates, "removeObjectForKey:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->mOperationByRemoteUUID, "removeObjectForKey:", v5);
    dispatch_group_leave((dispatch_group_t)self->mSessionDidInvalidateGroup);
  }

}

- (void)delegateDidInvalidateAndFinalize
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTaskSession delegateDidInvalidate](self, "delegateDidInvalidate");
  if (self->mStrongSelf)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __50__CATTaskSession_delegateDidInvalidateAndFinalize__block_invoke;
    v4[3] = &unk_24C1C58B0;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __50__CATTaskSession_delegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)transport:(id)a3 didSendMessage:(id)a4
{
  -[CATTaskSession didCompleteSendForMessage:](self, "didCompleteSendForMessage:", a4);
}

- (void)transport:(id)a3 didFailToSendMessage:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  CATTaskSession *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_CATLogGeneral_onceToken_16 != -1)
    dispatch_once(&_CATLogGeneral_onceToken_16, &__block_literal_global_22);
  v11 = _CATLogGeneral_logObj_16;
  if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_16, OS_LOG_TYPE_ERROR))
  {
    v12 = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_error_impl(&dword_209592000, v11, OS_LOG_TYPE_ERROR, "%{public}@ failed to send message %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  -[CATTaskSession didCompleteSendForMessage:](self, "didCompleteSendForMessage:", v9);

}

- (void)transport:(id)a3 didReceiveMessage:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSMutableDictionary *mOperationByRemoteUUID;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      objc_msgSend(v7, "taskUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        mOperationByRemoteUUID = self->mOperationByRemoteUUID;
        objc_msgSend(v7, "taskUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](mOperationByRemoteUUID, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_msgSend(v7, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v11, "postNotificationWithName:userInfo:", v13, v14);
        else
          objc_msgSend(v11, "processNotificationWithName:userInfo:", v13, v14);

      }
      else
      {
        -[CATTaskSession processNotificationMessage:](self, "processNotificationMessage:", v7);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CATTaskSession processTaskMessage:](self, "processTaskMessage:", v5);
        goto LABEL_14;
      }
      v18 = CFSTR("kCATErrorMessageNameKey");
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(300, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v17);

    }
    goto LABEL_14;
  }
  -[CATTaskSession processSessionMessage:](self, "processSessionMessage:", v5);
LABEL_14:

}

- (void)transport:(id)a3 didInterruptWithError:(id)a4
{
  NSObject *v5;
  id v6;

  v6 = a4;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v6);
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

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  CATTaskSession *v20;
  _QWORD block[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_getAssociatedObject(v8, CFSTR("_CATTaskSessionOperationRemoteUUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__CATTaskSession_taskOperation_didPostNotificationWithName_userInfo___block_invoke;
    v15[3] = &unk_24C1C61F8;
    v16 = v8;
    v17 = v11;
    v18 = v9;
    v19 = v10;
    v20 = self;
    v13 = v15;
    CATGetCatalystQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __CATPerformBlock_block_invoke_16;
    block[3] = &unk_24C1C5998;
    v22 = v13;
    dispatch_async(v14, block);

  }
}

void __69__CATTaskSession_taskOperation_didPostNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  CATNotificationMessage *v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    v2 = -[CATNotificationMessage initWithTaskUUID:name:userInfo:]([CATNotificationMessage alloc], "initWithTaskUUID:name:userInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 64), "sendMessage:", v2);

  }
}

- (void)processSessionMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
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
      v17 = CFSTR("kCATErrorMessageNameKey");
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CATErrorWithCodeAndUserInfo(300, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v12);

LABEL_14:
      goto LABEL_15;
    }
    objc_msgSend(v4, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      CATErrorWithCodeAndUserInfo(503, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;

    objc_msgSend(v10, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("Catalyst.error")))
    {
      v14 = objc_msgSend(v10, "code");

      if (v14 == 503)
        goto LABEL_13;
    }
    else
    {

    }
    v19 = *MEMORY[0x24BDD1398];
    v20[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(503, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v16;
LABEL_13:
    -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v10);
    goto LABEL_14;
  }
  -[CATTaskSession clientDidResumeWithMessage:](self, "clientDidResumeWithMessage:", v4);
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
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  objc_msgSend(v5, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CATErrorWithCodeAndUserInfo(301, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v11);
LABEL_8:

    goto LABEL_9;
  }
  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mFSM) = -[CATStateMachine canTransitionWithTriggeringEvent:](mFSM, "canTransitionWithTriggeringEvent:", v10);

  if ((mFSM & 1) == 0)
  {
    v19 = CFSTR("kCATErrorMessageNameKey");
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 302;
LABEL_7:
    CATErrorWithCodeAndUserInfo(v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v15);

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CATTaskSession processCancelMessage:](self, "processCancelMessage:", v5);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CATTaskSession processFetchProgressMessage:](self, "processFetchProgressMessage:", v5);
      goto LABEL_9;
    }
    v17 = CFSTR("kCATErrorMessageNameKey");
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 300;
    goto LABEL_7;
  }
  -[CATTaskSession processStartMessage:](self, "processStartMessage:", v5);
LABEL_9:

}

- (void)processStartMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CATTaskMessageError *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CATMutableTaskProgress *v15;
  CATTaskMessageProgressUpdate *v16;
  void *v17;
  CATTaskMessageError *v18;
  void *v19;
  CATTaskMessageError *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  CATTaskMessageError *v25;
  void *v26;
  id v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_msgSend(v4, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    -[CATTaskSession delegatePrepareOperationWithRequest:error:](self, "delegatePrepareOperationWithRequest:error:", v7, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;

    if (v8)
    {
      objc_msgSend(v4, "taskUUID");
      v10 = (CATTaskMessageError *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v8, CFSTR("_CATTaskSessionOperationRemoteUUID"), v10, (void *)0x303);
      objc_msgSend(v8, "notificationDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        objc_msgSend(v8, "setNotificationDelegate:", self);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mOperationByRemoteUUID, "setObject:forKeyedSubscript:", v8, v10);
      objc_msgSend(v4, "cat_assertion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cat_addAssertion:", v12);

      dispatch_group_enter((dispatch_group_t)self->mSessionDidInvalidateGroup);
      CATGetCatalystQueue();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", self, sel_operationDidIncrementProgress_remoteUUID_, 8, v10, v13);

      CATGetCatalystQueue();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:selector:forOperationEvents:userInfo:delegateQueue:", self, sel_operationDidFinish_remoteUUID_, 6, v10, v14);

      v15 = -[CATMutableTaskProgress initWithOperationUUID:]([CATMutableTaskProgress alloc], "initWithOperationUUID:", v10);
      -[CATTaskProgress setPhase:](v15, "setPhase:", 0);
      v16 = -[CATTaskMessageProgressUpdate initWithTaskUUID:progress:]([CATTaskMessageProgressUpdate alloc], "initWithTaskUUID:progress:", v10, v15);
      -[CATTaskSession sendMessage:](self, "sendMessage:", v16);
      -[CATTaskSession delegateEnqueueOperation:](self, "delegateEnqueueOperation:", v8);

    }
    else
    {
      if (!v9)
      {
        v28 = CFSTR("kCATErrorRequestNameKey");
        objc_msgSend(v4, "request");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CATErrorWithCodeAndUserInfo(403, v24);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      v25 = [CATTaskMessageError alloc];
      objc_msgSend(v4, "taskUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CATTaskMessageError initWithTaskUUID:taskError:](v25, "initWithTaskUUID:taskError:", v26, v9);

      -[CATTaskSession sendMessage:](self, "sendMessage:", v10);
    }

  }
  else
  {
    CATErrorWithCodeAndUserInfo(403, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = [CATTaskMessageError alloc];
    objc_msgSend(v4, "taskUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CATTaskMessageError initWithTaskUUID:taskError:](v18, "initWithTaskUUID:taskError:", v19, v17);

    -[CATTaskSession sendMessage:](self, "sendMessage:", v20);
  }

}

- (void)operationDidIncrementProgress:(id)a3 remoteUUID:(id)a4
{
  id v6;
  NSObject *v7;
  CATTaskMessageIncrementalProgress *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  if (self->mTransport)
  {
    v8 = -[CATTaskMessageIncrementalProgress initWithTaskUUID:completedUnitCount:totalUnitCount:]([CATTaskMessageIncrementalProgress alloc], "initWithTaskUUID:completedUnitCount:totalUnitCount:", v6, objc_msgSend(v9, "completedUnitCount"), objc_msgSend(v9, "totalUnitCount"));
    -[CATTaskSession sendMessageThroughTransport:](self, "sendMessageThroughTransport:", v8);

  }
}

- (void)operationDidFinish:(id)a3 remoteUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CATTaskMessageProgressUpdate *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  +[CATTaskProgress progressForOperation:](CATTaskProgress, "progressForOperation:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[CATTaskMessageProgressUpdate initWithTaskUUID:progress:]([CATTaskMessageProgressUpdate alloc], "initWithTaskUUID:progress:", v6, v11);
  -[NSMapTable setObject:forKey:](self->mRemoteUUIDsByFinishedOperationProgressUpdates, "setObject:forKey:", v6, v9);

  objc_msgSend(v7, "cat_assertions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CATMessage setCat_assertion:](v9, "setCat_assertion:", v10);
  -[CATTaskSession sendMessage:](self, "sendMessage:", v9);

}

- (void)processCancelMessage:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *mOperationByRemoteUUID;
  void *v6;
  void *v7;
  void *v8;
  CATTaskMessageError *v9;
  void *v10;
  CATTaskMessageError *v11;
  id v12;

  v12 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mOperationByRemoteUUID = self->mOperationByRemoteUUID;
  objc_msgSend(v12, "taskUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mOperationByRemoteUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "cancel");
  }
  else
  {
    CATErrorWithCodeAndUserInfo(401, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [CATTaskMessageError alloc];
    objc_msgSend(v12, "taskUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CATTaskMessageError initWithTaskUUID:taskError:](v9, "initWithTaskUUID:taskError:", v10, v8);

    -[CATTaskSession sendMessage:](self, "sendMessage:", v11);
  }

}

- (void)processFetchProgressMessage:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *mOperationByRemoteUUID;
  void *v6;
  void *v7;
  void *v8;
  CATTaskMessageError *v9;
  void *v10;
  uint64_t v11;
  CATTaskMessageProgressUpdate *v12;
  void *v13;
  id v14;

  v14 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mOperationByRemoteUUID = self->mOperationByRemoteUUID;
  objc_msgSend(v14, "taskUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mOperationByRemoteUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CATErrorWithCodeAndUserInfo(401, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [CATTaskMessageError alloc];
    objc_msgSend(v14, "taskUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CATTaskMessageError initWithTaskUUID:taskError:](v9, "initWithTaskUUID:taskError:", v10, v8);
LABEL_6:
    v13 = (void *)v11;

    -[CATTaskSession sendMessage:](self, "sendMessage:", v13);
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CATTaskProgress progressForOperation:](CATTaskProgress, "progressForOperation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [CATTaskMessageProgressUpdate alloc];
    objc_msgSend(v14, "taskUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CATTaskMessageProgressUpdate initWithTaskUUID:progress:](v12, "initWithTaskUUID:progress:", v10, v8);
    goto LABEL_6;
  }
  objc_msgSend(v7, "fetchProgress");
LABEL_7:

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
  objc_class *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CATErrorWithCodeAndUserInfo(301, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v11);
LABEL_6:

    goto LABEL_7;
  }
  mFSM = self->mFSM;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CATStateMachineEvent eventWithTrigger:context:](CATStateMachineEvent, "eventWithTrigger:context:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(mFSM) = -[CATStateMachine canTransitionWithTriggeringEvent:](mFSM, "canTransitionWithTriggeringEvent:", v10);

  if ((mFSM & 1) == 0)
  {
    v15 = CFSTR("kCATErrorMessageNameKey");
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(302, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATTaskSession delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v14);

    goto LABEL_6;
  }
  -[CATTaskSession delegatedidReceiveNotificationWithName:](self, "delegatedidReceiveNotificationWithName:", v5);
LABEL_7:

}

- (id)delegatePrepareOperationWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  -[CATTaskSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CATTaskSession delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "session:prepareOperationForRequest:error:", self, v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    v14 = CFSTR("kCATErrorRequestNameKey");
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(403, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (void)delegateEnqueueOperation:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  CATOperationQueue *mOrphanedOperationQueue;
  CATOperationQueue *v9;
  CATOperationQueue *v10;
  void *v11;
  id v12;

  v12 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[CATTaskSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATTaskSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "session:enqueueOperation:", self, v12);

  }
  else
  {
    mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    if (!mOrphanedOperationQueue)
    {
      v9 = (CATOperationQueue *)objc_opt_new();
      v10 = self->mOrphanedOperationQueue;
      self->mOrphanedOperationQueue = v9;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p.orphaned"), objc_opt_class(), self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperationQueue setName:](self->mOrphanedOperationQueue, "setName:", v11);

      -[CATOperationQueue setMaxConcurrentOperationCount:](self->mOrphanedOperationQueue, "setMaxConcurrentOperationCount:", 0x7FFFFFFFFFFFFFFFLL);
      mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    }
    -[CATOperationQueue addOperation:](mOrphanedOperationQueue, "addOperation:", v12);
  }

}

- (BOOL)delegateShouldAcceptConnection
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATTaskSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[CATTaskSession delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "session:shouldAcceptConnectionFromTransport:", self, self->mTransport);

  return v7;
}

- (void)delegatedidReceiveNotificationWithName:(id)a3
{
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  -[CATTaskSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATTaskSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "session:didReceiveNotificationWithName:userInfo:", self, v8, v9);

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

  -[CATTaskSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskSession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionDidConnect:", self);

  }
}

- (void)enqueueDelegateDidInterruptWithError:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  _QWORD block[4];
  id v14;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__CATTaskSession_enqueueDelegateDidInterruptWithError___block_invoke;
  v9[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v9;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_16;
  block[3] = &unk_24C1C5998;
  v14 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __55__CATTaskSession_enqueueDelegateDidInterruptWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegateDidInterruptWithError:", *(_QWORD *)(a1 + 32));

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

  -[CATTaskSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATTaskSession delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "session:didInterruptWithError:", self, v8);

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

  -[CATTaskSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskSession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionDidDisconnect:", self);

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

  -[CATTaskSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskSession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionWillInvalidate:", self);

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

  -[CATTaskSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskSession delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionDidInvalidate:", self);

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

- (CATTaskSessionDelegate)delegate
{
  return (CATTaskSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)clientUserInfo
{
  return self->_clientUserInfo;
}

- (void)setClientUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUserInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->mDelegationQueue, 0);
  objc_storeStrong((id *)&self->mSessionDidInvalidateGroup, 0);
  objc_storeStrong((id *)&self->mRemoteUUIDsByFinishedOperationProgressUpdates, 0);
  objc_storeStrong((id *)&self->mPreviousSessionInfo, 0);
  objc_storeStrong((id *)&self->mOrphanedOperationQueue, 0);
  objc_storeStrong((id *)&self->mOrphanedTransports, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mEnqueuedMessages, 0);
  objc_storeStrong((id *)&self->mOperationByRemoteUUID, 0);
  objc_storeStrong((id *)&self->mOperations, 0);
  objc_storeStrong((id *)&self->mTransport, 0);
  objc_storeStrong((id *)&self->mFSM, 0);
}

@end
