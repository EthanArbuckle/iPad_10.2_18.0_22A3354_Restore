@implementation DADeviceObserverAggregator

+ (id)aggregatorWithObserverClasses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithObserverClasses:", v4);

  return v5;
}

+ (id)defaultObserverClasses
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(0x100163000), 0);
}

- (DADeviceObserverAggregator)init
{
  id v3;
  void *v4;
  DADeviceObserverAggregator *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "defaultObserverClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[DADeviceObserverAggregator initWithObserverClasses:](self, "initWithObserverClasses:", v4);

  return v5;
}

- (DADeviceObserverAggregator)initWithObserverClasses:(id)a3
{
  id v4;
  DADeviceObserverAggregator *v5;
  NSOperationQueue *v6;
  NSOperationQueue *discoveryQueue;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  DADeviceObserverEnclosure *v16;
  DADeviceObserverEnclosure *v17;
  NSArray *v18;
  NSArray *observers;
  uint64_t v20;
  NSMutableDictionary *handlers;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DADeviceObserverAggregator;
  v5 = -[DADeviceObserverAggregator init](&v27, "init");
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    discoveryQueue = v5->_discoveryQueue;
    v5->_discoveryQueue = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v9);
          v15 = (void *)objc_opt_new(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v14), v11);
          v16 = [DADeviceObserverEnclosure alloc];
          v17 = -[DADeviceObserverEnclosure initWithObserver:delegate:](v16, "initWithObserver:delegate:", v15, v5, (_QWORD)v23);
          objc_msgSend(v8, "addObject:", v17);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v18 = (NSArray *)objc_msgSend(v8, "copy");
    observers = v5->_observers;
    v5->_observers = v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    handlers = v5->_handlers;
    v5->_handlers = (NSMutableDictionary *)v20;

  }
  return v5;
}

- (id)allDevices
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator observers](self, "observers", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "devices"));
        objc_msgSend(v3, "unionSet:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  objc_sync_enter(v6);
  v7 = objc_msgSend(v4, "copy");
  v8 = objc_retainBlock(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  objc_sync_exit(v6);
  -[DADeviceObserverAggregator _beginObserving](self, "_beginObserving");

  return v5;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[DADeviceObserverAggregator _endObserving](self, "_endObserving");
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001FA24;
  v8[3] = &unk_100132860;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)observerDidChangeDevices:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];

  v4 = DiagnosticLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handlers: %@", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  v8 = objc_msgSend(v7, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v22;
    *(_QWORD *)&v11 = 138412546;
    v20 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v9);
        v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14), v20, (_QWORD)v21));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator allDevices](self, "allDevices"));
          v17 = DiagnosticLogHandleForCategory(1);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_retainBlock(v15);
            *(_DWORD *)buf = v20;
            v26 = v19;
            v27 = 2112;
            v28 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Calling handler: %@ with devices: %@", buf, 0x16u);

          }
          ((void (**)(_QWORD, void *))v15)[2](v15, v16);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v12);
  }

}

- (void)_beginObserving
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator observers](self, "observers", 0));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "begin");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_endObserving
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator observers](self, "observers", 0));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "end");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSOperationQueue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryQueue, a3);
}

- (NSArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_discoveryQueue, 0);
}

@end
