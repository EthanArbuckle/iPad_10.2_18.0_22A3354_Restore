@implementation HAP2AccessoryServerTransportCoAP

- (HAP2AccessoryServerTransportCoAP)initWithOperationQueue:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (HAP2AccessoryServerTransportCoAP)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 serviceName:(id)a5 serviceType:(id)a6 serviceDomain:(id)a7 addressResolutionTimeout:(double)a8 discovery:(id)a9 accessoryInfo:(id)a10 coapClient:(id)a11 coapClientFactory:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  HAP2AccessoryServerTransportCoAP *v26;
  HAP2AccessoryServerTransportCoAP *v27;
  id v28;
  uint64_t v29;
  NSMutableArray *addressList;
  uint64_t v31;
  NSMutableArray *bonjourNames;
  NSMutableArray *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  int *v45;
  void *v46;
  uint64_t v47;
  objc_class *v48;
  void *v49;
  id obj;
  id v52;
  id v54;
  id v56;
  id v57;
  objc_super v58;
  uint8_t buf[4];
  HAP2AccessoryServerTransportCoAP *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v18 = a5;
  v19 = a6;
  obj = a7;
  v20 = a7;
  v21 = a9;
  v57 = a10;
  v22 = a11;
  v23 = v18;
  v24 = a12;
  v58.receiver = self;
  v58.super_class = (Class)HAP2AccessoryServerTransportCoAP;
  v25 = v20;
  v26 = -[HAP2AccessoryServerTransportBase initWithOperationQueue:delegateQueue:](&v58, sel_initWithOperationQueue_delegateQueue_, a3, a4);
  v27 = v26;
  if (v26)
  {
    v56 = v24;
    objc_storeStrong((id *)&v26->_serviceName, a5);
    objc_storeStrong((id *)&v27->_serviceType, a6);
    objc_storeStrong((id *)&v27->_serviceDomain, obj);
    v27->_addressResolutionTimeout = a8;
    v28 = v21;
    objc_storeWeak((id *)&v27->_discovery, v21);
    objc_storeStrong((id *)&v27->_accessoryInfo, a10);
    v27->_maxTransmitAttempts = 0;
    v27->_initialACKTimeout = 0.0;
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    addressList = v27->_addressList;
    v27->_addressList = (NSMutableArray *)v29;

    v27->_numOfAddresses = 0;
    v27->_numOfAddressesTried = 0;
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    bonjourNames = v27->_bonjourNames;
    v27->_bonjourNames = (NSMutableArray *)v31;

    v33 = v27->_bonjourNames;
    v52 = v25;
    v54 = v19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v23, v19, v25);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](v33, "insertObject:atIndex:", v34, 0);

    *(_QWORD *)&v27->_ipAddress.addr.sa.sa_len = 0;
    *(_QWORD *)&v27->_ipAddress.addr.sin6.sin6_addr.__u6_addr32[2] = 0;
    *(_QWORD *)v27->_ipAddress.addr.sin6.sin6_addr.__u6_addr8 = 0;
    v27->_ipAddress.addr.sin6.sin6_scope_id = 0;
    v27->_ipAddress.size = 28;
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "preferenceForKey:", CFSTR("AccessoryMaximumIPAddressesTracked"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "numberValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)objc_msgSend(v37, "intValue") >= 1 && objc_msgSend(v37, "intValue") < 0x15)
    {
      v39 = objc_msgSend(v37, "unsignedIntValue");
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v38 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v60 = v27;
        v61 = 2048;
        v39 = 10;
        v62 = 10;
        _os_log_error_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_ERROR, "%@ Preference 'AccessoryMaximumIPAddressesTracked' setting beyond bounds - using default %lu", buf, 0x16u);
      }
      else
      {
        v39 = 10;
      }
    }
    v27->_maxAddressesAllowed = v39;
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "preferenceForKey:", CFSTR("AccessoryMaximumBonjourNamesTracked"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "numberValue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)objc_msgSend(v42, "intValue") >= 1 && objc_msgSend(v42, "intValue") < 0xB)
    {
      v44 = objc_msgSend(v42, "unsignedIntValue");
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v43 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v60 = v27;
        v61 = 2048;
        v44 = 5;
        v62 = 5;
        _os_log_error_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_ERROR, "%@ Preference 'AccessoryMaximumBonjourNamesTracked' setting beyond bounds - using default %lu", buf, 0x16u);
      }
      else
      {
        v44 = 5;
      }
    }
    v27->_maxBonjourNamesAllowed = v44;
    if (v22)
    {
      objc_msgSend(v22, "setDelegate:", v27);
      v45 = &OBJC_IVAR___HAP2AccessoryServerTransportCoAP__coapClient;
      v46 = v22;
    }
    else
    {
      v45 = &OBJC_IVAR___HAP2AccessoryServerTransportCoAP__coapClientFactory;
      v46 = v56;
    }
    v25 = v52;
    v19 = v54;
    v47 = *v45;
    v48 = v46;
    v49 = *(Class *)((char *)&v27->super.super.super.super.isa + v47);
    *(Class *)((char *)&v27->super.super.super.super.isa + v47) = v48;

    v24 = v56;
    v21 = v28;
  }

  return v27;
}

- (HAP2AccessoryServerTransportCoAP)initWithAccessoryInfo:(id)a3 discovery:(id)a4 operationQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HAP2AccessoryServerTransportCoAP *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "rawDiscoveryInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bonjourServiceName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bonjourServiceType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bonjourServiceDomain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (HAP2AccessoryServerTransportCoAP *)-[HAP2AccessoryServerTransportCoAP initWithServiceName:type:domain:operationQueue:discovery:accessoryInfo:](self, v12, v13, v14, v8, v9, v10);

  return v15;
}

