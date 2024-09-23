@implementation CMContinuityCaptureTransportNWDevice

- (CMContinuityCaptureTransportNWDevice)initWithCapabilities:(id)a3 identifier:(id)a4 remote:(BOOL)a5
{
  id v9;
  id v10;
  CMContinuityCaptureTransportNWDevice *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  CMContinuityCaptureMagicStateMonitor *v15;
  CMContinuityCaptureMagicStateMonitor *magicStateMonitor;
  NSMutableDictionary *v17;
  NSMutableDictionary *activeStreams;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CMContinuityCaptureTransportNWDevice;
  v11 = -[CMContinuityCaptureTransportNWDevice init](&v20, sel_init);
  if (v11)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.continuitycapture.localDevice", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v11->_remote = a5;
    v15 = -[CMContinuityCaptureMagicStateMonitor initWithDevice:]([CMContinuityCaptureMagicStateMonitor alloc], "initWithDevice:", v11);
    magicStateMonitor = v11->_magicStateMonitor;
    v11->_magicStateMonitor = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    activeStreams = v11->_activeStreams;
    v11->_activeStreams = v17;

    objc_storeStrong((id *)&v11->_deviceIdentifier, a4);
    objc_storeStrong((id *)&v11->_capabilities, a3);
    -[CMContinuityCaptureTransportNWDevice setupUDPNWStack](v11, "setupUDPNWStack");
  }

  return v11;
}

- (void)setActiveConnection:(id)a3
{
  OS_nw_connection *v4;
  OS_nw_connection *activeConnection;
  CMContinuityCaptureTransportNWDevice *obj;

  v4 = (OS_nw_connection *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeConnection = obj->_activeConnection;
  obj->_activeConnection = v4;

  objc_sync_exit(obj);
}

- (OS_nw_connection)activeConnection
{
  CMContinuityCaptureTransportNWDevice *v2;
  OS_nw_connection *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeConnection;
  objc_sync_exit(v2);

  return v3;
}

- (void)setupUDPNWStack
{
  NSObject *host_with_numeric_port;
  void *v4;
  NSObject *secure_udp;
  OS_nw_path_evaluator *evaluator_for_endpoint;
  OS_nw_path_evaluator *nwPathEvaluator;
  NSObject *v8;
  OS_nw_path_evaluator *v9;
  NSUUID *v10;
  NSUUID *nwClientID;
  NSObject *v12;
  NSUUID *v13;
  const char *v14;
  int v15;
  CMContinuityCaptureTransportNWDevice *v16;
  __int16 v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(localIPAddress, "UTF8String");
  host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
  if (!host_with_numeric_port)
  {
    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = self;
      v14 = "%@ Failed to get local endpoint";
LABEL_14:
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0xCu);
      v4 = 0;
      secure_udp = 0;
LABEL_8:

      goto LABEL_9;
    }
    v4 = 0;
LABEL_16:
    secure_udp = 0;
    goto LABEL_8;
  }
  objc_msgSend(localIPAddress, "UTF8String");
  v4 = (void *)nw_endpoint_create_host_with_numeric_port();
  if (!v4)
  {
    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = self;
      v14 = "%@ Failed to get remote endpoint";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], &__block_literal_global_131);
  CMContinuityCaptureGetMediaProcessUniqueID(self->_remote);
  nw_parameters_set_delegated_unique_pid();
  nw_parameters_set_reuse_local_address(secure_udp, 1);
  nw_parameters_set_local_endpoint(secure_udp, host_with_numeric_port);
  evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
  nwPathEvaluator = self->_nwPathEvaluator;
  self->_nwPathEvaluator = evaluator_for_endpoint;

  CMContinuityCaptureLog(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_nwPathEvaluator;
    v15 = 138412546;
    v16 = self;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ NW Path evaulator %@", (uint8_t *)&v15, 0x16u);
  }

  if (self->_nwPathEvaluator)
  {
    nw_path_evaluator_get_client_id();
    v10 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v19);
    nwClientID = self->_nwClientID;
    self->_nwClientID = v10;

    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_nwClientID;
      v15 = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ NWClientID %@", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __55__CMContinuityCaptureTransportNWDevice_setupUDPNWStack__block_invoke()
{
  return nw_udp_options_set_no_metadata();
}

