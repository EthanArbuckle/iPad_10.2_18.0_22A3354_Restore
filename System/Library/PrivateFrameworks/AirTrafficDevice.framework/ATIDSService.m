@implementation ATIDSService

- (ATIDSService)initWithServiceName:(id)a3
{
  id v4;
  ATIDSService *v5;
  objc_class *v6;
  const char *Name;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  IDSService *service;
  uint64_t v12;
  NSMutableArray *listeners;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATIDSService;
  v5 = -[ATIDSService init](&v16, sel_init);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    v8 = dispatch_queue_create(Name, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", v4);
    service = v5->_service;
    v5->_service = (IDSService *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    listeners = v5->_listeners;
    v5->_listeners = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel__handleReconnectEvent_, CFSTR("com.apple.atc.ATIDSService.reconnect"), 0);

  }
  return v5;
}

- (BOOL)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  ATIDSService *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[IDSService accounts](self->_service, "accounts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSService devices](self->_service, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ids service. accounts=%{public}@, devices=%{public}@", (uint8_t *)&v7, 0x20u);

  }
  -[IDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, self->_queue);
  self->_running = 1;
  return 1;
}

- (void)stop
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  ATIDSService *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping ids service", buf, 0xCu);
  }

  -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__ATIDSService_stop__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)addListener:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__ATIDSService_addListener___block_invoke;
  block[3] = &unk_1E927E148;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ATIDSService_removeListener___block_invoke;
  block[3] = &unk_1E927E148;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (BOOL)hasPairedDevice
{
  void *v2;
  BOOL v3;

  -[ATIDSService pairedDevice](self, "pairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)pairedDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IDSService devices](self->_service, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isDefaultPairedDevice") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)deviceForId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IDSService devices](self->_service, "devices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)requestConnectionToPairedDeviceWithPriority:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__ATIDSService_requestConnectionToPairedDeviceWithPriority___block_invoke;
  v4[3] = &unk_1E927DB80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setPreferWifi:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int AppBooleanValue;
  NSObject *v7;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  ATIDSService *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = self;
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ setting IDSService setPreferInfraWiFi to %d", buf, 0x12u);
  }

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AllowIDSToPreferWifi"), CFSTR("com.apple.atc"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat || AppBooleanValue)
  {
    -[IDSService setPreferInfraWiFi:](self->_service, "setPreferInfraWiFi:", v3);
  }
  else
  {
    _ATLogCategoryFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ IDSService setPreferInfraWiFi is currently disabled!", buf, 0xCu);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v9 = a5;
  v10 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ATIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v15 = v9;
  v16 = v10;
  v12 = v10;
  v13 = v9;
  dispatch_async(queue, block);

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  void *v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  ATIDSService *v11;
  uint8_t buf[4];
  ATIDSService *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[ATIDSService pairedDevice](self, "pairedDevice", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ATLogCategoryFramework();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ ids devices have changed. pairedDevice=%{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__ATIDSService_service_devicesChanged___block_invoke;
  v9[3] = &unk_1E927E148;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  void *v5;
  NSObject *queue;
  _QWORD block[5];

  -[ATIDSService pairedDevice](self, "pairedDevice", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isNearby"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__ATIDSService_service_nearbyDevicesChanged___block_invoke;
    block[3] = &unk_1E927E120;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  void *v5;
  NSObject *queue;
  _QWORD block[5];

  -[ATIDSService pairedDevice](self, "pairedDevice", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isConnected"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__ATIDSService_service_connectedDevicesChanged___block_invoke;
    block[3] = &unk_1E927E120;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  ATIDSService *v16;
  id v17;

  v9 = a5;
  v10 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ATIDSService_service_account_identifier_didSendWithSuccess_error___block_invoke;
  block[3] = &unk_1E927E198;
  v15 = v10;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(queue, block);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7;
  NSObject *v8;
  double v9;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  ATIDSService *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  _ATLogCategoryFramework();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ ids message delivered. id=%{public}@", buf, 0x16u);
  }

  -[ATIDSConnectionInfo wakeupTimestamp](self->_connectionInfo, "wakeupTimestamp");
  if (v9 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[ATIDSConnectionInfo wakeupTimestamp](self->_connectionInfo, "wakeupTimestamp");
    ATReportEventAddDoubleToScalarKey();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);

}

- (void)socketDidClose:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ATIDSService_socketDidClose___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(queue, block);

}

- (void)socket:(id)a3 hasDataAvailable:(const char *)a4 length:(int64_t)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  ATIDSService *v11;

  v6 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__ATIDSService_socket_hasDataAvailable_length___block_invoke;
  v9[3] = &unk_1E927E148;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)_handleReconnectEvent:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATIDSService__handleReconnectEvent___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_messageTypeToString:(int)a3
{
  if (a3)
    return CFSTR("unknown");
  else
    return CFSTR("wakeup");
}

- (void)_scheduleConnectWithPriority:(int64_t)a3
{
  NSObject *v5;
  ATIDSConnectionInfo *connectionInfo;
  NSObject *v7;
  void *v8;
  ATIDSConnectionInfo *v9;
  ATIDSConnectionInfo *v10;
  int v11;
  ATIDSService *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_running)
  {
    -[ATIDSService pairedDevice](self, "pairedDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      connectionInfo = self->_connectionInfo;
      if (!connectionInfo
        || -[ATIDSConnectionInfo connectionState](connectionInfo, "connectionState") <= 2
        && -[ATIDSConnectionInfo priority](self->_connectionInfo, "priority") < a3)
      {
        _ATLogCategoryFramework();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject uniqueID](v5, "uniqueID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138543874;
          v12 = self;
          v13 = 1024;
          v14 = a3;
          v15 = 2114;
          v16 = v8;
          _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting new IDS connection with priority %d to device %{public}@", (uint8_t *)&v11, 0x1Cu);

        }
        -[ATIDSService _cancelPendingConnectionRequests](self, "_cancelPendingConnectionRequests");
        v9 = objc_alloc_init(ATIDSConnectionInfo);
        -[ATIDSConnectionInfo setDevice:](v9, "setDevice:", v5);
        -[ATIDSConnectionInfo setPriority:](v9, "setPriority:", a3);
        v10 = self->_connectionInfo;
        self->_connectionInfo = v9;

        -[ATIDSService _scheduleReconnect](self, "_scheduleReconnect");
      }
    }
  }
  else
  {
    _ATLogCategoryFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 1024;
      v14 = a3;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Not requesting connection to IDS with priority %d as the service is not started", (uint8_t *)&v11, 0x12u);
    }
  }

}

