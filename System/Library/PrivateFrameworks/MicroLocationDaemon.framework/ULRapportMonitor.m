@implementation ULRapportMonitor

- (ULRapportMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _ULRequireInitializer(v2, sel_initWithNotificationHelper_identityTypeFlags_controlFlags_);
}

- (ULRapportMonitor)initWithNotificationHelper:(id)a3 identityTypeFlags:(unsigned int)a4 controlFlags:(unint64_t)a5
{
  uint64_t v6;
  id v8;
  ULRapportMonitor *v9;
  ULRapportMonitor *v10;
  objc_super v12;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ULRapportMonitor;
  v9 = -[ULEventMonitor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[ULRapportMonitor setNotificationHelper:](v9, "setNotificationHelper:", v8);
    -[ULRapportMonitor setIdentityTypeFlags:](v10, "setIdentityTypeFlags:", v6);
    -[ULRapportMonitor setControlFlags:](v10, "setControlFlags:", a5);
  }

  return v10;
}

- (void)startMonitoring:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[ULEventMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ULEvent eventName](ULRapportMonitorEventIdentities, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqual:", v5);

  if (v6)
  {
    -[ULRapportMonitor _startMonitoringForIdentities](self, "_startMonitoringForIdentities");
  }
  else
  {
    +[ULEvent eventName](ULRapportMonitorEventDeviceFound, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v7);

    if (v8)
      -[ULRapportMonitor _startMonitoringForDevices](self, "_startMonitoringForDevices");
  }

}

- (void)stopMonitoring:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[ULEventMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  +[ULEvent eventName](ULRapportMonitorEventIdentities, "eventName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqual:", v5);

  if (v6)
  {
    -[ULRapportMonitor _stopMonitoringForIdentities](self, "_stopMonitoringForIdentities");
  }
  else
  {
    +[ULEvent eventName](ULRapportMonitorEventDeviceFound, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v7);

    if (v8)
      -[ULRapportMonitor _stopMonitoringForDevices](self, "_stopMonitoringForDevices");
  }

}

- (void)_startMonitoringForIdentities
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE7CBE0]);
  -[ULRapportMonitor setClient:](self, "setClient:", v3);

  -[ULEventMonitor queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRapportMonitor client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", v4);

  objc_initWeak(&location, self);
  -[ULRapportMonitor notificationHelper](self, "notificationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __49__ULRapportMonitor__startMonitoringForIdentities__block_invoke;
  v12 = &unk_2511D2C80;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v6, "addObserverForNotificationName:handler:", CFSTR("com.apple.rapport.identitiesChanged"), &v9);

  -[ULRapportMonitor _getIdentities](self, "_getIdentities", v9, v10, v11, v12);
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_59);
  v7 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    +[ULEvent eventName](ULRapportMonitorEventIdentities, "eventName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@", buf, 0xCu);

  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __49__ULRapportMonitor__startMonitoringForIdentities__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_getIdentities");
    WeakRetained = v2;
  }

}

- (void)_startMonitoringForDevices
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BE7CBF0]);
  -[ULRapportMonitor setCompanionLinkClient:](self, "setCompanionLinkClient:", v3);

  -[ULEventMonitor queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULRapportMonitor companionLinkClient](self, "companionLinkClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", v4);

  v6 = -[ULRapportMonitor controlFlags](self, "controlFlags");
  -[ULRapportMonitor companionLinkClient](self, "companionLinkClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setControlFlags:", v6);

  -[ULRapportMonitor _activateCompanionLinkClientAndSetHandlers](self, "_activateCompanionLinkClientAndSetHandlers");
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_59);
  v8 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    +[ULEvent eventName](ULRapportMonitorEventDeviceFound, "eventName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@", (uint8_t *)&v11, 0xCu);

  }
}

- (void)_stopMonitoringForIdentities
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_59);
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    +[ULEvent eventName](ULRapportMonitorEventIdentities, "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);

  }
  -[ULRapportMonitor notificationHelper](self, "notificationHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserverForNotificationName:", CFSTR("com.apple.rapport.identitiesChanged"));

  -[ULRapportMonitor client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[ULRapportMonitor setClient:](self, "setClient:", 0);
  -[ULRapportMonitor setIdentities:](self, "setIdentities:", 0);
}

- (void)_stopMonitoringForDevices
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_59);
  v3 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    +[ULEvent eventName](ULRapportMonitorEventDeviceFound, "eventName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);

  }
  -[ULRapportMonitor companionLinkClient](self, "companionLinkClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[ULRapportMonitor companionLinkClient](self, "companionLinkClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDeviceFoundHandler:", 0);

  -[ULRapportMonitor setCompanionLinkClient:](self, "setCompanionLinkClient:", 0);
}

- (void)_getIdentities
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[ULRapportMonitor client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ULRapportMonitor identityTypeFlags](self, "identityTypeFlags");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__ULRapportMonitor__getIdentities__block_invoke;
  v5[3] = &unk_2511D6700;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "getIdentitiesWithFlags:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __34__ULRapportMonitor__getIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  ULRapportMonitorEventIdentities *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v9);

    if (v6)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_59);
      v10 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_ERROR, "getIdentitiesWithFlags failed with error: %@", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(v8, "_stopMonitoringForIdentities");
    }
    else
    {
      v11 = (void *)objc_msgSend(v5, "copy");
      objc_msgSend(v8, "setIdentities:", v11);

      v12 = objc_alloc_init(ULRapportMonitorEventIdentities);
      objc_msgSend(v8, "identities");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "copy");
      -[ULRapportMonitorEventIdentities setIdentities:](v12, "setIdentities:", v14);

      objc_msgSend(v8, "postEvent:", v12);
    }
  }

}

- (void)_activateCompanionLinkClientAndSetHandlers
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke;
  v8[3] = &unk_2511D6728;
  objc_copyWeak(&v9, &location);
  -[ULRapportMonitor companionLinkClient](self, "companionLinkClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceFoundHandler:", v8);

  -[ULRapportMonitor companionLinkClient](self, "companionLinkClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke_2;
  v6[3] = &unk_2511D3410;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "activateWithCompletion:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  NSObject *v5;
  ULRapportMonitorEventDeviceFound *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v5);

    v6 = objc_alloc_init(ULRapportMonitorEventDeviceFound);
    -[ULRapportMonitorEventDeviceFound setDevice:](v6, "setDevice:", v7);
    objc_msgSend(v4, "postEvent:", v6);

  }
}

void __62__ULRapportMonitor__activateCompanionLinkClientAndSetHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (v3)
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_59);
      v7 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v3;
        _os_log_impl(&dword_2419D9000, v7, OS_LOG_TYPE_ERROR, "activateWithCompletion failed with error: %@", (uint8_t *)&v9, 0xCu);
      }
      objc_msgSend(v5, "_stopMonitoringForDevices");
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_59);
      v8 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "RPCompanionLinkClient activated", (uint8_t *)&v9, 2u);
      }
    }
  }

}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (unsigned)identityTypeFlags
{
  return self->_identityTypeFlags;
}

- (void)setIdentityTypeFlags:(unsigned int)a3
{
  self->_identityTypeFlags = a3;
}

- (RPClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSArray)identities
{
  return self->_identities;
}

- (void)setIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_identities, a3);
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (RPCompanionLinkClient)companionLinkClient
{
  return self->_companionLinkClient;
}

- (void)setCompanionLinkClient:(id)a3
{
  objc_storeStrong((id *)&self->_companionLinkClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
}

@end
