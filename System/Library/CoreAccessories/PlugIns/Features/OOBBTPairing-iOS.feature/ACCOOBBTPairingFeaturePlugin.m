@implementation ACCOOBBTPairingFeaturePlugin

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCOOBBTPairingFeaturePlugin pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCOOBBTPairingFeaturePlugin isRunning](self, "isRunning");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isRunning: %s"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)initPlugin
{
  ACCiAP2ShimServer *iap2server;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  NSMutableDictionary *oobBtPairingAccessoryList;

  init_logging();
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  oobBtPairingProvider = self->_oobBtPairingProvider;
  self->_oobBtPairingProvider = 0;

  oobBtPairingAccessoryList = self->_oobBtPairingAccessoryList;
  self->_oobBtPairingAccessoryList = 0;

  -[ACCOOBBTPairingFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  objc_msgSend(MEMORY[0x24BE00DD0], "resetServerState");
}

- (void)startPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  ACCiAP2ShimServer *v8;
  ACCiAP2ShimServer *iap2server;
  NSObject *v10;
  id v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *oobBtPairingQueue;
  ACCOOBBTPairingProvider *v14;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  NSMutableDictionary *v16;
  NSMutableDictionary *oobBtPairingAccessoryList;
  ACCOOBBTPairingShim *v18;
  ACCOOBBTPairingShim *oobBtPairingShim;
  NSObject *v20;
  id v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21634E000, v5, OS_LOG_TYPE_DEFAULT, "Starting OOBBT Pairing feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_21634E000, v6, OS_LOG_TYPE_INFO, "Create/Get shared ACCiAP2ShimServer...", v24, 2u);
  }

  objc_msgSend(MEMORY[0x24BE00DD0], "sharedInstance");
  v8 = (ACCiAP2ShimServer *)objc_claimAutoreleasedReturnValue();
  iap2server = self->_iap2server;
  self->_iap2server = v8;

  -[ACCiAP2ShimServer startServer](self->_iap2server, "startServer");
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_21634E000, v10, OS_LOG_TYPE_INFO, "Create ACCOOBBTPairingProvider...", v23, 2u);
  }

  v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coreaccessories.plugin.oobBtPairing", 0);
  oobBtPairingQueue = self->_oobBtPairingQueue;
  self->_oobBtPairingQueue = v12;

  v14 = (ACCOOBBTPairingProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BE00DC0]), "initWithDelegate:", self);
  oobBtPairingProvider = self->_oobBtPairingProvider;
  self->_oobBtPairingProvider = v14;

  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  oobBtPairingAccessoryList = self->_oobBtPairingAccessoryList;
  self->_oobBtPairingAccessoryList = v16;

  v18 = -[ACCOOBBTPairingShim initWithDelegate:]([ACCOOBBTPairingShim alloc], "initWithDelegate:", self);
  oobBtPairingShim = self->_oobBtPairingShim;
  self->_oobBtPairingShim = v18;

  -[ACCiAP2ShimServer addDelegate:](self->_iap2server, "addDelegate:", self->_oobBtPairingShim);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_21634E000, v20, OS_LOG_TYPE_INFO, "Starting OOBBT Pairing feature plugin... finished, set isRunning", v22, 2u);
  }

  -[ACCOOBBTPairingFeaturePlugin setIsRunning:](self, "setIsRunning:", 1);
}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  ACCOOBBTPairingShim *oobBtPairingShim;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  OS_dispatch_queue *oobBtPairingQueue;
  NSMutableDictionary *oobBtPairingAccessoryList;
  ACCiAP2ShimServer *iap2server;
  NSObject *v11;
  id v12;
  uint8_t v13[16];
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21634E000, v5, OS_LOG_TYPE_DEFAULT, "Stopping OOBBT Pairing feature plugin...", buf, 2u);
  }

  -[ACCOOBBTPairingFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  -[ACCiAP2ShimServer removeDelegate:](self->_iap2server, "removeDelegate:", self->_oobBtPairingShim);
  oobBtPairingShim = self->_oobBtPairingShim;
  self->_oobBtPairingShim = 0;

  dispatch_sync((dispatch_queue_t)self->_oobBtPairingQueue, &__block_literal_global);
  oobBtPairingProvider = self->_oobBtPairingProvider;
  self->_oobBtPairingProvider = 0;

  oobBtPairingQueue = self->_oobBtPairingQueue;
  self->_oobBtPairingQueue = 0;

  oobBtPairingAccessoryList = self->_oobBtPairingAccessoryList;
  self->_oobBtPairingAccessoryList = 0;

  -[ACCiAP2ShimServer stopServer](self->_iap2server, "stopServer");
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21634E000, v11, OS_LOG_TYPE_INFO, "Stopping OBBT Pairing feature plugin... finished", v13, 2u);
  }

}