- (void)_scheduleReconnect
{
  ATIDSConnectionInfo *connectionInfo;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  ATIDSService *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo)
  {
    -[ATIDSConnectionInfo setConnectionState:](connectionInfo, "setConnectionState:", 0);
    v4 = 60 * ((-[ATIDSConnectionInfo failureCount](self->_connectionInfo, "failureCount") + 1) >> 1);
    if (v4 >= 0x12C)
      v5 = 300;
    else
      v5 = v4;
    if ((_DWORD)v5)
    {
      _ATLogCategoryFramework();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[ATIDSConnectionInfo device](self->_connectionInfo, "device");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uniqueID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[ATIDSConnectionInfo failureCount](self->_connectionInfo, "failureCount");
        v13 = 138544130;
        v14 = self;
        v15 = 2114;
        v16 = v8;
        v17 = 2048;
        v18 = v5;
        v19 = 1024;
        v20 = v9;
        _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling reconnect to %{public}@ in %llu seconds. failureCount=%d", (uint8_t *)&v13, 0x26u);

      }
      objc_msgSend(MEMORY[0x1E0CF2200], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scheduleEvent:afterDelay:withUserData:", CFSTR("com.apple.atc.ATIDSService.reconnect"), 0, (double)v5);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF2200], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeEvent:", CFSTR("com.apple.atc.ATIDSService.reconnect"));

      -[ATIDSService _initiateReconnectIfNeeded](self, "_initiateReconnectIfNeeded");
    }
  }
  else
  {
    _ATLogCategoryFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = self;
      _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Not attempting to reconnect as connectionInfo is nil", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)_initiateReconnectIfNeeded
{
  ATIDSConnectionInfo *connectionInfo;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  ATIDSService *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo && -[ATIDSConnectionInfo connectionState](connectionInfo, "connectionState") <= 2)
  {
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[ATIDSConnectionInfo device](self->_connectionInfo, "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Initiating reconnect to %{public}@", (uint8_t *)&v10, 0x16u);

    }
    -[ATIDSService _sendWakeup](self, "_sendWakeup");
  }
  else
  {
    _ATLogCategoryFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[ATIDSConnectionInfo device](self->_connectionInfo, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Not initiating reconnect to %{public}@ because we are already connected", (uint8_t *)&v10, 0x16u);

    }
  }
}

