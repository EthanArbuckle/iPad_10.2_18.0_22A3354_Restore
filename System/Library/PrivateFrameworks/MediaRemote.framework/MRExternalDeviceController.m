@implementation MRExternalDeviceController

+ (Class)externalDeviceClass
{
  return (Class)objc_opt_class();
}

- (MRExternalDeviceController)initWithBonjourServiceType:(id)a3
{
  id v5;
  MRExternalDeviceController *v6;
  uint64_t v7;
  NSString *bonjourServiceType;
  objc_class *v9;
  const char *Name;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *serialQueue;
  NSNetServiceBrowser *v14;
  NSNetServiceBrowser *serviceBrowser;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  NSMutableSet *v20;
  NSMutableSet *discoveredDevices;
  NSMutableSet *v22;
  NSMutableSet *resolvingServices;
  NSMutableSet *v24;
  NSMutableSet *monitoringServices;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRExternalDeviceController.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bonjourServiceType"));

  }
  v28.receiver = self;
  v28.super_class = (Class)MRExternalDeviceController;
  v6 = -[MRExternalDeviceController init](&v28, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    bonjourServiceType = v6->_bonjourServiceType;
    v6->_bonjourServiceType = (NSString *)v7;

    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(Name, v11);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v12;

    v14 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x1E0C92C40]);
    serviceBrowser = v6->_serviceBrowser;
    v6->_serviceBrowser = v14;

    -[NSNetServiceBrowser setDelegate:](v6->_serviceBrowser, "setDelegate:", v6);
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "usePeerToPeerExternalDeviceConnections");

    _MRLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = CFSTR("NO");
      if ((_DWORD)v17)
        v19 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, "Configuring external device net service browser with includesPeerToPeer = %@", buf, 0xCu);
    }

    -[NSNetServiceBrowser setIncludesPeerToPeer:](v6->_serviceBrowser, "setIncludesPeerToPeer:", v17);
    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    discoveredDevices = v6->_discoveredDevices;
    v6->_discoveredDevices = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    resolvingServices = v6->_resolvingServices;
    v6->_resolvingServices = v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    monitoringServices = v6->_monitoringServices;
    v6->_monitoringServices = v24;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MRExternalDeviceController endDiscovery](self, "endDiscovery");
  -[NSNetServiceBrowser setDelegate:](self->_serviceBrowser, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MRExternalDeviceController;
  -[MRExternalDeviceController dealloc](&v3, sel_dealloc);
}

- (void)beginDiscovery
{
  NSObject *v3;
  NSString *bonjourServiceType;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_discovering)
  {
    _MRLogForCategory(3uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bonjourServiceType = self->_bonjourServiceType;
      v5 = 138543362;
      v6 = bonjourServiceType;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "Beginning network service search for %{public}@...", (uint8_t *)&v5, 0xCu);
    }

    -[NSNetServiceBrowser searchForServicesOfType:inDomain:](self->_serviceBrowser, "searchForServicesOfType:inDomain:", self->_bonjourServiceType, CFSTR("local"));
    self->_discovering = 1;
  }
}