- (void)oobBtPairing:(id)a3 accessoryAttached:(id)a4 accInfoDict:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCOOBBTPairingShim *oobBtPairingShim;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCiAP2ShimServer *iap2server;
  NSObject *oobBtPairingQueue;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  ACCOOBBTPairingFeaturePlugin *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  ACCOOBBTPairingProvider *v29;
  __int16 v30;
  ACCOOBBTPairingShim *v31;
  __int16 v32;
  ACCiAP2ShimServer *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    oobBtPairingShim = self->_oobBtPairingShim;
    iap2server = self->_iap2server;
    oobBtPairingProvider = self->_oobBtPairingProvider;
    *(_DWORD *)buf = 138413314;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = oobBtPairingProvider;
    v30 = 2112;
    v31 = oobBtPairingShim;
    v32 = 2112;
    v33 = iap2server;
    _os_log_impl(&dword_21634E000, v13, OS_LOG_TYPE_INFO, "oobBtPairing: %@ accessoryAttached: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@ _iap2server=%@", buf, 0x34u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke;
  block[3] = &unk_24D52BFE8;
  v21 = v10;
  v22 = v9;
  v23 = self;
  v18 = v9;
  v19 = v10;
  dispatch_async(oobBtPairingQueue, block);

}

void __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ACCOOBBTPairingAccessory *v12;
  ACCOOBBTPairingAccessory *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  ACCOOBBTPairingAccessory *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  ACCOOBBTPairingAccessory *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  ACCOOBBTPairingAccessory *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D80]);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D78]);
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D88]);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D90]);
  v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D68]);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D70]);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00DB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", MEMORY[0x24BE00DE0], 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", MEMORY[0x24BE00DE8], 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D98]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x24BE00D60]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (ACCOOBBTPairingAccessory *)objc_msgSend(objc_alloc(MEMORY[0x24BE00DC8]), "initWithUID:keyTag:features:", *(_QWORD *)(a1 + 40), CFSTR("OOBBTPairing"), 0);
  v13 = v12;
  if (v3)
    v14 = v3;
  else
    v14 = &stru_24D52C178;
  -[ACCOOBBTPairingAccessory setName:](v12, "setName:", v14);
  if (v2)
    v15 = v2;
  else
    v15 = &stru_24D52C178;
  -[ACCOOBBTPairingAccessory setModel:](v13, "setModel:", v15);
  if (v36)
    v16 = v36;
  else
    v16 = &stru_24D52C178;
  -[ACCOOBBTPairingAccessory setManufacturer:](v13, "setManufacturer:", v16);
  if (v35)
    v17 = v35;
  else
    v17 = &stru_24D52C178;
  -[ACCOOBBTPairingAccessory setSerialNumber:](v13, "setSerialNumber:", v17);
  if (v4)
    v18 = v4;
  else
    v18 = &stru_24D52C178;
  -[ACCOOBBTPairingAccessory setFirmwareVersion:](v13, "setFirmwareVersion:", v18);
  if (v5)
    v19 = v5;
  else
    v19 = &stru_24D52C178;
  -[ACCOOBBTPairingAccessory setHardwareVersion:](v13, "setHardwareVersion:", v19);
  if (v6)
    -[ACCOOBBTPairingAccessory setConnectionID:](v13, "setConnectionID:", objc_msgSend(v6, "unsignedLongValue"));
  -[ACCOOBBTPairingAccessory setDontPublish:](v13, "setDontPublish:", 1);
  if (objc_msgSend(v40, "BOOLValue"))
    v20 = 23;
  else
    v20 = 15;
  -[ACCOOBBTPairingAccessory addFeature:](v13, "addFeature:", v20);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v21 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v21 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke_cold_4(v13, v21);

  v23 = objc_alloc_init(ACCOOBBTPairingAccessory);
  -[ACCOOBBTPairingAccessory setCertData:](v23, "setCertData:", v39);
  v37 = (void *)v11;
  -[ACCOOBBTPairingAccessory setCertSerial:](v23, "setCertSerial:", v11);
  -[ACCOOBBTPairingAccessory setIap2ShimAccessory:](v23, "setIap2ShimAccessory:", v13);
  -[ACCOOBBTPairingAccessory setCarPlaySupported:](v23, "setCarPlaySupported:", objc_msgSend(v38, "charValue") != 0);
  -[ACCOOBBTPairingAccessory setOobPairing2Supported:](v23, "setOobPairing2Supported:", objc_msgSend(v40, "charValue") != 0);
  -[ACCOOBBTPairingAccessory setContext:](v13, "setContext:", v23);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "addAccessory:", v13);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 48) + 40) || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v25 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v25 = MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v27 = *(ACCOOBBTPairingAccessory **)(*(_QWORD *)(a1 + 48) + 40);
      *(_DWORD *)buf = 138412290;
      v42 = v27;
      _os_log_impl(&dword_21634E000, v25, OS_LOG_TYPE_INFO, "Invalid _oobBtPairingShim(%@)", buf, 0xCu);
    }

    if (!v6)
      goto LABEL_53;