- (void)_connect
{
  ATIDSConnectionInfo *connectionInfo;
  void *v4;
  void *v5;
  void *v6;
  ATIDSSocket *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  ATIDSService *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  ATIDSSocket *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo && -[ATIDSConnectionInfo connectionState](connectionInfo, "connectionState") <= 1)
  {
    -[ATIDSConnectionInfo device](self->_connectionInfo, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATIDSConnectionInfo setConnectionState:](self->_connectionInfo, "setConnectionState:", 2);
    -[ATIDSConnectionInfo socket](self->_connectionInfo, "socket");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "removeDelegate:", self);
      if (objc_msgSend(v6, "isOpen"))
        objc_msgSend(v6, "close");
      -[ATIDSConnectionInfo setSocket:](self->_connectionInfo, "setSocket:", 0);

    }
    v7 = -[ATIDSSocket initWithDevice:service:priority:]([ATIDSSocket alloc], "initWithDevice:service:priority:", v4, self, -[ATIDSConnectionInfo priority](self->_connectionInfo, "priority"));
    -[ATSocket addDelegate:](v7, "addDelegate:", self);
    -[ATIDSConnectionInfo setSocket:](self->_connectionInfo, "setSocket:", v7);
    _ATLogCategoryFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = self;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to connect to %{public}@ using socket %{public}@", buf, 0x20u);

    }
    objc_initWeak((id *)buf, v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __24__ATIDSService__connect__block_invoke;
    v11[3] = &unk_1E927C938;
    objc_copyWeak(&v13, (id *)buf);
    v11[4] = self;
    v10 = v4;
    v12 = v10;
    -[ATIDSSocket connectWithCompletion:](v7, "connectWithCompletion:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_sendWakeup
{
  ATIDSConnectionInfo *connectionInfo;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  ATIDSConnectionInfo *v13;
  IDSService *service;
  char v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[3];
  uint8_t buf[4];
  ATIDSService *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connectionInfo = self->_connectionInfo;
  if (connectionInfo && !-[ATIDSConnectionInfo connectionState](connectionInfo, "connectionState"))
  {
    -[ATIDSConnectionInfo setConnectionState:](self->_connectionInfo, "setConnectionState:", 1);
    -[ATIDSConnectionInfo device](self->_connectionInfo, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _ATLogCategoryFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = self;
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sending wakeup to device %{public}@", buf, 0x16u);

    }
    v7 = objc_alloc(MEMORY[0x1E0D34348]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "wakeup", 6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithProtobufData:type:isResponse:", v8, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D34018]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D341E8];
    v22[0] = *MEMORY[0x1E0D341C8];
    v22[1] = v11;
    v23[0] = &unk_1E928B6F8;
    v23[1] = MEMORY[0x1E0C9AAB0];
    v22[2] = *MEMORY[0x1E0D34168];
    v23[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_connectionInfo;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[ATIDSConnectionInfo setWakeupTimestamp:](v13, "setWakeupTimestamp:");
    ATReportEventIncrementingScalarKey();
    service = self->_service;
    v20 = 0;
    v21 = 0;
    v15 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](service, "sendProtobuf:toDestinations:priority:options:identifier:error:", v9, v10, 100, v12, &v21, &v20);
    v16 = v21;
    v17 = v20;
    _ATLogCategoryFramework();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if ((v15 & 1) != 0)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v16;
        _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ wakeup message sent. id=%{public}@", buf, 0x16u);
      }

    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = self;
        v26 = 2114;
        v27 = v17;
        _os_log_impl(&dword_1D1868000, v19, OS_LOG_TYPE_ERROR, "%{public}@ failed to send wakeup message. err=%{public}@", buf, 0x16u);
      }

      ATReportEventIncrementingScalarKey();
      -[ATIDSConnectionInfo setFailureCount:](self->_connectionInfo, "setFailureCount:", -[ATIDSConnectionInfo failureCount](self->_connectionInfo, "failureCount") + 1);
      -[ATIDSService _scheduleReconnect](self, "_scheduleReconnect");
    }

  }
}