- (CMContinuityCaptureCapabilities)capabilities
{
  CMContinuityCaptureTransportNWDevice *v2;
  CMContinuityCaptureCapabilities *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_capabilities;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCapabilities:(id)a3
{
  CMContinuityCaptureCapabilities *v4;
  CMContinuityCaptureCapabilities *capabilities;
  CMContinuityCaptureTransportNWDevice *obj;

  v4 = (CMContinuityCaptureCapabilities *)a3;
  obj = self;
  objc_sync_enter(obj);
  capabilities = obj->_capabilities;
  obj->_capabilities = v4;

  objc_sync_exit(obj);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)active
{
  CMContinuityCaptureTransportNWDevice *v2;
  BOOL active;

  v2 = self;
  objc_sync_enter(v2);
  active = v2->_active;
  objc_sync_exit(v2);

  return active;
}

- (BOOL)remote
{
  return self->_remote;
}

- (CMContinuityCaptureMagicStateMonitor)magicStateMonitor
{
  return self->_magicStateMonitor;
}

- (NSArray)activeStreams
{
  CMContinuityCaptureTransportNWDevice *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[NSMutableDictionary allValues](v2->_activeStreams, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (BOOL)userDisconnected
{
  return 0;
}

- (BOOL)wifiP2pActive
{
  return 1;
}

- (BOOL)allFeaturesSupported
{
  return 1;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return (NSString *)CFSTR("LocalTestDevice");
}

- (NSString)deviceModel
{
  return (NSString *)CFSTR("LocalEmbeddedDevice");
}

- (int64_t)deviceModelType
{
  return 0;
}

- (unint64_t)deviceStatus
{
  return 0x1000000;
}

- (BOOL)wired
{
  return 1;
}

- (BOOL)usable
{
  return 1;
}

- (unint64_t)deviceMajorVersion
{
  return 100;
}

- (unint64_t)deviceMinorVersion
{
  return 1;
}

- (BOOL)guest
{
  return 0;
}

- (BOOL)terminationDeferred
{
  return 0;
}

- (BOOL)canDeferTermination
{
  return 0;
}

- (BOOL)isPlacementStepSkipped
{
  return 1;
}

- (void)activate:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  CMContinuityCaptureTransportNWDevice *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  id v17;
  CMContinuityCaptureTransportNWDevice *v18;
  CMContinuityCaptureTransportNWDevice *v19;
  CMContinuityCaptureTransportNWDevice *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    CMContinuityCaptureGetListOfSupportedSidebandIdentifiers();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureTransportNWDevice capabilities](self, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureMediaIdentfiersForCapabilities(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v10 = -[CMContinuityCaptureTransportDeviceNWStream initForIdentifier:nwClientID:]([CMContinuityCaptureTransportDeviceNWStream alloc], "initForIdentifier:nwClientID:", v9, self->_nwClientID);
          if (v10)
          {
            -[CMContinuityCaptureTransportNWDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeStreams"));
            v11 = self;
            objc_sync_enter(v11);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeStreams, "setObject:forKeyedSubscript:", v10, v9);
            objc_sync_exit(v11);

            -[CMContinuityCaptureTransportNWDevice didChangeValueForKey:](v11, "didChangeValueForKey:", CFSTR("activeStreams"));
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v6);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v21;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          v17 = -[CMContinuityCaptureTransportDeviceNWStream initForIdentifier:nwClientID:]([CMContinuityCaptureTransportDeviceNWStream alloc], "initForIdentifier:nwClientID:", v16, self->_nwClientID);
          if (v17)
          {
            -[CMContinuityCaptureTransportNWDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeStreams"));
            v18 = self;
            objc_sync_enter(v18);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeStreams, "setObject:forKeyedSubscript:", v17, v16);
            objc_sync_exit(v18);

            -[CMContinuityCaptureTransportNWDevice didChangeValueForKey:](v18, "didChangeValueForKey:", CFSTR("activeStreams"));
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v13);
    }

  }
  else
  {
    -[CMContinuityCaptureTransportNWDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activeStreams"));
    v19 = self;
    objc_sync_enter(v19);
    -[NSMutableDictionary removeAllObjects](v19->_activeStreams, "removeAllObjects");
    objc_sync_exit(v19);

    -[CMContinuityCaptureTransportNWDevice didChangeValueForKey:](v19, "didChangeValueForKey:", CFSTR("activeStreams"));
  }
  -[CMContinuityCaptureTransportNWDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("active"));
  v20 = self;
  objc_sync_enter(v20);
  v20->_active = a3;
  objc_sync_exit(v20);

  -[CMContinuityCaptureTransportNWDevice didChangeValueForKey:](v20, "didChangeValueForKey:", CFSTR("active"));
}

- (void)sendRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureTransportNWDevice activeConnection](self, "activeConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (!v6)
  {
    v7 = objc_msgSend(v4, "length") + 8;
    v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v7));
    v9 = (uint64_t *)objc_msgSend(v8, "mutableBytes");
    *v9 = v7;
    v10 = v9 + 1;
    v11 = objc_retainAutorelease(v4);
    memcpy(v10, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    CMContinuityCaptureLog(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_loadWeakRetained(&location);
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ NW Connect Send Data %@", buf, 0x16u);

    }
    -[CMContinuityCaptureTransportNWDevice activeConnection](self, "activeConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(&location);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __52__CMContinuityCaptureTransportNWDevice_sendRequest___block_invoke;
    v16[3] = &unk_24F06D2A0;
    objc_copyWeak(&v17, &location);
    CMContinuityCaptureSendDataToNWConnection(v14, v8, v15, v16);

    objc_destroyWeak(&v17);
  }
  objc_destroyWeak(&location);

}

void __52__CMContinuityCaptureTransportNWDevice_sendRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CMContinuityCaptureLog(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138412546;
    v7 = WeakRetained;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@ NW connection send data error %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)captureStillImage:(id)a3 entity:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  CMContinuityCaptureTransportNWDevice *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v10)
  {
    v24[0] = &unk_24F07FBE8;
    v23[0] = CFSTR("ContinuityCaptureSelector");
    v23[1] = CFSTR("ContinuityCaptureArgs");
    v22[0] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = CFSTR("identifier");
    v24[1] = v13;
    v24[2] = CFSTR("ContinuityCaptureCommand");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v11;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;

    if (v15)
    {
      -[CMContinuityCaptureTransportNWDevice sendRequest:](self, "sendRequest:", v15);
      v17 = 0;
    }
    else
    {
      CMContinuityCaptureLog(2);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v26 = self;
        v27 = 2112;
        v28 = v14;
        v29 = 2112;
        v30 = v16;
        _os_log_error_impl(&dword_227C5D000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive message %@ error %@", buf, 0x20u);
      }

      v17 = v16;
    }
    ((void (**)(id, id))v9)[2](v9, v17);

    v11 = v16;
  }
  else
  {
    CMContinuityCaptureLog(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v11;
      _os_log_error_impl(&dword_227C5D000, v18, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject %@ Error %@", buf, 0x20u);
    }

    ((void (**)(id, id))v9)[2](v9, v11);
  }

}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  CMContinuityCaptureTransportNWDevice *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (v7)
  {
    v19[0] = &unk_24F07FC00;
    v18[0] = CFSTR("ContinuityCaptureSelector");
    v18[1] = CFSTR("ContinuityCaptureArgs");
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = CFSTR("identifier");
    v19[1] = v10;
    v19[2] = CFSTR("ContinuityCaptureData");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v11 = objc_claimAutoreleasedReturnValue();

    v15 = v8;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;

    if (v12)
    {
      -[CMContinuityCaptureTransportNWDevice sendRequest:](self, "sendRequest:", v12);
    }
    else
    {
      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v21 = self;
        v22 = 2112;
        v23 = v11;
        v24 = 2112;
        v25 = v13;
        _os_log_error_impl(&dword_227C5D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive message %@ error %@", buf, 0x20u);
      }

    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v8;
      _os_log_error_impl(&dword_227C5D000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to archive request %@ error %@", buf, 0x20u);
    }
    v13 = v8;
  }

}

