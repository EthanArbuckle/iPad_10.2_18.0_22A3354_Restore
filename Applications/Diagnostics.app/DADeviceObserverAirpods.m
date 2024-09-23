@implementation DADeviceObserverAirpods

+ (id)primarySerialNumberForAirpodsDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v22[16];
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessoryInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AACPVersionInfo")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 3));
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length") || objc_msgSend(v7, "isEqualToString:", CFSTR("?")))
  {
    v8 = DiagnosticLogHandleForCategory(1);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Case serial number is missing for airpods device. Falling back to left bud", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 8));
    if (v10 && objc_msgSend(v10, "length") && !objc_msgSend(v10, "isEqualToString:", CFSTR("?")))
    {
      v7 = v10;
    }
    else
    {
      v11 = DiagnosticLogHandleForCategory(1);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Left bud serial number is missing for airpods device. Falling back to right bud", v22, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 9));
      if (!v7 || !objc_msgSend(v7, "length") || objc_msgSend(v7, "isEqualToString:", CFSTR("?")))
      {
        v13 = DiagnosticLogHandleForCategory(1);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1000EA20C((uint64_t)v3, v14, v15, v16, v17, v18, v19, v20);

      }
    }
  }

  return v7;
}

- (DADeviceObserverAirpods)init
{
  DADeviceObserverAirpods *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *airpodsRegistrationQueue;
  uint64_t v5;
  NSMutableSet *devices;
  uint64_t v7;
  NSMutableDictionary *handlers;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *btManagerAvailableSemaphore;
  uint64_t v11;
  NSSet *supportedDeviceAllowList;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  DADeviceObserverAirpods *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)DADeviceObserverAirpods;
  v2 = -[DADeviceObserverAirpods init](&v24, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Diagnostics.airpodsRegistrationQueue", 0);
    airpodsRegistrationQueue = v2->_airpodsRegistrationQueue;
    v2->_airpodsRegistrationQueue = (OS_dispatch_queue *)v3;

    v2->_isObserving = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    devices = v2->_devices;
    v2->_devices = (NSMutableSet *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v7;

    v9 = dispatch_semaphore_create(0);
    btManagerAvailableSemaphore = v2->_btManagerAvailableSemaphore;
    v2->_btManagerAvailableSemaphore = (OS_dispatch_semaphore *)v9;

    v2->_initialDevicesFetched = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10013FA98));
    supportedDeviceAllowList = v2->_supportedDeviceAllowList;
    v2->_supportedDeviceAllowList = (NSSet *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Diagnostics"));

    if (v15)
      v16 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    else
      v16 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.Diagnostics"));
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("ShowAllBluetoothAudioAccessories")));
    v2->_useSupportedDeviceAllowList = objc_msgSend(v18, "BOOLValue") ^ 1;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, "_btManagerAvailable", BluetoothAvailabilityChangedNotification, 0);

    if (qword_10016E830 != -1)
      dispatch_once(&qword_10016E830, &stru_100132810);
    v20 = qword_10016E838;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004D88;
    block[3] = &unk_100132838;
    v23 = v2;
    dispatch_sync(v20, block);

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
  v5 = qword_10016E838;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004E50;
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
  v6 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods airpodsRegistrationQueue](self, "airpodsRegistrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004FEC;
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
  v5 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods airpodsRegistrationQueue](self, "airpodsRegistrationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000050E8;
  v7[3] = &unk_1001328B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_beginObserving
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  dispatch_time_t v9;

  if (!self->_isObserving)
  {
    self->_isObserving = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "_bluetoothPairingStatusChanged:", BluetoothPairedStatusChangedNotification, 0);

  }
  v4 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods btManager](self, "btManager"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods btManager](self, "btManager")),
        v7 = objc_msgSend(v6, "available"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods btManagerAvailableSemaphore](self, "btManagerAvailableSemaphore"));
    v9 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v8, v9);

  }
  -[DADeviceObserverAirpods _ensureInitialDevicesFetched](self, "_ensureInitialDevicesFetched");
  -[DADeviceObserverAirpods _updateHandlers](self, "_updateHandlers");
}