- (void)_cancelPendingConnectionRequests
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATIDSConnectionInfo *connectionInfo;
  void *v9;
  int v10;
  ATIDSService *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connectionInfo)
  {
    _ATLogCategoryFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[ATIDSConnectionInfo device](self->_connectionInfo, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling pending connection request to %{public}@", (uint8_t *)&v10, 0x16u);

    }
    -[ATIDSConnectionInfo socket](self->_connectionInfo, "socket");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "removeDelegate:", self);
      if (objc_msgSend(v7, "isOpen"))
        objc_msgSend(v7, "close");
    }
    connectionInfo = self->_connectionInfo;
    self->_connectionInfo = 0;

    objc_msgSend(MEMORY[0x1E0CF2200], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeEvent:", CFSTR("com.apple.atc.ATIDSService.reconnect"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __24__ATIDSService__connect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __24__ATIDSService__connect__block_invoke_2;
    v7[3] = &unk_1E927D688;
    v7[4] = v5;
    v8 = v3;
    v9 = *(id *)(a1 + 40);
    v10 = WeakRetained;
    dispatch_async(v6, v7);

  }
}

void __24__ATIDSService__connect__block_invoke_2(id *a1)
{
  __CFString *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  const __CFString *v14;
  _QWORD *v15;
  ATDeviceMessageLink *v16;
  void *v17;
  _BYTE v18[12];
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*((id *)a1[4] + 4), "socket");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = a1[5];
  _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[4];
      objc_msgSend(a1[6], "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[7];
      if (v2)
        v9 = v2;
      else
        v9 = CFSTR("nil");
      objc_msgSend(a1[5], "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138544386;
      *(_QWORD *)&v18[4] = v6;
      v19 = 2114;
      v20 = (uint64_t)v7;
      v21 = 2114;
      v22 = v8;
      v23 = 2114;
      v24 = v9;
      v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "%{public}@ connection to %{public}@ completed for socket %{public}@. connectionSocket=%{public}@ error=%{public}@", v18, 0x34u);

LABEL_11:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a1[4];
    objc_msgSend(a1[6], "uniqueID");
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v12;
    v13 = a1[7];
    v14 = CFSTR("nil");
    *(_DWORD *)v18 = 138544130;
    if (v2)
      v14 = v2;
    *(_QWORD *)&v18[4] = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v14;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ connection to %{public}@ completed for socket %{public}@. connectionSocket=%{public}@", v18, 0x2Au);
    goto LABEL_11;
  }

  v15 = a1[4];
  if (!a1[5] && v15[4] && v2 == a1[7])
  {
    v16 = -[ATDeviceMessageLink initWithSocket:]([ATDeviceMessageLink alloc], "initWithSocket:", v2);
    objc_msgSend(a1[4], "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "listener:didReceiveMessageLinkRequest:", a1[4], v16);

  }
  else
  {
    objc_msgSend(a1[7], "removeDelegate:", v15, *(_QWORD *)v18);
    if (objc_msgSend(a1[7], "isOpen"))
      objc_msgSend(a1[7], "close");
    if (v2 == a1[7])
    {
      objc_msgSend(*((id *)a1[4] + 4), "setSocket:", 0);
      objc_msgSend(*((id *)a1[4] + 4), "setFailureCount:", objc_msgSend(*((id *)a1[4] + 4), "failureCount") + 1);
      objc_msgSend(a1[4], "_scheduleReconnect");
    }
  }

}

uint64_t __38__ATIDSService__handleReconnectEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initiateReconnectIfNeeded");
}

void __47__ATIDSService_socket_hasDataAvailable_length___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  if (v3 && (objc_msgSend(v3, "socket"), v4 = (id)objc_claimAutoreleasedReturnValue(), v4, v4 == v2))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setConnectionState:", 4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setFailureCount:", 0);
  }
  else
  {
    _ATLogCategoryFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "%{public}@ ignoring socket hasDataAvailable notification for %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __31__ATIDSService_socketDidClose___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2
    && (v3 = *(void **)(a1 + 40),
        objc_msgSend(v2, "socket"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3 == v4))
  {
    _ATLogCategoryFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v16 = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_ERROR, "%{public}@ socket %{public}@ was closed", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "removeDelegate:", *(_QWORD *)(a1 + 32));
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "connectionState") > 3)
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 32);
      *(_QWORD *)(v14 + 32) = 0;

    }
    else
    {
      _ATLogCategoryFramework();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v16 = 138543618;
        v17 = v12;
        v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_ERROR, "%{public}@ socket %{public}@ was closed before any data was received - treating as connection failure", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFailureCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "failureCount") + 1);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setSocket:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_scheduleReconnect");
    }
    objc_msgSend(*(id *)(a1 + 32), "setPreferWifi:", 0);
  }
  else
  {
    _ATLogCategoryFramework();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 48);
      v16 = 138543618;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "%{public}@ ignoring socket closed notification for %{public}@", (uint8_t *)&v16, 0x16u);
    }

  }
}

