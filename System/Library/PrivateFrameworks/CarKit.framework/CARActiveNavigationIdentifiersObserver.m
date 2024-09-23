@implementation CARActiveNavigationIdentifiersObserver

- (CARActiveNavigationIdentifiersObserver)init
{
  CARActiveNavigationIdentifiersObserver *v2;
  CARObserverHashTable *v3;
  CARObserverHashTable *observers;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  NSObject *v8;
  _QWORD block[4];
  CARActiveNavigationIdentifiersObserver *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CARActiveNavigationIdentifiersObserver;
  v2 = -[CARActiveNavigationIdentifiersObserver init](&v12, sel_init);
  if (v2)
  {
    v3 = -[CARObserverHashTable initWithProtocol:]([CARObserverHashTable alloc], "initWithProtocol:", &unk_1EE9AC618);
    observers = v2->_observers;
    v2->_observers = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.CarPlayApp.ActiveNavigationIdentifiersWorkQueue", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    -[CARActiveNavigationIdentifiersObserver _setupConnection](v2, "_setupConnection");
    v8 = v2->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__CARActiveNavigationIdentifiersObserver_init__block_invoke;
    block[3] = &unk_1E5427E58;
    v11 = v2;
    dispatch_async(v8, block);

  }
  return v2;
}

void __46__CARActiveNavigationIdentifiersObserver_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CARActiveNavigationIdentifiersObserver_init__block_invoke_59;
  v4[3] = &unk_1E54295E8;
  v4[4] = &v5;
  objc_msgSend(v3, "fetchNavigationIdentifiersWithReply:", v4);
  objc_msgSend(*(id *)(a1 + 32), "activeNavigationIdentifiersChangedTo:", v6[5]);
  _Block_object_dispose(&v5, 8);

}

void __46__CARActiveNavigationIdentifiersObserver_init__block_invoke_59(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CARActiveNavigationIdentifiersObserver observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CARActiveNavigationIdentifiersObserver observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.navowners.service"), 4096);
  CRCarPlayNavigationOwnerClientInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v4);

  objc_msgSend(v3, "setExportedObject:", self);
  CRCarPlayNavigationOwnersServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke;
  v11[3] = &unk_1E5428130;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke_2;
  v9[3] = &unk_1E5428130;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v9);
  objc_msgSend(v3, "resume");
  -[CARActiveNavigationIdentifiersObserver setConnection:](self, "setConnection:", v3);
  -[CARActiveNavigationIdentifiersObserver connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginObserving");

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

- (void)activeNavigationIdentifiersChangedTo:(id)a3
{
  NSArray *v4;
  NSArray *activeNavigationIdentifiers;
  id v6;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  activeNavigationIdentifiers = self->_activeNavigationIdentifiers;
  self->_activeNavigationIdentifiers = v4;

  -[CARActiveNavigationIdentifiersObserver observers](self, "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeNavigationIdentifiersObserver:updatedActiveNavigationIdentifiers:", self, self->_activeNavigationIdentifiers);

}

- (void)invalidate
{
  id v2;

  -[CARActiveNavigationIdentifiersObserver connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (NSArray)activeNavigationIdentifiers
{
  return self->_activeNavigationIdentifiers;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeNavigationIdentifiers, 0);
}

@end