- (HAP2AccessoryServerTransportCoAP)initWithServiceName:(id)a3 type:(id)a4 domain:(id)a5 operationQueue:(id)a6
{
  return (HAP2AccessoryServerTransportCoAP *)-[HAP2AccessoryServerTransportCoAP initWithServiceName:type:domain:operationQueue:discovery:accessoryInfo:](self, a3, a4, a5, a6, 0, 0);
}

- (id)underlyingTransport
{
  return 0;
}

- (unint64_t)protocolFeaturesForVersion:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "majorVersion") == 1)
  {
    v4 = objc_msgSend(v3, "minorVersion");
    v5 = 47;
    if (!v4)
      v5 = 15;
    if (v4 == 1)
      v6 = 25;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)wellKnownEndpoint:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return &stru_1E894EFE8;
  else
    return off_1E894DB50[a3 - 1];
}

- (id)endpointForCharacteristic:(id)a3
{
  return &stru_1E894EFE8;
}

- (id)endpointForCharacteristics:(id)a3
{
  return &stru_1E894EFE8;
}

- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("application/octet-stream");
  else
    return off_1E894DB80[a3 - 1];
}

- (id)mimeTypeForCharacteristicRequests
{
  return CFSTR("application/octet-stream");
}

- (BOOL)mergeWithNewTransport:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  int v7;
  id *v8;
  id *v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  HAP2AccessoryServerTransportCoAP *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  HAP2AccessoryServerTransportCoAP *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (id *)v4;
    while (1)
    {
      objc_opt_class();
      v7 = objc_opt_isKindOfClass() & 1;
      v8 = v7 ? v6 : 0;
      v9 = v8;
      if (v7)
        break;
      objc_msgSend(v6, "underlyingTransport");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id *)v10;
      if (!v10)
        goto LABEL_8;
    }

    v13 = v6[17];
    v14 = v6[18];
    v15 = v6[19];
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __58__HAP2AccessoryServerTransportCoAP_mergeWithNewTransport___block_invoke;
    v25 = &unk_1E894DA30;
    v26 = self;
    v27 = v13;
    v28 = v14;
    v29 = v15;
    v16 = v15;
    v17 = v14;
    v18 = v13;
    v19 = (void *)MEMORY[0x1D17B7400](&v22);
    -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue", v22, v23, v24, v25, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addBlock:", v19);

    v12 = 1;
  }
  else
  {
LABEL_8:
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v31 = self;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%@ Cannot merge with non-CoAP transport, replacing with %@", buf, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (void)doOpenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *secure_udp;
  NSObject *v21;
  NSString *v22;
  const char *v23;
  NSString *v24;
  const char *v25;
  NSString *v26;
  NSObject *bonjour_service;
  OS_nw_connection *v28;
  OS_nw_connection *nwConnection;
  OS_nw_connection *v30;
  NSObject *v31;
  dispatch_time_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  NSString *serviceName;
  NSString *serviceType;
  NSString *serviceDomain;
  NSString *v39;
  NSString *v40;
  NSObject *v41;
  void *v42;
  _QWORD handler[5];
  _BYTE block[24];
  NSString *v45;
  _BYTE v46[10];
  __int16 v47;
  NSString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](self, v4);
  -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (self)
    {
      -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assertCurrentQueue");

      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ Open Client"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      *(_QWORD *)block = objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v11);
      -[HAP2AccessoryServerTransportCoAP _openClientWithActivity:](self, *(void **)block);
      __HMFActivityScopeLeave();

    }
  }
  else if (self)
  {
    -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assertCurrentQueue");

    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ Resolve"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v16);
    if (-[NSMutableArray count](self->_addressList, "count"))
    {
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __58__HAP2AccessoryServerTransportCoAP__initiateNewConnection__block_invoke;
      v45 = (NSString *)&unk_1E894DD08;
      *(_QWORD *)v46 = self;
      v17 = (void *)MEMORY[0x1D17B7400](block);
      -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addConcurrentBlock:", v17);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v19 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        serviceName = self->_serviceName;
        serviceType = self->_serviceType;
        serviceDomain = self->_serviceDomain;
        *(_DWORD *)block = 138413315;
        *(_QWORD *)&block[4] = self;
        *(_WORD *)&block[12] = 2113;
        *(_QWORD *)&block[14] = serviceName;
        *(_WORD *)&block[22] = 2113;
        v45 = serviceName;
        *(_WORD *)v46 = 2112;
        *(_QWORD *)&v46[2] = serviceType;
        v47 = 2112;
        v48 = serviceDomain;
        v39 = serviceType;
        v40 = serviceName;
        v41 = v19;
        _os_log_error_impl(&dword_1CCE01000, v41, OS_LOG_TYPE_ERROR, "%@ Attempting to resolve '%{private}@' '%{private}@.%@.%@'", block, 0x34u);

      }
      self->_numOfAddresses = 0;
      self->_numOfAddressesTried = 0;
      secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E0CCED20], &__block_literal_global_21646);
      v21 = nw_interface_create_with_name();
      nw_parameters_prohibit_interface(secure_udp, v21);

      v22 = objc_retainAutorelease(self->_serviceName);
      v23 = -[NSString UTF8String](v22, "UTF8String");
      v24 = objc_retainAutorelease(self->_serviceType);
      v25 = -[NSString UTF8String](v24, "UTF8String");
      v26 = objc_retainAutorelease(self->_serviceDomain);
      bonjour_service = nw_endpoint_create_bonjour_service(v23, v25, -[NSString UTF8String](v26, "UTF8String"));
      v28 = (OS_nw_connection *)nw_connection_create(bonjour_service, secure_udp);
      nwConnection = self->_nwConnection;
      self->_nwConnection = v28;

      v30 = self->_nwConnection;
      -[HAP2AccessoryServerTransportBase delegateQueue](self, "delegateQueue");
      v31 = objc_claimAutoreleasedReturnValue();
      nw_connection_set_queue((nw_connection_t)v30, v31);

      v32 = dispatch_time(0, (uint64_t)(self->_addressResolutionTimeout * 1000000000.0));
      -[HAP2AccessoryServerTransportBase delegateQueue](self, "delegateQueue");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = MEMORY[0x1E0C809B0];
      *(_QWORD *)block = MEMORY[0x1E0C809B0];
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2;
      v45 = (NSString *)&unk_1E894DD08;
      *(_QWORD *)v46 = self;
      dispatch_after(v32, v33, block);

      v35 = self->_nwConnection;
      handler[0] = v34;
      handler[1] = 3221225472;
      handler[2] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_33;
      handler[3] = &unk_1E894DAD8;
      handler[4] = self;
      nw_connection_set_state_changed_handler(v35, handler);
      nw_connection_start((nw_connection_t)self->_nwConnection);

    }
    __HMFActivityScopeLeave();

  }
}

