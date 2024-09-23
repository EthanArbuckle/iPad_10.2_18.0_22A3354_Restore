@implementation AVBonjourServiceClient

- (AVBonjourServiceClient)initWithNetServiceType:(id)a3
{
  id v4;
  AVBonjourServiceClient *v5;
  uint64_t v6;
  NSString *serviceType;
  NSMutableSet *v8;
  NSMutableSet *resolvingServices;
  NSMutableSet *v10;
  NSMutableSet *resolvedServices;
  NSMutableSet *v12;
  NSMutableSet *monitoringServices;
  NSNetServiceBrowser *v14;
  NSNetServiceBrowser *netServiceBrowser;
  NSNetServiceBrowser *v16;
  void *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *netServiceIdentifierToChannel;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id observeAirPlayVideoActiveDidChange;
  uint64_t v26;
  uint64_t v27;
  id observeMRDeviceInfoDidChange;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AVBonjourServiceClient;
  v5 = -[AVBonjourServiceClient init](&v35, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    resolvingServices = v5->_resolvingServices;
    v5->_resolvingServices = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    resolvedServices = v5->_resolvedServices;
    v5->_resolvedServices = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    monitoringServices = v5->_monitoringServices;
    v5->_monitoringServices = v12;

    v14 = (NSNetServiceBrowser *)objc_alloc_init(MEMORY[0x1E0CB37B8]);
    netServiceBrowser = v5->_netServiceBrowser;
    v5->_netServiceBrowser = v14;

    -[NSNetServiceBrowser setIncludesPeerToPeer:](v5->_netServiceBrowser, "setIncludesPeerToPeer:", 1);
    -[NSNetServiceBrowser setDelegate:](v5->_netServiceBrowser, "setDelegate:", v5);
    v16 = v5->_netServiceBrowser;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNetServiceBrowser scheduleInRunLoop:forMode:](v16, "scheduleInRunLoop:forMode:", v17, *MEMORY[0x1E0C99860]);

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    netServiceIdentifierToChannel = v5->_netServiceIdentifierToChannel;
    v5->_netServiceIdentifierToChannel = v18;

    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0C8A268];
    v23 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke;
    v32[3] = &unk_1E5BB2A70;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", v22, 0, v21, v32);
    v24 = objc_claimAutoreleasedReturnValue();
    observeAirPlayVideoActiveDidChange = v5->_observeAirPlayVideoActiveDidChange;
    v5->_observeAirPlayVideoActiveDidChange = (id)v24;

    v26 = *MEMORY[0x1E0D4C6B0];
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke_13;
    v30[3] = &unk_1E5BB2A70;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", v26, 0, v21, v30);
    v27 = objc_claimAutoreleasedReturnValue();
    observeMRDeviceInfoDidChange = v5->_observeMRDeviceInfoDidChange;
    v5->_observeMRDeviceInfoDidChange = (id)v27;

    -[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync](v5, "_updatedAirPlayPairedDeviceAsync");
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVBonjourServiceClient endDiscovery](self, "endDiscovery");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_observeAirPlayVideoActiveDidChange);

  v4.receiver = self;
  v4.super_class = (Class)AVBonjourServiceClient;
  -[AVBonjourServiceClient dealloc](&v4, sel_dealloc);
}

- (void)beginDiscovery
{
  NSObject *v3;
  NSString *serviceType;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_discovering)
  {
    _avairlog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceType = self->_serviceType;
      v5 = 138543362;
      v6 = serviceType;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "Beginning discovery for %{public}@...", (uint8_t *)&v5, 0xCu);
    }

    -[NSNetServiceBrowser searchForServicesOfType:inDomain:](self->_netServiceBrowser, "searchForServicesOfType:inDomain:", self->_serviceType, CFSTR("local"));
    self->_discovering = 1;
  }
}