unint64_t __71__ATIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(uint64_t a1)
{
  id *v2;
  unint64_t result;

  v2 = *(id **)(a1 + 32);
  if (v2[4])
  {
    result = objc_msgSend(v2[4], "connectionState");
    if (result > 1)
      return result;
    v2 = *(id **)(a1 + 32);
  }
  return objc_msgSend(v2, "_connect");
}

void __68__ATIDSService_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138543874;
      v11 = v6;
      v12 = 2114;
      v13 = v5;
      v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@ failed to send ids message. id=%{public}@, error=%{public}@", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setFailureCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "failureCount") + 1);
    objc_msgSend(*(id *)(a1 + 32), "code");
    ATReportEventIncrementingScalarKey();
    objc_msgSend(*(id *)(a1 + 40), "_scheduleReconnect");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ ids message sent. id=%{public}@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void *__48__ATIDSService_service_connectedDevicesChanged___block_invoke(uint64_t a1)
{
  void *result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
  {
    result = (void *)objc_msgSend(result, "connectionState");
    if (!result)
    {
      _ATLogCategoryFramework();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v5 = 138543362;
        v6 = v4;
        _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ paired device is connected - schedule a reconnect now", (uint8_t *)&v5, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFailureCount:", 0);
      return (void *)objc_msgSend(*(id *)(a1 + 32), "_scheduleReconnect");
    }
  }
  return result;
}

void *__45__ATIDSService_service_nearbyDevicesChanged___block_invoke(uint64_t a1)
{
  void *result;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
  {
    result = (void *)objc_msgSend(result, "connectionState");
    if (!result)
    {
      _ATLogCategoryFramework();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(a1 + 32);
        v5 = 138543362;
        v6 = v4;
        _os_log_impl(&dword_1D1868000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ paired device is nearby - schedule a reconnect now", (uint8_t *)&v5, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFailureCount:", 0);
      return (void *)objc_msgSend(*(id *)(a1 + 32), "_scheduleReconnect");
    }
  }
  return result;
}

void __39__ATIDSService_service_devicesChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "_cancelPendingConnectionRequests");
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 40) + 40);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "idsServiceDevicesDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __73__ATIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  id *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryFramework();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = objc_msgSend(*(id *)(a1 + 40), "type");
    objc_msgSend(*(id *)(a1 + 32), "_messageTypeToString:", objc_msgSend(*(id *)(a1 + 40), "type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v16 = 138544130;
    v17 = v3;
    v18 = 1024;
    v19 = v4;
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ received ids message %d:'%{public}@' from id %{public}@", (uint8_t *)&v16, 0x26u);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "type"))
  {
    _ATLogCategoryFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = objc_msgSend(*(id *)(a1 + 40), "type");
      objc_msgSend(*(id *)(a1 + 32), "_messageTypeToString:", objc_msgSend(*(id *)(a1 + 40), "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v16 = 138544130;
      v17 = v8;
      v18 = 1024;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_INFO, "%{public}@ received ids message of unknown type %d:'%{public}@' from id %{public}@", (uint8_t *)&v16, 0x26u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pairedDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12 = *(id **)(a1 + 32);
      if (v12[4])
      {
        if ((unint64_t)objc_msgSend(v12[4], "connectionState") > 1)
        {
          _ATLogCategoryFramework();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_QWORD *)(a1 + 32);
            v15 = objc_msgSend(*(id *)(v14 + 32), "connectionState");
            v16 = 138543618;
            v17 = v14;
            v18 = 1024;
            v19 = v15;
            _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring wakeup. connectionState=%d", (uint8_t *)&v16, 0x12u);
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_connect");
        }
      }
      else
      {
        objc_msgSend(v12, "_scheduleConnectWithPriority:", 200);
      }
    }
  }

}

uint64_t __60__ATIDSService_requestConnectionToPairedDeviceWithPriority___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleConnectWithPriority:", *(_QWORD *)(a1 + 40));
}

uint64_t __31__ATIDSService_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __28__ATIDSService_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __20__ATIDSService_stop__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelPendingConnectionRequests");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return result;
}

+ (int64_t)openSocketPriorityFromATPendingChangePriority:(int)a3
{
  int64_t v3;

  v3 = 300;
  if (a3 == 1)
    v3 = 200;
  if (a3 == 2)
    return 100;
  else
    return v3;
}

@end
