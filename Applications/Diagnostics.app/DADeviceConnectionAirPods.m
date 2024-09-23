@implementation DADeviceConnectionAirPods

- (DADeviceConnectionAirPods)initWithState:(id)a3
{

  return 0;
}

- (DADeviceConnectionAirPods)initWithState:(id)a3 bluetoothDevice:(id)a4
{
  id v7;
  DADeviceConnectionAirPods *v8;
  DADeviceConnectionAirPods *v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *connectSemaphore;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *disconnectSemaphore;
  dispatch_queue_t v14;
  OS_dispatch_queue *connectionCommandQueue;
  uint64_t v16;
  BluetoothManager *btManager;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)DADeviceConnectionAirPods;
  v8 = -[DADeviceConnectionLocal initWithState:](&v32, "initWithState:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_airpodsDevice, a4);
    v10 = dispatch_semaphore_create(0);
    connectSemaphore = v9->_connectSemaphore;
    v9->_connectSemaphore = (OS_dispatch_semaphore *)v10;

    v12 = dispatch_semaphore_create(0);
    disconnectSemaphore = v9->_disconnectSemaphore;
    v9->_disconnectSemaphore = (OS_dispatch_semaphore *)v12;

    v14 = dispatch_queue_create("com.apple.Diagnostics.airpodsConnectivity", 0);
    connectionCommandQueue = v9->_connectionCommandQueue;
    v9->_connectionCommandQueue = (OS_dispatch_queue *)v14;

    v9->_lastConnectionState = objc_msgSend(v7, "connected");
    v16 = objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    btManager = v9->_btManager;
    v9->_btManager = (BluetoothManager *)v16;

    v9->_unpairOnTestCompletion = 0;
    v9->_isIgnoringDisconnect = 0;
    v9->_hasIgnoredDisconnect = 0;
    if (v9->_btManager)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v18, "addObserver:selector:name:object:", v9, "_btDeviceConnectSuccessNotification:", BluetoothDeviceConnectSuccessNotification, 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "addObserver:selector:name:object:", v9, "_btDeviceConnectFailedNotification:", BluetoothDeviceConnectFailedNotification, 0);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v20, "addObserver:selector:name:object:", v9, "_btDeviceDisconnectSuccessNotification:", BluetoothDeviceDisconnectSuccessNotification, 0);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v21, "addObserver:selector:name:object:", v9, "_btDeviceDisconnectFailedNotification:", BluetoothDeviceDisconnectFailedNotification, 0);

      v22 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject addObserver:selector:name:object:](v22, "addObserver:selector:name:object:", v9, "DADeviceAirPodsSessionWillStartNotification:", CFSTR("com.apple.Diagnostics.airPodsSessionWillStart"), 0);
    }
    else
    {
      v23 = DiagnosticLogHandleForCategory(10);
      v22 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1000EB808(v22, v24, v25, v26, v27, v28, v29, v30);
    }

  }
  return v9;
}

- (BOOL)connect
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  void *v14;

  v3 = DiagnosticLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
    v13 = 138412290;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connecting to AirPods %@...", (uint8_t *)&v13, 0xCu);

  }
  -[DADeviceConnectionAirPods setConnecting:](self, "setConnecting:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
  objc_msgSend(v6, "connect");

  v7 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods connectSemaphore](self, "connectSemaphore"));
  v8 = dispatch_time(0, 15000000000);
  v9 = dispatch_semaphore_wait(v7, v8);

  if (v9)
  {
    v10 = DiagnosticLogHandleForCategory(10);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000EB83C(self, v11);

  }
  -[DADeviceConnectionAirPods setConnecting:](self, "setConnecting:", 0);
  return v9 == 0;
}

