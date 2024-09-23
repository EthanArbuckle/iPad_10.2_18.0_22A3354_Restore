@implementation CATTaskServer

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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskServer.m"), 38, CFSTR("%@ cannot dealloc while receiver is still valid."), self);

  }
  v8.receiver = self;
  v8.super_class = (Class)CATTaskServer;
  -[CATTaskServer dealloc](&v8, sel_dealloc);
}

- (CATTaskServer)init
{
  CATTaskServer *v2;
  uint64_t v3;
  NSMutableSet *mSessions;
  uint64_t v5;
  NSMutableDictionary *mActiveSessionsByUUID;
  uint64_t v7;
  NSMutableDictionary *mInvalidatingSessionsByUUID;
  uint64_t v9;
  NSMutableDictionary *mConnectedSessionsByUUID;
  dispatch_group_t v11;
  OS_dispatch_group *mAllSessionsDidInvalidateGroup;
  CATStateMachine *v13;
  CATStateMachine *mFSM;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CATTaskServer;
  v2 = -[CATTaskServer init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mSessions = v2->mSessions;
    v2->mSessions = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    mActiveSessionsByUUID = v2->mActiveSessionsByUUID;
    v2->mActiveSessionsByUUID = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    mInvalidatingSessionsByUUID = v2->mInvalidatingSessionsByUUID;
    v2->mInvalidatingSessionsByUUID = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    mConnectedSessionsByUUID = v2->mConnectedSessionsByUUID;
    v2->mConnectedSessionsByUUID = (NSMutableDictionary *)v9;

    v11 = dispatch_group_create();
    mAllSessionsDidInvalidateGroup = v2->mAllSessionsDidInvalidateGroup;
    v2->mAllSessionsDidInvalidateGroup = (OS_dispatch_group *)v11;

    v13 = -[CATStateMachine initWithTarget:]([CATStateMachine alloc], "initWithTarget:", v2);
    mFSM = v2->mFSM;
    v2->mFSM = v13;

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForKey:", CFSTR("CATTaskLogLevel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine setLogLevel:](v2->mFSM, "setLogLevel:", objc_msgSend(v16, "integerValue"));

    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Running"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidating"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATStateMachine addStateWithName:](v2->mFSM, "addStateWithName:", CFSTR("Invalidated"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:", v18, CFSTR("invalidateWithError:"));
    objc_msgSend(v17, "addTransitionToState:triggeringEvent:action:", 0, CFSTR("connectWithClientTransport:"), sel_makeSessionWithClientTransport_);
    objc_msgSend(v18, "setEnterAction:", sel_startInvalidatingWithError_);
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidateWithError:"));
    objc_msgSend(v18, "addTransitionToState:triggeringEvent:", v19, CFSTR("allSessionsDidInvalidate"));
    objc_msgSend(v19, "setEnterAction:", sel_delegateDidInvalidateAndFinalize);
    objc_msgSend(v19, "addTransitionToState:triggeringEvent:", 0, CFSTR("invalidateWithError:"));
    -[CATStateMachine start](v2->mFSM, "start");

  }
  return v2;
}

- (void)setUserInfo:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *userInfo;
  id v7;

  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  v7 = (id)-[NSMutableSet copy](self->mSessions, "copy");
  objc_msgSend(v7, "setValue:forKey:", v4, CFSTR("userInfo"));

}

- (NSArray)clientSessions
{
  return (NSArray *)-[NSMutableDictionary allValues](self->mActiveSessionsByUUID, "allValues");
}

- (NSArray)connectedClientSessions
{
  return (NSArray *)-[NSMutableDictionary allValues](self->mConnectedSessionsByUUID, "allValues");
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__CATTaskServer_postNotificationWithName_userInfo___block_invoke;
  v14[3] = &unk_24C1C5A10;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v9 = v14;
  v10 = v7;
  v11 = v6;
  CATGetCatalystQueue();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v9;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_24C1C5998;
  v18 = v13;
  dispatch_async(v12, block);

}

void __51__CATTaskServer_postNotificationWithName_userInfo___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1[4] + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "postNotificationWithName:userInfo:", a1[5], a1[6], (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)connectWithClientTransport:(id)a3
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
  v11[2] = __44__CATTaskServer_connectWithClientTransport___block_invoke;
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
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_24C1C5998;
  v15 = v10;
  dispatch_async(v9, block);

}

void __44__CATTaskServer_connectWithClientTransport___block_invoke(uint64_t a1)
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

- (void)makeSessionWithClientTransport:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->mAllSessionsDidInvalidateGroup);
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__CATTaskServer_makeSessionWithClientTransport___block_invoke;
  v10[3] = &unk_24C1C5C00;
  v10[4] = self;
  v11 = v4;
  v6 = v10;
  v7 = v4;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v6;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_24C1C5998;
  v13 = v9;
  dispatch_async(v8, block);

}

