@implementation DADeviceObserverAccessories

- (DADeviceObserverAccessories)init
{
  DADeviceObserverAccessories *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessoryObservationQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessoryRegistrationQueue;
  uint64_t v7;
  NSMutableSet *devices;
  uint64_t v9;
  NSMutableDictionary *handlers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DADeviceObserverAccessories;
  v2 = -[DADeviceObserverAccessories init](&v12, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Diagnostics.accessoryObservationQueue", 0);
    accessoryObservationQueue = v2->_accessoryObservationQueue;
    v2->_accessoryObservationQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.Diagnostics.accessoryRegistrationQueue", 0);
    accessoryRegistrationQueue = v2->_accessoryRegistrationQueue;
    v2->_accessoryRegistrationQueue = (OS_dispatch_queue *)v5;

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
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories accessoryObservationQueue](self, "accessoryObservationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007314;
  v7[3] = &unk_100132860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

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
  v6 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories accessoryRegistrationQueue](self, "accessoryRegistrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007430;
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
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories accessoryRegistrationQueue](self, "accessoryRegistrationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000752C;
  v7[3] = &unk_1001328B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_beginObserving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
    objc_msgSend(v3, "registerForLocalNotifications");

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_accessoryConnected:", EAAccessoryDidConnectNotification, v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "_accessoryDisconnected:", EAAccessoryDidDisconnectNotification, v7);

  }
  -[DADeviceObserverAccessories _updateDevices](self, "_updateDevices");
}

- (void)_accessoryConnected:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAAccessoryKey));

  if (v5)
  {
    v6 = DiagnosticLogHandleForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Accessory connected", (uint8_t *)&v9, 0xCu);

    }
    -[DADeviceObserverAccessories _updateDevices](self, "_updateDevices");
  }

}

- (void)_accessoryDisconnected:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAAccessoryKey));

  if (v5)
  {
    v6 = DiagnosticLogHandleForCategory(10);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Accessory disconnected", (uint8_t *)&v9, 0xCu);

    }
    -[DADeviceObserverAccessories _updateDevices](self, "_updateDevices");
  }

}

- (void)_endObserving
{
  void *v3;
  id v4;

  if (self->_isObserving)
  {
    self->_isObserving = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self);

    v4 = (id)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
    objc_msgSend(v4, "unregisterForLocalNotifications");

  }
}

- (void)_updateDevices
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories accessoryObservationQueue](self, "accessoryObservationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007990;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async(v3, block);

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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories handlers](self, "handlers", 0));
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories handlers](self, "handlers"));
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories devices](self, "devices"));
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

- (id)_fetchDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  objc_class *v20;
  DADeviceRepresentation *v21;
  id v22;
  DADeviceRepresentation *v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories devices](self, "devices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v3, "count")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DSIOHIDDevice deviceMatchingAccessories:](DSIOHIDDevice, "deviceMatchingAccessories:", &off_10013FAB0));
  v6 = v5;
  if (!v5)
    goto LABEL_13;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  if (!v7)
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));

    goto LABEL_15;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("serialNumber"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DSEADevice deviceWithSerialNumber:](DSEADevice, "deviceWithSerialNumber:", v8));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "information"));
    objc_msgSend(v9, "addEntriesFromDictionary:", v12);

  }
  v13 = objc_msgSend(v9, "copy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DAAdapterAccessory accessoryWithIdentifier:attributes:](DAAdapterAccessory, "accessoryWithIdentifier:attributes:", CFSTR("Accessory.SmartBatteryCase"), v13));

  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serialNumber"));
    if (v15)
    {
      v16 = (void *)v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAccessories _accessoryIdentifiersToPromote](self, "_accessoryIdentifiersToPromote"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      v19 = objc_msgSend(v17, "containsObject:", v18);

      if (v19)
      {
        v20 = NSClassFromString(CFSTR("DADeviceAccessory"));
        if (v20)
        {
          v21 = (DADeviceRepresentation *)objc_msgSend([v20 alloc], "initWithAccessory:", v14);
          if (!v21)
          {
LABEL_11:

            goto LABEL_12;
          }
        }
        else
        {
          v24 = [DADeviceRepresentation alloc];
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "serialNumber"));
          v21 = -[DADeviceRepresentation initWithSerialNumber:isLocal:attributes:](v24, "initWithSerialNumber:isLocal:attributes:", v25, 1, &__NSDictionary0__struct);

          if (!v21)
            goto LABEL_11;
        }
        objc_msgSend(v4, "addObject:", v21);
        goto LABEL_11;
      }
    }
  }
LABEL_12:

LABEL_13:
  v22 = v4;
LABEL_15:

  return v22;
}

- (id)_accessoryIdentifiersToPromote
{
  if (qword_10016E848 != -1)
    dispatch_once(&qword_10016E848, &stru_1001329E8);
  return (id)qword_10016E840;
}

- (OS_dispatch_queue)accessoryObservationQueue
{
  return self->_accessoryObservationQueue;
}

- (void)setAccessoryObservationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryObservationQueue, a3);
}

- (OS_dispatch_queue)accessoryRegistrationQueue
{
  return self->_accessoryRegistrationQueue;
}

- (void)setAccessoryRegistrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryRegistrationQueue, a3);
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
  objc_storeStrong((id *)&self->_accessoryRegistrationQueue, 0);
  objc_storeStrong((id *)&self->_accessoryObservationQueue, 0);
}

@end
