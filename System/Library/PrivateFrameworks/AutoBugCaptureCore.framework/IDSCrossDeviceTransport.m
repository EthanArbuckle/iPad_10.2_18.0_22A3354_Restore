@implementation IDSCrossDeviceTransport

+ (BOOL)isIDSEndpointEnabled
{
  void *v2;
  int v3;

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "internalBuild"))
    v3 = objc_msgSend(v2, "factoryBuild") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (IDSCrossDeviceTransport)init
{
  return -[IDSCrossDeviceTransport initWithServiceName:](self, "initWithServiceName:", CFSTR("com.apple.private.alloy.autobugcapture"));
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)IDSCrossDeviceTransport;
  -[IDSCrossDeviceTransport dealloc](&v3, sel_dealloc);
}

- (IDSCrossDeviceTransport)initWithServiceName:(id)a3
{
  id v5;
  IDSCrossDeviceTransport *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *idsServiceQueue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSCrossDeviceTransport;
  v6 = -[IDSCrossDeviceTransport init](&v11, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.symptoms.idsservice.queue", v7);
    idsServiceQueue = v6->_idsServiceQueue;
    v6->_idsServiceQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_serviceName, a3);
  }

  return v6;
}

- (id)idsService
{
  return self->_idsService;
}

- (void)registerIDSService
{
  NSObject *v3;
  IDSService *v4;
  IDSService *idsService;
  IDSService *v6;
  NSObject *v7;
  NSObject *v8;
  NSString *serviceName;
  NSMutableDictionary *v10;
  NSMutableDictionary *endpointsRegistry;
  NSMutableSet *v12;
  NSMutableSet *delegateRegistry;
  int v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (+[IDSCrossDeviceTransport isIDSEndpointEnabled](IDSCrossDeviceTransport, "isIDSEndpointEnabled")
    && !self->_idsService)
  {
    v4 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", self->_serviceName);
    idsService = self->_idsService;
    self->_idsService = v4;

    v6 = self->_idsService;
    crossdeviceLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        serviceName = self->_serviceName;
        v14 = 138412290;
        v15 = serviceName;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_INFO, "Registering for IDSService %@", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      endpointsRegistry = self->_endpointsRegistry;
      self->_endpointsRegistry = v10;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      delegateRegistry = self->_delegateRegistry;
      self->_delegateRegistry = v12;

      -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_idsServiceQueue);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1DBAE1000, v8, OS_LOG_TYPE_ERROR, "Failed to allocate IDSService object", (uint8_t *)&v14, 2u);
      }

    }
  }
  else
  {
    crossdeviceLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1DBAE1000, v3, OS_LOG_TYPE_DEBUG, "IDSService is already registered.", (uint8_t *)&v14, 2u);
    }

  }
}

- (void)unregisterIDSService
{
  IDSService *idsService;
  NSObject *v4;
  NSObject *v5;
  NSString *serviceName;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  idsService = self->_idsService;
  crossdeviceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (idsService)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      serviceName = self->_serviceName;
      v7 = 138412290;
      v8 = serviceName;
      _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_INFO, "Unregistering from IDSService %@", (uint8_t *)&v7, 0xCu);
    }

    -[IDSService removeDelegate:](self->_idsService, "removeDelegate:", self);
    v5 = self->_idsService;
    self->_idsService = 0;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1DBAE1000, v5, OS_LOG_TYPE_DEBUG, "IDSService is not registered.", (uint8_t *)&v7, 2u);
  }

}

