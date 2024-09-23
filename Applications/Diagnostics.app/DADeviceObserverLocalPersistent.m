@implementation DADeviceObserverLocalPersistent

- (DADeviceObserverLocalPersistent)init
{
  DADeviceObserverLocalPersistent *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *persistentTaskObservationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *persistentTaskRegistrationQueue;
  uint64_t v7;
  NSMutableSet *devices;
  uint64_t v9;
  NSMutableDictionary *handlers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DADeviceObserverLocalPersistent;
  v2 = -[DADeviceObserverLocalPersistent init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Diagnostics.persistentTaskObservationQueue", 0);
    persistentTaskObservationQueue = v2->_persistentTaskObservationQueue;
    v2->_persistentTaskObservationQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.Diagnostics.persistentTaskRegistrationQueue", 0);
    persistentTaskRegistrationQueue = v2->_persistentTaskRegistrationQueue;
    v2->_persistentTaskRegistrationQueue = (OS_dispatch_queue *)v5;

    v2->_isObserving = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalPersistent devices](self, "devices"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalPersistent persistentTaskRegistrationQueue](self, "persistentTaskRegistrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E5A0;
  block[3] = &unk_100132888;
  block[4] = self;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  dispatch_async(v6, block);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalPersistent persistentTaskRegistrationQueue](self, "persistentTaskRegistrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E69C;
  block[3] = &unk_1001328B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_beginObserving
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "enhancedLoggingDidUpdateStatus:", ELSDidUpdateStatus, 0);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001E7CC;
  v5[3] = &unk_100133760;
  v5[4] = self;
  objc_msgSend(v4, "refreshWithCompletion:", v5);

}

- (void)_endObserving
{
  id v3;

  if (self->_isObserving)
  {
    self->_isObserving = 0;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, ELSDidUpdateStatus, 0);

  }
}

- (void)enhancedLoggingDidUpdateStatus:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ELSManager sharedManager](ELSManager, "sharedManager", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshot"));

  v5 = v6;
  if (v6)
  {
    -[DADeviceObserverLocalPersistent _updateDevicesWithSnapshot:](self, "_updateDevicesWithSnapshot:", v6);
    v5 = v6;
  }

}

- (void)_updateDevicesWithSnapshot:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DADeviceObserverLocalPersistent *v11;
  uint8_t buf[4];
  id v13;

  v4 = a3;
  v5 = DiagnosticLogHandleForCategory(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating devices with snasphot: %{private}@", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalPersistent persistentTaskObservationQueue](self, "persistentTaskObservationQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001E9C0;
  v9[3] = &unk_1001328B0;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_async(v7, v9);

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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalPersistent handlers](self, "handlers", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalPersistent handlers](self, "handlers"));
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverLocalPersistent devices](self, "devices"));
          ((void (**)(_QWORD, void *))v11)[2](v11, v12);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)_spawnPersistentDevice
{
  Class v2;
  uint64_t v3;

  v2 = NSClassFromString(CFSTR("DADeviceLocalPersistent"));
  if (v2)
    v2 = (Class)objc_opt_new(v2, v3);
  return v2;
}

- (OS_dispatch_queue)persistentTaskObservationQueue
{
  return self->_persistentTaskObservationQueue;
}

- (void)setPersistentTaskObservationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_persistentTaskObservationQueue, a3);
}

- (OS_dispatch_queue)persistentTaskRegistrationQueue
{
  return self->_persistentTaskRegistrationQueue;
}

- (void)setPersistentTaskRegistrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_persistentTaskRegistrationQueue, a3);
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
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
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_persistentTaskRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_persistentTaskObservationQueue, 0);
}

@end
