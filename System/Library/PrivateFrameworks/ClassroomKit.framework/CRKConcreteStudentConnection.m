@implementation CRKConcreteStudentConnection

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteStudentConnection invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteStudentConnection;
  -[CRKConcreteStudentConnection dealloc](&v3, sel_dealloc);
}

- (CRKConcreteStudentConnection)initWithStudentDaemonProxy:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  id v8;
  CRKConcreteStudentConnection *v9;
  CRKConcreteStudentConnection *v10;
  uint64_t v11;
  id invalidationHandler;
  uint64_t v13;
  NSHashTable *notificationObservations;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKConcreteStudentConnection;
  v9 = -[CRKConcreteStudentConnection init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_studentDaemonProxy, a3);
    v11 = MEMORY[0x219A226E8](v8);
    invalidationHandler = v10->_invalidationHandler;
    v10->_invalidationHandler = (id)v11;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    notificationObservations = v10->_notificationObservations;
    v10->_notificationObservations = (NSHashTable *)v13;

  }
  return v10;
}

+ (id)connectionWithStudentDaemonProxy:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a4;
  v8 = a3;
  if ((objc_msgSend(v8, "isConnected") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKConcreteStudentConnection.m"), 45, CFSTR("Must be handed a connected daemon proxy"));

  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStudentDaemonProxy:invalidationHandler:", v8, v7);

  objc_msgSend(v8, "addObserver:", v9);
  return v9;
}

- (id)operationForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKConcreteStudentConnection studentDaemonProxy](self, "studentDaemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationForRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
  id v2;

  -[CRKConcreteStudentConnection studentDaemonProxy](self, "studentDaemonProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnect");

}

- (id)observeNotificationWithName:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  CRKConcreteStudentNotificationObservation *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[CRKConcreteStudentNotificationObservation initWithNotificationName:notificationHandler:]([CRKConcreteStudentNotificationObservation alloc], "initWithNotificationName:notificationHandler:", v7, v6);

  -[CRKConcreteStudentConnection notificationObservations](self, "notificationObservations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  return v8;
}

- (void)daemonProxyDidDisconnect:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[CRKConcreteStudentConnection invalidationHandler](self, "invalidationHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CRKConcreteStudentConnection invalidationHandler](self, "invalidationHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    -[CRKConcreteStudentConnection setInvalidationHandler:](self, "setInvalidationHandler:", 0);
    v5[2]();

  }
}

- (void)daemonProxy:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
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
  v7 = a4;
  v8 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CRKConcreteStudentConnection notificationObservations](self, "notificationObservations", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "receiveNotificationWithName:userInfo:", v7, v8);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (CRKStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSHashTable)notificationObservations
{
  return self->_notificationObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObservations, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

@end