LABEL_46:
    v28 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
    -[ACCOOBBTPairingAccessory connectionIDObj](v13, "connectionIDObj");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v23, v29);

    goto LABEL_62;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v24 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v24 = MEMORY[0x24BDACB70];
    v30 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "accessoryInfoDictionaryForLogging:", *(_QWORD *)(a1 + 32));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v23;
    v43 = 2112;
    v44 = v34;
    _os_log_debug_impl(&dword_21634E000, v24, OS_LOG_TYPE_DEBUG, "accessoryAttached: call shim accessoryAttached: oobBtAccessory=%@ accInfoDict=%@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "accessoryAttached:accInfoDict:", v23, *(_QWORD *)(a1 + 32));
  if (v6)
    goto LABEL_46;
LABEL_53:
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v31 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v31 = MEMORY[0x24BDACB70];
    v32 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "accessoryInfoDictionaryForLogging:", *(_QWORD *)(a1 + 32));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v13;
    v43 = 2112;
    v44 = v33;
    _os_log_impl(&dword_21634E000, v31, OS_LOG_TYPE_INFO, "accessoryAttached: missing connectionID request and wait, accessory=%@ accInfoDict=%@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "requestLegacyConnectionIDForAccessoryUID:", *(_QWORD *)(a1 + 40));
LABEL_62:

}

- (void)oobBtPairing:(id)a3 accessoryDetached:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  ACCOOBBTPairingShim *oobBtPairingShim;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCiAP2ShimServer *iap2server;
  NSObject *oobBtPairingQueue;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  ACCOOBBTPairingProvider *v23;
  __int16 v24;
  ACCOOBBTPairingShim *v25;
  __int16 v26;
  ACCiAP2ShimServer *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    oobBtPairingShim = self->_oobBtPairingShim;
    iap2server = self->_iap2server;
    oobBtPairingProvider = self->_oobBtPairingProvider;
    *(_DWORD *)buf = 138413314;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = oobBtPairingProvider;
    v24 = 2112;
    v25 = oobBtPairingShim;
    v26 = 2112;
    v27 = iap2server;
    _os_log_impl(&dword_21634E000, v10, OS_LOG_TYPE_INFO, "oobBtPairing: %@ accessoryDetached: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@ _iap2server=%@", buf, 0x34u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryDetached___block_invoke;
  v16[3] = &unk_24D52C010;
  v16[4] = self;
  v17 = v7;
  v15 = v7;
  dispatch_async(oobBtPairingQueue, v16);

}