- (BOOL)disconnect
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  intptr_t v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  void *v14;

  v3 = DiagnosticLogHandleForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
    v13 = 138412290;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disconnecting from AirPods %@...", (uint8_t *)&v13, 0xCu);

  }
  -[DADeviceConnectionAirPods setDisconnecting:](self, "setDisconnecting:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
  objc_msgSend(v6, "disconnect");

  v7 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods disconnectSemaphore](self, "disconnectSemaphore"));
  v8 = dispatch_time(0, 15000000000);
  v9 = dispatch_semaphore_wait(v7, v8);

  if (v9)
  {
    v10 = DiagnosticLogHandleForCategory(10);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000EB83C(self, v11);

  }
  -[DADeviceConnectionAirPods setDisconnecting:](self, "setDisconnecting:", 0);
  return v9 == 0;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods connectionCommandQueue](self, "connectionCommandQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AF20;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)end
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods connectionCommandQueue](self, "connectionCommandQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B128;
  block[3] = &unk_100132838;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)didFinishSendingResultForTest:(id)a3
{
  dispatch_time_t v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DADeviceConnectionAirPods;
  -[DADeviceConnectionLocal didFinishSendingResultForTest:](&v8, "didFinishSendingResultForTest:", a3);
  if (-[DADeviceConnectionAirPods unpairOnTestCompletion](self, "unpairOnTestCompletion"))
  {
    v4 = dispatch_time(0, 2000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002B25C;
    block[3] = &unk_100132838;
    block[4] = self;
    dispatch_after(v4, v6, block);

  }
}

- (void)DADeviceAirPodsSessionWillStartNotification:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DADeviceAirPodsDeviceKey")));

  v5 = -[DADeviceConnectionAirPods lastConnectionState](self, "lastConnectionState");
  v6 = (void *)v11;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));

    v6 = (void *)v11;
    if (v7 != (void *)v11)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      if (objc_msgSend(v8, "phase"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
        v10 = objc_msgSend(v9, "phase");

        if (v10 != (id)1)
        {
          -[DADeviceConnectionAirPods end](self, "end");
LABEL_8:
          v6 = (void *)v11;
          goto LABEL_9;
        }
      }
      else
      {

      }
      -[DADeviceConnectionAirPods disconnect](self, "disconnect");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)unpair
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods connectionCommandQueue](self, "connectionCommandQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B49C;
  v4[3] = &unk_100132950;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "intValue");
  v6 = DiagnosticLogHandleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 <= 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000EB8C0((uint64_t)v4, v8, v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring accessory disconnects for %@ seconds", (uint8_t *)&v10, 0xCu);
    }

    -[DADeviceConnectionAirPods setIsIgnoringDisconnect:](self, "setIsIgnoringDisconnect:", 1);
    objc_msgSend(v4, "doubleValue");
    v8 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "endIgnoringDisconnects", 0, 0));
    -[DADeviceConnectionAirPods setIgnoreDisconnectTimer:](self, "setIgnoreDisconnectTimer:", v8);
  }

}

- (void)clearAllowSessionAccessoryDisconnect
{
  -[DADeviceConnectionAirPods endIgnoringDisconnects](self, "endIgnoringDisconnects");
}

- (void)endIgnoringDisconnects
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = DiagnosticLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resuming handling for accessory disconnects", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods ignoreDisconnectTimer](self, "ignoreDisconnectTimer"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods ignoreDisconnectTimer](self, "ignoreDisconnectTimer"));
    objc_msgSend(v6, "invalidate");

    -[DADeviceConnectionAirPods setIgnoreDisconnectTimer:](self, "setIgnoreDisconnectTimer:", 0);
  }
  if (-[DADeviceConnectionAirPods hasIgnoredDisconnect](self, "hasIgnoredDisconnect")
    && !-[DADeviceConnectionAirPods lastConnectionState](self, "lastConnectionState"))
  {
    v7 = DiagnosticLogHandleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accessory is in a disconnected state upon resuming handling. Ending the session immediately.", v11, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    objc_msgSend(v9, "setPhase:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
    objc_msgSend(v10, "addErrorCode:userInfo:", 12, 0);

  }
  -[DADeviceConnectionAirPods setIsIgnoringDisconnect:](self, "setIsIgnoringDisconnect:", 0);
  -[DADeviceConnectionAirPods setHasIgnoredDisconnect:](self, "setHasIgnoredDisconnect:", 0);
}

- (void)_btDeviceConnectSuccessNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory(10);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirPods device %@ has connected successfully!", (uint8_t *)&v11, 0xCu);

    }
    if (-[DADeviceConnectionAirPods connecting](self, "connecting"))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods connectSemaphore](self, "connectSemaphore"));
      dispatch_semaphore_signal(v10);

    }
    -[DADeviceConnectionAirPods setLastConnectionState:](self, "setLastConnectionState:", 1);
  }
}

- (void)_btDeviceConnectFailedNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory(10);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirPods device %@ failed to connect!", (uint8_t *)&v11, 0xCu);

    }
    if (-[DADeviceConnectionAirPods connecting](self, "connecting"))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods connectSemaphore](self, "connectSemaphore"));
      dispatch_semaphore_signal(v10);

    }
    -[DADeviceConnectionAirPods setLastConnectionState:](self, "setLastConnectionState:", 0);
  }
}

- (void)_btDeviceDisconnectSuccessNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory(10);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
      v25 = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirPods device %@ has disconected!", (uint8_t *)&v25, 0xCu);

    }
    if (-[DADeviceConnectionAirPods disconnecting](self, "disconnecting"))
    {
      v10 = DiagnosticLogHandleForCategory(10);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Disconnect was expected", (uint8_t *)&v25, 2u);
      }

      v12 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods disconnectSemaphore](self, "disconnectSemaphore"));
      dispatch_semaphore_signal(v12);
    }
    else
    {
      if (-[DADeviceConnectionAirPods isIgnoringDisconnect](self, "isIgnoringDisconnect"))
      {
        v13 = DiagnosticLogHandleForCategory(10);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disconnect is temporairly ignored", (uint8_t *)&v25, 2u);
        }

        -[DADeviceConnectionAirPods setHasIgnoredDisconnect:](self, "setHasIgnoredDisconnect:", 1);
        goto LABEL_17;
      }
      if (!-[DADeviceConnectionAirPods lastConnectionState](self, "lastConnectionState"))
      {
LABEL_17:
        -[DADeviceConnectionAirPods setLastConnectionState:](self, "setLastConnectionState:", 0);
        return;
      }
      v15 = DiagnosticLogHandleForCategory(10);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000EB92C(v16, v17, v18, v19, v20, v21, v22, v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      objc_msgSend(v24, "setPhase:", 1);

      v12 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      -[NSObject addErrorCode:userInfo:](v12, "addErrorCode:userInfo:", 12, 0);
    }

    goto LABEL_17;
  }
}

- (void)_btDeviceDisconnectFailedNotification:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory(10);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods airpodsDevice](self, "airpodsDevice"));
      v12 = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AirPods device %@ has failed to disconnect!", (uint8_t *)&v12, 0xCu);

    }
    if (-[DADeviceConnectionAirPods disconnecting](self, "disconnecting"))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionAirPods disconnectSemaphore](self, "disconnectSemaphore"));
      dispatch_semaphore_signal(v10);
    }
    else
    {
      if (!-[DADeviceConnectionAirPods lastConnectionState](self, "lastConnectionState"))
      {
LABEL_9:
        -[DADeviceConnectionAirPods setLastConnectionState:](self, "setLastConnectionState:", 0);
        return;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      objc_msgSend(v11, "setPhase:", 1);

      v10 = objc_claimAutoreleasedReturnValue(-[DADeviceConnectionLocal state](self, "state"));
      -[NSObject addErrorCode:userInfo:](v10, "addErrorCode:userInfo:", 12, 0);
    }

    goto LABEL_9;
  }
}

- (BOOL)unpairOnTestCompletion
{
  return self->_unpairOnTestCompletion;
}

- (void)setUnpairOnTestCompletion:(BOOL)a3
{
  self->_unpairOnTestCompletion = a3;
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
  objc_storeStrong((id *)&self->_btManager, a3);
}

- (BluetoothDevice)airpodsDevice
{
  return self->_airpodsDevice;
}

- (void)setAirpodsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_airpodsDevice, a3);
}

- (BOOL)connecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (BOOL)disconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (BOOL)lastConnectionState
{
  return self->_lastConnectionState;
}

- (void)setLastConnectionState:(BOOL)a3
{
  self->_lastConnectionState = a3;
}

- (OS_dispatch_semaphore)connectSemaphore
{
  return self->_connectSemaphore;
}

- (void)setConnectSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_connectSemaphore, a3);
}

- (OS_dispatch_semaphore)disconnectSemaphore
{
  return self->_disconnectSemaphore;
}

- (void)setDisconnectSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectSemaphore, a3);
}

- (OS_dispatch_queue)connectionCommandQueue
{
  return self->_connectionCommandQueue;
}

- (void)setConnectionCommandQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionCommandQueue, a3);
}

- (BOOL)isIgnoringDisconnect
{
  return self->_isIgnoringDisconnect;
}

- (void)setIsIgnoringDisconnect:(BOOL)a3
{
  self->_isIgnoringDisconnect = a3;
}

- (BOOL)hasIgnoredDisconnect
{
  return self->_hasIgnoredDisconnect;
}

- (void)setHasIgnoredDisconnect:(BOOL)a3
{
  self->_hasIgnoredDisconnect = a3;
}

- (NSTimer)ignoreDisconnectTimer
{
  return self->_ignoreDisconnectTimer;
}

- (void)setIgnoreDisconnectTimer:(id)a3
{
  objc_storeStrong((id *)&self->_ignoreDisconnectTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreDisconnectTimer, 0);
  objc_storeStrong((id *)&self->_connectionCommandQueue, 0);
  objc_storeStrong((id *)&self->_disconnectSemaphore, 0);
  objc_storeStrong((id *)&self->_connectSemaphore, 0);
  objc_storeStrong((id *)&self->_airpodsDevice, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
}

@end