- (void)endDiscovery
{
  NSObject *v3;
  NSString *serviceType;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_discovering)
  {
    _avairlog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      serviceType = self->_serviceType;
      v5 = 138543362;
      v6 = serviceType;
      _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "Stopping discovery for %{public}@", (uint8_t *)&v5, 0xCu);
    }

    -[NSNetServiceBrowser stop](self->_netServiceBrowser, "stop");
    self->_discovering = 0;
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AVBonjourServiceClient serviceType](self, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVBonjourServiceClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVBonjourServiceClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<AVBonjourServiceClient %p (%@); delegate <%@ %p>>"), self, v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)setAirplayDeviceRef:(void *)a3
{
  void *airplayDeviceRef;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  airplayDeviceRef = self->_airplayDeviceRef;
  if (airplayDeviceRef != a3)
  {
    if (a3)
      CFRetain(a3);
    self->_airplayDeviceRef = a3;
    if (airplayDeviceRef)
      CFRelease(airplayDeviceRef);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("AVExternalDeviceAControllerirPlayDeviceRefDidChangeNotification"), self);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = self->_resolvedServices;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (-[AVBonjourServiceClient _isServiceForCurrentAirPlayDevice:](self, "_isServiceForCurrentAirPlayDevice:", v12))
          {
            _avairlog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v19 = 0;
              _os_log_impl(&dword_1AC4B1000, v13, OS_LOG_TYPE_DEFAULT, "Found service for the current AirPlay device! Posting AVBonjourServiceClientDidResolveAirPlayDeviceNetServiceNotification..", v19, 2u);
            }

            -[AVBonjourServiceClient airTransportSenderForNetService:](self, "airTransportSenderForNetService:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVBonjourServiceClient delegate](self, "delegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              _avairlog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v19 = 0;
                _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "delegate has not been set!", v19, 2u);
              }

            }
            -[AVBonjourServiceClient delegate](self, "delegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "didConnectToBonjourService:channel:", v12, v14);

            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "postNotificationName:object:", CFSTR("AVBonjourServiceClientDidResolveAirPlayDeviceNetServiceNotification"), self);

          }
        }
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

  }
}

- (void)_updatedAirPlayPairedDeviceAsync
{
  NSObject *v3;
  id v4;
  id v5[5];
  id v6;
  id location;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  AVBonjourServiceClient *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  _avairlog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %p getting device info...", buf, 0x16u);
  }

  MRMediaRemoteSetWantsOriginChangeNotifications();
  v4 = MEMORY[0x1E0C80D38];
  v5[1] = (id)MEMORY[0x1E0C809B0];
  v5[2] = (id)3221225472;
  v5[3] = __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke;
  v5[4] = &unk_1E5BB0EF0;
  objc_copyWeak(&v6, &location);
  MRMediaRemoteGetActiveOrigin();

  MRMediaRemoteGetLocalOrigin();
  objc_copyWeak(v5, &location);
  MRMediaRemoteGetDeviceInfo();

  objc_destroyWeak(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)_isServiceForCurrentAirPlayDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVBonjourServiceClient airplayDeviceRef](self, "airplayDeviceRef");
  v5 = (void *)MRPairedDeviceCopyDeviceUID();
  objc_msgSend(v4, "TXTRecordData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AVBonjourServiceClient dictionaryFromTXTRecordData:](AVBonjourServiceClient, "dictionaryFromTXTRecordData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("receiverPairingIdentity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _avairlog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[AVBonjourServiceClient _isServiceForCurrentAirPlayDevice:]";
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s current device UID = %{public}@; service identifier = %{public}@",
      (uint8_t *)&v12,
      0x20u);
  }

  v10 = objc_msgSend(v5, "isEqualToString:", v8);
  return v10;
}

- (id)identifierForNetService:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "hostName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("?host?");
  v8 = objc_msgSend(v4, "port");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%ld>"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)airTransportSenderForNetService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AVBonjourServiceClient identifierForNetService:](self, "identifierForNetService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_netServiceIdentifierToChannel, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v12 = 0;
    v13 = 0;
    if (objc_msgSend(v4, "getInputStream:outputStream:", &v13, &v12))
    {
      +[AVAirTransport channelWithInput:output:](AVAirTransport, "channelWithInput:output:", v13, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_netServiceIdentifierToChannel, "setObject:forKeyedSubscript:", v8, v5);
      _avairlog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "-[AVBonjourServiceClient airTransportSenderForNetService:]";
        v16 = 2112;
        v17 = v4;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ ===> %@", buf, 0x20u);
      }

      v7 = v8;
    }
    else
    {
      _avairlog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[AVBonjourServiceClient airTransportSenderForNetService:]";
        _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s failed to get the input/output streams!", buf, 0xCu);
      }

      v7 = 0;
    }

  }
  return v7;
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  _avairlog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "didNotSearch (errorDict = %{public}@)", (uint8_t *)&v6, 0xCu);
  }

}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _avairlog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "didFindService %@", (uint8_t *)&v9, 0xCu);
  }

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
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _avairlog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_DEFAULT, "didRemoveService %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v6, "stopMonitoring");
  objc_msgSend(v6, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

  -[NSMutableSet removeObject:](self->_monitoringServices, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_resolvingServices, "removeObject:", v6);
  -[NSMutableSet removeObject:](self->_resolvedServices, "removeObject:", v6);

}