void __63__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryDetached___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), CFSTR("OOBBTPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAccessory:", v2);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v2, "connectionID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "accessoryDetached:", v5);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v2, "connectionIDObj");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
  else
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v5 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v11 = 138412546;
      v12 = v2;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_21634E000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or _oobBtPairingShim(%@)", (uint8_t *)&v11, 0x16u);
    }
  }

}

- (void)oobBtPairing:(id)a3 accessoryInfo:(id)a4 oobBtPairingUID:(id)a5 accessoryMacAddr:(id)a6 deviceClass:(unsigned int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCOOBBTPairingShim *oobBtPairingShim;
  NSObject *oobBtPairingQueue;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  unsigned int v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  ACCOOBBTPairingProvider *v41;
  __int16 v42;
  ACCOOBBTPairingShim *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138413826;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v15;
    v38 = 1024;
    v39 = a7;
    v40 = 2112;
    v41 = oobBtPairingProvider;
    v42 = 2112;
    v43 = oobBtPairingShim;
    _os_log_impl(&dword_21634E000, v18, OS_LOG_TYPE_INFO, "oobBtPairing: %@ accessoryInfo: %@ oobBtPairingUID: %@ accessoryMacAddr:%@ deviceClass: %d, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x44u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryInfo_oobBtPairingUID_accessoryMacAddr_deviceClass___block_invoke;
  block[3] = &unk_24D52C038;
  block[4] = self;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = a7;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  dispatch_async(oobBtPairingQueue, block);

}

void __104__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryInfo_oobBtPairingUID_accessoryMacAddr_deviceClass___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), CFSTR("OOBBTPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
      {
        v7 = v2;
        v3 = objc_opt_respondsToSelector();
        v2 = v7;
        if ((v3 & 1) != 0)
        {
          v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
          objc_msgSend(v7, "connectionIDObj");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
          v2 = v7;
        }
      }
    }
  }

}

- (void)oobBtPairing:(id)a3 completion:(id)a4 oobBtPairingUID:(id)a5 accessoryMacAddr:(id)a6 result:(unsigned __int8)a7
{
  int v7;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCOOBBTPairingShim *oobBtPairingShim;
  NSObject *oobBtPairingQueue;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  __int16 v40;
  ACCOOBBTPairingProvider *v41;
  __int16 v42;
  ACCOOBBTPairingShim *v43;
  uint64_t v44;

  v7 = a7;
  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138413826;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v15;
    v38 = 1024;
    v39 = v7;
    v40 = 2112;
    v41 = oobBtPairingProvider;
    v42 = 2112;
    v43 = oobBtPairingShim;
    _os_log_impl(&dword_21634E000, v18, OS_LOG_TYPE_INFO, "oobBtPairing: %@ completion: %@ oobBtPairingUID: %@ accessoryMacAddr: %@ result: %d, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x44u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__ACCOOBBTPairingFeaturePlugin_oobBtPairing_completion_oobBtPairingUID_accessoryMacAddr_result___block_invoke;
  block[3] = &unk_24D52C060;
  block[4] = self;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v7;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  dispatch_async(oobBtPairingQueue, block);

}

void __96__ACCOOBBTPairingFeaturePlugin_oobBtPairing_completion_oobBtPairingUID_accessoryMacAddr_result___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), CFSTR("OOBBTPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
      {
        v12 = v2;
        v3 = objc_opt_respondsToSelector();
        v2 = v12;
        if ((v3 & 1) != 0)
        {
          v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
          objc_msgSend(v12, "connectionIDObj");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = *(_QWORD *)(a1 + 32);
          v8 = *(void **)(v7 + 40);
          v10 = *(_QWORD *)(a1 + 48);
          v9 = *(_QWORD *)(a1 + 56);
          if (v9)
          {
            objc_msgSend(*(id *)(v7 + 40), "accessoryPairingCompletion:oobBtPairingUID:accessoryMacAddr:sendStop:result:", v6, *(_QWORD *)(a1 + 48), v9, 0, *(unsigned __int8 *)(a1 + 64));
          }
          else
          {
            objc_msgSend(v6, "currentRemoteMACAddress");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "accessoryPairingCompletion:oobBtPairingUID:accessoryMacAddr:sendStop:result:", v6, v10, v11, *(_QWORD *)(a1 + 56) == 0, *(unsigned __int8 *)(a1 + 64));

          }
          v2 = v12;
        }
      }
    }
  }

}

