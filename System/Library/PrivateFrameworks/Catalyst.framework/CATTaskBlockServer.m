@implementation CATTaskBlockServer

- (CATTaskBlockServer)init
{
  CATTaskBlockServer *v2;
  uint64_t v3;
  CATTaskServer *mServer;
  uint64_t v5;
  NSMutableDictionary *mOperationBlocksByRequestClassName;
  uint64_t v7;
  NSMutableSet *mLongRunningOperationRequestClassNames;
  uint64_t v9;
  NSMapTable *mLongRunningOperationsByUUID;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CATTaskBlockServer;
  v2 = -[CATTaskBlockServer init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mServer = v2->mServer;
    v2->mServer = (CATTaskServer *)v3;

    -[CATTaskServer setDelegate:](v2->mServer, "setDelegate:", v2);
    v5 = objc_opt_new();
    mOperationBlocksByRequestClassName = v2->mOperationBlocksByRequestClassName;
    v2->mOperationBlocksByRequestClassName = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    mLongRunningOperationRequestClassNames = v2->mLongRunningOperationRequestClassNames;
    v2->mLongRunningOperationRequestClassNames = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    mLongRunningOperationsByUUID = v2->mLongRunningOperationsByUUID;
    v2->mLongRunningOperationsByUUID = (NSMapTable *)v9;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CATTaskServer invalidate](self->mServer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CATTaskBlockServer;
  -[CATTaskBlockServer dealloc](&v3, sel_dealloc);
}

- (id)createClientTransport
{
  id v3;
  id v4;
  id v6;
  id v7;

  v6 = 0;
  v7 = 0;
  +[CATRemoteTransport createRemoteTransportPairWithTransport:andTransport:](CATRemoteTransport, "createRemoteTransportPairWithTransport:andTransport:", &v7, &v6);
  v3 = v7;
  v4 = v6;
  -[CATTaskServer connectWithClientTransport:](self->mServer, "connectWithClientTransport:", v4);

  return v3;
}

- (void)registerBlock:(id)a3 forRequestClass:(Class)a4
{
  NSMutableDictionary *mOperationBlocksByRequestClassName;
  void *v7;
  id v8;

  v8 = (id)MEMORY[0x20BD10A78](a3, a2);
  mOperationBlocksByRequestClassName = self->mOperationBlocksByRequestClassName;
  NSStringFromClass(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mOperationBlocksByRequestClassName, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)registerLongRunningOperationForRequestClass:(Class)a3
{
  NSMutableSet *mLongRunningOperationRequestClassNames;
  id v4;

  mLongRunningOperationRequestClassNames = self->mLongRunningOperationRequestClassNames;
  NSStringFromClass(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](mLongRunningOperationRequestClassNames, "addObject:", v4);

}

- (void)cancelLongRunningOperationsForRequestClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable objectEnumerator](self->mLongRunningOperationsByUUID, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isMemberOfClass:", a3);

        if (v11)
          objc_msgSend(v9, "cancel");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4
{
  -[CATTaskServer postNotificationWithName:userInfo:](self->mServer, "postNotificationWithName:userInfo:", a3, a4);
}

- (void)disconnectAllClientSessions
{
  -[CATTaskServer disconnectAllClientSessions](self->mServer, "disconnectAllClientSessions");
}

- (void)invalidate
{
  -[CATTaskServer invalidate](self->mServer, "invalidate");
}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v7;
  objc_class *v8;
  void *v9;
  _CATLongRunningTaskOperation *v10;
  NSMapTable *mLongRunningOperationsByUUID;
  void *v12;

  v7 = a5;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->mLongRunningOperationRequestClassNames, "containsObject:", v9))
  {
    v10 = -[CATTaskOperation initWithRequest:]([_CATLongRunningTaskOperation alloc], "initWithRequest:", v7);
    mLongRunningOperationsByUUID = self->mLongRunningOperationsByUUID;
    -[CATOperation UUID](v10, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](mLongRunningOperationsByUUID, "setObject:forKey:", v10, v12);
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->mOperationBlocksByRequestClassName, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v10 = -[_CATBlockTaskOperation initWithBlock:request:]([_CATBlockTaskOperation alloc], "initWithBlock:request:", v12, v7);
    else
      v10 = 0;
  }

  return v10;
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v10;

  v10 = a4;
  v7 = a5;
  -[CATTaskBlockServer sessionDidInterruptWithError](self, "sessionDidInterruptWithError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CATTaskBlockServer sessionDidInterruptWithError](self, "sessionDidInterruptWithError");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CATTaskBlockServer *, id, id))v9)[2](v9, self, v10, v7);

  }
  else
  {
    objc_msgSend(v10, "invalidate");
  }

}