- (void)netServiceWillResolve:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _avairlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "willResolve %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)netServiceDidResolveAddress:(id)a3
{
  char *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  _avairlog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "didResolveAddress %@", (uint8_t *)&v18, 0xCu);
  }

  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "TXTRecordData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryFromTXTRecordData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("receiverPairingIdentity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _avairlog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315394;
    v19 = "-[AVBonjourServiceClient netServiceDidResolveAddress:]";
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "%s localAirPlayReceiverPairingIdentity = %@", (uint8_t *)&v18, 0x16u);
  }

  -[NSMutableSet addObject:](self->_resolvedServices, "addObject:", v4);
  -[NSMutableSet removeObject:](self->_resolvingServices, "removeObject:", v4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("AVBonjourServiceClientDidResolveNetServiceNotification"), v4);

  if (-[AVBonjourServiceClient _isServiceForCurrentAirPlayDevice:](self, "_isServiceForCurrentAirPlayDevice:", v4))
  {
    _avairlog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "Found netService for the current AirPlay device; posting .DidResolveAirPlayDeviceNetServiceNotification..",
        (uint8_t *)&v18,
        2u);
    }

    -[AVBonjourServiceClient airTransportSenderForNetService:](self, "airTransportSenderForNetService:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVBonjourServiceClient delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      _avairlog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_1AC4B1000, v15, OS_LOG_TYPE_DEFAULT, "delegate has not been set!", (uint8_t *)&v18, 2u);
      }

    }
    -[AVBonjourServiceClient delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didConnectToBonjourService:channel:", v4, v13);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("AVBonjourServiceClientDidResolveAirPlayDeviceNetServiceNotification"), self);

  }
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2F78]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _avairlog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "didNotResolve %@", buf, 0xCu);
  }

  if (objc_msgSend(v8, "integerValue") == -72007)
  {
    _avairlog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1AC4B1000, v10, OS_LOG_TYPE_DEFAULT, "didNotResolve %@ due to timeout!", buf, 0xCu);
    }

    v11 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__AVBonjourServiceClient_netService_didNotResolve___block_invoke;
    block[3] = &unk_1E5BB4CA0;
    v13 = v6;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[NSMutableSet removeObject:](self->_resolvingServices, "removeObject:", v6);
  }

}

- (void)netServiceDidStop:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _avairlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "didStop resolution request %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  _avairlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "didUpdateTXTRecordData", v5, 2u);
  }

}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (AVBonjourServiceClientDelegate)delegate
{
  return (AVBonjourServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSNetServiceBrowser)netServiceBrowser
{
  return self->_netServiceBrowser;
}

- (void)airplayDeviceRef
{
  return self->_airplayDeviceRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServiceBrowser, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_observeMRDeviceInfoDidChange, 0);
  objc_storeStrong(&self->_observeAirPlayVideoActiveDidChange, 0);
  objc_storeStrong((id *)&self->_netServiceIdentifierToChannel, 0);
  objc_storeStrong((id *)&self->_monitoringServices, 0);
  objc_storeStrong((id *)&self->_resolvingServices, 0);
  objc_storeStrong((id *)&self->_resolvedServices, 0);
}

uint64_t __51__AVBonjourServiceClient_netService_didNotResolve___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resolveWithTimeout:", 30.0);
}

void __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  const __CFString *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("SUCCESS");
    *(_DWORD *)buf = 136315650;
    v11 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    v12 = 2112;
    if (!a2)
      v7 = CFSTR("FAIL");
    v13 = v7;
    v14 = 2112;
    v15 = a3;
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s getActiveOrigin: %@, %@", buf, 0x20u);
  }

  v8 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v9, (id *)(a1 + 32));
  MRMediaRemoteGetDeviceInfo();

  objc_destroyWeak(&v9);
}

void __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke_28(uint64_t a1, const char *a2, const char *a3)
{
  NSObject *v6;
  _BOOL4 v7;
  const __CFArray *v8;
  const __CFArray *v9;
  const char *ValueAtIndex;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id WeakRetained;
  NSObject *v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _avairlog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (v7)
    {
      v20 = 138543362;
      v21 = a3;
      v14 = "_updateAirPlayPairedDeviceAsync failed; error = %{public}@";
LABEL_13:
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0xCu);
    }