- (void)sendMessage:(id)a3 toIDSDevicesMatching:(id)a4 toEndpoint:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void **v31;
  const __CFString **v32;
  NSObject *v33;
  uint64_t v34;
  IDSCrossDeviceTransport *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  const __CFString *v48;
  void *v49;
  _BYTE v50[128];
  const __CFString *v51;
  void *v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService devices](self->_idsService, "devices");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11)
  {
    objc_msgSend(v15, "filteredArrayUsingPredicate:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    crossdeviceLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v54 = objc_msgSend(v17, "count");
      v55 = 2112;
      v56 = v11;
      v57 = 2112;
      v58 = v17;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_INFO, "%ld IDSDevices matched with %@: %@", buf, 0x20u);
    }
  }
  else
  {
    crossdeviceLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v16;
      _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_INFO, "No predicate given, sending to all IDSDevices: %@", buf, 0xCu);
    }
    v17 = v16;
  }

  if (objc_msgSend(v17, "count"))
  {
    v35 = self;
    v36 = v17;
    v37 = v13;
    v38 = v12;
    v39 = v11;
    v40 = v10;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v45 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v25 = (void *)IDSCopyIDForDevice();
          if (objc_msgSend(v25, "length"))
          {
            objc_msgSend(v14, "addObject:", v25);
          }
          else
          {
            crossdeviceLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v24;
              _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_ERROR, "Failed to copy ID for IDS device %@", buf, 0xCu);
            }

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v14, "count"))
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __77__IDSCrossDeviceTransport_sendMessage_toIDSDevicesMatching_toEndpoint_reply___block_invoke;
      v41[3] = &unk_1EA3B6D70;
      v42 = v14;
      v13 = v37;
      v43 = v37;
      v10 = v40;
      v12 = v38;
      -[IDSCrossDeviceTransport sendMessage:toIDSDevices:toEndpoint:reply:](self, "sendMessage:toIDSDevices:toEndpoint:reply:", v40, v42, v38, v41);

      v27 = v42;
      v11 = v39;
      v17 = v36;
LABEL_31:

      goto LABEL_32;
    }
    crossdeviceLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    v11 = v39;
    v10 = v40;
    v13 = v37;
    v12 = v38;
    v17 = v36;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 134217984;
      v54 = v34;
      _os_log_impl(&dword_1DBAE1000, v33, OS_LOG_TYPE_DEFAULT, "No IDS destinations identifiers copied from %lu devices", buf, 0xCu);
    }

    if (v37)
    {
      v48 = CFSTR("count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v29;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v49;
      v32 = &v48;
      goto LABEL_30;
    }
  }
  else
  {
    crossdeviceLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = (uint64_t)v11;
      _os_log_impl(&dword_1DBAE1000, v28, OS_LOG_TYPE_DEFAULT, "Did not find IDS devices that match %@", buf, 0xCu);
    }

    if (v13)
    {
      v51 = CFSTR("count");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v29;
      v30 = (void *)MEMORY[0x1E0C99D80];
      v31 = &v52;
      v32 = &v51;
LABEL_30:
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1, v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *, _QWORD))v13 + 2))(v13, 0, v27, 0);
      goto LABEL_31;
    }
  }
LABEL_32:

}