- (void)server:(id)a3 clientSession:(id)a4 didReceiveNotificationWithName:(id)a5 userInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = a6;
  -[CATTaskBlockServer sessionDidReceiveNotification](self, "sessionDidReceiveNotification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CATTaskBlockServer sessionDidReceiveNotification](self, "sessionDidReceiveNotification");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CATTaskBlockServer *, id, id, id))v12)[2](v12, self, v13, v9, v10);

  }
}

- (void)server:(id)a3 clientSessionDidConnect:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[CATTaskBlockServer sessionDidConnect](self, "sessionDidConnect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CATTaskBlockServer sessionDidConnect](self, "sessionDidConnect");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CATTaskBlockServer *, id))v6)[2](v6, self, v7);

  }
}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[CATTaskBlockServer sessionDidDisconnect](self, "sessionDidDisconnect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CATTaskBlockServer sessionDidDisconnect](self, "sessionDidDisconnect");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CATTaskBlockServer *, id))v6)[2](v6, self, v7);

  }
  else
  {
    objc_msgSend(v7, "invalidate");
  }

}

- (void)server:(id)a3 clientSessionDidInvalidate:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[CATTaskBlockServer sessionDidInvalidate](self, "sessionDidInvalidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CATTaskBlockServer sessionDidInvalidate](self, "sessionDidInvalidate");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CATTaskBlockServer *, id))v6)[2](v6, self, v7);

  }
}

- (void)serverDidInvalidate:(id)a3
{
  void *v4;
  void (**v5)(id, CATTaskBlockServer *);

  -[CATTaskBlockServer didInvalidate](self, "didInvalidate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CATTaskBlockServer didInvalidate](self, "didInvalidate");
    v5 = (void (**)(id, CATTaskBlockServer *))objc_claimAutoreleasedReturnValue();
    v5[2](v5, self);

  }
}

- (NSArray)clientSessions
{
  return self->_clientSessions;
}

- (id)sessionDidConnect
{
  return self->_sessionDidConnect;
}

- (void)setSessionDidConnect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)sessionDidReceiveNotification
{
  return self->_sessionDidReceiveNotification;
}

- (void)setSessionDidReceiveNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)sessionDidInterruptWithError
{
  return self->_sessionDidInterruptWithError;
}

- (void)setSessionDidInterruptWithError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)sessionDidDisconnect
{
  return self->_sessionDidDisconnect;
}

- (void)setSessionDidDisconnect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)sessionDidInvalidate
{
  return self->_sessionDidInvalidate;
}

- (void)setSessionDidInvalidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)didInvalidate
{
  return self->_didInvalidate;
}

- (void)setDidInvalidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didInvalidate, 0);
  objc_storeStrong(&self->_sessionDidInvalidate, 0);
  objc_storeStrong(&self->_sessionDidDisconnect, 0);
  objc_storeStrong(&self->_sessionDidInterruptWithError, 0);
  objc_storeStrong(&self->_sessionDidReceiveNotification, 0);
  objc_storeStrong(&self->_sessionDidConnect, 0);
  objc_storeStrong((id *)&self->_clientSessions, 0);
  objc_storeStrong((id *)&self->mLongRunningOperationsByUUID, 0);
  objc_storeStrong((id *)&self->mLongRunningOperationRequestClassNames, 0);
  objc_storeStrong((id *)&self->mOperationBlocksByRequestClassName, 0);
  objc_storeStrong((id *)&self->mServer, 0);
}

@end