- (void)_endObserving
{
  id v3;

  if (self->_isObserving)
  {
    self->_isObserving = 0;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", self, BluetoothPairedStatusChangedNotification, 0);

  }
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods handlers](self, "handlers", 0));
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods handlers](self, "handlers"));
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods devices](self, "devices"));
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

- (void)_btManagerAvailable
{
  NSObject *v3;

  -[DADeviceObserverAirpods _ensureInitialDevicesFetched](self, "_ensureInitialDevicesFetched");
  v3 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods btManagerAvailableSemaphore](self, "btManagerAvailableSemaphore"));
  dispatch_semaphore_signal(v3);

}

- (BOOL)_isBluetoothDeviceServicableAirpods:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;

  v4 = a3;
  if ((objc_msgSend(v4, "isAppleAudioDevice") & 1) != 0)
    v5 = 1;
  else
    v5 = -[DADeviceObserverAirpods _isBeatsDevice:](self, "_isBeatsDevice:", v4);
  v6 = objc_msgSend(v4, "isTemporaryPaired");
  if (-[DADeviceObserverAirpods useSupportedDeviceAllowList](self, "useSupportedDeviceAllowList"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods supportedDeviceAllowList](self, "supportedDeviceAllowList"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "productId")));
    v9 = objc_msgSend(v7, "containsObject:", v8);

  }
  else
  {
    v10 = DiagnosticLogHandleForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Supported device allow list is disabled.", (uint8_t *)&v15, 2u);
    }

    v9 = 1;
  }
  v12 = DiagnosticLogHandleForCategory(1);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138413314;
    v16 = v4;
    v17 = 1024;
    v18 = v5 & ~v6 & v9;
    v19 = 1024;
    v20 = v5;
    v21 = 1024;
    v22 = v6;
    v23 = 1024;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BluetoothDevice (%@) is servicable: (%d) appleAudioDevice: (%d) tempPaired: (%d) allowed: (%d)", (uint8_t *)&v15, 0x24u);
  }

  return v5 & ~(_BYTE)v6 & v9;
}

- (BOOL)_isBeatsDevice:(id)a3
{
  id v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  int v8;
  id v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "productId");
  if (v4 == 8209)
  {
    v5 = DiagnosticLogHandleForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device (%@) is a AirPods-like Beats device that does not report as an Apple Audio Device", (uint8_t *)&v8, 0xCu);
    }

  }
  return v4 == 8209;
}

- (void)_bluetoothPairingStatusChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = DiagnosticLogHandleForCategory(1);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DADeviceObserverAirpods recieved notification that bluetooth statuses have changed. Looking for any new devices...", v6, 2u);
  }

  -[DADeviceObserverAirpods _purgeUnpairedDevices](self, "_purgeUnpairedDevices");
  -[DADeviceObserverAirpods _forceDiscoverAllDevices](self, "_forceDiscoverAllDevices");
  -[DADeviceObserverAirpods _updateHandlers](self, "_updateHandlers");
}

- (void)_forceDiscoverAllDevices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods devices](self, "devices"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods btManager](self, "btManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairedDevices"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v8 = 138412290;
    v14 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (-[DADeviceObserverAirpods _isBluetoothDeviceServicableAirpods:](self, "_isBluetoothDeviceServicableAirpods:", v11, v14, (_QWORD)v15))
        {
          v12 = DiagnosticLogHandleForCategory(1);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "DADeviceObserverAirpods found an AppleAudioDevice: %@", buf, 0xCu);
          }

          -[DADeviceObserverAirpods _addAirpodsDevice:](self, "_addAirpodsDevice:", v11);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

  objc_sync_exit(v3);
}