- (void)oobBtPairing:(id)a3 legacyConnectionIDForAccessoryUID:(id)a4 connectionID:(unsigned int)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCOOBBTPairingShim *oobBtPairingShim;
  NSObject *oobBtPairingQueue;
  id v16;
  _QWORD block[5];
  id v18;
  unsigned int v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  ACCOOBBTPairingProvider *v27;
  __int16 v28;
  ACCOOBBTPairingShim *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138413314;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 1024;
    v25 = a5;
    v26 = 2112;
    v27 = oobBtPairingProvider;
    v28 = 2112;
    v29 = oobBtPairingShim;
    _os_log_impl(&dword_21634E000, v12, OS_LOG_TYPE_INFO, "oobBtPairing: %@ legacyConnectionIDForAccessoryUID: %@ connectionID: %u, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x30u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__ACCOOBBTPairingFeaturePlugin_oobBtPairing_legacyConnectionIDForAccessoryUID_connectionID___block_invoke;
  block[3] = &unk_24D52C088;
  block[4] = self;
  v18 = v9;
  v19 = a5;
  v16 = v9;
  dispatch_async(oobBtPairingQueue, block);

}

void __92__ACCOOBBTPairingFeaturePlugin_oobBtPairing_legacyConnectionIDForAccessoryUID_connectionID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), CFSTR("OOBBTPairing"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v7, "connectionID"))
    {
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(v7, "connectionIDObj");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "removeObjectForKey:", v3);

    }
    objc_msgSend(v7, "setConnectionID:", *(unsigned int *)(a1 + 48));
    if (objc_msgSend(v7, "connectionID"))
    {
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      objc_msgSend(v7, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "connectionIDObj");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
  }

}

- (id)oobBtAccessoryForConnectionID:(unsigned int)a3
{
  NSObject *oobBtPairingQueue;
  id v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  oobBtPairingQueue = self->_oobBtPairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ACCOOBBTPairingFeaturePlugin_oobBtAccessoryForConnectionID___block_invoke;
  block[3] = &unk_24D52C0B0;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(oobBtPairingQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __62__ACCOOBBTPairingFeaturePlugin_oobBtAccessoryForConnectionID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)startOOBBTPairing:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCOOBBTPairingShim *oobBtPairingShim;
  NSObject *oobBtPairingQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  ACCOOBBTPairingProvider *v17;
  __int16 v18;
  ACCOOBBTPairingShim *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = oobBtPairingProvider;
    v18 = 2112;
    v19 = oobBtPairingShim;
    _os_log_impl(&dword_21634E000, v7, OS_LOG_TYPE_INFO, "oobBtPairing startOOBBTPairing: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x20u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__ACCOOBBTPairingFeaturePlugin_startOOBBTPairing___block_invoke;
  v12[3] = &unk_24D52C010;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(oobBtPairingQueue, v12);

}

void __50__ACCOOBBTPairingFeaturePlugin_startOOBBTPairing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startOOBBTPairing:", v3);

  }
  else
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 1;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessoryUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_21634E000, v6, OS_LOG_TYPE_DEFAULT, "oobBtPairing startOOBBTPairing: %@, skip processing, _oobBtPairingProvider(%@) nil", buf, 0x16u);

    }
  }
}

- (void)linkKey:(id)a3 deviceMacAddr:(id)a4 accessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCOOBBTPairingShim *oobBtPairingShim;
  NSObject *oobBtPairingQueue;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  ACCOOBBTPairingProvider *v32;
  __int16 v33;
  ACCOOBBTPairingShim *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(v8, "length");
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 134219010;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = oobBtPairingProvider;
    v33 = 2112;
    v34 = oobBtPairingShim;
    _os_log_impl(&dword_21634E000, v13, OS_LOG_TYPE_INFO, "oobBtPairing linkKey: (len=%lu) deviceMacAddr: %@ accessory: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x34u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __64__ACCOOBBTPairingFeaturePlugin_linkKey_deviceMacAddr_accessory___block_invoke;
  v21[3] = &unk_24D52C0D8;
  v21[4] = self;
  v22 = v10;
  v23 = v8;
  v24 = v9;
  v18 = v9;
  v19 = v8;
  v20 = v10;
  dispatch_async(oobBtPairingQueue, v21);

}