void __48__CATTaskServer_makeSessionWithClientTransport___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v3);
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v2);

  objc_msgSend(v3, "connectWithTransport:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateAllClientSessions
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
  v5[2] = __44__CATTaskServer_invalidateAllClientSessions__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __44__CATTaskServer_invalidateAllClientSessions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "makeObjectsPerformSelector:", sel_invalidate);
}

- (void)disconnectAllClientSessions
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
  v5[2] = __44__CATTaskServer_disconnectAllClientSessions__block_invoke;
  v5[3] = &unk_24C1C5A60;
  v5[4] = self;
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_24C1C5998;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __44__CATTaskServer_disconnectAllClientSessions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "makeObjectsPerformSelector:", sel_disconnect);
}

- (void)invalidate
{
  -[CATTaskServer invalidateWithError:](self, "invalidateWithError:", 0);
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
  v11[2] = __37__CATTaskServer_invalidateWithError___block_invoke;
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
  block[2] = __CATPerformBlock_block_invoke_15;
  block[3] = &unk_24C1C5998;
  v15 = v10;
  dispatch_async(v9, block);

}

void __37__CATTaskServer_invalidateWithError___block_invoke(uint64_t a1)
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

- (void)startInvalidatingWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *mAllSessionsDidInvalidateGroup;
  NSObject *v7;
  _QWORD block[5];

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  objc_storeStrong((id *)&self->mStrongSelf, self);
  -[NSMutableSet makeObjectsPerformSelector:withObject:](self->mSessions, "makeObjectsPerformSelector:withObject:", sel_invalidateWithError_, v4);

  mAllSessionsDidInvalidateGroup = self->mAllSessionsDidInvalidateGroup;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CATTaskServer_startInvalidatingWithError___block_invoke;
  block[3] = &unk_24C1C5A60;
  block[4] = self;
  dispatch_group_notify(mAllSessionsDidInvalidateGroup, v7, block);

}

uint64_t __44__CATTaskServer_startInvalidatingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "allSessionsDidInvalidate");
}

- (void)allSessionsDidInvalidate
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

- (void)delegateDidInvalidateAndFinalize
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id location;

  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (!self->mStrongSelf)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskServer.m"), 190, CFSTR("%@ cannot call %@ when it has not created a strong reference to self"), self, v6);

  }
  -[CATTaskServer delegateDidInvalidate](self, "delegateDidInvalidate");
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CATTaskServer_delegateDidInvalidateAndFinalize__block_invoke;
  block[3] = &unk_24C1C58B0;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__CATTaskServer_delegateDidInvalidateAndFinalize__block_invoke(uint64_t a1)
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

- (BOOL)session:(id)a3 shouldAcceptConnectionFromTransport:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *mActiveSessionsByUUID;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  objc_msgSend(v6, "sessionUUID");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    mActiveSessionsByUUID = self->mActiveSessionsByUUID;
    objc_msgSend(v6, "sessionUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](mActiveSessionsByUUID, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13
      && -[CATTaskServer delegateClientSession:shouldConnectWithTransport:](self, "delegateClientSession:shouldConnectWithTransport:", v13, v7))
    {
      objc_msgSend(v13, "connectWithTransportFromTaskSession:", v6);
LABEL_8:
      v17 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSessionUUID:", v14);

  if (!-[CATTaskServer delegateClientSession:shouldConnectWithTransport:](self, "delegateClientSession:shouldConnectWithTransport:", v6, v7))goto LABEL_8;
  v15 = self->mActiveSessionsByUUID;
  objc_msgSend(v6, "sessionUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v6, v16);

  v17 = 1;
LABEL_9:

  return v17;
}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *mConnectedSessionsByUUID;
  void *v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mConnectedSessionsByUUID = self->mConnectedSessionsByUUID;
  objc_msgSend(v7, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mConnectedSessionsByUUID, "setObject:forKeyedSubscript:", v7, v6);

  -[CATTaskServer delegateClientSessionDidConnect:](self, "delegateClientSessionDidConnect:", v7);
}

- (void)sessionDidDisconnect:(id)a3
{
  NSObject *v4;
  NSMutableDictionary *mConnectedSessionsByUUID;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;

  v10 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  mConnectedSessionsByUUID = self->mConnectedSessionsByUUID;
  objc_msgSend(v10, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](mConnectedSessionsByUUID, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    v8 = self->mConnectedSessionsByUUID;
    objc_msgSend(v10, "sessionUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

  }
  -[CATTaskServer delegateClientSessionDidDisconnect:](self, "delegateClientSessionDidDisconnect:", v10);

}

- (void)session:(id)a3 didInterruptWithError:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  -[CATTaskServer delegateClientSession:didInterruptWithError:](self, "delegateClientSession:didInterruptWithError:", v8, v6);
}

- (void)sessionWillInvalidate:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  objc_msgSend(v7, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mActiveSessionsByUUID, "objectForKeyedSubscript:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      -[NSMutableDictionary removeObjectForKey:](self->mActiveSessionsByUUID, "removeObjectForKey:", v5);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->mInvalidatingSessionsByUUID, "setObject:forKeyedSubscript:", v7, v5);
    }
  }

}