- (void)doSendRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _BYTE v28[24];
  void *v29;
  __int128 v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[6];

  v33[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  objc_msgSend(v6, "endpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "endpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HAP2AccessoryServerTransportCoAP setSendRequestCompletion:](self, v7);
      v11 = v6;
      v12 = v10;
      if (self)
      {
        -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assertCurrentQueue");

        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v14 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          v15 = v14;
          objc_msgSend(v11, "data");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v28 = 138413058;
          *(_QWORD *)&v28[4] = self;
          *(_WORD *)&v28[12] = 2112;
          *(_QWORD *)&v28[14] = v11;
          *(_WORD *)&v28[22] = 2112;
          v29 = v12;
          LOWORD(v30) = 2112;
          *(_QWORD *)((char *)&v30 + 2) = v16;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%@ Sending %@ to '%@': %@", v28, 0x2Au);

        }
        objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v33[0] = v12;
          v32[0] = CFSTR("path");
          v32[1] = CFSTR("method");
          v18 = CFSTR("POST");
          v33[1] = CFSTR("POST");
          v32[2] = CFSTR("serializationType");
          objc_msgSend(v11, "mimeType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v33[2] = v19;
          v32[3] = CFSTR("reading");
          objc_msgSend(v11, "isForReading");
          HMFBooleanToString();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33[3] = v20;
          v32[4] = CFSTR("writing");
          objc_msgSend(v11, "isForWriting");
          HMFBooleanToString();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v33[4] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "data");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v28 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v28[8] = 3221225472;
        *(_QWORD *)&v28[16] = __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke;
        v29 = &unk_1E894DB30;
        *(_QWORD *)&v30 = self;
        *((_QWORD *)&v30 + 1) = v11;
        v31 = v12;
        objc_msgSend(v23, "sendRequestWithMethod:path:payload:completion:", 2, v31, v24, v28);

      }
      goto LABEL_18;
    }
  }
  else
  {

  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v25 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v26 = v25;
    objc_msgSend(v6, "endpoint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 138412546;
    *(_QWORD *)&v28[4] = self;
    *(_WORD *)&v28[12] = 2112;
    *(_QWORD *)&v28[14] = v27;
    _os_log_error_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%@ Invalid endpoint: %@", v28, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v12);
LABEL_18:

}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v6 = a4;
  v11 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertCurrentQueue");

  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](self, v6);
  if (self)
  {
    v8 = v11;
    -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertCurrentQueue");

    -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerTransportCoAP setCoapClient:]((id *)&self->super.super.super.super.isa, 0);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke;
    v12[3] = &unk_1E894DD58;
    v12[4] = self;
    objc_msgSend(v10, "closeWithError:completion:", v8, v12);

  }
}

- (void)doUpdateMaxRequestTimeout:(double)a3
{
  void *v5;
  double v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  v6 = 5.0;
  if (a3 >= 5.0)
    v6 = a3;
  v7 = 4;
  if (v6 < 15.0)
    v7 = 3;
  if (v6 >= 30.0)
    v8 = 5;
  else
    v8 = v7;
  v9 = v6 / (double)~(-1 << v8);
  if (self)
  {
    -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assertCurrentQueue");

    self->_maxTransmitAttempts = v8;
    -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertCurrentQueue");

    self->_initialACKTimeout = v9;
  }
  -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HAP2AccessoryServerTransportCoAP coapClient]((id *)&self->super.super.super.super.isa);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alterMaxTransmitAttempts:initialACKTimeout:", v8, v9);

  }
}

- (void)clientDidDisconnect:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  HAP2AccessoryServerDiscoveryAccessoryInfo *accessoryInfo;
  int v10;
  HAP2AccessoryServerTransportCoAP *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%@ Disconnected with error: %@", (uint8_t *)&v10, 0x16u);
    }
    -[HAP2AccessoryServerTransportCoAP discovery]((id *)&self->super.super.super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = self;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ Requesting discovery reconfirm after disconnect", (uint8_t *)&v10, 0xCu);
      }
      if (self)
        accessoryInfo = self->_accessoryInfo;
      else
        accessoryInfo = 0;
      objc_msgSend(v7, "reconfirmAccessory:", accessoryInfo);
    }
    -[HAP2AccessoryServerTransportBase didDisconnectWithError:](self, "didDisconnectWithError:", v5);

  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%@ Disconnected", (uint8_t *)&v10, 0xCu);
  }

}