void __64__ACCOOBBTPairingFeaturePlugin_linkKey_deviceMacAddr_accessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentOOBBTPairingUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "linkKeyInfo:oobBtPairingUID:linkKey:deviceMacAddr:", v3, v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    if (gLogObjects)
      v5 = gNumLogObjects < 1;
    else
      v5 = 1;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 48), "length");
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 134218754;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_21634E000, v7, OS_LOG_TYPE_DEFAULT, "oobBtPairing linkKey: (len=%lu) deviceMacAddr: %@ accessory: %@, skip processing, _oobBtPairingProvider(%@) nil", buf, 0x2Au);
    }

  }
}

- (void)stopOOBBTPairing:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCOOBBTPairingProvider *oobBtPairingProvider;
  ACCOOBBTPairingShim *oobBtPairingShim;
  NSObject *oobBtPairingQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  ACCOOBBTPairingProvider *v17;
  __int16 v18;
  ACCOOBBTPairingShim *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    oobBtPairingProvider = self->_oobBtPairingProvider;
    oobBtPairingShim = self->_oobBtPairingShim;
    *(_DWORD *)buf = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = oobBtPairingProvider;
    v18 = 2112;
    v19 = oobBtPairingShim;
    _os_log_impl(&dword_21634E000, v7, OS_LOG_TYPE_INFO, "oobBtPairing stopOOBBTPairing: %@, _oobBtPairingProvider=%@ _oobBtPairingShim=%@", buf, 0x20u);
  }

  oobBtPairingQueue = self->_oobBtPairingQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__ACCOOBBTPairingFeaturePlugin_stopOOBBTPairing___block_invoke;
  v12[3] = &unk_24D52C010;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(oobBtPairingQueue, v12);

}

void __49__ACCOOBBTPairingFeaturePlugin_stopOOBBTPairing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopOOBBTPairing:", v3);

  }
  else
  {
    if (gLogObjects)
      v4 = gNumLogObjects < 1;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_21634E000, v6, OS_LOG_TYPE_DEFAULT, "oobBtPairing stopOOBBTPairing: %@, skip processing, _oobBtPairingProvider(%@) nil", buf, 0x16u);
    }

  }
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCiAP2ShimServer)iap2server
{
  return self->_iap2server;
}

- (void)setIap2server:(id)a3
{
  objc_storeStrong((id *)&self->_iap2server, a3);
}

- (ACCOOBBTPairingProvider)oobBtPairingProvider
{
  return self->_oobBtPairingProvider;
}

- (void)setOobBtPairingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_oobBtPairingProvider, a3);
}

- (OS_dispatch_queue)oobBtPairingQueue
{
  return self->_oobBtPairingQueue;
}

- (void)setOobBtPairingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_oobBtPairingQueue, a3);
}

- (ACCOOBBTPairingShim)oobBtPairingShim
{
  return self->_oobBtPairingShim;
}

- (void)setOobBtPairingShim:(id)a3
{
  objc_storeStrong((id *)&self->_oobBtPairingShim, a3);
}

- (NSMutableDictionary)oobBtPairingAccessoryList
{
  return self->_oobBtPairingAccessoryList;
}

- (void)setOobBtPairingAccessoryList:(id)a3
{
  objc_storeStrong((id *)&self->_oobBtPairingAccessoryList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobBtPairingAccessoryList, 0);
  objc_storeStrong((id *)&self->_oobBtPairingShim, 0);
  objc_storeStrong((id *)&self->_oobBtPairingQueue, 0);
  objc_storeStrong((id *)&self->_oobBtPairingProvider, 0);
  objc_storeStrong((id *)&self->_iap2server, 0);
}

void __75__ACCOOBBTPairingFeaturePlugin_oobBtPairing_accessoryAttached_accInfoDict___block_invoke_cold_4(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "connectionIDObj");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_21634E000, a2, OS_LOG_TYPE_DEBUG, "accessoryAttached: accessory=%@ connectionIDObj=%@", (uint8_t *)&v5, 0x16u);

}

@end