- (void)sessionDidInvalidate:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  objc_msgSend(v8, "sessionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mInvalidatingSessionsByUUID, "objectForKeyedSubscript:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v8;
    if (v6 == v8)
    {
      -[NSMutableDictionary removeObjectForKey:](self->mInvalidatingSessionsByUUID, "removeObjectForKey:", v5);
      v7 = v8;
    }
    -[CATTaskServer delegateSessionDidInvalidate:](self, "delegateSessionDidInvalidate:", v7);
  }
  -[NSMutableSet removeObject:](self->mSessions, "removeObject:", v8);
  dispatch_group_leave((dispatch_group_t)self->mAllSessionsDidInvalidateGroup);

}

- (void)session:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v11 = a3;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v10);

  -[CATTaskServer delegateClientSession:didReceiveNotificationWithName:userInfo:](self, "delegateClientSession:didReceiveNotificationWithName:userInfo:", v11, v9, v8);
}

- (id)session:(id)a3 prepareOperationForRequest:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  CATGetCatalystQueue();
  v11 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v11);

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskServer.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  -[CATTaskServer delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
    if (_CATLogGeneral_onceToken_15 != -1)
      dispatch_once(&_CATLogGeneral_onceToken_15, &__block_literal_global_21);
    v15 = (void *)_CATLogGeneral_logObj_15;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_15, OS_LOG_TYPE_ERROR))
    {
      v20 = v15;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATTaskServer delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_server_clientSession_operationForRequest_error_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      _os_log_error_impl(&dword_209592000, v20, OS_LOG_TYPE_ERROR, "Dropping message (%@) because delegate (%@) does not implement %@", buf, 0x20u);

      if (!a5)
        goto LABEL_10;
    }
    else if (!a5)
    {
      goto LABEL_10;
    }
    v26 = CFSTR("kCATErrorRequestNameKey");
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(400, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
    goto LABEL_10;
  }
  -[CATTaskServer delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "server:clientSession:operationForRequest:error:", self, v9, v10, a5);
  a5 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return a5;
}

- (void)session:(id)a3 enqueueOperation:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  CATOperationQueue *mOrphanedOperationQueue;
  CATOperationQueue *v12;
  CATOperationQueue *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  -[CATTaskServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "server:clientSession:enqueueOperation:", self, v15, v6);

  }
  else
  {
    mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    if (!mOrphanedOperationQueue)
    {
      v12 = (CATOperationQueue *)objc_opt_new();
      v13 = self->mOrphanedOperationQueue;
      self->mOrphanedOperationQueue = v12;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%p.orphaned"), objc_opt_class(), self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CATOperationQueue setName:](self->mOrphanedOperationQueue, "setName:", v14);

      -[CATOperationQueue setMaxConcurrentOperationCount:](self->mOrphanedOperationQueue, "setMaxConcurrentOperationCount:", 0x7FFFFFFFFFFFFFFFLL);
      mOrphanedOperationQueue = self->mOrphanedOperationQueue;
    }
    -[CATOperationQueue addOperation:](mOrphanedOperationQueue, "addOperation:", v6);
  }

}

- (BOOL)delegateClientSession:(id)a3 shouldConnectWithTransport:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  -[CATTaskServer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "server:clientSession:shouldConnectWithTransport:", self, v6, v7);

  }
  else
  {
    v12 = 1;
  }

  return v12;
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

  -[CATTaskServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serverDidInvalidate:", self);

  }
}

- (void)delegateClientSession:(id)a3 didInterruptWithError:(id)a4
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

  -[CATTaskServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "server:clientSession:didInterruptWithError:", self, v11, v6);

  }
  else
  {
    objc_msgSend(v11, "invalidateWithError:", v6);
  }

}

- (void)delegateClientSessionDidConnect:(id)a3
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

  -[CATTaskServer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "server:clientSessionDidConnect:", self, v8);

  }
}

- (void)delegateClientSessionDidDisconnect:(id)a3
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

  -[CATTaskServer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "server:clientSessionDidDisconnect:", self, v8);

  }
}

- (void)delegateSessionDidInvalidate:(id)a3
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

  -[CATTaskServer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "server:clientSessionDidInvalidate:", self, v8);

  }
}

- (void)delegateClientSession:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v10);

  -[CATTaskServer delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CATTaskServer delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "server:clientSession:didReceiveNotificationWithName:userInfo:", self, v14, v8, v9);

  }
}

- (CATTaskServerDelegate)delegate
{
  return (CATTaskServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mOrphanedOperationQueue, 0);
  objc_storeStrong((id *)&self->mAllSessionsDidInvalidateGroup, 0);
  objc_storeStrong((id *)&self->mStrongSelf, 0);
  objc_storeStrong((id *)&self->mConnectedSessionsByUUID, 0);
  objc_storeStrong((id *)&self->mInvalidatingSessionsByUUID, 0);
  objc_storeStrong((id *)&self->mActiveSessionsByUUID, 0);
  objc_storeStrong((id *)&self->mSessions, 0);
  objc_storeStrong((id *)&self->mFSM, 0);
}

@end