- (void)_purgeUnpairedDevices
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];

  obj = (id)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods devices](self, "devices"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods devices](self, "devices"));
  v4 = objc_msgSend(v3, "copy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "airpodsDevice"));
        v11 = objc_msgSend(v10, "paired");

        if ((v11 & 1) == 0)
        {
          v12 = DiagnosticLogHandleForCategory(1);
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v9;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removing Airpods device %@", buf, 0xCu);
          }

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods devices](self, "devices"));
          objc_msgSend(v14, "removeObject:", v9);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (void)_ensureInitialDevicesFetched
{
  if (!-[DADeviceObserverAirpods initialDevicesFetched](self, "initialDevicesFetched"))
  {
    -[DADeviceObserverAirpods _forceDiscoverAllDevices](self, "_forceDiscoverAllDevices");
    -[DADeviceObserverAirpods setInitialDevicesFetched:](self, "setInitialDevicesFetched:", 1);
  }
}

- (void)_addAirpodsDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods _airpodsDeviceFromDevice:](self, "_airpodsDeviceFromDevice:", v4));
  v6 = DiagnosticLogHandleForCategory(1);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding Bluetooth device: %@", (uint8_t *)&v18, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods devices](self, "devices"));
    v10 = objc_msgSend(v9, "containsObject:", v5);

    if ((v10 & 1) != 0)
    {
      v11 = DiagnosticLogHandleForCategory(1);
      v8 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connected bluetooth device %@ is already in device list", (uint8_t *)&v18, 0xCu);
      }
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(-[DADeviceObserverAirpods devices](self, "devices"));
      -[NSObject addObject:](v8, "addObject:", v5);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1000EA274((uint64_t)v4, v8, v12, v13, v14, v15, v16, v17);
  }

}

- (id)_airpodsDeviceFromDevice:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  Class v6;
  DADeviceRepresentation *v7;
  DADeviceRepresentation *v8;
  uint64_t v9;
  NSObject *v10;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("DADeviceAirpods"));
  if (v4)
  {
    v5 = objc_msgSend([v4 alloc], "initWithBluetoothDevice:", v3);
    if (v5)
    {
      v6 = NSClassFromString(CFSTR("DADeviceDecoratorWithUI"));
      if (v6)
      {
        v7 = (DADeviceRepresentation *)objc_claimAutoreleasedReturnValue(-[objc_class performSelector:withObject:](v6, "performSelector:withObject:", "decorateWithDevice:", v5));
      }
      else
      {
        v9 = DiagnosticLogHandleForCategory(1);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          sub_1000EA2DC(v10);

        v7 = (DADeviceRepresentation *)v5;
      }
      goto LABEL_11;
    }
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[DADeviceObserverAirpods primarySerialNumberForAirpodsDevice:](DADeviceObserverAirpods, "primarySerialNumberForAirpodsDevice:", v3));
    if (v5)
    {
      v7 = -[DADeviceRepresentation initWithSerialNumber:isLocal:attributes:]([DADeviceRepresentation alloc], "initWithSerialNumber:isLocal:attributes:", v5, 1, &__NSDictionary0__struct);
LABEL_11:
      v8 = v7;
      goto LABEL_12;
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (OS_dispatch_queue)airpodsRegistrationQueue
{
  return self->_airpodsRegistrationQueue;
}

- (void)setAirpodsRegistrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_airpodsRegistrationQueue, a3);
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

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
  objc_storeStrong((id *)&self->_btManager, a3);
}

- (OS_dispatch_semaphore)btManagerAvailableSemaphore
{
  return self->_btManagerAvailableSemaphore;
}

- (void)setBtManagerAvailableSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_btManagerAvailableSemaphore, a3);
}

- (BOOL)initialDevicesFetched
{
  return self->_initialDevicesFetched;
}

- (void)setInitialDevicesFetched:(BOOL)a3
{
  self->_initialDevicesFetched = a3;
}

- (NSSet)supportedDeviceAllowList
{
  return self->_supportedDeviceAllowList;
}

- (BOOL)useSupportedDeviceAllowList
{
  return self->_useSupportedDeviceAllowList;
}

- (void)setUseSupportedDeviceAllowList:(BOOL)a3
{
  self->_useSupportedDeviceAllowList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedDeviceAllowList, 0);
  objc_storeStrong((id *)&self->_btManagerAvailableSemaphore, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_airpodsRegistrationQueue, 0);
}

@end