- (void)client:(id)a3 didReceiveEvent:(id)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  HAP2AccessoryServerTransportCoAP *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[HAP2AccessoryServerTransportBase state](self, "state");
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v7 = hap2Log_accessory;
  if (v6 == 2)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = (unint64_t)v5;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%@ Received event: %@", (uint8_t *)&v10, 0x16u);
    }
    -[HAP2AccessoryServerTransportBaseWithDelegate delegate](self, "delegate");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      -[NSObject transport:didReceiveEvent:](v8, "transport:didReceiveEvent:", self, v5);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v9 = v7;
    v10 = 138412802;
    v11 = self;
    v12 = 2048;
    v13 = -[HAP2AccessoryServerTransportBase state](self, "state");
    v14 = 2112;
    v15 = v5;
    _os_log_error_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%@ Received event in bad state %lu: %@", (uint8_t *)&v10, 0x20u);
  }

LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourNames, 0);
  objc_storeStrong((id *)&self->_addressList, 0);
  objc_storeStrong((id *)&self->_coapClientFactory, 0);
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_destroyWeak((id *)&self->_discovery);
  objc_storeStrong((id *)&self->_serviceDomain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_nwConnection, 0);
  objc_storeStrong((id *)&self->_coapClient, 0);
  objc_storeStrong((id *)&self->_resolveActivity, 0);
  objc_storeStrong(&self->_sendRequestCompletion, 0);
  objc_storeStrong(&self->_stateChangeCompletion, 0);
}

- (id)discovery
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 20);
  return WeakRetained;
}

- (id)coapClient
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    a1 = (id *)v1[11];
  }
  return a1;
}

- (void)setStateChangeCompletion:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertCurrentQueue");

    v5 = MEMORY[0x1D17B7400](v3);
    v6 = (void *)a1[8];
    a1[8] = v5;

  }
}

- (void)setCoapClient:(id *)a1
{
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(a1, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertCurrentQueue");

  objc_storeStrong(a1 + 11, a2);
}

void __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke_2;
  v11 = &unk_1E894E0F8;
  v4 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v4;
  v5 = v3;
  v6 = (void *)MEMORY[0x1D17B7400](&v8);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addConcurrentBlock:", v6);

}

void __52__HAP2AccessoryServerTransportCoAP__closeWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  HAP2AccessorySessionInfo *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  HAP2AccessorySessionInfo *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v3 = hap2Log_accessory;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v17 = 138412546;
      v18 = v4;
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_ERROR, "%@ Failed to close: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%@ Closed", (uint8_t *)&v17, 0xCu);
  }
  -[HAP2AccessoryServerTransportCoAP stateChangeCompletion](*(_QWORD **)(a1 + 40));
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](*(_QWORD **)(a1 + 40), 0);
  v8 = *(_QWORD **)(a1 + 40);
  if (v8)
    v8 = (_QWORD *)v8[24];
  v9 = v8;
  v10 = objc_msgSend(v9, "count");
  v11 = [HAP2AccessorySessionInfo alloc];
  v12 = -[HAP2AccessoryServerTransportCoAP numOfAddresses](*(_QWORD **)(a1 + 40));
  v13 = -[HAP2AccessoryServerTransportCoAP numOfAddressesTried](*(_QWORD **)(a1 + 40));
  v14 = *(_QWORD **)(a1 + 40);
  if (v14)
    v14 = (_QWORD *)v14[26];
  v15 = v14;
  v16 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:](v11, "initWithNumIPs:numIPsTried:numBonjourNames:", v12, v13, objc_msgSend(v15, "count"));
  ((void (**)(_QWORD, BOOL, HAP2AccessorySessionInfo *, _QWORD))v7)[2](v7, v10 != 0, v16, *(_QWORD *)(a1 + 32));

}

- (_QWORD)stateChangeCompletion
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    a1 = (_QWORD *)MEMORY[0x1D17B7400](v1[8]);
  }
  return a1;
}

- (_QWORD)numOfAddresses
{
  _QWORD *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    return (_QWORD *)v1[15];
  }
  return result;
}

- (_QWORD)numOfAddressesTried
{
  _QWORD *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    return (_QWORD *)v1[16];
  }
  return result;
}

- (void)setSendRequestCompletion:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertCurrentQueue");

    v5 = MEMORY[0x1D17B7400](v3);
    v6 = (void *)a1[9];
    a1[9] = v5;

  }
}

void __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v7 = hap2Log_accessory;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v6;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Failed to send %@ to '%@': %@", buf, 0x2Au);
    }
    objc_msgSend(v6, "domain");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8 == CFSTR("HAPErrorDomain"))
    {
      v12 = objc_msgSend(v6, "code");

      if (v12 == 8)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v14 = CFSTR("CoAP authentication failure");
        v15 = 17;
LABEL_14:
        objc_msgSend(v13, "hapErrorWithCode:description:reason:suggestion:underlyingError:", v15, v14, 0, 0, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = CFSTR("CoAP communication failure");
    v15 = 8;
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v5;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%@ Received response to %@: %@", buf, 0x20u);
  }
  v11 = 0;
LABEL_15:
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke_67;
  v23[3] = &unk_1E894E120;
  v23[4] = *(_QWORD *)(a1 + 32);
  v24 = v11;
  v25 = v5;
  v16 = v5;
  v17 = v11;
  v18 = (void *)MEMORY[0x1D17B7400](v23);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConcurrentBlock:", v18);

}

void __54__HAP2AccessoryServerTransportCoAP__sendRequest_path___block_invoke_67(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(id, _QWORD, uint64_t);

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertCurrentQueue");

    v12 = (void (**)(id, _QWORD, uint64_t))MEMORY[0x1D17B7400](*(_QWORD *)(v2 + 72));
    v4 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    v4 = 0;
    v12 = 0;
  }
  -[HAP2AccessoryServerTransportCoAP setSendRequestCompletion:](v4, 0);
  v5 = *(_QWORD *)(a1 + 40);
  if (!v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertCurrentQueue");

    *(_QWORD *)(v6 + 120) = 0;
    v8 = *(_QWORD *)(a1 + 32);
    if (!v8)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assertCurrentQueue");

    *(_QWORD *)(v8 + 128) = 0;
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 192);
    else