void __77__IDSCrossDeviceTransport_sendMessage_toIDSDevicesMatching_toEndpoint_reply___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  crossdeviceLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("failed");
    v11 = *(_QWORD *)(a1 + 32);
    if (a2)
      v10 = CFSTR("successful");
    v15 = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_DEFAULT, "IDS message sending %@, destinations: %@", (uint8_t *)&v15, 0x16u);
  }

  if (v8)
  {
    crossdeviceLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "   Error: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("count"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)sendMessage:(id)a3 toIDSDevices:(id)a4 toEndpoint:(id)a5 reply:(id)a6
{
  -[IDSCrossDeviceTransport sendMessage:toIDSDevices:toEndpoint:validFor:reply:](self, "sendMessage:toIDSDevices:toEndpoint:validFor:reply:", a3, a4, a5, a6, 0.0);
}

- (void)sendMessage:(id)a3 toIDSDevices:(id)a4 toEndpoint:(id)a5 validFor:(double)a6 reply:(id)a7
{
  id v12;
  double v13;
  id v14;
  void (**v15)(id, uint64_t, void *, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  _BOOL4 v27;
  double v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  double v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint8_t buf[4];
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = COERCE_DOUBLE(a4);
  v14 = a5;
  v15 = (void (**)(id, uint64_t, void *, _QWORD))a7;
  if (objc_msgSend(*(id *)&v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v14, CFSTR("endpoint"), v12, CFSTR("message"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (a6 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSince1970");
      v20 = v19 + a6;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("ttl"));

      crossdeviceLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v37 = a6;
        v38 = 2048;
        v39 = (uint64_t)v20;
        _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEBUG, "IDS message will expire in %.0lf seconds at %{time_t}ld", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6 + 30.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D341C8]);

      objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D341E8]);
    }
    crossdeviceLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v13;
      _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_DEBUG, "Ready to send to IDS destinations with identifiers: %@", buf, 0xCu);
    }

    v34 = 0.0;
    v35 = 0;
    v25 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](self->_idsService, "sendMessage:toDestinations:priority:options:identifier:error:", v16, *(_QWORD *)&v13, 300, v17, &v34, &v35);
    crossdeviceLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        v28 = v34;
        v29 = objc_msgSend(*(id *)&v13, "count");
        *(_DWORD *)buf = 138412546;
        v37 = v28;
        v38 = 2048;
        v39 = v29;
        _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEFAULT, "Request to send IDS message %@ to %ld destinations was successful.", buf, 0x16u);
      }

      if (v15)
      {
        v42 = CFSTR("IDSMessageIdentifier");
        *(double *)v43 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v15[2](v15, 1, v30, 0);

      }
    }
    else
    {
      if (v27)
      {
        v32 = v34;
        v33 = objc_msgSend(*(id *)&v13, "count");
        *(_DWORD *)buf = 138412802;
        v37 = v32;
        v38 = 2048;
        v39 = v33;
        v40 = 2112;
        v41 = v35;
        _os_log_impl(&dword_1DBAE1000, v26, OS_LOG_TYPE_DEFAULT, "Request to send IDS message %@ to %ld destinations failed. %@", buf, 0x20u);
      }

      if (v15)
        v15[2](v15, 0, 0, v35);
    }

  }
  else
  {
    crossdeviceLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v13;
      _os_log_impl(&dword_1DBAE1000, v31, OS_LOG_TYPE_DEFAULT, "Invalid IDS destinations: %@", buf, 0xCu);
    }

    if (v15)
      v15[2](v15, 0, 0, 0);
  }

}

- (void)addDelegate:(id)a3 endpoint:(id)a4
{
  NSMutableDictionary *endpointsRegistry;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  endpointsRegistry = self->_endpointsRegistry;
  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](endpointsRegistry, "objectForKeyedSubscript:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "addObject:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_endpointsRegistry, "setObject:forKeyedSubscript:", v9, v10);
  }
  -[NSMutableSet addObject:](self->_delegateRegistry, "addObject:", v7);

}

