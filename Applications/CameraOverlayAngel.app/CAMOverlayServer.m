@implementation CAMOverlayServer

+ (CAMOverlayServer)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000050D8;
  block[3] = &unk_100018870;
  block[4] = a1;
  if (qword_10001F140 != -1)
    dispatch_once(&qword_10001F140, block);
  return (CAMOverlayServer *)(id)qword_10001F148;
}

- (id)_init
{
  CAMOverlayServer *v2;
  uint64_t v3;
  NSMutableDictionary *connectionsByProcessID;
  uint64_t v5;
  NSHashTable *registeredObservers;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *connectionQueue;
  CAMOverlayServer *v11;
  uint64_t v12;
  BSServiceConnectionListener *listener;
  _QWORD v15[4];
  CAMOverlayServer *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CAMOverlayServer;
  v2 = -[CAMOverlayServer init](&v17, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    connectionsByProcessID = v2->__connectionsByProcessID;
    v2->__connectionsByProcessID = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    registeredObservers = v2->__registeredObservers;
    v2->__registeredObservers = (NSHashTable *)v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.camera.overlay-client-connection", v8);
    connectionQueue = v2->__connectionQueue;
    v2->__connectionQueue = (OS_dispatch_queue *)v9;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005228;
    v15[3] = &unk_100018898;
    v11 = v2;
    v16 = v11;
    v12 = objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v15));
    listener = v11->__listener;
    v11->__listener = (BSServiceConnectionListener *)v12;

  }
  return v2;
}

- (void)dealloc
{
  BSServiceConnectionListener *listener;
  objc_super v4;

  -[BSServiceConnectionListener invalidate](self->__listener, "invalidate");
  listener = self->__listener;
  self->__listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMOverlayServer;
  -[CAMOverlayServer dealloc](&v4, "dealloc");
}

- (void)start
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CAMOverlayServer _listener](self, "_listener"));
  objc_msgSend(v2, "activate");

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CAMOverlayServer _registeredObservers](self, "_registeredObservers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CAMOverlayServer _registeredObservers](self, "_registeredObservers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_enumerateObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayServer _registeredObservers](self, "_registeredObservers"));
  v6 = objc_msgSend(v5, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  CAMOverlayClientConnection *v12;
  void *v13;
  CAMOverlayClientConnection *v14;
  void *v15;
  id v16;
  CAMOverlayClientConnection *v17;
  _QWORD v18[4];
  CAMOverlayClientConnection *v19;
  CAMOverlayServer *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServiceSpecification identifierKey](CAMOverlayServiceSpecification, "identifierKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "decodeStringForKey:", v9));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005640;
  v22[3] = &unk_1000188C0;
  v23 = v10;
  v11 = v10;
  objc_msgSend(v8, "configureConnection:", v22);
  v12 = [CAMOverlayClientConnection alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayServer _connectionQueue](self, "_connectionQueue"));
  v14 = -[CAMOverlayClientConnection initWithBoardServiceConnection:queue:](v12, "initWithBoardServiceConnection:queue:", v8, v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayClientConnection auditToken](v14, "auditToken"));
  v16 = objc_msgSend(v15, "versionedPID");

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000564C;
  v18[3] = &unk_100018910;
  v19 = v14;
  v20 = self;
  v21 = v16;
  v17 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

}

- (void)clientConnection:(id)a3 didChangeStatus:(unint64_t)a4
{
  id v4;
  _QWORD v5[4];
  id v6;
  CAMOverlayServer *v7;
  unint64_t v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000579C;
  v5[3] = &unk_100018938;
  v7 = self;
  v8 = a4;
  v6 = a3;
  v4 = v6;
  -[CAMOverlayServer _enumerateObserversWithBlock:](v7, "_enumerateObserversWithBlock:", v5);

}

- (BSServiceConnectionListener)_listener
{
  return self->__listener;
}

- (OS_dispatch_queue)_connectionQueue
{
  return self->__connectionQueue;
}

- (NSMutableDictionary)_connectionsByProcessID
{
  return self->__connectionsByProcessID;
}

- (NSHashTable)_registeredObservers
{
  return self->__registeredObservers;
}

- (void)set_registeredObservers:(id)a3
{
  objc_storeStrong((id *)&self->__registeredObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registeredObservers, 0);
  objc_storeStrong((id *)&self->__connectionsByProcessID, 0);
  objc_storeStrong((id *)&self->__connectionQueue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
}

@end