LABEL_14:

    ValueAtIndex = 0;
    goto LABEL_22;
  }
  if (v7)
  {
    v20 = 136315138;
    v21 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s have device info and device. Getting more information...", (uint8_t *)&v20, 0xCu);
  }

  v8 = (const __CFArray *)MRPairedDeviceCopyGroupedDevices();
  if (!v8)
  {
    _avairlog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = a2;
      v14 = "_updateAirPlayPairedDeviceAsync: no grouped devices: localDevice = %@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v9 = v8;
  if (CFArrayGetCount(v8) == 1)
  {
    ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v9, 0);
    v11 = MEMORY[0x1AF43E3B8]();
    _avairlog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 == 4)
    {
      if (v13)
      {
        v20 = 138412290;
        v21 = ValueAtIndex;
        _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "AppleTV pairedDeviceRef = %@", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_21;
    }
    if (v13)
    {
      v20 = 138412290;
      v21 = ValueAtIndex;
      v15 = "_updateAirPlayPairedDeviceAsync: first grouped device is not AppleTV (%@)";
      v16 = v12;
      v17 = 12;
      goto LABEL_19;
    }
  }
  else
  {
    _avairlog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v15 = "_updateAirPlayPairedDeviceAsync: grouped devices count != 1";
      v16 = v12;
      v17 = 2;
LABEL_19:
      _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
    }
  }
  ValueAtIndex = 0;
LABEL_21:

  CFRelease(v9);
LABEL_22:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAirplayDeviceRef:", ValueAtIndex);
  _avairlog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    _os_log_impl(&dword_1AC4B1000, v19, OS_LOG_TYPE_DEFAULT, "%s done.", (uint8_t *)&v20, 0xCu);
  }

}

void __58__AVBonjourServiceClient__updatedAirPlayPairedDeviceAsync__block_invoke_25(uint64_t a1, const char *a2)
{
  NSObject *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const char *ValueAtIndex;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *WeakRetained;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return;
  _avairlog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
    _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s have [active] device info. Getting more information...", (uint8_t *)&v16, 0xCu);
  }

  v5 = (const __CFArray *)MRPairedDeviceCopyGroupedDevices();
  if (!v5)
  {
    _avairlog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = a2;
      _os_log_impl(&dword_1AC4B1000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[active] no grouped devices; activeDevice = %@",
        (uint8_t *)&v16,
        0xCu);
    }
    goto LABEL_15;
  }
  v6 = v5;
  if (CFArrayGetCount(v5) != 1)
  {
    _avairlog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v13 = "[active] grouped devices count != 1";
      v14 = v9;
      v15 = 2;
LABEL_20:
      _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
    }
LABEL_21:

    CFRelease(v6);
    return;
  }
  ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v6, 0);
  v8 = MEMORY[0x1AF43E3B8]();
  _avairlog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 != 4)
  {
    if (v10)
    {
      v16 = 138412290;
      v17 = ValueAtIndex;
      v13 = "[active] first grouped device is not AppleTV (%@)";
      v14 = v9;
      v15 = 12;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (v10)
  {
    v16 = 138412290;
    v17 = ValueAtIndex;
    _os_log_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_DEFAULT, "[active] AppleTV pairedDeviceRef = %@", (uint8_t *)&v16, 0xCu);
  }

  CFRelease(v6);
  if (ValueAtIndex)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject setAirplayDeviceRef:](WeakRetained, "setAirplayDeviceRef:", ValueAtIndex);
    _avairlog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[AVBonjourServiceClient _updatedAirPlayPairedDeviceAsync]_block_invoke";
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s [active] done.", (uint8_t *)&v16, 0xCu);
    }

LABEL_15:
  }
}

void __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _avairlog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AVBonjourServiceClient initWithNetServiceType:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s AVExternalPlaybackMonitorAirPlayVideoActiveDidChangeNotification received; note = %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }

  objc_msgSend(WeakRetained, "_updatedAirPlayPairedDeviceAsync");
}

void __49__AVBonjourServiceClient_initWithNetServiceType___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _avairlog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AVBonjourServiceClient initWithNetServiceType:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s kMRDeviceInfoDidChangeNotification received; note = %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }

  objc_msgSend(WeakRetained, "_updatedAirPlayPairedDeviceAsync");
}

+ (id)dictionaryFromTXTRecordData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37B0], "dictionaryFromTXTRecordData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