LABEL_11:
      v11 = 0;
    objc_msgSend(v11, "removeAllObjects");
    v5 = *(_QWORD *)(a1 + 40);
  }
  v12[2](v12, *(_QWORD *)(a1 + 48), v5);

}

uint64_t __58__HAP2AccessoryServerTransportCoAP__initiateNewConnection__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[24];
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (v3)
      v4 = v3[17];
    else
      v4 = 0;
    v5 = v3[16];
    v6 = v3[15];
    *(_DWORD *)v11 = 138413059;
    *(_QWORD *)&v11[4] = v3;
    *(_WORD *)&v11[12] = 2113;
    *(_QWORD *)&v11[14] = v4;
    *(_WORD *)&v11[22] = 2048;
    v12 = v5;
    LOWORD(v13) = 2048;
    *(_QWORD *)((char *)&v13 + 2) = v6;
    v7 = v2;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%@ '%{private}@' trying address %lu of %lu", v11, 0x2Au);

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v8 + 192), "objectAtIndexedSubscript:", 0, *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerTransportCoAP _handleResolve:](v8, (unsigned int *)objc_msgSend(v9, "getAddressPtr"));

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeObjectAtIndex:", 0);
}

void __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(_QWORD *)(v3 + 136);
    else
      v4 = 0;
    v8 = 138412547;
    v9 = v3;
    v10 = 2113;
    v11 = v4;
    v5 = v2;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ '%{private}@' Cancelling address resolver", (uint8_t *)&v8, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(NSObject **)(v6 + 112);
  else
    v7 = 0;
  nw_connection_cancel(v7);
}

void __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  nw_path_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const sockaddr *address;
  HAP2AccessoryDeviceIPAddress *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  uint64_t v78;
  _BYTE v79[20];
  __int16 v80;
  const __CFString *v81;
  uint8_t v82[4];
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
  {
    v43 = *(_QWORD *)(a1 + 32);
    if (v43)
      v44 = *(_QWORD *)(v43 + 136);
    else
      v44 = 0;
    *(_DWORD *)buf = 138412803;
    v78 = v43;
    *(_WORD *)v79 = 2113;
    *(_QWORD *)&v79[2] = v44;
    *(_WORD *)&v79[10] = 1024;
    *(_DWORD *)&v79[12] = a2;
    v45 = v6;
    _os_log_debug_impl(&dword_1CCE01000, v45, OS_LOG_TYPE_DEBUG, "%@ NWConnection '%{private}@' resolve state=%d", buf, 0x1Cu);

  }
  if (a2 == 5)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v49 = *(_QWORD *)(a1 + 32);
      if (v49)
        v50 = *(_QWORD *)(v49 + 136);
      else
        v50 = 0;
      *(_DWORD *)buf = 138412547;
      v78 = v49;
      *(_WORD *)v79 = 2113;
      *(_QWORD *)&v79[2] = v50;
      v51 = v10;
      _os_log_debug_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_DEBUG, "%@ '%{private}@' Stopping address resolver", buf, 0x16u);

    }
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count");
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        v14 = *(_QWORD *)(v13 + 136);
      else
        v14 = 0;
      *(_DWORD *)buf = 138413059;
      v78 = v13;
      *(_WORD *)v79 = 2113;
      if (v11)
        v15 = CFSTR("trying first address");
      else
        v15 = CFSTR("aborting");
      *(_QWORD *)&v79[2] = v14;
      *(_WORD *)&v79[10] = 2048;
      *(_QWORD *)&v79[12] = v11;
      v80 = 2112;
      v81 = v15;
      v16 = v12;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%@ '%{private}@' resolves to %lu address(es), %@", buf, 0x2Au);

    }
    if (v11)
    {
      if (v11 != 1)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "sortUsingComparator:", &__block_literal_global_41);
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2_42;
      v72[3] = &unk_1E894DD08;
      v72[4] = *(_QWORD *)(a1 + 32);
      v17 = (nw_path_t)MEMORY[0x1D17B7400](v72);
      objc_msgSend(*(id *)(a1 + 32), "operationQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addConcurrentBlock:", v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 19);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_3;
      v70[3] = &unk_1E894E0F8;
      v70[4] = *(_QWORD *)(a1 + 32);
      v71 = v40;
      v17 = v40;
      v41 = (void *)MEMORY[0x1D17B7400](v70);
      objc_msgSend(*(id *)(a1 + 32), "operationQueue");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addConcurrentBlock:", v41);

    }
    goto LABEL_94;
  }
  if (a2 == 3)
  {
    if (v5)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v7 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v58 = *(_QWORD *)(a1 + 32);
        if (v58)
          v59 = *(_QWORD *)(v58 + 136);
        else
          v59 = 0;
        *(_DWORD *)buf = 138412803;
        v78 = v58;
        *(_WORD *)v79 = 2113;
        *(_QWORD *)&v79[2] = v59;
        *(_WORD *)&v79[10] = 2112;
        *(_QWORD *)&v79[12] = v5;
        v60 = v7;
        _os_log_error_impl(&dword_1CCE01000, v60, OS_LOG_TYPE_ERROR, "%@ '%{private}@' error in state_ready report (%@) - attempting next IP connection", buf, 0x20u);

      }
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        v9 = *(NSObject **)(v8 + 112);
      else
        v9 = 0;
      nw_connection_cancel_current_endpoint(v9);
      goto LABEL_95;
    }
    v25 = *(_QWORD *)(a1 + 32);
    if (v25)
      v26 = *(NSObject **)(v25 + 112);
    else
      v26 = 0;
    v17 = nw_connection_copy_current_path(v26);
    memset(v79, 0, sizeof(v79));
    v78 = 0;
    if (v17)
    {
      v27 = nw_path_copy_endpoint();
      v28 = v27;
      if (v27)
      {
        address = nw_endpoint_get_address(v27);
        if (address)
        {
          v69 = v28;
          *(_DWORD *)buf = address->sa_len;
          __memcpy_chk();
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v30 = (HAP2AccessoryDeviceIPAddress *)*(id *)(*(_QWORD *)(a1 + 32) + 192);
          v31 = -[HAP2AccessoryDeviceIPAddress countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v74;
            while (2)
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v74 != v33)
                  objc_enumerationMutation(v30);
                v35 = objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "getAddressPtr", v69);
                if (*(_BYTE *)(v35 + 5) == 30
                  && *(_QWORD *)(v35 + 12) == *(_QWORD *)v79
                  && *(_QWORD *)(v35 + 20) == *(_QWORD *)&v79[8])
                {
                  if (hap2LogInitialize_onceToken != -1)
                    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                  v28 = v69;
                  v52 = (void *)hap2Log_accessory;
                  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
                  {
                    v53 = *(_QWORD *)(a1 + 32);
                    if (v53)
                      v54 = *(_QWORD *)(v53 + 136);
                    else
                      v54 = 0;
                    *(_DWORD *)v82 = 138412547;
                    v83 = v53;
                    v84 = 2113;
                    v85 = v54;
                    v55 = v52;
                    _os_log_impl(&dword_1CCE01000, v55, OS_LOG_TYPE_DEFAULT, "%@ '%{private}@' Duplicate IP address - skipping", v82, 0x16u);

                  }
                  v56 = *(_QWORD *)(a1 + 32);
                  if (v56)
                    v57 = *(NSObject **)(v56 + 112);
                  else
                    v57 = 0;
                  goto LABEL_92;
                }
              }
              v32 = -[HAP2AccessoryDeviceIPAddress countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
              if (v32)
                continue;
              break;
            }
          }

          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count") == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200))
          {
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v37 = (void *)hap2Log_accessory;
            v28 = v69;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
            {
              v65 = *(_QWORD *)(a1 + 32);
              if (v65)
                v66 = *(_QWORD *)(v65 + 136);
              else
                v66 = 0;
              v67 = *(_QWORD *)(v65 + 200);
              *(_DWORD *)v82 = 138412803;
              v83 = v65;
              v84 = 2113;
              v85 = v66;
              v86 = 2048;
              v87 = v67;
              v68 = v37;
              _os_log_error_impl(&dword_1CCE01000, v68, OS_LOG_TYPE_ERROR, "%@ '%{private}@' resolves to more than %lu addresses; ignoring rest",
                v82,
                0x20u);

            }
            v38 = *(_QWORD *)(a1 + 32);
            if (v38)
              v39 = *(NSObject **)(v38 + 112);
            else
              v39 = 0;
            nw_connection_cancel(v39);
          }
          else
          {
            v30 = -[HAP2AccessoryDeviceIPAddress initWithAddress:]([HAP2AccessoryDeviceIPAddress alloc], "initWithAddress:", buf);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "addObject:", v30);
            v61 = *(_QWORD *)(a1 + 32);
            if (v61)
              v57 = *(NSObject **)(v61 + 112);
            else
              v57 = 0;
            v28 = v69;