- (void)endDiscovery
{
  NSObject *v3;
  NSString *bonjourServiceType;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_discovering)
  {
    _MRLogForCategory(3uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      bonjourServiceType = self->_bonjourServiceType;
      v5 = 138543362;
      v6 = bonjourServiceType;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "Stopping network service search for %{public}@", (uint8_t *)&v5, 0xCu);
    }

    -[NSNetServiceBrowser stop](self->_serviceBrowser, "stop");
    self->_discovering = 0;
  }
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a4;
  _MRLogForCategory(3uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[MRExternalDeviceController netServiceBrowser:didFindService:moreComing:].cold.1();

  objc_msgSend(v6, "setDelegate:", self);
  -[NSMutableSet addObject:](self->_resolvingServices, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduleInRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

  objc_msgSend(v6, "startMonitoring");
  -[NSMutableSet addObject:](self->_monitoringServices, "addObject:", v6);
  objc_msgSend(v6, "resolveWithTimeout:", 10.0);

}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id WeakRetained;
  char v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _MRLogForCategory(3uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[MRExternalDeviceController netServiceBrowser:didRemoveService:moreComing:].cold.1();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_discoveredDevices;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "name", (_QWORD)v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
          v17 = v13;

          if (v17)
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            v19 = objc_opt_respondsToSelector();

            if ((v19 & 1) != 0)
            {
              v20 = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(v20, "externalDeviceController:didRemoveDevice:", self, v17);

            }
            -[NSMutableSet removeObject:](self->_discoveredDevices, "removeObject:", v17);
          }
          goto LABEL_16;
        }
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = 0;
LABEL_16:
  objc_msgSend(v6, "stopMonitoring", (_QWORD)v22);
  objc_msgSend(v6, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromRunLoop:forMode:", v21, *MEMORY[0x1E0C99860]);

  -[NSMutableSet removeObject:](self->_monitoringServices, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_resolvingServices, "removeObject:", v6);

}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MRNetServiceTransport *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MRExternalDeviceControllerDelegate **p_delegate;
  id WeakRetained;
  MRExternalDeviceController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;

  v4 = a3;
  _MRLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MRExternalDeviceController netServiceDidResolveAddress:].cold.1();

  +[MRExternalDeviceManager sharedManager](MRExternalDeviceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRNetServiceTransport createDeviceInfoFromNetService:](MRNetServiceTransport, "createDeviceInfoFromNetService:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = -[MRNetServiceTransport initWithNetService:]([MRNetServiceTransport alloc], "initWithNetService:", v4);
    -[MRNetServiceTransport setRequiresCustomPairing:](v10, "setRequiresCustomPairing:", -[NSString isEqualToString:](self->_bonjourServiceType, "isEqualToString:", CFSTR("_mediaremotetv._tcp.")));

  }
  v11 = (void *)MRPairedDeviceCopyManagedConfigDeviceID(v7);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "processName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.TVRemote")) & 1) == 0
    && (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.tvremotecore.xpc")) & 1) == 0
    && !objc_msgSend(v15, "isEqualToString:", CFSTR("tvremoted"))
    || -[MRExternalDeviceController _isManagedConfigIDAllowed:](self, "_isManagedConfigIDAllowed:", v11))
  {
    -[NSMutableSet addObject:](self->_discoveredDevices, "addObject:", v9);
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v28 = v13;
    v18 = self;
    v19 = v9;
    v20 = v15;
    v21 = v11;
    v22 = v7;
    v23 = v4;
    v24 = v6;
    v25 = WeakRetained;
    v26 = objc_opt_respondsToSelector();

    v6 = v24;
    v4 = v23;
    v7 = v22;
    v11 = v21;
    v15 = v20;
    v9 = v19;
    self = v18;
    v13 = v28;
    if ((v26 & 1) != 0)
    {
      v27 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v27, "externalDeviceController:didDiscoverDevice:", self, v9);

    }
  }
  -[NSMutableSet removeObject:](self->_resolvingServices, "removeObject:", v4);

}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _MRLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "TXTRecord data did change for service %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (BOOL)_isManagedConfigIDAllowed:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _MRLogForCategory(3uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[MRExternalDeviceController _isManagedConfigIDAllowed:].cold.3();

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveValuesForUnionSetting:", *MEMORY[0x1E0D47168]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v8)
      goto LABEL_16;
    v9 = *(_QWORD *)v17;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "lowercaseString", (_QWORD)v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          goto LABEL_6;
        goto LABEL_16;
      }
    }
  }
  else
  {
    _MRLogForCategory(3uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MRExternalDeviceController _isManagedConfigIDAllowed:].cold.2(v7);
  }
  LOBYTE(v8) = 1;
LABEL_16:

  _MRLogForCategory(3uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[MRExternalDeviceController _isManagedConfigIDAllowed:].cold.1();

  return v8;
}

- (MRExternalDeviceControllerDelegate)delegate
{
  return (MRExternalDeviceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bonjourServiceType
{
  return self->_bonjourServiceType;
}

- (BOOL)isDiscovering
{
  return self->_discovering;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourServiceType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_monitoringServices, 0);
  objc_storeStrong((id *)&self->_resolvingServices, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong((id *)&self->_serviceBrowser, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)netServiceBrowser:didFindService:moreComing:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "Found service %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)netServiceBrowser:didRemoveService:moreComing:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "Removing service %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)netServiceDidResolveAddress:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "Resolved service %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_isManagedConfigIDAllowed:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_193827000, v1, OS_LOG_TYPE_DEBUG, "Device with managedConfigDeviceID, %{public}@, allowed: %d", v2, 0x12u);
  OUTLINED_FUNCTION_8();
}

- (void)_isManagedConfigIDAllowed:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193827000, log, OS_LOG_TYPE_DEBUG, "No managedConfig allow list found. Allowing all devices", v1, 2u);
}

- (void)_isManagedConfigIDAllowed:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_10_0(&dword_193827000, v0, v1, "Checking if device with managedConfigDeviceID, %{public}@, allowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