- (void)removeDelegate:(id)a3 endpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsRegistry, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "removeObject:", v8);
  -[NSMutableSet removeObject:](self->_delegateRegistry, "removeObject:", v8);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v10;
  __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v8 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (__CFString *)a7;
  crossdeviceLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("failed");
    if (v8)
      v13 = CFSTR("succeeded");
    *(_DWORD *)buf = 138412802;
    v27 = v13;
    v28 = 2112;
    v29 = v10;
    if (v11)
      v14 = v11;
    else
      v14 = &stru_1EA3B8F58;
    v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_1DBAE1000, v12, OS_LOG_TYPE_DEFAULT, "Send message via IDS %@. (%@) %@", buf, 0x20u);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableSet allObjects](self->_delegateRegistry, "allObjects", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v19);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "messageWithIdentifier:didSendWithSuccess:error:", v10, v8, v11);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v20 = a4;
  v10 = a5;
  v11 = a6;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (context: %@)"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1EA3B8F58;
  }
  crossdeviceLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v10;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_1DBAE1000, v13, OS_LOG_TYPE_INFO, "Delivered message via IDS with identifier: %@%@", buf, 0x16u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableSet allObjects](self->_delegateRegistry, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "messageWithIdentifierHasBeenDelivered:", v10);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  double v26;
  __CFString *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  IDSCrossDeviceTransport *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (context: %@)"), v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = &stru_1EA3B8F58;
  }
  crossdeviceLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v36 = (uint64_t)v15;
    v37 = 2112;
    v38 = v14;
    v39 = 2112;
    v40 = v17;
    _os_log_impl(&dword_1DBAE1000, v18, OS_LOG_TYPE_DEFAULT, "Received incoming message via IDS from %@, message %@%@", buf, 0x20u);
  }

  objc_msgSend(v12, "deviceForFromID:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v34 = self;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("endpoint"));
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ttl"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("message"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v13;
        v23 = objc_msgSend(v21, "longValue");
        crossdeviceLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v36 = v23;
          _os_log_impl(&dword_1DBAE1000, v24, OS_LOG_TYPE_INFO, "Message is valid until %{time_t}ld", buf, 0xCu);
        }

        v31 = v23;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v23);
        v25 = objc_claimAutoreleasedReturnValue();
        -[NSObject timeIntervalSinceNow](v25, "timeIntervalSinceNow");
        if (v26 < 0.0)
        {
          crossdeviceLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v36 = v31;
            _os_log_impl(&dword_1DBAE1000, v30, OS_LOG_TYPE_DEFAULT, "Received message expired at %{time_t}ld. Will NOT deliver to endpoint.", buf, 0xCu);
          }

          v13 = v32;
          goto LABEL_25;
        }

        v13 = v32;
      }
    }
    if (v20 && v22)
    {
      v33 = v12;
      v27 = v17;
      v28 = v13;
      v29 = -[IDSCrossDeviceTransport deliverMessage:toEndpoint:](v34, "deliverMessage:toEndpoint:", v22, v20);
      crossdeviceLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v36 = v29;
        _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_INFO, "Delivered message to %ld receivers", buf, 0xCu);
      }
      v13 = v28;
      v17 = v27;
      v12 = v33;
    }
    else
    {
      crossdeviceLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v36 = (uint64_t)v20;
        v37 = 2112;
        v38 = v14;
        _os_log_impl(&dword_1DBAE1000, v25, OS_LOG_TYPE_ERROR, "Invalid endpoint (%@) or failed to unwrap correctly. Dropping message %@", buf, 0x16u);
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  crossdeviceLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_ERROR, "Incoming message is not from a local account - dropping", buf, 2u);
  }
LABEL_26:

}

- (unint64_t)deliverMessage:(id)a3 toEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointsRegistry, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__IDSCrossDeviceTransport_deliverMessage_toEndpoint___block_invoke;
    v12[3] = &unk_1EA3B6D98;
    v13 = v6;
    v14 = &v15;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
    v9 = v13;
  }
  else
  {
    crossdeviceLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_ERROR, "Unknown endpoint received: %@", buf, 0xCu);
    }
  }

  v10 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __53__IDSCrossDeviceTransport_deliverMessage_toEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  crossdeviceLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1DBAE1000, v4, OS_LOG_TYPE_DEBUG, "Delivery to %@ with message %@", (uint8_t *)&v7, 0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "messageReceivedFromIDS:", *(_QWORD *)(a1 + 32));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    crossdeviceLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_DEFAULT, "Delegatee does not respond to messageReceived:, skipping.", (uint8_t *)&v7, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_delegateRegistry, 0);
  objc_storeStrong((id *)&self->_endpointsRegistry, 0);
  objc_storeStrong((id *)&self->_idsServiceQueue, 0);
}

@end