- (void)handleAVCNegotiation:(int64_t)a3 data:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  CMContinuityCaptureTransportNWDevice *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  _QWORD v20[2];
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v22[0] = &unk_24F07FC18;
  v21[0] = CFSTR("ContinuityCaptureSelector");
  v21[1] = CFSTR("ContinuityCaptureArgs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = CFSTR("identifier");
  v22[1] = v8;
  v22[2] = CFSTR("ContinuityCaptureControl");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2080;
    v17 = "-[CMContinuityCaptureTransportNWDevice handleAVCNegotiation:data:]";
    v18 = 1024;
    v19 = a3;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s for entity %d", buf, 0x1Cu);
  }

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (v11)
    -[CMContinuityCaptureTransportNWDevice sendRequest:](self, "sendRequest:", v11);

}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v15[0] = &unk_24F07FC30;
  v14[0] = CFSTR("ContinuityCaptureSelector");
  v14[1] = CFSTR("ContinuityCaptureArgs");
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = CFSTR("identifier");
  v15[1] = v9;
  v15[2] = CFSTR("ContinuityCaptureCommand");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[CMContinuityCaptureTransportNWDevice sendRequest:](self, "sendRequest:", v11);

}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  CMContinuityCaptureTransportNWDevice *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  CMContinuityCaptureLog(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setValueForControl %{public}@", buf, 0x16u);
  }

  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v9)
  {
    v19[0] = &unk_24F07FC48;
    v18[0] = CFSTR("ContinuityCaptureSelector");
    v18[1] = CFSTR("ContinuityCaptureArgs");
    v17 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = CFSTR("identifier");
    v19[1] = v11;
    v19[2] = CFSTR("ContinuityCaptureControl");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v10;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v15);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v15;

    if (!v13)
      goto LABEL_7;
    -[CMContinuityCaptureTransportNWDevice sendRequest:](self, "sendRequest:", v13);
    v10 = v14;
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v21 = self;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v6;
      _os_log_error_impl(&dword_227C5D000, v13, OS_LOG_TYPE_ERROR, "%{public}@ archivedDataWithRootObject Error %@ for control %@", buf, 0x20u);
    }
    v12 = 0;
  }

  v14 = v10;