LABEL_92:
            nw_connection_cancel_current_endpoint(v57);

          }
          goto LABEL_93;
        }
      }
    }
    else
    {
      v28 = 0;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v46 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v62 = *(_QWORD *)(a1 + 32);
      if (v62)
        v63 = *(_QWORD *)(v62 + 136);
      else
        v63 = 0;
      *(_DWORD *)v82 = 138412547;
      v83 = v62;
      v84 = 2113;
      v85 = v63;
      v64 = v46;
      _os_log_error_impl(&dword_1CCE01000, v64, OS_LOG_TYPE_ERROR, "%@ '%{private}@' reported a network path that cannot be resolved to an IP address - skipping", v82, 0x16u);

    }
    v47 = *(_QWORD *)(a1 + 32);
    if (v47)
      v48 = *(NSObject **)(v47 + 112);
    else
      v48 = 0;
    nw_connection_cancel_current_endpoint(v48);
LABEL_93:

LABEL_94:
    goto LABEL_95;
  }
  if (a2 == 4 || v5)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v19 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 32);
      if (v20)
        v21 = *(_QWORD *)(v20 + 136);
      else
        v21 = 0;
      *(_DWORD *)buf = 138413059;
      v78 = v20;
      *(_WORD *)v79 = 2113;
      *(_QWORD *)&v79[2] = v21;
      *(_WORD *)&v79[10] = 2112;
      *(_QWORD *)&v79[12] = v5;
      v80 = 1024;
      LODWORD(v81) = a2;
      v22 = v19;
      _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_DEFAULT, "%@ '%{private}@' Address resolution completed - error (%@) in state %d", buf, 0x26u);

    }
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      v24 = *(NSObject **)(v23 + 112);
    else
      v24 = 0;
    nw_connection_cancel(v24);
  }
LABEL_95:

}

uint64_t __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_2_42(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v2 + 192), "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerTransportCoAP _handleResolve:](v2, (unsigned int *)objc_msgSend(v3, "getAddressPtr"));

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeObjectAtIndex:", 0);
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  return result;
}

