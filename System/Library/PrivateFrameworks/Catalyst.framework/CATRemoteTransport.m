@implementation CATRemoteTransport

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATRemoteTransport.m"), 56, CFSTR("%@ cannot call %@"), a1, v5);

  return 0;
}

- (CATRemoteTransport)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTransport.m"), 63, CFSTR("%@ cannot call %@"), v5, v6);

  return 0;
}

+ (void)createRemoteTransportPairWithTransport:(id *)a3 andTransport:(id *)a4
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATRemoteTransport.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transport1"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CATRemoteTransport.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transport2"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v13 = 0;
  v14 = 0;
  +[CATRemoteConnection createConnectionPairWithConnection:andConnection:](CATRemoteConnection, "createConnectionPairWithConnection:andConnection:", &v14, &v13);
  v8 = v14;
  v9 = v13;
  *a3 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithRemoteConnection:", v8);
  v10 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithRemoteConnection:", v9);

  *a4 = v10;
}

- (CATRemoteTransport)initWithRemoteConnection:(id)a3
{
  id v6;
  CATRemoteTransport *v7;
  CATRemoteTransport *v8;
  uint64_t v9;
  NSMutableDictionary *mOperationByUUID;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATRemoteTransport.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteConnection"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CATRemoteTransport;
  v7 = -[CATTransport init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->mConnection, a3);
    -[CATRemoteConnection setDelegate:](v8->mConnection, "setDelegate:", v8);
    v9 = objc_opt_new();
    mOperationByUUID = v8->mOperationByUUID;
    v8->mOperationByUUID = (NSMutableDictionary *)v9;

  }
  return v8;
}

- (__SecTrust)peerTrust
{
  return -[CATRemoteConnection peerTrust](self->mConnection, "peerTrust");
}

- (void)resumeConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATRemoteConnection scheduleStreams](self->mConnection, "scheduleStreams");
  if (!self->mConnectionHasOpened)
  {
    -[CATRemoteConnection open](self->mConnection, "open");
    self->mConnectionHasOpened = 1;
  }
}

- (void)suspendConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATRemoteConnection unscheduleStreams](self->mConnection, "unscheduleStreams");
}

- (void)invalidateConnection
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATRemoteConnection close](self->mConnection, "close");
}

- (id)operationToSendMessage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTransport:", self);
  objc_msgSend(v5, "setMessage:", v4);

  return v5;
}

- (id)name
{
  return -[CATRemoteConnection name](self->mConnection, "name");
}

- (void)setName:(id)a3
{
  -[CATRemoteConnection setName:](self->mConnection, "setName:", a3);
}

- (void)connectionWillSecure:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CATRemoteTransport remoteTransportDelegate](self, "remoteTransportDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATRemoteTransport remoteTransportDelegate](self, "remoteTransportDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transportWillSecure:", self);

  }
}

- (void)connection:(id)a3 encounteredTrustDecisionWhileTryingToSecure:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CATRemoteTransport remoteTransportDelegate](self, "remoteTransportDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CATRemoteTransport remoteTransportDelegate](self, "remoteTransportDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transport:encounteredTrustDecisionWhileTryingToSecure:", self, v8);

  }
}

- (void)connectionDidSecure:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CATRemoteTransport remoteTransportDelegate](self, "remoteTransportDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CATRemoteTransport remoteTransportDelegate](self, "remoteTransportDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transportDidSecure:", self);

  }
}

- (void)connection:(id)a3 didSendData:(id)a4 userInfo:(id)a5
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *mOperationByUUID;
  void *v9;
  id v10;

  v6 = a5;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v7);

  mOperationByUUID = self->mOperationByUUID;
  v10 = v6;
  -[NSMutableDictionary objectForKey:](mOperationByUUID, "objectForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->mOperationByUUID, "removeObjectForKey:", v10);

  objc_msgSend(v9, "didSendData");
}

- (void)connection:(id)a3 didFailToSendData:(id)a4 userInfo:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  NSMutableDictionary *mOperationByUUID;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a6;
  CATGetCatalystQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v10);

  mOperationByUUID = self->mOperationByUUID;
  v13 = v8;
  -[NSMutableDictionary objectForKey:](mOperationByUUID, "objectForKey:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->mOperationByUUID, "removeObjectForKey:", v13);

  objc_msgSend(v12, "didFailWithError:", v9);
}

- (void)connection:(id)a3 didInterruptWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary objectEnumerator](self->mOperationByUUID, "objectEnumerator", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "didFailWithError:", v5);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  -[NSMutableDictionary removeAllObjects](self->mOperationByUUID, "removeAllObjects");
  -[CATTransport didInterruptWithError:](self, "didInterruptWithError:", v5);

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14[3];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  v14[0] = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "cat_unarchiveObjectOfClass:withData:error:", objc_opt_class(), v7, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14[0];
  v11 = v10;
  if (v9)
  {
    -[CATTransport didReceiveMessage:](self, "didReceiveMessage:", v9);

  }
  else
  {
    v15 = *MEMORY[0x24BDD1398];
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CATErrorWithCodeAndUserInfo(301, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
    -[CATTransport didInterruptWithError:](self, "didInterruptWithError:", v13);
  }

}

- (void)connectionDidClose:(id)a3
{
  NSObject *v4;
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
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  CATErrorWithCodeAndUserInfo(200, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary objectEnumerator](self->mOperationByUUID, "objectEnumerator", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "didFailWithError:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary removeAllObjects](self->mOperationByUUID, "removeAllObjects");
  -[CATTransport didInvalidate](self, "didInvalidate");

}

- (void)remoteTransportSendMessageOperation:(id)a3 sendData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  CATGetCatalystQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v8);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->mOperationByUUID, "setObject:forKey:", v7, v9);

  -[CATRemoteConnection sendData:userInfo:](self->mConnection, "sendData:userInfo:", v6, v9);
}

- (CATRemoteTransportDelegate)remoteTransportDelegate
{
  return (CATRemoteTransportDelegate *)objc_loadWeakRetained((id *)&self->_remoteTransportDelegate);
}

- (void)setRemoteTransportDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteTransportDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteTransportDelegate);
  objc_storeStrong((id *)&self->mOperationByUUID, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
}

@end