LABEL_7:
  if (v7)
    v7[2](v7);

}

- (void)startStream:(id)a3 option:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  uint8_t buf[4];
  CMContinuityCaptureTransportNWDevice *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 2114;
    v27 = v8;
    v28 = 1024;
    v29 = a4;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ StartStream for configuration %{public}@ option %d", buf, 0x1Cu);
  }

  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  if (v11)
  {
    v23[0] = &unk_24F07FC48;
    v22[0] = CFSTR("ContinuityCaptureSelector");
    v22[1] = CFSTR("ContinuityCaptureArgs");
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v13;
    v21[2] = &unk_24F07FC60;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = CFSTR("identifier");
    v23[1] = v14;
    v23[2] = CFSTR("ContinuityCaptureCommand");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v12;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;

    if (v16)
      -[CMContinuityCaptureTransportNWDevice sendRequest:](self, "sendRequest:", v16);
    if (v9)
      v9[2](v9, 0);

    v12 = v17;
  }
  else
  {
    CMContinuityCaptureLog(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureTransportSidecarDevice _startStream:option:completion:].cold.1();

    ((void (**)(id, id))v9)[2](v9, v12);
  }

}

- (void)stopStream:(int64_t)a3 option:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  CMContinuityCaptureTransportNWDevice *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, _QWORD))a5;
  CMContinuityCaptureLog(2);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 1024;
    v23 = a3;
    v24 = 1024;
    v25 = a4;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ stopStream for entity %u option %d", buf, 0x18u);
  }

  v19[0] = &unk_24F07FC18;
  v18[0] = CFSTR("ContinuityCaptureSelector");
  v18[1] = CFSTR("ContinuityCaptureArgs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  v17[2] = &unk_24F07FC60;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = CFSTR("identifier");
  v19[1] = v12;
  v19[2] = CFSTR("ContinuityCaptureCommand");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  if (v14)
    -[CMContinuityCaptureTransportNWDevice sendRequest:](self, "sendRequest:", v14);
  if (v8)
    v8[2](v8, 0);

}

- (BOOL)canReconnect
{
  return self->canReconnect;
}

- (BOOL)legacyReconnectRecovery
{
  return self->legacyReconnectRecovery;
}

- (void)setLegacyReconnectRecovery:(BOOL)a3
{
  self->legacyReconnectRecovery = a3;
}

- (BOOL)nearby
{
  return self->nearby;
}

- (void)setNearby:(BOOL)a3
{
  self->nearby = a3;
}

- (BOOL)hasStreamIntent
{
  return self->streamIntent;
}

- (void)setStreamIntent:(BOOL)a3
{
  self->streamIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_nwClientID, 0);
  objc_storeStrong((id *)&self->_nwPathEvaluator, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activeStreams, 0);
  objc_storeStrong((id *)&self->_magicStateMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