void __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  HAP2AccessorySessionInfo *v6;
  _QWORD *v7;
  HAP2AccessorySessionInfo *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend((id)v1, "operationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertCurrentQueue");

    -[HAP2AccessoryServerTransportCoAP stateChangeCompletion]((_QWORD *)v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[HAP2AccessoryServerTransportCoAP stateChangeCompletion]((_QWORD *)v1);
      v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:]((_QWORD *)v1, 0);
      v6 = [HAP2AccessorySessionInfo alloc];
      v7 = -[HAP2AccessoryServerTransportCoAP numOfAddresses]((_QWORD *)v1);
      v8 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:](v6, "initWithNumIPs:numIPsTried:numBonjourNames:", v7, -[HAP2AccessoryServerTransportCoAP numOfAddressesTried]((_QWORD *)v1), objc_msgSend(*(id *)(v1 + 208), "count"));
      ((void (**)(_QWORD, _QWORD, HAP2AccessorySessionInfo *, id))v5)[2](v5, 0, v8, v2);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_QWORD *)(v1 + 136);
        v12 = 138412547;
        v13 = v1;
        v14 = 2113;
        v15 = v10;
        v11 = v9;
        _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%@ '%{private}@' - resolver failure has already been handled", (uint8_t *)&v12, 0x16u);

      }
    }
  }

}

- (void)_handleResolve:(uint64_t)a1
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  void *v14;
  _OWORD *v15;
  int v16;
  size_t v17;
  _OWORD *v18;
  int v19;
  void *v20;
  HAP2CoAPClient *v21;
  HAP2CoAPClient *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint8_t buf[4];
  _BYTE v31[28];
  __int16 v32;
  _QWORD *v33;
  __int16 v34;
  _QWORD *v35;
  __int16 v36;
  uint64_t v37;
  char __dst[54];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertCurrentQueue");

    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Open Client after Resolve"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v8);
    if (coap_print_addr((uint64_t)a2, __dst, 0x36uLL))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = (id)hap2Log_accessory;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(id *)(a1 + 136);
        v11 = -[HAP2AccessoryServerTransportCoAP numOfAddresses]((_QWORD *)a1);
        v12 = -[HAP2AccessoryServerTransportCoAP numOfAddressesTried]((_QWORD *)a1);
        v13 = *(id *)(a1 + 192);
        *(_DWORD *)buf = 138413571;
        *(_QWORD *)v31 = a1;
        *(_WORD *)&v31[8] = 2113;
        *(_QWORD *)&v31[10] = v10;
        *(_WORD *)&v31[18] = 2081;
        *(_QWORD *)&v31[20] = __dst;
        v32 = 2048;
        v33 = v11;
        v34 = 2048;
        v35 = v12;
        v36 = 2048;
        v37 = objc_msgSend(v13, "count");
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ Resolved '%{private}@' to %{private}s (discovered %lu, tried %lu with %lu names)", buf, 0x3Eu);

      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v14 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v27 = *(_QWORD *)(a1 + 136);
        *(_DWORD *)buf = 138412547;
        *(_QWORD *)v31 = a1;
        *(_WORD *)&v31[8] = 2113;
        *(_QWORD *)&v31[10] = v27;
        v28 = v14;
        _os_log_error_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%@ Resolved '%{private}@' but can't print the address...", buf, 0x16u);

      }
    }
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_DWORD *)(a1 + 224) = *a2;
    v15 = a2 + 1;
    v16 = *((unsigned __int8 *)a2 + 5);
    if (v16 == 2)
    {
      *(_OWORD *)(a1 + 228) = *v15;
    }
    else if (v16 == 30)
    {
      *(_BYTE *)(a1 + 229) = 30;
      *(_OWORD *)(a1 + 236) = *(_OWORD *)(a2 + 3);
      *(_WORD *)(a1 + 230) = *((_WORD *)a2 + 3);
      *(_DWORD *)(a1 + 252) = a2[7];
    }
    else
    {
      memcpy((void *)(a1 + 228), v15, *a2);
    }
    memset(v31, 0, sizeof(v31));
    v17 = *(unsigned int *)(a1 + 224);
    *(_DWORD *)buf = *(_DWORD *)(a1 + 224);
    v18 = (_OWORD *)(a1 + 228);
    v19 = *(unsigned __int8 *)(a1 + 229);
    if (v19 == 2)
    {
      *(_OWORD *)v31 = *v18;
    }
    else if (v19 == 30)
    {
      v31[1] = 30;
      *(_OWORD *)&v31[8] = *(_OWORD *)(a1 + 236);
      *(_WORD *)&v31[2] = *(_WORD *)(a1 + 230);
      *(_DWORD *)&v31[24] = *(_DWORD *)(a1 + 252);
    }
    else
    {
      memcpy(v31, v18, v17);
    }
    v20 = *(void **)(a1 + 184);
    if (v20)
    {
      objc_msgSend(v20, "createWithSocketAddress:", v31);
      v21 = (HAP2CoAPClient *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = [HAP2CoAPClient alloc];
      v23 = *(id *)(a1 + 136);
      objc_msgSend((id)a1, "operationQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "assertCurrentQueue");

      v25 = *(_QWORD *)(a1 + 96);
      objc_msgSend((id)a1, "operationQueue");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "assertCurrentQueue");

      v21 = -[HAP2CoAPClient initWithSocketAddress:withAccessoryName:maxTransmitAttempts:initialACKTimeout:](v22, "initWithSocketAddress:withAccessoryName:maxTransmitAttempts:initialACKTimeout:", v31, v23, v25, *(double *)(a1 + 104));
    }
    -[HAP2CoAPClient setDelegate:](v21, "setDelegate:", a1);
    -[HAP2AccessoryServerTransportCoAP setCoapClient:]((id *)a1, v21);

    -[HAP2AccessoryServerTransportCoAP _openClientWithActivity:]((void *)a1, v29);
    __HMFActivityScopeLeave();

  }
}

