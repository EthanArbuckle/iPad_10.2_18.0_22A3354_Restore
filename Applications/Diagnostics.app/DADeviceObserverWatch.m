@implementation DADeviceObserverWatch

- (DADeviceObserverWatch)init
{
  DADeviceObserverWatch *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *nanoObservationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *nanoRegistrationQueue;
  uint64_t v7;
  uint64_t v8;
  NSCondition *firstResponseLock;
  uint64_t v10;
  NSMutableSet *devices;
  uint64_t v12;
  NSMutableDictionary *handlers;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DADeviceObserverWatch;
  v2 = -[DADeviceObserverWatch init](&v15, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Diagnostics.nanoObservationQueue", 0);
    nanoObservationQueue = v2->_nanoObservationQueue;
    v2->_nanoObservationQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.Diagnostics.nanoRegistrationQueue", 0);
    nanoRegistrationQueue = v2->_nanoRegistrationQueue;
    v2->_nanoRegistrationQueue = (OS_dispatch_queue *)v5;

    v8 = objc_opt_new(NSCondition, v7);
    firstResponseLock = v2->_firstResponseLock;
    v2->_firstResponseLock = (NSCondition *)v8;

    *(_WORD *)&v2->_isObserving = 0;
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v12;

  }
  return v2;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a3;
  -[DADeviceObserverWatch _updateDevicesWithSerialNumber:](self, "_updateDevicesWithSerialNumber:", 0);
  -[DADeviceObserverWatch _waitUntilFirstResponse](self, "_waitUntilFirstResponse");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch devices](self, "devices"));
  v4[2](v4, v5);

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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch handlers](self, "handlers"));
  objc_sync_enter(v6);
  v7 = objc_msgSend(v4, "copy");
  v8 = objc_retainBlock(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch handlers](self, "handlers"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);

  -[DADeviceObserverWatch _beginObserving](self, "_beginObserving");
  objc_sync_exit(v6);

  return v5;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch handlers](self, "handlers"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch handlers](self, "handlers"));
  objc_msgSend(v5, "removeObjectForKey:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch handlers](self, "handlers"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[DADeviceObserverWatch _endObserving](self, "_endObserving");
  objc_sync_exit(v4);

}

- (void)_waitUntilFirstResponse
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
  objc_msgSend(v3, "lock");

  if (!-[DADeviceObserverWatch firstResponseSent](self, "firstResponseSent"))
  {
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
      objc_msgSend(v4, "wait");

    }
    while (!-[DADeviceObserverWatch firstResponseSent](self, "firstResponseSent"));
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
  objc_msgSend(v5, "unlock");

}

- (void)_beginObserving
{
  NSObject *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[5];

  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    v3 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch nanoRegistrationQueue](self, "nanoRegistrationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D16C;
    block[3] = &unk_100132838;
    block[4] = self;
    dispatch_async(v3, block);

  }
  global_queue = dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001D204;
  v6[3] = &unk_100132838;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)_nanoRegistryDevicePaired:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DADeviceObserverWatch *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch nanoObservationQueue](self, "nanoObservationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D2A8;
  v7[3] = &unk_1001328B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_nanoRegistryDeviceUnpaired:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DADeviceObserverWatch *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch nanoObservationQueue](self, "nanoObservationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D48C;
  v7[3] = &unk_1001328B0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_createDeviceWithNanoDevice:(id)a3
{
  id v3;
  objc_class *v4;
  DADeviceRepresentation *v5;
  void *v6;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("DADeviceWatchProxy"));
  if (v4)
  {
    v5 = (DADeviceRepresentation *)objc_msgSend([v4 alloc], "initWithNanoDevice:", v3);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", NRDevicePropertySerialNumber));
    v5 = -[DADeviceRepresentation initWithSerialNumber:isLocal:attributes:]([DADeviceRepresentation alloc], "initWithSerialNumber:isLocal:attributes:", v6, 0, &__NSDictionary0__struct);

  }
  return v5;
}

- (void)_endObserving
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  if (self->_isObserving)
  {
    self->_isObserving = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
    objc_msgSend(v3, "lock");

    -[DADeviceObserverWatch setFirstResponseSent:](self, "setFirstResponseSent:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
    objc_msgSend(v4, "unlock");

    v5 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch nanoRegistrationQueue](self, "nanoRegistrationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D724;
    block[3] = &unk_100132838;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)_updateDevicesWithSerialNumber:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch nanoObservationQueue](self, "nanoObservationQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D7D4;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_updateHandlers
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch handlers](self, "handlers", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch handlers](self, "handlers"));
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch devices](self, "devices"));
          ((void (**)(_QWORD, void *))v11)[2](v11, v12);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
  objc_msgSend(v13, "lock");

  -[DADeviceObserverWatch setFirstResponseSent:](self, "setFirstResponseSent:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
  objc_msgSend(v14, "signal");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverWatch firstResponseLock](self, "firstResponseLock"));
  objc_msgSend(v15, "unlock");

}

- (OS_dispatch_queue)nanoObservationQueue
{
  return self->_nanoObservationQueue;
}

- (void)setNanoObservationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_nanoObservationQueue, a3);
}

- (OS_dispatch_queue)nanoRegistrationQueue
{
  return self->_nanoRegistrationQueue;
}

- (void)setNanoRegistrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_nanoRegistrationQueue, a3);
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (NSCondition)firstResponseLock
{
  return self->_firstResponseLock;
}

- (void)setFirstResponseLock:(id)a3
{
  objc_storeStrong((id *)&self->_firstResponseLock, a3);
}

- (BOOL)firstResponseSent
{
  return self->_firstResponseSent;
}

- (void)setFirstResponseSent:(BOOL)a3
{
  self->_firstResponseSent = a3;
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_firstResponseLock, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_nanoRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_nanoObservationQueue, 0);
}

@end