- (void)_openClientWithActivity:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  objc_msgSend(a1, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertCurrentQueue");

  -[HAP2AccessoryServerTransportCoAP coapClient]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke;
  v7[3] = &unk_1E894DB00;
  v7[4] = a1;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v5, "openWithCompletion:", v7);

}

void __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke_2;
  v10 = &unk_1E894E0F8;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17B7400](&v7);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue", v7, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConcurrentBlock:", v5);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void __60__HAP2AccessoryServerTransportCoAP__openClientWithActivity___block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  HAP2AccessorySessionInfo *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  HAP2AccessorySessionInfo *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServerTransportCoAP stateChangeCompletion](*(_QWORD **)(a1 + 32));
  v2 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerTransportCoAP setStateChangeCompletion:](*(_QWORD **)(a1 + 32), 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = hap2Log_accessory;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      v24 = 138412546;
      v25 = v22;
      v26 = 2112;
      v27 = v23;
      _os_log_error_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to open: %@", (uint8_t *)&v24, 0x16u);
    }
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(void **)(v5 + 192);
    else
      v6 = 0;
    if (!objc_msgSend(v6, "count"))
    {
      -[HAP2AccessoryServerTransportCoAP discovery](*(id **)(a1 + 32));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v8 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          v9 = *(_QWORD *)(a1 + 32);
          v24 = 138412290;
          v25 = v9;
          _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ Requesting discovery reconfirm after failing to open", (uint8_t *)&v24, 0xCu);
        }
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v11 = *(_QWORD *)(v10 + 168);
        else
          v11 = 0;
        objc_msgSend(v7, "reconfirmAccessory:", v11);
      }

    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v24 = 138412290;
    v25 = v12;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%@ Opened", (uint8_t *)&v24, 0xCu);
  }
  v13 = *(_QWORD **)(a1 + 32);
  if (v13)
    v13 = (_QWORD *)v13[24];
  v14 = v13;
  v15 = objc_msgSend(v14, "count");
  v16 = [HAP2AccessorySessionInfo alloc];
  v17 = -[HAP2AccessoryServerTransportCoAP numOfAddresses](*(_QWORD **)(a1 + 32));
  v18 = -[HAP2AccessoryServerTransportCoAP numOfAddressesTried](*(_QWORD **)(a1 + 32));
  v19 = *(_QWORD **)(a1 + 32);
  if (v19)
    v19 = (_QWORD *)v19[26];
  v20 = v19;
  v21 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:](v16, "initWithNumIPs:numIPsTried:numBonjourNames:", v17, v18, objc_msgSend(v20, "count"));
  ((void (**)(_QWORD, BOOL, HAP2AccessorySessionInfo *, _QWORD))v2)[2](v2, v15 != 0, v21, *(_QWORD *)(a1 + 40));

}

uint64_t __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(a2, "getAddressPtr");
  v6 = objc_msgSend(v4, "getAddressPtr");

  v7 = bswap64(*(_QWORD *)(v5 + 12));
  v8 = bswap64(*(_QWORD *)(v6 + 12));
  if (v7 == v8 && (v7 = bswap64(*(_QWORD *)(v5 + 20)), v8 = bswap64(*(_QWORD *)(v6 + 20)), v7 == v8))
  {
    return 0;
  }
  else if (v7 < v8)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

uint64_t __51__HAP2AccessoryServerTransportCoAP__resolveAddress__block_invoke()
{
  return nw_udp_options_set_no_metadata();
}

void __58__HAP2AccessoryServerTransportCoAP_mergeWithNewTransport___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[17];
  v3 = v2;
  if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40)))
  {
    v4 = *(_QWORD **)(a1 + 32);
    if (v4)
      v4 = (_QWORD *)v4[18];
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        v7 = *(void **)(v6 + 152);
      else
        v7 = 0;
      v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 56));

      if ((v8 & 1) != 0)
        return;
      goto LABEL_13;
    }

  }
LABEL_13:
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v9 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ Using new connection details: name = '%@' type = '%@' domain = '%@'", buf, 0x2Au);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    v16 = *(void **)(v15 + 208);
  else
    v16 = 0;
  objc_msgSend(v16, "removeObject:", v14);
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    v18 = *(void **)(v17 + 208);
  else
    v18 = 0;
  objc_msgSend(v18, "insertObject:atIndex:", v14, 0);
  v19 = *(_QWORD **)(a1 + 32);
  if (v19)
    v19 = (_QWORD *)v19[26];
  v20 = v19;
  v21 = objc_msgSend(v20, "count");
  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    v23 = *(_QWORD *)(v22 + 216);
  else
    v23 = 0;

  if (v21 > v23)
  {
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
      v25 = *(void **)(v24 + 208);
    else
      v25 = 0;
    objc_msgSend(v25, "removeLastObject");
  }

}

- (id)initWithServiceName:(void *)a3 type:(void *)a4 domain:(void *)a5 operationQueue:(void *)a6 discovery:(void *)a7 accessoryInfo:
{
  id v7;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  void *v23;

  v7 = a1;
  if (a1)
  {
    v13 = a7;
    v14 = a6;
    v15 = a5;
    v16 = a4;
    v17 = a3;
    v18 = a2;
    v19 = (const char *)HAPDispatchQueueName(v7, CFSTR("delegateQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create_with_target_V2(v19, v20, v21);

    v23 = (void *)objc_msgSend(v7, "initWithOperationQueue:delegateQueue:serviceName:serviceType:serviceDomain:addressResolutionTimeout:discovery:accessoryInfo:coapClient:coapClientFactory:", v15, v22, v18, v17, v16, v14, 3.0, v13, 0, 0);
    v7 = v23;

  }
  return v7;
}

@end
